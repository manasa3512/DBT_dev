{{ config(
    materialized='table'
) }}

SELECT
    payment_id, 
    policy_holder_id, 
    policy_id, 
    payment_date, 
    amount_paid, 
    payment_method, 
    status, 
    transaction_id, 
    receipt_number, 
    payment_cycle, 
    created_at, 
    updated_at, 
    late_fee, 
    total_amount, 
    discount
FROM {{ source('Insurance', 'raw_premium_payments') }}
WHERE payment_id IS NOT NULL   -- Exclude rows with null payment_id