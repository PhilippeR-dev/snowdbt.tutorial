with source as (

    select * from {{ source('raw_data', 'purchaseorderdetail') }}

),

renamed as (

    select
        duedate,
        linetotal,
        modifieddate,
        orderqty,
        productid,
        purchaseorderdetailid,
        purchaseorderid,
        receivedqty,
        rejectedqty,
        stockedqty,
        unitprice

    from source

)

select * from renamed

