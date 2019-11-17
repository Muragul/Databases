create database lab5;

create table salesman(
    salesman_id int primary key,
    name text,
    city text,
    commission float
);

create table customers(
    customer_id int primary key,
    cust_name text,
    city text,
    grade int,
    salesman_id int references salesman(salesman_id)
);

create table orders(
    ord_no int unique,
    purch_amt float,
    ord_date date,
    customer_id int references customers(customer_id),
    salesman_id int references salesman(salesman_id)
);

insert into salesman values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', '', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

insert into customers values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5001),
(3001, 'Brad Guzan', 'London', NULL, 5001),
(3004, 'Fabian Johns', 'Paris', 300, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5001),
(3008, 'Julian Green', 'London', 300, 5001);

insert into orders values
(70001, 150.5, date '2012-10-05', 3005, 5002),
(70009, 270.65, date '2012-09-10', 3001, 5005),
(70002, 65.26, date '2012-10-05', 3002, 5001),
(70004, 110.5, date '2012-08-17', 3009, 5003),
(70007, 948.5, date '2012-09-10', 3005, 5002),
(70005, 2400.6, date '2012-07-27', 3007, 5001),
(70008, 5760, date '2012-09-10', 3002, 5001);

select sum(purch_amt) from orders;

select avg(purch_amt) from  orders;

select count(cust_name) from customers where cust_name is not null;

select min(purch_amt) from orders;

select * from customers where cust_name like '%b';

select ord_no, purch_amt, ord_date, orders.customer_id, orders.salesman_id from orders, customers where
orders.customer_id = customers.customer_id and
customers.city like 'New York';

select customers.customer_id, customers.cust_name, customers.city, customers.grade, customers.salesman_id
from customers, orders where
orders.customer_id = customers.customer_id and
purch_amt > 10;

select sum(grade) from customers;

select * from customers where cust_name is not null;

select max(grade) from customers;