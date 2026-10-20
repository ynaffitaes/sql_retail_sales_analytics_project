#1. Total revenue generated
select sum(`total purchase amount`) as total_revenue
from retail_db.fact_orders;

#2. Number of orders placed
select count(distinct(`order id`)) as total_order
from retail_db.fact_orders;

#3.Number of unique customers that made a purchase
select count(distinct(`customer id`)) as unique_customer
from retail_db.fact_orders
where `total purchase amount`> 0;

#4.The average order value
select avg(`total purchase amount`) as avg_order_value
from retail_db.fact_orders;

#5. The average revenue per customer
with customer_revenue as (
  select `customer id`,sum(`total purchase amount`) as revenue
  from retail_db.fact_orders
  group by `customer id`
)
select avg(revenue) as avg_revenue_customer
from customer_revenue;

#6. The year which generate the most revenue
with best_year as(
  select d.year, sum(f.`total purchase amount`) as total_revenue
  from retail_db.dim_date as d
  inner join retail_db.fact_orders f on f.`date id`= d.`date id`
  group by d.year
  
)
select year
from best_year
order by total_revenue desc
limit 1;

#7. The month which ggenerated the most revenue
with best_month as(
  select d.`month name`, sum(f.`total purchase amount`) as total_revenue
  from retail_db.dim_date as d
  inner join retail_db.fact_orders f on f.`date id`= d.`date id`
  group by d.`month name`
  
)
select `month name`
from best_month
order by total_revenue desc
limit 1;

#8. The quarter which generated the most revenue
with best_quarter as(
  select d.quarter, sum(f.`total purchase amount`) as total_revenue
  from retail_db.dim_date as d
  inner join retail_db.fact_orders f on f.`date id`= d.`date id`
  group by d.quarter
  
)
select quarter
from best_quarter
order by total_revenue desc
limit 1;

#9. The month-over-month revenue trend 
with best_month as(
  select d.year, d.month, sum(f.`total purchase amount`) as revenue
  from retail_db.dim_date as d
  inner join retail_db.fact_orders as f on f.`date id`= d.`date id`
  group by d.year, d.month 
  
)
select year, month , revenue,revenue-lag(revenue) over(order by year,month) as revenue_change 
from best_month
order by year,month ;

#10. The year-over-year revenue growth

with best_year as(
  select d.year, sum(f.`total purchase amount`) as revenue
  from retail_db.dim_date as d
  inner join retail_db.fact_orders as f on f.`date id`= d.`date id`
  group by d.year
  
)
select year, revenue,revenue-lag(revenue) over(order by year) as revenue_change 
from best_year
order by year ;


