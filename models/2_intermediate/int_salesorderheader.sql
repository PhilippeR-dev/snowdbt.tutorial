WITH salesorderheader AS (
  SELECT  *  FROM {{ ref("stg_raw_data__salesorderheader") }}
)
SELECT
     SalesOrderID
    ,RevisionNumber
    ,OrderDate
    ,DueDate
    ,ShipDate
    ,Status
    ,case when OnlineOrderFlag = 1 
        then 'Y'
        else 'N'
     end as OnlineOrderFlag
    ,SalesOrderNumber
    ,cast(PurchaseOrderNumber as varchar(25)) as PurchaseOrderNumber
    ,cast(AccountNumber as varchar(15)) as AccountNumber
    ,CustomerID
    ,SalesPersonID
    ,TerritoryID
    ,BillToAddressID
    ,ShipToAddressID
    ,ShipMethodID
    ,CreditCardID
    ,CreditCardApprovalCode
    ,CurrencyRateID
    ,SubTotal
    ,TaxAmt
    ,Freight
    ,TotalDue
    ,Comment
    ,rowguid
    ,ModifiedDate
FROM salesorderheader