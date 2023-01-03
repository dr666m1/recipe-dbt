with
snapshot_20230102 as (
  select
    id as customer_id,
    register_dt,
    country,
  from
    unnest(
      [
        struct(
          "a" as id, date "2023-01-01" as register_dt, "JP" as country
        ),
        struct(
          "b" as id, date "2023-01-02" as register_dt, "US" as country
        )
      ]
    )
),

snapshot_20230103 as (
  select
    customer_id,
    register_dt,
    country,
  from snapshot_20230102
  union all
  select
    id as customer_id,
    register_dt,
    country,
  from
    unnest(
      [
        struct(
          "c" as id, date "2023-01-03" as register_dt, "JP" as country
        )
      ]
    )
)

select
  *,
  date "2023-01-02" as snapshot_dt,
from snapshot_20230102
union all
select
  *,
  date "2023-01-03" as snapshot_dt,
from snapshot_20230103
