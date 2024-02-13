with source as (

    select * from {{ source('raw_data', 'businessentityaddress') }}

),

renamed as (

    select
        addressid,
        addresstypeid,
        businessentityid,
        modifieddate,
        rowguid

    from source

)

select * from renamed

