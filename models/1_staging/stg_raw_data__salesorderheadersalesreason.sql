with source as (

    select * from {{ source('raw_data', 'salesorderheadersalesreason') }}

),

renamed as (

    select
        modifieddate,
        salesorderid,
        salesreasonid

    from source

)

select * from renamed

