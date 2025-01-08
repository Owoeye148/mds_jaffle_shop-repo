
  
    

        create or replace  table mds_prod.CORE.dim_date
         as
        (SELECT
    TRY_CAST(CONCAT(LEFT(DATE_DAY, 4), SUBSTR(DATE_DAY, 6,2), SUBSTR(DATE_DAY, 9,2)) AS INTEGER) AS date_key,
    *
FROM mds_prod.raw.dates
        );
      
  