WITH RankedProduct AS (SELECT `Customer type`, `Product line`, 
ROUND(SUM(Total), 2) AS TotalSales,
RANK() OVER (PARTITION BY `Customer type` ORDER BY SUM(Total) DESC) AS rnk
FROM walmartsales_dataset
GROUP BY `Customer type`, `Product line`)
SELECT `Customer type`, `Product line`, TotalSales
FROM RankedProduct
WHERE rnk = 1
ORDER BY `Customer type`;
