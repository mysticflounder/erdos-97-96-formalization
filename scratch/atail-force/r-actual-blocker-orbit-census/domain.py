"""Solver-free semantics for the bounded actual-blocker orbit census.

The model records only equality classes of pairwise distances.  It is a
necessary combinatorial shadow of the Lean geometry, not a Euclidean
realization and not a CounterexampleData witness.
"""

from __future__ import annotations

from itertools import combinations, permutations
from typing import Any

SCHEMA_VERSION = 1
CAP_ROLES = ("surplus_apex", "surplus_cap", "opp_cap_1", "opp_cap_2")
FIRST_FIBER_PACKET_SCHEMA_VERSION = 3
FIRST_FIBER_ROLES = ("p1", "p2", "r1", "r2", "q", "o", "b", "b_rho")
FIRST_FIBER_CAP_ROLES = frozenset(("p1", "p2", "r1", "r2", "b", "b_rho"))
# The source only rules out a blocker coinciding with a source in its own
# retained pair.  It does not rule out either cross-pair coincidence.
FIRST_FIBER_ALLOWED_COINCIDENCES = frozenset(
    (
        frozenset(("b", "r1")),
        frozenset(("b", "r2")),
        frozenset(("b_rho", "p1")),
        frozenset(("b_rho", "p2")),
    )
)
FIRST_FIBER_TRUST_BOUNDARY = {
    "status": "necessary_equality_pattern_only",
    "encoded_scope": [
        "two_retained_exact_four_shells",
        "fresh_outside_first_blocker_fiber",
        "distinct_retained_blockers",
        "total_first_cap_classification_on_represented_carrier",
    ],
    "not_claimed": [
        "euclidean_realization",
        "convex_order_realization",
        "counterexample_data",
        "blocker_fiber_saturation",
    ],
}


class ModelError(ValueError):
    """Raised when a decoded model does not satisfy the independent semantics."""


def pair_key(a: int, b: int) -> str:
    if a == b:
        raise ModelError("distance colors are only defined for distinct points")
    return f"{min(a, b)}:{max(a, b)}"


def color(model: dict[str, Any], a: int, b: int) -> int:
    return int(model["edge_colors"][pair_key(a, b)])


def shell(model: dict[str, Any], source_index: int) -> frozenset[int]:
    points = range(model["point_count"])
    sources = model["sources"]
    source = sources[source_index]
    blocker = sources[(source_index + 1) % model["period"]]
    radius_color = color(model, blocker, source)
    return frozenset(
        point
        for point in points
        if point != blocker and color(model, blocker, point) == radius_color
    )


def apex_row(model: dict[str, Any], source_index: int) -> frozenset[int]:
    points = range(model["point_count"])
    apex = model["apex"]
    source = model["sources"][source_index]
    radius_color = color(model, apex, source)
    return frozenset(
        point
        for point in points
        if point != apex and color(model, apex, point) == radius_color
    )


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise ModelError(message)


def validate_orbit_model(model: dict[str, Any]) -> None:
    """Validate a solver model without importing Z3 or the encoder."""

    required = {
        "schema_version",
        "query",
        "point_count",
        "period",
        "apex",
        "sources",
        "mates",
        "hits",
        "hit_opposite_side",
        "cap_roles",
        "edge_colors",
        "opaque_witnesses",
        "assumptions",
    }
    _require(required <= model.keys(), f"missing fields: {sorted(required - model.keys())}")
    _require(model["schema_version"] == SCHEMA_VERSION, "schema version mismatch")

    point_count = model["point_count"]
    period = model["period"]
    _require(isinstance(point_count, int) and point_count >= 4, "bad point count")
    _require(isinstance(period, int) and period >= 2, "period must be at least two")

    points = set(range(point_count))
    apex = model["apex"]
    sources = model["sources"]
    mates = model["mates"]
    hits = model["hits"]
    opposite = model["hit_opposite_side"]
    cap_roles = model["cap_roles"]
    opaque = model["opaque_witnesses"]

    _require(apex in points, "apex outside carrier")
    _require(len(sources) == period, "source count differs from period")
    _require(len(set(sources)) == period, "cycle sources are not distinct")
    _require(set(sources) <= points - {apex}, "source equals apex or leaves carrier")
    for field_name, values in (
        ("mates", mates),
        ("hits", hits),
        ("hit_opposite_side", opposite),
        ("cap_roles", cap_roles),
        ("opaque_witnesses", opaque),
    ):
        _require(len(values) == period, f"{field_name} count differs from period")
    _require(set(mates) <= points - {apex}, "mate equals apex or leaves carrier")
    _require(
        all(mate != source for mate, source in zip(mates, sources, strict=True)),
        "a robust mate equals its source",
    )
    _require(all(role in CAP_ROLES for role in cap_roles), "unknown cap role")

    expected_pairs = {
        pair_key(a, b) for a, b in combinations(range(point_count), 2)
    }
    edge_colors = model["edge_colors"]
    _require(set(edge_colors) == expected_pairs, "distance-color table is incomplete")
    _require(
        all(isinstance(value, int) and value >= 0 for value in edge_colors.values()),
        "distance colors must be nonnegative integers",
    )

    for index, (source, mate) in enumerate(zip(sources, mates, strict=True)):
        blocker = sources[(index + 1) % period]
        _require(blocker != source, f"cycle edge {index} is a loop")
        _require(
            color(model, apex, source) == color(model, apex, mate),
            f"mate {index} is not co-radial with its source at the apex",
        )
        support = shell(model, index)
        _require(len(support) == 4, f"shell {index} does not have cardinality four")
        _require(source in support, f"source {index} is absent from its shell")
        _require(blocker not in support, f"blocker {index} belongs to its own shell")
        actual_hit = mate in support
        _require(hits[index] is actual_hit, f"HIT/OMISSION label {index} is wrong")
        _require(not actual_hit or opposite[index] is True, "HIT lacks opposite-side fact")
        _require(
            not actual_hit or cap_roles[index] != "surplus_cap",
            "HIT blocker is in the strict surplus-cap interior",
        )

        witness = opaque[index] if index < len(opaque) else {}
        _require(
            witness == {
                "source_erased": True,
                "robust_pair": True,
                "double_deletion_k4": True,
            },
            f"opaque robust-history witness {index} is missing",
        )

    # Two distinct Euclidean circles cannot have three distinct common points.
    for center_a, center_b in combinations(range(point_count), 2):
        candidates = [p for p in range(point_count) if p not in (center_a, center_b)]
        for p, q, r in combinations(candidates, 3):
            same_a = color(model, center_a, p) == color(model, center_a, q) == color(
                model, center_a, r
            )
            same_b = color(model, center_b, p) == color(model, center_b, q) == color(
                model, center_b, r
            )
            _require(
                not (same_a and same_b),
                f"three common points for centers {center_a},{center_b}",
            )

    query = model["query"]
    _require(query in {"some_hit", "all_omission"}, "unknown query")
    if query == "some_hit":
        _require(any(hits), "some-HIT query has no HIT")
    else:
        _require(not any(hits), "all-OMISSION query contains a HIT")

    fixed_apex_radius = "fixed_apex_radius" in model["assumptions"]
    if fixed_apex_radius:
        apex_colors = [color(model, apex, source) for source in sources]
        _require(len(set(apex_colors)) == 1, "fixed apex radius assumption violated")


def first_fiber_shell(packet: dict[str, Any], source_role: str) -> frozenset[int]:
    """Return the represented selected shell through ``source_role``."""

    roles = packet["roles"]
    center = packet["beta"][source_role]
    source = roles[source_role]
    radius = color(packet, center, source)
    return frozenset(
        point
        for point in range(packet["point_count"])
        if point != center and color(packet, center, point) == radius
    )


def validate_first_fiber_packet(packet: dict[str, Any]) -> None:
    """Check the audited, standalone exact first-fiber packet.

    This remains separate from ``validate_orbit_model``.  Its hard facts need
    two retained collision packets, ``FreshOutsideFirstBlockerFiber``, and
    distinct retained blockers.  It is only an equality/incidence projection:
    in particular, the partial ``beta`` table gives lower bounds, never fiber
    saturation.
    """

    required = {
        "packet_schema_version",
        "point_count",
        "roles",
        "first_cap_membership",
        "beta",
        "edge_colors",
        "trust_boundary",
    }
    _require(required <= packet.keys(), "incomplete first-fiber packet")
    _require(
        packet["packet_schema_version"] == FIRST_FIBER_PACKET_SCHEMA_VERSION,
        "first-fiber packet schema version mismatch",
    )
    _require(
        packet["trust_boundary"] == FIRST_FIBER_TRUST_BOUNDARY,
        "first-fiber trust boundary is incomplete",
    )
    _require(
        isinstance(packet["point_count"], int) and packet["point_count"] >= 6,
        "bad first-fiber carrier",
    )
    points = set(range(packet["point_count"]))
    roles = packet["roles"]
    _require(set(roles) == set(FIRST_FIBER_ROLES), "first-fiber roles are incomplete")
    _require(set(roles.values()) <= points, "first-fiber role outside carrier")
    for left, right in combinations(FIRST_FIBER_ROLES, 2):
        if frozenset((left, right)) not in FIRST_FIBER_ALLOWED_COINCIDENCES:
            _require(
                roles[left] != roles[right],
                f"unproved first-fiber role coincidence: {left}={right}",
            )

    cap_membership = packet["first_cap_membership"]
    _require(
        len(cap_membership) == packet["point_count"]
        and all(isinstance(value, bool) for value in cap_membership),
        "first-cap membership does not classify the carrier",
    )
    first_cap = {point for point, is_cap in enumerate(cap_membership) if is_cap}
    for role in FIRST_FIBER_ROLES:
        _require(
            (roles[role] in first_cap) is (role in FIRST_FIBER_CAP_ROLES),
            f"wrong first-cap role for {role}",
        )

    beta = packet["beta"]
    required_beta = {
        "p1": roles["b"],
        "p2": roles["b"],
        "q": roles["b"],
        "r1": roles["b_rho"],
        "r2": roles["b_rho"],
    }
    _require(required_beta.items() <= beta.items(), "named beta equality is missing")
    _require(
        len({roles[role] for role in ("p1", "p2", "q")}) >= 3,
        "first blocker fiber lower bound three failed",
    )
    _require(
        len({roles[role] for role in ("r1", "r2")}) >= 2,
        "second blocker fiber lower bound two failed",
    )
    _require(roles["b"] != roles["b_rho"], "retained blockers coincide")

    expected_pairs = {
        pair_key(a, b) for a, b in combinations(range(packet["point_count"]), 2)
    }
    _require(set(packet["edge_colors"]) == expected_pairs, "packet colors incomplete")
    _require(
        all(
            isinstance(value, int) and value >= 0
            for value in packet["edge_colors"].values()
        ),
        "packet colors must be nonnegative integers",
    )

    first_shell = first_fiber_shell(packet, "p1")
    expected_first_shell = {roles[role] for role in ("p1", "p2", "q", "o")}
    _require(
        first_shell == expected_first_shell,
        "first retained shell is not exactly {p1,p2,q,o}",
    )
    _require(
        first_shell & first_cap == {roles["p1"], roles["p2"]},
        "first shell/cap intersection is not exactly {p1,p2}",
    )

    second_shell = first_fiber_shell(packet, "r1")
    _require(len(second_shell) == 4, "second retained shell does not have cardinality four")
    _require(
        second_shell & first_cap == {roles["r1"], roles["r2"]},
        "second shell/cap intersection is not exactly {r1,r2}",
    )
    _require(
        not ({roles["q"], roles["o"]} <= second_shell),
        "proved second-shell nonbisector rule violated",
    )
    _require(
        len(points - first_cap) >= 3,
        "first-fiber packet needs at least three outside-cap points",
    )


def _normalized_colors(model: dict[str, Any], old_to_new: dict[int, int]) -> tuple[int, ...]:
    values: list[int] = []
    renaming: dict[int, int] = {}
    for new_a, new_b in combinations(range(model["point_count"]), 2):
        old_a = next(old for old, new in old_to_new.items() if new == new_a)
        old_b = next(old for old, new in old_to_new.items() if new == new_b)
        old_color = color(model, old_a, old_b)
        if old_color not in renaming:
            renaming[old_color] = len(renaming)
        values.append(renaming[old_color])
    return tuple(values)


def canonical_key(model: dict[str, Any]) -> tuple[Any, ...]:
    """Canonicalize point names and cyclic choice of the base source.

    Only rotations are used.  Reflection reverses the directed actual-blocker
    map and is not an automatic symmetry of this orbit object.
    """

    validate_orbit_model(model)
    point_count = model["point_count"]
    period = model["period"]
    apex = model["apex"]
    sources = model["sources"]
    source_set = set(sources)
    residual = [p for p in range(point_count) if p != apex and p not in source_set]
    candidates: list[tuple[Any, ...]] = []

    for shift in range(period):
        rotated_sources = [sources[(shift + i) % period] for i in range(period)]
        rotated_indices = [(shift + i) % period for i in range(period)]
        for residual_order in permutations(residual):
            old_to_new = {apex: 0}
            old_to_new.update({old: i + 1 for i, old in enumerate(rotated_sources)})
            old_to_new.update(
                {old: period + 1 + i for i, old in enumerate(residual_order)}
            )
            candidates.append(
                (
                    point_count,
                    period,
                    model["query"],
                    tuple(old_to_new[model["mates"][i]] for i in rotated_indices),
                    tuple(model["hits"][i] for i in rotated_indices),
                    tuple(model["hit_opposite_side"][i] for i in rotated_indices),
                    tuple(model["cap_roles"][i] for i in rotated_indices),
                    _normalized_colors(model, old_to_new),
                    tuple(sorted(model["assumptions"])),
                )
            )
    return min(candidates)
