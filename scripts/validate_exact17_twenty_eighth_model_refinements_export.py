"""Independently validate the exact-17 child-28 all-core suffix.

The Lean exporter owns the DIMACS bytes.  This validator authenticates the
child-28 prefix, replays every serialized two-Kalmanson certificate, regenerates
all 256 occurrence clauses, and checks that the family cuts the child-28 model.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections.abc import Iterable
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO))

from validate_exact17_fifth_convex_five_point_export import (
    ORDERS,
    VARIABLES,
    Hit,
    assignment_map,
    clause_satisfied,
    expected_clause,
    parse_clause,
    read_header,
)

from census.atail_force import producer_bank

PARENT_CLAUSES = 5_846_288
ORBIT_CLAUSES = 256
PARENT_SHA256 = "86bbb7f4a8f78372e9df8ff830a6737475e44defd42a013d41885fe1966ab02c"
CHILD_CLAUSES = PARENT_CLAUSES + ORBIT_CLAUSES
LEDGER_SCHEMA = "p97-exact17-child28-all-minimal-two-kalmanson/v1"
ANALYSIS_SHA256 = "10874f574e2d1a929d31701ccc2bfef0bce2684cc7e11d69525ce5a15621db9b"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def reflected(hits: Iterable[Hit]) -> tuple[Hit, ...]:
    return tuple(sorted((16 - center, 16 - point) for center, point in hits))


def rows_from_hits(hits: Iterable[Hit]) -> list[producer_bank.MetricRow]:
    supports: dict[int, set[int]] = {}
    for center, point in hits:
        supports.setdefault(center, set()).add(point)
    return [
        producer_bank.MetricRow(center, tuple(sorted(points)), exact=False)
        for center, points in sorted(supports.items())
    ]


def validate_ledger(ledger_path: Path, analysis_path: Path) -> list[dict[str, Any]]:
    if sha256(analysis_path) != ANALYSIS_SHA256:
        raise ValueError("child28 analysis hash drifted")
    analysis = json.loads(analysis_path.read_text(encoding="utf-8"))
    if analysis.get("status") != "PASS":
        raise ValueError("child28 analysis did not pass")
    if analysis.get("cnf_sha256") != PARENT_SHA256:
        raise ValueError("child28 analysis is not authenticated to the parent")
    if analysis.get("variables") != VARIABLES or analysis.get("clauses") != PARENT_CLAUSES:
        raise ValueError("child28 analysis dimensions drifted")
    if set(analysis.get("row_sizes", {}).values()) != {4}:
        raise ValueError("unexpected child28 selected-row shape")

    ledger = json.loads(ledger_path.read_text(encoding="utf-8"))
    expected_counts = {
        "record_count": 183,
        "distinct_support_count": 104,
        "minimal_support_count": 64,
        "emitted_clause_count": ORBIT_CLAUSES,
    }
    if ledger.get("schema") != LEDGER_SCHEMA:
        raise ValueError("all-core ledger schema drifted")
    if ledger.get("source_analysis_sha256") != ANALYSIS_SHA256:
        raise ValueError("all-core ledger analysis binding drifted")
    for key, value in expected_counts.items():
        if ledger.get(key) != value:
            raise ValueError(f"all-core ledger {key} drifted")
    entries = ledger.get("entries")
    if not isinstance(entries, list) or len(entries) != 64:
        raise ValueError("all-core ledger does not contain 64 entries")

    seen: list[frozenset[Hit]] = []
    for index, entry in enumerate(entries):
        if not isinstance(entry, dict):
            raise TypeError(f"entry {index} is not an object")
        raw_hits = entry.get("hits")
        if not isinstance(raw_hits, list):
            raise TypeError(f"entry {index} has no hit list")
        hits = tuple((int(pair[0]), int(pair[1])) for pair in raw_hits)
        support = frozenset(hits)
        if len(support) != len(hits) or tuple(sorted(hits)) != hits:
            raise ValueError(f"entry {index} hit support is not canonical")
        if any(previous < support for previous in seen):
            raise ValueError(f"entry {index} is not support-minimal")
        seen.append(support)

        forward = entry.get("forward_record")
        reverse = entry.get("reverse_record")
        if not isinstance(forward, dict) or not isinstance(reverse, dict):
            raise TypeError(f"entry {index} is missing a certificate")
        checked_forward = producer_bank.certify_two_kalmanson_cancellation(
            rows_from_hits(hits), 17, tuple(range(17)), forward["core"]
        )
        reverse_hits = reflected(hits)
        checked_reverse = producer_bank.certify_two_kalmanson_cancellation(
            rows_from_hits(reverse_hits), 17, tuple(range(17)), reverse["core"]
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
        raise ValueError("unauthenticated child28 parent")
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
            hits = tuple((int(pair[0]), int(pair[1])) for pair in entry["hits"])
            for order_index, order in enumerate(ORDERS):
                for reverse in (False, True):
                    line = child.readline()
                    if not line:
                        raise ValueError("truncated all-core suffix")
                    observed = parse_clause(
                        line,
                        context=f"occurrence/{occurrence_index}/{order_index}/{reverse}",
                    )
                    expected = expected_clause(
                        order_index, order, hits, reverse=reverse
                    )
                    if observed != expected:
                        raise ValueError(
                            "all-core clause drift at "
                            f"occurrence={occurrence_index}, order={order_index}, "
                            f"reverse={reverse}"
                        )
                    clause_number = PARENT_CLAUSES + suffix_index + 1
                    if not clause_satisfied(observed, model):
                        cut_by_occurrence.setdefault(str(occurrence_index), []).append(
                            clause_number
                        )
                    suffix_digest.update(line.encode("ascii"))
                    suffix_index += 1
        if suffix_index != ORBIT_CLAUSES:
            raise ValueError("wrong all-core suffix length")
        if child.readline():
            raise ValueError("child file contains extra clauses")
    if not cut_by_occurrence:
        raise ValueError("all-core family does not cut child28")

    return {
        "schema": "p97-exact17-twenty-eighth-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "parent_sha256": PARENT_SHA256,
        "child_sha256": sha256(child_path),
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES,
        "new_clauses": ORBIT_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "minimal_occurrences": len(entries),
        "motivating_model_cut_occurrences": cut_by_occurrence,
        "all_serialized_certificates_replayed": True,
        "analysis_sha256": sha256(analysis_path),
        "ledger_sha256": sha256(ledger_path),
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
    report = validate(
        args.parent, args.child, args.model, args.ledger, args.analysis
    )
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
