-- https://docs.getdbt.com/guides/advanced/creating-new-materializations
{%- materialization tvf, adapter='bigquery' -%}
  {%- set identifier = model['alias'] -%}
  {%- set target_relation = api.Relation.create(identifier=identifier, schema=schema, database=database,
                                                type='view') -%}

  {% call statement('main') -%}
  CREATE OR REPLACE TABLE FUNCTION recipe_dbt.i64(i INT64)
  AS (
    SELECT i as col
  )
  {%- endcall %}

  {{ return({'relations': [target_relation]}) }}
{%- endmaterialization -%}
