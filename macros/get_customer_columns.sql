
{% macro get_customer_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "shopify_customer_id", "datatype": dbt.type_int()},
    {"name": "email", "datatype": dbt.type_string()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "first_charge_processed_at", "datatype": dbt.type_timestamp()},
    {"name": "first_name", "datatype": dbt.type_string()},
    {"name": "last_name", "datatype": dbt.type_string()},
    {"name": "number_active_subscriptions", "datatype": dbt.type_int()},
    {"name": "number_subscriptions", "datatype": dbt.type_int()},
    {"name": "billing_first_name", "datatype": dbt.type_string()},
    {"name": "billing_last_name", "datatype": dbt.type_string()},
    {"name": "billing_address_1", "datatype": dbt.type_string()},
    {"name": "billing_address_2", "datatype": dbt.type_string()},
    {"name": "billing_zip", "datatype": dbt.type_string()},
    {"name": "billing_city", "datatype": dbt.type_string()},
    {"name": "billing_company", "datatype": dbt.type_string()},
    {"name": "billing_province", "datatype": dbt.type_string()},
    {"name": "billing_country", "datatype": dbt.type_string()},
    {"name": "billing_phone", "datatype": dbt.type_string()},
    {"name": "has_valid_payment_method", "datatype": "boolean"},
    {"name": "reason_payment_method_not_valid", "datatype": dbt.type_string()},
    {"name": "has_card_error_in_dunning", "datatype": "boolean"},
    {"name": "_fivetran_deleted", "datatype": "boolean"}
] %}

{% if target.type == 'bigquery' %}
{{ columns.append( {"name": "hash", "datatype": dbt.type_string(), "alias": "customer_hash", "quote": true} ) }}
{% else %}
{{ columns.append( {"name": "hash", "alias": "customer_hash", "datatype": dbt.type_string()} ) }}
{% endif %} ,

{{ return(columns) }}

{% endmacro %}