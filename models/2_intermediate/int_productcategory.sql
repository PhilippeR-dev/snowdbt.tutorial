with productcategory as (
    select *  from {{ ref("stg_raw_data__productcategory") }}
)
select
     ProductCategoryID
    ,cast(Name as varchar(50)) AS ProductCategory
    ,rowguid
    ,ModifiedDate
from productcategory
