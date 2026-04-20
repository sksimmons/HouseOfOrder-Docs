# HouseOfOrder-Docs

Public documentation for HouseOfOrder, built with [Zensical](https://zensical.org/).

## Prerequisites

- Python **3.10 or newer** (3.12 recommended). The system Python on macOS may be older; use [uv](https://docs.astral.sh/uv/) or [Homebrew](https://brew.sh/) Python if needed.

## One-time setup

```bash
cd HouseOfOrder-Docs
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Sync iOS Markdown

iOS documentation is authored in `../HouseOfOrder-iOS/Docs/`. Copy it into this site before building or serving:

```bash
./scripts/sync-ios-docs.sh
```

Commit the updated `docs/ios/` files in this repo when you want the published site to pick them up (keeps GitHub Actions simple: no access to private repos required).

## Preview locally

```bash
source .venv/bin/activate
./scripts/sync-ios-docs.sh
zensical serve
```

## Build static site

```bash
zensical build --clean
```

Output is written to `site/`.

## Publishing

GitHub Actions (`.github/workflows/docs.yml`) builds and deploys to GitHub Pages on push to `main` or `master`. Set **site_url** and optionally **repo_url** in `zensical.toml` when you know the real Pages URL and repository.

## Android

When the Android project has a `Docs/` folder, add a sibling script (e.g. `sync-android-docs.sh`) and a `docs/android/` tree the same way.
