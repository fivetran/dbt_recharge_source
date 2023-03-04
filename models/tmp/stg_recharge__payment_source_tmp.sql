{{ config(enabled=var('recharge__payment_source_enabled', True)) }}
select
    *
from
    {{ var('payment_source' )}}