WITH salesterritory AS (
  SELECT * FROM {{ ref("stg_raw_data__salesterritory") }} 
)
SELECT
     TerritoryID
    ,cast(Name as varchar(50)) AS SalesTerritoryName
    ,CountryRegionCode
    ,"GROUP"
    ,SalesYTD
    ,SalesLastYear
    ,CostYTD
    ,CostLastYear
    ,rowguid
    ,ModifiedDate
FROM salesterritory