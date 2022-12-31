.PHONY: refresh
refresh:
	dbt run --full-refresh


.PHONY: compile
compile:
	dbt compile && \
	dbt docs generate

