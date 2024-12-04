SELECT 
        {{ generate_surrogate_key(['claim_id', 'provider_id']) }} AS surrogate_key,
        claim_id,
        provider_id,
        claim_amount
    FROM {{ref("stg_policyclaims")}}
