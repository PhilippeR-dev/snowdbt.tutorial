with source as (

    select * from {{ source('raw_data', 'specialoffer') }}

),

renamed as (

    select
        category,
        description,
        discountpct,
        enddate,
        maxqty,
        minqty,
        modifieddate,
        specialofferid,
        startdate,
        type,
        rowguid

    from source

)

select * from renamed

