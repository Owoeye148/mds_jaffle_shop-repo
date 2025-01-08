
  create or replace   view mds_prod.INTERMEDIATE.stg_items
  
   as (
    SELECT
    ID as item_id,
    SKU as product_id,
    order_id,
    _AIRBYTE_EXTRACTED_AT
FROM MDS_PROD.RAW.jaffle_items
  );

