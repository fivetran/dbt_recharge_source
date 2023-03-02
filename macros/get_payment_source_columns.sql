
{% macro get_payment_source_columns() %}

{% set columns = [
    {"name": "customer_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "billing_address_first_name", "datatype": dbt.type_string()},
    {"name": "billing_address_last_name", "datatype": dbt.type_string()},
    {"name": "billing_address_address_1", "datatype": dbt.type_string()},
    {"name": "billing_address_address_2", "datatype": dbt.type_string()},
    {"name": "billing_address_city", "datatype": dbt.type_string()},
    {"name": "billing_address_province", "datatype": dbt.type_string()},
    {"name": "billing_address_country", "datatype": dbt.type_string()},
    {"name": "billing_address_zip", "datatype": dbt.type_string()},
    {"name": "billing_address_company", "datatype": dbt.type_string()},
    {"name": "billing_address_phone", "datatype": dbt.type_string()},
    {"name": "cardholder_name", "datatype": dbt.type_string()},
    {"name": "card_brand", "datatype": dbt.type_string()},
    {"name": "card_exp_month", "datatype": dbt.type_int()},
    {"name": "card_exp_year", "datatype": dbt.type_int()},
    {"name": "card_last_4", "datatype": dbt.type_string()},
    {"name": "has_card_error_in_dunning", "datatype": "boolean"},
    {"name": "payment_token", "datatype": dbt.type_string()},
    {"name": "payment_type", "datatype": dbt.type_string()},
    {"name": "processor_name", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "status_reason", "datatype": dbt.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}