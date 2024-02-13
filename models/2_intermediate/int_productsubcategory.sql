with productsubcategory as (
    select *  from {{ ref("stg_raw_data__productsubcategory") }}
)
select
     ProductSubcategoryID
    ,ProductCategoryID
    ,cast(Name as varchar(50)) AS ProductSubCategory
    ,rowguid
    ,ModifiedDate
from productsubcategory
