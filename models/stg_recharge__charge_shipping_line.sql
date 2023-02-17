
with base as (

    select *
    from {{ ref('stg_recharge__charge_shipping_line_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__charge_shipping_line_tmp')),
                staging_columns = get_charge_shipping_line_columns()
            )
        }}
    from base
),

final as (

    select
        charge_id,
        index,
        price,
        code,
        title,
        cast(_fivetran_synced as {{ dbt_utils.type_timestamp() }}) as _fivetran_synced
    from fields
)

select *
from final