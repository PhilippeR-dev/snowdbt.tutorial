with source as (

    select * from {{ source('raw_data', 'salespersonquotahistory') }}

),

renamed as (

    select
        businessentityid,
        modifieddate,
        quotadate,
        salesquota,
        rowguid

    from source

)

select * from renamed

