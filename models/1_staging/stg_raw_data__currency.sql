with source as (

    select * from {{ source('raw_data', 'currency') }}

),

renamed as (

    select
        currencycode,
        modifieddate,
        name

    from source

)

select * from renamed

