SELECT
    ID store_id,
    NAME as store_name,
    tax_rate,
    CAST(opened_at as DATE) as opened_at,
    _AIRBYTE_EXTRACTED_AT
FROM MDS_PROD.RAW.jaffle_stores