-- https://docs.getdbt.com/docs/get-started/getting-started-dbt-core

select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from `dbt-tutorial`.jaffle_shop.orders


