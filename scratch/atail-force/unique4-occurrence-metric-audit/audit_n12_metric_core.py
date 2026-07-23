#!/usr/bin/env python3
"""Replay the two n=12 occurrence models through the tracked metric checker.

The output separates two facts:

* each incidence table already violates the exact-four source localization
  field, because an outside center contains the exact strict pair; and
* the same four roles instantiate the existing shared-pair Kalmanson
  contradiction.

This is an exact audit of the stored finite tables.  It is not a source-to-CNF
reduction and does not prove the live exact-four branch.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
import time
from collections import Counter
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
FEASIBILITY = HERE.parent / "unique4-occurrence-feasibility"
FULL_LINEAR = (
    HERE.parent / "whole-carrier-ordinal-coverage" / "full_linear_replay.py"
)
CEGAR = (
    HERE.parent / "generic-biapex-kalmanson-search" / "cegar.py"
)
CONSUMER = (
    ROOT
    / "lean"
    / "Erdos9796Proof"
    / "P97"
    / "ATail"
    / "TwoCenterBisectorParity.lean"
)
RESIDUAL = (
    HERE.parent
    / "unique-arm-route-audit"
    / "OriginalUniqueResidualDispatch.lean"
)
MODELS = {
    "p4": FEASIBILITY / "n12_p4.json",
    "p5": FEASIBILITY / "n12_p5.json",
    "p4_bisector": FEASIBILITY / "n12_p4_bisector.json",
    "p5_bisector": FEASIBILITY / "n12_p5_bisector.json",
}
REPLAYS = {
    "p4": HERE / "n12_p4_full_linear.json",
    "p5": HERE / "n12_p5_full_linear.json",
    "p4_bisector": HERE / "n12_p4_bisector_full_linear.json",
    "p5_bisector": HERE / "n12_p5_bisector_full_linear.json",
}
REGISTRIES = (
    ROOT / "docs" / "general-n-certificate-bank-mining-2026-07-09.md",
    ROOT / "certificates" / "p97_rvol_general_n_mining.md",
    ROOT / "certificates" / "p97_rvol_general_n_mining.json",
    ROOT / "certificates" / "erdos97_legacy_general_n_mining.md",
    ROOT / "certificates" / "erdos97_legacy_general_n_mining.json",
    ROOT / "certificates" / "erdos_general_theorem_p97_mining.md",
    ROOT / "certificates" / "erdos_general_theorem_p97_mining.json",
)


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


TRACKED_REPLAY = load_module("unique4_n12_full_linear_replay", FULL_LINEAR)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def relative(path: Path) -> str:
    return str(path.relative_to(ROOT))


def normalized_metric_result(
    status: z3.CheckSatResult,
    centers: tuple[int, ...],
    names: tuple[str, ...],
    details: object,
) -> dict[str, object]:
    result: dict[str, object] = {
        "status": str(status).upper(),
        "dependency_centers": list(centers),
        "metric_core": list(names),
    }
    if isinstance(details, dict):
        result["payload"] = {
            key: [list(value) if isinstance(value, tuple) else value for value in values]
            if isinstance(values, (list, tuple))
            else values
            for key, values in details.items()
        }
    else:
        result["payload"] = str(details)
    return result


def assert_replay_matches(
    profile: str,
    rerun: dict[str, object],
    expected: dict[str, object],
) -> None:
    if rerun["status"] != expected["status"]:
        raise AssertionError((profile, "status", rerun, expected))
    if rerun["dependency_centers"] != expected["dependency_centers"]:
        raise AssertionError((profile, "dependency_centers", rerun, expected))
    if set(rerun["metric_core"]) != set(expected["metric_core"]):
        raise AssertionError((profile, "metric_core", rerun, expected))

    actual_payload = rerun["payload"]
    expected_payload = expected["payload"]
    for key in ("core_vertices", "required_memberships"):
        if actual_payload[key] != expected_payload[key]:
            raise AssertionError((profile, key, rerun, expected))
    if Counter(actual_payload["constraint_kinds"]) != Counter(
        expected_payload["constraint_kinds"]
    ):
        raise AssertionError((profile, "constraint_kinds", rerun, expected))


def check_semantic_core_minimality() -> dict[str, object]:
    """Check the compressed Kalmanson equality core and every deletion."""

    ab, ac, bd, cd = z3.Reals("ab ac bd cd")
    background = [variable >= 1 for variable in (ab, ac, bd, cd)]
    constraints = {
        "strict_kalmanson": ac + bd >= ab + cd + 1,
        "first_center_equidistant": ab == ac,
        "last_center_equidistant": bd == cd,
    }

    solver = z3.Solver()
    solver.add(*background, *constraints.values())
    if solver.check() != z3.unsat:
        raise AssertionError("compressed shared-middle-pair core is not UNSAT")

    deletion_witnesses: dict[str, dict[str, str]] = {}
    for omitted in constraints:
        candidate = z3.Solver()
        candidate.add(*background)
        candidate.add(
            *(formula for name, formula in constraints.items() if name != omitted)
        )
        if candidate.check() != z3.sat:
            raise AssertionError(f"core is not deletion-minimal at {omitted}")
        model = candidate.model()
        deletion_witnesses[omitted] = {
            str(variable): str(model.eval(variable, model_completion=True))
            for variable in (ab, ac, bd, cd)
        }

    return {
        "background": "ab, ac, bd, cd >= 1",
        "constraints": {
            "strict_kalmanson": "ac + bd >= ab + cd + 1",
            "first_center_equidistant": "ab = ac",
            "last_center_equidistant": "bd = cd",
        },
        "status": "UNSAT",
        "deletion_minimal": True,
        "deletion_witnesses": deletion_witnesses,
    }


def audit_profile(profile: str) -> dict[str, object]:
    model_path = MODELS[profile]
    replay_path = REPLAYS[profile]
    model = json.loads(model_path.read_text(encoding="utf-8"))
    replay = json.loads(replay_path.read_text(encoding="utf-8"))

    n = int(model["n"])
    first_apex = int(model["first_apex"])
    rows = {
        int(center): tuple(map(int, support))
        for center, support in model["rows"].items()
    }
    strict = set(map(int, model["first_opposite_strict"]))
    strict_pair = tuple(sorted(set(rows[first_apex]) & strict))
    if len(strict_pair) != 2:
        raise AssertionError((profile, strict_pair))

    outside_pair_centers = tuple(
        center
        for center, support in rows.items()
        if center != first_apex
        and set(strict_pair).issubset(support)
        and center not in strict
    )
    if outside_pair_centers != (n - 1,):
        raise AssertionError((profile, outside_pair_centers))

    deadline = time.monotonic() + 300
    status, centers, names, details = TRACKED_REPLAY.CEGAR.metric_check(
        rows, n, 300_000, deadline
    )
    rerun = normalized_metric_result(status, centers, names, details)
    expected = {
        "status": replay["status"],
        "dependency_centers": replay["dependency_centers"],
        "metric_core": replay["metric_core"],
        "payload": replay["payload"],
    }
    assert_replay_matches(profile, rerun, expected)
    if status != z3.unsat:
        raise AssertionError(f"{profile} unexpectedly ceased to be metric UNSAT")

    first_point, second_point = strict_pair
    last_center = n - 1
    if not (first_apex < first_point < second_point < last_center):
        raise AssertionError("shared pair is not between the two centers")
    if tuple(centers) != (first_apex, last_center):
        raise AssertionError((profile, centers))

    expected_memberships = {
        (first_apex, first_point),
        (first_apex, second_point),
        (last_center, first_point),
        (last_center, second_point),
    }
    required = {tuple(pair) for pair in details["required_memberships"]}
    if not expected_memberships.issubset(required):
        raise AssertionError((profile, required))

    return {
        "profile": profile,
        "input_model": {
            "path": relative(model_path),
            "sha256": sha256(model_path),
            "cnf_sha256": model["cnf_sha256"],
            "cnf_model_checked": model["cnf_model_checked"],
        },
        "tracked_full_linear_replay": {
            "path": relative(replay_path),
            "sha256": sha256(replay_path),
            **expected,
        },
        "source_localization_rejection": {
            "strict_pair": list(strict_pair),
            "outside_pair_center": last_center,
            "outside_pair_center_row": list(rows[last_center]),
            "outside_pair_center_not_in_strict_cap": last_center not in strict,
            "field": (
                "OriginalUniqueFourResidual.bisector_center_mem_interior"
            ),
            "status": "VIOLATED_BY_FINITE_TABLE",
        },
        "existing_consumer_transport": {
            "theorem": (
                "Problem97.false_of_two_centers_equidistant_pair_split"
            ),
            "role_map": {
                "j2_first_center": first_apex,
                "i1_first_point": first_point,
                "i2_second_point": second_point,
                "j1_last_center": last_center,
            },
            "strict_order": [
                first_apex,
                first_point,
                second_point,
                last_center,
            ],
            "row_memberships": [
                list(pair) for pair in sorted(expected_memberships)
            ],
            "match": "EXACT_WITHOUT_REFLECTION",
        },
    }


def audit_corrected_profile(profile: str) -> dict[str, object]:
    model_path = MODELS[profile]
    replay_path = REPLAYS[profile]
    model = json.loads(model_path.read_text(encoding="utf-8"))
    replay = json.loads(replay_path.read_text(encoding="utf-8"))

    n = int(model["n"])
    first_apex = int(model["first_apex"])
    rows = {
        int(center): tuple(map(int, support))
        for center, support in model["rows"].items()
    }
    strict = set(map(int, model["first_opposite_strict"]))
    strict_pair = tuple(sorted(set(rows[first_apex]) & strict))
    if len(strict_pair) != 2:
        raise AssertionError((profile, strict_pair))
    outside_pair_centers = tuple(
        center
        for center, support in rows.items()
        if center != first_apex
        and set(strict_pair).issubset(support)
        and center not in strict
    )
    if outside_pair_centers:
        raise AssertionError((profile, outside_pair_centers))
    if model.get("bisector_localization") is not True:
        raise AssertionError(f"{profile} lacks the localization overlay marker")

    deadline = time.monotonic() + 300
    status, centers, names, details = TRACKED_REPLAY.CEGAR.metric_check(
        rows, n, 300_000, deadline
    )
    rerun = normalized_metric_result(status, centers, names, details)
    expected = {
        "status": replay["status"],
        "dependency_centers": replay["dependency_centers"],
        "metric_core": replay["metric_core"],
        "payload": replay["payload"],
    }
    assert_replay_matches(profile, rerun, expected)
    if status != z3.unsat:
        raise AssertionError(f"{profile} unexpectedly ceased to be metric UNSAT")

    if profile == "p4_bisector":
        first_point, second_point = 6, 9
        first_center, last_center = 10, 11
        theorem = "Problem97.false_of_two_centers_equidistant_pair_after"
        role_map = {
            "i1_first_point": first_point,
            "i2_second_point": second_point,
            "j1_first_center_after_pair": first_center,
            "j2_second_center_after_pair": last_center,
        }
        local_kalmanson = "kal2_6_9_10_11"
        arrangement = "POINT_POINT_CENTER_CENTER"
    elif profile == "p5_bisector":
        first_center, last_center = 0, 10
        first_point, second_point = 1, 5
        theorem = "Problem97.false_of_two_centers_equidistant_pair_split"
        role_map = {
            "j2_first_center": first_center,
            "i1_first_point": first_point,
            "i2_second_point": second_point,
            "j1_last_center": last_center,
        }
        local_kalmanson = "kal1_0_1_5_10"
        arrangement = "CENTER_POINT_POINT_CENTER"
    else:
        raise AssertionError(profile)

    if not (min(first_center, first_point) >= 0):
        raise AssertionError("unreachable role sanity check")
    expected_memberships = {
        (first_center, first_point),
        (first_center, second_point),
        (last_center, first_point),
        (last_center, second_point),
    }
    if not all(point in rows[center] for center, point in expected_memberships):
        raise AssertionError((profile, expected_memberships))
    required = {tuple(pair) for pair in details["required_memberships"]}
    if not expected_memberships.issubset(required):
        raise AssertionError((profile, required))

    return {
        "profile": profile,
        "input_model": {
            "path": relative(model_path),
            "sha256": sha256(model_path),
            "cnf_sha256": model["cnf_sha256"],
            "cnf_model_checked": model["cnf_model_checked"],
            "bisector_localization": model["bisector_localization"],
        },
        "source_localization_check": {
            "exact_strict_pair": list(strict_pair),
            "outside_pair_centers": list(outside_pair_centers),
            "status": "PASSES_ENCODED_LOCALIZATION",
        },
        "tracked_full_linear_replay": {
            "path": relative(replay_path),
            "sha256": sha256(replay_path),
            **expected,
        },
        "globally_minimized_direct_core": {
            "arrangement": arrangement,
            "local_kalmanson_constraint": local_kalmanson,
            "row_memberships": [
                list(pair) for pair in sorted(expected_memberships)
            ],
            "compressed_constraints": [
                "one strict Kalmanson inequality",
                "first center equidistant from the shared pair",
                "second center equidistant from the shared pair",
            ],
            "deletion_minimality": (
                "verified by compressed_metric_core with positive distances"
            ),
        },
        "existing_consumer_transport": {
            "theorem": theorem,
            "role_map": role_map,
            "strict_order": sorted(
                (first_center, first_point, second_point, last_center)
            ),
            "match": "EXACT_WITHOUT_REFLECTION",
        },
    }


def produce() -> dict[str, object]:
    stale_profiles = [audit_profile("p4"), audit_profile("p5")]
    corrected_profiles = [
        audit_corrected_profile("p4_bisector"),
        audit_corrected_profile("p5_bisector"),
    ]
    return {
        "schema": "p97-unique4-n12-occurrence-metric-audit-v1",
        "epistemic_status": (
            "EXACT_STORED_MODEL_REPLAY_AND_KERNEL_CONSUMER_MATCH"
        ),
        "claim_scope": (
            "The two stored n=12 incidence models are rejected by an omitted "
            "source localization field and by an existing generic Kalmanson "
            "consumer; this is not a proof that every source residual has "
            "such a row."
        ),
        "stale_pre_localization_profiles": stale_profiles,
        "corrected_localization_profiles": corrected_profiles,
        "compressed_metric_core": check_semantic_core_minimality(),
        "existing_consumer": {
            "theorems": [
                "Problem97.false_of_two_centers_equidistant_pair_after",
                "Problem97.false_of_two_centers_equidistant_pair_split",
            ],
            "path": relative(CONSUMER),
            "sha256": sha256(CONSUMER),
            "axioms_checked_separately": [
                "propext",
                "Classical.choice",
                "Quot.sound",
            ],
        },
        "source_localization_field": {
            "declaration": (
                "OriginalUniqueFourResidual.bisector_center_mem_interior"
            ),
            "path": relative(RESIDUAL),
            "sha256": sha256(RESIDUAL),
        },
        "source_hashes": {
            relative(path): sha256(path)
            for path in (Path(__file__).resolve(), FULL_LINEAR, CEGAR, *REGISTRIES)
        },
        "theorem_bank_preflight": {
            "registries": [relative(path) for path in REGISTRIES],
            "nthdegree_queries": [
                (
                    "two selected rows centered at endpoints share both "
                    "middle boundary vertices Kalmanson contradiction"
                ),
                (
                    "false_of_two_centers_equidistant_pair_split / two "
                    "centers equidistant pair split boundary"
                ),
                (
                    "false_of_two_centers_equidistant_pair_after / two "
                    "centers equidistant pair after boundary"
                ),
                (
                    "two distinct centers equidistant from same pair cyclic "
                    "alternation convex"
                ),
            ],
            "result": "EXISTING_PRODUCTION_CONSUMER",
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--output", type=Path, default=HERE / "audit.json"
    )
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    result = produce()
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.check:
        if args.output.read_text(encoding="utf-8") != rendered:
            raise AssertionError("stored metric audit drifted")
        print("PASS: n=12 occurrence metric audit reproduces exactly")
        return 0
    args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
