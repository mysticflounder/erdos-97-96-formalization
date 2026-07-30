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
#   2. For each tier, run its axiom audit and check every reported axiom is in
#      that tier's `permitted_axioms`.
#   3. Cross-check that each tier's config theorem_names and its audit file's
#      #print axioms lines are the same set, so a theorem cannot be added to
#      one and silently skipped by the other.
#   4. Check the two tiers list disjoint theorem sets.
#
# The tiers:
#   core   — config.json / axiom-audit.lean
#            permitted: {propext, Classical.choice, Quot.sound}
#   native — config-native.json / axiom-audit-native.lean
#            permitted: those three plus {Lean.ofReduceBool, Lean.trustCompiler}
#            for proofs that discharge the exact-ten certificate bank by
#            `native_decide`, under the project's bv_decide standard.
#
# Permitted sets are read from the config files, not hardcoded here, so the
# manifests stay the single source of truth.
#
# Statement identity between Challenge and Solution is checked by the real
# comparator run, not here. Exits 0 iff every listed theorem builds, reports
# only axioms its tier permits, and appears in both of its tier's manifests.
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
for tier in core native; do
  case "$tier" in
    core)   cfg=comparator/config.json;        aud=comparator/axiom-audit.lean ;;
    native) cfg=comparator/config-native.json; aud=comparator/axiom-audit-native.lean ;;
  esac
  jq -r '.theorem_names[]' "$cfg" | sort >"$TMP/$tier.names"
  audit_names "$aud" >"$TMP/$tier.audit"
  if ! diff -u "$TMP/$tier.names" "$TMP/$tier.audit"; then
    echo "FAIL [$tier]: $cfg theorem_names and $aud disagree (diff above)." >&2
    exit 1
  fi
  echo "OK [$tier]: $(wc -l <"$TMP/$tier.names" | tr -d ' ') names in both manifests"
done

comm -12 "$TMP/core.names" "$TMP/native.names" >"$TMP/overlap"
if [[ -s "$TMP/overlap" ]]; then
  echo "FAIL: a theorem is listed in both tiers:" >&2
  cat "$TMP/overlap" >&2
  echo "      Each theorem belongs to exactly one tier — the weakest that" >&2
  echo "      admits its axiom closure." >&2
  exit 1
fi
echo "OK: tiers are disjoint"

echo "== building Challenge / Solution =="
./scripts/lake-build.sh Challenge Solution

fail=0
for tier in core native; do
  case "$tier" in
    core)   cfg=comparator/config.json;        aud=comparator/axiom-audit.lean ;;
    native) cfg=comparator/config-native.json; aud=comparator/axiom-audit-native.lean ;;
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

  # Every reported axiom must appear in this tier's permitted_axioms. This
  # subsumes the sorryAx check (sorryAx is in no tier's permitted set) and
  # catches custom axioms and cross-tier leakage — e.g. a core-tier theorem
  # that starts using `native_decide` reports Lean.ofReduceBool, which core
  # does not permit.
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
echo "OK: all comparator theorems build and respect their tier's axiom budget."
echo "    Statement identity (Challenge ≡ Solution) is verified by the"
echo "    leanprover/comparator run, once per tier config."
