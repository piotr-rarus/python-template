# Creates a virtual environment and installs dependencies for local development.
venv:
	poetry install --no-root --with dev
	poetry run pre-commit install

# Locks the versions of project dependencies for consistency.
lock:
	poetry lock --no-update

# Formats code using isort and black for consistent style.
format:
	poetry run isort src
	poetry run black --config pyproject.toml src

# Runs all linters to catch potential issues and enforce style.
lint:
	poetry run pre-commit run -a
	poetry run ruff check src
	poetry run flake8 src
	poetry run mypy --incremental --no-install-types --show-error-codes --pretty src

# Runs pytest tests to ensure code correctness.
test:
	poetry run pytest

# Runs tests with coverage and generates a report.
test_cov:
	poetry run coverage run -m pytest src --cov-config=.coveragerc
	poetry run coverage html
	poetry run coverage xml
	poetry run coverage report --show-missing

# Runs pre-commit hooks, mypy checks, and tests. Quite useful before pushing changes.
build: format lint test
