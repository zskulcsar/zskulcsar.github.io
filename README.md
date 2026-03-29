# zskulcsar.github.io

Personal tech blog built with Jekyll and intended for GitHub Pages.

## Local development

Install dependencies, then run the local server:

```bash
uv sync
make serve
```

The site will be available at `http://127.0.0.1:8000`.

## Build

```bash
make build
```

## Deploy

```bash
make deploy
```

This uses Jekyll build and GitHub Pages deployment, which publishes the generated site to the `gh-pages` branch.
