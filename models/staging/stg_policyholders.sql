{{ config(
    materialized='table'
) }}

SELECT
    policy_holder_id,
    first_name,
    last_name,
    dob,
    gender,
    phone,
    email,
    address,
    city,
    state,
    zip,
    policy_id,
    start_date,
    end_date,
    status
FROM {{ ref('raw_policyholders')}}