with source as (

    select * from {{ source('raw_data', 'unitmeasure') }}

),

renamed as (

    select
        modifieddate,
        name,
        unitmeasurecode

    from source

)

select * from renamed

