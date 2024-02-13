with source as (

    select * from {{ source('raw_data', 'shift') }}

),

renamed as (

    select
        endtime,
        modifieddate,
        name,
        shiftid,
        starttime

    from source

)

select * from renamed

