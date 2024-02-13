WITH countryregion AS (
  SELECT * FROM {{ ref('stg_raw_data__countryregion') }}
)
SELECT
  countryregioncode,
  CAST(name AS VARCHAR(50)) AS countryregionname,
  modifieddate
FROM countryregion