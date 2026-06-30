with listings as (
    select *
    from {{ ref('stg_listings') }}
),
transformed as (
    select  
        host_id,
        count(*) as listing_count,
        max(homes_count) as entire_home_count,
        max(private_rooms_count) as private_room_count,
        max(shared_rooms_count) as shared_room_count,
        avg(accommodates) as avg_accommodates,
        avg(bedrooms) as avg_bedrooms,
        avg(beds) as avg_beds,
        avg(bathrooms) as avg_bathrooms,
        avg(minimum_nights) as minimum_nights_avg
    from listings
    group by host_id
)

select * from transformed