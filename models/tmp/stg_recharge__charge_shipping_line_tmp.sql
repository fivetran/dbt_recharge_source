
select *
from {{ var('charge_shipping_line') }}

{{
    fivetran_utils.union_data(
        table_identifier='charge_shipping_line', 
        database_variable='recharge_database', 
        schema_variable='recharge_schema', 
        default_database=target.database,
        default_schema='recharge',
        default_variable_source='charge_shipping_line_source',
        union_schema_variable='recharge_union_schemas',
        union_database_variable='recharge_union_databases'
    )
}}