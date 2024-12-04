{{ config(
    materialized='view'
) }}

SELECT 
    provider_name,
    total_premium_amount,
    total_amount_paid
FROM {{ ref('int_downstream_2') }}