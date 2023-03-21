
{% macro get_charge_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "address_id", "datatype": dbt.type_int()},
    {"name": "customer_id", "datatype": dbt.type_int()},
    {"name": "first_name", "datatype": dbt.type_string()},
    {"name": "last_name", "datatype": dbt.type_string()},
    {"name": "customer_hash", "datatype": dbt.type_string()},
    {"name": "note", "datatype": dbt.type_string()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "processed_at", "datatype": dbt.type_timestamp()},
    {"name": "scheduled_at", "datatype": dbt.type_timestamp()},
    {"name": "shipments_count", "datatype": dbt.type_int()},
    {"name": "shopify_order_id", "datatype": dbt.type_int()},
    {"name": "sub_total", "datatype": dbt.type_int()},
    {"name": "subtotal_price", "datatype": dbt.type_float()},
    {"name": "tags", "datatype": dbt.type_string()},
    {"name": "tax_lines", "datatype": dbt.type_float()},
    {"name": "total_discounts", "datatype": dbt.type_float()},
    {"name": "total_line_items_price", "datatype": dbt.type_float()},
    {"name": "total_price", "datatype": dbt.type_float()},
    {"name": "total_tax", "datatype": dbt.type_float()},
    {"name": "total_weight", "datatype": dbt.type_float()},
    {"name": "type", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "total_refunds", "datatype": dbt.type_float()},
    {"name": "transaction_id", "datatype": dbt.type_string()},
    {"name": "email", "datatype": dbt.type_string()},
    {"name": "processor_name", "datatype": dbt.type_string()},
    {"name": "has_uncommitted_changes", "datatype": "boolean"},
    {"name": "last_charge_attempt_date", "datatype": dbt.type_timestamp()},
    {"name": "retry_date", "datatype": dbt.type_timestamp()},
    {"name": "error_type", "datatype": dbt.type_string()},
    {"name": "error", "datatype": dbt.type_string()},
    {"name": "number_times_tried", "datatype": dbt.type_int()},
    {"name": "shopify_variant_id_not_found", "datatype": dbt.type_string()},
    {"name": "client_details_browser_ip", "datatype": dbt.type_string()},
    {"name": "client_details_user_agent", "datatype": dbt.type_string()},
    {"name": "_fivetran_deleted", "datatype": "boolean"}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('recharge__charge_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}