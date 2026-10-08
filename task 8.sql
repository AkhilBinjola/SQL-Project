SELECT `Customer ID`, count(*) AS Repitition
from walmartsales_dataset
WHERE month(Date_) = 1
group by`Customer ID`
order by `Customer ID`;
 