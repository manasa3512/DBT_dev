{{ config(
    materialized='table' 
) }}

SELECT *
FROM {{ ref('int_premium_insurance') }}