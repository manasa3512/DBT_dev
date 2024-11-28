{{ config(
    materialized='table'
) }}

SELECT
    claim_id,
    policy_holder_id,
    policy_id,
    provider_id,
    date_of_service,
    claim_amount,
    approved_amount,
    status,
    submitted_date,
    processed_date,
    denial_reason,
    notes,
    created_at,
    updated_at,
    payment_date
FROM {{ source('Insurance', 'raw_policyclaims') }}