/*
copy sales (Region,Country,"Item Type","Sales Channel","Order Priority","Order Date","Order ID","Ship Date",
			"Units Sold","Unit Price","Unit Cost","Total Revenue","Total Cost","Total Profit"
)
from '/tmp/100+Sales+Records.csv'
delimiter ','
CSV Header;

where Extract(Year from to_date("Ship Date",'MM/DD/YYYY')) = 2015

*/

select *
from sales
where
(
Extract(Year from to_date("Ship Date",'MM/DD/YYYY')) =
(select max(Extract(Year from to_date("Ship Date",'MM/DD/YYYY'))) from sales)
or  
Extract(Year from to_date("Ship Date",'MM/DD/YYYY')) =
(select max(Extract(Year from to_date("Ship Date",'MM/DD/YYYY')))-1 from sales)
)
	and
country like '% %'  /* wild card */

;
