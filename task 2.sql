SELECT Branch,`Product line`,
  ROUND(SUM(`gross income`), 2) AS TotalProfit
FROM walmartsales_dataset
GROUP BY Branch, `Product line`
ORDER BY Branch, TotalProfit DESC;


