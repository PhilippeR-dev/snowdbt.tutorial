with source as (

    select * from {{ source('raw_data', 'productdescription') }}

),

renamed as (

    select
        description,
        modifieddate,
        productdescriptionid,
        rowguid

    from source

)

select * from renamed

