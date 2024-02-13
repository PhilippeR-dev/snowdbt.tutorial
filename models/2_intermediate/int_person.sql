with person as (
    select *  from {{ ref("stg_raw_data__person") }}
)
select
     BusinessEntityID
    ,PersonType
    ,NameStyle
    ,Title
    ,cast(FirstName as varchar(50)) AS FirstName
    ,cast(MiddleName as varchar(50)) AS MiddleName
    ,cast(LastName as varchar(50)) AS LastName
    ,Suffix
    ,EmailPromotion
    ,rowguid
    ,ModifiedDate
    ,Demographics
    ,PARSE_XML(Demographics) AS Demographics_xml
    ,LEFT(GET(XMLGET(Demographics_xml, 'BirthDate'),'$'),10)::TIMESTAMP AS BirthDate
    ,GET(XMLGET(Demographics_xml, 'MaritalStatus'),'$')::VARCHAR(1) AS MaritalStatus
    ,GET(XMLGET(Demographics_xml, 'Gender'),'$')::VARCHAR(1) AS Gender
    ,GET(XMLGET(Demographics_xml, 'TotalChildren'),'$')::DECIMAL AS TotalChildren
    ,GET(XMLGET(Demographics_xml, 'NumberChildrenAtHome'),'$')::DECIMAL AS NumberChildrenAtHome
    ,GET(XMLGET(Demographics_xml, 'HomeOwnerFlag'),'$')::VARCHAR(1) AS HouseOwnerFlag
    ,GET(XMLGET(Demographics_xml, 'NumberCarsOwned'),'$')::DECIMAL AS NumberCarsOwned
    ,LEFT(GET(XMLGET(Demographics_xml, 'DateFirstPurchase'),'$'),10)::TIMESTAMP  AS DateFirstPurchase
    ,GET(XMLGET(Demographics_xml, 'CommuteDistance',0),'$')::VARCHAR(15) AS CommuteDistance
    ,GET(XMLGET(Demographics_xml, 'Education',0),'$')::VARCHAR(40) AS Education
    ,GET(XMLGET(Demographics_xml, 'Occupation',0),'$')::VARCHAR(40) AS Occupation
from person
