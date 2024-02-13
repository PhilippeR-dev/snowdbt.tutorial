with source as (

    select * from {{ source('raw_data', 'salesterritoryhistory') }}

),

renamed as (

    select
        businessentityid,
        enddate,
        modifieddate,
        startdate,
        territoryid,
        rowguid

    from source

)

select * from renamed

