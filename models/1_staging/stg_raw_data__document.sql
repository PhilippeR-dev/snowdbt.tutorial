with source as (

    select * from {{ source('raw_data', 'document') }}

),

renamed as (

    select
        changenumber,
        document,
        documentlevel,
        documentnode,
        documentsummary,
        fileextension,
        filename,
        folderflag,
        modifieddate,
        owner,
        revision,
        status,
        title,
        rowguid

    from source

)

select * from renamed

