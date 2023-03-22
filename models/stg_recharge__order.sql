
with base as (

    select *
    from {{ ref('stg_recharge__order_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__order_tmp')),
                staging_columns = get_order_columns()
            )
        }}
    from base
),

final as (

    select
        id as order_id,
        shopify_order_id,
        shopify_order_number,
        customer_id,
        first_name || ' ' || last_name as customer_full_name,
        email,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_at,
        status as order_status,
        cast(updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        charge_id,
        transaction_id,
        charge_status,
        is_prepaid,
        payment_processor,
        total_price,
        type as order_type,
        cast(processed_at as {{ dbt.type_timestamp() }}) as processed_at,
        cast(scheduled_at as {{ dbt.type_timestamp() }}) as scheduled_at,
        cast(shipped_date as {{ dbt.type_timestamp() }}) as shipped_date,
        address_id,
        address_is_active,
        is_deleted

        {{ fivetran_utils.fill_pass_through_columns('recharge__order_passthrough_columns') }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final