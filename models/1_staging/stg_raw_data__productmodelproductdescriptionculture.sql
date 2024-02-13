with source as (

    select * from {{ source('raw_data', 'productmodelproductdescriptionculture') }}

),

renamed as (

    select
        cultureid,
        modifieddate,
        productdescriptionid,
        productmodelid

    from source

)

select * from renamed

