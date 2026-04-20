---
description: SwiftUI, SwiftData, and major app layers on iOS.
---

# iOS architecture (overview)

## Stack

| Layer | Technology |
| ------|------------ |
| UI | SwiftUI |
| Persistence | SwiftData |
| Minimum OS | iOS 17+ |

## Structure (conceptual)

The app is organized around tabs (families, assignments, history, settings) with view models mediating between SwiftUI views and services that own SwiftData access and business rules.

!!! note "Living document"

    Expand this page as you stabilize patterns (e.g. how assignments are generated, how imports merge). Keep marketing-friendly prose in the main docs repo `index.md` if needed.

## Sync reminder

Edits here are mirrored to `HouseOfOrder-Docs/docs/ios/` by `HouseOfOrder-Docs/scripts/sync-ios-docs.sh`.
