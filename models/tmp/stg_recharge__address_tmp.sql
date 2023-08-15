
select *
from {{ var('address') }}

{{
    fivetran_utils.union_data(
        table_identifier='address', 
        database_variable='recharge_database', 
        schema_variable='recharge_schema', 
        default_database=target.database,
        default_schema='recharge',
        default_variable_source='address_source',
        union_schema_variable='recharge_union_schemas',
        union_database_variable='recharge_union_databases'
    )
}}