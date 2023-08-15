{{ config(enabled=var('recharge__charge_tax_line_enabled', True)) }}
with base as (

    select *
    from {{ ref('stg_recharge__charge_tax_line_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__charge_tax_line_tmp')),
                staging_columns = get_charge_tax_line_columns()
            )
        }}

        {{ fivetran_utils.source_relation(
            union_schema_variable='recharge_union_schemas', 
            union_database_variable='recharge_union_databases') 
        }}
    from base
),

final as (

    select
        charge_id,
        index,
        price,
        rate,
        title,
        source_relation
    from fields
)

select *
from final