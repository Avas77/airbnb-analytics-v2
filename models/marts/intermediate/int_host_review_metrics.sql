with listings as (
    select *
    from {{ ref('stg_listings') }}
), 
transformed as (
    select 
        host_id,
        avg(review_scores_rating) as avg_rating,
        avg(review_scores_accuracy) as avg_accuracy,
        avg(review_scores_cleanliness) as avg_cleanliness,
        avg(review_scores_checkin) as avg_checkin,
        avg(review_scores_communication) as avg_communication,
        avg(review_scores_location) as avg_location,
        avg(review_scores_value) as avg_value,
        sum(number_of_reviews) as review_count  
    from listings
    group by host_id
)

select * from transformed