select `Customer ID`,ROUND(AVG(Total), 2) AS AvgSpending, 
case when AVG(Total)<150 then "Low" 
when AVG(Total) between 150 and 300 then "Medium" 
Else 'High' 
end as Spends from walmartsales_dataset
group by `Customer ID`
order by AvgSpending desc;

