with source as (

    select * from {{ source('raw_data', 'productphoto') }}

),

renamed as (

    select
        largephoto,
        largephotofilename,
        modifieddate,
        productphotoid,
        thumbnailphoto,
        thumbnailphotofilename

    from source

)

select * from renamed

