select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select store_key as from_field
    from mds_prod.CORE.fact_orders
    where store_key is not null
),

parent as (
    select store_key as to_field
    from mds_prod.CORE.dim_stores
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test