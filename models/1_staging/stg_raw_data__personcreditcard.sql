with source as (

    select * from {{ source('raw_data', 'personcreditcard') }}

),

renamed as (

    select
        businessentityid,
        creditcardid,
        modifieddate

    from source

)

select * from renamed

