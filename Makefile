.PHONY: refresh
refresh:
	dbt run --full-refresh

# cannot compile target/run/**/*.sql
# https://github.com/dbt-labs/dbt-core/issues/4227
.PHONY: compile
compile:
	dbt clean && \
	dbt compile && \
	dbt docs generate --no-compile

.PHONY: setup
setup:
	dbt deps
