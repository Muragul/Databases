create database lab9;

create table salesman(
    salesman_id serial primary key ,
    name text,
    city text,
    commission float
);

insert into salesman values (5001, 'James Hoog', 'New York', 0.15),
                            (5002,'Nail Knite', 'Paris', 0.13),
                            (5005,'Pit Alex', 'London', 0.11),
                            (5006,'Mc Lyon', 'Paris', 0.14),
                            (5003,'Lauson Hen', '', 0.12),
                            (5007,'Paul Adam', 'Rome', 0.13);

create table customers (
    customer_id serial primary key,
    cust_name text,
    city text,
    grade int,
    salesman_id serial references salesman
);

insert into customers values (3002, 'Nick Rimando', 'New York', 100, 5001),
                             (3005, 'Graham Zusi', 'California', 200, 5002),
                             (3001, 'Brad Guzan', 'London', null, 5005),
                             (3004, 'Fabian Johns', 'Paris', 300, 5006),
                             (3007, 'Brad Davis', 'New York', 200, 5001),
                             (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                             (3008, 'Julian Green', 'London', 300, 5002);

create table orders (
    ord_no serial,
    purch_amt float,
    ord_date date,
    customer_id serial references customers,
    salesman_id serial references salesman
);

insert into orders values (70001, 150.5, '2012-10-05', 3005, 5002),
                          (70009, 270.65, '2012-09-10', 3001, 5005),
                          (70002, 65.26, '2012-10-05', 3002, 5001),
                          (70004, 110.5, '2012-08-17', 3009, 5003),
                          (70007, 948.5, '2012-09-10', 3005, 5002),
                          (70005, 2400.6, '2012-07-27', 3007, 5001),
                          (70008, 5760, '2012-09-10', 3002, 5001);

create user junior_dev password 'string';

create view task4 as
    select salesman.name, avg(orders.purch_amt) as average, sum(orders.purch_amt) as all
    from salesman left join orders on salesman.salesman_id = orders.salesman_id group by salesman.name;

create view task5 as
    select count(orders.ord_no), city
    from orders full join customers on orders.customer_id = customers.customer_id group by city;
grant all privileges on task5 to junior_dev;

create view task6 as
    select cust_name as min from customers where grade = (select min(grade) from customers);
grant select on task6 to junior_dev;

create view task7 as
    select count(salesman.salesman_id), grade
    from customers left join salesman on customers.salesman_id = salesman.salesman_id
    group by grade;

create view task8 as
select salesman.name, count(ord_no)
from salesman left join orders on salesman.salesman_id = orders.salesman_id
group by salesman.salesman_id having count(ord_no)>1;

create role intern;
grant junior_dev to intern;