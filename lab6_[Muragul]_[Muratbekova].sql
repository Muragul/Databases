create database lab6;

create table employees(
    emp_id serial primary key,
    first_name varchar(20),
    last_name varchar(50),
    salary integer NOT NULL,
    begin_date date,
    end_date date,
    job_title varchar(50) DEFAULT ''
);

create table department(
    department_id serial primary key,
    emp_id integer references employees(emp_id),
    department_name varchar(5),
    email varchar(40) unique,
    phone_number char(12),
    hire_date timestamp,
    commission float
);

alter table employees
add constraint n2 check ( begin_date <= end_date and begin_date >= '2001-01-01' );

alter table employees
add constraint chk_salary check (salary > 60000);

alter table employees
add constraint n4 unique (last_name);

alter table employees
drop constraint chk_salary;

select conname from lab6.pg_catalog.pg_constraint where contype like 'f';

alter table department
add constraint n7 check ( department_name in ('FIT', 'BS', 'FEOG', 'FGGE') );

alter table employees
drop column emp_id cascade;

select first_name, last_name from employees
where char_length(first_name)<=5;

alter table employees
drop constraint n4;