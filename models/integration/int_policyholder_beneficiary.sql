{{ config(
    materialized='table'
) }}

    SELECT
        {{ generate_surrogate_key(['bh.beneficiary_id', 'bh.policy_id']) }} AS surrogate_key,
        bh.beneficiary_id, 
        bh.policy_holder_id as policy_holder_id, 
        bh.policy_id as policy_id,
        ph.first_name AS policyholder_first_name,
        ph.last_name AS policyholder_last_name, 
        {{ default_value('bh.first_name', "'Unknown'") }} AS Beneficiary_first_name,
        bh.last_name AS beneficiary_last_name,
        bh.relationship,
        bh.phone as Beneficiary_phone,
        bh.address AS beneficiary_address,
        ph.phone as Policyholder_phone,
        ph.address as Policyholder_address,
        ph.start_date,
        ph.end_date,
        ph.status
    FROM {{ ref('stg_Beneficiaries') }} bh
    JOIN {{ ref('stg_policyholders') }} ph
        ON bh.policy_id = ph.policy_id