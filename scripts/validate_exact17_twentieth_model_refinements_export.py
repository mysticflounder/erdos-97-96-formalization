"""Independently validate the exact-17 twentieth-child DIMACS suffix.

The Lean twentieth source has three hit lists.  The bisector certificates are
two bank records with one common hit list, so this checker emits one orbit for
that family (four clauses), followed by the convex-five and two-Kalmanson
orbits (twelve clauses total).
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

PARENT_CLAUSES = 5_846_188
ORBIT_CLAUSES = 4
MOTIFS: tuple[tuple[str, tuple[Hit, ...]], ...] = (
    ("bisector", ((16, 12), (16, 13), (12, 16), (12, 0), (0, 12), (0, 8),
                   (8, 0), (8, 13), (10, 8), (10, 16))),
    ("convex_five", ((9, 1), (9, 7), (5, 1), (5, 7), (6, 7), (6, 5),
                      (6, 9))),
    ("cancellation", ((2, 5), (2, 11), (0, 11), (0, 8), (15, 5), (15, 8))),
)
NEW_CLAUSES = len(MOTIFS) * ORBIT_CLAUSES
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
PARENT_SHA256 = "e719b8c17edf85e089d859fbc1ab8aaa43d8a6e9514f32eb4a76842a665dd3ce"

_EXPECTED_BANK_ROWS = {
    "bisector": (
        {"center": 0, "support": [2, 4]}, {"center": 2, "support": [0, 5]},
        {"center": 4, "support": [0, 14]}, {"center": 14, "support": [4, 5]},
        {"center": 16, "support": [2, 14]},
    ),
    "convex_five": (
        {"center": 9, "support": [6, 7]},
        {"center": 12, "support": [7, 9, 15]},
        {"center": 15, "support": [6, 7]},
    ),
}


def _default(path: Path, name: str) -> Path:
    return path.with_name(name)


def _check_analysis(path: Path) -> dict[str, Any]:
    data = json.loads(path.read_text(encoding="utf-8"))
    if data.get("cnf_sha256") != PARENT_SHA256:
        raise ValueError("twentieth model analysis is not authenticated to parent")
    if data.get("variables") != VARIABLES or data.get("clauses") != PARENT_CLAUSES:
        raise ValueError("twentieth model analysis dimensions drifted")
    if data.get("named_orders") != [0] or set(data.get("row_sizes", {}).values()) != {4}:
        raise ValueError("unexpected twentieth model analysis shape")
    return data


def _check_theorem_bank(path: Path) -> dict[str, Any]:
    data = json.loads(path.read_text(encoding="utf-8"))
    witnesses = data.get("minimized_witnesses")
    if not isinstance(witnesses, list) or len(witnesses) != 4:
        raise ValueError("theorem bank must contain all four canonical records")
    expected = (
        ("equality-convex-four-point-two-circle-bisector-order-reverse", "reverse", "bisector"),
        ("equality-convex-four-point-two-circle-bisector-order", "forward", "bisector"),
        ("equality-convex-five-point-reverse", "reverse", "convex_five"),
        ("equality-convex-two-kalmanson-cancellation", "forward", "cancellation"),
    )
    seen: dict[str, int] = {}
    for witness, (stage, orientation, family) in zip(witnesses, expected):
        record = witness.get("record", {})
        if (record.get("stage"), record.get("orientation")) != (stage, orientation):
            raise ValueError("canonical theorem-bank record/order drift")
        seen[stage] = seen.get(stage, 0) + 1
        if family in _EXPECTED_BANK_ROWS:
            rows = tuple({"center": r["center"], "support": r["support"]}
                         for r in witness.get("rows", ()))
            if rows != _EXPECTED_BANK_ROWS[family]:
                raise ValueError(f"{family} theorem-bank minimizer drifted")
        elif len(witness.get("rows", ())) != 17:
            raise ValueError("Kalmanson canonical row support drifted")
        else:
            core = record.get("core", {})
            if (
                core.get("boundary_labels") != [0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14]
                or core.get("first_quad") != [0, 2, 5, 11]
                or core.get("second_quad") != [0, 5, 8, 15]
                or core.get("permutation") != [1, 2, 0, 3]
            ):
                raise ValueError("Kalmanson canonical core drifted")
            paths = core.get("paths", [])
            path_steps = [
                [(2, 5, "row", 11)], [(0, 11, "row", 8)], [],
                [(None, 8, "flip", 15), (15, 8, "row", 5),
                 (None, 15, "flip", 5)],
            ]
            observed_steps = [
                [(s.get("center"), s.get("first"), s.get("kind"), s.get("second"))
                 for s in path.get("steps", [])]
                for path in paths
            ]
            if observed_steps != path_steps:
                raise ValueError("Kalmanson canonical paths drifted")
    if set(seen) != {item[0] for item in expected}:
        raise ValueError("not all four canonical records were replayed")
    return {"records": [item[0] for item in expected], "count": len(witnesses)}


def validate(parent_path: Path, child_path: Path, model_path: Path,
             theorem_bank_path: Path | None = None,
             analysis_path: Path | None = None) -> dict[str, object]:
    _check_analysis(analysis_path or _default(model_path, "piqd-twentieth-root-model-analysis.json"))
    bank = _check_theorem_bank(theorem_bank_path or _default(model_path, "piqd-twentieth-root-model-theorem-bank-minimized-all.json"))
    model = assignment_map(model_path)
    suffix_digest = hashlib.sha256()
    observed_suffix = 0
    cut_by_orbit: dict[str, list[int]] = {name: [] for name, _ in MOTIFS}
    with parent_path.open(encoding="ascii") as parent, child_path.open(encoding="ascii") as child:
        if read_header(parent, parent_path) != (VARIABLES, PARENT_CLAUSES):
            raise ValueError("unexpected parent header")
        if read_header(child, child_path) != (VARIABLES, CHILD_CLAUSES):
            raise ValueError("unexpected child header")
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
                    context = f"{orbit_name}/{order_index}/{reverse}"
                    observed = parse_clause(line, context=context)
                    expected = expected_clause(order_index, order, motif, reverse=reverse)
                    if observed != expected:
                        raise ValueError(f"clause mismatch at {context}: {observed} != {expected}")
                    clause_number = PARENT_CLAUSES + observed_suffix + 1
                    if not clause_satisfied(observed, model):
                        cut_by_orbit[orbit_name].append(clause_number)
                    suffix_digest.update(line.encode("ascii"))
                    observed_suffix += 1
        if child.readline():
            raise ValueError("child file contains extra clauses")
    if observed_suffix != NEW_CLAUSES:
        raise ValueError("wrong combined suffix clause count")
    for orbit_name, cuts in cut_by_orbit.items():
        if not cuts:
            raise ValueError(f"{orbit_name} orbit does not cut authenticated twentieth model")
    rejected = {
        stage: bool(cut_by_orbit[family])
        for stage, family in (
            ("equality-convex-four-point-two-circle-bisector-order-reverse", "bisector"),
            ("equality-convex-four-point-two-circle-bisector-order", "bisector"),
            ("equality-convex-five-point-reverse", "convex_five"),
            ("equality-convex-two-kalmanson-cancellation", "cancellation"),
        )
    }
    return {
        "schema": "p97-exact17-twentieth-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "parent_sha256": PARENT_SHA256,
        "variables": VARIABLES, "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES, "new_clauses": NEW_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "motivating_model_cut_clauses": cut_by_orbit,
        "canonical_records": bank["records"],
        "canonical_records_rejected": rejected,
        "analysis_sha256": hashlib.sha256(
            (analysis_path or _default(model_path, "piqd-twentieth-root-model-analysis.json")).read_bytes()
        ).hexdigest(),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--theorem-bank", type=Path)
    parser.add_argument("--analysis", type=Path)
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
