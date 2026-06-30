with listing_dim as (
    select *
    from {{ ref('dim_listings') }}
),
review_metrics as (
    select *
    from {{ ref('int_listing_review_metrics') }}
),
listings_popularity as (
    select
        listing_dim.listing_id,
        listing_dim.host_id,
        listing_dim.listing_name,
        listing_dim.neighborhood,
        listing_dim.borough,
        listing_dim.property_type,
        listing_dim.room_type,
        review_metrics.review_count,
        review_metrics.first_review_date,
        review_metrics.latest_review_date
    from listing_dim
    left join review_metrics
        on listing_dim.listing_id = review_metrics.listing_id
)

select * from listings_popularity