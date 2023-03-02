
with base as (

    select *
    from {{ ref('stg_recharge__charge_note_attribute_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__charge_note_attribute_tmp')),
                staging_columns = get_charge_note_attribute_columns()
            )
        }}
    from base
),

final as (

    select
        charge_id,
        index,
        note_attribute,
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced
    from fields
)

select *
from final