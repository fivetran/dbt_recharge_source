
{% macro get_discount_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "starts_at", "datatype": dbt.type_timestamp()},
    {"name": "ends_at", "datatype": dbt.type_timestamp()},
    {"name": "code", "datatype": dbt.type_string()},
    {"name": "value", "datatype": dbt.type_float()},
    {"name": "discount_type", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "times_used", "datatype": dbt.type_int()},
    {"name": "usage_limit", "datatype": dbt.type_int()},
    {"name": "applies_to", "datatype": dbt.type_string()},
    {"name": "applies_to_resource", "datatype": dbt.type_string()},
    {"name": "applies_to_id", "datatype": dbt.type_int()},
    {"name": "applies_to_product_type", "datatype": dbt.type_string()},
    {"name": "duration", "datatype": dbt.type_string()},
    {"name": "duration_usage_limit", "datatype": dbt.type_int()},
    {"name": "minimum_order_amount", "datatype": dbt.type_int()},
    {"name": "once_per_customer", "datatype": "boolean"},
    {"name": "applies_once", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}