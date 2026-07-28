# Write your MySQL query statement below
with latest_price as (
    select product_id, new_price, rank() over (
        partition by product_id order by change_date desc
    ) as rnk
from Products 
where change_date <= '2019-08-16'
)

select p.product_id,
       coalesce(lp.new_price, 10) as price 
from (select distinct product_id from Products)p
left join latest_price lp
on p.product_id = lp.product_id
and lp.rnk =1