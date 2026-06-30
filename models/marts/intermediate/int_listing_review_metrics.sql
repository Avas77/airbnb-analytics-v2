with reviews as (
    select *
    from {{ ref('stg_reviews') }}
),
listings as (
    select *
    from {{ ref('stg_listings') }}
),
aggregated as (
    select 
        listings.listing_id,
        reviews.review_date,
        listings.review_scores_rating,
        listings.review_scores_cleanliness,
        listings.review_scores_accuracy,
        listings.review_scores_location,
        listings.review_scores_value
    from listings 
    left join reviews 
        on listings.listing_id = reviews.listing_id
),
transformed as (
    select 
        listing_id,
        count(*) as review_count,
        avg(review_scores_rating) as avg_rating,
        avg(review_scores_cleanliness) as avg_cleanliness,
        avg(review_scores_accuracy) as avg_accuracy,
        avg(review_scores_location) as avg_location,
        avg(review_scores_value) as avg_value,
        min(review_date) as first_review_date,
        max(review_date) as latest_review_date
    from aggregated
    group by listing_id
)

select * from transformed