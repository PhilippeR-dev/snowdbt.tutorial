with source as (

    select * from {{ source('raw_data', 'salestaxrate') }}

),

renamed as (

    select
        modifieddate,
        name,
        salestaxrateid,
        stateprovinceid,
        taxrate,
        taxtype,
        rowguid

    from source

)

select * from renamed

