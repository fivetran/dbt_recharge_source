
with base as (

    select *
    from {{ ref('stg_recharge__checkout_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__checkout_tmp')),
                staging_columns = get_checkout_columns()
            )
        }}
    from base
),

final as (

    select
        token as checkout_id,
        charge_id,
        email,
        phone,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_at,
        cast(completed_at as {{ dbt.type_timestamp() }}) as completed_at,
        cast(updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        currency,
        discount_code,
        applied_discount_amount,
        applied_discount_applicable,
        applied_discount_non_applicable_reason,
        applied_discount_value,
        applied_discount_value_type,
        external_checkout_id,
        external_checkout_source,
        buyer_accepts_marketing,
        subtotal_price,
        taxes_included,
        total_tax,
        total_price,
        requires_shipping,
        shipping_rate_title,
        shipping_rate_name,
        shipping_rate_code,
        shipping_rate_description,
        shipping_rate_price,
        shipping_rate_shipping_rate_checkout_subtotal_price as shipping_rate_checkout_subtotal_price,
        shipping_rate_shipping_rate_checkout_total_tax as shipping_rate_checkout_total_tax,    
        shipping_rate_shipping_rate_checkout_total_price as shipping_rate_checkout_total_price,
        shipping_rate_delivery_range,
        shipping_rate_handle,
        shipping_rate_phone_required,
        note_attributes,
        billing_address_first_name || ' ' || billing_address_last_name as billing_address_full_name,
        billing_address_address_1 as billing_address_line_1,
        billing_address_address_2 as billing_address_line_2,
        billing_address_city,
        billing_address_province,
        billing_address_zip,
        billing_address_country,
        billing_address_company,
        billing_address_phone,
        shipping_address_first_name || ' ' || shipping_address_last_name as shipping_address_full_name,
        shipping_address_address_1 as shipping_address_line_1,
        shipping_address_address_2 as shipping_address_line_2,
        shipping_address_city,
        shipping_address_province,
        shipping_address_zip,
        shipping_address_country,
        shipping_address_company,
        shipping_address_phone,
        shipping_address_validations_country_is_supported,
        shipping_address_validations_ups,
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced
    from fields
)

select *
from final