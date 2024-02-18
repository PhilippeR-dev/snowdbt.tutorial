select tr.countryregioncode
    ,co.region
    ,sum(sl.salesamount) as total_salesamount
from {{ ref("fct_sales") }} sl
     inner join {{ref("dim_territory")}} tr on tr.territory_key = sl.territory_key
     inner join {{ ref("countries_seed") }} co on co.country = tr.countryregioncode
group by 1,2
