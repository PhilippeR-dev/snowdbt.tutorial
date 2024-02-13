with source as (

    select * from {{ source('raw_data', 'productproductphoto') }}

),

renamed as (

    select
        modifieddate,
        primary,
        productid,
        productphotoid

    from source

)

select * from renamed

