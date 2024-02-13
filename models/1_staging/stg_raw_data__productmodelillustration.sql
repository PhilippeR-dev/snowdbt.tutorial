with source as (

    select * from {{ source('raw_data', 'productmodelillustration') }}

),

renamed as (

    select
        illustrationid,
        modifieddate,
        productmodelid

    from source

)

select * from renamed

