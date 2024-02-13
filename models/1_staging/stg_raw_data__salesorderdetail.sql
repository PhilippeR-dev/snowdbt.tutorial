with source as (

    select * from {{ source('raw_data', 'salesorderdetail') }}

),

renamed as (

    select
        carriertrackingnumber,
        linetotal,
        modifieddate,
        orderqty,
        productid,
        salesorderdetailid,
        salesorderid,
        specialofferid,
        unitprice,
        unitpricediscount,
        rowguid

    from source

)

select * from renamed

