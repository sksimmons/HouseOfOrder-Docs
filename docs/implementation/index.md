---
description: Per-client implementation docs and parity with product behavior.
---

# Implementation (by client)

End-user documentation lives under [Guides](../guides/index.md) and [Architecture](../architecture/index.md). Those describe **what HouseOfOrder is**, once, for everyone.

This section is **for developers**: how each native app implements that behavior, where docstrings and generated API docs live, and whether the two clients stay aligned.

## Why separate pages?

- Swift and Kotlin live in different repositories with different tooling (e.g. Jazzy vs Dokka someday).
- Implementation details can diverge briefly during development; surfacing them per platform makes gaps visible.

## Parity rule of thumb

If the **product** docs say the app behaves a certain way, both clients should match. If **implementation** notes or generated references disagree with each other or with the guides, something is out of sync—either fix the code or update the canonical product doc.

## Contents

- [iOS](ios/index.md) — notes and structure for the Swift/SwiftUI app (synced from the iOS repo).
- [Android](android/index.md) — Kotlin implementation notes when the Android project is underway.
