{{ config(
    materialized='view'
) }}

SELECT
    surrogate_key,
    beneficiary_id, 
    policy_id,
    policyholder_first_name,
    policyholder_last_name, 
    beneficiary_first_name,
    relationship,
    beneficiary_phone,
    policyholder_phone
FROM {{ ref('int_policyholder_beneficiary') }}