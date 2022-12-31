select *
from {{ call_tvf("stg_tvf", "3") }}
