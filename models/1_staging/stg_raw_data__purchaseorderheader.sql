with source as (

    select * from {{ source('raw_data', 'purchaseorderheader') }}

),

renamed as (

    select
        employeeid,
        freight,
        modifieddate,
        orderdate,
        purchaseorderid,
        revisionnumber,
        shipdate,
        shipmethodid,
        status,
        subtotal,
        taxamt,
        totaldue,
        vendorid

    from source

)

select * from renamed

