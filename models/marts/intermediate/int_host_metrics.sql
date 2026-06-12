with listings as (
    select *
    from {{ ref('stg_listings') }}
),
transformed as (
    select  
        host_id,
        count(*) as listing_count,
        avg(review_scores_rating) as avg_rating,
        avg(accommodates) as avg_accommodates
    from listings
    group by host_id
)

select * from transformed