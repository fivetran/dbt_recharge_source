
with base as (

    select *
    from {{ ref('stg_recharge__plan_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__plan_tmp')),
                staging_columns = get_plan_columns()
            )
        }}
    from base
),

final as (

    select
        id as product_id,
        title as product_title,
        discount_amount,
        discount_type,
        handle,
        large_image,
        medium_image,
        original_image,
        small_image,
        collection_id,
        external_product_id_ecommerce,
        cast(created_at as {{ dbt.type_timestamp() }}) as plan_created_at,
        cast(updated_at as {{ dbt.type_timestamp() }}) as plan_updated_at,
        is_deleted

        {{ fivetran_utils.fill_pass_through_columns('recharge__plan_passthrough_columns') }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final