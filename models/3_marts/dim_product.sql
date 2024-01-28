select
    {{ dbt_utils.generate_surrogate_key(['int_product.productid']) }} as product_key,
    int_product.productid,
    int_product.productname as product_name,
    int_product.productnumber,
    int_product.color,
    int_product.daystomanufacture,
	int_product.safetystocklevel,
    int_product.standardcost,
    int_productsubcategory.productsubcategory as product_subcategory_name,
    int_productcategory.productcategory as product_category_name,
    int_product.sellstartdate,
    int_product.sellenddate
from  {{ ref('int_product') }}
left join  {{ ref('int_productsubcategory') }} on int_product.productsubcategoryid = int_productsubcategory.productsubcategoryid
left join  {{ ref('int_productcategory') }} on int_productsubcategory.productcategoryid = int_productcategory.productcategoryid