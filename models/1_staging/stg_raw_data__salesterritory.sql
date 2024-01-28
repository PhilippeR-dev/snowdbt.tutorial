with source as (

    select * from {{ source('raw_data', 'salesterritory') }}

),

renamed as (

    select
        costlastyear,
        costytd,
        countryregioncode,
        "GROUP",
        modifieddate,
        name,
        saleslastyear,
        salesytd,
        territoryid,
        rowguid

    from source

)

select * from renamed

