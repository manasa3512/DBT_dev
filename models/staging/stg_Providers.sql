{{ config(
    materialized='table'
) }}

SELECT
    provider_id, 
    provider_name, 
    provider_type, 
    address, 
    city, 
    state, 
    zip, 
    phone, 
    email, 
    license_number, 
    tax_id, 
    contract_start_date, 
    contract_end_date, 
    status, 
    created_at
FROM {{ source('Insurance', 'raw_providers') }}
WHERE provider_id is not null