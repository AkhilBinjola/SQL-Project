SELECT Gender,MONTH(Date_) AS SaleMonth,
ROUND(SUM(Total), 2) AS MonthlySales
FROM walmartsales_dataset
GROUP BY Gender, SaleMonth
ORDER BY SaleMonth, Gender;
