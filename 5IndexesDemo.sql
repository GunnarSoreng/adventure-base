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