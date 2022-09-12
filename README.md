# python-template

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Imports: isort](https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336)](https://pycqa.github.io/isort/)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

This is a template repository dedicated to ML projects in python. It provides some basic tools and configs necessary to kickstart the development.

## Structure

- `.github` - CI/CD pipelines, usually named after repository host (`.github`, `.azure`, `.gitlab`, etc)
- `data` - if you need any data to be present locally, store it here
- `notebooks` - notebooks are particularly _meh_, but this is the directory to put them
- `src` - here goes your project's code
- `src/cli` - project's entry points should be wrapped with CLI and exposed via Makefile, good idea to store them separately
- `.codespell` - whitelist for project-related terms
- `.coveragearc` - corage config config, usually you don't want to report coverage on CLI, tests and some expressions
- `.flake8` - `flake8` config
- `isort.cfg` - `isort` config
- `Makefile` - tasks definitions, much simpler to call `make` than writing whole commands in the terminal
- `mypy.ini` - `mypy` config, usually some of your dependencies won't be hinted so you gonna ignore them here
- `poetry.lock` - compiled dependencies
- `poetry.toml` - `poetry` config
- `pyproject.toml` - repo config

## Tools

When developing a project there's a need to automate some tedious stuff that helps you keep the repo clean and check it against common standards. These include managing the environment, dependencies, syntax, etc.

- [coverage](https://github.com/nedbat/coveragepy)
- [flake8](https://github.com/PyCQA/flake8)
- [isort](https://github.com/PyCQA/isort)
- [mypy](https://github.com/python/mypy)
- [poetry](https://github.com/python-poetry/poetry)

## [Makefile](Makefile)

To start your work, you need to set up your local environment and hooks.

```sh
make install_dev
```

You gonna put your CLI here later. It already contains calls to build tools and checks. Use `build` to run them all (`isort`, `black`, `pre_commit`, `flake8`, `mypy`, `test`).

```sh
make build
```

Please note that `build` does not encompass the coverage and dependencies updates. These need to be run separately. Coverage may not always be necessary and you're gonna be running `build` often while working locally. Updating dependencies should be approached with the utmost care, no reason to bump the versions all the time when code does the work it's intended for. Better use some automation tool like [dependabot](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file).

To quickly format your repo while coding run:

```sh
make format
```

Before you commit, always run a full check:

```sh
make build
```

## [pre-commit](.github/hooks/.pre-commit-config.yml)

This hook is here to prevent you from committing any nasty code to your repository.

- miscellaneous syntax checks and fixers
- no commit to main branch (these should be only merged with PRs)
- refactor relative imports [(absolufy-imports)](https://github.com/MarcoGorelli/absolufy-imports)
- detect dead code [(vulture)](https://github.com/jendrikseipp/vulture)
- spell checks [(codespell)](https://github.com/codespell-project/codespell)
- sort imports [isort](https://github.com/timothycrosley/isort)
- upgrade old syntax to newer Python version [(pyupgrade)](https://github.com/asottile/pyupgrade)
- remove unnecessary `#noqa` comments [(yesqa)](https://github.com/asottile/yesqa)
- autoformatting [black](https://github.com/psf/black)
- finally some linter to be sure [flake8](https://gitlab.com/pycqa/flake8)

## Closing remarks

Hopefully, this template helps you jump off your project. If any of these tools are unfamiliar to you, follow the links for more info on them. Feel free to customize it, this is a template after all. Personally, I often look up how my favourite libraries are developed and take what I like. If you feel you don't need any of it, good luck to you, and pray you won't meet me cleaning up your sloppy code.
