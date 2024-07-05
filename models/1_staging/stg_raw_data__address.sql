with source as (

    select * from {{ source('raw_data', 'address') }}

),

renamed as (

    select
        ADDRESSID,
        ADDRESSLINE1,
        ADDRESSLINE2,
        CITY,
        MODIFIEDDATE,
        POSTALCODE,
        SPATIALLOCATION,
        STATEPROVINCEID,
        ROWGUID

    from source

)

select * from renamed

