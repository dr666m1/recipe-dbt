{{
  config(
    materialized='tvf',
    params='i int64',
  )
}}
select i as col
