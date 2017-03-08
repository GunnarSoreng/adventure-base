-- Introducing indexes

-- All this is pseudo code from slides:

-- A clustered index determines the order in which rows are stored
-- Can have ONE clustered index per table
-- A table without a clustered index is a HEAP
--create clustered index idx_ProductID
--on Sales.Product( ProductID);

-- A nonclustered index stores pointers to the row id of a heap, or the cluster key of a clustered index
--Can have multiple nonclustered indexes per table
--create nonclustered index idx_Name
--on Sales.Product ( Name);

select * from Sales.SalesOrderDetail;

-- Copy to a new table (Copies only data, no triggers, indexes, constraints etc):
select * 
into dbo.SalesOrderDetail
from Sales.SalesOrderDetail;

select * from dbo.SalesOrderDetail;

-- Set stats on so we can see how many pages are read
SET STATISTICS IO ON;

-- Show the actual execution plan

-- Get products and quantities for a specific order (no index)
SELECT ProductID, OrderQty
FROM dbo.SalesOrderDetail
WHERE SalesOrderID = 58125;
-- Logical reads: 1494

-- Create a clustered index
CREATE CLUSTERED INDEX idx_SalesOrderID
ON dbo.SalesOrderDetail(SalesOrderID);

-- Try the query again with index
SELECT ProductID, OrderQty
FROM dbo.SalesOrderDetail
WHERE SalesOrderID = 58125;
-- Logical reads: 3
-- Great savings using the index!


-- Get orders by product (uses the previously created clustered index, but not using it to search)
SELECT SalesOrderID
FROM dbo.SalesOrderDetail
WHERE ProductID = 758;
-- Logical reads: 1581

-- A Table can only have ONE clustered index,data can only be stored in one order.

-- Create nonclustered index
CREATE NONCLUSTERED INDEX idx_ProductID
ON dbo.SalesOrderDetail(ProductID);

-- Try the query again (using the nonclustered index)
SELECT SalesOrderID
FROM dbo.SalesOrderDetail
WHERE ProductID = 758;
-- Logical reads: 2

-- Include a non-indexed field
SELECT SalesOrderID, OrderQty
FROM dbo.SalesOrderDetail
WHERE ProductID = 758;
-- Logical reads: 828


--
--  COLUMNSTORE Indexes
--
-- Are stored in memory
-- Store data by column instead of by row
-- Use Compression to optimize memory usage and performance

-- Can be clustered or non-clustered
-- Clustered columnstore indexes include all columns
-- Only one clustered columnstore index per table


-- Need to create test tables
SELECT * from Production.Product;

SELECT * FROM Production.ProductInventory;

SELECT * 
INTO dbo.Product
from Production.Product;

SELECT * 
INTO dbo.ProductInventory
FROM Production.ProductInventory;

-- Query tables
SELECT * FROM dbo.Product;
SELECT * FROM dbo.ProductInventory;

-- Set stats on ( if not already done )
--SET STATISTICS IO ON;

-- Show actual execution plan (select button 'include Actual Execution Plan' in toolbar, <ctrl>+M )

-- Query tables
SELECT p.Name, p.ListPrice, i.Shelf, i.Bin, i.Quantity
FROM dbo.Product as p
JOIN dbo.ProductInventory AS i
ON p.ProductID = i.ProductID
WHERE p.Name = 'Rear Brakes';
-- Logical reads: ProductInventory -> 7, Product -> 13


-- Create columnstore index 
-- (are always created on the whole table)
CREATE CLUSTERED COLUMNSTORE INDEX idx_ProductInventory
on dbo.ProductInventory;
-- Output: "Msg 35338, Level 16, State 1, Line 1. Clustered columnstore index is not supported."

-- Stackexchange: "SQL Server 2012 only supports the creation of nonclustered indexes"!!
--
-- Use: CREATE NONCLUSTERED COLUMNSTORE INDEX
-- In SQL Server 2012 this will make your table read-only. You should probably look at 
-- adding all three columns of the table to the columnstore index but I'll leave that to your testing.
-- Note that columnstore indexes also require Enterprise Edition.
-- Using this instead, just to test it:
CREATE NONCLUSTERED COLUMNSTORE INDEX idx_ProductInventory
on dbo.ProductInventory(ProductID, Shelf, Bin, Quantity);


-- Query tables
SELECT p.Name, p.ListPrice, i.Shelf, i.Bin, i.Quantity
FROM dbo.Product as p
JOIN dbo.ProductInventory AS i
ON p.ProductID = i.ProductID
WHERE p.Name = 'Rear Brakes';

-- Create NonClustered ColumnStore index
CREATE NONCLUSTERED COLUMNSTORE INDEX idx_Product
ON dbo.Product (ProductID, Name, ListPrice);

-- Query tables
SELECT p.Name, p.ListPrice, i.Shelf, i.Bin, i.Quantity
FROM dbo.Product as p
JOIN dbo.ProductInventory AS i
ON p.ProductID = i.ProductID
WHERE p.Name = 'Rear Brakes';


