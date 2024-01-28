with source as (

    select * from {{ source('raw_data', 'address') }}

),

renamed as (

    select
        addressid,
        addressline1,
        addressline2,
        city,
        modifieddate,
        postalcode,
        spatiallocation,
        stateprovinceid,
        rowguid

    from source

)

select * from renamed

