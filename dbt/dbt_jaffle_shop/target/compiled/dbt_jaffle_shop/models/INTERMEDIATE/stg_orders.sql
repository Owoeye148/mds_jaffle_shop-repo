SELECT
    ID as order_id,
    customer as customer_id,
    store_id,
    subtotal,
    tax_paid,
    order_total,
    TRY_CAST(ordered_at as TIMESTAMP) as ordered_date
FROM MDS_PROD.RAW.jaffle_orders