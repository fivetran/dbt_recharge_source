
with base as (

    select *
    from {{ ref('stg_recharge__payment_source_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__payment_source_tmp')),
                staging_columns = get_payment_source_columns()
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
        has_card_error_in_dunning,
        billing_address_first_name || ' ' || billing_address_last_name as billing_address_full_name,
        billing_address_address_1 as billing_address_line_1,
        billing_address_address_2 as billing_address_line_2,
        billing_address_city as billing_address_city,
        billing_address_province,
        billing_address_zip,
        billing_address_country,
        billing_address_company,
        billing_address_phone,
        cast(_fivetran_synced as {{ dbt_utils.type_timestamp() }}) as _fivetran_synced
    from fields
)

select *
from final