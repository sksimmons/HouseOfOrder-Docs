---
icon: lucide/book-open
description: HouseOfOrder product documentation.
---

# HouseOfOrder documentation

Welcome. This site covers the **HouseOfOrder** family of apps for church building cleaning rotations: coordinator workflows, platform notes, and guides.

## Platforms

| Platform | Status | Section |
| -------- | ------ | ------- |
| iOS | Active | [iOS](ios/index.md) |
| Android | Planned | [Android](android/index.md) |

## How this site is built

- **Generator:** [Zensical](https://zensical.org/) (Material-compatible, `zensical.toml` in this repo).
- **iOS content:** Markdown authored under `HouseOfOrder-iOS/Docs/`, then synced into `docs/ios/` so the public repo never needs private submodules for day-to-day work.

## Local preview

From `HouseOfOrder-Docs/` (Python 3.10+ recommended):

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
./scripts/sync-ios-docs.sh
zensical serve
```

Then open the URL shown in the terminal (default `http://localhost:8000`).
