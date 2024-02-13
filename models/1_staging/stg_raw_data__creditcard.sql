with source as (

    select * from {{ source('raw_data', 'creditcard') }}

),

renamed as (

    select
        cardnumber,
        cardtype,
        creditcardid,
        expmonth,
        expyear,
        modifieddate

    from source

)

select * from renamed

