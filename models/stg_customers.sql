-- https://docs.getdbt.com/docs/get-started/getting-started-dbt-core

select
    id as customer_id,
    first_name,
    last_name

from `dbt-tutorial`.jaffle_shop.customers
