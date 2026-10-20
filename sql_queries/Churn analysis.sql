#1. The churn rate
select churn, round(count(distinct(`customer id`))*100.0/ sum(count(distinct(`customer id`))) over(), 2)
from retail_db.dim_customer
group by churn;

#2. The percentage of revenue coming from churned customers
select c.churn, round(count(distinct(c.`customer id`))*100.0/ sum(count(distinct(c.`customer id`))) over(), 2) as customer_percentage, round(sum(f.`total purchase amount`)*100.0/ sum(sum((f.`total purchase amount`))) over(), 2) as revenue_percentage
from retail_db.dim_customer as c 
inner join retail_db.fact_orders as f on f.`customer id`=c.`customer id`
group by churn;

#3. The age group with the highest churn rate
select `age group` ,round(sum(case when churn = 1 then 1 else 0 end)*100.0/ count(*),2) as churn_rate
from `retail_db.dim_customer`
group by `age group`
order by churn_rate desc
limit 1;

#4. The gender with the highest churn rate
select gender,round(sum(case when churn = 1 then 1 else 0 end)*100.0/ count(*),2) as churn_rate
from `retail_db.dim_customer`
group by gender
order by churn_rate desc
limit 1;

#5. The product category with the highest churn rate
select p.`product category`, round(sum(case when c.churn = 1 then 1 else 0 end)*100.0/ count(*)  ,2 )as churn_rate 
from retail_db.dim_product as p 
inner join retail_db.fact_orders as f on f.`product id`= p.`product id`
inner join retail_db.dim_customer as c on f.`customer id`= c.`customer id`
group by p.`product category`
order by churn_rate desc
limit 1;

#6. The average number of orders for churned vs retained customers
select c.churn, count(distinct(c.`customer id`) )as customers, round(count(f.`order id`)*1.0/count(distinct(c.`customer id`)), 2 ) as avg_order
from retail_db.dim_customer as c
inner join retail_db.fact_orders as f on f.`customer id`=c.`customer id`
group by c.churn;


