# Generating Swift API documentation (Jazzy)

Public-facing product docs live in the **HouseOfOrder-Docs** repo. This page is for **HTML API reference** generated from `///` comments in the iOS target.

## Prerequisites

- **Ruby** (2.x or newer) and **Jazzy** (`gem install jazzy` after Ruby is on your `PATH`)
- Xcode command-line tools (same machine used to build the app)

### Homebrew Ruby on Intel Mac (`/usr/local`)

Homebrew’s Ruby is *keg-only*: it is not on your `PATH` until you add it. You also need the directory where **gem** installs command-line tools (including `jazzy`).

Add both to `~/.zshrc` (order matters—Ruby first, then gem bin):

```bash
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/4.0.0/bin:$PATH"
```

If Homebrew upgrades Ruby later, the gem path may change (e.g. `4.0.0` → `4.1.0`). Re-run `brew info ruby` and adjust, or run `gem environment` and use the `EXECUTABLE DIRECTORY` line.

Then open a new terminal (or `source ~/.zshrc`) and install:

```bash
gem install jazzy
```

**Note:** `LDFLAGS` / `CPPFLAGS` from `brew info ruby` are only needed when **compiling** native code against that Ruby; ordinary `gem install jazzy` usually does not require them.

### Apple Silicon (`/opt/homebrew`)

Use `brew info ruby` for current paths; typically:

```bash
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin:$PATH"
```

(Replace the gem version folder if `brew` shows a different one.)

## Generate

From the **HouseOfOrder-iOS** repository root (where `HouseOfOrder-iOS.xcodeproj` lives):

```bash
jazzy --config .jazzy.yaml
```

Output is written to **`Docs/jazzy-output/`** (ignored by git by default). Open `Docs/jazzy-output/index.html` in a browser.

## Published copy (GitHub Pages)

The **HouseOfOrder-Docs** workflow runs Jazzy on **macOS** on every push to `main`, merges the result into **`site/api/`**, and deploys with the Zensical site. The live API browser is:

**https://sksimmons.github.io/HouseOfOrder-Docs/api/**

If **`HouseOfOrder-iOS` is private**, add the repository secret **`HOUSEOFORDER_IOS_CHECKOUT`** to the **HouseOfOrder-Docs** repo (PAT with read access to the iOS repo). Public iOS repos do not need this secret.

## Configuration

Settings are in **`.jazzy.yaml`** (scheme `HouseOfOrder-iOS`, module `HouseOfOrder_iOS`). Adjust `author` / `author_url` if needed.

## Troubleshooting

### `sqlite3` / `pkg_config` during `gem install jazzy`

If the install fails while **building native extensions** for `sqlite3` with:

`Please install either the pkg-config utility or the pkg-config rubygem`

Install the CLI tool, then retry:

```bash
brew install pkg-config
gem install jazzy
```

If it still fails, ensure SQLite is available:

```bash
brew install sqlite
gem install jazzy
```

## Alternatives

- **DocC** (`xcodebuild docbuild`) integrates with Xcode; export and host separately if you prefer Apple’s toolchain over Jazzy.
