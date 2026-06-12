with listings as (
    select *
    from {{ ref('stg_listings') }}
),
listings_info as (
    select
        listing_id,
        host_id,
        listing_name,
        neighbourhood as neighborhood,
        borough,
        property_type,
        room_type,
        accommodates,
        bedrooms,
        beds,
        review_scores_rating
    from listings
)
select * from listings_info