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

# Extract exactly one axiom report for each name in the manifest. Lake may replay
# dependency compiler logs, so scanning every "depends on axioms" banner would
# incorrectly union unrelated reports into this audit. The report body may wrap
# across lines; Lean also emits a natural-language axiom-free report.
reported_axioms() {
  local out=$1
  local names=$2
  local report_names=$3
  local axioms=$4
  local status
  if awk -v names_file="$names" -v report_names="$report_names" -v axioms_file="$axioms" '
    function fail(message) {
      print message > "/dev/stderr"
      bad = 1
    }
    function emit(fragment, count, parts, i, item) {
      gsub(/[[:space:]]/, "", fragment)
      count = split(fragment, parts, ",")
      for (i = 1; i <= count; i++) {
        item = parts[i]
        if (item != "") print item >> axioms_file
      }
    }
    function consume(fragment, open, closing, body) {
      if (awaiting == 1 && inside == 0) {
        open = index(fragment, "[")
        if (open == 0) return
        fragment = substr(fragment, open + 1)
        inside = 1
        awaiting = 0
      }
      if (inside == 0) return
      closing = index(fragment, "]")
      if (closing > 0) {
        body = substr(fragment, 1, closing - 1)
        emit(body)
        inside = 0
      } else {
        emit(fragment)
      }
    }
    BEGIN {
      while ((getline name < names_file) > 0) {
        if (name in expected) fail("duplicate manifest name: " name)
        expected[name] = 1
      }
      close(names_file)
    }
    {
      line = $0
      sub(/^[[:space:]]+/, "", line)
      if (match(line, /^info: .*:[0-9]+:[0-9]+: /)) {
        line = substr(line, RSTART + RLENGTH)
      }
      header = ""
      name = ""
      if (substr(line, 1, 1) == sprintf("%c", 39)) {
        quoted = substr(line, 2)
        quote = index(quoted, sprintf("%c", 39))
        if (quote > 0) {
          name = substr(quoted, 1, quote - 1)
          suffix = substr(quoted, quote + 1)
          if (index(suffix, " depends on axioms:") == 1) {
            header = "depends"
            fragment = substr(suffix, length(" depends on axioms:") + 1)
          } else if (index(suffix, " does not depend on any axioms") == 1) {
            header = "none"
          }
        }
      }
      if (header != "" && (awaiting == 1 || inside == 1)) {
        fail("unterminated axiom report before: " name)
        awaiting = 0
        inside = 0
      }
      if (header != "") {
        if (name in expected) {
          if (seen[name] == 1) {
            fail("duplicate axiom report: " name)
          } else {
            seen[name] = 1
            print name >> report_names
            if (header == "depends") {
              awaiting = 1
              consume(fragment)
            }
          }
        }
      } else if (awaiting == 1 || inside == 1) {
        consume(line)
      }
    }
    END {
      if (awaiting == 1 || inside == 1) fail("unterminated axiom report")
      for (name in expected) {
        if (seen[name] != 1) fail("missing axiom report: " name)
      }
      if (bad == 1) exit 1
    }
  ' "$out"; then
    status=0
  else
    status=$?
  fi
  sort -u "$axioms" -o "$axioms"
  return "$status"
}

echo "== manifest cross-check =="
for tier in core; do
  case "$tier" in
    core)
      cfg=comparator/config.json
      aud=comparator/axiom-audit.lean
      audit_target=ComparatorAxiomAudit
      ;;
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
lake-build Challenge Solution

fail=0
for tier in core; do
  case "$tier" in
    core)   cfg=comparator/config.json;        aud=comparator/axiom-audit.lean ;;
  esac
  names="$TMP/$tier.names"
  out="$TMP/$tier.out"
  tier_fail=0

  echo "== axiom audit [$tier] =="
  # Build the audit through the global wrapper. The Lake target is rooted at
  # comparator/axiom-audit.lean; when cached, Lake replays its saved compiler
  # log, including every #print axioms report, so `out` stays complete.
  lake-build "$audit_target" >"$out" 2>&1 || {
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
  # axioms — and, since the compiler-trusted tier was retired, it also keeps
  # `native_decide` out of the gated set: Lean 4.33 reports generated
  # `_native.native_decide.ax_*` axioms for it, and config.json permits none of
  # those names.
  jq -r '.permitted_axioms[]' "$cfg" | sort -u >"$TMP/$tier.permitted"
  : >"$TMP/$tier.report-names"
  : >"$TMP/$tier.reported"
  if ! reported_axioms "$out" "$names" "$TMP/$tier.report-names" "$TMP/$tier.reported"; then
    echo "FAIL [$tier]: audit output is missing or duplicates a named theorem report." >&2
    fail=1; tier_fail=1
  else
    comm -23 "$TMP/$tier.reported" "$TMP/$tier.permitted" >"$TMP/$tier.extra"
    if [[ -s "$TMP/$tier.extra" ]]; then
      echo "FAIL [$tier]: axiom(s) not in $cfg permitted_axioms:" >&2
      sed 's/^/      /' "$TMP/$tier.extra" >&2
      fail=1; tier_fail=1
    fi
  fi

  want="$(wc -l <"$names" | tr -d ' ')"
  got="$(wc -l <"$TMP/$tier.report-names" | tr -d ' ')"
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
