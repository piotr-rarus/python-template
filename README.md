# python-template

## Developer Guide

Setup your local environment:

```sh
make install_dev
```

This command will create local `.venv` managed by `poetry` and install `pre-commit`.

### [pre-commit](.github/hooks/.pre-commit-config.yml)

- syntax checks
- no commit to master
- `isort`
- `black`
- `flake8`

### [Makefile](Makefile)

- `setup_venv`
- `install_pre_commit`
- `install_dev`: : `setup_venv` `install_pre_commit`
- `isort`
- `black`
- `flake8`
- `format`: `isort` `black`
- `mypy`
- `pre_commit`
- `test`
- `test_cov`
- `compile_env`
- `build`: `isort` `black` `pre_commit` `flake8` `mypy` `test`

To quickly format repo while coding run:

```sh
make format
```

It's also useful to run `flake8` as `pre-commit` runs it only against staged files.

```sh
make flake8
```

Before you commit, it's good to run a full check:

```sh
make build
```
