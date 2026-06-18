# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Environment

This project runs inside a Dev Container using the image `ghcr.io/tarensanders/r-base:latest`. Open in VS Code with the Dev Containers extension, or via GitHub Codespaces. Data is bind-mounted at `/data` from a host path configured in `devcontainer.json`.

## Package Management

Packages are managed with [`capsule`](https://github.com/mjwestgate/capsule) (a wrapper around `renv`). The `renv/` directory is gitignored; the lockfile is tracked.

```r
capsule::create()      # initialise or rebuild the lockfile
capsule::install()     # restore packages from lockfile
```

## Workflow

Pipelines are built with [`targets`](https://docs.ropensci.org/targets/). The `_targets/` store is gitignored.

```r
targets::tar_make()          # run the full pipeline
targets::tar_make("name")    # run a single target
targets::tar_visnetwork()    # visualise the dependency graph
targets::tar_read("name")    # inspect a target's output
```

## Linting

Linting uses [`lintr`](https://lintr.r-lib.org/). Configuration lives in `.lintr` (gitignored at project root; add one per project).

```r
lintr::lint_dir()      # lint all R files
lintr::lint("file.R")  # lint a single file
```

## Project Conventions

- `data/` and `temp/` are gitignored — keep raw and intermediate data out of git.
- `.Renviron` is gitignored — store secrets and environment-specific paths there.
- `scratch.R` is gitignored — use it freely for throwaway exploration.
- Analysis scripts live alongside a `_targets.R` pipeline definition at the project root.
