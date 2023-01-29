
-- task 2 a 
SELECT Name,
       CASE WHEN StandardCost=0 OR StandardCost IS NULL THEN 'Not for sale'
	        WHEN StandardCost>0 AND StandardCost < 100 THEN '<$100'
			WHEN StandardCost >=100 AND StandardCost < 500 THEN '<$500'
			ELSE '>=$500'
END  PriceRange 
FROM Production.Product

--task 2b
SELECT  p1. BusinessEntityID, p2. ProductID, p1.Name,p2.StandardPrice
FROM  Purchasing.Vendor p1
       JOIN Purchasing.ProductVendor p2
	  ON p1.[BusinessEntityID]=p2.[BusinessEntityID]
WHERE p2. StandardPrice >10 AND  p1.Name LIKE 'N%' OR p1. Name LIKE '%x%'
	


-- task 2 c

SELECT  p1.Name, p1.BusinessEntityID
FROM  Purchasing.Vendor p1
      LEFT JOIN Purchasing.ProductVendor p2
	  ON p1.[BusinessEntityID]=p2.[BusinessEntityID]
WHERE p2.[BusinessEntityID] IS NULL


 -- task 3 a
 SELECT  p1. Name AS ModelName, p2.Name as ProductName, p2.StandardCost
 FROM [Production].[ProductModel] p1
  JOIN  [Production].[Product]p2
 ON p1.[ProductModelID]=p2.[ProductModelID]
 WHERE  p1. Name LIKE 'LL%'


 -- task 3 b
 SELECT Name
 FROM [Purchasing].[Vendor]
 UNION
 SELECT Name
 FROM [Sales].[Store]
 ORDER BY Name
 
 --task  3 c 
 
 SELECT  p1.Name, COUNT (1) AS CNT
 FROM Production.Product p1
 JOIN  [Sales].[SpecialOfferProduct]p2
  ON p1.[ProductID]=p2.[ProductID]
GROUP BY p1.Name
HAVING COUNT (1) >1

 