USE AdventureWorks2012;
GO

DROP VIEW vw_ContactInfo;
GO

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
GO


select * from sys.views where name = 'vw_ContactInfo';

-- -----------------------------------------------------

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

select
	*
from
	vw_ContactInfo v
where
v.State= 'California';


select
	*
from
	vw_ContactInfo v
where
v.City= 'Los Angeles';



Select State, COUNT(State)
from vw_ContactInfo
group by State
order by 2 desc;


Select Country, COUNT(Country) "# people"
from vw_ContactInfo
group by Country
order by 2 desc;

-- Show how many people from each state/province in each country:
Select State, Country, COUNT(State) "# people"
from vw_ContactInfo
group by Country, State
order by 2 asc,3 desc;


-- How many states in each country
Select Country, COUNT(distinct State) "# states/provinces"
from vw_ContactInfo
group by Country
order by 2 desc,1 asc;



-- Show all different cities in each country
Select distinct City,State,Country
from vw_ContactInfo
order by 3,2,1
;


-- Show most co-owned phone number
select top 25 vc.Phone,COUNT(vc.Phone)
from vw_ContactInfo vc
group by vc.Phone
order by 2 desc
;



select cont.FirstName + ' ' + cont.LastName "Seattle customer"
from vw_ContactInfo cont
where cont.City='Seattle'
order by cont.LastName,cont.FirstName
;
