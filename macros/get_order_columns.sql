
{% macro get_order_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "customer_id", "datatype": dbt.type_int()},
    {"name": "address_id", "datatype": dbt.type_int()},
    {"name": "charge_id", "datatype": dbt.type_int()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "first_name", "datatype": dbt.type_string()},
    {"name": "last_name", "datatype": dbt.type_string()},
    {"name": "email", "datatype": dbt.type_string()},
    {"name": "transaction_id", "datatype": dbt.type_string()},
    {"name": "address_is_active", "datatype": "boolean"},
    {"name": "charge_status", "datatype": dbt.type_string()},
    {"name": "is_prepaid", "datatype": "boolean"},
    {"name": "payment_processor", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "total_price", "datatype": dbt.type_float()},
    {"name": "type", "datatype": dbt.type_string()},
    {"name": "shopify_cart_token", "datatype": dbt.type_string()},
    {"name": "shopify_id", "datatype": dbt.type_string()},
    {"name": "shopify_order_id", "datatype": dbt.type_string()},
    {"name": "shopify_order_number", "datatype": dbt.type_int()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "processed_at", "datatype": dbt.type_timestamp()},
    {"name": "scheduled_at", "datatype": dbt.type_timestamp()},
    {"name": "shipped_date", "datatype": dbt.type_timestamp()},
    {"name": "shipping_date", "datatype": dbt.type_timestamp()},
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
    {"name": "shipping_address_first_name", "datatype": dbt.type_string()},
    {"name": "shipping_address_last_name", "datatype": dbt.type_string()},
    {"name": "shipping_address_address_1", "datatype": dbt.type_string()},
    {"name": "shipping_address_address_2", "datatype": dbt.type_string()},
    {"name": "shipping_address_city", "datatype": dbt.type_string()},
    {"name": "shipping_address_province", "datatype": dbt.type_string()},
    {"name": "shipping_address_country", "datatype": dbt.type_string()},
    {"name": "shipping_address_zip", "datatype": dbt.type_string()},
    {"name": "shipping_address_company", "datatype": dbt.type_string()},
    {"name": "shipping_address_phone", "datatype": dbt.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('recharge__order_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}