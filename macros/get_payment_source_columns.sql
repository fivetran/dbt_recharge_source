
{% macro get_payment_source_columns() %}

{% set columns = [
    {"name": "customer_id", "datatype": dbt_utils.type_int()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "billing_address_first_name", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_last_name", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_address_1", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_address_2", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_city", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_province", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_country", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_zip", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_company", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_phone", "datatype": dbt_utils.type_string()},
    {"name": "cardholder_name", "datatype": dbt_utils.type_string()},
    {"name": "card_brand", "datatype": dbt_utils.type_string()},
    {"name": "card_exp_month", "datatype": dbt_utils.type_int()},
    {"name": "card_exp_year", "datatype": dbt_utils.type_int()},
    {"name": "card_last_4", "datatype": dbt_utils.type_string()},
    {"name": "has_card_error_in_dunning", "datatype": "boolean"},
    {"name": "payment_token", "datatype": dbt_utils.type_string()},
    {"name": "payment_type", "datatype": dbt_utils.type_string()},
    {"name": "processor_name", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "status_reason", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}