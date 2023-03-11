CREATE VIEW vTop50_Sellers
AS
SELECT TOP 50 WITH TIES FullName, Sum(rating) as Sumrating 
FROM

(
SELECT FullName, RentDate,
(CASE
WHEN COUNT (o.OrderID)<=5  THEN 1
WHEN COUNT (o.OrderID) BETWEEN 5 AND 10 THEN 2
WHEN COUNT (o.OrderID)> 10 THEN 3
END) AS rating
FROM FctOrders o JOIN DimEmployees e ON o.EmployeeNumber=e.EmployeeNumber
GROUP BY FullName, RentDate
)r
GROUP BY FullName
ORDER BY Sumrating DESC


select *
from vTop50_Sellers
