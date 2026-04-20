# HouseOfOrder documentation framework

Working plan for documentation across the HouseOfOrder workspace.

## Goals

- **Public site** from `HouseOfOrder-Docs` only (no private app source on GitHub Pages).
- **Single workspace** in Cursor: edit app repos and the static site together.
- **One product story** for coordinators: [Guides](docs/guides/index.md) and [Architecture](docs/architecture/index.md) describe behavior **once**, for all native clients.
- **Per-client implementation** under [Implementation](docs/implementation/index.md): `docs/ios/` (synced from iOS), later `docs/android/`, for Swift/Kotlin, docstrings, and parity checks—not duplicate user manuals.

## Tooling

| Piece | Choice |
| ----- | ------ |
| Static site generator | **Zensical** (`zensical.toml` in `HouseOfOrder-Docs`) |
| Python | **3.10+** (see `requirements.txt`; avoid macOS/Xcode 3.9 for installs) |
| Theme | Zensical default (“modern” variant); `classic` in `[project.theme]` if you want classic Material look |

## Repository layout (monorepo)

```text
HouseOfOrder/
├── HouseOfOrder-iOS/
│   └── Docs/                  # SOURCE → synced to docs/ios/ (implementation)
├── HouseOfOrder-Android/
│   └── Docs/                  # future: sync to docs/android/
└── HouseOfOrder-Docs/
    ├── zensical.toml
    ├── requirements.txt
    ├── docs/
    │   ├── index.md           # product home
    │   ├── guides/            # user-facing, platform-agnostic
    │   ├── architecture/    # product model, shared across clients
    │   ├── implementation/  # explains dev vs user split + parity
    │   ├── ios/             # COPIED from HouseOfOrder-iOS/Docs
    │   └── android/         # hand-written or synced later
    └── scripts/
        └── sync-ios-docs.sh
```

## Authoring workflow

1. **Coordinators / “how it works”** — Edit `HouseOfOrder-Docs/docs/guides/` and product `architecture/` in the docs repo.
2. **iOS implementation** — Edit `HouseOfOrder-iOS/Docs/`, then run `./scripts/sync-ios-docs.sh` so `docs/ios/` matches.
3. **Preview** — `zensical serve` (after `pip install -r requirements.txt` in a venv).
4. **Commit** — Commit docs-repo changes; when iOS `Docs/` changes, commit both the iOS repo and the synced `docs/ios/` if you want CI/Pages updated without cloning private repos.

Internal-only material stays in `_Design_Docs/` until you promote it.

## Navigation

Explicit `nav` in `zensical.toml`: Home → Guides → Architecture → Implementation (hub + iOS + Android). Adjust as you add pages.

## CI / GitHub Pages

`.github/workflows/docs.yml` on push to `main` or `master` (runs on **macOS**): install Zensical, `zensical build --clean`, clone **HouseOfOrder-iOS**, run **Jazzy**, merge HTML into `site/api/`, deploy `site/`. If the iOS repo is private, set secret **`HOUSEOFORDER_IOS_CHECKOUT`** on the docs repo (PAT with read access to iOS).

## Future extensions

| Topic | Direction |
| ----- | --------- |
| Android sync | `HouseOfOrder-Android/Docs/` + `sync-android-docs.sh` → `docs/android/` |
| API reference | Jazzy / Dokka output linked from implementation sections |

## Refactoring away from Zensical

Config is **`zensical.toml`**. Markdown and structure transfer; only build commands change if you switch tools.
