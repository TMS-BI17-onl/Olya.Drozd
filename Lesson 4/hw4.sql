-- task 3
-- when values are unique


--task 4a

SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE'T%'-- are not

SELECT COUNT (DISTINCT(UnitMeasureCode)) AS 'NUMBER'
FROM Production.UnitMeasure -- 38 


 INSERT INTO Production.UnitMeasure
 VALUES ('TT1','Test 1','2020-09-09')
        ,('TT2','Test 2', GETDATE()); 

-- task 4 b


 SELECT * 
 INTO Production.UnitMeasureTest 
 FROM Production.UnitMeasure
 WHERE UnitMeasureCode LIKE'T%'

 INSERT INTO Production.UnitMeasureTest
 SELECT * FROM Production.UnitMeasure
 WHERE  UnitMeasureCode='CAN'
 
 SELECT *
 FROM Production.UnitMeasureTest
 ORDER BY UnitMeasureCode
 
 --task 4c
 
 UPDATE Production.UnitMeasureTest
 SET UnitMeasureCode='TTT'

 --task 4d


DELETE Production.UnitMeasureTest

--  task 4e


SELECT*
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43659,43664)

SELECT LineTotal,SalesOrderID 
,MAX(LineTotal) OVER (PARTITION BY SalesOrderID) AS 'MAX'
,MIN(LineTotal) OVER (PARTITION BY SalesOrderID) AS 'MIN'
,AVG (LineTotal) OVER (PARTITION BY SalesOrderID) AS 'AVG'
FROM Sales.SalesOrderDetail

--   task 4f


	SELECT FirstName, LastName,SalesYTD,TerritoryGroup 
	,ROW_NUMBER () OVER (ORDER BY SalesYTD DESC) AS 'ROW NUMBER'
	,RANK () OVER (ORDER BY SalesYTD  DESC) AS 'RANK'
	,DENSE_RANK () OVER (ORDER BY SalesYTD DESC) AS 'DENSE RANK'
	FROM [Sales].[vSalesPerson]

	
	
	SELECT  FirstName, LastName,SalesYTD, TerritoryGroup
	,CONCAT (UPPER(LEFT(LastName,3)),'login',ISNULL(TerritoryGroup,' ')) AS LOGIN
	,ROW_NUMBER () OVER (ORDER BY SalesYTD DESC) AS 'ROW NUMBER'
	FROM Sales.vSalesPerson
-- Linda Mitchell 

SELECT  FirstName, LastName,SalesLastYear, TerritoryGroup
	,CONCAT (UPPER(LEFT(LastName,3)),'login',ISNULL(TerritoryGroup,' ')) AS LOGIN
	,ROW_NUMBER () OVER (ORDER BY SalesLastYear DESC) AS 'ROW NUMBER'
	FROM Sales.vSalesPerson

--Ranjit Varkey Chudukatil 

		
--  task 4g

SELECT GETDATE() AS DATE,
 CASE 
 WHEN DATEPART(dw,DATEADD(m,DATEDIFF(m,0,GETDATE()),0))=6
 THEN DATEADD(m,DATEDIFF(m,0,GETDATE()),2)
 WHEN DATEPART(dw,DATEADD(m,DATEDIFF(m,0,GETDATE()),0))=7
 THEN DATEADD(m,DATEDIFF(m,0,GETDATE()),1)
 ELSE DATEADD(m,DATEDIFF(m,0,GETDATE()),0)
 END 'First working day';

 /*
SELECT DATEDIFF(m, 0, GETDATE())-- 1477
SELECT DATEADD(m,DATEDIFF(m,0,GETDATE()),0)
*/


-- task 5
--count(1), count(name), count(id), count(*)
-- 4           2            4        4