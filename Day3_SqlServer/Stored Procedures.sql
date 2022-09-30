Select * from emp
Select * from emp where id=1
Select * from emp where id=2
delete from emp where id=20
GO

create proc GetEmployees
As
Begin
Select * from emp
End


exec GetEmployees


-- Proc has hard coded values
create procedure InsertEmployee
As
Begin
insert into emp values(17,'Snajana', 'Chenna12', 28000, 'HR','12/12/2022',1,null)
End




exec InsertEmployee


-- SP can take input parameters and they can also return
-- 1  using return statement , we an return 1 value and that too be in integer
-- 2 using output paramters , we can return more than 1 values
exec GetEmployees


alter procedure InsertEmployee (
@id int , 
@name varchar(20),
@address varchar(20), 
@salary int,
@dept varchar(20),
@doj datetime,
@isCertified bit,
@managerid int)
As
Begin
insert into emp(id, name, address, salary,dept, doj,isCertified,managerid) 
values(@id, @name, @address, @salary, @dept, @doj,@isCertified, @managerid)
End

-- Calling Part

exec insertEmployee 20,'Snajana', 'Chen1212na12222', 28000, 'HR','12/12/2022',1,null

-- declare variables
declare @id int
declare @dept varchar(20)
declare @name varchar(20)
declare @address varchar(20)
declare @doj datetime
declare @managerid int
declare @salary int
declare @isCertified bit

set @id = 11
set @name='aaaa'
Set @dept = 'Sales'
set @address='h23232jhjhj'
set @doj= '12/12/2022'
set @isCertified=0
set @managerid=2000
set @salary = 23000


exec InsertEmployee @id, @name, @address, @salary,@dept, @doj, @isCertified,@managerid

-- Check if id is already there ,, say record with id already exist,
-- otherwise insert the record
 -- we will return 0 id id is there  or else return 1
alter procedure InsertEmployee (
@id int , 
@name varchar(20),
@address varchar(20), 
@salary int,
@dept varchar(20),
@doj datetime,
@isCertified bit,
@managerid int)
As
Begin
	if(exists(select * from emp where id=@id))
		return 0
	else
		begin
			insert into emp(id, name, address, salary,dept, doj,isCertified,managerid) 
			values(@id, @name, @address, @salary, @dept, @doj,@isCertified, @managerid)
			return 1
		end
End
-- Calling Part
-- declare variables
declare @id int
declare @dept varchar(20)
declare @name varchar(20)
declare @address varchar(20)
declare @doj datetime
declare @managerid int
declare @salary int
declare @isCertified bit

set @id = 22
set @name='aaaa'
Set @dept = 'Sales'
set @address='h23232jhjhj'
set @doj= '12/12/2022'
set @isCertified=0
set @managerid=2000
set @salary = 23000

declare @flag int 
exec @flag = InsertEmployee @id, @name, @address, @salary,@dept, @doj, @isCertified,@managerid
if(@flag=0)
	print 'Record with ID already exist'
else 
	print 'Record is inserted'

-- output para > they are used when we have to return more than 1 values or  a string type of value
-- We wil provide ID , and you give me details of that employee

create proc GetEmployeeDetailsById(@id int,
@name varchar(20) output,
@address varchar(20) output, 
@salary int output,
@dept varchar(20) output,
@doj datetime output,
@isCertified bit output,
@managerid int output)
As 
Begin
  if(exists(Select * from Emp where id=@id))
		begin
			Select @name = name ,
			@address = address,
			@doj = doj,
			@salary = salary,
			@dept = dept,
			@isCertified = isCertified,
			@managerid = managerid
		from emp where id = @id
		return 1
		end
		 else 
		 return 0
		  
End

-- Calling Part

declare @id int
declare @dept varchar(20)
declare @name varchar(20)
declare @address varchar(20)
declare @doj datetime
declare @managerid int
declare @salary int
declare @isCertified bit

set @id = 1

declare @flag int 
exec @flag = GetEmployeeDetailsById @id, @name output, @address output, @salary output,
@dept output,
 @doj output, @isCertified output ,@managerid output
if(@flag=0)
	print 'Record with ID do not exist'
else 
	print 'Details are ' 
	print @name + ' ' +  @address 
