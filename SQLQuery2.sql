
-- total revenue
SELECT sum(total_price) 
  FROM [ritik].[dbo].[dominos_sales];
  -- 817860.049999994


--average order value
select sum(total_price)/count(distinct order_id) as avg_order_value from [ritik].[dbo].[dominos_sales];
-- 38.3072622950816

-- Total pizza sold
select sum(quantity) as total_pizza_sold FROM [ritik].[dbo].[dominos_sales]
-- 49574

--Total order 
select count(distinct order_id) as total_order FROM [ritik].[dbo].[dominos_sales]
-- 21350

-- Average pizza per order 
select sum(quantity)/ count(distinct order_id) FROM [ritik].[dbo].[dominos_sales]
-- 2.32196721311475


-- Chart requirements

-- daily trend for total orders

select * from [ritik].[dbo].[dominos_sales]
select datename(DW,order_date) as order_day
, count(distinct order_id) as total_order
from [ritik].[dbo].[dominos_sales] group by datename(DW,order_date)

-- monthly trend for orders
select datename(MONTH,order_date) as month_name
, count(distinct order_id) as total_order
from [ritik].[dbo].[dominos_sales] group by datename(MONTH,order_date)

-- percentage of sales by pizza category

select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue, cast(sum(total_price)*100/(select sum(total_price) from [ritik].[dbo].[dominos_sales])
as decimal(10,2)) as PCT
from [ritik].[dbo].[dominos_sales]
group by pizza_category

-- percentage of sales by pizza size

select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_revenue, cast(sum(total_price)*100/(select sum(total_price) from [ritik].[dbo].[dominos_sales])
as decimal(10,2)) as PCT
from [ritik].[dbo].[dominos_sales]
group by pizza_size

--total pizza sold by pizza category
select pizza_category, sum(quantity) 
from [ritik].[dbo].[dominos_sales]
group by pizza_category


-- top 5 pizza by total_price
select top 5 pizza_name, sum(total_price) 
from [ritik].[dbo].[dominos_sales]
group by pizza_name
order by sum(total_price) desc


-- buttom 5 pizza by total_price
select top 5 pizza_name, sum(total_price) 
from [ritik].[dbo].[dominos_sales]
group by pizza_name
order by sum(total_price)