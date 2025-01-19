{{ config(
    materialized = 'incremental',
    incremental_strategy='merge',
    skip_matched_step=true,
    on_schema_change='append_new_columns',
    unique_key=['O_ORDERKEY'],
    liquid_clustered_by='O_ORDERKEY'
  )
}}
SELECT 
  * 
FROM 
  {{ source('source_db', 'bronze_order') }}
WHERE 
  O_ORDERKEY IS NOT NULL
  AND 
  O_ORDER_DATE >= date '1990-01-01'