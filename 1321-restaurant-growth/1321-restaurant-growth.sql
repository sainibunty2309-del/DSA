with daily as (
    select visited_on,
    sum(amount) as amount from Customer
    group by visited_on
),

result as (
    select visited_on,
    sum(amount) over (
        order by visited_on
        rows between 6 preceding and current row
    ) as amount
    from daily
)

select visited_on, amount , round(amount / 7,2) as average_amount
from result
where visited_on >= (
    select date_add(min(visited_on), interval 6 day)
    from Customer
)
Order by visited_on;