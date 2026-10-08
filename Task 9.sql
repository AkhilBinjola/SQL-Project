SELECT `Customer ID`, 
round(Sum(Total),2) as Total_sale
FROM walmartsales_dataset
GROUP BY `Customer ID`
ORDER BY Total_sale desc
limit 5;
