create table accounts(
    id serial primary key,
    name varchar(20) not null,
    age int,
    balance int not null
);

insert into accounts values (1, 'Anna', 35, 32000),
                            (2, 'Nurlam', 25, 45000),
                            (3, 'Adam', 21, 35000),
                            (4, 'Mishel', 19, 65000),
                            (5, 'Dana', 27, 75000),
                            (6, 'Kirill', 22, 95000),
                            (7, 'Janibek', 24, 37000);

begin;
update accounts set balance = balance + 1000 where id=1;
update accounts set balance = balance - 20000 where id=2;
update accounts set balance = balance - 3000 where id=3;
rollback;

begin;
update accounts set balance = balance - 1500 where name = 'Kirill';
update accounts set balance = balance + 1500 where name = 'Adam';
rollback;

begin;
savepoint sp1;
delete from accounts where name = 'Dana';
rollback to sp1;
update accounts set  balance = 70000 where name = 'Dana';
commit;

begin;
update accounts set balance = balance - 3000 where id=3;
savepoint sp1;
update accounts set balance = balance + 1000 where id in (1,2);
rollback to sp1;
commit;

/*if User_1 do not commit the changes only User_2 will update table. Consequently all balances will increase by 1.1
/*User_1 will see balance of first User increased by 1.1

/*The same as in the previous part, as only User_2 will change data

/*All balances will be increased by 1.05 * 1.1