select *,
from {{ metrics.calculate(
    metric('average_ltv'),
    grain='day',
) }}
