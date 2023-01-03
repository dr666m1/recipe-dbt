#!/bin/bash
set -euo pipefail
cd $(dirname $0)

if [[ -v WSL_DISTRO_NAME ]]; then
  dbt docs serve --no-browser
else
  dbt docs serve
fi
