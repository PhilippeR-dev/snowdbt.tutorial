with source as (

    select * from {{ source('raw_data', 'productreview') }}

),

renamed as (

    select
        comments,
        emailaddress,
        modifieddate,
        productid,
        productreviewid,
        rating,
        reviewdate,
        reviewername

    from source

)

select * from renamed

