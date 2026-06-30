with listing as (
    select *
    from {{ ref('dim_listings') }}
),
review_metrics as (
    select *
    from {{ ref('int_listing_review_metrics') }}
), 
calendar_metrics as (
    select *
    from {{ ref('int_listing_calendar_metrics') }}
),
aggregated as (
    select
        listing.listing_id,
        listing.host_id,
        listing.listing_name,
        listing.room_type,
        listing.property_type,
        listing.neighborhood,
        review.avg_rating,
        review.review_count,
        calendar.available_days,
        calendar.booked_days,
        calendar.occupancy_rate
    from listing
    left join review_metrics as review 
        on review.listing_id = listing.listing_id
    left join calendar_metrics as calendar 
        on  calendar.listing_id = listing.listing_id
)

select * from aggregated