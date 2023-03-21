
with base as (

    select *
    from {{ ref('stg_recharge__charge_line_item_tmp') }}
),

fields as (
    
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__charge_line_item_tmp')),
                staging_columns = get_charge_line_item_columns()
            )
        }}
    from base
),

final as (
    
    select
        charge_id,
        index,
        subscription_id,
        vendor,
        title,
        property_title,
        variant_title,
        sku,
        grams,
        quantity,
        price,
        shopify_product_id,
        shopify_variant_id

        {{ fivetran_utils.fill_pass_through_columns('recharge__charge_line_item_passthrough_columns') }}

    from fields
)

select *
from final