
{% macro get_charge_discount_code_columns() %}

{% set columns = [
    {"name": "charge_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "discount_id", "datatype": dbt.type_int()},
    {"name": "amount", "datatype": dbt.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}