SELECT *
FROM {{ref('int_Policyclaims_providers') }}
WHERE record_created_at > CURRENT_TIMESTAMP()
   OR record_updated_at > CURRENT_TIMESTAMP()