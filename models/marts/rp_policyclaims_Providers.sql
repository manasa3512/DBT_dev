{{ config(
    materialized='view'
) }}

SELECT
    surrogate_key,
    claim_id,
    policy_id,
    provider_id,
    provider_name,
    provider_type,
    provider_phone,
    claim_amount,
    approved_amount
FROM {{ ref('int_Policyclaims_providers') }}