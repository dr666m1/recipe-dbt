-- This must be a table to avoid following error.
-- Correlated subqueries that reference other tables are not supported
-- unless they can be de-correlated, such as by transforming them into an efficient JOIN.
{{
    config(
        materialized='table'
    )
}}

with sales as (
  select data.dt, data.sales
  from unnest([
    struct(date "2022-01-01" as dt, 10000 as sales),
    struct(date "2022-01-02" as dt, 93846 as sales),
    struct(date "2022-01-03" as dt, 65138 as sales),
    struct(date "2022-01-04" as dt, 57856 as sales),
    struct(date "2022-01-05" as dt, 62608 as sales),
    struct(date "2022-01-06" as dt, 32460 as sales),
    struct(date "2022-01-07" as dt, 65390 as sales),
    struct(date "2022-01-08" as dt, 67893 as sales),
    struct(date "2022-01-09" as dt, 25689 as sales),
    struct(date "2022-01-10" as dt, 87645 as sales),
    struct(date "2022-01-11" as dt, 16787 as sales),
    struct(date "2022-01-12" as dt, 54327 as sales),
    struct(date "2022-01-13" as dt, 98675 as sales),
    struct(date "2022-01-14" as dt, 78765 as sales),
    struct(date "2022-01-15" as dt, 98765 as sales),
    struct(date "2022-01-16" as dt, 54367 as sales),
    struct(date "2022-01-17" as dt, 34567 as sales),
    struct(date "2022-01-18" as dt, 87659 as sales),
    struct(date "2022-01-19" as dt, 98765 as sales),
    struct(date "2022-01-20" as dt, 65678 as sales),
    struct(date "2022-01-21" as dt, 87654 as sales),
    struct(date "2022-01-22" as dt, 34565 as sales),
    struct(date "2022-01-23" as dt, 45654 as sales),
    struct(date "2022-01-24" as dt, 76543 as sales),
    struct(date "2022-01-25" as dt, 45678 as sales),
    struct(date "2022-01-26" as dt, 65435 as sales),
    struct(date "2022-01-27" as dt, 12345 as sales),
    struct(date "2022-01-28" as dt, 43245 as sales),
    struct(date "2022-01-29" as dt, 87654 as sales),
    struct(date "2022-01-30" as dt, 43245 as sales),
    struct(date "2022-01-31" as dt, 76543 as sales),
    struct(date "2022-02-01" as dt, 78975 as sales),
    struct(date "2022-02-02" as dt, 43456 as sales),
    struct(date "2022-02-03" as dt, 65437 as sales),
    struct(date "2022-02-04" as dt, 76548 as sales),
    struct(date "2022-02-05" as dt, 98767 as sales),
    struct(date "2022-02-06" as dt, 89767 as sales),
    struct(date "2022-02-07" as dt, 67654 as sales),
    struct(date "2022-02-08" as dt, 76554 as sales),
    struct(date "2022-02-09" as dt, 76545 as sales),
    struct(date "2022-02-10" as dt, 76543 as sales),
    struct(date "2022-02-11" as dt, 45356 as sales),
    struct(date "2022-02-12" as dt, 43526 as sales),
    struct(date "2022-02-13" as dt, 23456 as sales),
    struct(date "2022-02-14" as dt, 78697 as sales),
    struct(date "2022-02-15" as dt, 56123 as sales),
    struct(date "2022-02-16" as dt, 76543 as sales),
    struct(date "2022-02-17" as dt, 78685 as sales),
    struct(date "2022-02-18" as dt, 43456 as sales),
    struct(date "2022-02-19" as dt, 54567 as sales),
    struct(date "2022-02-20" as dt, 65434 as sales),
    struct(date "2022-02-21" as dt, 76546 as sales),
    struct(date "2022-02-22" as dt, 89792 as sales),
    struct(date "2022-02-23" as dt, 24356 as sales),
    struct(date "2022-02-24" as dt, 34356 as sales),
    struct(date "2022-02-25" as dt, 26754 as sales),
    struct(date "2022-02-26" as dt, 94726 as sales),
    struct(date "2022-02-27" as dt, 24628 as sales),
    struct(date "2022-02-28" as dt, 82647 as sales)
  ]) as data
)

select
  sales.dt,
  sales.sales,
from sales
