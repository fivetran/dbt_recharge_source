{{ config(enabled=var('recharge__one_time_product_enabled', True)) }}{{
    fivetran_utils.union_data(
        table_identifier='one_time_product', 
        database_variable='recharge_database', 
        schema_variable='recharge_schema', 
        default_database=target.database,
        default_schema='recharge',
        default_variable='one_time_product_source',
        union_schema_variable='recharge_union_schemas',
        union_database_variable='recharge_union_databases'
    )
}}