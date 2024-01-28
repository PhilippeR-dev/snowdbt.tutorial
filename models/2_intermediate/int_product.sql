with product as (
    select * from {{ ref("stg_raw_data__product") }}
)
select
     ProductID
    ,cast(Name as varchar(50)) AS ProductName
    ,ProductNumber
    ,MakeFlag
    ,FinishedGoodsFlag
    ,Color
    ,SafetyStockLevel
    ,ReorderPoint
    ,StandardCost
    ,ListPrice
    ,Size
    ,SizeUnitMeasureCode
    ,WeightUnitMeasureCode
    ,Weight
    ,DaysToManufacture
    ,ProductLine
    ,Class
    ,Style
    ,ProductSubcategoryID
    ,ProductModelID
    ,SellStartDate
    ,SellEndDate
    ,DiscontinuedDate
    ,rowguid
    ,ModifiedDate
from product
