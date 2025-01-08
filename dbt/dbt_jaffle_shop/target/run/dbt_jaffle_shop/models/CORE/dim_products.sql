
  
    

        create or replace  table mds_prod.CORE.dim_products
         as
        (SELECT
    md5(cast(coalesce(cast(product_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as product_key,
    *
FROM mds_prod.INTERMEDIATE.stg_products
        );
      
  