with source as (

    select * from {{ source('raw_data', 'scrapreason') }}

),

renamed as (

    select
        modifieddate,
        name,
        scrapreasonid

    from source

)

select * from renamed

