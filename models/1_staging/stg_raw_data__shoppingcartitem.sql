with source as (

    select * from {{ source('raw_data', 'shoppingcartitem') }}

),

renamed as (

    select
        datecreated,
        modifieddate,
        productid,
        quantity,
        shoppingcartid,
        shoppingcartitemid

    from source

)

select * from renamed

