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
#                    `Headline.`-qualified names the manifests list
#   2. Run the axiom audit and check every reported axiom is in
#      `permitted_axioms`.
#   3. Cross-check that config.json's theorem_names and axiom-audit.lean's
#      #print axioms lines are the same set, so a theorem cannot be added to
#      one and silently skipped by the other.
#
# One manifest, config.json / axiom-audit.lean, permitting exactly
# {propext, Classical.choice, Quot.sound}.
#
# The loop below is still written over a `tier` list. It ran two manifests
# until 2026-08-18, when the compiler-trusted tier was retired: it gated six
# off-spine finite endpoints that `erdos97_rhs` cannot reach, so it added a
# published claim without gating any part of the proof. Keeping the loop shape
# means restoring a second manifest is a one-line change.
#
# Permitted sets are read from the config file, not hardcoded here, so the
# manifest stays the single source of truth.
#
# Statement identity between Challenge and Solution is checked by the real
# comparator run, not here. Exits 0 iff every listed theorem builds, reports
# only permitted axioms, and appears in both manifests.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

TMP="$(mktemp -d "${TMPDIR:-/tmp}/comparator.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

# Names listed by a tier's `#print axioms` audit file.
audit_names() {
  awk '$1 == "#print" && $2 == "axioms" { print $3 }' "$1" | sort
}

# Flatten `#print axioms` output into one axiom name per line. The reports wrap
# across lines, so track bracket state rather than assuming one report per line.
# A report is only opened by the "depends on axioms:" banner, so a bracket in
# unrelated output (a linter warning, say) cannot inject a phantom axiom name.
reported_axioms() {
  awk '
    BEGIN { inside = 0 }
    {
      line = $0
      ob = (index(line, "depends on axioms:") > 0) ? index(line, "[") : 0
      if (ob > 0) { inside = 1; line = substr(line, ob + 1) }
      if (inside == 0) next
      cb = index(line, "]")
      if (cb > 0) { line = substr(line, 1, cb - 1); inside = 0 }
      print line
    }
  ' "$1" | tr ',' '\n' | tr -d ' ' | awk 'NF' | sort -u
}

echo "== manifest cross-check =="
for tier in core; do
  case "$tier" in
    core)   cfg=comparator/config.json;        aud=comparator/axiom-audit.lean ;;
  esac
  jq -r '.theorem_names[]' "$cfg" | sort >"$TMP/$tier.names"
  audit_names "$aud" >"$TMP/$tier.audit"
  if ! diff -u "$TMP/$tier.names" "$TMP/$tier.audit"; then
    echo "FAIL [$tier]: $cfg theorem_names and $aud disagree (diff above)." >&2
    exit 1
  fi
  echo "OK [$tier]: $(wc -l <"$TMP/$tier.names" | tr -d ' ') names in both manifests"
done

echo "== building Challenge / Solution =="
./scripts/lake-build.sh Challenge Solution

fail=0
for tier in core; do
  case "$tier" in
    core)   cfg=comparator/config.json;        aud=comparator/axiom-audit.lean ;;
  esac
  names="$TMP/$tier.names"
  out="$TMP/$tier.out"
  tier_fail=0

  echo "== axiom audit [$tier] =="
  # `lake env lean` must run from `lean/`; the comparator sources live one level
  # up and are wired in as extra lean_lib targets with srcDir = "../comparator".
  ( cd lean && lake env lean "../$aud" ) >"$out" 2>&1 || {
    echo "FAIL [$tier]: $aud errored (renamed theorem? library not built?)" >&2
    cat "$out" >&2
    exit 1
  }

  if grep -Eiq "unknown identifier|unknown constant|error:" "$out"; then
    echo "FAIL [$tier]: audit reported an error:" >&2
    grep -Ei "unknown identifier|unknown constant|error:" "$out" >&2
    fail=1; tier_fail=1
  fi

  # Every reported axiom must appear in permitted_axioms. This subsumes the
  # sorryAx check (sorryAx is not in the permitted set) and catches custom
  # axioms — and, since the compiler-trusted tier was retired, it is also what
  # keeps `native_decide` out of the gated set: a listed theorem that starts
  # using it reports Lean.ofReduceBool, which config.json does not permit, and
  # there is no longer a second manifest to move it into.
  jq -r '.permitted_axioms[]' "$cfg" | sort -u >"$TMP/$tier.permitted"
  reported_axioms "$out" >"$TMP/$tier.reported"
  comm -23 "$TMP/$tier.reported" "$TMP/$tier.permitted" >"$TMP/$tier.extra"
  if [[ -s "$TMP/$tier.extra" ]]; then
    echo "FAIL [$tier]: axiom(s) not in $cfg permitted_axioms:" >&2
    sed 's/^/      /' "$TMP/$tier.extra" >&2
    fail=1; tier_fail=1
  fi

  want="$(wc -l <"$names" | tr -d ' ')"
  got="$(grep -Fc "depend" "$out" || true)"
  if [[ "$got" -ne "$want" ]]; then
    echo "FAIL [$tier]: expected $want axiom reports, got $got." >&2
    fail=1; tier_fail=1
  fi

  if [[ "$tier_fail" -eq 0 ]]; then
    # `paste -sd', '` would cycle the two delimiter characters; join explicitly.
    joined="$(awk '{ printf "%s%s", sep, $0; sep = ", " } END { print "" }' \
      "$TMP/$tier.permitted")"
    echo "OK [$tier]: $want theorems, axioms ⊆ {$joined}"
  else
    cat "$out" >&2
  fi
done

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi

echo
echo "OK: all comparator theorems build and respect the axiom budget."
echo "    Statement identity (Challenge vs Solution) is verified by the"
echo "    leanprover/comparator run against config.json."
