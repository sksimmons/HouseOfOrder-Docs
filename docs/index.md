---
icon: lucide/book-open
description: HouseOfOrder product documentation.
---

# HouseOfOrder documentation

HouseOfOrder helps church cleaning coordinators manage families, generate cleaning assignments, track attendance, and draft notification emails.

The product is delivered as **native iOS and Android apps** that are intended to match in **look, feel, and behavior**. User-facing documentation here is **one story**—how HouseOfOrder works—not separate manuals per platform.

## Where to read

| Section | Purpose |
| ------- | ------- |
| [Guides](guides/index.md) | How coordinators use the app (workflows, imports, troubleshooting). |
| [Architecture](architecture/index.md) | Product concepts and shared data model across clients. |
| [Implementation](implementation/index.md) | Per-platform notes for developers (Swift / Kotlin), **parity** expectations, and links to generated API docs. |
| [Swift API (Jazzy)](api/) | HTML reference generated from iOS `///` comments (updated on each site deploy). |

## How this site is built

- **Generator:** [Zensical](https://zensical.org/) (`zensical.toml` in this repo).
- **Implementation pages** under `docs/ios/` are synced from `HouseOfOrder-iOS/Docs/`; Android will follow the same pattern when that repo has a `Docs/` tree.

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
