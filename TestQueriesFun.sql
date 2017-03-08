select LastName "Last Name", count(LastName) "Number"
from Person.Person
group by LastName
order by 2 desc;


CREATE VIEW vw_ContactInfo
AS
select 
	pp.FirstName, 
	pp.LastName,
	pa.AddressLine1 "Address",
	pa.City "City",
	psp.Name "State",
	pcr.Name "Country",
	ppp.PhoneNumber "Phone",
	pe.EmailAddress "Email"
from 
	Person.Person pp,
	Person.Address pa,
	Person.EmailAddress pe,
	Person.PersonPhone ppp,
	Person.BusinessEntityAddress pbea,
	Person.StateProvince psp,
	Person.CountryRegion pcr
where 
	pp.BusinessEntityID = pe.BusinessEntityID and
	pp.BusinessEntityID = pbea.BusinessEntityID and
	pp.BusinessEntityID = ppp.BusinessEntityID and
	pbea.AddressID = pa.AddressID and
	pa.StateProvinceID = psp.StateProvinceID and
	psp.CountryRegionCode = pcr.CountryRegionCode
;


select * 
from 
	vw_ContactInfo
where
	LastName = 'Diaz' and 
	FirstName = 'Cameron';

select 
	* 
from 
	vw_ContactInfo
where
	State = 'Oregon';


select 
	* 
from 
	vw_ContactInfo
where
	Country = 'Canada';