"""Exact squared-distance fixtures used as positive controls."""

from __future__ import annotations

from itertools import combinations

from domain import (
    FIRST_FIBER_PACKET_SCHEMA_VERSION,
    FIRST_FIBER_TRUST_BOUNDARY,
    SCHEMA_VERSION,
    pair_key,
)


# Coordinates, for reference:
#   apex=(0,sqrt(3)), s0=(-1,0), s1=(1,0),
#   left_mate=(-2,sqrt(3)), right_mate=(2,sqrt(3)), c=(0,-sqrt(3)).
# Every squared distance is an integer, recorded below without floating point.
_SQUARED_DISTANCES = {
    (0, 1): 4,
    (0, 2): 4,
    (0, 3): 4,
    (0, 4): 4,
    (0, 5): 12,
    (1, 2): 4,
    (1, 3): 4,
    (1, 4): 12,
    (1, 5): 4,
    (2, 3): 12,
    (2, 4): 4,
    (2, 5): 4,
    (3, 4): 16,
    (3, 5): 16,
    (4, 5): 16,
}


def _base_model(query: str, mates: list[int], hits: list[bool]) -> dict:
    assert set(_SQUARED_DISTANCES) == set(combinations(range(6), 2))
    return {
        "schema_version": SCHEMA_VERSION,
        "query": query,
        "point_count": 6,
        "period": 2,
        "apex": 0,
        "sources": [1, 2],
        "mates": mates,
        "hits": hits,
        "hit_opposite_side": [hit for hit in hits],
        "cap_roles": ["opp_cap_1" if hit else "surplus_cap" for hit in hits],
        "edge_colors": {
            pair_key(a, b): value for (a, b), value in _SQUARED_DISTANCES.items()
        },
        "opaque_witnesses": [
            {
                "source_erased": True,
                "robust_pair": True,
                "double_deletion_k4": True,
            }
            for _ in range(2)
        ],
        # This exact fixture happens to satisfy the stronger shared-apex-radius
        # sensitivity assumption, though the Lean cycle family does not prove it.
        "assumptions": [
            "proved_orbit_shadow",
            "two_circle_rigidity",
            "fixed_apex_radius",
        ],
    }


def all_omission_orbit() -> dict:
    """A six-point exact Euclidean all-OMISSION blocker two-cycle."""

    return _base_model("all_omission", mates=[3, 4], hits=[False, False])


def mixed_hit_orbit() -> dict:
    """The same geometry with one independently re-chosen mate producing a HIT."""

    return _base_model("some_hit", mates=[4, 4], hits=[True, False])


def valid_first_fiber_packet(
    *, role_overrides: dict[str, int] | None = None, second_case: str = "neither"
) -> dict:
    """A minimal equality-pattern witness for one permitted second-shell case."""

    if second_case not in {"neither", "q_only", "o_only"}:
        raise ValueError(f"unsupported valid second-shell case: {second_case}")
    fresh_count = 2 if second_case == "neither" else 1
    point_count = 8 + fresh_count
    roles = {"p1": 0, "p2": 1, "r1": 2, "r2": 3, "q": 4, "o": 5, "b": 6, "b_rho": 7}
    if role_overrides:
        roles.update(role_overrides)
    values = {
        pair_key(a, b): 10 + index
        for index, (a, b) in enumerate(combinations(range(point_count), 2))
    }
    first_radius = values[pair_key(roles["b"], roles["p1"])]
    for role in ("p2", "q", "o"):
        values[pair_key(roles["b"], roles[role])] = first_radius
    second_radius = values[pair_key(roles["b_rho"], roles["r1"])]
    values[pair_key(roles["b_rho"], roles["r2"])] = second_radius
    if second_case == "q_only":
        values[pair_key(roles["b_rho"], roles["q"])] = second_radius
    if second_case == "o_only":
        values[pair_key(roles["b_rho"], roles["o"])] = second_radius
    for fresh in range(8, point_count):
        values[pair_key(roles["b_rho"], fresh)] = second_radius
    return {
        "packet_schema_version": FIRST_FIBER_PACKET_SCHEMA_VERSION,
        "point_count": point_count,
        "roles": roles,
        "first_cap_membership": [
            point
            in {roles[role] for role in ("p1", "p2", "r1", "r2", "b", "b_rho")}
            for point in range(point_count)
        ],
        # This is a partial named table.  No saturation or upper bound follows.
        "beta": {
            "p1": roles["b"],
            "p2": roles["b"],
            "q": roles["b"],
            "r1": roles["b_rho"],
            "r2": roles["b_rho"],
        },
        "edge_colors": values,
        "trust_boundary": {
            "status": FIRST_FIBER_TRUST_BOUNDARY["status"],
            "encoded_scope": list(FIRST_FIBER_TRUST_BOUNDARY["encoded_scope"]),
            "not_claimed": list(FIRST_FIBER_TRUST_BOUNDARY["not_claimed"]),
        },
    }
