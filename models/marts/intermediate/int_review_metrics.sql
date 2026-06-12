with reviews as (
    select *
    from {{ ref('stg_reviews') }}
),
transformed as (
    select 
        listing_id,
        count(*) as total_reviews,
        min(review_date) as earliest_review_date,
        max(review_date) as latest_review_date
    from reviews
    group by listing_id
)

select * from transformed