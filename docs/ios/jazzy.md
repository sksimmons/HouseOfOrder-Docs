# Generating Swift API documentation (Jazzy)

Public-facing product docs live in the **HouseOfOrder-Docs** repo. This page is for **HTML API reference** generated from `///` comments in the iOS target.

## Prerequisites

- Ruby and **Jazzy**: `gem install jazzy`
- Xcode command-line tools (same machine used to build the app)

## Generate

From the **HouseOfOrder-iOS** repository root (where `HouseOfOrder-iOS.xcodeproj` lives):

```bash
jazzy --config .jazzy.yaml
```

Output is written to **`Docs/jazzy-output/`** (ignored by git by default). Open `Docs/jazzy-output/index.html` in a browser.

## Configuration

Settings are in **`.jazzy.yaml`** (scheme `HouseOfOrder-iOS`, module `HouseOfOrder_iOS`). Adjust `author` / `author_url` if needed.

## Alternatives

- **DocC** (`xcodebuild docbuild`) integrates with Xcode; export and host separately if you prefer Apple’s toolchain over Jazzy.
