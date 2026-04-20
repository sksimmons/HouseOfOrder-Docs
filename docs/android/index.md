---
description: Kotlin/Android implementation notes and parity with iOS.
---

# Android implementation

The Android client will live in `HouseOfOrder-Android/` with the same **product** behavior as iOS: same concepts, flows, and outcomes wherever the OS allows.

## When this section fills in

- Add a `Docs/` tree in the Android repo (mirroring the iOS pattern).
- Add `scripts/sync-android-docs.sh` in this docs repo and sync into `docs/android/`.
- Link generated API docs (e.g. Dokka) here if you publish them.

!!! tip "Parity check"

    Keep [Guides](../guides/index.md) and [Architecture](../architecture/index.md) as the single source of truth for behavior. If Android implementation differs from those without a documented exception, treat it as a bug or a doc gap.
