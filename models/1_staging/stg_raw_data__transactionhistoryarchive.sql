with source as (

    select * from {{ source('raw_data', 'transactionhistoryarchive') }}

),

renamed as (

    select
        actualcost,
        modifieddate,
        productid,
        quantity,
        referenceorderid,
        referenceorderlineid,
        transactiondate,
        transactionid,
        transactiontype

    from source

)

select * from renamed

