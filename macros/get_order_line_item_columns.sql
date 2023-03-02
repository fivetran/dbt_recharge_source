
{% macro get_order_line_item_columns() %}

{% set columns = [
    {"name": "order_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "subscription_id", "datatype": dbt.type_int()},
    {"name": "variant_title", "datatype": dbt.type_string()},
    {"name": "title", "datatype": dbt.type_string()},
    {"name": "quantity", "datatype": dbt.type_int()},
    {"name": "grams", "datatype": dbt.type_float()},
    {"name": "price", "datatype": dbt.type_float()},
    {"name": "sku", "datatype": dbt.type_string()},
    {"name": "shopify_product_id", "datatype": dbt.type_int()},
    {"name": "shopify_variant_id", "datatype": dbt.type_int()},
    {"name": "product_title", "datatype": dbt.type_string()},
    {"name": "property_charge_interval_frequency", "datatype": dbt.type_int()},
    {"name": "property_shipping_interval_unit_type", "datatype": dbt.type_string()},
    {"name": "property_shipping_interval_frequency", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "property_price", "datatype": dbt.type_float()},
    {"name": "property_charge_interval_unit_type", "datatype": dbt.type_int()},
    {"name": "property_title", "datatype": dbt.type_string()},
] %}

{{ return(columns) }}

{% endmacro %}