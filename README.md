# python-template

This is a template repository dedicated to ML projects in python. It provides some basic tools and configs necessary to start the development.

## Structure

- `.github` - CI/CD pipelines, usually named after repository host (`.github`, `.azure`, `.gitlab`, etc)
- `data` - if you need any data to be present locally, store it here
- `notebooks` - notebooks are particularly _meh_, but this is directory to put them
- `src` - here goes your project's code
- `src/cli` - project's entrpoints should be wrapper with CLI and exposed via Makefile, good idea to store them seperately

## Tools

When developing a project there's a need to automate some tedious stuff that helps you keep the repo clean and check it against common standards. These include managing the environment, dependencies, syntax, etc.

- [coverage](https://github.com/nedbat/coveragepy)
- [flake8](https://github.com/PyCQA/flake8)
- [isort](https://github.com/PyCQA/isort)
- [mypy](https://github.com/python/mypy)
- [poetry](https://github.com/python-poetry/poetry)

## [Makefile](Makefile)

To start your work, first you need to setup your local environment and hooks.

```sh
make install_dev
```

You gonna put your CLI here later. It already contains calls to build tools and checks. Use `build` to run them all (`isort`, `black`, `pre_commit`, `flake8`, `mypy`, `test`).

```sh
make build
```

Please not that `build` does not encompass the covarage and dependencies updates. These need to be ran separately. Coverage may not always be necessary and you're gonna be running `build` often while working locally. Updating dependencies should be aproached with utmost care, no reason to bump the versions all the time when code does the work it's intented for. Better use some automation tool like [dependabot](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file).

To quickly format your repo while coding run:

```sh
make format
```

Before you commit, awalys run a full check:

```sh
make build
```

## [pre-commit](.github/hooks/.pre-commit-config.yml)

This hook is here to prevent you from commiting any nasty code to your repository.

- syntax checks and fixers
- no commit to main branch (these should be only merged with PRs)
- [absolufy imports](https://github.com/MarcoGorelli/absolufy-imports)
- [isort](https://github.com/timothycrosley/isort)
- [black](https://github.com/psf/black)
- [flake8](https://gitlab.com/pycqa/flake8)

## Closing remarks

Hopefully this template helps you jump off the project. If any of these tools are unfamiliar to you, follow the links for more info on them. Feel free to customize it, this is a template after all. If you feel you don't need any of it, good luck to you and pray you won't meet me cleaning up your sloppy code.
