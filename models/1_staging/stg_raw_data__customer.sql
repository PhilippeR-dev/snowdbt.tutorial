with source as (

    select * from {{ source('raw_data', 'customer') }}

),

renamed as (

    select
        accountnumber,
        customerid,
        modifieddate,
        personid,
        storeid,
        territoryid,
        rowguid

    from source

)

select * from renamed

