create database lab4;

create table Dormitory(
    room_number serial,
    block varchar(4),
    floor integer,
    capacity integer
);

create table Students(
    student_id varchar(6),
    student_name text,
    speciality varchar(12),
    penalty integer,
    room_number integer
);

insert into Dormitory (block, floor, capacity)
values ('A', 2, 2), ('B', 1, 2), ('C', 3, 2), ('D', 4, 2);

insert into Students values
('11', 'a11', 'IS', 1, 1), ('12', 'a12', 'IS', 5, 1),
('21', 'a21', 'AU', 2, 2), ('22', 'a22', 'AU', 6, 2),
('31', 'a31', 'VTIPO', 3, 3), ('32', 'a32', 'VTIPO', 7, 3),
('41', 'a41', 'IS', 4, 4), ('42', 'a42', 'IS', 8, 4);

select * from Dormitory;

select * from Students where penalty>3;

select student_name, room_number from Students
where student_name like '%a%' or student_name like '%A%';

select room_number, count(student_id) as students_count from Students
group by room_number
having count(student_id)>=2;

select room_number, count(student_id) as count from Students
group by room_number;

select room_number, count(student_id) as students_count from Students
group by room_number
having count(student_id)<3;

insert into Dormitory(block, floor, capacity)
values ('A', 2, 3);

insert into Students
values ('16BD67', 'Aidos', 'IT', 3, 3);

delete from Students using Dormitory
where Students.room_number = Dormitory.room_number
and penalty>4 and Dormitory.block between 'A' and 'C';

select room_number, count(student_id) as count from Students
where penalty>=2
group by room_number;

delete from Students
where room_number=2
returning *;

select Dormitory.room_number, count(Students.student_id) as count from Dormitory, Students
where Dormitory.room_number = Students.room_number and
block like 'A' and floor=2
group by Dormitory.room_number;