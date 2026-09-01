# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact fixed-cell obstruction replay for the Rigid221 S0 true-cap wave.

The current cell is the twelve-role rational configuration in
``rigid221_s0_coupled_two_row``.  This checker deliberately invokes no SMT or
numeric solver.  It replays the cell over ``fractions.Fraction``, certifies its
diameter MEC, and checks the source consequence that the physical role ``O``
(``S.oppApex2``) must itself be one of the three distinct MEC-boundary Moser
vertices.

The result is only about this fixed coordinate cell.  In particular, the
variable-coordinate cell with the same support/order data is recorded as
``ENCODING_BLOCKED`` rather than extrapolated from the fixed witness.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Iterable, Mapping, Sequence
from fractions import Fraction
from itertools import permutations
from pathlib import Path
from typing import Any

from rigid221_s0_coupled_two_row import (
    KU,
    KV,
    ORDER,
    PHYSICAL,
    POINTS,
)
from rigid221_s0_coupled_two_row import build_report as build_row_core_report

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-s0-true-cap-obstruction/v1"
FIXED_CELL_VERDICT = "UNSAT_FIXED_CELL_EXACT"

SOURCE_ANCHORS = {
    "surplus_cap_packet": (
        "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332"
    ),
    "non_obtuse_triangle": (
        "lean/Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean:667"
    ),
    "on_arc_opposite": "lean/Erdos9796Proof/P97/Foundation.lean:83",
    "opp_index2": (
        "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:550"
    ),
    "opp_apex2_and_physical_role": (
        "lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:305; "
        "docs/computation/rigid221-s0-coupled-two-row-residue-lantern-"
        "20260831/s0-role-and-cell-enumeration.json:11"
    ),
}


def add(first: Point, second: Point) -> Point:
    return first[0] + second[0], first[1] + second[1]


def scale(value: F, point: Point) -> Point:
    return value * point[0], value * point[1]


def dist2(first: Point, second: Point) -> F:
    return (first[0] - second[0]) ** 2 + (first[1] - second[1]) ** 2


def signed_area2(v: Point, vj: Point, vk: Point) -> F:
    """Exact transcription of ``Problem97.signedArea2``."""

    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (
        vj[1] - v[1]
    )


def on_arc_opposite(vi: Point, vj: Point, vk: Point, v: Point) -> bool:
    """Exact transcription of the closed ``Problem97.OnArcOpposite`` filter."""

    return signed_area2(v, vj, vk) * signed_area2(vi, vj, vk) <= 0


def dot(first: Point, second: Point) -> F:
    return first[0] * second[0] + first[1] * second[1]


def sub(first: Point, second: Point) -> Point:
    return first[0] - second[0], first[1] - second[1]


def non_obtuse(points: Mapping[str, Point], triple: Sequence[str]) -> bool:
    """Check the three source inner-product inequalities exactly."""

    v1, v2, v3 = (points[role] for role in triple)
    return (
        dot(sub(v2, v1), sub(v3, v1)) >= 0
        and dot(sub(v3, v2), sub(v1, v2)) >= 0
        and dot(sub(v1, v3), sub(v2, v3)) >= 0
    )


def cap_sets(
    points: Mapping[str, Point], triple: Sequence[str]
) -> tuple[frozenset[str], frozenset[str], frozenset[str]]:
    """Compute the three exact closed signed-area caps for an ordered triple."""

    v1, v2, v3 = (points[role] for role in triple)
    c1 = frozenset(
        role for role, p in points.items() if on_arc_opposite(v1, v2, v3, p)
    )
    c2 = frozenset(
        role for role, p in points.items() if on_arc_opposite(v2, v3, v1, p)
    )
    c3 = frozenset(
        role for role, p in points.items() if on_arc_opposite(v3, v1, v2, p)
    )
    return c1, c2, c3


def cap_triple_valid(
    points: Mapping[str, Point], triple: Sequence[str], caps: Sequence[frozenset[str]]
) -> bool:
    """Check the finite membership content of ``CapTriple``."""

    v1, v2, v3 = triple
    if signed_area2(points[v1], points[v2], points[v3]) == 0:
        return False
    c1, c2, c3 = caps
    if not (
        v1 not in c1
        and v2 in c1
        and v3 in c1
        and v1 in c2
        and v2 not in c2
        and v3 in c2
        and v1 in c3
        and v2 in c3
        and v3 not in c3
    ):
        return False
    moser = frozenset(triple)
    return all(
        sum(role in cap for cap in caps) == 1
        for role in points
        if role not in moser
    )


def opp_index2(surplus_index: int) -> int:
    """The source rotation ``0 -> 2``, ``1 -> 0``, ``2 -> 1``."""

    if surplus_index not in (0, 1, 2):
        raise ValueError(f"invalid cap index: {surplus_index}")
    return (surplus_index + 2) % 3


def cap_interior(caps: Sequence[frozenset[str]], triple: Sequence[str], index: int) -> frozenset[str]:
    """Erase the two Moser chord endpoints, exactly as ``capInteriorByIndex``."""

    endpoint_indices = ((1, 2), (2, 0), (0, 1))
    first, second = endpoint_indices[index]
    return caps[index] - {triple[first], triple[second]}


def fraction_json(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def point_json(point: Point) -> list[str]:
    return [fraction_json(point[0]), fraction_json(point[1])]


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def exact_mec_certificate(points: Mapping[str, Point]) -> dict[str, Any]:
    """Certify the fixed cell's diameter MEC without square roots."""

    center = scale(F(1, 2), add(points["v"], points["xv"]))
    diameter_squared = dist2(points["v"], points["xv"])
    radius_squared = diameter_squared / 4
    slacks = {
        role: radius_squared - dist2(point, center) for role, point in points.items()
    }
    if any(slack < 0 for slack in slacks.values()):
        raise ValueError("the v-xv midpoint disk does not enclose the current cell")
    boundary = frozenset(role for role, slack in slacks.items() if slack == 0)
    if boundary != {"v", "xv"}:
        raise ValueError(f"unexpected fixed-cell MEC boundary: {sorted(boundary)}")
    o_distance_squared = dist2(points["O"], center)
    o_slack = radius_squared - o_distance_squared
    if o_slack <= 0:
        raise ValueError("physical O is not strictly inside the fixed-cell MEC")
    return {
        "diameter_pair": ["v", "xv"],
        "center": point_json(center),
        "diameter_squared": fraction_json(diameter_squared),
        "radius_squared": fraction_json(radius_squared),
        "boundary_roles": sorted(boundary),
        "boundary_cardinality": len(boundary),
        "enclosure_slacks": {
            role: fraction_json(slacks[role]) for role in ORDER
        },
        "physical_O": {
            "role_identity": "O = S.oppApex2",
            "distance_squared_to_mec_center": fraction_json(o_distance_squared),
            "strict_interior_slack": fraction_json(o_slack),
            "on_boundary": False,
        },
        "minimality_replay": {
            "identity": (
                "For every center c, dist2(v,c)+dist2(xv,c) = "
                "2*dist2(c,mid(v,xv))+dist2(v,xv)/2."
            ),
            "consequence": (
                "Every enclosing disk has radius_squared >= dist2(v,xv)/4; "
                "the displayed midpoint disk attains the bound."
            ),
            "uses_square_roots": False,
        },
    }


def packet_candidates(
    points: Mapping[str, Point], boundary_roles: Iterable[str]
) -> dict[str, list[dict[str, Any]]]:
    """Enumerate source-shaped packet candidates for S0-I and S0-N separately."""

    candidates: dict[str, list[dict[str, Any]]] = {"S0-I": [], "S0-N": []}
    for triple in permutations(sorted(boundary_roles), 3):
        if not non_obtuse(points, triple):
            continue
        caps = cap_sets(points, triple)
        if not cap_triple_valid(points, triple, caps):
            continue
        for surplus_index in range(3):
            opposite_index = opp_index2(surplus_index)
            if triple[opposite_index] != "O" or len(caps[surplus_index]) <= 4:
                continue
            j = cap_interior(caps, triple, opposite_index)
            branch = "S0-I" if "xu" in j else "S0-N"
            candidates[branch].append(
                {
                    "triple": list(triple),
                    "surplus_index": surplus_index,
                    "surplus_cap_cardinality": len(caps[surplus_index]),
                    "opp_index2": opposite_index,
                    "J": sorted(j),
                }
            )
    return candidates


def relaxed_nonboundary_candidates(points: Mapping[str, Point]) -> dict[str, Any]:
    """Smoke-test cap/index semantics after deliberately dropping MEC boundary."""

    candidates = packet_candidates(points, points)
    return {
        "status": "SAT_ABSTRACTION" if any(candidates.values()) else "UNSAT_RELAXATION_EXACT",
        "dropped_source_requirement": "SurplusCapPacket.hCirc / MEC-boundary triple",
        "not_a_source_witness": True,
        "counts": {branch: len(rows) for branch, rows in candidates.items()},
        "sample": {branch: rows[:3] for branch, rows in candidates.items()},
    }


def source_ledger() -> list[dict[str, Any]]:
    return [
        {
            "id": "TC-01",
            "requirement": "finite nonempty, noncollinear carrier",
            "source": SOURCE_ANCHORS["surplus_cap_packet"],
            "fixed_cell_status": "CHECKED",
        },
        {
            "id": "TC-02",
            "requirement": "three distinct MEC-boundary Moser vertices (hCirc)",
            "source": SOURCE_ANCHORS["surplus_cap_packet"],
            "fixed_cell_status": "REFUTED_BOUNDARY_CARDINALITY_2",
        },
        {
            "id": "TC-03",
            "requirement": (
                "conditional on the lane role assignment O = S.oppApex2, "
                "physical O is one of those boundary vertices"
            ),
            "source": SOURCE_ANCHORS["opp_apex2_and_physical_role"],
            "fixed_cell_status": "REFUTED_STRICT_INTERIOR_SLACK_3051/6749",
        },
        {
            "id": "TC-04",
            "requirement": "all three Moser angles have nonnegative dot product",
            "source": SOURCE_ANCHORS["non_obtuse_triangle"],
            "fixed_cell_status": "NOT_REACHED_NO_BOUNDARY_TRIPLE",
        },
        {
            "id": "TC-05",
            "requirement": "three exact closed OnArcOpposite cap filters and CapTriple memberships",
            "source": SOURCE_ANCHORS["on_arc_opposite"],
            "fixed_cell_status": "NOT_REACHED_NO_BOUNDARY_TRIPLE",
        },
        {
            "id": "TC-06",
            "requirement": "selected surplus cap has cardinality greater than four",
            "source": SOURCE_ANCHORS["surplus_cap_packet"],
            "fixed_cell_status": "NOT_REACHED_NO_BOUNDARY_TRIPLE",
        },
        {
            "id": "TC-07",
            "requirement": "oppIndex2 rotation defines J by erasing its two Moser endpoints",
            "source": SOURCE_ANCHORS["opp_index2"],
            "fixed_cell_status": "NOT_REACHED_NO_BOUNDARY_TRIPLE",
        },
        {
            "id": "TC-08-I",
            "requirement": "S0-I: xu belongs to J",
            "source": "s0-source-constraint-manifest.md:C-01",
            "fixed_cell_status": "NOT_REACHED_J_UNDEFINED",
        },
        {
            "id": "TC-08-N",
            "requirement": "S0-N: xu does not belong to J; no endpoint inference",
            "source": "s0-source-constraint-manifest.md:C-01",
            "fixed_cell_status": "NOT_REACHED_J_UNDEFINED",
        },
    ]


def build_report() -> dict[str, Any]:
    row_report = build_row_core_report()
    mec = exact_mec_certificate(POINTS)
    boundary_candidates = packet_candidates(POINTS, mec["boundary_roles"])
    if any(boundary_candidates.values()):
        raise ValueError("a source-shaped packet survived the two-point boundary")

    formula_rows = {}
    for branch, condition in (
        ("S0-I", "xu in J"),
        ("S0-N", "xu not in J; no endpoint inference"),
    ):
        formula_rows[branch] = {
            "verdict": FIXED_CELL_VERDICT,
            "branch_condition": condition,
            "source_packet_candidates": len(boundary_candidates[branch]),
            "first_failed_requirement": "TC-02",
            "failure": (
                "the unique fixed-cell MEC has only two boundary roles; independently, "
                "physical O is strictly inside it"
            ),
            "minimal_source_core_relative_to_fixed_cell": ["TC-03"],
        }

    here = Path(__file__).resolve()
    row_module = here.with_name("rigid221_s0_coupled_two_row.py")
    repo_root = here.parents[4]
    return {
        "schema": SCHEMA,
        "status": FIXED_CELL_VERDICT,
        "arithmetic": "fractions.Fraction only",
        "solver_invoked": False,
        "input_identity": {
            "cell": "current fixed twelve-role coupled support/order cell",
            "row_module": str(row_module.relative_to(repo_root)),
            "row_module_sha256": sha256(row_module),
            "checker_sha256": sha256(here),
            "cyclic_order": list(ORDER),
            "physical_roles": sorted(PHYSICAL),
            "Ku": sorted(KU),
            "Kv": sorted(KV),
            "row_core_replayed": row_report["row_core_status"],
        },
        "claim_scope": {
            "fixed_coordinates_only": True,
            "fixed_supports_and_order_only": True,
            "S0_I_and_S0_N_separate": True,
            "variable_coordinate_cell": False,
            "source_universal_claim": False,
            "lean_claim": False,
            "promotion_claim": False,
        },
        "source_anchors": SOURCE_ANCHORS,
        "source_requirement_ledger": source_ledger(),
        "exact_mec_certificate": mec,
        "formulas": formula_rows,
        "hypothesis_minimization": {
            "background": "the fixed twelve rational coordinates and their exact MEC certificate",
            "smallest_added_source_consequence_refuted": "TC-03",
            "minimal_source_core_relative_to_background": ["TC-03"],
            "independent_cardinality_obstruction": "TC-02",
            "dropped_without_changing_verdict": [
                "three non-obtuse angle inequalities",
                "OnArcOpposite filters and CapTriple memberships",
                "surplusIdx and surplus-cap cardinality",
                "oppIndex2 cap interior J",
                "S0-I/S0-N membership",
                "both exact-four support equations",
                "the fixed cyclic-order inequalities",
            ],
            "smallest_source_lemma_supported": (
                "For this fixed carrier, identifying physical O with S.oppApex2 "
                "precludes a SurplusCapPacket because oppApex2 must be an MEC-boundary "
                "Moser vertex but O has exact positive MEC slack 3051/6749."
            ),
        },
        "stronger_claim_test": {
            "requested_alternatives": ["two-point MEC", "wrong surplus cap"],
            "fixed_cell_outcome": "TWO_POINT_MEC",
            "wrong_surplus_cap_branch": "NOT_REACHED_HCIRC_FAILS_FIRST",
            "ordered_boundary_triples_checked": 0,
            "hCirc_dropped_exact_smoke": relaxed_nonboundary_candidates(POINTS),
            "variable_coordinate_same_support_order_relaxation": {
                "status": "ENCODING_BLOCKED",
                "reason": (
                    "The fixed-cell arithmetic does not cover variable coordinates. "
                    "A source-faithful exact QF_NRA encoding and independently checked "
                    "verdict are separate work; no such verdict is inferred here."
                ),
                "unencoded": [
                    "variable rational/real coordinates",
                    "strict convexity for the fixed cyclic order",
                    "complete exact Ku/Kv fibers after deletion",
                    "MEC minimality with a genuine three-point boundary",
                    "source-exact cap partition and surplus selection",
                ],
            },
        },
        "certificate_contract": {
            "replay": (
                "uv run python docs/computation/rigid221-s0-coupled-two-row-"
                "residue-lantern-20260831/solver/rigid221_s0_true_cap_obstruction.py"
            ),
            "trust": "deterministic Python standard-library exact arithmetic; not a Lean proof",
        },
    }


def write_json(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--report-output", type=Path)
    args = parser.parse_args()

    report = build_report()
    if args.output is not None:
        write_json(args.output, report)
    if args.report_output is not None:
        write_json(args.report_output, report)
    if args.output is None and args.report_output is None:
        print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
