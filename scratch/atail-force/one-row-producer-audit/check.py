"""Exact audit of the sharpened q-shell one-row producer.

This checker does not search over a chosen ``SelectedFourClass``.  At every
eligible q-shell/surplus-interior center it enumerates the complete exact
squared-distance profile.  Thus a negative result excludes *every* possible
selected four-subset of every radius class at that center.

The two imported models have deliberately different live coverage:

* the 29-point model has the robust local packet and K4 at every eligible
  support center; and
* the 35-point extension additionally has a total CriticalShellSystem.

Neither model has all-center global K4, so neither is a K-A counterexample.
The point of the replay is to isolate the prescribed-membership gap exactly.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
from types import ModuleType
from typing import Any


HERE = Path(__file__).resolve().parent
LOCAL_MODEL_PATH = (
    HERE.parent / "robust-four-center" / "verify_strict_convex_local_gap.py"
)
TOTAL_CSS_MODEL_PATH = (
    HERE.parent
    / "global-critical-continuation"
    / "verify_total_css_completion.py"
)

EXPECTED_LOCAL_MODEL_SHA256 = (
    "98a069a5d763436c11f93dafb51bf7173a1909873abaeef7b74a96a451389698"
)
EXPECTED_TOTAL_CSS_MODEL_SHA256 = (
    "adbc3583b5bfefc0d2cf80af45b3a09a2a0d47ede836168d9bb61683083e1ff7"
)

Q = "E"
W = "D"
FIRST_APEX = "O"
Q_BLOCKER = "D"
MEC_BOUNDARY_ON_SURPLUS_CAP = {"O", "A"}


def load_pinned_module(
    name: str, path: Path, expected_sha256: str
) -> ModuleType:
    digest = hashlib.sha256(path.read_bytes()).hexdigest()
    assert digest == expected_sha256, (path, digest)
    spec = importlib.util.spec_from_file_location(name, path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def audit_exact_profiles(
    module: ModuleType,
    *,
    points: dict[str, Any],
    surplus_cap: set[str],
) -> dict[str, object]:
    # Only four centers are relevant to this target.  Building exact SymPy
    # profiles at every point in the 35-point regression makes replay needlessly
    # expensive and does not strengthen the audit.
    profiles = {
        center: module.G.radius_profile(points, center)
        for center in sorted({FIRST_APEX, Q_BLOCKER})
    }

    first_class = module.G.named_class(profiles[FIRST_APEX], 1)
    assert first_class == {"A", "C", "D", "E", "J"}
    marginal = first_class - surplus_cap
    assert marginal == {"C", "D", "E", "J"}
    distinct_marginal = marginal - {Q}
    assert distinct_marginal == {"C", "D", "J"}

    q_radius = module.G.squared_distance(points[Q_BLOCKER], points[Q])
    q_shell = module.G.named_class(profiles[Q_BLOCKER], q_radius)
    assert q_shell == {"A", "E", "F", "I"}

    strict_surplus = surplus_cap - MEC_BOUNDARY_ON_SURPLUS_CAP
    eligible = q_shell & strict_surplus
    assert eligible == {"F", "I"}

    for center in sorted(eligible):
        profiles[center] = module.G.radius_profile(points, center)

    radius_classes: dict[str, list[list[str]]] = {}
    target_classes: dict[str, list[list[str]]] = {}
    for center in sorted(eligible):
        k4_classes = [
            set(support) for support in profiles[center].values() if len(support) >= 4
        ]
        assert k4_classes, center
        radius_classes[center] = sorted(sorted(support) for support in k4_classes)
        target_classes[center] = sorted(
            sorted(support)
            for support in k4_classes
            if Q in support and bool(support & distinct_marginal)
        )

    # A SelectedFourClass at an eligible center can contain q and a distinct
    # marginal point iff one of the complete radius classes recorded above
    # contains both.  We check the complete classes, not a selected witness.
    assert all(not candidates for candidates in target_classes.values())

    return {
        "q": Q,
        "w": W,
        "first_apex": FIRST_APEX,
        "first_apex_card_five_class": sorted(first_class),
        "off_surplus_marginal": sorted(marginal),
        "distinct_marginal_candidates": sorted(distinct_marginal),
        "q_blocker": Q_BLOCKER,
        "q_blocker_shell": sorted(q_shell),
        "strict_surplus_interior": sorted(strict_surplus),
        "eligible_centers": sorted(eligible),
        "k4_radius_classes_at_eligible_centers": radius_classes,
        "radius_classes_realizing_prescribed_pair": target_classes,
        "all_eligible_centers_have_k4": True,
        "sharpened_one_row_target": False,
    }


def check() -> dict[str, object]:
    local = load_pinned_module(
        "atail_one_row_local_model",
        LOCAL_MODEL_PATH,
        EXPECTED_LOCAL_MODEL_SHA256,
    )
    local_regression = local.check()
    assert local_regression["status"] == "PASS"
    assert local_regression["all_center_global_k4"] is False
    assert "total CriticalShellSystem" in local_regression["omitted_live_layer"]
    local_audit = audit_exact_profiles(
        local,
        points=local.build_points(),
        surplus_cap={"O", "t1", "I", "F", "A"},
    )

    total_css = load_pinned_module(
        "atail_one_row_total_css_model",
        TOTAL_CSS_MODEL_PATH,
        EXPECTED_TOTAL_CSS_MODEL_SHA256,
    )
    total_css_regression = total_css.check()
    assert total_css_regression["status"] == "PASS"
    assert total_css_regression["total_critical_shell_system_exists"] is True
    assert total_css_regression["all_center_global_k4"] is False
    total_css_audit = audit_exact_profiles(
        total_css,
        points=total_css.build_points(),
        surplus_cap={
            "O",
            "t1",
            "t1_css_1",
            "t1_css_2",
            "t1_css_3",
            "I",
            "F",
            "A",
        },
    )

    return {
        "schema": "p97-atail-one-row-producer-audit-v1",
        "status": "PASS",
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "target": (
            "some z in q-blocker-shell intersect strict surplus interior has "
            "a SelectedFourClass containing q and a distinct first-apex "
            "off-surplus marginal point"
        ),
        "local_29_point_model": {
            "model_sha256": EXPECTED_LOCAL_MODEL_SHA256,
            "coordinate_sha256": local_regression["coordinate_sha256"],
            "exact_layers": [
                "strict convexity",
                "MEC and cap placement",
                "no IsM44",
                "robust local packet",
                "K4 at both eligible centers",
            ],
            "omitted_live_layers": local_regression["omitted_live_layer"],
            "audit": local_audit,
        },
        "total_css_35_point_model": {
            "model_sha256": EXPECTED_TOTAL_CSS_MODEL_SHA256,
            "coordinate_sha256": total_css_regression["coordinate_sha256"],
            "exact_layers": [
                "strict convexity",
                "MEC and cap placement",
                "no IsM44",
                "robust local packet",
                "total CriticalShellSystem",
                "K4 at both eligible centers",
            ],
            "omitted_live_layers": total_css_regression[
                "isolated_omitted_live_layer"
            ],
            "audit": total_css_audit,
        },
        "proved_boundary_within_these_models": (
            "q-shell membership, strict-surplus placement, a row at z, and even "
            "total critical-shell provenance do not force either prescribed "
            "membership in the z-centered row"
        ),
        "not_claimed": [
            "a CounterexampleData or K-A counterexample",
            "a Euclidean model satisfying all-center global K4",
            "a Lean-kernel proof that the live producer is impossible",
        ],
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="run the pinned exact regressions and print the compact PASS line",
    )
    args = parser.parse_args()
    result = check()
    if args.check:
        print(
            "PASS: both exact Euclidean regressions avoid every possible "
            "q-plus-distinct-marginal K4 class at eligible centers F and I"
        )
    else:
        print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
