-- Create a table
CREATE TABLE dbo.AccountManagers
(EmployeeID INTEGER IDENTITY PRIMARY KEY,
 FirstName VARCHAR(20) NOT NULL,
 LastName NVARCHAR(29) NULL,
 DateOfBirth DATE NOT NULL,
 Salary DECIMAL(10,2) NOT NULL);
 GO

 -- VARCHAR  : ASCII code
 -- NVARCHAR : UNICODE with international characters


 INSERT INTO dbo.AccountManagers
 VALUES
 ('Lucas', 'Søndergaard','1971-03-07', 92000.00);


 INSERT INTO dbo.AccountManagers
 VALUES
 ('Rosie', 'Reeves','12/12/1988',85000);


 INSERT INTO dbo.AccountManagers
 VALUES
 ('Deanna',8411,'01.01.1970',75000.25);


 INSERT INTO dbo.AccountManagers
 VALUES('Aisha','Witt', '08.05.1970',$120000);


 -- This fails
 INSERT INTO dbo.AccountManagers
 VALUES
 ('Elwood','McGee','07.09.1976','$120000');


  INSERT INTO dbo.AccountManagers
 VALUES
 ('Elwood','McGee','09.07.1976','120000');


 -- This fails
 INSERT INTO dbo.AccountManagers
 VALUES
 ('Zachary', 'Fellows', '30/7/1978', 120000);


 SELECT * FROM dbo.AccountManagers;


 SELECT EmployeeID + Salary
 FROM dbo.AccountManagers;


 SELECT FirstName + LastName
 FROM dbo.AccountManagers;


-- This fails
 SELECT FirstName + Salary
 FROM dbo.AccountManagers;

-- This fails
 SELECT DateOfBirth + EmployeeID
 FROM dbo.AccountManagers;


 -- This fails
SELECT FirstName + DateOfBirth
 FROM dbo.AccountManagers;



