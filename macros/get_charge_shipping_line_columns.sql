
{% macro get_charge_shipping_line_columns() %}

{% set columns = [
    {"name": "charge_id", "datatype": dbt_utils.type_int()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "price", "datatype": dbt_utils.type_float()},
    {"name": "code", "datatype": dbt_utils.type_string()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
] %}

{{ return(columns) }}

{% endmacro %}