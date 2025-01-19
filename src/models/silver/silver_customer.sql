{{ config(
    materialized = 'incremental',
    incremental_strategy='merge',
    skip_matched_step=true,
    on_schema_change='append_new_columns',
    unique_key='C_CUSTKEY',
    liquid_clustered_by='C_CUSTKEY'    
  )
}}
SELECT 
    C_CUSTKEY,
    C_NAME, 
    C_ADDRESS, 
    C_NATIONKEY, 
    C_PHONE, 
    C_ACCTBAL,
    C_MKTSEGMENT,     
    CREATED_AT
FROM 
  {{ source('source_db', 'bronze_customer') }}
WHERE 
  C_CUSTKEY IS NOT NULL
  AND 
  C_NATIONKEY != 21