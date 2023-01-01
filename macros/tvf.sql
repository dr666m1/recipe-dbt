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
