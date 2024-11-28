{{ config(
    materialized='table'
) }}

SELECT
    beneficiary_id, 
    policy_holder_id, 
    policy_id, 
    first_name, 
    last_name, 
    dob, 
    relationship, 
    phone, 
    email, 
    address, 
    city, 
    state, 
    zip, 
    created_at, 
    updated_at
FROM {{ source('Insurance', 'raw_beneficiaries') }}