
SELECT
    {{ dbt_utils.generate_surrogate_key(['orders.order_id', 'orders.item_id']) }} as order_key,
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['store_id']) }} as store_key,
    {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_key,
    TRY_CAST(CONCAT(LEFT(ordered_date, 4), SUBSTR(ordered_date, 9,2)) AS INTEGER) AS date_key,
    TRY_CAST(CONCAT(LEFT(ordered_date, 4), SUBSTR(ordered_date, 6,2)) AS INTEGER) AS month_key, --New change
    orders.order_id as salesorderid,
    item_id as salesitemid,
    subtotal,
    tax_paid, --as tax,
    order_total,
    ordered_date
FROM {{ ref('stg_salesorders') }} as orders
/* INNER JOIN {{ ref('stg_items') }} as items
ON orders.order_id = items.order_id*/