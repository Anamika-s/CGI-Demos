Select * from emp


insert into emp values(7,'Ajay', 'Chenna1', 28000, 'HR','12/12/2022',1,null)
insert into emp values(8,'Vijay', 'A 92 ,N Delhi', 24200, 'Sales','12/12/2022',1,null)
insert into emp values(9,'Jay', 'AD 95 Delhi', 29000, 'Sales','12/12/2022',1, null)
insert into emp values(10,'Deepak', 'ZZ/91, Calcutta', 24000, 'IT','12/12/2022',1,null)
insert into emp values(11, 'Rishi', 'AP-98, Delhi', 21000, 'IT','12/12/2022',1, null)
insert into emp values(12,'Pranit', 'A908, Mumbai', 35000, 'HR','12/12/2022',1,null)

create view HRView 
As
select * from emp where Dept = 'HR'
 
select * from HRView


create view SalesView 
As
select * from emp where Dept = 'Sales'

Select * from SalesView


alter view SalView 
As
select * from emp where salary between 25000 and 38000
with check option

select * from SalView

insert into SalView values(16,'Pranit', 'A98231, Mumbai', 23000, 'HR','12/12/2022',1,null)


-- Through this view , can we perform DML operations?
-- insert -- delete --update

insert into HRView values(13,'Pranit', 'A918, Mumbai', 32000, 'HR','12/12/2022',1,null)
delete from SalView where id=13
update HRView set name='Gagan preet' where id=12


