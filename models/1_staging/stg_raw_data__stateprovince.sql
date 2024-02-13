with source as (

    select * from {{ source('raw_data', 'stateprovince') }}

),

renamed as (

    select
        countryregioncode,
        isonlystateprovinceflag,
        modifieddate,
        name,
        stateprovincecode,
        stateprovinceid,
        territoryid,
        rowguid

    from source

)

select * from renamed

