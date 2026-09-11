#!/usr/bin/env bash
# Repeatable acceptance checks for the Lean/mathlib toolchain pin.
#
# Implements Gate E of docs/plans/2026-09-05-lean-mathlib-v4331-upgrade-audit.md:
# toolchain-file equality, exact dependency resolution, doc-comment placement,
# the full supported root set, the comparator preflight, and the
# axiom/obligation regression.
#
# Usage:
#   scripts/check_migration_gates.sh            # everything
#   scripts/check_migration_gates.sh --fast     # skip the two full builds
#
# Exit status is 0 only when every selected check passes. Each check prints one
# OK or FAIL line; FAIL lines carry the observed and expected values.
set -uo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT" || exit 2

FAST=0
[ "${1:-}" = "--fast" ] && FAST=1

failures=0
ok()   { printf 'OK   [%s] %s\n' "$1" "$2"; }
fail() { printf 'FAIL [%s] %s\n' "$1" "$2"; failures=$((failures + 1)); }

# 1. Toolchain-file equality ------------------------------------------------
root_toolchain=$(tr -d '[:space:]' < lean-toolchain 2>/dev/null)
lean_toolchain=$(tr -d '[:space:]' < lean/lean-toolchain 2>/dev/null)
if [ -z "$root_toolchain" ] || [ -z "$lean_toolchain" ]; then
  fail toolchain "a toolchain file is missing or empty"
elif [ "$root_toolchain" != "$lean_toolchain" ]; then
  fail toolchain "root '$root_toolchain' != lean/ '$lean_toolchain'"
else
  ok toolchain "$root_toolchain"
fi

# 2. Exact dependency resolution -------------------------------------------
# Every `rev` the lakefile requires must be the `inputRev` the manifest resolved.
mismatch=$(uv run python - <<'PY'
import json, re, sys, tomllib
from pathlib import Path

lakefile = tomllib.loads(Path("lean/lakefile.toml").read_text())
manifest = json.loads(Path("lean/lake-manifest.json").read_text())
resolved = {p.get("name"): p.get("inputRev") for p in manifest.get("packages", [])}
bad = []
for require in lakefile.get("require", []):
    name, rev = require.get("name"), require.get("rev")
    if rev is None:
        continue
    if resolved.get(name) != rev:
        bad.append(f"{name}: lakefile {rev} != manifest {resolved.get(name)}")
print("; ".join(bad))
PY
)
if [ -n "$mismatch" ]; then
  fail dependencies "$mismatch"
else
  ok dependencies "lakefile revs match lake-manifest.json"
fi

# 3. Doc-comment placement ------------------------------------------------
# A doc comment that follows another doc comment, or that sits between an
# attribute and its declaration, is a parse error. Two bulk docstring passes
# landed both shapes without a build; the scan is cheap, so it runs before the
# builds rather than after them.
if placement=$(uv run python scripts/check_lean_docstring_placement.py lean 2>&1); then
  ok docstrings "no misplaced doc comments"
else
  fail docstrings "$(printf '%s' "$placement" | head -3 | tr '\n' ' ')"
fi

# 4. Full supported roots ---------------------------------------------------
# Every lean_lib the lakefile declares, not only defaultTargets. A library
# without `roots`/`globs` compiles only its own import closure, so a root that
# is declared but never built hides regressions indefinitely.
roots=$(uv run python - <<'PY'
import tomllib
from pathlib import Path
lakefile = tomllib.loads(Path("lean/lakefile.toml").read_text())
names = [lib["name"] for lib in lakefile.get("lean_lib", [])]
print(" ".join(n for n in names if n.startswith("Erdos9796")))
PY
)
if [ "$FAST" = "1" ]; then
  ok roots "declared: $roots (build skipped, --fast)"
else
  if lake-build $roots >/tmp/gate-e-roots.log 2>&1; then
    ok roots "lake-build $roots"
  else
    fail roots "lake-build $roots failed; see /tmp/gate-e-roots.log"
  fi
fi

# 5. Comparator preflight ---------------------------------------------------
if [ "$FAST" = "1" ]; then
  ok comparator "skipped (--fast)"
elif bash comparator/check-conformance.sh >/tmp/gate-e-conformance.log 2>&1; then
  ok comparator "check-conformance.sh"
else
  fail comparator "check-conformance.sh failed; see /tmp/gate-e-conformance.log"
fi

# 6. Axiom and obligation regression ---------------------------------------
# `proof-blueprint spine` is the authority on both: it reports the open-node
# count and whether every branch closes under the approved axiom set.
if spine=$(proof-blueprint spine 2>&1); then
  if grep -q "kernel-complete" <<<"$spine"; then
    ok spine "$(grep -m1 '^open:' <<<"$spine")"
  else
    fail spine "not kernel-complete under the approved axiom set"
  fi
else
  fail spine "proof-blueprint spine exited non-zero"
fi

printf '\n'
if [ "$failures" -eq 0 ]; then
  printf 'GATE-E OK\n'
else
  printf 'GATE-E FAILED (%d check(s))\n' "$failures"
fi
exit "$failures"
