
  create or replace   view mds_prod.INTERMEDIATE.stg_customers
  
   as (
    SELECT 
ID as customer_id, 
NAME as customer_name,
_AIRBYTE_EXTRACTED_AT
FROM MDS_PROD.RAW.jaffle_customers
  );

