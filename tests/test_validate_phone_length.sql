SELECT
    *
FROM {{ ref("int_policyholder_beneficiary") }}
WHERE LENGTH(REGEXP_REPLACE(Policyholder_phone, '[^0-9]', '')) != 10
    AND Policyholder_phone IS NOT NULL