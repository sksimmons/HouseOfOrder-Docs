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

## Sync iOS implementation docs

**User-facing** copy lives here under `docs/guides/` and `docs/architecture/`. **iOS-specific implementation** Markdown is authored in `../HouseOfOrder-iOS/Docs/` and copied into `docs/ios/` before build:

```bash
./scripts/sync-ios-docs.sh
```

Commit the updated `docs/ios/` files when you want the Markdown on the site to match your iOS repo (CI also clones `HouseOfOrder-iOS` to run **Jazzy**; see below).

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

GitHub Actions (`.github/workflows/docs.yml`) runs on **`macos-latest`**, then:

1. Builds the Zensical site into `site/`.
2. Checks out **`HouseOfOrder-iOS`**, runs **Jazzy**, and copies HTML into **`site/api/`** (live URL: `https://sksimmons.github.io/HouseOfOrder-Docs/api/`).

Push to `main` or `master`. Set **site_url** and **repo_url** in `zensical.toml` as needed.

### GitHub secret (private iOS repo)

If **`HouseOfOrder-iOS` is private**, add a repository secret named **`HOUSEOFORDER_IOS_CHECKOUT`** in **HouseOfOrder-Docs** → *Settings* → *Secrets and variables* → *Actions*: a fine-grained PAT with **Contents: Read** on that repo. **Public** iOS repos do not need this secret.

## Android

When the Android project has a `Docs/` folder, add a sibling script (e.g. `sync-android-docs.sh`) and a `docs/android/` tree the same way.
