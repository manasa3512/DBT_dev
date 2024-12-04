{% macro default_value(column, default) %}
COALESCE({{ column }}, {{ default }})
{% endmacro %}