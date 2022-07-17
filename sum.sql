select sum("Total Revenue"),Country
from sales
where Region = 'Europe'
group by Country
order by sum("Total Revenue") desc;
