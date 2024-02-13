with source as (

    select * from {{ source('raw_data', 'productmodel') }}

),

renamed as (

    select
        catalogdescription,
        instructions,
        modifieddate,
        name,
        productmodelid,
        rowguid

    from source

)

select * from renamed

