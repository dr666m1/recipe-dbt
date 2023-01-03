{% macro latest_snapshot_of(table_name, snapshot_column='snapshot_dt') %}
with temp as (select * from {{ ref(table_name) }})
select
  *,
  max(snapshot_dt) over () as latest_snapshot_dt,
from temp
qualify latest_snapshot_dt = snapshot_dt
{% endmacro %}
