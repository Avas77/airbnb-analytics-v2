with listing_calendar_metrics as (
    select *
    from {{ ref('int_listing_calendar_metrics') }}
), 
transformed as (
    select
        host_id,
    sum(available_days) as available_days,
    sum(booked_days) as booked_days,
    sum(total_days) as total_days,

    -- Host-level occupancy (Correctly rolled up)
    round(
        sum(booked_days) * 100.0 / 
        nullif(sum(total_days), 0), 2
    ) as occupancy_rate,

    -- Host-level average (Mathematically correct weighted average)
    round(
        sum(sum_minimum_nights_available) * 1.0 / 
        nullif(sum(available_days), 0), 2
    ) as avg_minimum_nights_available
    from listing_calendar_metrics
    group by host_id
)

select * from transformed