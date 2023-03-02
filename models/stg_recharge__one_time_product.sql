
with base as (

    select *
    from {{ ref('stg_recharge__one_time_product_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__one_time_product_tmp')),
                staging_columns = get_one_time_product_columns()
            )
        }}
    from base
),

final as (
    
    select
        id as one_time_product_id,
        address_id,
        customer_id,
        is_deleted,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_at,
        cast(updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        next_charge_scheduled_at,
        product_title,
        variant_title,
        price,
        quantity,
        status,
        shopify_variant_id,
        recharge_product_id,
        sku,
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced
    from fields
)

select *
from final