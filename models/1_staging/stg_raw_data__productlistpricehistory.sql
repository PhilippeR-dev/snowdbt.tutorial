with source as (

    select * from {{ source('raw_data', 'productlistpricehistory') }}

),

renamed as (

    select
        enddate,
        listprice,
        modifieddate,
        productid,
        startdate

    from source

)

select * from renamed

