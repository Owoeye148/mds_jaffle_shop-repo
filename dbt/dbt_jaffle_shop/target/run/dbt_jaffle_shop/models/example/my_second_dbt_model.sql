
  create or replace   view mds_prod.raw.my_second_dbt_model
  
   as (
    -- Use the `ref` function to select from other models

select *
from mds_prod.raw.my_first_dbt_model
where id = 1
  );

