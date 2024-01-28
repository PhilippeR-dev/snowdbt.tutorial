with source as (

    select * from {{ source('raw_data', 'businessentitycontact') }}

),

renamed as (

    select
        businessentityid,
        contacttypeid,
        modifieddate,
        personid,
        rowguid

    from source

)

select * from renamed

