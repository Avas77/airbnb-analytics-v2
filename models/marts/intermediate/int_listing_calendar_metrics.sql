with calendar as (
    select *
    from {{ ref('stg_calendar') }}
), 
listings as (
    select 
        listing_id,
        host_id
    from {{ ref('stg_listings') }}
),
joined as (
    select 
        calendar.calendar_date, -- This now matches your staging alias perfectly
        calendar.available,
        calendar.minimum_nights,
        listings.host_id,
        listings.listing_id
    from calendar 
    inner join listings on calendar.listing_id = listings.listing_id
),
aggregated as (
    select
        listing_id,
        host_id,
        count(case when available = 't' then 1 end) as available_days,
        count(case when available = 'f' then 1 end) as booked_days,
        count(*) as total_days,
        ROUND(
            COUNT(CASE WHEN available = 'f' THEN 1 END) * 100.0 / 
            NULLIF(COUNT(*), 0), 2
        ) AS occupancy_rate,
        round(avg(case when available = 't' then minimum_nights end), 2) as avg_minimum_nights_available,
        -- CRUCIAL: Raw sum of minimum nights for available days passed downstream
        sum(case when available = 't' then minimum_nights else 0 end) as sum_minimum_nights_available
    from joined
    group by listing_id, host_id
)

select * from aggregated

