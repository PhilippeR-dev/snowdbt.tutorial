with source as (

    select * from {{ source('raw_data', 'productvendor') }}

),

renamed as (

    select
        averageleadtime,
        businessentityid,
        lastreceiptcost,
        lastreceiptdate,
        maxorderqty,
        minorderqty,
        modifieddate,
        onorderqty,
        productid,
        standardprice,
        unitmeasurecode

    from source

)

select * from renamed

