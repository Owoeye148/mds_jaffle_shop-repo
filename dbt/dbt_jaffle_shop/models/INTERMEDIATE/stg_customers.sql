

SELECT 
ID as customer_id, 
NAME as customer_name,
_AIRBYTE_EXTRACTED_AT
FROM {{source('jaffle_shop', 'jaffle_customers')}}