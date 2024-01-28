with source as (

    select * from {{ source('raw_data', 'illustration') }}

),

renamed as (

    select
        diagram,
        illustrationid,
        modifieddate

    from source

)

select * from renamed

