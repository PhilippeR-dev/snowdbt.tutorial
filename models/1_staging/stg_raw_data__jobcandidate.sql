with source as (

    select * from {{ source('raw_data', 'jobcandidate') }}

),

renamed as (

    select
        businessentityid,
        jobcandidateid,
        modifieddate,
        resume

    from source

)

select * from renamed

