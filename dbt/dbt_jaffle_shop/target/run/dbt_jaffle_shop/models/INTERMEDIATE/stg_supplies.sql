
  create or replace   view mds_prod.INTERMEDIATE.stg_supplies
  
   as (
    SELECT
    ID as supplies_id,
    SKU as product_id,
    cost,
    NAME as supplies_name,
    perishable,
    _AIRBYTE_EXTRACTED_AT
FROM MDS_PROD.RAW.jaffle_supplies
  );

