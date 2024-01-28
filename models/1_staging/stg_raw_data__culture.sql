with source as (

    select * from {{ source('raw_data', 'culture') }}

),

renamed as (

    select
        cultureid,
        modifieddate,
        name

    from source

)

select * from renamed

