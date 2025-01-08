
  create or replace   view mds_prod.INTERMEDIATE.stg_products
  
   as (
    SELECT
    SKU as product_id,
    NAME as product_name,
    PRODUCT_TYPE as product_type,
    PRICE as unit_price,
    DESCRIPTION as description,
    _AIRBYTE_EXTRACTED_AT
FROM MDS_PROD.RAW.jaffle_products
  );

