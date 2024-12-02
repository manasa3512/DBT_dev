SELECT
  start_date,
  end_date,
  CASE
    WHEN start_date > end_date THEN 'Invalid date order'
    WHEN end_date IS NOT NULL AND start_date IS NULL THEN 'Missing start_date'
    ELSE 'PASS'
  END AS test_status
FROM {{ ref('int_policyholder_beneficiary') }}
WHERE start_date > end_date
   OR (end_date IS NOT NULL AND start_date IS NULL)