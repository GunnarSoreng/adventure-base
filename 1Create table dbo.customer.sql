-- This example uses the free example database 'AdventureWorks 2012' that can be downloaded.

-- Create a table
create table dbo.Customer
(CustomerID INTEGER IDENTITY PRIMARY KEY,
FirstName NVARCHAR(20) NOT NULL,
MiddleName NVARCHAR(20) NULL,
LastName NVARCHAR(20) NULL,
AccountOpened DATE DEFAULT GETDATE(),
CreditLimit DECIMAL(6,2) DEFAULT 1000.00
);
GO

-- Insert a row with values
INSERT INTO dbo.Customer
VALUES ('Dan', 'D', 'Drayton','01.01.2016',500.00);


-- Insert explicit NULLs and defaults
INSERT INTO dbo.Customer
VALUES
('Rodrigo', NULL, 'Romani',DEFAULT , DEFAULT);


-- Insert specific columns
INSERT INTO dbo.Customer (FirstName, LastName)
VALUES
('Naomi', 'Sharp');


-- Insert invalid data
INSERT INTO dbo.Customer
VALUES
(NULL,'S','Garner','01.01.2016',500);

-- Insert are NULL Credit Limits allowed?
INSERT INTO dbo.Customer
VALUES
('Sophia','S', 'Garner','01.01.2016',NULL);


-- Select the table
SELECT * from dbo.Customer;


-- Select specific columns
SELECT CustomerID, FirstName, LastName
FROM dbo.Customer


-- Select calculated columns
SELECT CustomerID,
       FirstName + '' + LastName AS Fullname,
	   DATEDIFF(dd, AccountOpened, GETDATE()) AS AccountDays
FROM dbo.Customer


-- Filter rows
SELECT CustomerID, FirstName, LastName , CreditLimit
FROM dbo.Customer
WHERE CreditLimit > 500;




