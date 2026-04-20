---
description: Product-level architecture across HouseOfOrder apps.
---

# Product architecture

HouseOfOrder targets **one conceptual model** shared by iOS today and Android later:

- **Families and individuals** — roster data, eligibility, contact info
- **Assignments** — scheduled cleaning dates and family slots
- **Attendance** — what happened on past assignments
- **Settings and templates** — rotation rules, email drafts, import/export

Platform-specific storage and UI live in each app repo; this section is for **cross-platform** decisions and diagrams.

!!! tip

    When Android ships, add a short subsection here describing what is guaranteed identical vs. platform-specific.
