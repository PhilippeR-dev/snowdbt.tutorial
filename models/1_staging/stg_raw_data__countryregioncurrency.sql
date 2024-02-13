with source as (

    select * from {{ source('raw_data', 'countryregioncurrency') }}

),

renamed as (

    select
        countryregioncode,
        currencycode,
        modifieddate

    from source

)

select * from renamed

