-- task  1  a
SELECT*
FROM Sales.SalesTerritory 

 -- task 1  b
SELECT TerritoryId, Name 
FROM Sales.SalesTerritory

-- task 1 c
SELECT*
FROM Person.Person  
WHERE LastName ='Norman'

-- task 1  d
SELECT*
FROM Person.Person
WHERE NOT EmailPromotion=2 

SELECT*
FROM Person.Person
WHERE EmailPromotion!=2

--task 3
SELECT VAR(Bonus)  AS variance
FROM Sales.SalesPerson 


SELECT stdev (UnitPriceDiscount) AS Standartdeviation
FROM[Sales].[SalesOrderDetail]


-- task 4  a 
SELECT COUNT (DISTINCT PersonType) AS NewPersontype
FROM Person.Person
WHERE LastName LIKE 'M%'
OR EmailPromotion!=1

-- task 4  b
SELECT TOP 3 SpecialOfferID
FROM Sales.SpecialOffer
WHERE StartDate BETWEEN '2013-01-01' AND '2014-01-01'               
ORDER BY DiscountPct DESC


-- task 4 c
SELECT MIN (Weight) AS MinWeight, MAX(Size) AS MaxSize
FROM Production.Product

-- task 4 d
	SELECT ProductSubcategoryID,
		   MIN (Weight) AS MinWeight, 
		   MAX (Size) AS MaxSize
	FROM Production.Product
	GROUP BY ProductSubcategoryID

-- task 4 e
SELECT ProductSubcategoryID, MIN (Weight) AS MinWeight, MAX(Size) AS MaxSize
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY ProductSubcategoryID

