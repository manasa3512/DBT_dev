{{ config(
    materialized='view'
) }}

SELECT
    policy_type,
    provider_name,
    COUNT(DISTINCT policy_id) AS total_policies,
    COUNT(DISTINCT policy_holder_id) AS total_policy_holders,
    SUM(amount_paid) AS total_amount_paid,
    SUM(late_fee) AS total_late_fees,
    SUM(total_amount) AS total_revenue,
    SUM(premium_amount) AS total_premium_amount,
    AVG(premium_amount) AS average_premium,
    MAX(coverage_amount) AS maximum_coverage,
    MIN(coverage_amount) AS minimum_coverage
FROM {{ ref('int_premium_insurance') }}
GROUP BY
    policy_type,
    provider_name