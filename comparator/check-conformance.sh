#!/usr/bin/env bash
# Offline pre-flight for the comparator auditability gate. This does NOT replace
# a real leanprover/comparator run (which re-exports both modules through
# lean4export, checks statement identity, and re-runs the nanoda and Lean
# default kernels — see comparator/README.md). It is the cheap check every
# commit can run:
#
#   1. Build the two comparator modules:
#        Challenge — mathlib-only sorry stubs (must elaborate against Mathlib
#                    alone; it does not import the project at all)
#        Solution  — project proofs discharging each stub, under the SAME
#                    `Headline.`-qualified names comparator/config.json lists
#   2. Run the axiom audit: every Solution theorem's #print axioms closure must
#      be a subset of {propext, Classical.choice, Quot.sound}.
#   3. Cross-check that config.json's theorem_names and axiom-audit.lean's
#      #print axioms lines are the same set, so a theorem cannot be added to
#      one and silently skipped by the other.
#
# Statement identity between Challenge and Solution is checked by the real
# comparator run, not here. Exits 0 iff every listed theorem builds, is
# axiom-clean, and appears in both manifests.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "== manifest cross-check (config.json vs axiom-audit.lean) =="
CFG="$(mktemp "${TMPDIR:-/tmp}/comparator-cfg.XXXXXX")"
AUD="$(mktemp "${TMPDIR:-/tmp}/comparator-aud.XXXXXX")"
OUT="$(mktemp "${TMPDIR:-/tmp}/comparator-audit.XXXXXX")"
trap 'rm -f "$CFG" "$AUD" "$OUT"' EXIT

jq -r '.theorem_names[]' comparator/config.json | sort >"$CFG"
awk '$1 == "#print" && $2 == "axioms" { print $3 }' \
  comparator/axiom-audit.lean | sort >"$AUD"

if ! diff -u "$CFG" "$AUD"; then
  echo "FAIL: config.json theorem_names and axiom-audit.lean disagree (diff above)." >&2
  exit 1
fi
NAMES="$(wc -l <"$CFG" | tr -d ' ')"
echo "OK: $NAMES names listed in both manifests"

echo "== building Challenge / Solution =="
./scripts/lake-build.sh Challenge Solution

echo "== axiom audit (Solution theorems) =="
# `lake env lean` must run from `lean/`; the comparator sources live one level up
# and are wired in as extra lean_lib targets with srcDir = "../comparator".
( cd lean && lake env lean ../comparator/axiom-audit.lean ) >"$OUT" 2>&1 || {
  echo "FAIL: axiom-audit.lean errored (renamed theorem? library not built?)" >&2
  cat "$OUT" >&2
  exit 1
}

fail=0
if grep -Eiq "sorryAx|unknown identifier|unknown constant|error:" "$OUT"; then
  echo "FAIL: audit reported sorry/error:" >&2
  grep -Ei "sorryAx|unknown identifier|unknown constant|error:" "$OUT" >&2
  fail=1
fi
# Project policy permits native_decide under the bv_decide standard, but the
# comparator set deliberately excludes it: permitted_axioms in config.json is
# exactly {propext, Classical.choice, Quot.sound}.
if grep -Fq "Lean.ofReduce" "$OUT" || grep -Fq "Lean.trustCompiler" "$OUT"; then
  echo "FAIL: a Solution theorem uses native_decide (Lean.ofReduceBool /" >&2
  echo "      Lean.trustCompiler); not permitted in this comparator set." >&2
  fail=1
fi

GOT="$(grep -Fc "depend" "$OUT" || true)"
if [[ "$GOT" -ne "$NAMES" ]]; then
  echo "FAIL: expected $NAMES axiom reports, got $GOT." >&2
  fail=1
fi

if [[ "$fail" -ne 0 ]]; then
  cat "$OUT" >&2
  exit 1
fi

echo "OK: $NAMES comparator theorems build and are axiom-clean"
echo "    (subset of {propext, Classical.choice, Quot.sound}; no sorryAx, no native_decide)."
echo "    Statement identity (Challenge ≡ Solution) is verified by the leanprover/comparator run."
