
{% macro get_charge_line_item_columns() %}

{% set columns = [
    {"name": "charge_id", "datatype": dbt.type_int()},
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
    {"name": "vendor", "datatype": dbt.type_string()},
    {"name": "property_title", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('recharge__charge_line_item_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}