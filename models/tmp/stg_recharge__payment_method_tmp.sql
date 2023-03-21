{{ config(enabled=var('recharge__payment_method_enabled', True)) }}
select *
from {{ var('payment_method' )}}