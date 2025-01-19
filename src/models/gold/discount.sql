{{ config(materialized = 'table') }}
SELECT 
  o.O_ORDERKEY,
	o.O_TOTALPRICE, 
	l.L_ORDERKEY, 
	l.L_DISCOUNT, 
	CASE WHEN (l.L_DISCOUNT >= 0.06) then 
        'discounted' ELSE 
        'not_discounted'
    END AS Discount
FROM 
  {{ ref('silver_order') }} AS o
LEFT JOIN 
  {{ ref('silver_line_item') }} as l
ON o.O_ORDERKEY = l.L_ORDERKEY;