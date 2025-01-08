
  
    

        create or replace  table mds_prod.CORE.dim_customers
         as
        (SELECT 
md5(cast(coalesce(cast(customer_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customer_key,
customer_id, 
customer_name,
_AIRBYTE_EXTRACTED_AT
FROM mds_prod.INTERMEDIATE.stg_customers
        );
      
  