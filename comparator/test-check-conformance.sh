#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP="$(mktemp -d "${TMPDIR:-/tmp}/comparator-fixture.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

mkdir -p "$TMP/bin"
cat >"$TMP/bin/lake-build" <<'MOCK'
#!/usr/bin/env bash
set -euo pipefail
if [[ "${1:-}" != "ComparatorAxiomAudit" ]]; then
  exit 0
fi

prefix=""
if [[ "${MOCK_MODE:-clean}" == clean || "${MOCK_MODE:-clean}" == prefix ]]; then
  prefix="info: Mock.lean:1:0: "
fi
printf "%s'Unrelated.dependency' depends on axioms: [Forbidden.Dependency]\n" "$prefix"
if [[ "${MOCK_MODE:-clean}" == clean ]]; then
  printf "warning: quoted 'Headline.counterexample_card_ge_nine' depends on axioms: [Forbidden.Warning]\n"
fi
if [[ "${MOCK_MODE:-clean}" == suffix ]]; then
  printf "%s'Other.Headline.counterexample_card_ge_nine' depends on axioms: [Forbidden.Suffix]\n" "$prefix"
fi
index=0
while IFS= read -r name; do
  index=$((index + 1))
  if [[ "${MOCK_MODE:-clean}" == missing && "$index" -eq 1 ]]; then
    continue
  elif [[ "${MOCK_MODE:-clean}" == named-forbidden && "$index" -eq 1 ]]; then
    printf "%s'%s' depends on axioms: [Forbidden.Named]\n" "$prefix" "$name"
  elif [[ "${MOCK_MODE:-clean}" == clean && "$index" -eq 1 ]]; then
    printf "%s'%s' depends on axioms: [\n" "$prefix" "$name"
    printf "  propext,\n"
    printf "  Classical.choice]\n"
  elif [[ "${MOCK_MODE:-clean}" == malformed && "$index" -eq 1 ]]; then
    printf "%s'%s' depends on axioms: [\n" "$prefix" "$name"
  elif [[ "$index" -gt 1 && "${MOCK_MODE:-clean}" != named-forbidden ]]; then
    printf "%s'%s' does not depend on any axioms\n" "$prefix" "$name"
  else
    printf "%s'%s' depends on axioms: []\n" "$prefix" "$name"
  fi
  if [[ "${MOCK_MODE:-clean}" == duplicate && "$index" -eq 1 ]]; then
    printf "%s'%s' depends on axioms: []\n" "$prefix" "$name"
  fi
done < <(jq -r '.theorem_names[]' comparator/config.json)
MOCK
chmod 755 "$TMP/bin/lake-build"

PATH="$TMP/bin:$PATH" "$ROOT/comparator/check-conformance.sh" >"$TMP/clean.out"
grep -Fq "OK: all comparator theorems build" "$TMP/clean.out"

MOCK_MODE=suffix PATH="$TMP/bin:$PATH" "$ROOT/comparator/check-conformance.sh" >"$TMP/suffix.out"
grep -Fq "OK: all comparator theorems build" "$TMP/suffix.out"

if MOCK_MODE=named-forbidden PATH="$TMP/bin:$PATH" \
  "$ROOT/comparator/check-conformance.sh" >"$TMP/forbidden.out" 2>&1; then
  echo "named forbidden axiom unexpectedly passed" >&2
  exit 1
fi
grep -Fq "Forbidden.Named" "$TMP/forbidden.out"

for mode in missing duplicate malformed; do
  if MOCK_MODE="$mode" PATH="$TMP/bin:$PATH" \
    "$ROOT/comparator/check-conformance.sh" >"$TMP/$mode.out" 2>&1; then
    echo "$mode axiom report unexpectedly passed" >&2
    exit 1
  fi
  if [[ "$mode" == malformed ]]; then
    grep -Fq "unterminated axiom report" "$TMP/$mode.out"
  else
    grep -Fq "$mode axiom report" "$TMP/$mode.out"
  fi
done

echo "comparator audit parser fixture passed"
