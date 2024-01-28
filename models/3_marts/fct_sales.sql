--depends_on: {{  ref( 'dim_product' )  }}
--depends_on: {{  ref( 'dim_customer' )  }}
--depends_on: {{  ref( 'dim_territory' )  }}
--depends_on: {{  ref( 'dim_date' )  }}
--depends_on: {{  ref( 'dim_orderstatus' )  }}

select
    {{ dbt_utils.generate_surrogate_key(['stg_raw_data__salesorderdetail.salesorderid', 'salesorderdetailid']) }} as sales_key,
    {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_key, -- dim_product
    {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_key, -- dim_customer
    {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} as creditcard_key, -- ? Sales.CreditCard Credit card identification number. Foreign key to CreditCard.CreditCardID.?
    {{ dbt_utils.generate_surrogate_key(['shiptoaddressid']) }} as ship_address_key, -- ? Person.Address Customer shipping address. Foreign key to Address.AddressID. ?
    {{ dbt_utils.generate_surrogate_key(['status']) }} as order_status_key, -- dim_orderstatus
    {{ dbt_utils.generate_surrogate_key(['orderdate']) }} as order_date_key,
    {{ dbt_utils.generate_surrogate_key(['shipdate']) }} as ship_date_key,
    {{ dbt_utils.generate_surrogate_key(['duedate']) }} as due_date_key,
    {{ dbt_utils.generate_surrogate_key(['territoryid']) }} as territory_key, -- dim_territory
    {{ dbt_utils.ge}}
    orderdate,
    onlineorderflag,
    stg_raw_data__salesorderdetail.unitpricediscount as unitpricediscount,
    int_salesorderheader.salesordernumber,
	stg_raw_data__salesorderdetail.salesorderid,
    stg_raw_data__salesorderdetail.salesorderdetailid,
    stg_raw_data__salesorderdetail.unitprice,
    stg_raw_data__salesorderdetail.orderqty,
    stg_raw_data__salesorderdetail.linetotal as revenue,
    stg_raw_data__salesorderdetail.linetotal as salesamount,
    case when stg_raw_data__salesorderdetail.unitpricediscount > 0
        then stg_raw_data__salesorderdetail.linetotal * stg_raw_data__salesorderdetail.unitpricediscount 
        else stg_raw_data__salesorderdetail.linetotal
        end as totaldiscount,
    int_salesorderheader.taxamt 
from {{ ref("stg_raw_data__salesorderdetail") }}
inner join  {{ ref("int_salesorderheader") }} on stg_raw_data__salesorderdetail.salesorderid = int_salesorderheader.salesorderid