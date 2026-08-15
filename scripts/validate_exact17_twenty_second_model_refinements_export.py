"""Independently validate the exact-17 twenty-second-model refinement suffix.

The authenticated child22 survivor has six theorem-bank hits which minimize to
five positive-hit supports.  This validator checks that the Lean-exported
child23 DIMACS has the authenticated child22 root as a byte-identical prefix,
that its twenty new clauses are exactly the five four-clause occurrence
orbits, and that every orbit rejects the motivating child22 assignment.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
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

PARENT_CLAUSES = 5_846_208
ORBIT_CLAUSES = 4
PARENT_SHA256 = "dc44614e28c907d5c61b29e58cc6f6188e52a2504e119efa37157a81a56f7edb"

MOTIFS: tuple[tuple[str, tuple[Hit, ...]], ...] = (
    (
        "bisector",
        ((16, 14), (16, 5), (14, 9), (14, 0),
         (9, 14), (9, 0), (0, 9), (0, 5)),
    ),
    (
        "convex_five",
        ((10, 1), (10, 6), (2, 1), (2, 6),
         (4, 6), (4, 10), (4, 2)),
    ),
    (
        "kalmanson_l",
        ((13, 1), (13, 14), (0, 6), (0, 15),
         (6, 1), (6, 13), (6, 15), (12, 6), (12, 14)),
    ),
    (
        "cancellation",
        ((0, 2), (0, 6), (7, 2), (7, 3), (15, 3), (15, 6)),
    ),
    (
        "duplicate_center",
        ((11, 15), (11, 5), (13, 16), (13, 5), (13, 4),
         (3, 16), (3, 15), (3, 4), (5, 11), (5, 3),
         (15, 11), (15, 3)),
    ),
)

NEW_CLAUSES = len(MOTIFS) * ORBIT_CLAUSES
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
EXPECTED_STAGES = Counter(
    {
        "equality-convex-four-point-two-circle-bisector-order-reverse": 1,
        "equality-convex-four-point-two-circle-bisector-order": 1,
        "equality-convex-five-point": 1,
        "equality-convex-seven-point-four-selected-row-kalmanson-l": 1,
        "equality-convex-two-kalmanson-cancellation": 1,
        "equality-duplicate-center": 1,
    }
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_evidence(analysis_path: Path, bank_path: Path) -> tuple[dict[str, Any], dict[str, Any]]:
    analysis = json.loads(analysis_path.read_text(encoding="utf-8"))
    if analysis.get("cnf_sha256") != PARENT_SHA256:
        raise ValueError("child22 analysis is not authenticated to the parent")
    if analysis.get("variables") != VARIABLES or analysis.get("clauses") != PARENT_CLAUSES:
        raise ValueError("child22 analysis dimensions drifted")
    if set(analysis.get("row_sizes", {}).values()) != {4}:
        raise ValueError("unexpected child22 selected-row shape")

    bank = json.loads(bank_path.read_text(encoding="utf-8"))
    if bank.get("hit_count") != 6 or bank.get("proposal_count") != 6:
        raise ValueError("unexpected child22 theorem-bank cardinality")
    if bank.get("unreplayed_proposals") != []:
        raise ValueError("child22 theorem bank contains unreplayed proposals")
    hits = bank.get("hits")
    if not isinstance(hits, list):
        raise TypeError("child22 theorem-bank hits are missing")
    if Counter(hit.get("stage") for hit in hits) != EXPECTED_STAGES:
        raise ValueError("child22 theorem-bank stages drifted")
    if bank.get("order") != [14, 13, 1, 5, 4, 3, 16, 15, 2, 7, 12, 9, 10, 11, 8, 6, 0]:
        raise ValueError("child22 boundary order drifted")
    return analysis, bank


def validate(
    parent_path: Path,
    child_path: Path,
    model_path: Path,
    bank_path: Path,
    analysis_path: Path,
) -> dict[str, Any]:
    if sha256(parent_path) != PARENT_SHA256:
        raise ValueError("unauthenticated child22 parent root")
    analysis, bank = check_evidence(analysis_path, bank_path)
    model = assignment_map(model_path)
    suffix_digest = hashlib.sha256()
    cut_by_orbit: dict[str, list[int]] = {name: [] for name, _ in MOTIFS}
    observed_suffix = 0

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

        for orbit_name, motif in MOTIFS:
            for order_index, order in enumerate(ORDERS):
                for reverse in (False, True):
                    line = child.readline()
                    if not line:
                        raise ValueError(f"truncated {orbit_name} suffix")
                    observed = parse_clause(line, context=f"{orbit_name}/{order_index}/{reverse}")
                    expected = expected_clause(order_index, order, motif, reverse=reverse)
                    if observed != expected:
                        raise ValueError(f"clause mismatch in {orbit_name} orbit")
                    clause_number = PARENT_CLAUSES + observed_suffix + 1
                    if not clause_satisfied(observed, model):
                        cut_by_orbit[orbit_name].append(clause_number)
                    suffix_digest.update(line.encode("ascii"))
                    observed_suffix += 1
        if child.readline():
            raise ValueError("child file contains extra clauses")

    if observed_suffix != NEW_CLAUSES:
        raise ValueError("wrong successor suffix length")
    if any(not cuts for cuts in cut_by_orbit.values()):
        raise ValueError(
            f"one or more source-backed orbits do not cut child22: {cut_by_orbit}"
        )
    return {
        "schema": "p97-exact17-twenty-second-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "parent_sha256": PARENT_SHA256,
        "child_sha256": sha256(child_path),
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES,
        "new_clauses": NEW_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "motivating_model_cut_clauses": cut_by_orbit,
        "all_six_canonical_hits_replayed": True,
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
