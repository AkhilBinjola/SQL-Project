SELECT DAYNAME(Date_) AS DayOfWeek,
ROUND(SUM(Total), 2) AS TotalSales
FROM walmartsales_dataset
GROUP BY DayOfWeek
ORDER BY TotalSales DESC;
