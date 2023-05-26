
{% macro get_payment_method_columns() %}

{% set columns = [
    {"name": "customer_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "cardholder_name", "datatype": dbt.type_string()},
    {"name": "card_brand", "datatype": dbt.type_string()},
    {"name": "card_exp_month", "datatype": dbt.type_int()},
    {"name": "card_exp_year", "datatype": dbt.type_int()},
    {"name": "card_last_4", "datatype": dbt.type_string()},
    {"name": "has_payment_method_in_dunning", "datatype": dbt.type_boolean()},
    {"name": "payment_token", "datatype": dbt.type_string()},
    {"name": "payment_type", "datatype": dbt.type_string()},
    {"name": "payment_processor", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "status_reason", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}