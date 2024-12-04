{% macro generate_surrogate_key(fields) %}
    MD5(CONCAT({{ fields | join(', ') }}))
{% endmacro %}