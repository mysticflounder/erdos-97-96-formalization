"""Uniform equality-shadow survivors for the actual-blocker orbit census.

This module constructs only equality classes of unordered pair distances.  Its
outputs are necessary combinatorial shadows: they are not Euclidean
realizations, convex configurations, ``CounterexampleData`` witnesses, or P97
counterexamples.

The formula applies exactly to periods ``p >= 11`` at ``N = p + 1``.  The
verified periods ``6 <= p <= 10`` remain separate finite witnesses in
``out-corrected-p2-p16-local-hardened/models.jsonl``; this module deliberately
does not pretend that the uniform formula covers them.
"""

from __future__ import annotations

from collections import defaultdict
from copy import deepcopy
from itertools import combinations
from typing import Any

SCHEMA_VERSION = 1
MIN_UNIFORM_PERIOD = 11
SHELL_DIFFERENCES = frozenset((1, 2, 3, 5))
QUERIES = frozenset(("some_hit", "all_omission"))
CAP_ROLES = frozenset(("surplus_apex", "surplus_cap", "opp_cap_1", "opp_cap_2"))
OPAQUE_WITNESS = {
    "source_erased": True,
    "robust_pair": True,
    "double_deletion_k4": True,
}
FINITE_WITNESS_NOTE = (
    "Periods 6..10 are separate finite equality-pattern witnesses in "
    "out-corrected-p2-p16-local-hardened/models.jsonl."
)
TRUST_BOUNDARY = {
    "status": "necessary_equality_pattern_only",
    "not_claimed": [
        "euclidean_realization",
        "convex_order_realization",
        "counterexample_data",
        "p97_counterexample",
    ],
}


class EqualityShadowError(ValueError):
    """Raised when a model violates the solver-free equality-shadow rules."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise EqualityShadowError(message)


def pair_key(left: int, right: int) -> str:
    """Return the lane's canonical key for an unordered point pair."""

    if left == right:
        raise EqualityShadowError("distance colors require distinct points")
    return f"{min(left, right)}:{max(left, right)}"


def color(model: dict[str, Any], left: int, right: int) -> int:
    """Read one unordered edge color."""

    return model["edge_colors"][pair_key(left, right)]


def equality_row(
    model: dict[str, Any], center: int, through: int
) -> frozenset[int]:
    """Return the represented circle row centered at ``center`` through ``through``."""

    radius_color = color(model, center, through)
    return frozenset(
        point
        for point in range(model["point_count"])
        if point != center and color(model, center, point) == radius_color
    )


def shell(model: dict[str, Any], source_index: int) -> frozenset[int]:
    """Return the exact-four shell for one orbit source."""

    sources = model["sources"]
    source = sources[source_index]
    blocker = sources[(source_index + 1) % model["period"]]
    return equality_row(model, blocker, source)


def apex_row(model: dict[str, Any], source_index: int) -> frozenset[int]:
    """Return the apex-radius class containing one orbit source."""

    return equality_row(model, model["apex"], model["sources"][source_index])


def _source_label(period: int, index: int) -> int:
    return 1 + (index % period)


def _apex_blocks(period: int, query: str) -> list[frozenset[int]]:
    """Build the apex-radius partition that realizes the requested query."""

    v = lambda index: _source_label(period, index)
    if query == "all_omission":
        if period % 2 == 0:
            half = period // 2
            return [frozenset((v(index), v(index + half))) for index in range(half)]

        half = (period - 1) // 2
        return [
            frozenset((v(0), v(half), v(2 * half))),
            *[
                frozenset((v(index), v(index + half)))
                for index in range(1, half)
            ],
        ]

    # The first pair makes source v_0 a HIT at blocker v_1.
    used_indices = {0, period - 1}
    blocks = [frozenset((v(0), v(period - 1)))]
    if period % 2 == 1:
        triple = {1, 4, 7}
        used_indices.update(triple)
        blocks.append(frozenset(v(index) for index in triple))
    remaining = [index for index in range(period) if index not in used_indices]
    blocks.extend(
        frozenset((v(remaining[offset]), v(remaining[offset + 1])))
        for offset in range(0, len(remaining), 2)
    )
    return blocks


def construct_uniform_survivor(period: int, query: str) -> dict[str, Any]:
    """Construct a uniform free-apex equality shadow at ``N = period + 1``.

    Shells are translates of ``D = {1, 2, 3, 5}``.  For ``period >= 11``,
    ``D`` and ``-D`` are disjoint, so two undirected shell edge classes never
    merge.  Every nonzero directed difference in ``D - D`` has multiplicity at
    most two, which gives the two-circle/third-common-point bound.
    """

    if not isinstance(period, int) or isinstance(period, bool):
        raise ValueError("period must be an integer")
    if period < MIN_UNIFORM_PERIOD:
        raise ValueError(
            f"uniform construction requires period >= {MIN_UNIFORM_PERIOD}; "
            f"{FINITE_WITNESS_NOTE}"
        )
    if query not in QUERIES:
        raise ValueError(f"query must be one of {sorted(QUERIES)}")

    point_count = period + 1
    sources = [_source_label(period, index) for index in range(period)]
    abstract_colors: dict[str, tuple[object, ...]] = {}

    for center_index in range(period):
        center = _source_label(period, center_index)
        shell_class = ("shell", center_index)
        for difference in SHELL_DIFFERENCES:
            support_point = _source_label(period, center_index - difference)
            key = pair_key(center, support_point)
            if key in abstract_colors:
                raise AssertionError(
                    "shell edge classes merged; D intersects its negative"
                )
            abstract_colors[key] = shell_class

    apex_blocks = _apex_blocks(period, query)
    covered_sources = set().union(*apex_blocks)
    if covered_sources != set(sources) or sum(map(len, apex_blocks)) != period:
        raise AssertionError("apex blocks do not partition the sources")
    for block_index, block in enumerate(apex_blocks):
        apex_class = ("apex", block_index)
        for source in block:
            key = pair_key(0, source)
            if key in abstract_colors:
                raise AssertionError("apex and shell edge classes overlap")
            abstract_colors[key] = apex_class

    class_ids: dict[tuple[object, ...], int] = {}
    edge_colors: dict[str, int] = {}
    for left, right in combinations(range(point_count), 2):
        key = pair_key(left, right)
        abstract = abstract_colors.get(key, ("singleton", left, right))
        class_ids.setdefault(abstract, len(class_ids))
        edge_colors[key] = class_ids[abstract]

    mate_by_source: dict[int, int] = {}
    for block in apex_blocks:
        ordered = sorted(block)
        for source in ordered:
            mate_by_source[source] = next(point for point in ordered if point != source)
    mates = [mate_by_source[source] for source in sources]

    model: dict[str, Any] = {
        "schema_version": SCHEMA_VERSION,
        "query": query,
        "point_count": point_count,
        "period": period,
        "apex": 0,
        "sources": sources,
        "mates": mates,
        "hits": [],
        "hit_opposite_side": [],
        "cap_roles": ["surplus_apex"] * period,
        "edge_colors": edge_colors,
        "opaque_witnesses": [dict(OPAQUE_WITNESS) for _ in range(period)],
        "assumptions": [
            "proved_orbit_shadow",
            "two_circle_rigidity",
            "free_independent_apex_radii",
            "uniform_difference_set_survivor",
        ],
        "trust_boundary": deepcopy(TRUST_BOUNDARY),
    }
    hits = [
        mate in shell(model, source_index)
        for source_index, mate in enumerate(mates)
    ]
    model["hits"] = hits
    model["hit_opposite_side"] = list(hits)
    return model


def all_omission_survivor(period: int) -> dict[str, Any]:
    """Construct the uniform all-OMISSION equality shadow."""

    return construct_uniform_survivor(period, "all_omission")


def some_hit_survivor(period: int) -> dict[str, Any]:
    """Construct the uniform some-HIT equality shadow."""

    return construct_uniform_survivor(period, "some_hit")


def extend_with_isolated_points(
    model: dict[str, Any], additional_points: int
) -> dict[str, Any]:
    """Extend an equality shadow by points with globally fresh incident colors.

    Every edge incident to a new point receives its own color, unused on every
    other edge.  Consequently all old equality rows remain unchanged and every
    new-center row is a singleton.
    """

    if not isinstance(additional_points, int) or isinstance(additional_points, bool):
        raise ValueError("additional_points must be an integer")
    if additional_points < 0:
        raise ValueError("additional_points must be nonnegative")

    extended = deepcopy(model)
    old_count = extended["point_count"]
    new_count = old_count + additional_points
    edge_colors = extended["edge_colors"]
    next_color = max(edge_colors.values(), default=-1) + 1
    for new_point in range(old_count, new_count):
        for other in range(new_point):
            edge_colors[pair_key(other, new_point)] = next_color
            next_color += 1
    extended["point_count"] = new_count
    return extended


def validate_equality_shadow(model: dict[str, Any]) -> None:
    """Independently validate every hard equality/incidence orbit rule.

    The two-circle rule is checked in ``O(N^3)``.  For each pair of centers,
    every other point is grouped by the pair of colors it sees from those
    centers.  Three points in one group are exactly three common points of two
    represented circles.
    """

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
    _require(isinstance(model, dict), "model must be a dictionary")
    _require(required <= model.keys(), f"missing fields: {sorted(required - model.keys())}")
    _require(model["schema_version"] == SCHEMA_VERSION, "schema version mismatch")

    point_count = model["point_count"]
    period = model["period"]
    _require(
        isinstance(point_count, int)
        and not isinstance(point_count, bool)
        and point_count >= 4,
        "bad point count",
    )
    _require(
        isinstance(period, int) and not isinstance(period, bool) and period >= 2,
        "period must be at least two",
    )
    _require(model["query"] in QUERIES, "unknown query")
    _require(isinstance(model["assumptions"], list), "assumptions must be a list")

    points = set(range(point_count))
    apex = model["apex"]
    sources = model["sources"]
    mates = model["mates"]
    hits = model["hits"]
    opposite = model["hit_opposite_side"]
    cap_roles = model["cap_roles"]
    opaque = model["opaque_witnesses"]
    for field_name, values in (
        ("sources", sources),
        ("mates", mates),
        ("hits", hits),
        ("hit_opposite_side", opposite),
        ("cap_roles", cap_roles),
        ("opaque_witnesses", opaque),
    ):
        _require(isinstance(values, list), f"{field_name} must be a list")

    _require(isinstance(apex, int) and apex in points, "apex outside carrier")
    _require(len(sources) == period, "source count differs from period")
    _require(all(isinstance(source, int) for source in sources), "bad source")
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
    _require(all(isinstance(mate, int) for mate in mates), "bad mate")
    _require(set(mates) <= points - {apex}, "mate equals apex or leaves carrier")
    _require(
        all(mate != source for mate, source in zip(mates, sources, strict=True)),
        "a robust mate equals its source",
    )
    _require(all(role in CAP_ROLES for role in cap_roles), "unknown cap role")

    expected_pairs = {
        pair_key(left, right)
        for left, right in combinations(range(point_count), 2)
    }
    edge_colors = model["edge_colors"]
    _require(isinstance(edge_colors, dict), "edge-color table must be a dictionary")
    _require(set(edge_colors) == expected_pairs, "distance-color table is incomplete")
    _require(
        all(isinstance(value, int) and value >= 0 for value in edge_colors.values()),
        "distance colors must be nonnegative integers",
    )

    actual_hits: list[bool] = []
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
        actual_hits.append(actual_hit)
        _require(hits[index] is actual_hit, f"HIT/OMISSION label {index} is wrong")
        _require(
            not actual_hit or opposite[index] is True,
            f"HIT {index} lacks opposite-side fact",
        )
        _require(
            not actual_hit or cap_roles[index] != "surplus_cap",
            f"HIT blocker {index} is in the strict surplus-cap interior",
        )
        _require(
            opaque[index] == OPAQUE_WITNESS,
            f"opaque robust-history witness {index} is missing",
        )

    for center_a, center_b in combinations(range(point_count), 2):
        joint_counts: defaultdict[tuple[int, int], int] = defaultdict(int)
        for point in range(point_count):
            if point in (center_a, center_b):
                continue
            joint_color = (
                color(model, center_a, point),
                color(model, center_b, point),
            )
            joint_counts[joint_color] += 1
            _require(
                joint_counts[joint_color] <= 2,
                f"three common points for centers {center_a},{center_b}",
            )

    if model["query"] == "some_hit":
        _require(any(actual_hits), "some-HIT query has no HIT")
    else:
        _require(not any(actual_hits), "all-OMISSION query contains a HIT")

    if "fixed_apex_radius" in model["assumptions"]:
        apex_colors = [color(model, apex, source) for source in sources]
        _require(len(set(apex_colors)) == 1, "fixed apex radius assumption violated")
