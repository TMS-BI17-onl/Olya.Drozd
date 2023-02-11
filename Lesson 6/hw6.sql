

 CREATE PROCEDURE updtable
 @BusinessEntityID INT,
 @NationalIDNumber INT
 AS
 UPDATE HumanResources.Employee 
 SET
 NationalIDNumber=@NationalIDNumber 
 WHERE  BusinessEntityID=@BusinessEntityID


EXECUTE dbo.updtable
 @BusinessEntityID=15,
 @NationalIDNumber=879341111;

