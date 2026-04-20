---
description: SwiftUI, SwiftData, and app layers on iOS—implementation detail.
---

# iOS architecture (implementation)

## Stack

| Layer | Technology |
| ----- | ---------- |
| UI | SwiftUI |
| Persistence | SwiftData |
| Minimum OS | iOS 17+ |

## Structure (conceptual)

The app is organized around tabs (families, assignments, history, settings) with view models between SwiftUI and services that own SwiftData access and business rules.

Expand this page as patterns stabilize. Keep **user-visible rules** synchronized with [Guides](https://sksimmons.github.io/HouseOfOrder-Docs/guides/) and [product architecture](https://sksimmons.github.io/HouseOfOrder-Docs/architecture/) on this site—avoid duplicating coordinator documentation here.

## Sync

This file is mirrored to `HouseOfOrder-Docs/docs/ios/` by `scripts/sync-ios-docs.sh`.
