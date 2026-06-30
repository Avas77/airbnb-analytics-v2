with raw as (
    select * from {{ source('raw', 'LISTINGS') }}
),

transformed as (
    select
        "host_id" as host_id,
        "host_name" as host_name,
        "host_location" as host_location,
        "host_is_superhost" as host_is_superhost,
        "host_identity_verified" as host_identity_verified,
        sum("host_listings_count") as total_listings_count
    from raw
    group by all -- Automatically groups by columns 1 through 8
)

select * from transformed