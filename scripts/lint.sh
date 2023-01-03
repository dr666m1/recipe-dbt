#!/bin/bash
set -euo pipefail

# check if this script is run by github actions
if [[ -v CI ]]; then
  # do not access BigQuery
  sqlfluff lint models \
    --dialect bigquery \
    --templater jinja \
    --ignore templating
else
  sqlfluff lint models --dialect bigquery
fi
