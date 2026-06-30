with raw as (
    select * from {{ source('raw', 'LISTINGS') }}
),
transformed as (
    select
        "id" as listing_id,
        "host_id" as host_id,
        "name" as listing_name,
        "neighbourhood_cleansed" as neighbourhood,
        "neighbourhood_group_cleansed" as borough,
        "property_type" as property_type,
        "room_type" as room_type,
        "accommodates" as accommodates,
        "bedrooms" as bedrooms,
        "beds" as beds,
        "bathrooms" as bathrooms,
        "latitude" as latitude,
        "longitude" as longitude,
        "price" as price,
        "minimum_nights" as minimum_nights,
        "maximum_nights" as maximum_nights,
        "number_of_reviews" as number_of_reviews,
        "review_scores_rating" as review_scores_rating,
        "review_scores_accuracy" as review_scores_accuracy,
        "review_scores_cleanliness" as review_scores_cleanliness,
        "review_scores_checkin" as review_scores_checkin,
        "review_scores_communication" as review_scores_communication,
        "review_scores_location" as review_scores_location,
        "review_scores_value" as review_scores_value,
        "calculated_host_listings_count_entire_homes" as homes_count,
        "calculated_host_listings_count_private_rooms" as private_rooms_count,
        "calculated_host_listings_count_shared_rooms" as shared_rooms_count
    from raw
) 

select * from transformed