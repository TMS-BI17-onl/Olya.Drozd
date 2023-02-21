

--1
SELECT P1.FirstName, P1.Lastname,P2.Phonenumber
FROM [Person].[Person] P1
JOIN  [Person].[PersonPhone] P2
ON P1.BusinessEntityID=P2.BusinessEntityID
WHERE P2.PhoneNumber LIKE '4%5'

--2



/*Adolescence: 17-20
Adults: 21-59
Elderly: 60-75
Senile: 76-90
*/


SELECT BusinessEntityID, YEAR (GETDATE())-YEAR(BirthDate) AS AGE,
CASE
WHEN (YEAR (GETDATE())-YEAR(BirthDate)) BETWEEN 17 AND 20 THEN 'Adolescence'
WHEN (YEAR (GETDATE())-YEAR(BirthDate)) BETWEEN 21 AND 59 THEN 'Adults'
WHEN (YEAR (GETDATE())-YEAR(BirthDate)) BETWEEN 60 AND 75 THEN 'Elderly'
WHEN (YEAR (GETDATE())-YEAR(BirthDate)) BETWEEN 76 AND 90 THEN 'Senile'
END AGE
FROM [HumanResources].[Employee]

--3


SELECT   Name, StandardCost, Color--1
FROM 
(
SELECT  Name, StandardCost,  (Color), MAX ( StandardCost) OVER (PARTITION BY  COLOR) as maxcost
FROM [Production].[Product])m
WHERE  StandardCost=maxcost AND COLOR IS NOT NULL




 SELECT DISTINCT p1.[Name], p1.[Color], p1.[StandardCost]--2
  FROM [Production].[Product] p1
  WHERE [StandardCost] =(SELECT DISTINCT MAX([StandardCost]) FROM [Production].[Product] p WHERE p.Color = p1.Color GROUP BY Color)
 
