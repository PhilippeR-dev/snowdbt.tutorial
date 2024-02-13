with source as (

    select * from {{ source('raw_data', 'productcategory') }}

),

renamed as (

    select
        modifieddate,
        name,
        productcategoryid,
        rowguid

    from source

)

select * from renamed

