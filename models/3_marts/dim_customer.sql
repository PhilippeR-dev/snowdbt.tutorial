select
    {{ dbt_utils.generate_surrogate_key(['stg_raw_data__customer.customerid']) }} as customer_key,
    stg_raw_data__customer.customerid,
    int_person.businessentityid as personbusinessentityid,
    int_person.title,
    int_person.firstname || ' '|| lastname as fullname,
    int_person.houseownerflag, 
    int_person.occupation, 
    int_person.maritalstatus, 
    int_person.commutedistance, 
    int_person.education, 
    --int_person.gender,
    int_person.numbercarsowned, 
    int_person.totalchildren, 
    int_person.birthdate, 
    int_person.datefirstpurchase,
    int_countryregion.countryregionname as country,
    stg_raw_data__address.city,
    int_stateprovince.statprovincename as state,
    stg_raw_data__address.postalcode,
    stg_raw_data__address.addressline1,
    stg_raw_data__address.addressline2
from {{ ref("stg_raw_data__customer") }}
left join {{ ref('int_person') }} on stg_raw_data__customer.personid = int_person.businessentityid
left join {{ ref("stg_raw_data__businessentityaddress") }} on stg_raw_data__businessentityaddress.businessentityid = int_person.businessentityid
left join {{ ref("stg_raw_data__address") }} on stg_raw_data__address.addressid = stg_raw_data__businessentityaddress.addressid
left join {{ ref('int_stateprovince') }} on int_stateprovince.stateprovinceid = stg_raw_data__address.stateprovinceid
left join {{ ref('int_countryregion') }} on int_countryregion.countryregioncode = int_stateprovince.countryregioncode
where persontype = 'IN'
and addresstypeid = 2