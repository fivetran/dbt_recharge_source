
{% macro get_charge_note_attribute_columns() %}

{% set columns = [
    {"name": "charge_id", "datatype": dbt_utils.type_int()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "note_attribute", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
] %}

{{ return(columns) }}

{% endmacro %}