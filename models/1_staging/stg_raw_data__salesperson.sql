with source as (

    select * from {{ source('raw_data', 'salesperson') }}

),

renamed as (

    select
        bonus,
        businessentityid,
        commissionpct,
        modifieddate,
        saleslastyear,
        salesquota,
        salesytd,
        territoryid,
        rowguid

    from source

)

select * from renamed

