-- https://docs.getdbt.com/guides/advanced/creating-new-materializations
{%- materialization tvf, adapter='bigquery' -%}
  {%- set identifier = model['alias'] -%} -- overwrite identifier
  -- https://docs.getdbt.com/reference/dbt-jinja-functions/config
  {%- set params = config.get('params', '') -%}

  -- Allowed values for type are table, view, cte, materizedview and external.
  -- Default value for BigQuery seems to be external.
  -- https://github.com/dbt-labs/dbt-core/blob/304797b099d3c7150ddd8ecc425ac5e872e0410b/core/dbt/contracts/relation.py#L16
  -- https://github.com/dbt-labs/dbt-bigquery/blob/a19f8e1a8ffa5edf1ca1a9255641c68ea2c10f95/dbt/adapters/bigquery/impl.py#L491
  {%- set relation = api.Relation.create(identifier=identifier, schema=schema, database=database, type="external") -%}
  {% set table = "`" + ([relation.database, relation.schema, relation.identifier] | join(".")) + "`" %}

  {% call statement('main') -%}
  -- TODO pass arguments
  CREATE OR REPLACE TABLE FUNCTION {{ table }}({{ params }})
  AS (
    {{ sql }}
  )
  {%- endcall %}

  {{ return({'relations': [relation]}) }}
{%- endmaterialization -%}

-- https://docs.getdbt.com/guides/best-practices/writing-custom-generic-tests
{% test tvf_unique(model, column_name, params) %}
  -- https://github.com/dbt-labs/dbt-core/blob/main/core/dbt/include/global_project/macros/generic_test_sql/unique.sql
  select
    {{ column_name }} as unique_field,
    count(*) as n_records

  from {{ model }}({{ params }})
  where {{ column_name }} is not null
  group by {{ column_name }}
  having count(*) > 1
{% endtest %}
