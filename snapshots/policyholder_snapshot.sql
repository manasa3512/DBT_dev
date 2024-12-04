{% snapshot policyholder_snapshot %} 

{{
    config(
        target_schema='DBT_mmethuku', 
        target_database='ANALYTICS',
        unique_key='policy_holder_id',
        strategy='check',
        check_cols= 'all'
    )
}}

SELECT * FROM {{ref("int_policyholder_beneficiary")}}

{% endsnapshot %}