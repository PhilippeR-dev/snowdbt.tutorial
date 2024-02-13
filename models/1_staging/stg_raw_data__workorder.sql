with source as (

    select * from {{ source('raw_data', 'workorder') }}

),

renamed as (

    select
        duedate,
        enddate,
        modifieddate,
        orderqty,
        productid,
        scrapreasonid,
        scrappedqty,
        startdate,
        stockedqty,
        workorderid

    from source

)

select * from renamed

