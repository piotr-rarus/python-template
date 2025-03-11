.PHONY: venv sync update lock format lint test test_cov build

# Creates a virtual environment and installs dependencies for local development.
venv:
	uv sync --all-groups --all-extras --frozen --reinstall

# Syncs the dependencies for local development.
sync:
	uv sync --all-groups --all-extras

# Updates the dependencies to the latest versions.
update:
	uv sync --all-groups --all-extras --upgrade

# Locks the versions of project dependencies for consistency.
lock:
	uv lock

# Formats code using isort and black for consistent style.
format:
	uv run isort src
	uv run black --config pyproject.toml src

# Runs all linters to catch potential issues and enforce style.
lint:
	uv run pre-commit run -a
	uv run mypy --incremental --no-install-types --show-error-codes --pretty src

# Runs pytest tests to ensure code correctness.
test:
	uv run pytest

# Runs tests with coverage and generates a report.
test_cov:
	uv run coverage run -m pytest src --cov-config=.coveragerc
	uv run coverage html
	uv run coverage xml
	uv run coverage report --show-missing

# Runs pre-commit hooks, mypy checks, and tests. Quite useful before pushing changes.
build: format lint test
