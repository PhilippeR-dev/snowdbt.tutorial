with source as (

    select * from {{ source('raw_data', 'productsubcategory') }}

),

renamed as (

    select
        modifieddate,
        name,
        productcategoryid,
        productsubcategoryid,
        rowguid

    from source

)

select * from renamed

