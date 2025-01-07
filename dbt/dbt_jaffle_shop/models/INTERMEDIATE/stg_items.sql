
SELECT
    ID as item_id,
    SKU as product_id,
    order_id,
    _AIRBYTE_EXTRACTED_AT
FROM {{ source('jaffle_shop', 'jaffle_items') }}