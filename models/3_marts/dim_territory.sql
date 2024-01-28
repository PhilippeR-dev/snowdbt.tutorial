select 
     {{ dbt_utils.generate_surrogate_key(['int_salesterritory.territoryid']) }} as territory_key,
    territoryid, 
    salesterritoryname, 
    "GROUP" as territory_group, 
    countryregioncode, 
    costytd,  
    salesytd, 
    costlastyear,
    saleslastyear,
    modifieddate
from {{ ref('int_salesterritory') }}