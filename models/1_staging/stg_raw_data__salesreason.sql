with source as (

    select * from {{ source('raw_data', 'salesreason') }}

),

renamed as (

    select
        modifieddate,
        name,
        reasontype,
        salesreasonid

    from source

)

select * from renamed

