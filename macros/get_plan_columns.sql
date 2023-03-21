
{% macro get_plan_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "title", "datatype": dbt.type_string()},
    {"name": "discount_amount", "datatype": dbt.type_float()},
    {"name": "discount_type", "datatype": dbt.type_float()},
    {"name": "handle", "datatype": dbt.type_string()},
    {"name": "large_image", "datatype": dbt.type_string()},
    {"name": "medium_image", "datatype": dbt.type_string()},
    {"name": "original_image", "datatype": dbt.type_string()},
    {"name": "small_image", "datatype": dbt.type_string()},
    {"name": "collection_id", "datatype": dbt.type_int()},
    {"name": "shopify_product_id", "datatype": dbt.type_int()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "_fivetran_deleted", "datatype": "boolean"}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('recharge__plan_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}