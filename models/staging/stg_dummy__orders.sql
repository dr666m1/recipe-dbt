with
  snapshot_20230102 as (
    select *
    from
      unnest(
        [
          struct(
            "a" as customer_id,
            date "2023-01-01" as order_dt,
            300 as amount
          ),
          struct(
            "a" as customer_id,
            date "2023-01-02" as order_dt,
            400 as amount
          ),
          struct(
            "b" as customer_id,
            date "2023-01-02" as order_dt,
            300 as amount
          ),
          struct(
            "b" as customer_id,
            date "2023-01-01" as order_dt,
            500 as amount
          )
        ]
      ) as data
  ),
  snapshot_20230103 as (
    select * from snapshot_20230102
    union all
    select *
    from
      unnest(
        [
          struct(
            "a" as customer_id,
            date "2023-01-03" as order_dt,
            300 as amount
          ),
          struct(
            "c" as customer_id,
            date "2023-01-03" as order_dt,
            500 as amount
          )
        ]
      ) as data
  )
select *, date "2023-01-02" as snapshot_dt from snapshot_20230102
union all
select *, date "2023-01-03" as snapshot_dt from snapshot_20230103
