#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Test singleton-certificate coverage of relaxed pinned-surplus masks.

This is a finite-interface falsifier, not a geometric realizability test.  For
each of the 15 fixed v/w rows, it asks whether masks at the eight nonfixed
centers can satisfy all currently proved finite constraints while defeating
every one of the row's relaxed singleton certificates.

Run:
  UV_CACHE_DIR=/private/tmp/uv-cache-endpoint uv run python \
    scripts/pinned-generalm-certificate-coverage.py
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
from collections import defaultdict
from pathlib import Path
from typing import Any

import z3


REPO = Path(__file__).resolve().parents[1]
LABELS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
LABEL_INDEX = {label: index for index, label in enumerate(LABELS)}
NONFIXED_CENTERS = tuple(label for label in LABELS if label not in {"v", "w"})
CARDINALITY_FLOORS = (2, 3, 4)
SCHEMA = "pinned_surplus_generalm_certificate_coverage.v1"

DEFAULT_REQUIRED_FACTS = (
    REPO
    / "certificates"
    / "surplus"
    / "reports"
    / "pinned_surplus_generalm_required_facts.json"
)
DEFAULT_INCIDENCE = (
    REPO
    / "certificates"
    / "surplus"
    / "reports"
    / "pinned_surplus_relaxed_incidence_census.json"
)
DEFAULT_JSON_OUT = (
    REPO
    / "certificates"
    / "surplus"
    / "reports"
    / "pinned_surplus_generalm_certificate_coverage.json"
)
DEFAULT_MARKDOWN_OUT = DEFAULT_JSON_OUT.with_suffix(".md")


def load_shadow_tool() -> Any:
    path = REPO / "scripts" / "surplus-compg-shadow.py"
    spec = importlib.util.spec_from_file_location("surplus_compg_shadow", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load shadow helpers from {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def bit(mask: z3.BitVecRef, label: str) -> z3.BoolRef:
    index = LABEL_INDEX[label]
    return z3.Extract(index, index, mask) == 1


def labels_from_mask(mask: int) -> list[str]:
    return [label for label in LABELS if mask & (1 << LABEL_INDEX[label])]


def submask_domain(
    shadow_tool: Any, sstar: str, center: str, cardinality_floor: int
) -> list[int]:
    values: set[int] = set()
    for full_mask in shadow_tool.candidate_masks_for(sstar, center):
        submask = full_mask
        while True:
            if cardinality_floor <= submask.bit_count() <= 4:
                values.add(submask)
            if submask == 0:
                break
            submask = (submask - 1) & full_mask
    return sorted(values)


def add_finite_domain(
    solver: z3.Solver, variable: z3.BitVecRef, values: list[int]
) -> None:
    solver.add(
        z3.Or(*(variable == z3.BitVecVal(value, len(LABELS)) for value in values))
    )


def add_cross_separation(
    shadow_tool: Any,
    solver: z3.Solver,
    masks: dict[str, z3.BitVecRef],
) -> None:
    for center_index, center in enumerate(LABELS):
        for other_center in LABELS[center_index + 1 :]:
            for left_index, left in enumerate(LABELS):
                for right in LABELS[left_index + 1 :]:
                    if left in {center, other_center} or right in {
                        center,
                        other_center,
                    }:
                        continue
                    if shadow_tool.py_separated(center, other_center, left, right):
                        continue
                    solver.add(
                        z3.Not(
                            z3.And(
                                bit(masks[center], left),
                                bit(masks[center], right),
                                bit(masks[other_center], left),
                                bit(masks[other_center], right),
                            )
                        )
                    )


def add_pair_count_bounds(
    solver: z3.Solver, masks: dict[str, z3.BitVecRef]
) -> None:
    for left_index, left in enumerate(LABELS):
        for right in LABELS[left_index + 1 :]:
            uses = [
                z3.If(
                    z3.And(bit(masks[center], left), bit(masks[center], right)),
                    1,
                    0,
                )
                for center in LABELS
                if center not in {left, right}
            ]
            solver.add(z3.Sum(*uses) <= 2)


def solve_row(
    shadow_tool: Any,
    row: dict[str, Any],
    leaves: list[dict[str, Any]],
    cardinality_floor: int,
) -> dict[str, Any]:
    relaxed_id = row["relaxed_id"]
    sstar = row["sstar"]
    masks = {
        label: z3.BitVec(f"floor{cardinality_floor}_{relaxed_id}_{label}", 10)
        for label in LABELS
    }
    solver = z3.Solver()

    for center in NONFIXED_CENTERS:
        add_finite_domain(
            solver,
            masks[center],
            submask_domain(shadow_tool, sstar, center, cardinality_floor),
        )
    for center in ("v", "w"):
        value = row["relaxed_masks"][center]["mask"]
        solver.add(masks[center] == z3.BitVecVal(value, len(LABELS)))

    add_cross_separation(shadow_tool, solver, masks)
    add_pair_count_bounds(solver, masks)

    for leaf in leaves:
        missing_generator_facts = []
        for fact in leaf["erased_facts"]:
            left, right = fact["witnesses"]
            center = fact["center"]
            missing_generator_facts.append(
                z3.Not(z3.And(bit(masks[center], left), bit(masks[center], right)))
            )
        if not missing_generator_facts:
            raise ValueError(f"leaf {leaf['certificate_id']} has no erased facts")
        solver.add(z3.Or(*missing_generator_facts))

    status = solver.check()
    result: dict[str, Any] = {
        "relaxed_id": relaxed_id,
        "sstar": sstar,
        "certificate_leaf_count": len(leaves),
        "status": str(status),
    }
    if status == z3.sat:
        model = solver.model()
        assignment = {
            center: model.eval(masks[center], model_completion=True).as_long()
            for center in LABELS
        }
        result["countermodel_masks"] = assignment
        result["countermodel_members"] = {
            center: labels_from_mask(mask) for center, mask in assignment.items()
        }
    return result


def markdown_report(report: dict[str, Any]) -> str:
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Pinned surplus general-m certificate coverage",
        "",
        "This is a finite-interface falsifier, not a geometric realizability",
        "test. Nonfixed masks range over submasks of exact admissible masks;",
        "the model enforces cyclic cross-separation and the global at-most-two",
        "pair-count bound. A SAT result means that every singleton certificate",
        "can be made to miss at least one nonzero erased-center generator fact.",
        "",
        "## Results",
        "",
        "| minimum nonfixed labeled card | SAT rows | UNSAT rows | unknown |",
        "|---:|---:|---:|---:|",
    ]
    for floor in report["floors"]:
        summary = floor["summary"]
        lines.append(
            f"| {floor['cardinality_floor']} | {summary['sat']} | "
            f"{summary['unsat']} | {summary['unknown']} |"
        )
    lines.extend(
        [
            "",
            "All 15 fixed v/w rows admit uncovered masks at floors 2 and 3.",
            "All 15 are covered at floor 4, reproducing exact-bank completeness.",
            "Therefore the current 135 certificates do not establish a",
            "general-m submask bridge from the known finite constraints alone;",
            "closure needs four-label confinement, stronger geometric selection,",
            "or a genuinely broader certificate family.",
            "",
            "Representative SAT assignments for every row are recorded in the",
            "machine report.",
            "",
        ]
    )
    return "\n".join(lines)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--required-facts", type=Path, default=DEFAULT_REQUIRED_FACTS)
    parser.add_argument("--incidence", type=Path, default=DEFAULT_INCIDENCE)
    parser.add_argument("--json-out", type=Path, default=DEFAULT_JSON_OUT)
    parser.add_argument("--markdown-out", type=Path, default=DEFAULT_MARKDOWN_OUT)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    shadow_tool = load_shadow_tool()
    required_facts = json.loads(args.required_facts.read_text())
    incidence = json.loads(args.incidence.read_text())

    leaves_by_relaxed_id: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for leaf in required_facts["leaves"]:
        leaves_by_relaxed_id[leaf["relaxed_id"]].append(leaf)

    floors = []
    for cardinality_floor in CARDINALITY_FLOORS:
        rows = [
            solve_row(
                shadow_tool,
                row,
                leaves_by_relaxed_id[row["relaxed_id"]],
                cardinality_floor,
            )
            for row in incidence["rows"]
        ]
        floors.append(
            {
                "cardinality_floor": cardinality_floor,
                "summary": {
                    status: sum(row["status"] == status for row in rows)
                    for status in ("sat", "unsat", "unknown")
                },
                "rows": rows,
            }
        )

    report = {
        "schema": SCHEMA,
        "status_semantics": {
            "sat": "finite masks satisfy the interface and defeat every leaf",
            "unsat": "the singleton leaves cover the stated finite interface",
        },
        "inputs": {
            "required_facts": str(args.required_facts.relative_to(REPO)),
            "incidence": str(args.incidence.relative_to(REPO)),
        },
        "constraints": {
            "fixed_centers": ["v", "w"],
            "nonfixed_centers": list(NONFIXED_CENTERS),
            "nonfixed_domain": "submasks of candidateMasks at the stated card floor",
            "cross_separation": True,
            "point_pair_class_count_le_two": True,
            "coverage": "some leaf has all nonzero erased-center generator pairs",
        },
        "floors": floors,
    }

    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    args.markdown_out.write_text(markdown_report(report))

    expected = {
        2: {"sat": 15, "unsat": 0, "unknown": 0},
        3: {"sat": 15, "unsat": 0, "unknown": 0},
        4: {"sat": 0, "unsat": 15, "unknown": 0},
    }
    actual = {floor["cardinality_floor"]: floor["summary"] for floor in floors}
    if actual != expected:
        print(f"unexpected coverage profile: {actual}", file=sys.stderr)
        return 1
    print(json.dumps(actual, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
