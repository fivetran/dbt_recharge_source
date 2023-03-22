
with base as (

    select *
    from {{ ref('stg_recharge__subscription_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__subscription_history_tmp')),
                staging_columns = get_subscription_history_columns()
            )
        }}
    from base
),

final as (

    select
        subscription_id,
        customer_id,
        address_id,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_at,
        shopify_product_id,
        product_title,
        shopify_variant_id,
        variant_title,
        sku,
        price,
        quantity,
        status,
        charge_interval_frequency,
        order_interval_unit,
        order_interval_frequency,
        order_day_of_month,
        order_day_of_week,
        expire_after_specific_number_of_charges,
        number_charges_until_expiration,
        cast(updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        cast(next_charge_scheduled_at as {{ dbt.type_timestamp() }}) as next_charge_scheduled_at,
        cast(cancelled_at as {{ dbt.type_timestamp() }}) as cancelled_at,
        cancellation_reason,
        cancellation_reason_comments,
        row_number() over (partition by subscription_id order by updated_at desc) = 1 as is_most_recent_record

        {{ fivetran_utils.fill_pass_through_columns('recharge__subscription_history_passthrough_columns') }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final