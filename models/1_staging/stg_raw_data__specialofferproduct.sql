with source as (

    select * from {{ source('raw_data', 'specialofferproduct') }}

),

renamed as (

    select
        modifieddate,
        productid,
        specialofferid,
        rowguid

    from source

)

select * from renamed

