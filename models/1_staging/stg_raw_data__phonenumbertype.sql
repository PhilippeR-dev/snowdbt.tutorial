with source as (

    select * from {{ source('raw_data', 'phonenumbertype') }}

),

renamed as (

    select
        modifieddate,
        name,
        phonenumbertypeid

    from source

)

select * from renamed

