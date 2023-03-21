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
        customer_id,
        index,
        processor_name,
        payment_type,
        payment_token,
        status,
        status_reason,
        cardholder_name,
        card_brand,
        card_exp_month,
        card_exp_year,
        card_last_4,
        has_card_error_in_dunning
    from fields
)

select *
from final