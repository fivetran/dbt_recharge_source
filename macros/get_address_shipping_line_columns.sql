
{% macro get_address_shipping_line_columns() %}

{% set columns = [
    {"name": "address_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "price", "datatype": dbt.type_string()},
    {"name": "code", "datatype": dbt.type_string()},
    {"name": "title", "datatype": dbt.type_string()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}