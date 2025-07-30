create database pizzadb;

use pizzadb;

select * from pizza_sales;

select SUM(total_price) AS Total_Revenue from pizza_sales;

select SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value  from pizza_sales; 

select SUM(quantity) as Total_Pizza_Sold from pizza_sales;

select COUNT(DISTINCT order_id) as total_orders from pizza_sales;

select SUM(quantity) / COUNT(DISTINCT order_id) as Avg_Pizza_Per_Order from pizza_sales; 

select dayname(Order_date) AS order_day , COUNT(DISTINCT order_id) AS Total_orders 
from pizza_sales
GROUP BY dayname(Order_date);

select date_format(order_date , '%m') as month_name, count(distinct order_id) as total_orders from pizza_sales
GROUP BY date_format(order_date, '%m')
order by total_orders desc;

 select pizza_category, sum(total_price) as total_sales, sum(total_price) * 100 /
 (select sum(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS PCT
 from pizza_sales
 WHERE MONTH(order_date) = 1
 GROUP BY pizza_category
 
 
select pizza_size, cast(sum(total_price) AS decimal(10,2)) as total_sales, cast(sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) AS decimal(10,2)) AS PCT
from pizza_sales
GROUP BY pizza_size
order by PCT DESC


select pizza_name, SUM(total_price) as Total_Revenue FROM pizza_sales
group by pizza_name
order by Total_Revenue desc
limit 5;



select  pizza_name, SUM(quantity) as Total_Quantity FROM pizza_sales
group by pizza_name
order by Total_Quantity asc
limit 5

select  pizza_name, count(distinct order_id) as Total_Orders FROM pizza_sales
group by pizza_name
order by Total_Orders desc
limit 5

select  pizza_name, count(distinct order_id) as Total_Orders FROM pizza_sales
group by pizza_name
order by Total_Orders asc
limit 5




