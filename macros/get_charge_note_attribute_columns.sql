
{% macro get_charge_note_attribute_columns() %}

{% set columns = [
    {"name": "charge_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "note_attribute", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}