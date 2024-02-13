with source as (

    select * from {{ source('raw_data', 'employeepayhistory') }}

),

renamed as (

    select
        businessentityid,
        modifieddate,
        payfrequency,
        rate,
        ratechangedate

    from source

)

select * from renamed

