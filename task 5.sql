WITH PaymentRank AS (SELECT City, Payment, COUNT(*) AS PaymentCount,
RANK() OVER (PARTITION BY City ORDER BY COUNT(*) DESC) AS rnk
FROM walmartsales_dataset
GROUP BY City, Payment)
SELECT City, Payment, PaymentCount
FROM PaymentRank
WHERE rnk = 1
ORDER BY City;

