with host as (

    select *
    from {{ ref('dim_host') }}

),

listing_metrics as (

    select *
    from {{ ref('int_host_listing_metrics') }}

),

review_metrics as (

    select *
    from {{ ref('int_host_review_metrics') }}

),

calendar_metrics as (

    select *
    from {{ ref('int_host_calendar_metrics') }}

)

select

    -- Identity
    host.host_id,
    host.host_name,
    host.host_location,
    host.host_is_superhost,
    host.host_identity_verified,

    -- Portfolio
    listing_metrics.listing_count,
    listing_metrics.avg_accommodates,
    listing_metrics.avg_bedrooms,
    listing_metrics.avg_bathrooms,

    -- Quality
    review_metrics.avg_rating,
    review_metrics.avg_cleanliness,
    review_metrics.avg_accuracy,
    review_metrics.avg_location,
    review_metrics.avg_value,
    review_metrics.review_count,

    -- Availability
    calendar_metrics.available_days,
    calendar_metrics.booked_days,
    calendar_metrics.avg_minimum_nights_available,
    calendar_metrics.occupancy_rate

from host

left join listing_metrics
    on host.host_id = listing_metrics.host_id

left join review_metrics
    on host.host_id = review_metrics.host_id

left join calendar_metrics
    on host.host_id = calendar_metrics.host_id