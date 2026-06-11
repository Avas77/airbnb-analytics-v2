with raw as (
    select * from {{ source('raw','CALENDAR') }}
),
transformed as (
    select
        "listing_id"      as listing_id,
        "date"            as calendar_date,
        "available"       as available,
        "price"           as price,
        "adjusted_price"  as adjusted_price,
        "minimum_nights"  as minimum_nights,
        "maximum_nights"  as maximum_nights
    from raw
)

select * from transformed