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