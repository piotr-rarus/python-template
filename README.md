# python-template

[![python](https://img.shields.io/badge/Python-3.11-3776AB.svg?style=flat&logo=python&logoColor=white)](https://www.python.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![build](https://github.com/piotr-rarus/python-template/actions/workflows/build.yml/badge.svg)](https://github.com/piotr-rarus/python-template/actions/workflows/build.yml)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/charliermarsh/ruff/main/assets/badge/v2.json)](https://github.com/charliermarsh/ruff)
[![Checked with mypy](http://www.mypy-lang.org/static/mypy_badge.svg)](http://mypy-lang.org/)
[![Imports: isort](https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336)](https://pycqa.github.io/isort/)

Are you tired of dealing with messy code, debugging errors, and fixing bugs that could have been prevented with proper tools and practices? Do you want to improve the overall quality of your projects while saving time in the long run? Then this template is perfect for you!

This is a template repository dedicated to `Python` projects. It provides some basic tools and configs necessary to kickstart the development. It includes linting, type checking, package management, testing and CI.

## Prerequisites

In order to use this template, you need to have both `poetry` and `make` installed.

### Poetry

`poetry` is a package manager we're using. You can check the installation instructions [here](https://python-poetry.org/docs/#installing-with-the-official-installer). You should avoid installing `poetry` through `pip` as it is a system-level tool, separated from the `Python` runtime you're currently using. It enables us to treat `Python` as any other dependency and pin its version in `pyproject.toml`.

```sh
curl -sSL https://install.python-poetry.org | python3 -
```

### make

`make` is a utility tool that enables us to create aliases for commands we type in the console to run programs. It's much more efficient to use `make` so you don't have to memorize console commands. You can also expose your project's CLI via `Makefile`.

`make` should be available on most Linux distributions.

If you're using Windows, I would get [choco](https://chocolatey.org/install) first, then get `make` from `choco` package gallery.

```sh
choco install make
```

Mac users can pull it using `Homebrew`.

```sh
brew install make
```

## Getting started

To start your work, you need to set up your local environment and hooks.

```sh
make venv
```

Later you will define aliases for your CLI here. `Makefile` already contains calls to build tools and checks. Use `build` to run them all.

```Makefile
build: pre_commit mypy test
```

Please note that `build` does not encompass the coverage and dependencies updates. These need to be run separately. Coverage may not always be necessary and you're gonna be running `build` often while working locally. Updating dependencies should be approached with the utmost care, no reason to bump the versions all the time when code does the work it's intended for. Better use some automation tool like [dependabot](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file).

To quickly format your repo while coding run:

```sh
make format  # isort black
```

Before you commit, always run a full check. It's much faster to run it locally than to wait for CI build.

```sh
make build  # format lint test
```

## Structure

- `.github` - CI/CD pipelines, usually named after the repository host (`.github`, `.azure`, `.gitlab`, etc)
- `src` - here goes your project's code
- `src/cli` - project's entry points should be wrapped with CLI and exposed via Makefile, good idea to store them separately
- `.codespell` - whitelist for project-related terms
- `.coveragearc` - coverage config, usually you don't want to report coverage on CLI, tests and some expressions
- `.env.example` - here you should state any environment variables your project uses
- `.pre-commit-config.yaml` - pre-commit pipeline configuration
- `Makefile` - tasks definitions, much simpler to call `make` than writing whole commands in the terminal; it's also easy to check what project-specific functionalities you're exposing
- `mypy.ini` - `mypy` config, usually some of your dependencies won't be hinted so you're gonna ignore them here
- `poetry.lock` - compiled dependencies
- `poetry.toml` - `poetry` config, as you shouldn't enforce other devs where to put their virtual environment this must be a separate config file
- `pyproject.toml` - repo config

## Tools

When developing a project there's a need to automate some tedious stuff that helps you keep the repo clean and check it against common standards. These include managing the environment, dependencies, syntax, etc.

- [poetry](https://github.com/python-poetry/poetry)
- [flake8](https://github.com/PyCQA/flake8)
- [isort](https://github.com/PyCQA/isort)
- [ruff](https://github.com/charliermarsh/ruff)
- [black](https://github.com/psf/black)
- [pre-commit](https://pre-commit.com/)
- [mypy](https://github.com/python/mypy)
- [coverage](https://github.com/nedbat/coveragepy)

## [pre-commit](.github/hooks/.pre-commit-config.yml)

This hook is here to prevent you from committing any nasty code to your repository.

- miscellaneous syntax checks and fixers
- spell checks [(codespell)](https://github.com/codespell-project/codespell)
- sort imports [isort](https://github.com/timothycrosley/isort)
- upgrade old syntax to newer Python version [(pyupgrade)](https://github.com/asottile/pyupgrade)
- remove unnecessary `#noqa` comments [(yesqa)](https://github.com/asottile/yesqa)
- autoformatting [black](https://github.com/psf/black)
- finally some linter to be sure [flake8](https://gitlab.com/pycqa/flake8)

Why are we using the local environment to run pre-commit for us? This is rather unusual, isn't it? Yes - it is. You want to use the same versions of libs (`flake8`, `black`) and have them specified in a single file. Otherwise, you need to keep track of `pre-commit` dependencies as well. If you want a truly separate environment for the `pre-commit` - use dependency groups in your package manager.

## Closing remarks

Hopefully, this template helps you jump off your project. If any of these tools are unfamiliar to you, follow the links for more info on them. Feel free to customize it, this is a template after all. The point I often make while doing workshops is that you should make your own toolset. This is but an example. I usually look up how my favorite libraries are developed and take what I like. Just try not to overdo it. Don't use tools that are not necessary for your project. The main idea is to spend time actually coding, solving problems, and not thinking about code quality whatsoever.
