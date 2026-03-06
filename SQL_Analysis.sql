select sum(total_price)as Total_Revenue from pizza_sales

select sum(total_price) / count(distinct order_id)as Avg_order_value from pizza_sales

select sum(quantity)as Total_Pizza_Sold from pizza_sales

select count(distinct order_id)as Total_orders from pizza_sales

select cast(cast(sum(quantity) as decimal (10,2)) / cast(count(order_id) as decimal (10,2)) as decimal(10,2)) as Avg_Pizza_Per_order
from pizza_sales

--Daily Trend
select datename(dw, order_date)as order_day, count(distinct order_id)as Total_orders
from pizza_sales
group by datename(dw, order_date)
order by Total_orders desc

-- Hourly trend
select datepart(hour, order_time)as Order_hours, count(distinct order_id)as total_count
from pizza_sales
group by datepart(hour, order_time)
order by Order_hours  

select pizza_category, sum(total_price)as Total_sales, sum(total_price)*100 / (select sum(total_price) from pizza_sales
where month(order_date)=1)as PCT
from pizza_sales
where month(order_date) = 1
group by pizza_category

select pizza_size, cast(sum(total_price)as decimal(10,2))as Total_sales, 
cast(sum(total_price)*100 / (select sum(total_price) from pizza_sales where datepart(quarter, order_date) = 1)as decimal(10,2)) as PCT
from pizza_sales
where datepart(quarter, order_date) = 1
group by pizza_size
order by PCT desc 

select pizza_category, sum(quantity)as Pizzas_sold
from pizza_sales
group by pizza_category

select * from pizza_sales

select top 5 pizza_name, sum(quantity)as pizza_sold
from pizza_sales
group by pizza_name
order by pizza_sold desc

select top 5 pizza_name, sum(quantity)as pizza_sold
from pizza_sales
group by pizza_name
order by pizza_sold 

