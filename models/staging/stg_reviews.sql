with raw as (
    select * from {{ source('raw', 'REVIEWS') }}
), 
transformed as (
    select
        "id" as review_id,
        "listing_id" as listing_id,
        "reviewer_id" as reviewer_id,
        "date" as review_date,
        "comments" as comments
    from raw
)

select * from transformed