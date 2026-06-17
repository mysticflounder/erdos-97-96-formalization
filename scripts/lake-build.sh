#!/usr/bin/env bash
# Locked wrapper around `lake build` for the Erdos9796 public extract.
#
# Builds the whole proof library (both `Erdos9796` and `Erdos9796Proof`
# default targets). Holds a lockfile so concurrent invocations serialize
# rather than thrash the .lake build dir.
#
# The memory cap (-M16384) and thread stack (-s2097152) needed by the
# heavier case-split modules live in lean/lakefile.toml `moreLeanArgs`,
# which lake passes through to every module's elaboration.
#
# Usage:
#   ./scripts/lake-build.sh                 # build everything
#   ./scripts/lake-build.sh Erdos9796Proof  # build a single target
#
# On a fresh checkout, fetch the prebuilt mathlib cache first:
#   cd lean && lake exe cache get

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LEAN_ROOT="$ROOT/lean"
LOCKFILE="${LOCKFILE:-$LEAN_ROOT/.lake/lake-build.lock}"
REAL_LAKE="${REAL_LAKE:-$(command -v lake)}"

if [[ -z "$REAL_LAKE" ]]; then
  echo "lake not on PATH. Install via elan: https://leanprover-community.github.io/install/" >&2
  exit 1
fi

mkdir -p "$(dirname "$LOCKFILE")"

acquire_lock() {
  while true; do
    if (set -o noclobber; printf '%s\n' "$$" >"$LOCKFILE") 2>/dev/null; then
      return 0
    fi

    if IFS= read -r lock_pid <"$LOCKFILE" && [[ "$lock_pid" =~ ^[0-9]+$ ]] &&
        kill -0 "$lock_pid" 2>/dev/null; then
      echo "another lake build is already running (pid $lock_pid): $LOCKFILE" >&2
      exit 1
    fi

    rm -f "$LOCKFILE"
  done
}

# Only the invocation that actually acquired the lock may remove it; a
# contender that bailed on "already running" must not strip the holder's lock.
LOCK_ACQUIRED=0
cleanup() {
  if [[ "$LOCK_ACQUIRED" == "1" ]]; then
    rm -f "$LOCKFILE"
  fi
}
trap cleanup EXIT INT TERM HUP

acquire_lock
LOCK_ACQUIRED=1

cd "$LEAN_ROOT"
"$REAL_LAKE" build "$@"
