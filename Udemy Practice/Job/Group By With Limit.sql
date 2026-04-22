create or replace table udemy_practice_catalog.gold.sales_orders_limit as
select
  region,
  date_format(order_date, "MMM") as order_month,
  sum(amount) as total_amount,
  count(distinct order_id) as distinct_total_orders
from udemy_practice_catalog.silver.clean_sales_orders
group by order_month, region
order by total_amount desc
limit 5