"""Exact 35-point regression with a total CriticalShellSystem shadow.

Starting from the pinned 29-point strict-convex local model, two rational-
rotation triples give the only uncovered sources, ``J`` and ``t1``, exact
deletion-critical four-shells.  The same centers block the six new sources.
The resulting exact Euclidean carrier therefore admits every field of a
``CriticalShellSystem`` while retaining the failed two-hit/confinement target.

All-center global K4 still fails.  Consequently this model separates the two
formerly bundled omissions: total criticality alone is not the missing force;
the regression boundary is all-center global K4.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
from pathlib import Path
from typing import Any

import sympy as sp


HERE = Path(__file__).resolve().parent
MODEL_PATH = HERE.parent / "robust-four-center" / "verify_strict_convex_local_gap.py"
EXPECTED_MODEL_SHA256 = (
    "98a069a5d763436c11f93dafb51bf7173a1909873abaeef7b74a96a451389698"
)
EXPECTED_COORDINATE_SHA256 = (
    "c5289a5ded63bca9c2c56b40211c2ec53009a83df66f9594815b9c5681db7dce"
)


def load_model() -> Any:
    digest = hashlib.sha256(MODEL_PATH.read_bytes()).hexdigest()
    assert digest == EXPECTED_MODEL_SHA256
    spec = importlib.util.spec_from_file_location("atail_29_model", MODEL_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


R = load_model()
G = R.G
Point = tuple[sp.Expr, sp.Expr]

CSS_CLUSTERS: dict[str, tuple[str, tuple[sp.Rational, ...]]] = {
    "J": (
        "F_k4_1",
        (sp.Rational(1, 20000), sp.Rational(3, 20000), sp.Rational(1, 4000)),
    ),
    "t1": (
        "C",
        (sp.Rational(1, 20000), sp.Rational(1, 10000), sp.Rational(3, 20000)),
    ),
}

HULL_ORDER = [
    "K",
    "X_k4_3", "X_k4_2", "X_k4_1",
    "I_k4_3", "I_k4_2", "I_k4_1",
    "F_k4_3", "F_k4_2", "F_k4_1",
    "O",
    "t1", "t1_css_1", "t1_css_2", "t1_css_3",
    "I", "F", "A", "X", "Y", "Z", "D",
    "J", "J_css_1", "J_css_2", "J_css_3",
    "E", "C",
    "Y_k4_1", "Y_k4_2", "Y_k4_3",
    "Z_k4_1", "Z_k4_2", "Z_k4_3",
    "G",
]


def build_points() -> dict[str, Point]:
    points = R.build_points()
    for source, (center, parameters) in CSS_CLUSTERS.items():
        for index, parameter in enumerate(parameters, start=1):
            points[f"{source}_css_{index}"] = R.B.rational_rotation(
                points[source], points[center], parameter
            )
    return points


def max_class_card(profile: dict[sp.Expr, set[str]]) -> int:
    return max(map(len, profile.values()), default=0)


def check() -> dict[str, object]:
    regression = R.check()
    assert regression["status"] == "PASS"

    points = build_points()
    digest = R.coordinate_digest(points)
    assert digest == EXPECTED_COORDINATE_SHA256, digest
    assert len(points) == len(HULL_ORDER) == 35
    assert set(points) == set(HULL_ORDER)

    minimum_edge_margin: sp.Expr | None = None
    for index, first in enumerate(HULL_ORDER):
        second = HULL_ORDER[(index + 1) % len(HULL_ORDER)]
        for third in HULL_ORDER:
            if third in {first, second}:
                continue
            margin = sp.factor(G.cross(points[first], points[second], points[third]))
            G.exact_positive(margin)
            if minimum_edge_margin is None or float(margin) < float(minimum_edge_margin):
                minimum_edge_margin = margin
    assert minimum_edge_margin is not None

    names = sorted(points)
    for index, first in enumerate(names):
        for second in names[index + 1 :]:
            G.exact_positive(G.squared_distance(points[first], points[second]))

    mec_center = G.point(sp.Rational(1, 2), sp.sqrt(3) / 6)
    mec_radius_squared = sp.Rational(1, 3)
    boundary = {"O", "A", "C"}
    for name, point in points.items():
        defect = sp.factor(
            mec_radius_squared - G.squared_distance(mec_center, point)
        )
        if name in boundary:
            assert G.exact_zero(defect)
        else:
            G.exact_positive(defect)

    old_added = {name for name in R.HULL_ORDER if "_k4_" in name}
    j_added = {f"J_css_{index}" for index in range(1, 4)}
    t1_added = {f"t1_css_{index}" for index in range(1, 4)}
    surplus_cap = {"O", "t1", "I", "F", "A"} | t1_added
    opposite_cap_1 = {"A", "X", "Y", "Z", "D", "J", "E", "C"} | j_added
    opposite_cap_2 = {"C", "G", "K", "O"} | old_added
    caps = (surplus_cap, opposite_cap_1, opposite_cap_2)
    assert [len(cap) for cap in caps] == [8, 11, 19]
    assert set.union(*caps) == set(points)
    assert sum(map(len, caps)) == len(points) + 3
    for name in points:
        multiplicity = sum(name in cap for cap in caps)
        assert multiplicity == (2 if name in boundary else 1)
    for apex, endpoint_1, endpoint_2, cap in (
        ("C", "O", "A", surplus_cap),
        ("O", "A", "C", opposite_cap_1),
        ("A", "C", "O", opposite_cap_2),
    ):
        apex_area = G.cross(points[apex], points[endpoint_1], points[endpoint_2])
        for name, point in points.items():
            product = sp.factor(
                G.cross(point, points[endpoint_1], points[endpoint_2])
                * apex_area
            )
            if name in cap:
                G.exact_nonpositive(product)
            else:
                G.exact_positive(product)

    profiles = {
        center: G.radius_profile(points, center) for center in sorted(points)
    }

    q, w = "E", "D"
    first_apex, second_apex = "O", "A"
    q_blocker, w_blocker = "D", "t1"

    first_class = G.named_class(profiles[first_apex], sp.Integer(1))
    assert first_class == {"A", "C", "D", "E", "J"}
    marginal = first_class - surplus_cap
    assert marginal == {"C", "D", "E", "J"}

    second_class = G.named_class(profiles[second_apex], sp.Integer(1))
    assert second_class == {"C", "G", "K", "O"}
    second_survivors = [
        support - {q, w}
        for support in profiles[second_apex].values()
        if len(support - {q, w}) >= 4
    ]
    assert second_survivors == [second_class]
    assert max(len(support & marginal) for support in second_survivors) == 1

    q_shell = G.named_class(profiles[q_blocker], sp.Rational(2, 13))
    assert q_shell == {"A", "E", "F", "I"}
    w_radius = G.squared_distance(points[w_blocker], points[w])
    w_shell = G.named_class(profiles[w_blocker], w_radius)
    assert w_shell == {"D", "X", "Y", "Z"}
    assert not R.has_k4_after_deletion(profiles[q_blocker], {q})
    assert R.has_k4_after_deletion(profiles[q_blocker], {w})
    assert not R.has_k4_after_deletion(profiles[w_blocker], {w})
    assert R.has_k4_after_deletion(profiles[w_blocker], {q})
    assert not second_class <= q_shell | marginal

    required_centers = sorted((q_shell - {q}) | (w_shell - {w}))
    assert required_centers == ["A", "F", "I", "X", "Y", "Z"]
    for center in required_centers:
        assert max_class_card(profiles[center]) >= 4
        pair_difference = sp.factor(
            G.squared_distance(points[center], points[q])
            - G.squared_distance(points[center], points[w])
        )
        assert sp.simplify(pair_difference) != 0

    candidates = {
        source: R.B.exact_blocker_candidates(profiles, source)
        for source in sorted(points)
    }
    uncovered = sorted(source for source, rows in candidates.items() if not rows)
    assert uncovered == []
    assignment = {source: rows[0] for source, rows in candidates.items()}
    for source, row in assignment.items():
        center = row["center"]
        support = set(row["support"])
        assert center != source
        assert source in support and len(support) == 4
        assert not R.has_k4_after_deletion(profiles[center], {source})

    centers_without_k4 = sorted(
        center for center, profile in profiles.items() if max_class_card(profile) < 4
    )
    assert centers_without_k4

    return {
        "status": "PASS",
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "epistemic_scope": (
            "exact strict-convex/MEC/cap/no-IsM44/local-robust/total-"
            "CriticalShellSystem regression; not all-center global K4 and not "
            "a CounterexampleData or K-A counterexample"
        ),
        "base_model_sha256": EXPECTED_MODEL_SHA256,
        "coordinate_sha256": digest,
        "carrier_card": len(points),
        "strict_hull_order": HULL_ORDER,
        "minimum_float_edge_margin": float(minimum_edge_margin),
        "unique_mec_boundary": sorted(boundary),
        "cap_cards": [len(cap) for cap in caps],
        "no_m44_all_mec_permutations": True,
        "pair": {"q": q, "w": w},
        "first_apex_off_surplus_marginal": sorted(marginal),
        "second_apex_double_survivor_classes": [sorted(second_class)],
        "max_second_apex_survivor_inter_marginal_card": 1,
        "direct_two_hit_target": False,
        "q_row_confinement_target": False,
        "required_off_source_support_centers": required_centers,
        "no_required_support_center_bisects_pair": True,
        "total_critical_shell_system_exists": True,
        "critical_assignment": assignment,
        "all_center_global_k4": False,
        "centers_without_k4": centers_without_k4,
        "isolated_omitted_live_layer": ["all-center HasNEquidistantProperty 4"],
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
