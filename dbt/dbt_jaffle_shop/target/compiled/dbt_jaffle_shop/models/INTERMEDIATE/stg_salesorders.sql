SELECT 
    ro.id as order_id,
    ri.id as item_id,
    ro.customer as customer_id,
    ro.store_id,
    ri.sku as product_id,
    rp.price as subtotal,
    (rp.price * tax_rate) as tax_paid,
    rp.price + (rp.price * tax_rate) as order_total,
    TRY_CAST(ordered_at as TIMESTAMP) as ordered_date,
    ro._AIRBYTE_EXTRACTED_AT
FROM MDS_PROD.RAW.jaffle_orders as ro
JOIN MDS_PROD.RAW.jaffle_items as ri
ON ro.id = ri.order_id
LEFT JOIN MDS_PROD.RAW.jaffle_products as  rp
ON ri.sku =rp.sku
LEFT JOIN MDS_PROD.RAW.jaffle_stores as rs
ON ro.store_id =  rs.id