with raw as (
    select * from {{ source('raw', 'LISTINGS') }}
),
transformed as (
    select
        id as listing_id,
        host_id,
        name as listing_name,
        neighbourhood_cleansed as neighbourhood,
        neighbourhood_group_cleansed as borough,
        property_type,
        room_type,
        accommodates,
        bedrooms,
        beds,
        bathrooms,
        latitude,
        longitude,
        price,
        minimum_nights,
        maximum_nights,
        number_of_reviews,
        review_scores_rating
    from raw
) 

select * from transformed

