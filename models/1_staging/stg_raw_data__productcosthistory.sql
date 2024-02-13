with source as (

    select * from {{ source('raw_data', 'productcosthistory') }}

),

renamed as (

    select
        enddate,
        modifieddate,
        productid,
        standardcost,
        startdate

    from source

)

select * from renamed

