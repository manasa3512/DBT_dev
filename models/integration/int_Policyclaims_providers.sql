{{ config(
    materialized='incremental',
    unique_key='surrogate_key'
) }}

WITH joined_data AS (
    SELECT 
        MD5(CONCAT(pc.claim_id, pr.provider_id)) AS surrogate_key,
        pc.claim_id,
        pc.policy_holder_id,
        pc.policy_id,
        pc.provider_id,
        pr.provider_name,
        pr.provider_type,
        pr.address AS provider_address,
        pr.phone AS provider_phone,
        pr.email AS provider_email,
        pc.claim_amount,
        pc.approved_amount,
        pr.contract_start_date,
        COALESCE({{ this }}.record_created_at, CURRENT_TIMESTAMP()) AS record_created_at,
        CASE
            WHEN {{ this }}.surrogate_key IS NULL OR 
                 {{ this }}.claim_id != pc.claim_id OR 
                 {{ this }}.policy_holder_id != pc.policy_holder_id OR 
                 {{ this }}.policy_id != pc.policy_id OR 
                 {{ this }}.provider_id != pc.provider_id OR 
                 {{ this }}.provider_name != pr.provider_name OR 
                 {{ this }}.provider_type != pr.provider_type OR 
                 {{ this }}.provider_address != pr.address OR 
                 {{ this }}.provider_phone != pr.phone OR 
                 {{ this }}.provider_email != pr.email OR 
                 {{ this }}.claim_amount != pc.claim_amount OR 
                 {{ this }}.approved_amount != pc.approved_amount OR 
                 {{ this }}.contract_start_date != pr.contract_start_date
            THEN CURRENT_TIMESTAMP()
            ELSE {{ this }}.record_updated_at
        END AS record_updated_at
    FROM {{ ref('stg_policyclaims') }} pc
    LEFT JOIN {{ ref('stg_Providers') }} pr
        ON pc.provider_id = pr.provider_id
    LEFT JOIN {{ this }} ON {{ this }}.surrogate_key = MD5(CONCAT(pc.claim_id, pr.provider_id))
)

SELECT * 
FROM joined_data
{% if is_incremental() %}
    WHERE surrogate_key NOT IN (SELECT surrogate_key FROM {{ this }})
    OR surrogate_key IN (SELECT surrogate_key FROM {{ this }} WHERE record_updated_at < CURRENT_TIMESTAMP())
{% endif %}