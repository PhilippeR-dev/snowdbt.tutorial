with source as (

    select * from {{ source('raw_data', 'password') }}

),

renamed as (

    select
        businessentityid,
        modifieddate,
        passwordhash,
        passwordsalt,
        rowguid

    from source

)

select * from renamed

