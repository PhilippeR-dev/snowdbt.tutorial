with source as (

    select * from {{ source('raw_data', 'employee') }}

),

renamed as (

    select
        birthdate,
        businessentityid,
        currentflag,
        gender,
        hiredate,
        jobtitle,
        loginid,
        maritalstatus,
        modifieddate,
        nationalidnumber,
        organizationlevel,
        organizationnode,
        salariedflag,
        sickleavehours,
        vacationhours,
        rowguid

    from source

)

select * from renamed

