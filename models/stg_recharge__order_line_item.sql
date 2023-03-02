
with base as (

    select *
    from {{ ref('stg_recharge__order_line_item_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__order_line_item_tmp')),
                staging_columns = get_order_line_item_columns()
            )
        }}
    from base
),

final as (

    select
        order_id,
        index,
        subscription_id,
        shopify_product_id,
        product_title as product_title_1,
        title as product_title_2,
        variant_title product_variant_title,
        sku,
        quantity,
        grams,
        price,
        property_charge_interval_unit_type as charge_interval_unit_type,
        property_charge_interval_frequency as charge_interval_frequency,
        property_shipping_interval_unit_type as shipping_interval_unit_type,
        property_shipping_interval_frequency as shipping_interval_frequency,
        property_title,
        property_price,
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced
    from fields
)

select *
from final