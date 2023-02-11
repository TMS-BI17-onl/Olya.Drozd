

 CREATE PROCEDURE updtable
 AS
 DECLARE @NationalIDNumber INT= 879341111, @BusinessEntityID INT=15
 UPDATE HumanResources.Employee 
 SET
 NationalIDNumber=@NationalIDNumber 
 WHERE  BusinessEntityID=@BusinessEntityID


EXECUTE updtable

