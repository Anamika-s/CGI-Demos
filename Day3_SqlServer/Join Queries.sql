create table batch (batchid int primary key identity,
batchname varchar(20) not null, capacity int not null check(capacity between 10 and 20), 
startdate datetime not null check (startdate >=getdate()), trainer varchar(20) not null,
courseid int references course(courseid))

create table course (courseid int primary key identity(2000,1),
coursename varchar(20) not null, description varchar(max))

alter table course add duration int not null

insert into course values 
('C#', 'This is basic course', 10),
('Dotnet', 'This is advanced course', 45),
('Sql Server', 'This is intermediate course', 10),
('MERN', 'This is basic course', 45),
('MERN Full Stack', 'This is advanced course', 30),
('MEAN Full Stack', 'This is basic course', 35)


select * from course

insert into batch(batchname, startdate, capacity, trainer, courseid) values

('B001', '12/12/2022', 12, 'Ajay Kumar', 2000),
('B002', '11/09/2022', 15, 'Lalita Gupta', 2001),
('B003', '12/12/2022', 12, 'Geetika Kumar', 2003),
('B004', '10/19/2022', 12, 'Sagar Kumar', 2002),
('B005', '10/22/2022', 12, 'Prtipal Singh', 2001)


select * from course
select * from batch

-- Give me coursename , course description and the batches in which that course is being taught
-- inner join > It gives matching records
select coursename , description , batchname , startdate , trainer 
from course join batch on course.courseid = batch.courseid 


select course.coursename , course.description , batch.batchname , batch.startdate , batch.trainer 
from course join batch on course.courseid = batch.courseid 

select a.coursename , a.description , b.batchname , b.startdate , b.trainer 
from course a join batch b on a.courseid = b.courseid 


-- outer join > gives you matching as well as non matching records
-- left outer join > will give you all records from table on left side plus records of non matching from the table on right side
select a.coursename , a.description , b.batchname , b.startdate , b.trainer 
from course a left outer join batch b on a.courseid = b.courseid 


-- right outer join > will give you all records from table on right side plus records of non matching from the table on left side
select a.coursename , a.description , b.batchname , b.startdate , b.trainer 
from course a right outer join batch b on a.courseid = b.courseid

select a.coursename , a.description , b.batchname , b.startdate , b.trainer 
from course a  full outer join batch b on a.courseid = b.courseid


-- self join > when a table joins with itself



create table emp (
id int primary key,
name varchar(20) not null,
address varchar(50) not null unique,
salary int check(salary between 20000 and 40000),
dept varchar(20) check (dept in ('HR','Sales','IT')),
doj datetime not null check (doj >= getdate()),
isCertified bit default 1)

insert into emp values(1,'Ajay', 'Delhi', 22000, 'Sales','12/12/2022',1)
insert into emp values(2,'Vijay', 'A 90 ,N Delhi', 22000, 'Sales','12/12/2022',1)
insert into emp values(3,'Jay', 'AD 90 Delhi', 22000, 'Sales','12/12/2022',1)
insert into emp values(4,'Deepak', 'ZZ/9, Delhi', 22000, 'Sales','12/12/2022',1)
insert into emp values(5,'Rishi', 'AP-09, Delhi', 22000, 'Sales','12/12/2022',1)
insert into emp values(6,'Pranit', 'A908, Delhi', 22000, 'Sales','12/12/2022',1)


select * from emp 


 alter table emp add managerid int 


 -- update 

  update emp set managerid=3 where id in (1,4,5)
 update emp set managerid=6 where id in (2,3)
update emp set managerid=1 where id in (6)
-- Display employee name & their manager name

select a.name As "Employee Name" , b.name as "Manager Name" 
from emp a join emp b 
on a.managerid = b.id


-- cross join , there is no need for tables to have a common column 
-- Product of multiple tables

select *from batch
select * from course


create table student(rn int primary key, name varchar(20))

insert into student values(1,'Ajay')
insert into student values(2,'Deepak')
insert into student values(3,'Deepak')

select * from course

select * from student

select a.* , b.* from student a cross join course b

select a.* , b.* into enroll from student a cross join course b

select * from enroll



