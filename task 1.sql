SELECT Branch,
       ROUND(AVG((MonthlySales - PreviousSales) / PreviousSales * 100), 2) AS AvgGrowthRate
FROM (SELECT Branch,MONTH(Date_) AS Month,SUM(Total) AS MonthlySales,
LAG(SUM(Total)) OVER (PARTITION BY Branch ORDER BY MONTH(Date_)) AS PreviousSales
FROM walmartsales_dataset GROUP BY Branch, MONTH(Date_)) AS GrowthData
WHERE PreviousSales IS NOT NULL
GROUP BY Branch
ORDER BY AvgGrowthRate DESC;
