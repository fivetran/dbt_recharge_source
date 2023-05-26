{{ config(enabled=var('recharge__payment_method_enabled', True)) }}
with base as (

    select *
    from {{ ref('stg_recharge__payment_method_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__payment_method_tmp')),
                staging_columns = get_payment_method_columns()
            )
        }}
    from base
),

final as (

    select
        id as payment_method_id,
        customer_id,
        created_at,
        default,
        payment_type,
        processor_name,
        status,
        status_reason,
        updated_at
    from fields
)

select *
from final