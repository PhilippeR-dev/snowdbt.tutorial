
with source as (

    select * from {{ source('raw_data', 'billofmaterials') }}

),

renamed as (

    select
        bomlevel,
        billofmaterialsid,
        componentid,
        enddate,
        modifieddate,
        perassemblyqty,
        productassemblyid,
        startdate,
        unitmeasurecode

    from source

)

select * from renamed

