"""Independently validate the exact-17 twenty-seventh-model suffix.

The authenticated child27 survivor has one source-backed theorem-bank hit: a
generic two-Kalmanson cancellation.  This validator checks that the Lean
exported child28 DIMACS has child27 as a byte-identical prefix, independently
regenerates the four orbit clauses, and checks that they cut child27.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

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

PARENT_CLAUSES = 5_846_284
ORBIT_CLAUSES = 4
PARENT_SHA256 = "566d394436a30d1fee4c85240433f0217223c6f2ecf80e2945568ea37646194b"
CHILD_CLAUSES = PARENT_CLAUSES + ORBIT_CLAUSES
EXPECTED_ORDER = [0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14]

CANCELLATION_HITS: tuple[Hit, ...] = (
    (2, 1),
    (2, 12),
    (0, 8),
    (0, 2),
    (0, 5),
    (5, 12),
    (5, 10),
    (10, 5),
    (10, 1),
    (1, 10),
    (1, 8),
)

EXPECTED_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonCancellationData_of_check"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_evidence(
    analysis_path: Path, bank_path: Path
) -> tuple[dict[str, Any], dict[str, Any]]:
    analysis = json.loads(analysis_path.read_text(encoding="utf-8"))
    if analysis.get("cnf_sha256") != PARENT_SHA256:
        raise ValueError("child27 analysis is not authenticated to the parent")
    if analysis.get("variables") != VARIABLES or analysis.get("clauses") != PARENT_CLAUSES:
        raise ValueError("child27 analysis dimensions drifted")
    if set(analysis.get("row_sizes", {}).values()) != {4}:
        raise ValueError("unexpected child27 selected-row shape")

    bank = json.loads(bank_path.read_text(encoding="utf-8"))
    if bank.get("hit_count") != 1 or bank.get("proposal_count") != 1:
        raise ValueError("unexpected child27 theorem-bank cardinality")
    if bank.get("unreplayed_proposals") != []:
        raise ValueError("child27 theorem bank contains unreplayed proposals")
    if bank.get("order") != EXPECTED_ORDER:
        raise ValueError("child27 boundary order drifted")
    hits = bank.get("hits")
    if not isinstance(hits, list) or len(hits) != 1:
        raise TypeError("child27 theorem-bank hit is missing")
    hit = hits[0]
    if hit.get("stage") != "equality-convex-two-kalmanson-cancellation":
        raise ValueError("child27 theorem-bank stage drifted")
    if hit.get("orientation") != "forward":
        raise ValueError("child27 theorem-bank orientation drifted")
    if hit.get("lean_consumer") != EXPECTED_CONSUMER:
        raise ValueError("child27 Lean consumer drifted")
    core = hit.get("core")
    if not isinstance(core, dict):
        raise TypeError("child27 theorem-bank core is missing")
    expected_core = {
        "boundary_labels": EXPECTED_ORDER,
        "first_quad": [0, 1, 2, 8],
        "first_form": "innerOuter",
        "second_quad": [0, 2, 5, 12],
        "second_form": "adjacentSides",
        "permutation": [3, 0, 2, 1],
    }
    for key, value in expected_core.items():
        if core.get(key) != value:
            raise ValueError(f"child27 theorem-bank core field {key} drifted")
    return analysis, bank


def validate(
    parent_path: Path,
    child_path: Path,
    model_path: Path,
    bank_path: Path,
    analysis_path: Path,
) -> dict[str, Any]:
    if sha256(parent_path) != PARENT_SHA256:
        raise ValueError("unauthenticated child27 parent root")
    analysis, bank = check_evidence(analysis_path, bank_path)
    model = assignment_map(model_path)
    suffix_digest = hashlib.sha256()
    cut_clauses: list[int] = []

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

        observed_suffix = 0
        for order_index, order in enumerate(ORDERS):
            for reverse in (False, True):
                line = child.readline()
                if not line:
                    raise ValueError("truncated cancellation suffix")
                observed = parse_clause(
                    line, context=f"cancellation/{order_index}/{reverse}"
                )
                expected = expected_clause(
                    order_index, order, CANCELLATION_HITS, reverse=reverse
                )
                if observed != expected:
                    raise ValueError(
                        f"cancellation clause drift at order={order_index}, reverse={reverse}"
                    )
                clause_number = PARENT_CLAUSES + observed_suffix + 1
                if not clause_satisfied(observed, model):
                    cut_clauses.append(clause_number)
                suffix_digest.update(line.encode("ascii"))
                observed_suffix += 1
        if observed_suffix != ORBIT_CLAUSES:
            raise ValueError("wrong successor suffix length")
        if child.readline():
            raise ValueError("child file contains extra clauses")
    if not cut_clauses:
        raise ValueError("source-backed cancellation orbit does not cut child27")

    return {
        "schema": "p97-exact17-twenty-seventh-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "parent_sha256": PARENT_SHA256,
        "child_sha256": sha256(child_path),
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES,
        "new_clauses": ORBIT_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "motivating_model_cut_clauses": {"cancellation": cut_clauses},
        "canonical_hit_replayed": True,
        "analysis_sha256": sha256(analysis_path),
        "theorem_bank_sha256": sha256(bank_path),
        "model_sha256": sha256(model_path),
        "evidence_cnf_sha256": analysis["cnf_sha256"],
        "hit_count": bank["hit_count"],
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--theorem-bank", type=Path, required=True)
    parser.add_argument("--analysis", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    report = validate(args.parent, args.child, args.model, args.theorem_bank, args.analysis)
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
