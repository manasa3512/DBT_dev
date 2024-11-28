{{ config(
    materialized='ephemeral'
) }}

SELECT
    pp.payment_id,
    pp.policy_holder_id,
    pp.policy_id,
    ip.policy_name,
    ip.policy_type,
    ip.coverage_amount,
    ip.premium_amount,
    pp.amount_paid,
    pp.transaction_id,
    pp.receipt_number,
    pp.late_fee,
    pp.total_amount,
    ip.provider_name,
    ip.provider_contact,
    ip.beneficiary_type
FROM {{ ref('stg_premium_payments') }} pp
LEFT JOIN {{ ref('stg_insurance_policies') }} ip
ON pp.policy_id = ip.policy_id