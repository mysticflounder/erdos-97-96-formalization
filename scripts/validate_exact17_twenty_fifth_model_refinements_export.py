"""Independently validate the exact-17 twenty-fifth-model refinement suffix.

The authenticated child25 survivor has five source-backed theorem-bank hits.
This validator checks that the Lean-exported child26 DIMACS has the authenticated
child25 root as a byte-identical prefix, that its twenty new clauses are exactly
the five occurrence orbits, and that every orbit cuts the motivating child25
assignment.
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

PARENT_CLAUSES = 5_846_252
ORBIT_CLAUSES = 4
PARENT_SHA256 = "8cd560206d0e38a1d63e65925fe4027d2523bf8a4084a87456ce10d71986fa6a"
CHILD_CLAUSES = PARENT_CLAUSES + 5 * ORBIT_CLAUSES
EXPECTED_ORDER = [0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14]

MOTIFS: tuple[tuple[str, tuple[Hit, ...]], ...] = (
    (
        "bisector_one",
        ((2, 6), (2, 12), (6, 1), (6, 11),
         (11, 6), (11, 12), (12, 1), (12, 11)),
    ),
    (
        "bisector_two",
        ((1, 0), (1, 5), (5, 1), (5, 10), (10, 3),
         (10, 5), (3, 0), (3, 10), (9, 1), (9, 3)),
    ),
    (
        "convex_five",
        ((12, 1), (12, 11), (6, 1), (6, 11),
         (2, 1), (2, 6), (2, 12)),
    ),
    (
        "cancellation",
        ((2, 1), (2, 12), (12, 6), (12, 11),
         (11, 6), (11, 12), (6, 1), (6, 11)),
    ),
    (
        "perp_bisector",
        ((2, 1), (2, 12), (12, 6), (12, 11), (11, 6),
         (11, 12), (6, 1), (6, 11), (16, 1), (16, 12)),
    ),
)

EXPECTED_HITS: tuple[tuple[str, str, str, dict[str, object]], ...] = (
    (
        "equality-convex-four-point-two-circle-bisector-order-reverse",
        "reverse",
        "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg",
        {"Q": 14, "U": 13, "V": 7, "Y": 5},
    ),
    (
        "equality-convex-four-point-two-circle-bisector-order",
        "forward",
        "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
        {"Q": 8, "U": 9, "V": 6, "Y": 4},
    ),
    (
        "equality-convex-five-point",
        "forward",
        "Problem97.Census554.ConvexFivePointCore.false_of_core",
        {"a": 3, "b": 6, "c": 8, "x": 4, "y": 9},
    ),
    (
        "equality-convex-two-kalmanson-cancellation",
        "forward",
        ("Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
         "false_of_twoKalmansonCancellationData_of_check"),
        {
            "boundary_labels": EXPECTED_ORDER,
            "first_quad": [0, 1, 2, 6],
            "first_form": "innerOuter",
            "second_quad": [0, 2, 6, 12],
            "second_form": "adjacentSides",
            "permutation": [3, 2, 0, 1],
        },
    ),
    (
        "equality-perpendicular-bisector-convex",
        "invariant",
        "Problem97.Census554.false_of_metricCoreAlternative",
        {"foci": [4, 6], "points": [8, 9, 14]},
    ),
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_evidence(
    analysis_path: Path, bank_path: Path
) -> tuple[dict[str, Any], dict[str, Any]]:
    analysis = json.loads(analysis_path.read_text(encoding="utf-8"))
    if analysis.get("cnf_sha256") != PARENT_SHA256:
        raise ValueError("child25 analysis is not authenticated to the parent")
    if analysis.get("variables") != VARIABLES or analysis.get("clauses") != PARENT_CLAUSES:
        raise ValueError("child25 analysis dimensions drifted")
    if set(analysis.get("row_sizes", {}).values()) != {4}:
        raise ValueError("unexpected child25 selected-row shape")

    bank = json.loads(bank_path.read_text(encoding="utf-8"))
    if bank.get("hit_count") != 5 or bank.get("proposal_count") != 5:
        raise ValueError("unexpected child25 theorem-bank cardinality")
    if bank.get("unreplayed_proposals") != []:
        raise ValueError("child25 theorem bank contains unreplayed proposals")
    if bank.get("order") != EXPECTED_ORDER:
        raise ValueError("child25 boundary order drifted")
    hits = bank.get("hits")
    if not isinstance(hits, list) or len(hits) != len(EXPECTED_HITS):
        raise TypeError("child25 theorem-bank hits are missing")
    for index, (hit, expected) in enumerate(zip(hits, EXPECTED_HITS, strict=True)):
        stage, orientation, consumer, expected_core = expected
        if hit.get("stage") != stage:
            raise ValueError(f"child25 hit {index} stage drifted")
        if hit.get("orientation") != orientation:
            raise ValueError(f"child25 hit {index} orientation drifted")
        if hit.get("lean_consumer") != consumer:
            raise ValueError(f"child25 hit {index} Lean consumer drifted")
        core = hit.get("core")
        if not isinstance(core, dict):
            raise TypeError(f"child25 hit {index} core is missing")
        for key, value in expected_core.items():
            if core.get(key) != value:
                raise ValueError(f"child25 hit {index} core field {key} drifted")
    return analysis, bank


def validate(
    parent_path: Path,
    child_path: Path,
    model_path: Path,
    bank_path: Path,
    analysis_path: Path,
) -> dict[str, Any]:
    if sha256(parent_path) != PARENT_SHA256:
        raise ValueError("unauthenticated child25 parent root")
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
                raise ValueError(f"source-backed {motif_name} orbit does not cut child25")
            cut_clauses[motif_name] = motif_cuts
        if observed_suffix != 5 * ORBIT_CLAUSES:
            raise ValueError("wrong successor suffix length")
        if child.readline():
            raise ValueError("child file contains extra clauses")

    return {
        "schema": "p97-exact17-twenty-fifth-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "parent_sha256": PARENT_SHA256,
        "child_sha256": sha256(child_path),
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES,
        "new_clauses": 5 * ORBIT_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "motivating_model_cut_clauses": cut_clauses,
        "canonical_hits_replayed": True,
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
