{% macro call_tvf(model, arg) %}
-- ref() returns Relation
-- https://docs.getdbt.com/reference/dbt-classes#relation
{% set relation = ref(model) %}
{% set table = "`" + ([relation.database, relation.schema, relation.identifier] | join(".")) + "`" %}
{{ return (table + "(" + arg + ")") }}
{% endmacro %}
