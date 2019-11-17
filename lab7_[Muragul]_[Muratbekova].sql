create database lab7;

create table locations (
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments (
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

create table employees (
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    manager_id integer references employees,
    department_id integer references departments,
    grade char(1) references job_grades
);

create table job_grades (
    grade char(1) primary key,
    lowest_salary integer,
    highest_salary integer
);

select first_name, last_name, department_id, city, state_province from
(employees left join departments using (department_id)) left join locations using (location_id)
where last_name='%b%';

select department_name, city, state_province from departments left join locations using (location_id);

select employees.first_name, m.first_name from
employees left outer join employees m on employees.manager_id = m.employee_id;

select grade, avg(salary) from job_grades cross join employees
group by grade;

select first_name, last_name from
(employees left join departments using (department_id)) left join locations using (location_id)
where city='London';

select * from employees left join departments using (department_id) where department_id in (
select count(employee_id) from employees left join departments using (department_id) group by department_id
order by count(employee_id) DESC limit 1) and manager_id is null;

select * from
((departments full join locations using (location_id))full join employees using (department_id)) full join job_grades using (grade)
where city = 'London' and salary in (select avg(highest_salary+lowest_salary) from employees left join job_grades using (grade));

select first_name, last_name from (employees left join departments using (department_id))
where grade in (select max (grade) from job_grades) and budget > (select avg(budget) from departments);