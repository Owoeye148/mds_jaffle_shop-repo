SELECT
    md5(cast(coalesce(cast(store_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as store_key,
    *
FROM mds_prod.INTERMEDIATE.stg_stores