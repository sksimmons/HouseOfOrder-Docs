---
description: Product-level architecture shared by all HouseOfOrder clients.
---

# Product architecture

HouseOfOrder defines **one conceptual model** for every native client (iOS today, Android when it ships):

- **Families and individuals** — roster data, eligibility, contact info
- **Assignments** — scheduled cleaning dates and family slots
- **Attendance** — what happened on past assignments
- **Settings and templates** — rotation rules, email drafts, import/export

Describe behavior here **once**. Platform-specific storage, UI kits, and file formats belong under [Implementation](../implementation/index.md), not duplicate product stories here.

!!! note "Parity"

    Native apps should match in user-visible behavior. OS-specific affordances (e.g. back navigation) may differ; outcomes and data rules should not drift without an explicit decision recorded here or in [Guides](../guides/index.md).
