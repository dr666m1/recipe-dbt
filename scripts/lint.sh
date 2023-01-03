#!/bin/bash
set -euo pipefail

if [[ -v CI ]]; then
  sqlfluff lint models \
    --dialect bigquery \
    --templater jinja \
    --ignore templating
else
  sqlfluff lint models --dialect bigquery
fi
