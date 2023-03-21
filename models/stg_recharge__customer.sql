
with base as (

    select *
    from {{ ref('stg_recharge__customer_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__customer_tmp')),
                staging_columns = get_customer_columns()
            )
        }}
    from base
),

final as (

    select
        id as customer_id,
        customer_hash,
        shopify_customer_id,
        email,
        first_name || ' ' || last_name as customer_full_name,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_at,
        status as customer_status,
        cast(updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        cast(first_charge_processed_at as {{ dbt.type_timestamp() }}) as first_charge_processed_at,
        number_active_subscriptions as active_subscriptions,
        number_subscriptions as total_subscriptions,
        billing_first_name || ' ' || billing_last_name as customer_billing_full_name,
        billing_company,
        billing_address_1 as billing_address_line_1,
        billing_address_2 as billing_address_line_2,
        billing_zip,
        billing_city,
        billing_province,
        billing_country,
        billing_phone,
        processor_type,
        has_valid_payment_method,
        reason_payment_method_not_valid,
        has_card_error_in_dunning,
        _fivetran_deleted
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final