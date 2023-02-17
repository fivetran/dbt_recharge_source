
{% macro get_subscription_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "address_id", "datatype": dbt_utils.type_int()},
    {"name": "customer_id", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "cancelled_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "next_charge_scheduled_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "price", "datatype": dbt_utils.type_float()},
    {"name": "quantity", "datatype": dbt_utils.type_int()},
    {"name": "cancellation_reason", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "cancellation_reason_comments", "datatype": dbt_utils.type_string()},
    {"name": "product_title", "datatype": dbt_utils.type_string()},
    {"name": "variant_title", "datatype": dbt_utils.type_string()},
    {"name": "shopify_product_id", "datatype": dbt_utils.type_int()},
    {"name": "shopify_variant_id", "datatype": dbt_utils.type_int()},
    {"name": "sku", "datatype": dbt_utils.type_string()},
    {"name": "order_interval_unit", "datatype": dbt_utils.type_string()},
    {"name": "order_interval_frequency", "datatype": dbt_utils.type_int()},
    {"name": "charge_interval_frequency", "datatype": dbt_utils.type_int()},
    {"name": "order_day_of_week", "datatype": dbt_utils.type_int()},
    {"name": "order_day_of_month", "datatype": dbt_utils.type_int()},
    {"name": "expire_after_specific_number_of_charges", "datatype": dbt_utils.type_int()},
    {"name": "number_charges_until_expiration", "datatype": dbt_utils.type_int()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}