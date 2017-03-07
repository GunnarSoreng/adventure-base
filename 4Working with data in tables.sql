-- Working with data in tables
--
-- CRUD
--
-- Create                Insert
-- Read                  Select
-- Update                Update
-- Delete                Delete


-- Demo is missing from course?



-- Introducing Views and Procedures

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