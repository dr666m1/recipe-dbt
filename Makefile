.PHONY: refresh
refresh:
	dbt run --full-refresh


.PHONY: compile
compile:
	dbt clean && \
	dbt compile && \
	dbt docs generate --no-compile

.PHONY: setup
setup:
	dbt deps
