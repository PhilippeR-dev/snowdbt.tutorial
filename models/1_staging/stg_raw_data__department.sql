with source as (

    select * from {{ source('raw_data', 'department') }}

),

renamed as (

    select
        departmentid,
        groupname,
        modifieddate,
        name

    from source

)

select * from renamed

