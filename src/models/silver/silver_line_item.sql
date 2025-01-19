{{ config(
    materialized = 'incremental',
    incremental_strategy='merge',
    skip_matched_step=true,
    on_schema_change='append_new_columns',
    unique_key=['L_ORDERKEY', 'L_PARTKEY', 'L_LINENUMBER'],
    liquid_clustered_by='L_ORDERKEY'    
  )
}}
SELECT 
   L_ORDERKEY, 
   L_PARTKEY,
   L_SUPPKEY,
   L_LINENUMBER, 
   L_QUANTITY, 
   L_EXTENDEDPRICE, 
   L_DISCOUNT, 
   L_TAX, 
   L_RETURNFLAG, 
   L_LINESTATUS,
   L_SHIPDATE,
   L_SHIPMODE,
   CREATED_AT
FROM 
  {{ source('source_db', 'bronze_line_item') }} 
WHERE 
  L_ORDERKEY IS NOT NULL
  AND L_SHIPDATE >= date '1990-01-01'