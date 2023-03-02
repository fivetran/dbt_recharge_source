
with base as (

    select *
    from {{ ref('stg_recharge__checkout_line_item_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__checkout_line_item_tmp')),
                staging_columns = get_checkout_line_item_columns()
            )
        }}
    from base
),

final as (

    select
        checkout_token as checkout_id,
        index,
        product_id,
        variant_id,
        image,
        title,
        type,
        variant_title,
        vendor,
        taxable,
        requires_shipping,
        sku,
        tax_code,
        cuttoff_day_of_month,
        cuttoff_day_of_week,
        expire_after_specific_number_of_charges,
        first_recurring_charge_delay,
        fulfillment_service,
        grams,
        quantity,
        charge_interval_frequency,
        order_interval_frequency,
        line_price as line_item_price,
        order_day_of_month,
        order_day_of_week,
        order_interval_unit,
        original_price,
        price,
        product_type,
        recurring_price,
        properties,
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced
    from fields
)

select *
from final