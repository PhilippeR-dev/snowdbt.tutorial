with source as (

    select * from {{ source('raw_data', 'productinventory') }}

),

renamed as (

    select
        bin,
        locationid,
        modifieddate,
        productid,
        quantity,
        shelf,
        rowguid

    from source

)

select * from renamed

