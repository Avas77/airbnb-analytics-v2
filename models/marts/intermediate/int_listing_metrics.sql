with listings as (
    select *
    from {{ ref('stg_listings') }}
),
transformed as (
    select
        listing_id,
        host_id,
        listing_name,
        neighbourhood,
        borough,
        property_type,
        room_type,
        accommodates,
        bedrooms,
        beds,
        number_of_reviews,
        review_scores_rating,
        case
            when review_scores_rating >= 4.8 then 'Excellent'
            when review_scores_rating >= 4.5 then 'Good'
            when review_scores_rating >= 4.0 then 'Average'
            else 'Needs Improvement'
        end as rating_category
    from listings
)

select * from transformed