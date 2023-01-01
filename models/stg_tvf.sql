{{
  config(
    materialized='tvf',
    params='start_dt DATE, end_dt DATE',
  )
}}

SELECT
  dt,
  -- 0... Sun, 6... Sat
  MOD(UNIX_DATE(dt)+4, 7) AS day_of_week,
FROM UNNEST(GENERATE_DATE_ARRAY(start_dt, end_dt)) AS dt
