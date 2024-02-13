
with source as (

    select * from {{ source('raw_data', 'addresstype') }}

),

renamed as (

    select
        addresstypeid,
        modifieddate,
        name,
        rowguid

    from source

)

select * from renamed

