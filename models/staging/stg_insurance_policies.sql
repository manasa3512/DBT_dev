{{ config(
    materialized='table'
) }}

SELECT
    policy_id,
    policy_name, 
    policy_type, 
    coverage_amount, 
    premium_amount, 
    deductible, 
    co_pay, 
    start_date, 
    end_date, 
    status, 
    provider_name, 
    provider_contact, 
    policy_category, 
    beneficiary_type, 
    policy_description
FROM {{ source('Insurance', 'raw_insurance_policies') }}