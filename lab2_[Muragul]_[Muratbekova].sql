create database todolist;

create table schedule (
    id serial,
    name varchar(50),
    start_datetime timestamp,
    end_datetime timestamp,
    is_finished boolean,
    description text
);

alter table schedule
add column created_at timestamp;

alter table schedule
alter column name type varchar(100);

alter table schedule
alter column is_finished set default false;

alter table schedule
add primary key (id);

create table tasks (
    id serial,
    name varchar(50),
    description text,
    priority smallint,
    project_id int references schedule(id)
);

drop table schedule restrict;

drop table schedule cascade;

drop database todolist;