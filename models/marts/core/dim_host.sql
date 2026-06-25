with hosts as (
    select * 
    from {{ ref('stg_hosts') }}
)

select * from hosts
