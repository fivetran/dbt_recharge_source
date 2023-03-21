
with base as (

    select *
    from {{ ref('stg_recharge__discount_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__discount_tmp')),
                staging_columns = get_discount_columns()
            )
        }}
    from base
),

final as (

    select
        id as discount_id,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_at,
        cast(updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        cast(starts_at as {{ dbt.type_timestamp() }}) as starts_at,
        cast(ends_at as {{ dbt.type_timestamp() }}) as ends_at,
        code as discount_code,
        value as discount_amount,
        discount_type,
        status,
        times_used,
        usage_limit,
        applies_to,
        applies_to_resource,
        applies_to_id,
        applies_to_product_type,
        duration,
        duration_usage_limit,
        minimum_order_amount,
        once_per_customer as is_once_per_customer
    from fields
)

select *
from final