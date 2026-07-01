with listings as (
    select *
    from {{ ref('mart_listings_360') }}
),
neighborhood_summary as (
    select
        neighborhood,
        count(distinct listing_id) as listings_count,
        count(distinct host_id) as host_count,
        avg(avg_rating) as avg_rating,
        sum(review_count) as review_count
    from listings
    group by neighborhood   
)

select * from neighborhood_summary