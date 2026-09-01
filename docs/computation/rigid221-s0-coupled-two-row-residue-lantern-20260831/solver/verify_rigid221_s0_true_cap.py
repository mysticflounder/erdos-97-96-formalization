# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent exact verifier for the scoped S0 true-cap wave-1 result.

This verifier does not import either wave-1 producer.  It reconstructs the
fixed carrier MEC over ``fractions.Fraction``, checks the minimized source
obstruction for S0-I and S0-N, and fail-closes the bounded coordinate-search
artifact.  Because wave 1 retained no witness, it deliberately reports that no
``SAT_EXACT`` surplus-cap packet was reconstructed.
"""

from __future__ import annotations

import argparse
import json
from collections.abc import Mapping
from fractions import Fraction
from pathlib import Path
from typing import Any

F = Fraction
Point = tuple[F, F]

ORDER = (
    "O",
    "au",
    "av",
    "v",
    "delta",
    "u",
    "cv",
    "cu",
    "xu",
    "xv",
    "bv",
    "bu",
)


class VerificationError(ValueError):
    """An artifact is malformed or its exact arithmetic does not replay."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def parse_fraction(value: object) -> F:
    require(isinstance(value, str), "fraction is not a string")
    numerator, separator, denominator = value.partition("/")
    require(separator == "/" and numerator and denominator, "invalid fraction")
    return F(int(numerator), int(denominator))


def parse_point(value: object) -> Point:
    require(isinstance(value, list) and len(value) == 2, "invalid point")
    return parse_fraction(value[0]), parse_fraction(value[1])


def fraction_json(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


def point_json(point: Point) -> list[str]:
    return [fraction_json(point[0]), fraction_json(point[1])]


def dist2(first: Point, second: Point) -> F:
    return (first[0] - second[0]) ** 2 + (first[1] - second[1]) ** 2


def midpoint(first: Point, second: Point) -> Point:
    return (first[0] + second[0]) / 2, (first[1] + second[1]) / 2


def load_json(path: Path) -> object:
    return json.loads(path.read_text(encoding="utf-8"))


def require_mapping(value: object, message: str) -> Mapping[str, Any]:
    require(isinstance(value, dict), message)
    return value


def verify_fixed_obstruction(
    row_document: object, obstruction_document: object
) -> tuple[dict[str, Point], dict[str, Any]]:
    row = require_mapping(row_document, "row document is not an object")
    obstruction = require_mapping(
        obstruction_document, "obstruction document is not an object"
    )
    require(row.get("status") == "ROW_CORE_POSITIVE_CONTROL", "bad row status")
    require(row.get("source_status") == "SOURCE_INVALID", "bad source status")
    require(row.get("cyclic_order") == list(ORDER), "bad fixed order")
    raw_points = require_mapping(row.get("points"), "missing fixed points")
    require(set(raw_points) == set(ORDER), "fixed role mismatch")
    points = {role: parse_point(raw_points[role]) for role in ORDER}

    require(
        obstruction.get("schema") == "rigid221-s0-true-cap-obstruction/v1",
        "bad obstruction schema",
    )
    require(
        obstruction.get("status") == "UNSAT_FIXED_CELL_EXACT",
        "bad fixed-cell verdict",
    )
    require(obstruction.get("solver_invoked") is False, "unexpected solver claim")

    mec = require_mapping(obstruction.get("exact_mec_certificate"), "missing MEC")
    center = midpoint(points["v"], points["xv"])
    radius2 = dist2(points["v"], points["xv"]) / 4
    slacks = {role: radius2 - dist2(center, point) for role, point in points.items()}
    require(all(value >= 0 for value in slacks.values()), "diameter disk misses role")
    boundary = frozenset(role for role, value in slacks.items() if value == 0)
    require(boundary == {"v", "xv"}, "fixed MEC boundary is not {v,xv}")
    require(point_json(center) == mec.get("center"), "MEC center mismatch")
    require(fraction_json(radius2) == mec.get("radius_squared"), "MEC radius mismatch")
    require(mec.get("boundary_roles") == ["v", "xv"], "MEC roles mismatch")
    require(mec.get("boundary_cardinality") == 2, "MEC cardinality mismatch")
    expected_slacks = {role: fraction_json(slacks[role]) for role in ORDER}
    require(expected_slacks == mec.get("enclosure_slacks"), "MEC slacks mismatch")
    require(slacks["O"] == F(3051, 6749), "unexpected exact O slack")

    physical_o = require_mapping(mec.get("physical_O"), "missing physical O")
    require(physical_o.get("role_identity") == "O = S.oppApex2", "bad O identity")
    require(physical_o.get("on_boundary") is False, "O incorrectly on boundary")
    require(
        physical_o.get("strict_interior_slack") == fraction_json(slacks["O"]),
        "O slack mismatch",
    )

    minimization = require_mapping(
        obstruction.get("hypothesis_minimization"), "missing minimization"
    )
    require(
        minimization.get("minimal_source_core_relative_to_background") == ["TC-03"],
        "bad minimized source core",
    )
    formulas = require_mapping(obstruction.get("formulas"), "missing S0 formulas")
    require(set(formulas) == {"S0-I", "S0-N"}, "S0 branches are not separate")
    for branch in ("S0-I", "S0-N"):
        formula = require_mapping(formulas[branch], f"bad {branch} formula")
        require(formula.get("verdict") == "UNSAT_FIXED_CELL_EXACT", "bad branch verdict")
        require(formula.get("first_failed_requirement") == "TC-02", "bad first failure")
        require(
            formula.get("minimal_source_core_relative_to_fixed_cell") == ["TC-03"],
            "bad branch core",
        )

    scope = require_mapping(obstruction.get("claim_scope"), "missing obstruction scope")
    require(scope.get("fixed_coordinates_only") is True, "fixed scope omitted")
    require(scope.get("variable_coordinate_cell") is False, "variable scope overclaim")
    require(scope.get("source_universal_claim") is False, "universal overclaim")
    return points, dict(obstruction)


def verify_search_boundary(points: Mapping[str, Point], search_document: object) -> None:
    search = require_mapping(search_document, "search document is not an object")
    require(
        search.get("schema") == "rigid221-s0-true-cap-bounded-coordinate-search/v1",
        "bad search schema",
    )
    require(search.get("status") == "ENCODING_BLOCKED", "bad search status")
    require(search.get("witness") is None, "unverified witness retained")
    require(search.get("solver_invoked") is False, "unexpected search solver claim")
    require(
        search.get("evidence_label")
        == "EMPIRICALLY_VERIFIED_FINITE_EXACT_GRID_EXHAUSTION",
        "bad evidence label",
    )
    fixed_input = require_mapping(search.get("fixed_input"), "missing fixed input")
    require(fixed_input.get("cyclic_order") == list(ORDER), "search order mismatch")
    expected_points = {role: point_json(points[role]) for role in ORDER}
    require(fixed_input.get("points") == expected_points, "search coordinates mismatch")

    counts = require_mapping(search.get("search_counts"), "missing search counts")
    one = require_mapping(counts.get("one_added_role"), "missing one-role counts")
    two = require_mapping(counts.get("two_added_roles"), "missing two-role counts")
    require(one.get("non_obtuse_boundary_triples") == 0, "one-role survivor exists")
    require(two.get("non_obtuse_boundary_pairs") == 0, "two-role survivor exists")
    require(one.get("source_packet_candidates") == 0, "one-role packet exists")
    require(two.get("source_packet_candidates") == 0, "two-role packet exists")

    scope = require_mapping(search.get("claim_scope"), "missing search scope")
    require(scope.get("finite_bounded_grid_exhausted") is True, "grid scope omitted")
    require(scope.get("unrestricted_family_decided") is False, "family overclaim")
    require(scope.get("source_universal_claim") is False, "universal overclaim")
    require(scope.get("l1_s0_i_decided") is False, "S0-I overclaim")
    require(scope.get("l1_s0_n_decided") is False, "S0-N overclaim")
    open_boundary = require_mapping(search.get("open_boundary"), "missing open boundary")
    require(
        open_boundary.get("unrestricted_addition_only_family") == "OPEN",
        "addition-only family not open",
    )
    require(open_boundary.get("universal_unsat_claim") is False, "universal claim set")


def verify_documents(
    row_document: object, obstruction_document: object, search_document: object
) -> dict[str, Any]:
    points, _ = verify_fixed_obstruction(row_document, obstruction_document)
    verify_search_boundary(points, search_document)
    return {
        "status": "VERIFIED_SCOPED_OBSTRUCTION",
        "fixed_cell_mec_exact": True,
        "fixed_cell_boundary_roles": ["v", "xv"],
        "physical_O_boundary_required": True,
        "physical_O_on_fixed_mec_boundary": False,
        "physical_O_strict_interior_slack": "3051/6749",
        "minimal_fixed_cell_source_core": ["TC-03"],
        "s0_i_fixed_cell": "UNSAT_FIXED_CELL_EXACT",
        "s0_n_fixed_cell": "UNSAT_FIXED_CELL_EXACT",
        "bounded_grid_claim_boundary_verified": True,
        "l1_s0_i_decided": False,
        "l1_s0_n_decided": False,
        "sat_exact_witness_reconstructed": False,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("row_core", type=Path)
    parser.add_argument("fixed_obstruction", type=Path)
    parser.add_argument("bounded_search", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = verify_documents(
        load_json(args.row_core),
        load_json(args.fixed_obstruction),
        load_json(args.bounded_search),
    )
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()
