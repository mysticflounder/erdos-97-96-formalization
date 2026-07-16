#!/usr/bin/env python3
"""Classify the 24 all-center-K4 deficits in the exact 35-point regression.

This is a read-only analysis of the pinned symbolic model.  It deliberately
does not rerun the expensive hull/MEC sign audit: the authoritative checker
``verify_total_css_completion.py`` owns those claims.  Here we pin that source
and coordinate payload, recompute exact radius profiles, and expose the cap and
deterministic CriticalShellSystem roles needed for continuation routing.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
from collections import defaultdict
from pathlib import Path
from typing import Any

import sympy as sp


HERE = Path(__file__).resolve().parent
MODEL_PATH = HERE.parent / "global-critical-continuation" / "verify_total_css_completion.py"
EXPECTED_MODEL_SHA256 = (
    "adbc3583b5bfefc0d2cf80af45b3a09a2a0d47ede836168d9bb61683083e1ff7"
)
EXPECTED_COORDINATE_SHA256 = (
    "c5289a5ded63bca9c2c56b40211c2ec53009a83df66f9594815b9c5681db7dce"
)


def load_model() -> Any:
    digest = hashlib.sha256(MODEL_PATH.read_bytes()).hexdigest()
    assert digest == EXPECTED_MODEL_SHA256, (
        "the total-CSS verifier changed; re-audit before accepting this table "
        f"(expected {EXPECTED_MODEL_SHA256}, got {digest})"
    )
    spec = importlib.util.spec_from_file_location("atail_total_css_35", MODEL_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


M = load_model()
R = M.R


def max_classes(profile: dict[sp.Expr, set[str]]) -> tuple[int, int]:
    maximum = max(map(len, profile.values()), default=0)
    return maximum, sum(len(support) == maximum for support in profile.values())


def cap_name(name: str, caps: dict[str, set[str]]) -> str:
    memberships = [label for label, cap in caps.items() if name in cap]
    return "+".join(memberships)


def named_roles(name: str, sets: dict[str, set[str]]) -> list[str]:
    roles: list[str] = []
    singletons = {
        "surplus_apex": "C",
        "first_opp_apex": "O",
        "second_opp_apex": "A",
        "q_source": "E",
        "w_source": "D",
        "q_blocker": "D",
        "w_blocker": "t1",
    }
    roles.extend(role for role, point in singletons.items() if name == point)
    roles.extend(label for label, points in sets.items() if name in points)
    return roles


def check() -> dict[str, object]:
    points = M.build_points()
    digest = R.coordinate_digest(points)
    assert digest == EXPECTED_COORDINATE_SHA256, digest
    profiles = {
        center: R.G.radius_profile(points, center) for center in sorted(points)
    }

    old_added = {name for name in R.HULL_ORDER if "_k4_" in name}
    j_added = {f"J_css_{index}" for index in range(1, 4)}
    t1_added = {f"t1_css_{index}" for index in range(1, 4)}
    caps = {
        "surplus": {"O", "t1", "I", "F", "A"} | t1_added,
        "opp1": {"A", "X", "Y", "Z", "D", "J", "E", "C"} | j_added,
        "opp2": {"C", "G", "K", "O"} | old_added,
    }
    marginal = {"C", "D", "E", "J"}
    second_apex_support = {"C", "G", "K", "O"}
    second_cap_strict_interior = caps["opp2"] - caps["surplus"] - caps["opp1"]
    forced_continuation_centers = second_apex_support & second_cap_strict_interior
    q_shell = {"A", "E", "F", "I"}
    w_shell = {"D", "X", "Y", "Z"}
    local_robust_k4_centers = (q_shell - {"E"}) | (w_shell - {"D"})
    role_sets = {
        "first_marginal": marginal,
        "second_apex_support": second_apex_support,
        "second_cap_strict_interior": second_cap_strict_interior,
        "forced_global_continuation": forced_continuation_centers,
        "q_critical_shell": q_shell,
        "w_critical_shell": w_shell,
        "local_robust_k4_center": local_robust_k4_centers,
        "J_css_extension": j_added,
        "t1_css_extension": t1_added,
    }

    candidates = {
        source: R.B.exact_blocker_candidates(profiles, source)
        for source in sorted(points)
    }
    assert all(candidates.values())
    assignment = {source: rows[0] for source, rows in candidates.items()}
    incoming: dict[str, list[str]] = defaultdict(list)
    potential_incoming: dict[str, list[str]] = defaultdict(list)
    for source, row in assignment.items():
        incoming[str(row["center"])].append(source)
    for source, rows in candidates.items():
        for center in {str(row["center"]) for row in rows}:
            potential_incoming[center].append(source)
    for sources in incoming.values():
        sources.sort()
    for sources in potential_incoming.values():
        sources.sort()

    deficient: list[dict[str, object]] = []
    for center in M.HULL_ORDER:
        maximum, largest_class_count = max_classes(profiles[center])
        if maximum >= 4:
            continue
        outgoing = assignment[center]
        pair_difference = sp.factor(
            R.G.squared_distance(points[center], points["E"])
            - R.G.squared_distance(points[center], points["D"])
        )
        deficient.append(
            {
                "center": center,
                "hull_index": M.HULL_ORDER.index(center),
                "cap": cap_name(center, caps),
                "roles": named_roles(center, role_sets),
                "max_radius_class_card": maximum,
                "largest_radius_class_count": largest_class_count,
                "bisects_qw": sp.simplify(pair_difference) == 0,
                "critical_candidate_count": len(candidates[center]),
                "critical_candidate_centers": sorted(
                    {str(row["center"]) for row in candidates[center]}
                ),
                "critical_map_out_center": outgoing["center"],
                "critical_map_out_support": outgoing["support"],
                "critical_map_in_sources": incoming.get(center, []),
                "potential_critical_map_in_sources": potential_incoming.get(
                    center, []
                ),
            }
        )

    assert len(deficient) == 24
    deficient_names = {str(row["center"]) for row in deficient}
    assert forced_continuation_centers == {"G", "K"}
    assert forced_continuation_centers <= deficient_names

    return {
        "status": "PASS",
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "scope": (
            "exact radius-profile and total-CSS role classification on the "
            "pinned 35-point regression; not a global-K4 completion and not "
            "a K-A-PAIR counterexample"
        ),
        "model_source_sha256": EXPECTED_MODEL_SHA256,
        "coordinate_sha256": digest,
        "deficient_center_count": len(deficient),
        "forced_continuation_centers": sorted(forced_continuation_centers),
        "forced_continuation_reason": (
            "the second-apex selected four-class is {C,G,K,O}; adjacent-cap "
            "one-hit bounds force at least two of its support points into the "
            "strict interior of opp2, namely G and K in this regression"
        ),
        "deficient_centers": deficient,
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
