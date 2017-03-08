select FirstName "First name", 
       LastName "Last name", 
	   PhoneNumber "Phone",
	   EmailAddress "Email"
from   Person.Person pp ,
       Person.PersonPhone ppp,
	   Person.EmailAddress pea 
where  pp.BusinessEntityID = ppp.BusinessEntityID and
       pp.BusinessEntityID = pea.BusinessEntityID
order by 2,1,4;


select count(distinct firstname) from Person.Person;

CREATE VIEW vw_NameInfo
AS
select FirstName, 
       LastName, 
	   PhoneNumber,
	   EmailAddress
from   Person.Person pp ,
       Person.PersonPhone ppp,
	   Person.EmailAddress pea 
where  pp.BusinessEntityID = ppp.BusinessEntityID and
       pp.BusinessEntityID = pea.BusinessEntityID and
	   EmailAddress = 'jessica59@adventure-works.com';

-- jessica59@adventure-works.com



drop view vw_NameInfo;

select * from vw_NameInfo;

CREATE VIEW vw_NameInfo
AS
select FirstName, 
       LastName, 
	   PhoneNumber,
	   EmailAddress
from   Person.Person pp ,
       Person.PersonPhone ppp,
	   Person.EmailAddress pea 
where  pp.BusinessEntityID = ppp.BusinessEntityID and
       pp.BusinessEntityID = pea.BusinessEntityID;


select * from vw_NameInfo;

select top 50 * from vw_NameInfo;

-- Pseudocode Examples from presentation:

--update savings 
--set Balance += 500
--where AccountID = 3;

--update checking 
--set Balance -= 500
--where AccountID = 3;

--Or create a stored procedure:

--create procedure transferFunds --Must be a two-part name
--AS
--begin transaction
--update savings 
--set Balance += 500
--where AccountID = 3;
--update checking 
--set Balance -= 500
--where AccountID = 3;
-- if it works ok:
--commit transaction
-- or if some errors occur:
--rollback transaction


-- Testing count and group by:

select FirstName, LastName
from Person.Person
where LastName IN ('Carreras','Gee','Harris','Gates','Harrington');


select LastName "Last Name", count(LastName) "Number"
from Person.Person
where LastName IN ('Carreras','Gee','Harris','Gates','Harrington')
group by LastName
order by 2 desc;


select LastName "Last Name", count(LastName) "Number"
from Person.Person
group by LastName
order by 2 desc;

select top 25 LastName "Last Name", count(LastName) "Number"
from Person.Person
group by LastName
order by 2 desc;

select FirstName, LastName
from Person.Person
where LastName = 'Diaz'
order by 1;


-- Testing nested selects
Select personName.FullName "Name", COUNT(personName.FullName) "Number"
FROM 
	(select FirstName + ' ' + LastName as Fullname
	 from Person.Person
	 where LastName = 'Diaz') personName
Group by personName.Fullname
order by 2 desc, 1 asc
;


--
--     XML
--

-- Generate XML from query
Select top 10 personName.FullName "Name", COUNT(personName.FullName) "Number"
FROM 
	(select FirstName + ' ' + LastName as Fullname
	 from Person.Person
	 where LastName = 'Diaz') personName
Group by personName.Fullname
order by 2 desc, 1 asc
for XML AUTO, ROOT('Person');
;

-- Read in XML from a variable 'idoc'
-- start assigning xml objects to new columns after traversing from ROOT to Customer node
SELECT * 
FROM OPENXML (@idoc, 'ROOT/Customer',1)
WITH (CustomerID varchar(10), ContactName varchar(20));



--
--    JSON
--

-- Create JSON from query
-- Only works with SQL Server 2016 or later!!!
--
Select top 10 personName.FullName "Name", COUNT(personName.FullName) "Number"
FROM 
	(select FirstName + ' ' + LastName as Fullname
	 from Person.Person
	 where LastName = 'Diaz') personName
Group by personName.Fullname
order by 2 desc, 1 asc
for JSON AUTO;


select FirstName, LastName
from Person.Person
where LastName = 'Diaz'
FOR JSON AUTO;


-- In PATH mode, you can use the dot syntax – for example, 'Item.Price' – to format nested output. 
-- Use the ROOT option to specify a named root element.
SELECT TOP 20
   SalesOrderNumber AS 'Order.Number',
   OrderDate as 'Order.Date'
FROM Sales.SalesOrderHeader
--FOR JSON PATH
;

-- Read JSON from variable @json
declare @json nvarchar(255)
set @json =
N'[ null, "string", 1, true]';
select * FROM OPENJSON( @json );

