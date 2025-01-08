SELECT
    md5(cast(coalesce(cast(orders.order_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(orders.item_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as order_key,
    md5(cast(coalesce(cast(customer_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customer_key,
    md5(cast(coalesce(cast(store_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as store_key,
    md5(cast(coalesce(cast(product_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as product_key,
    TRY_CAST(CONCAT(LEFT(ordered_date, 4), SUBSTR(ordered_date, 9,2)) AS INTEGER) AS date_key,
    TRY_CAST(CONCAT(LEFT(ordered_date, 4), SUBSTR(ordered_date, 6,2)) AS INTEGER) AS month_key, --New change
    orders.order_id as salesorderid,
    item_id as salesitemid,
    subtotal,
    tax_paid, --as tax,
    order_total,
    ordered_date
FROM mds_prod.INTERMEDIATE.stg_salesorders as orders
/* INNER JOIN mds_prod.INTERMEDIATE.stg_items as items
ON orders.order_id = items.order_id*/