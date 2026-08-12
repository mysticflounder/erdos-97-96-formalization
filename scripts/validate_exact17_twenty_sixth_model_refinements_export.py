"""Independently validate the exact-17 twenty-sixth-model refinement suffix.

The authenticated child26 survivor has five source-backed theorem-bank hits.
They reduce to three nonredundant occurrence orbits: the forward/reverse
bisector hits share one orbit, and the perpendicular-bisector hit strictly
contains that bisector occurrence.  This validator checks that the Lean-exported
child27 DIMACS has child26 as a byte-identical prefix, that its twelve new
clauses are exactly those three orbits, and that each orbit cuts child26.
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

PARENT_CLAUSES = 5_846_272
ORBIT_CLAUSES = 4
PARENT_SHA256 = "d238b81bfdc40c53c948c7655285e0b74203711e1b5cd013fb8d8c9ad1a642f5"
CHILD_CLAUSES = PARENT_CLAUSES + 3 * ORBIT_CLAUSES
EXPECTED_ORDER = [0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14]

BISECTOR_HITS: tuple[Hit, ...] = (
    (15, 11), (15, 16), (13, 6), (13, 16),
    (6, 11), (6, 13), (11, 6), (11, 13),
)
CONVEX_FIVE_HITS: tuple[Hit, ...] = (
    (8, 6), (8, 10), (4, 6), (4, 10), (1, 4), (1, 8), (1, 10),
)
CANCELLATION_HITS: tuple[Hit, ...] = (
    (0, 2), (0, 5), (14, 2), (14, 4), (13, 4), (13, 5),
)
PERPENDICULAR_BISECTOR_HITS: tuple[Hit, ...] = BISECTOR_HITS + ((5, 11), (5, 16))

MOTIFS: tuple[tuple[str, tuple[Hit, ...]], ...] = (
    ("bisector", BISECTOR_HITS),
    ("convex_five", CONVEX_FIVE_HITS),
    ("cancellation", CANCELLATION_HITS),
)

EXPECTED_HITS: tuple[tuple[str, str, str, dict[str, object]], ...] = (
    (
        "equality-convex-four-point-two-circle-bisector-order",
        "forward",
        "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
        {"Q": 13, "U": 14, "V": 5, "Y": 3},
    ),
    (
        "equality-convex-four-point-two-circle-bisector-order-reverse",
        "reverse",
        "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg",
        {"Q": 5, "U": 3, "V": 13, "Y": 14},
    ),
    (
        "equality-convex-five-point",
        "forward",
        "Problem97.Census554.ConvexFivePointCore.false_of_core",
        {"a": 9, "b": 16, "c": 6, "x": 2, "y": 10},
    ),
    (
        "equality-convex-two-kalmanson-cancellation",
        "forward",
        ("Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
         "false_of_twoKalmansonCancellationData_of_check"),
        {
            "boundary_labels": EXPECTED_ORDER,
            "first_quad": [0, 2, 4, 14],
            "first_form": "adjacentSides",
            "second_quad": [0, 4, 5, 13],
            "second_form": "adjacentSides",
            "permutation": [2, 1, 0, 3],
        },
    ),
    (
        "equality-perpendicular-bisector-convex",
        "invariant",
        "Problem97.Census554.false_of_metricCoreAlternative",
        {"foci": [3, 14], "points": [5, 12, 13]},
    ),
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_evidence(
    analysis_path: Path, bank_path: Path
) -> tuple[dict[str, Any], dict[str, Any]]:
    analysis = json.loads(analysis_path.read_text(encoding="utf-8"))
    if analysis.get("cnf_sha256") != PARENT_SHA256:
        raise ValueError("child26 analysis is not authenticated to the parent")
    if analysis.get("variables") != VARIABLES or analysis.get("clauses") != PARENT_CLAUSES:
        raise ValueError("child26 analysis dimensions drifted")
    if set(analysis.get("row_sizes", {}).values()) != {4}:
        raise ValueError("unexpected child26 selected-row shape")

    bank = json.loads(bank_path.read_text(encoding="utf-8"))
    if bank.get("hit_count") != 5 or bank.get("proposal_count") != 5:
        raise ValueError("unexpected child26 theorem-bank cardinality")
    if bank.get("unreplayed_proposals") != []:
        raise ValueError("child26 theorem bank contains unreplayed proposals")
    if bank.get("order") != EXPECTED_ORDER:
        raise ValueError("child26 boundary order drifted")
    hits = bank.get("hits")
    if not isinstance(hits, list) or len(hits) != len(EXPECTED_HITS):
        raise TypeError("child26 theorem-bank hits are missing")
    for index, (hit, expected) in enumerate(zip(hits, EXPECTED_HITS, strict=True)):
        stage, orientation, consumer, expected_core = expected
        if hit.get("stage") != stage:
            raise ValueError(f"child26 hit {index} stage drifted")
        if hit.get("orientation") != orientation:
            raise ValueError(f"child26 hit {index} orientation drifted")
        if hit.get("lean_consumer") != consumer:
            raise ValueError(f"child26 hit {index} Lean consumer drifted")
        core = hit.get("core")
        if not isinstance(core, dict):
            raise TypeError(f"child26 hit {index} core is missing")
        for key, value in expected_core.items():
            if core.get(key) != value:
                raise ValueError(f"child26 hit {index} core field {key} drifted")
    if not set(BISECTOR_HITS) < set(PERPENDICULAR_BISECTOR_HITS):
        raise AssertionError("perpendicular-bisector subsumption relation drifted")
    return analysis, bank


def validate(
    parent_path: Path,
    child_path: Path,
    model_path: Path,
    bank_path: Path,
    analysis_path: Path,
) -> dict[str, Any]:
    if sha256(parent_path) != PARENT_SHA256:
        raise ValueError("unauthenticated child26 parent root")
    analysis, bank = check_evidence(analysis_path, bank_path)
    model = assignment_map(model_path)
    suffix_digest = hashlib.sha256()
    cut_clauses: dict[str, list[int]] = {}

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
        for motif_name, motif in MOTIFS:
            motif_cuts: list[int] = []
            for order_index, order in enumerate(ORDERS):
                for reverse in (False, True):
                    line = child.readline()
                    if not line:
                        raise ValueError(f"truncated {motif_name} suffix")
                    observed = parse_clause(
                        line, context=f"{motif_name}/{order_index}/{reverse}"
                    )
                    expected = expected_clause(order_index, order, motif, reverse=reverse)
                    if observed != expected:
                        raise ValueError(
                            f"{motif_name} clause drift at order={order_index}, reverse={reverse}"
                        )
                    clause_number = PARENT_CLAUSES + observed_suffix + 1
                    if not clause_satisfied(observed, model):
                        motif_cuts.append(clause_number)
                    suffix_digest.update(line.encode("ascii"))
                    observed_suffix += 1
            if not motif_cuts:
                raise ValueError(f"source-backed {motif_name} orbit does not cut child26")
            cut_clauses[motif_name] = motif_cuts
        if observed_suffix != 3 * ORBIT_CLAUSES:
            raise ValueError("wrong successor suffix length")
        if child.readline():
            raise ValueError("child file contains extra clauses")

    return {
        "schema": "p97-exact17-twenty-sixth-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "parent_sha256": PARENT_SHA256,
        "child_sha256": sha256(child_path),
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES,
        "new_clauses": 3 * ORBIT_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "motivating_model_cut_clauses": cut_clauses,
        "canonical_hits_replayed": True,
        "perpendicular_bisector_subsumed_by_bisector": True,
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
