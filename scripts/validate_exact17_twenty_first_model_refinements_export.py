"""Independently validate the exact-17 twenty-first-model refinement suffix.

The authenticated child21 survivor reports five theorem-bank hits.  Its two
bisector records have one common positive-hit support.  That same support also
contains every selected-row equality used by the cancellation record and the
three point/focus incidences used by the perpendicular-bisector record.  Hence
the source-backed successor contains only two four-clause occurrence orbits:
the common bisector support and the convex-five support.
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

PARENT_CLAUSES = 5_846_200
ORBIT_CLAUSES = 4
BIS_MOTIF: tuple[Hit, ...] = (
    (3, 2), (3, 13), (13, 3), (13, 15),
    (15, 13), (15, 2), (16, 3), (16, 15),
)
CONVEX_MOTIF: tuple[Hit, ...] = (
    (9, 5), (9, 2), (4, 5), (4, 2), (3, 2), (3, 9), (3, 4),
)
MOTIFS: tuple[tuple[str, tuple[Hit, ...]], ...] = (
    ("bisector", BIS_MOTIF),
    ("convex_five", CONVEX_MOTIF),
)
NEW_CLAUSES = len(MOTIFS) * ORBIT_CLAUSES
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
PARENT_SHA256 = "bc42cd2756d6b3d84c5eb265762bc346a893dbdbc01bbe8ac5dbcb2f53f89720"

EXPECTED_HITS = (
    ("equality-convex-four-point-two-circle-bisector-order-reverse", "reverse",
     {"Q": 14, "U": 13, "V": 8, "Y": 11}),
    ("equality-convex-four-point-two-circle-bisector-order", "forward",
     {"Q": 8, "U": 11, "V": 14, "Y": 13}),
    ("equality-convex-five-point", "forward",
     {"a": 9, "b": 8, "c": 11, "x": 15, "y": 10}),
    ("equality-convex-two-kalmanson-cancellation", "forward", None),
    ("equality-perpendicular-bisector-convex", "invariant",
     {"foci": [11, 13], "points": [5, 8, 14]}),
)


def _default(path: Path, name: str) -> Path:
    return path.with_name(name)


def _check_analysis(path: Path) -> dict[str, Any]:
    data = json.loads(path.read_text(encoding="utf-8"))
    if data.get("cnf_sha256") != PARENT_SHA256:
        raise ValueError("child21 analysis is not authenticated to the parent")
    if data.get("variables") != VARIABLES or data.get("clauses") != PARENT_CLAUSES:
        raise ValueError("child21 analysis dimensions drifted")
    if data.get("named_orders") != [0] or set(data.get("row_sizes", {}).values()) != {4}:
        raise ValueError("unexpected child21 analysis shape")
    return data


def _check_cancellation_subsumption(core: dict[str, Any]) -> None:
    boundary = [0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14]
    if (
        core.get("boundary_labels") != boundary
        or core.get("first_quad") != [0, 2, 3, 15]
        or core.get("second_quad") != [0, 3, 15, 16]
        or core.get("permutation") != [1, 2, 0, 3]
    ):
        raise ValueError("child21 cancellation core drifted")
    row_hits: set[Hit] = set()
    for path in core.get("paths", []):
        for step in path.get("steps", []):
            if step.get("kind") == "row":
                center = step.get("center")
                first = step.get("first")
                second = step.get("second")
                if not all(isinstance(value, int) for value in (center, first, second)):
                    raise ValueError("malformed cancellation row step")
                row_hits.add((center, first))
                row_hits.add((center, second))
    if not row_hits or not row_hits <= set(BIS_MOTIF):
        raise ValueError("cancellation is not subsumed by the bisector support")


def _check_perpendicular_subsumption(core: dict[str, Any]) -> None:
    boundary = [0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14]
    inverse = {label: position for position, label in enumerate(boundary)}
    foci = tuple(inverse[label] for label in core.get("foci", []))
    points = tuple(inverse[label] for label in core.get("points", []))
    if foci != (3, 15) or points != (13, 2, 16):
        raise ValueError("perpendicular-bisector hit is not subsumed by bisector support")

    # Row hits certify equal *unordered distance pairs*.  Close precisely those
    # equalities under symmetry and transitivity; the middle point uses a
    # three-row chain rather than two direct hits on its own row.
    parent: dict[tuple[int, int], tuple[int, int]] = {}

    def distance_pair(first: int, second: int) -> tuple[int, int]:
        return (first, second) if first < second else (second, first)

    def find(pair: tuple[int, int]) -> tuple[int, int]:
        parent.setdefault(pair, pair)
        while parent[pair] != pair:
            parent[pair] = parent[parent[pair]]
            pair = parent[pair]
        return pair

    def union(first: tuple[int, int], second: tuple[int, int]) -> None:
        first_root = find(first)
        second_root = find(second)
        if first_root != second_root:
            parent[second_root] = first_root

    supports: dict[int, list[int]] = {}
    for center, point in BIS_MOTIF:
        supports.setdefault(center, []).append(point)
    for center, support in supports.items():
        if len(support) != 2:
            raise ValueError("bisector support is not two hits per center")
        union(distance_pair(center, support[0]), distance_pair(center, support[1]))

    left_focus, right_focus = foci
    for point in points:
        if find(distance_pair(point, left_focus)) != find(
            distance_pair(point, right_focus)
        ):
            raise ValueError("perpendicular-bisector equality is absent from row closure")


def _check_theorem_bank(path: Path) -> dict[str, Any]:
    data = json.loads(path.read_text(encoding="utf-8"))
    hits = data.get("hits")
    if (
        not isinstance(hits, list)
        or len(hits) != 5
        or data.get("hit_count") != 5
        or data.get("proposal_count") != 5
        or data.get("unreplayed_proposals") != []
    ):
        raise ValueError("theorem bank is not the complete five-hit exact replay")
    for hit, (stage, orientation, expected_core) in zip(hits, EXPECTED_HITS):
        if (hit.get("stage"), hit.get("orientation")) != (stage, orientation):
            raise ValueError("theorem-bank hit order or identity drifted")
        core = hit.get("core")
        if not isinstance(core, dict):
            raise TypeError("theorem-bank hit omitted its core")
        if expected_core is not None and core != expected_core:
            raise ValueError(f"theorem-bank core drifted for {stage}")
        if stage == "equality-convex-two-kalmanson-cancellation":
            _check_cancellation_subsumption(core)
        if stage == "equality-perpendicular-bisector-convex":
            _check_perpendicular_subsumption(core)
    return {"records": [item[0] for item in EXPECTED_HITS], "count": len(hits)}


def validate(
    parent_path: Path,
    child_path: Path,
    model_path: Path,
    theorem_bank_path: Path | None = None,
    analysis_path: Path | None = None,
) -> dict[str, object]:
    analysis_file = analysis_path or _default(
        model_path, "piqd-twenty-first-root-fresh-rerun-model-analysis.json"
    )
    bank_file = theorem_bank_path or _default(
        model_path, "piqd-twenty-first-root-fresh-rerun-model-theorem-bank.json"
    )
    _check_analysis(analysis_file)
    bank = _check_theorem_bank(bank_file)
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
    if any(not cuts for cuts in cut_by_orbit.values()):
        raise ValueError("one of the new occurrence orbits does not cut child21")
    rejected = {
        stage: bool(cut_by_orbit["convex_five" if "five-point" in stage else "bisector"])
        for stage, _, _ in EXPECTED_HITS
    }
    return {
        "schema": "p97-exact17-twenty-first-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "parent_sha256": PARENT_SHA256,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES,
        "new_clauses": NEW_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "motivating_model_cut_clauses": cut_by_orbit,
        "canonical_records": bank["records"],
        "canonical_records_rejected": rejected,
        "analysis_sha256": hashlib.sha256(analysis_file.read_bytes()).hexdigest(),
        "theorem_bank_sha256": hashlib.sha256(bank_file.read_bytes()).hexdigest(),
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
    report = validate(
        args.parent, args.child, args.model, args.theorem_bank, args.analysis
    )
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
