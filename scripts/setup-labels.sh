#!/usr/bin/env bash
# Create/update the sr-release issue label set.
#
# GitHub has no way to define labels from a committed file, so this script is
# the source of truth. Run it once after creating the repo, and again whenever
# this list changes. Idempotent: --force updates a label that already exists.
#
# Requires the GitHub CLI (https://cli.github.com) authenticated against the repo.
# Run from inside a clone of sr-release, or pass --repo:
#   ./scripts/setup-labels.sh
#   ./scripts/setup-labels.sh --repo Original-JT/sr-release
set -euo pipefail

REPO_ARG=()
if [[ "${1:-}" == "--repo" && -n "${2:-}" ]]; then
  REPO_ARG=(--repo "$2")
fi

label() {
  # $1 = name, $2 = color (hex, no #), $3 = description
  gh label create "$1" --color "$2" --description "$3" --force ${REPO_ARG[@]+"${REPO_ARG[@]}"}
}

# --- Triage ---
label "bug"         "d73a4a" "Something isn't working the way it should"
label "enhancement" "a2eeef" "New capability or improvement"
label "needs-info"  "d876e3" "Waiting on more detail from the reporter"
label "duplicate"   "cfd3d7" "Already tracked by another issue"
label "wontfix"     "ffffff" "Out of scope or won't be addressed"
label "docs"        "0075ca" "Documentation, README, or guides"

# --- Runtime ---
label "runtime:node"    "f1e05a" "TypeScript/JavaScript on Node"
label "runtime:deno"    "f1e05a" "TypeScript/JavaScript on Deno"
label "runtime:bun"     "f1e05a" "TypeScript/JavaScript on Bun"
label "runtime:python"  "f1e05a" "Python (uv)"
label "runtime:ruby"    "f1e05a" "Ruby"
label "runtime:go"      "f1e05a" "Go"
label "runtime:haskell" "f1e05a" "Haskell"
label "runtime:julia"   "f1e05a" "Julia"
label "runtime:shell"   "f1e05a" "Bash/Zsh/Fish/Nushell/Dash"

# --- Platform ---
label "platform:macos"   "bfd4f2" "macOS (Apple Silicon)"
label "platform:linux"   "bfd4f2" "Linux (x86_64)"
label "platform:windows" "bfd4f2" "Windows (x86_64)"

# --- Area ---
label "area:install"       "5319e7" "Install script, bootstrap, mise provisioning"
label "area:registry-auth" "5319e7" "Private registries and feed authentication"
label "area:cache"         "5319e7" "Dependency cache and resolution"
label "area:upgrade"       "5319e7" "sr upgrade / self-update"

echo "Labels synced."
