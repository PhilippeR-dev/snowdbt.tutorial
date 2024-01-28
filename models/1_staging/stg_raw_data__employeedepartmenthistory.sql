with source as (

    select * from {{ source('raw_data', 'employeedepartmenthistory') }}

),

renamed as (

    select
        businessentityid,
        departmentid,
        enddate,
        modifieddate,
        shiftid,
        startdate

    from source

)

select * from renamed

