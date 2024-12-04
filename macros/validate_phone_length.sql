{% test validate_phone_length(model, column_name) %}
    SELECT *
    FROM {{ model }}
    WHERE LENGTH(REGEXP_REPLACE({{ column_name }}, '[^0-9]', '')) != 10
      AND {{ column_name }} IS NOT NULL
{% endtest %}