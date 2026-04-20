---
icon: lucide/smartphone
description: iOS implementation notes and parity with the shared product spec.
---

# iOS implementation

Swift/SwiftUI client for HouseOfOrder. **Product** behavior—what users see and do—is documented in the main site under **Guides** and **Architecture**; this tree is for **how the iOS app implements** that behavior and stays aligned with Android.

## Audience

- Contributors working in the iOS codebase
- Anyone comparing Swift implementation to the Kotlin app (parity checks)

## On the documentation site

- [Guides](https://sksimmons.github.io/HouseOfOrder-Docs/guides/) — coordinator workflows (platform-agnostic)
- [Implementation hub](https://sksimmons.github.io/HouseOfOrder-Docs/implementation/) — how per-client docs fit together
- [Architecture overview](architecture/overview.md) — iOS stack and layering (SwiftUI, SwiftData)

## API reference (Swift)

Run **Jazzy** locally to build HTML from `///` doc comments in the app target. See [jazzy.md](jazzy.md).

## Source and sync

This content is edited in **HouseOfOrder-iOS** under `Docs/` and copied into the public docs repo with `scripts/sync-ios-docs.sh`. Internal design notes stay in `_Design_Docs/` unless promoted here.

## Parity

If something here contradicts the guides or the Android implementation notes, the product spec or the code needs to catch up—see the [Implementation](https://sksimmons.github.io/HouseOfOrder-Docs/implementation/) introduction.
