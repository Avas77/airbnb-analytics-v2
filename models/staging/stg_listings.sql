with raw as (
    select * from {{ source('raw', 'LISTINGS') }}
),
transformed as (
    select
        id as "LISTING_ID",
        host_id as "HOST_ID",
        name as "LISTING_NAME",
        neighbourhood_cleansed as "NEIGHBOURHOOD",
        neighbourhood_group_cleansed as "BOROUGH",
        property_type as "PROPERTY_TYPE",
        room_type as "ROOM_TYPE",
        accommodates as "ACCOMMODATES",
        bedrooms as "BEDROOMS",
        beds as "BEDS",
        bathrooms as "BATHROOMS",
        latitude as "LATITUDE",
        longitude as "LONGITUDE",
        price as "PRICE",
        minimum_nights as "MINIMUM_NIGHTS",
        maximum_nights as "MAXIMUM_NIGHTS",
        number_of_reviews as "NUMBER_OF_REVIEWS",
        review_scores_rating as "REVIEW_SCORES_RATING"
    from raw
) 

select * from transformed

