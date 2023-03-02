
with base as (

    select *
    from {{ ref('stg_recharge__address_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__address_tmp')),
                staging_columns = get_address_columns()
            )
        }}
    from base
),

final as (

    select
        id as address_id,
        customer_id,
        first_name || ' ' || last_name as customer_full_name,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_at,
        cast(updated_at as {{ dbt.type_timestamp() }}) as updated_at,
        address_1 as address_line_1,
        address_2 as address_line_2,
        city,
        province,
        zip,
        country,
        company,
        phone,
        cart_attribute_elevar_visitor_info as customer_visitor_info,
        _fivetran_deleted,
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced
        {{ fivetran_utils.fill_pass_through_columns('recharge__address_passthrough_columns') }}
    from fields
)

select *
from final