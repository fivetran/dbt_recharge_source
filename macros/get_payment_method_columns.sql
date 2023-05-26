
{% macro get_payment_method_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "customer_id", "datatype": dbt.type_int()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "default", "datatype": dbt.type_boolean()},
    {"name": "payment_type", "datatype": dbt.type_string()},
    {"name": "processor_name", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "status_reason", "datatype": dbt.type_string()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}