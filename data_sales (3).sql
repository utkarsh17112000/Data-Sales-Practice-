SELECT * FROM data_sales.`data_sales (3)`;

ALTER TABLE data_sales.`data_sales (3)`
RENAME COLUMN `ï»¿Retailer` to Retailer ;




SELECT * FROM data_sales.`data_sales (3)`;

select count(*) from data_sales.`data_sales (3)`;

select sum(`Total Sales`) as "Total Sales" from data_sales.`data_sales (3)`;

select Product, round(avg(`Price per Unit`),2) as "Average Sales" from data_sales.`data_sales (3)`
group by Product;

select Product, sum(`Total Sales`) as "Sales" from data_sales.`data_sales (3)`
group by Product;


select Product, sum(`Total Sales`) as "Sales" from data_sales.`data_sales (3)`
group by Product
order by "Sales" desc
limit 5;

select Retailer, sum(`Total Sales`) as "Sales" from data_sales.`data_sales (3)`
group by Retailer
order by "Sales" desc
limit 1;


select State from data_sales.`data_sales (3)`
group by State
order by "Sales" desc
limit 1;




select Product , round(sum(`Operating Profit` / `Total Sales`), 2) as total_profit_margin from data_sales.`data_sales (3)`
group by Product;


select `Sales Method` , 
round(sum(`Total Sales`)*100.0/(select sum(`Total Sales`) from data_sales.`data_sales (3)`), 2) as percentage_contribution 
from data_sales.`data_sales (3)`
group by `Sales Method`;

select Retailer, round(avg(`Price per Unit`) )as "Highest Average Price per Unit" 
, rank() over ( order by round(avg(`Price per Unit`) )) as "Rank"
from data_sales.`data_sales (3)`
group by Retailer
order by "Highest Average Price per Unit"  desc
limit 3;

select State, count(*) as "Total Transactions"
from data_sales.`data_sales (3)`
group by State
order by "Total Transactions" desc ;


select Product, 
round(sum(`Operating Profit` / `Total Sales`), 2) as "Total Profit Margin" 
from data_sales.`data_sales (3)`
group by Product
order by "Total Profit Margin"  desc
limit 1;

select Product, 
round(sum(`Operating Profit` / `Total Sales`), 2) as "Total Profit Margin" 
from data_sales.`data_sales (3)`
group by Product
order by "Total Profit Margin" asc 
limit 1;


select `Sales Method`, sum(`Total Sales`) as "Total Sales"
from data_sales.`data_sales (3)`
group by `Sales Method`;


select Region,Sum(`Operating Profit`) as "Total Revenue"
from data_sales.`data_sales (3)`
group by Region
order by "Total Revenue" desc
limit 1;

select distinct Product
from data_sales.`data_sales (3)`;

select Product , sum(`Total Sales`) as "Sales",
round(sum(`Total Sales`)*100.0/(select sum(`Total Sales`) from data_sales.`data_sales (3)`), 2) as percentage_contribution 
from data_sales.`data_sales (3)`
group by Product;

select City, sum(`Total Sales`) as "Sales"
from data_sales.`data_sales (3)`
group by City
order by "Sales" desc
limit 3;


select Region, Product, SUM(`Total Sales`) AS total_sales_amount,
rank() over (partition by region order by SUM(`Total Sales`) ) as "Rank"
from data_sales.`data_sales (3)`
group by Region, Product
order by Region, "Rank";


with transaction_profit AS(
select `Retailer ID`, Product,`Total Sales`, `Operating Profit`,
Rank() Over (order by `Operating Profit` desc) as transaction_rank
from data_sales.`data_sales (3)`
)
select `Retailer ID`, Product,`Total Sales`, `Operating Profit`
from transaction_profit
where transaction_rank<=5;





