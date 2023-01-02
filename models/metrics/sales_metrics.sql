select *
from {{ metrics.calculate(
    metric('total_sales'),
    grain='week',
    dimensions=[]
) }}
