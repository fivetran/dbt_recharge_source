
{% macro get_charge_discount_code_columns() %}

{% set columns = [
    {"name": "charge_id", "datatype": dbt_utils.type_int()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "discount_id", "datatype": dbt_utils.type_int()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
] %}

{{ return(columns) }}

{% endmacro %}