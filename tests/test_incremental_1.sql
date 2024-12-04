SELECT
claim_id,
claim_amount
FROM {{ ref('int_Policyclaims_providers') }}
WHERE claim_amount < 0