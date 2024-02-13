with source as (

    select * from {{ source('raw_data', 'contacttype') }}

),

renamed as (

    select
        contacttypeid,
        modifieddate,
        name

    from source

)

select * from renamed

