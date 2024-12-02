SELECT
    policy_type
FROM {{ ref('int_downstream') }}
WHERE policy_type NOT IN ('Health', 'Life', 'Auto', 'Home', 'Travel')
