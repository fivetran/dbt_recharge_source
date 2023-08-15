{{ config(enabled=var('recharge__charge_tax_line_enabled', True)) }}{{
    fivetran_utils.union_data(
        table_identifier='charge_tax_line', 
        database_variable='recharge_database', 
        schema_variable='recharge_schema', 
        default_database=target.database,
        default_schema='recharge',
        default_variable='charge_tax_line_source',
        union_schema_variable='recharge_union_schemas',
        union_database_variable='recharge_union_databases'
    )
}}