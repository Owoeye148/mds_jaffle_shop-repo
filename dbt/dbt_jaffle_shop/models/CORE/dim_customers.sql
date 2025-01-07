
SELECT 
{{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
customer_id, 
customer_name,
_AIRBYTE_EXTRACTED_AT
FROM {{ref('stg_customers')}}