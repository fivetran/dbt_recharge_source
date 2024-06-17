
select *
from 
{%- if var('recharge__using_orders', recharge_source.recharge_does_table_exist('orders')) -%} 
    {{ var('orders') }}
{%- else -%}
    {{ var('order') }}
{%- endif -%}