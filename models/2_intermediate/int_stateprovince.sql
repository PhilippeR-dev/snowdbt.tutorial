WITH stateprovince AS (
  SELECT * FROM {{ ref("stg_raw_data__stateprovince") }} 
)
SELECT
     StateProvinceID
    ,StateProvinceCode
    ,CountryRegionCode
    ,IsOnlyStateProvinceFlag
    ,cast(Name as varchar(50)) AS StatProvinceName
    ,TerritoryID
    ,rowguid
    ,ModifiedDate
FROM stateprovince