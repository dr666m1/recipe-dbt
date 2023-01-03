.PHONY: refresh
refresh:
	dbt run --full-refresh

# cannot compile target/run/**/*.sql
# https://github.com/dbt-labs/dbt-core/issues/4227
.PHONY: compile
compile:
	dbt clean && \
	dbt compile

.PHONY: setup
setup:
	pip install -r ./requirement.txt && \
	dbt deps

.PHONY: docs
docs: compile
	dbt docs generate --no-compile && \
	echo 'Done! Now you can run ./scripts/serve.sh'
