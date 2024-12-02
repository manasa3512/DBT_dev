SELECT *
FROM {{ ref('int_downstream') }}
WHERE total_amount != (amount_paid + COALESCE(late_fee, 0))