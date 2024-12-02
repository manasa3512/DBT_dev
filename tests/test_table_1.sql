SELECT
  Policyholder_phone,
  LENGTH(REGEXP_REPLACE(Policyholder_phone, '[^0-9]', '')) AS cleaned_length
FROM {{ ref('int_policyholder_beneficiary') }}
WHERE 
  Policyholder_phone IS NOT NULL
  AND LENGTH(REGEXP_REPLACE(Policyholder_phone, '[^0-9]', '')) != 10