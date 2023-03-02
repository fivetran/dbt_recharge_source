
{% macro get_address_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "customer_id", "datatype": dbt.type_int()},
    {"name": "first_name", "datatype": dbt.type_string()},
    {"name": "last_name", "datatype": dbt.type_string()},
    {"name": "address_1", "datatype": dbt.type_string()},
    {"name": "address_2", "datatype": dbt.type_string()},
    {"name": "city", "datatype": dbt.type_string()},
    {"name": "province", "datatype": dbt.type_string()},
    {"name": "country", "datatype": dbt.type_string()},
    {"name": "zip", "datatype": dbt.type_string()},
    {"name": "company", "datatype": dbt.type_string()},
    {"name": "phone", "datatype": dbt.type_string()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "cart_attribute_elevar_visitor_info", "datatype": dbt.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}