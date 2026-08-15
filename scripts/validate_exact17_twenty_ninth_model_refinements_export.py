"""Independently validate the exact-17 child-29 all-core suffix.

Lean owns the exported DIMACS bytes.  This validator authenticates the child-29
prefix, replays every serialized two-Kalmanson certificate, independently
regenerates the 200 suffix clauses, and checks that each occurrence cuts the
authenticated child-29 model.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO))
sys.path.insert(0, str(REPO / "scripts"))

from validate_exact17_twenty_eighth_model_refinements_export import (
    ORDERS,
    VARIABLES,
    Hit,
    assignment_map,
    clause_satisfied,
    expected_clause,
    parse_clause,
    read_header,
    reflected,
    rows_from_hits,
    sha256,
)

from census.atail_force import producer_bank

PARENT_CLAUSES = 5_846_544
ORBIT_CLAUSES = 200
PARENT_SHA256 = "620ea5ad066edf6526d11eb51c4cff93284130f6fd27de46d8d0c2e5ff9c0c53"
CHILD_CLAUSES = PARENT_CLAUSES + ORBIT_CLAUSES
CHILD_SHA256 = "02aca42eb22814540816d9e4f1d19b2c71888700147e6b832d735f9efc41acd0"
LEDGER_SCHEMA = "p97-exact17-child29-all-minimal-two-kalmanson/v1"
LEDGER_SHA256 = "272986bdedfba002fe36dcc6b73d96368eebe16278793246546d2ecb4c47b787"
PARENT_LEDGER_SHA256 = "f2b537b3fd1d7926d40b8fb665b6f8372b5090369a8ccba6c34e5ec8e22448f5"
ANALYSIS_SHA256 = "6713262233a867c7d426c7368c0f5db46e6db6ab04b9974e70e82f1e224aad9c"


def _hits(entry: dict[str, Any], index: int) -> tuple[Hit, ...]:
    raw = entry.get("hits")
    if not isinstance(raw, list):
        raise TypeError(f"entry {index} has no hit list")
    hits = tuple((int(pair[0]), int(pair[1])) for pair in raw)
    if len(frozenset(hits)) != len(hits) or tuple(sorted(hits)) != hits:
        raise ValueError(f"entry {index} hit support is not canonical")
    return hits


def validate_ledger(ledger_path: Path, analysis_path: Path) -> list[dict[str, Any]]:
    if sha256(analysis_path) != ANALYSIS_SHA256:
        raise ValueError("child29 analysis hash drifted")
    analysis = json.loads(analysis_path.read_text(encoding="utf-8"))
    if analysis.get("status") != "PASS":
        raise ValueError("child29 analysis did not pass")
    if analysis.get("cnf_sha256") != PARENT_SHA256:
        raise ValueError("child29 analysis is not authenticated to the parent")
    if analysis.get("variables") != VARIABLES or analysis.get("clauses") != PARENT_CLAUSES:
        raise ValueError("child29 analysis dimensions drifted")
    if set(analysis.get("row_sizes", {}).values()) != {4}:
        raise ValueError("unexpected child29 selected-row shape")

    if sha256(ledger_path) != LEDGER_SHA256:
        raise ValueError("child29 all-core ledger hash drifted")
    ledger = json.loads(ledger_path.read_text(encoding="utf-8"))
    expected_counts = {
        "record_count": 115,
        "distinct_support_count": 69,
        "minimal_support_count": 50,
        "parent_subsumed_support_count": 0,
        "emitted_clause_count": ORBIT_CLAUSES,
    }
    if ledger.get("schema") != LEDGER_SCHEMA:
        raise ValueError("all-core ledger schema drifted")
    if ledger.get("source_analysis_sha256") != ANALYSIS_SHA256:
        raise ValueError("all-core ledger analysis binding drifted")
    if ledger.get("parent_ledger_sha256") != PARENT_LEDGER_SHA256:
        raise ValueError("all-core parent-ledger binding drifted")
    for key, value in expected_counts.items():
        if ledger.get(key) != value:
            raise ValueError(f"all-core ledger {key} drifted")

    parent_ledger_path = REPO / str(ledger.get("parent_ledger"))
    if sha256(parent_ledger_path) != PARENT_LEDGER_SHA256:
        raise ValueError("authenticated parent ledger is missing or drifted")
    parent_ledger = json.loads(parent_ledger_path.read_text(encoding="utf-8"))
    parent_supports = [
        frozenset((int(pair[0]), int(pair[1])) for pair in entry["hits"])
        for entry in parent_ledger["entries"]
    ]

    entries = ledger.get("entries")
    if not isinstance(entries, list) or len(entries) != 50:
        raise ValueError("all-core ledger does not contain 50 entries")
    supports = [frozenset(_hits(entry, index)) for index, entry in enumerate(entries)]
    if any(left < right for i, left in enumerate(supports) for j, right in enumerate(supports) if i != j):
        raise ValueError("all-core ledger contains a nonminimal support")
    if any(parent <= support for parent in parent_supports for support in supports):
        raise ValueError("all-core ledger contains a parent-subsumed support")

    for index, entry in enumerate(entries):
        hits = _hits(entry, index)
        forward = entry.get("forward_record")
        reverse = entry.get("reverse_record")
        if not isinstance(forward, dict) or not isinstance(reverse, dict):
            raise TypeError(f"entry {index} is missing a certificate")
        checked_forward = producer_bank.certify_two_kalmanson_cancellation(
            rows_from_hits(hits), 17, tuple(range(17)), forward["core"]
        )
        checked_reverse = producer_bank.certify_two_kalmanson_cancellation(
            rows_from_hits(reflected(hits)), 17, tuple(range(17)), reverse["core"]
        )
        if checked_forward != forward or checked_reverse != reverse:
            raise ValueError(f"entry {index} certificate replay drifted")
    return entries


def validate(
    parent_path: Path,
    child_path: Path,
    model_path: Path,
    ledger_path: Path,
    analysis_path: Path,
) -> dict[str, Any]:
    if sha256(parent_path) != PARENT_SHA256:
        raise ValueError("unauthenticated child29 parent")
    if sha256(child_path) != CHILD_SHA256:
        raise ValueError("unauthenticated Lean-owned child30 export")
    entries = validate_ledger(ledger_path, analysis_path)
    model = assignment_map(model_path)
    suffix_digest = hashlib.sha256()
    cut_by_occurrence: dict[str, list[int]] = {}

    with parent_path.open("r", encoding="ascii") as parent, child_path.open(
        "r", encoding="ascii"
    ) as child:
        if read_header(parent, parent_path) != (VARIABLES, PARENT_CLAUSES):
            raise ValueError("unexpected parent DIMACS header")
        if read_header(child, child_path) != (VARIABLES, CHILD_CLAUSES):
            raise ValueError("unexpected child DIMACS header")
        for index in range(PARENT_CLAUSES):
            parent_line, child_line = parent.readline(), child.readline()
            if not parent_line or parent_line != child_line:
                raise ValueError(f"parent-prefix mismatch at clause {index + 1}")
        if parent.readline():
            raise ValueError("parent file contains extra clauses")

        suffix_index = 0
        for occurrence_index, entry in enumerate(entries):
            hits = _hits(entry, occurrence_index)
            for order_index, order in enumerate(ORDERS):
                for reverse in (False, True):
                    line = child.readline()
                    if not line:
                        raise ValueError("truncated all-core suffix")
                    observed = parse_clause(
                        line,
                        context=f"occurrence/{occurrence_index}/{order_index}/{reverse}",
                    )
                    expected = expected_clause(order_index, order, hits, reverse=reverse)
                    if observed != expected:
                        raise ValueError(
                            "all-core clause drift at "
                            f"occurrence={occurrence_index}, order={order_index}, reverse={reverse}"
                        )
                    clause_number = PARENT_CLAUSES + suffix_index + 1
                    if not clause_satisfied(observed, model):
                        cut_by_occurrence.setdefault(str(occurrence_index), []).append(clause_number)
                    suffix_digest.update(line.encode("ascii"))
                    suffix_index += 1
        if suffix_index != ORBIT_CLAUSES:
            raise ValueError("wrong all-core suffix length")
        if child.readline():
            raise ValueError("child file contains extra clauses")

    if set(cut_by_occurrence) != {str(index) for index in range(len(entries))}:
        raise ValueError("not every all-core occurrence cuts child29")
    return {
        "schema": "p97-exact17-twenty-ninth-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "parent_sha256": PARENT_SHA256,
        "child_sha256": CHILD_SHA256,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES,
        "new_clauses": ORBIT_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "minimal_occurrences": len(entries),
        "motivating_model_cut_occurrences": cut_by_occurrence,
        "all_serialized_certificates_replayed": True,
        "all_minimal_occurrences_cut_the_motivating_model": True,
        "analysis_sha256": ANALYSIS_SHA256,
        "ledger_sha256": LEDGER_SHA256,
        "model_sha256": sha256(model_path),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--ledger", type=Path, required=True)
    parser.add_argument("--analysis", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    report = validate(args.parent, args.child, args.model, args.ledger, args.analysis)
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
