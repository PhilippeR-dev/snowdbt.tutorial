select
    {{ dbt_utils.generate_surrogate_key(['stg_raw_data__address.addressid']) }} as address_key,
    stg_raw_data__address.addressid,
    stg_raw_data__address.city as city_name,
    stg_raw_data__address.postalcode, 
    stg_raw_data__address.addressline1 || ' '|| coalesce(stg_raw_data__address.addressline2, '') as Addressline,
    int_stateprovince.statprovincename as state_name,
    int_countryregion.countryregionname as country_name
from {{ ref("stg_raw_data__address") }} as stg_raw_data__address
left join {{ ref("int_stateprovince") }} on stg_raw_data__address.stateprovinceid = int_stateprovince.stateprovinceid
left join {{ ref("int_countryregion") }} on int_stateprovince.countryregioncode = int_countryregion.countryregioncode