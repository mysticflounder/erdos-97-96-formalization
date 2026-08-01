"""Audit the Phase-3 two-hit cap-localization clause on saved models.

The screened clause is

  f[a,i] & f[b,i] & s[i,a] & s[i,b] & s[c,a] & s[c,b] -> f[c,i].

Here ``i`` is a Moser/apex label in 0..2, ``a,b`` are distinct non-Moser
labels in 3..9, and the second center ``c`` ranges over all ten labels except
``i``.  Phase 3 has no ``f`` variables for Moser labels, so those literals are
interpreted as false.

This is an artifact screen, not a geometric proof.  Admission of the clause
requires the soundness/completeness bridge made explicit by
``Phase3TwoHitCapLocalization.clause_of_faithful_exactTen_interpretation``.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from collections.abc import Iterable
from pathlib import Path
from typing import Any

_RELATION_VARIABLE = re.compile(r"([sf])\[(\d+),(\d+)\]")
_APEX_LABELS = range(3)
_NON_MOSER_LABELS = range(3, 10)
_ALL_LABELS = range(10)


def true_relations(assignment: dict[str, bool]) -> tuple[set[tuple[int, int]], set[tuple[int, int]]]:
    """Return the true ``s`` and ``f`` pairs, ignoring unrelated variables."""
    support: set[tuple[int, int]] = set()
    cap: set[tuple[int, int]] = set()
    for variable, value in assignment.items():
        if not value:
            continue
        match = _RELATION_VARIABLE.fullmatch(variable)
        if match is None:
            continue
        pair = (int(match.group(2)), int(match.group(3)))
        (support if match.group(1) == "s" else cap).add(pair)
    return support, cap


def clause_violations(assignment: dict[str, bool]) -> list[dict[str, int]]:
    """List every falsified instance in deterministic order."""
    support, cap = true_relations(assignment)
    violations: list[dict[str, int]] = []
    for i in _APEX_LABELS:
        for a, b in itertools.combinations(_NON_MOSER_LABELS, 2):
            antecedent = (
                (a, i) in cap
                and (b, i) in cap
                and (i, a) in support
                and (i, b) in support
            )
            if not antecedent:
                continue
            for c in _ALL_LABELS:
                if c == i:
                    continue
                if (
                    (c, a) in support
                    and (c, b) in support
                    and (c, i) not in cap
                ):
                    violations.append({"i": i, "a": a, "b": b, "c": c})
    return violations


def screen_records(records: Iterable[dict[str, Any]]) -> dict[str, Any]:
    """Screen decoded JSONL records and return a full deterministic audit."""
    rejected: list[dict[str, Any]] = []
    total = 0
    for record in records:
        total += 1
        assignment = record.get("semantic_assignment")
        if not isinstance(assignment, dict):
            raise TypeError(f"record {record.get('index')} lacks semantic_assignment")
        violations = clause_violations(assignment)
        if violations:
            rejected.append(
                {
                    "index": record.get("index"),
                    "raw_sat_index": record.get("raw_sat_index"),
                    "record_sha256": record.get("record_sha256"),
                    "violations": violations,
                }
            )
    return {
        "records": total,
        "rejected": len(rejected),
        "surviving": total - len(rejected),
        "violation_witnesses": sum(len(item["violations"]) for item in rejected),
        "rejected_records": rejected,
    }


def load_jsonl(path: Path) -> list[dict[str, Any]]:
    with path.open(encoding="utf-8") as stream:
        return [json.loads(line) for line in stream if line.strip()]


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    result = {
        "schema": "p97.phase3-two-hit-cap-localization-screen.v1",
        "input": str(args.input),
        "input_sha256": file_sha256(args.input),
        **screen_records(load_jsonl(args.input)),
    }
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    summary = {key: result[key] for key in ("records", "rejected", "surviving", "violation_witnesses")}
    print(json.dumps(summary, sort_keys=True))


if __name__ == "__main__":
    main()
