{{ config(materialized = 'table') }}
SELECT 
    COUNT(O_ORDERSTATUS) AS ORDERSTATUS_COUNT, 
	O_ORDERSTATUS 
FROM 
    {{ ref('silver_order') }}
GROUP BY 
  O_ORDERSTATUS;