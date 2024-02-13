with source as (

    select * from {{ source('raw_data', 'countryregion') }}

),

renamed as (

    select
        countryregioncode,
        modifieddate,
        name

    from source

)

select * from renamed

