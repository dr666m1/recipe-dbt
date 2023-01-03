select *,
from ({{ latest_snapshot_of("stg_dummy__orders") }})
