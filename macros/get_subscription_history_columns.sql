
{% macro get_subscription_history_columns() %}

{% set columns = [
    {"name": "subscription_id", "datatype": dbt.type_int()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "address_id", "datatype": dbt.type_int()},
    {"name": "customer_id", "datatype": dbt.type_int()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "cancelled_at", "datatype": dbt.type_timestamp()},
    {"name": "next_charge_scheduled_at", "datatype": dbt.type_timestamp()},
    {"name": "price", "datatype": dbt.type_float()},
    {"name": "quantity", "datatype": dbt.type_int()},
    {"name": "cancellation_reason", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "cancellation_reason_comments", "datatype": dbt.type_string()},
    {"name": "product_title", "datatype": dbt.type_string()},
    {"name": "variant_title", "datatype": dbt.type_string()},
    {"name": "shopify_product_id", "datatype": dbt.type_string()},
    {"name": "shopify_variant_id", "datatype": dbt.type_string()},
    {"name": "sku", "datatype": dbt.type_string()},
    {"name": "order_interval_unit", "datatype": dbt.type_string()},
    {"name": "order_interval_frequency", "datatype": dbt.type_int()},
    {"name": "charge_interval_frequency", "datatype": dbt.type_int()},
    {"name": "order_day_of_week", "datatype": dbt.type_int()},
    {"name": "order_day_of_month", "datatype": dbt.type_int()},
    {"name": "expire_after_specific_number_of_charges", "datatype": dbt.type_int()},
    {"name": "number_charges_until_expiration", "datatype": dbt.type_int()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "property_shipping_interval_unit_type", "datatype": dbt.type_string()},
    {"name": "property_shipping_interval_frequency", "datatype": dbt.type_string()},
    {"name": "property_charge_interval_unit_type", "datatype": dbt.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('recharge__subscription_history_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}