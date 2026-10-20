#1. Top 10 customers by spending
select  `customer id`, sum(`total purchase amount`) as revenue
from retail_db.fact_orders
group by `customer id`
order by revenue desc
limit 10;

#2. Top 5 customers with the most orders
select  `customer id`, count(`order id`) as order_count
from retail_db.fact_orders
group by `customer id`
order by order_count desc
limit 5;

#3. The age group generating the most revenue
with best_age_group as (
  select c.`age group`, sum(f.`total purchase amount`) as revenue
  from retail_db.dim_customer as  c
  inner join retail_db.fact_orders as f on  c.`customer id`= f.`customer id`
  group by c.`age group`
  )
  select `age group`, revenue
  from best_age_group
  order by revenue desc
  limit 1;


#4. The customer distribution by age group
select `age group`, count(distinct(`customer id`))as  customer_count
from retail_db.dim_customer
group by `age group`;

#5. Customer percentage by gender
select gender, round(count(distinct(`customer id`))*100.0/ sum(count(distinct(`customer id`))) over(), 2)
from retail_db.dim_customer
group by gender;

#6. The gender which generates the most revenue
select c.gender, sum(f.`total purchase amount`) as revenue
from `retail_db.dim_customer` as c
inner join  `retail_db.fact_orders` as f on c.`customer id` = f.`customer id`
group by c.gender
order by revenue
limit 1;

#7. The gender with the highest average order value
with aov as(
select c.gender, sum(f.`total purchase amount`) as revenue,count(distinct(f.`order id`)) as order_count
from `retail_db.dim_customer` as c
inner join  `retail_db.fact_orders` as f on c.`customer id` = f.`customer id`
group by c.gender)

select gender, revenue, order_count, revenue/order_count as average_order_value
from aov
order by average_order_value desc
limit 1;

#8. The percentage of customers which have churned
select churn, round(count(distinct(`customer id`))*100.0/ sum(count(distinct(`customer id`))) over(), 2)
from retail_db.dim_customer
group by churn;

