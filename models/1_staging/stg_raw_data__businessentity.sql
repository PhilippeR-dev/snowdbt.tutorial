with source as (

    select * from {{ source('raw_data', 'businessentity') }}

),

renamed as (

    select
        businessentityid,
        modifieddate,
        rowguid

    from source

)

select * from renamed

