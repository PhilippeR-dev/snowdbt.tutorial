with source as (

    select * from {{ source('raw_data', 'vendor') }}

),

renamed as (

    select
        accountnumber,
        activeflag,
        businessentityid,
        creditrating,
        modifieddate,
        name,
        preferredvendorstatus,
        purchasingwebserviceurl

    from source

)

select * from renamed

