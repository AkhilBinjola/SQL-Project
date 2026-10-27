# Retail Sales Analytics with MySQL

A set of business analyses on a retail sales dataset, written in MySQL. The project covers growth tracking, customer segmentation, anomaly detection and sales pattern analysis using window functions and subqueries.

## Business questions answered

| Analysis | Technique | Finding |
|---|---|---|
| Month-over-month sales growth by branch | `LAG() OVER (PARTITION BY ...)` | Branch B grew fastest (12.2% average monthly growth), Branch C grew 9.5%, and Branch A declined (-9%) |
| Total profit by branch and product line | `GROUP BY` on gross income | Shows which product lines drive profit in each branch |
| Top product line per branch | Ranking with `RANK()` | Identifies each branch's best category |
| Customer spend tiers | `CASE WHEN` on average spend | Customers grouped as Low (below 150), Medium (150–300) or High |
| Anomalous transactions | `AVG()` and `STDDEV() OVER (PARTITION BY product line)` | Flags totals beyond ±2 standard deviations as High or Low anomalies |
| Payment preference by city | Aggregation with ranking | Most-used payment method in each city |
| Repeat customers | Grouped counts | Customers who purchased more than once |
| Weekday and gender sales trends | Date functions and aggregation | When sales peak and how they split by gender |

## Example: month-over-month growth by branch

```sql
SELECT Branch,
       ROUND(AVG((MonthlySales - PreviousSales) / PreviousSales * 100), 2) AS AvgGrowthRate
FROM (
    SELECT Branch, MONTH(Date_) AS Month, SUM(Total) AS MonthlySales,
           LAG(SUM(Total)) OVER (PARTITION BY Branch ORDER BY MONTH(Date_)) AS PreviousSales
    FROM walmartsales_dataset
    GROUP BY Branch, MONTH(Date_)
) AS GrowthData
WHERE PreviousSales IS NOT NULL
GROUP BY Branch
ORDER BY AvgGrowthRate DESC;
```

## Example: statistical anomaly detection

```sql
SELECT `Invoice ID`, `Product line`, Total,
       CASE WHEN Total > PL_Avg + 2 * PL_StdDev THEN 'High Anomaly'
            WHEN Total < PL_Avg - 2 * PL_StdDev THEN 'Low Anomaly'
            ELSE 'Normal' END AS AnomalyStatus
FROM (
    SELECT `Invoice ID`, `Product line`, Total,
           AVG(Total)    OVER (PARTITION BY `Product line`) AS PL_Avg,
           STDDEV(Total) OVER (PARTITION BY `Product line`) AS PL_StdDev
    FROM walmartsales_dataset
) AS AVGStd
ORDER BY AnomalyStatus DESC, Total DESC;
```

## Tools

MySQL and MySQL Workbench.

## Skills shown

Window functions (`LAG`, `RANK`, `AVG` / `STDDEV` with `OVER`), subqueries, conditional logic with `CASE`, aggregation, date functions, and turning query output into business findings.

## Author

Akhil Binjola · [LinkedIn](https://linkedin.com/in/akhilbinjola) · [GitHub](https://github.com/AkhilBinjola)
