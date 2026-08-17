# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Lane D: post-validate_model six-center faithful-boundary re-check.

The v7 common-only model (freshthird_firstnonhit_common_only_v7) encodes the
reduced finite payload but explicitly omits the faithful six-center
``classAt``/``SelectedFourClass`` boundary: the encoder sets
``faithful_six_center_boundary_encoded = False`` and records
``missing_relations = ["classAt", "SelectedFourClass"]``.  This module is the
additive re-check that, given a v7 SAT readback dict, reconstructs the
six-center bridge antecedents the model *does* carry and reports the precise
missing antecedent together with the Lean route that closes it.

Pure and solver-free: it never imports the runner, never emits CNF, and never
calls a solver.  It validates the readback contract structurally and raises
``RecheckError`` on drift, mirroring the runner's fail-closed style.  The
integration point (a follow-up lane) will call :func:`recheck` immediately after
``validate_model`` in the SAT branch of the v7 runner; wiring it in is deferred
so the frozen v7 encoder/run hashes stay untouched.
"""

from __future__ import annotations

import json
from typing import Any

LANE_ID = "firstnonhit-commonradius-recheck-v1"

# The faithful six-center boundary the model omits (encoder missing_relations).
MISSING_RELATIONS = ("classAt", "SelectedFourClass")

# Lean authority that closes the boundary from the carried antecedents.
SIX_CENTER_BRIDGE = (
    "lean/scratch/firstnonhit-common-sixcenter-math/SixCenterMath.lean:"
    "commonRadius_mutual_firstNonHit_sixCenterFaithful_doubleNonHit"
)

# Reduced-case arm for which the bridge is the applicable route.
DOUBLE_NONHIT_CASE = "double_nonhit"

# Readback keys the re-check consumes, mirrored from validate_model's return.
READBACK_KEYS = (
    "common_source_indices",
    "common_blocker_indices",
    "reduced_case_constructor",
    "reduced_case_details",
    "reduced_payload_validated",
    "all_30_payload_fields_validated",
    "faithful_six_center_boundary_encoded",
    "independent_g_surface",
)


class RecheckError(RuntimeError):
    """The readback drifts from the v7 common-only contract."""


def _require(readback: dict[str, Any], key: str) -> Any:
    if key not in readback:
        raise RecheckError(f"readback is missing required key: {key}")
    return readback[key]


def reconstruct_sixcenter_antecedents(
    readback: dict[str, Any],
) -> dict[str, Any]:
    """Reconstruct the six-center bridge antecedents the SAT model carries.

    Raises :class:`RecheckError` if any carried fact contradicts the common-radius
    reduced payload.  The common-radius equality (equal blocker centers) is the
    bridge's mutual-cross-membership core; in the exact-trace reduced case
    ``validate_model`` already enforced it, and we re-derive it here so the route
    is explicit rather than assumed.
    """
    for key in READBACK_KEYS:
        _require(readback, key)

    if readback.get("reduced_payload_validated") is not True:
        raise RecheckError("readback reduced payload was not validated")
    if readback.get("all_30_payload_fields_validated") is not True:
        raise RecheckError("readback did not validate all 30 payload fields")

    blockers = readback["common_blocker_indices"]
    sources = readback["common_source_indices"]
    if type(blockers) is not dict or type(sources) is not dict:
        raise RecheckError("common indices are malformed")

    one_b = blockers.get("one")
    two_b = blockers.get("two")
    # bool is a subclass of int; reject it first so a stray True is not a center.
    if isinstance(one_b, bool) or isinstance(two_b, bool):
        raise RecheckError("common blocker indices must be centers, not bools")
    if type(one_b) is not int or type(two_b) is not int:
        raise RecheckError("common blocker indices are not integral")
    if one_b != two_b:
        raise RecheckError("common blocker centers are not equal")

    reduced = readback["reduced_case_constructor"]
    details = readback["reduced_case_details"]
    if type(details) is not dict:
        raise RecheckError("reduced_case_details is not an object")

    first_nonhit = details.get("first_nonhit")
    second_nonhit = details.get("second_nonhit")
    five_center = details.get("five_center_deletion")

    if reduced == DOUBLE_NONHIT_CASE:
        if first_nonhit is None or second_nonhit is None:
            raise RecheckError("double_nonhit readback lacks non-hit arms")
        if five_center is None:
            raise RecheckError("double_nonhit readback lacks five-center deletion")
    elif reduced in {"equal_cross_row_centers", "one_sided_deletion"}:
        pass
    else:
        raise RecheckError(f"unrecognized reduced case: {reduced}")

    return {
        "common_radius_eq": True,
        "common_blocker_center": one_b,
        "common_sources": dict(sources),
        "mutual_cross_membership": bool(readback.get("independent_g_surface")),
        "reduced_case": reduced,
        "first_nonhit": first_nonhit,
        "second_nonhit": second_nonhit,
        "five_center_deletion_survival": five_center,
        "faithful_six_center_boundary_encoded": readback.get(
            "faithful_six_center_boundary_encoded"
        ),
    }


def recheck(readback: dict[str, Any]) -> dict[str, Any]:
    """Report reach / missing / route for the six-center faithful boundary.

    (a) Pure-assignment re-derivation of ``classAt``/``SelectedFourClass`` is
    infeasible: that relation is absent from the assignment vocabulary by
    construction, so no SAT witness carries it directly.
    (b) Adopted bridge/route: the carried antecedents are reconstructed and the
    precise missing antecedent is routed to the Lean authority.
    """
    antecedents = reconstruct_sixcenter_antecedents(readback)
    if antecedents["faithful_six_center_boundary_encoded"] is True:
        raise RecheckError(
            "model claims the six-center boundary is encoded; re-check is not needed"
        )
    applicable_route = antecedents["reduced_case"] == DOUBLE_NONHIT_CASE
    return {
        "lane": LANE_ID,
        "reached": False,
        "missing": list(MISSING_RELATIONS),
        "route": SIX_CENTER_BRIDGE if applicable_route else None,
        "route_applicable": applicable_route,
        "antecedents": antecedents,
        "feasibility": {
            "pure_assignment_rederivation": "infeasible",
            "route": "bridge_to_lean_six_center_authority",
        },
    }


def main(argv: list[str] | None = None) -> int:
    """CLI smoke: read a v7 readback JSON, print the re-check as canonical JSON."""
    import argparse

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("readback", help="path to a v7 SAT readback JSON")
    args = parser.parse_args(argv)
    with open(args.readback, "r", encoding="utf-8") as handle:
        readback = json.load(handle)
    print(
        json.dumps(
            recheck(readback),
            sort_keys=True,
            separators=(",", ":"),
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
