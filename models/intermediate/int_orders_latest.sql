with customers as (select * from {{ ref("stg_dummy__orders") }})
select
  *,
  max(snapshot_dt) over () as latest_snapshot_dt,
from customers
qualify latest_snapshot_dt = snapshot_dt
