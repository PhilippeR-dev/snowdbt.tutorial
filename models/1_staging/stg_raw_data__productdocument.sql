with source as (

    select * from {{ source('raw_data', 'productdocument') }}

),

renamed as (

    select
        documentnode,
        modifieddate,
        productid

    from source

)

select * from renamed

