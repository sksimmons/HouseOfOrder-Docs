# HouseOfOrder documentation framework

This file is the working plan for how documentation is structured across the HouseOfOrder workspace. It replaces the earlier draft that mixed Grok output with placeholder text.

## Goals

- **Public site** from `HouseOfOrder-Docs` only (no private app source on GitHub Pages).
- **Single workspace** in Cursor: edit iOS (or later Android) Markdown and the static site together.
- **Flexible**: add pages and nav entries as you go; swap generators later if needed (Zensical aims for MkDocs-style config compatibility).

## Tooling

| Piece | Choice |
| ----- | ------ |
| Static site generator | **Zensical** (`zensical.toml` in `HouseOfOrder-Docs`) |
| Python | **3.10+** (see `requirements.txt`; avoid macOS/Xcode 3.9 for installs) |
| Theme | Zensical default (“modern” variant); switch to `classic` in `[project.theme]` if you want classic Material look |

MkDocs is not required. Zensical reads Markdown, uses a Material-compatible theme, and is actively developed by the same folks who built Material for MkDocs.

## Repository layout (this monorepo)

```text
HouseOfOrder/
├── HouseOfOrder-iOS/          # private app repo (when split)
│   └── Docs/                  # SOURCE: public-facing iOS Markdown
├── HouseOfOrder-Android/      # future Android port
│   └── Docs/                  # future: same pattern as iOS
└── HouseOfOrder-Docs/         # public docs repo (when split)
    ├── zensical.toml
    ├── requirements.txt
    ├── docs/                  # SITE ROOT (plus generated copies)
    │   ├── index.md
    │   ├── architecture/
    │   ├── android/
    │   ├── guides/
    │   └── ios/               # COPIED from HouseOfOrder-iOS/Docs by sync script
    └── scripts/
        └── sync-ios-docs.sh
```

## Authoring workflow

1. **Product / cross-platform pages** — Edit files under `HouseOfOrder-Docs/docs/` (e.g. `architecture/`, `guides/`, `android/`).
2. **iOS-specific public docs** — Edit under `HouseOfOrder-iOS/Docs/`.
3. **Sync** — From `HouseOfOrder-Docs`, run `./scripts/sync-ios-docs.sh` so `docs/ios/` matches the iOS repo.
4. **Preview** — `zensical serve` (after `pip install -r requirements.txt` in a venv).
5. **Commit** — Commit both the iOS `Docs/` changes and the synced `HouseOfOrder-Docs/docs/ios/` files when you want the published site updated. CI does **not** clone the private iOS repo; it only builds what is in the docs repo.

Internal-only material stays in `_Design_Docs/` (or similar) inside the iOS project until you deliberately promote it into `Docs/`.

## Navigation

Top-level nav is **explicit** in `zensical.toml` (`[project] nav`). When you add pages:

- Add the Markdown file under `docs/` (or under `HouseOfOrder-iOS/Docs/` and sync).
- Add the path to `nav` in `zensical.toml`.

Alternatively, comment out `nav` and rely on **implicit** navigation from the folder tree (Zensical default).

## CI / GitHub Pages

`.github/workflows/docs.yml` runs on push to `main` or `master`: install Zensical, `zensical build --clean`, deploy `site/` to GitHub Pages.

Before going live, set **`site_url`** (and optionally **`repo_url`**) in `zensical.toml` to your real URLs. Instant navigation and search features expect a proper `site_url`.

## Future extensions

| Topic | Direction |
| ----- | --------- |
| Android | Add `HouseOfOrder-Android/Docs/` and `scripts/sync-android-docs.sh` mirroring iOS. |
| API / code reference | Swift: Jazzy or hand-written summaries linked from `docs/ios/`. Kotlin: Dokka later. |
| Python | Only if shared Python appears; then consider docstring plugins once Zensical exposes an equivalent. |

## Refactoring away from Zensical

Config is **`zensical.toml`** with MkDocs-style concepts. If you ever move to plain MkDocs or another tool, much of the content (Markdown, nav ideas) transfers; only the config file and build commands change.
