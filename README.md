# SQL Project – Walmart Sales Analysis

By Akhil Binjola

10 analytical SQL queries on retail sales (branches, cities, product lines, payments, customers).

## Files
- `Walmartsales Dataset.csv` – source (Invoice ID, Branch, City, Customer type, Gender, Product line, Unit price, Quantity, Tax, Total, Date_, Time_, Payment, cogs, gross income, Rating, Customer ID)
- `SQLProjectPPT.pptx` – presentation
- `task 1.sql` … `Task 10.sql` – queries (see below)

## Queries
- task 1 – Avg monthly growth % per Branch (LAG window)
- task 2 – Total profit (SUM gross income) by Branch + Product line
- Task 3 – Avg spend + Low/Medium/High segment per Customer ID
- Task 4 – Anomaly flag per invoice vs Product-line mean ± 2*SD (AVG/STDDEV windows)
- task 5 – Most-used Payment method per City (RANK)
- Task 6 – Monthly sales by Gender + month
- Task 7 – Top Product line per Customer type (RANK)
- task 8 – Purchase repetition per Customer in January
- Task 9 – Top-5 customers by total sales
- Task 10 – Total sales by day-of-week (DAYNAME), ranked

## How to run
1. Import CSV into MySQL / Postgres / SQLite (table `walmartsales_dataset`)
2. Run `task 1.sql` … `Task 10.sql` in order, or open PPT for summary.
