

{{
    config (
        materialized = 'table'
    )
}}


with source as (

    select
        order_id,
        customer_id,
        order_date,
        status,
        amount
    from dbt_cloud.raw_schema.orders

),

filtered as (

    select
        *
    from source
    where upper(status) != 'CANCELLED'

)

select * from filtered
