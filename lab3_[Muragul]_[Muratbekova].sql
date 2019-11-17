create database lab3;

create table countries (
    country_id serial primary key,
    country_name text,
    region_id int,
    capital_name text,
    population int
);

insert into countries values (1,'Kazakhstan',2,'Astana',50);

insert into countries (country_id, country_name) values (2,'Russia');

update countries set region_id=NULL where region_id is not null;

insert into countries values (default, 'Korea', 3, 'Seoul', 200), (default, 'Georgia', 4, 'Tbilisi', 100);

alter table countries
alter column country_name set default 'Kazakhstan';

alter table countries
alter column capital_name set default 'Nursultan';

update countries set country_name = default where country_id=2;

insert into countries default values;

create table countries_new (like countries);

insert into countries_new
select * from countries;

update countries_new set region_id = 1 where region_id  is null;

update countries_new set population=population*1.15
returning country_name, population as New_population;

delete from countries_new where population<100 and country_name like 'K%';

delete from countries_new using countries
where countries.country_id = countries_new.country_id
returning *;

delete from countries returning *;