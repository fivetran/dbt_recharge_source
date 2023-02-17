
{% macro get_checkout_line_item_columns() %}

{% set columns = [
    {"name": "checkout_token", "datatype": dbt_utils.type_string()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "product_id", "datatype": dbt_utils.type_int()},
    {"name": "variant_id", "datatype": dbt_utils.type_int()},
    {"name": "image", "datatype": dbt_utils.type_string()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "variant_title", "datatype": dbt_utils.type_string()},
    {"name": "vendor", "datatype": dbt_utils.type_string()},
    {"name": "taxable", "datatype": "boolean"},
    {"name": "requires_shipping", "datatype": "boolean"},
    {"name": "sku", "datatype": dbt_utils.type_string()},
    {"name": "tax_code", "datatype": dbt_utils.type_string()},
    {"name": "cuttoff_day_of_month", "datatype": dbt_utils.type_string()},
    {"name": "cuttoff_day_of_week", "datatype": dbt_utils.type_string()},
    {"name": "expire_after_specific_number_of_charges", "datatype": dbt_utils.type_string()},
    {"name": "first_recurring_charge_delay", "datatype": dbt_utils.type_string()},
    {"name": "fulfillment_service", "datatype": dbt_utils.type_string()},
    {"name": "grams", "datatype": dbt_utils.type_int()},
    {"name": "quantity", "datatype": dbt_utils.type_int()},
    {"name": "charge_interval_frequency", "datatype": dbt_utils.type_int()},
    {"name": "order_interval_frequency", "datatype": dbt_utils.type_int()},
    {"name": "line_price", "datatype": dbt_utils.type_string()},
    {"name": "order_day_of_month", "datatype": dbt_utils.type_string()},
    {"name": "order_day_of_week", "datatype": dbt_utils.type_string()},
    {"name": "order_interval_unit", "datatype": dbt_utils.type_string()},
    {"name": "order_interval_unit_type", "datatype": dbt_utils.type_string()},
    {"name": "original_price", "datatype": dbt_utils.type_string()},
    {"name": "price", "datatype": dbt_utils.type_string()},
    {"name": "product_type", "datatype": dbt_utils.type_string()},
    {"name": "recurring_price", "datatype": dbt_utils.type_string()},
    {"name": "properties", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}