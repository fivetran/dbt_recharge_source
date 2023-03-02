
{% macro get_charge_discount_code_columns() %}

{% set columns = [
    {"name": "charge_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "discount_id", "datatype": dbt.type_int()},
    {"name": "amount", "datatype": dbt.type_float()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
] %}

{{ return(columns) }}

{% endmacro %}