with source as (

    select * from {{ source('raw_data', 'currencyrate') }}

),

renamed as (

    select
        averagerate,
        currencyratedate,
        currencyrateid,
        endofdayrate,
        fromcurrencycode,
        modifieddate,
        tocurrencycode

    from source

)

select * from renamed

