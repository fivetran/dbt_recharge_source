
select *
from {{ var('order_line_item') }}

{{
    fivetran_utils.union_data(
        table_identifier='order_line_item', 
        database_variable='recharge_database', 
        schema_variable='recharge_schema', 
        default_database=target.database,
        default_schema='recharge',
        default_variable_source='order_line_item_source',
        union_schema_variable='recharge_union_schemas',
        union_database_variable='recharge_union_databases'
    )
}}