
    
    

select
    store_key as unique_field,
    count(*) as n_records

from mds_prod.CORE.dim_stores
where store_key is not null
group by store_key
having count(*) > 1


