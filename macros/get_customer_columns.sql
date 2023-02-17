
{% macro get_customer_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "hash", "datatype": dbt_utils.type_string()},
    {"name": "shopify_customer_id", "datatype": dbt_utils.type_int()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "first_charge_processed_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "first_name", "datatype": dbt_utils.type_string()},
    {"name": "last_name", "datatype": dbt_utils.type_string()},
    {"name": "number_active_subscriptions", "datatype": dbt_utils.type_int()},
    {"name": "number_subscriptions", "datatype": dbt_utils.type_int()},
    {"name": "billing_first_name", "datatype": dbt_utils.type_string()},
    {"name": "billing_last_name", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_1", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_2", "datatype": dbt_utils.type_string()},
    {"name": "billing_zip", "datatype": dbt_utils.type_string()},
    {"name": "billing_city", "datatype": dbt_utils.type_string()},
    {"name": "billing_company", "datatype": dbt_utils.type_string()},
    {"name": "billing_province", "datatype": dbt_utils.type_string()},
    {"name": "billing_country", "datatype": dbt_utils.type_string()},
    {"name": "billing_phone", "datatype": dbt_utils.type_string()},
    {"name": "processor_type", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "has_valid_payment_method", "datatype": "boolean"},
    {"name": "reason_payment_method_not_valid", "datatype": dbt_utils.type_string()},
    {"name": "has_card_error_in_dunning", "datatype": "boolean"},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}