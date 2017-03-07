-- Foreign key constraint is used to enforce referential integrity.


select * from dbo.Customer;

select * from dbo.AccountManagers;

-- Add a column with a foreign key constraint
ALTER TABLE dbo.Customer ADD
AccountManager int NULL REFERENCES dbo.AccountManagers(EmployeeID);
GO

-- Set the existing customer account managers
UPDATE dbo.Customer
SET AccountManager = 1;


-- Add a new customer with an account manager
INSERT INTO dbo.Customer
VALUES
('Rhonda',NULL,'Hughes',DEFAULT,1000,2);

-- Add a new customer with a non-existing account manager
-- This fails
-- Foreign key = 9 is not found as an id in accountManagers table
INSERT INTO dbo.Customer
VALUES
('Arnold', NULL , 'Valenti',DEFAULT,100,9);