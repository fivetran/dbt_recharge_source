
with base as (

    select *
    from {{ ref('stg_recharge__charge_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__charge_tmp')),
                staging_columns = get_charge_columns()
            )
        }}
    from base
),

final as (

    select
        id as charge_id,
        customer_id,
        customer_hash,
        first_name || ' ' || last_name as customer_full_name,
        email,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_at,
        type as charge_type,
        status as charge_status,
        cast(updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        note,
        subtotal_price,
        tax_lines,
        total_discounts,
        total_line_items_price,
        total_tax,
        total_price,
        total_refunds,
        total_weight,
        cast(scheduled_at as {{ dbt.type_timestamp() }}) as scheduled_at,
        cast(processed_at as {{ dbt.type_timestamp() }}) as processed_at,
        processor_name,
        transaction_id,
        shopify_order_id,
        shipments_count,
        has_uncommitted_changes,
        cast(last_charge_attempt_date as {{ dbt.type_timestamp() }}) as last_charge_attempt_date,
        cast(retry_date as {{ dbt.type_timestamp() }}) as retry_date,
        error_type,
        number_times_tried as times_retried,
        address_id,
        client_details_browser_ip,
        client_details_user_agent

        {{ fivetran_utils.fill_pass_through_columns('recharge__charge_passthrough_columns') }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final