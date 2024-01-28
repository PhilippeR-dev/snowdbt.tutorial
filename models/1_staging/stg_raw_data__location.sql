with source as (

    select * from {{ source('raw_data', 'location') }}

),

renamed as (

    select
        availability,
        costrate,
        locationid,
        modifieddate,
        name

    from source

)

select * from renamed

