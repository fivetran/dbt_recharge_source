
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
        cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at,
        status as order_status,
        cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at,
        charge_id,
        transaction_id,
        charge_status,
        is_prepaid,
        payment_processor,
        total_price,
        type as order_type,
        cast(processed_at as {{ dbt_utils.type_timestamp() }}) as processed_at,
        cast(scheduled_at as {{ dbt_utils.type_timestamp() }}) as scheduled_at,
        cast(shipped_date as {{ dbt_utils.type_timestamp() }}) as shipped_date,
        address_id,
        address_is_active,
        billing_address_first_name || ' ' || billing_address_last_name as billing_address_full_name,
        billing_address_address_1 as billing_address_line_1,
        billing_address_address_2 as billing_address_line_2,
        billing_address_city,
        billing_address_province,
        billing_address_country,
        billing_address_zip,
        billing_address_company,
        billing_address_phone,
        shipping_address_first_name || ' ' || shipping_address_last_name as shipping_address_full_name,
        shipping_address_address_1 as shipping_address_line_1,
        shipping_address_address_2 as shipping_address_line_2,
        shipping_address_city,
        shipping_address_province,
        shipping_address_country,
        shipping_address_zip,
        shipping_address_company,
        shipping_address_phone,
        cast(_fivetran_synced as {{ dbt_utils.type_timestamp() }}) as _fivetran_synced
    from fields
)

select *
from final