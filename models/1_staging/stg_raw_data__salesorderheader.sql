with source as (

    select * from {{ source('raw_data', 'salesorderheader') }}

),

renamed as (

    select
        accountnumber,
        billtoaddressid,
        comment,
        creditcardapprovalcode,
        creditcardid,
        currencyrateid,
        customerid,
        duedate,
        freight,
        modifieddate,
        onlineorderflag,
        orderdate,
        purchaseordernumber,
        revisionnumber,
        salesorderid,
        salesordernumber,
        salespersonid,
        shipdate,
        shipmethodid,
        shiptoaddressid,
        status,
        subtotal,
        taxamt,
        territoryid,
        totaldue,
        rowguid

    from source

)

select * from renamed

