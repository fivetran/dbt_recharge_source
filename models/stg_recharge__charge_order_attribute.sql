
with base as (

    select *
    from {{ ref('stg_recharge__charge_order_attribute_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__charge_order_attribute_tmp')),
                staging_columns = get_charge_order_attribute_columns()
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
        order_attribute,
        source_relation
    from fields
)

select *
from final