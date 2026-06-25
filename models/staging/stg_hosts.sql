with raw as (
    select * 
    from {{ source('raw', 'LISTINGS') }}
),
transformed as (
    select
        host_id,
        host_name,
        host_location,
        host_is_superhost,
        host_identity_verified,
        sum(host_listings_count) as total_listings_count
    from raw
    group by 1,2,3,4,5
)

select * from transformed