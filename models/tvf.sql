{{
  config(
    materialized='tvf',
    params='start_dt DATE, end_dt DATE',
  )
}}

SELECT
  dt,
  -- 0... Sun, 6... Sat
  day_of_week,
FROM {{ ref("stg_tvf") }}(start_dt, end_dt) -- 引数を渡せる
WHERE day_of_week IN (0, 6)
