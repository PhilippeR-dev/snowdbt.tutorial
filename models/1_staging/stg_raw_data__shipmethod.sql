with source as (

    select * from {{ source('raw_data', 'shipmethod') }}

),

renamed as (

    select
        modifieddate,
        name,
        shipbase,
        shipmethodid,
        shiprate,
        rowguid

    from source

)

select * from renamed

