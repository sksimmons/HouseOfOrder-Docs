#!/usr/bin/env bash
# Copy public iOS Markdown from the iOS repo into this site's docs/ios/ tree.
# Run from anywhere; paths are resolved relative to this script.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCS_REPO="$(cd "${SCRIPT_DIR}/.." && pwd)"
IOS_DOCS="${DOCS_REPO}/../HouseOfOrder-iOS/Docs"
DEST="${DOCS_REPO}/docs/ios"

if [[ ! -d "${IOS_DOCS}" ]]; then
  echo "error: iOS docs source not found: ${IOS_DOCS}" >&2
  exit 1
fi

mkdir -p "${DEST}"
rsync -a --delete "${IOS_DOCS}/" "${DEST}/"
echo "Synced ${IOS_DOCS} -> ${DEST}"
