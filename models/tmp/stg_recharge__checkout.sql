{{ config(enabled=var('recharge__using_checkout', false)) }}

select *
from {{ var('checkout') }}