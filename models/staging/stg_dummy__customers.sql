with
  snapshot_20230102 as (
    select
      id as customer_id,
      * except (id),
    from
      unnest(
        [
          struct("a" as id, date "2023-01-01" as register_dt),
          struct("b" as id, date "2023-01-02" as register_dt)
        ]
      ) as data
  ),
  snapshot_20230103 as (
    select * from snapshot_20230102
    union all
    select
      id as customer_id,
      * except (id),
    from unnest([struct("c" as id, date "2023-01-03" as register_dt)]) as data
  )
select *, date "2023-01-02" as snapshot_dt from snapshot_20230102
union all
select *, date "2023-01-03" as snapshot_dt from snapshot_20230103
