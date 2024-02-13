with source as (

    select * from {{ source('raw_data', 'personphone') }}

),

renamed as (

    select
        businessentityid,
        modifieddate,
        phonenumber,
        phonenumbertypeid

    from source

)

select * from renamed

