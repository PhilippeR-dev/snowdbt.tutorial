with source as (

    select * from {{ source('raw_data', 'person') }}

),

renamed as (

    select
        additionalcontactinfo,
        businessentityid,
        demographics,
        emailpromotion,
        firstname,
        lastname,
        middlename,
        modifieddate,
        namestyle,
        persontype,
        suffix,
        title,
        rowguid

    from source

)

select * from renamed

