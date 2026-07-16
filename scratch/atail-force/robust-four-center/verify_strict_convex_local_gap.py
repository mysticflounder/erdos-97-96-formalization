"""Exact strict-convex local falsifier for the off-support pair-hit step.

The construction extends the exact 14-point robust cap-local model with five
three-point rational-rotation clusters.  Each cluster, together with its host
point, is an exact K4 row centered at one off-source support point of an
actual blocker shell.  The complete 29-point carrier is strictly convex, yet
none of those six support centers is equidistant from the robust source pair.

Scope is deliberately local: the extension certifies the same MEC/cap packet
and no-IsM44 condition, but it does not claim all-center global K4 or a total
CriticalShellSystem.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
BASE_PATH = HERE.parent / "cap-local-transport-model" / "check.py"
EXPECTED_BASE_FILE_SHA256 = (
    "7819cdc85946a931879fc1a530ac64cdb0c62af56b3a0ded2663c0bf033cae16"
)
EXPECTED_COORDINATE_SHA256 = (
    "b07182bc396ee9b6131961e2a80f5ce420706bf9bb6f292d90471d80300c83c4"
)


def load_base():
    digest = hashlib.sha256(BASE_PATH.read_bytes()).hexdigest()
    assert digest == EXPECTED_BASE_FILE_SHA256
    spec = importlib.util.spec_from_file_location(
        "atail_cap_local_transport_model", BASE_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


B = load_base()
G = B.B
Point = tuple[sp.Expr, sp.Expr]

CLUSTERS: dict[str, tuple[str, tuple[sp.Rational, ...]]] = {
    "F": ("O", (sp.Rational(-1, 4000), sp.Rational(-1, 2000), sp.Rational(-3, 4000))),
    "I": ("O", (sp.Rational(-1, 1000), sp.Rational(-1, 500), sp.Rational(-3, 1000))),
    "X": ("O", (sp.Rational(-1, 30), sp.Rational(-1, 15), sp.Rational(-1, 10))),
    "Y": ("C", (sp.Rational(1, 4000), sp.Rational(1, 2000), sp.Rational(3, 4000))),
    "Z": ("C", (sp.Rational(1, 250), sp.Rational(1, 125), sp.Rational(3, 250))),
}

HULL_ORDER = [
    "K",
    "X_k4_3", "X_k4_2", "X_k4_1",
    "I_k4_3", "I_k4_2", "I_k4_1",
    "F_k4_3", "F_k4_2", "F_k4_1",
    "O",
    "t1", "I", "F", "A", "X", "Y", "Z", "D", "J", "E", "C",
    "Y_k4_1", "Y_k4_2", "Y_k4_3",
    "Z_k4_1", "Z_k4_2", "Z_k4_3",
    "G",
]


def build_points() -> dict[str, Point]:
    points = B.build_points()
    for center, (host, parameters) in CLUSTERS.items():
        for index, parameter in enumerate(parameters, start=1):
            points[f"{center}_k4_{index}"] = B.rational_rotation(
                points[host], points[center], parameter
            )
    return points


def expression_string(value: sp.Expr) -> str:
    return sp.sstr(sp.factor(value), order="lex")


def coordinate_digest(points: dict[str, Point]) -> str:
    payload = {
        name: [expression_string(point[0]), expression_string(point[1])]
        for name, point in sorted(points.items())
    }
    return hashlib.sha256(
        json.dumps(payload, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def max_class_card(profile: dict[sp.Expr, set[str]]) -> int:
    return max(map(len, profile.values()), default=0)


def has_k4_after_deletion(
    profile: dict[sp.Expr, set[str]], deleted: set[str]
) -> bool:
    return any(len(support - deleted) >= 4 for support in profile.values())


def check() -> dict[str, object]:
    points = build_points()
    digest = coordinate_digest(points)
    assert digest == EXPECTED_COORDINATE_SHA256
    assert len(points) == len(HULL_ORDER) == 29
    assert set(points) == set(HULL_ORDER)

    # Exact supporting-line certificate for every hull edge.  This proves all
    # 29 points are vertices of one strict convex polygon, not merely that all
    # consecutive turns have one sign.
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

    # The original equilateral non-obtuse Moser triangle remains the unique
    # boundary triple of its circumscribed minimum disk.  Every added point is
    # checked strictly inside the disk with exact symbolic signs.
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
    for vertex, left, right in (
        ("C", "O", "A"),
        ("O", "C", "A"),
        ("A", "C", "O"),
    ):
        G.exact_nonnegative(
            G.dot(
                G.sub(points[left], points[vertex]),
                G.sub(points[right], points[vertex]),
            )
        )

    added = {name for name in points if "_k4_" in name}
    surplus_cap = {"O", "t1", "I", "F", "A"}
    opposite_cap_1 = {"A", "X", "Y", "Z", "D", "J", "E", "C"}
    opposite_cap_2 = {"C", "G", "K", "O"} | added
    caps = (surplus_cap, opposite_cap_1, opposite_cap_2)
    assert [len(cap) for cap in caps] == [5, 8, 19]
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
    assert len({first_apex, second_apex, q_blocker, w_blocker}) == 4

    first_class = G.named_class(profiles[first_apex], sp.Integer(1))
    assert first_class == {"A", "C", "D", "E", "J"}
    assert {q, w} <= first_class and len(first_class) == 5
    first_apex_off_surplus_marginal = first_class - surplus_cap
    assert first_apex_off_surplus_marginal == {"C", "D", "E", "J"}

    second_class = G.named_class(profiles[second_apex], sp.Integer(1))
    assert second_class == {"C", "G", "K", "O"}
    assert has_k4_after_deletion(profiles[second_apex], {q, w})
    second_apex_double_survivor_classes = [
        support - {q, w}
        for support in profiles[second_apex].values()
        if len(support - {q, w}) >= 4
    ]
    assert len(second_apex_double_survivor_classes) == 1
    assert second_apex_double_survivor_classes[0] == second_class
    max_second_apex_survivor_inter_marginal_card = max(
        len(support & first_apex_off_surplus_marginal)
        for support in second_apex_double_survivor_classes
    )
    assert max_second_apex_survivor_inter_marginal_card == 1

    q_shell = G.named_class(profiles[q_blocker], sp.Rational(2, 13))
    assert q_shell == {"A", "E", "F", "I"}
    assert q in q_shell and w not in q_shell
    assert not has_k4_after_deletion(profiles[q_blocker], {q})
    assert has_k4_after_deletion(profiles[q_blocker], {w})
    assert not second_class <= q_shell | first_apex_off_surplus_marginal

    w_radius = G.squared_distance(points[w_blocker], points[w])
    w_shell = G.named_class(profiles[w_blocker], w_radius)
    assert w_shell == {"D", "X", "Y", "Z"}
    assert w in w_shell and q not in w_shell
    assert not has_k4_after_deletion(profiles[w_blocker], {w})
    assert has_k4_after_deletion(profiles[w_blocker], {q})

    required_centers = sorted((q_shell - {q}) | (w_shell - {w}))
    assert required_centers == ["A", "F", "I", "X", "Y", "Z"]
    selected_rows: dict[str, list[str]] = {"A": sorted(second_class)}
    for center, (host, _parameters) in CLUSTERS.items():
        radius = G.squared_distance(points[center], points[host])
        support = G.named_class(profiles[center], radius)
        expected = {host, *(f"{center}_k4_{index}" for index in range(1, 4))}
        assert support == expected
        selected_rows[center] = sorted(support)

    for center in required_centers:
        assert max_class_card(profiles[center]) >= 4
        difference = sp.factor(
            G.squared_distance(points[center], points[q])
            - G.squared_distance(points[center], points[w])
        )
        assert sp.simplify(difference) != 0

    centers_without_k4 = sorted(
        center for center, profile in profiles.items() if max_class_card(profile) < 4
    )

    return {
        "status": "PASS",
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "epistemic_scope": (
            "exact within the encoded strict-convex/MEC/cap/no-IsM44/local-"
            "robust/K4-at-all-relevant-support-centers abstraction; not an "
            "all-center-global-K4, total-CriticalShellSystem, or K-A counterexample"
        ),
        "base_file_sha256": EXPECTED_BASE_FILE_SHA256,
        "coordinate_sha256": digest,
        "carrier_card": len(points),
        "strict_hull_order": HULL_ORDER,
        "minimum_float_edge_margin": float(minimum_edge_margin),
        "unique_mec_boundary": sorted(boundary),
        "mec_triangle_nonobtuse": True,
        "cap_cards": [len(cap) for cap in caps],
        "caps": {
            "surplus": sorted(surplus_cap),
            "opposite_1": sorted(opposite_cap_1),
            "opposite_2": sorted(opposite_cap_2),
        },
        "no_m44_all_mec_permutations": True,
        "pair": {"q": q, "w": w},
        "apices": {"first": first_apex, "second": second_apex},
        "first_apex_card_five_class": sorted(first_class),
        "first_apex_off_surplus_marginal": sorted(
            first_apex_off_surplus_marginal
        ),
        "second_apex_double_deletion_survival": True,
        "second_apex_double_survivor_classes": [
            sorted(support) for support in second_apex_double_survivor_classes
        ],
        "max_second_apex_survivor_inter_marginal_card": (
            max_second_apex_survivor_inter_marginal_card
        ),
        "direct_two_hit_target": False,
        "q_row_confinement_target": False,
        "blockers": {"q": q_blocker, "w": w_blocker},
        "blocker_shells": {"q": sorted(q_shell), "w": sorted(w_shell)},
        "reciprocal_cross_deletion_survival": True,
        "required_off_source_support_centers": required_centers,
        "selected_k4_rows_at_required_centers": selected_rows,
        "no_required_support_center_bisects_pair": True,
        "all_center_global_k4": not centers_without_k4,
        "centers_without_k4": centers_without_k4,
        "omitted_live_layer": [
            "all-center HasNEquidistantProperty 4",
            "total CriticalShellSystem",
        ],
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
