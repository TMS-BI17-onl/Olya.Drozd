
SELECT  Year, [1] AS [January], [2] AS [February], [12] AS [December]
FROM 
	(SELECT YEAR([ModifiedDate]) as Year, 
		    MONTH([ModifiedDate]) as Month,
		    [OrderQty]
	 FROM [Production].[WorkOrder]) AS SOURSETABLE
PIVOT
( SUM([OrderQty])
FOR Month IN ([1], [2], [12])
) AS PivotTable
ORDER BY Year

 