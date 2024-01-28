with source as (

    select * from {{ source('raw_data', 'emailaddress') }}

),

renamed as (

    select
        businessentityid,
        emailaddress,
        emailaddressid,
        modifieddate,
        rowguid

    from source

)

select * from renamed

