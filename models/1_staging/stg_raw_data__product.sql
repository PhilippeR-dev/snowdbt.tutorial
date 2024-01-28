with source as (

    select * from {{ source('raw_data', 'product') }}

),

renamed as (

    select
        class,
        color,
        daystomanufacture,
        discontinueddate,
        finishedgoodsflag,
        listprice,
        makeflag,
        modifieddate,
        name,
        productid,
        productline,
        productmodelid,
        productnumber,
        productsubcategoryid,
        reorderpoint,
        safetystocklevel,
        sellenddate,
        sellstartdate,
        size,
        sizeunitmeasurecode,
        standardcost,
        style,
        weight,
        weightunitmeasurecode,
        rowguid

    from source

)

select * from renamed

