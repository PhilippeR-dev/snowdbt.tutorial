with source as (

    select * from {{ source('raw_data', 'workorderrouting') }}

),

renamed as (

    select
        actualcost,
        actualenddate,
        actualresourcehrs,
        actualstartdate,
        locationid,
        modifieddate,
        operationsequence,
        plannedcost,
        productid,
        scheduledenddate,
        scheduledstartdate,
        workorderid

    from source

)

select * from renamed

