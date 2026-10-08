SELECT `Invoice ID`,`Product line`,Total,
ROUND(PL_Avg, 2) AS AvgTotal,
ROUND(PL_StdDev, 2) AS StdDev,
CASE WHEN Total > PL_Avg + 2 * PL_StdDev THEN 'High Anomaly'
WHEN Total < PL_Avg - 2 * PL_StdDev THEN 'Low Anomaly'
ELSE 'Normal' END AS AnomalyStatus
FROM (SELECT `Invoice ID`,`Product line`,Total,
AVG(Total) OVER (PARTITION BY `Product line`) AS PL_Avg,
STDDEV(Total) OVER (PARTITION BY `Product line`) AS PL_StdDev
FROM walmartsales_dataset) AS AVGStd
ORDER BY AnomalyStatus DESC, Total DESC;)


