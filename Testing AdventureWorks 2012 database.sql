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