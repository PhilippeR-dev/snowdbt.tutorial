with source as (

    select * from {{ source('raw_data', 'store') }}

),

renamed as (

    select
        businessentityid,
        demographics,
        modifieddate,
        name,
        salespersonid,
        rowguid

    from source

)

select * from renamed

