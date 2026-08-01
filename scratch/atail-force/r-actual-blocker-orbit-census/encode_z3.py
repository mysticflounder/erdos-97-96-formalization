"""Direct-Z3 discovery encoder for the actual-blocker orbit shadow."""

from __future__ import annotations

from itertools import combinations
from typing import Any

import z3

from domain import CAP_ROLES, SCHEMA_VERSION, pair_key


def _edge(
    variables: dict[tuple[int, int], z3.IntNumRef | z3.ArithRef], a: int, b: int
) -> z3.ArithRef:
    if a == b:
        raise ValueError("self-distance has no positive-radius color")
    return variables[min(a, b), max(a, b)]


def _same_as_fixed_edge(
    variables: dict[tuple[int, int], z3.ArithRef],
    center: int,
    point: z3.ArithRef,
    fixed_point: int,
    point_count: int,
) -> z3.BoolRef:
    return z3.Or(
        *(
            z3.And(point == candidate, _edge(variables, center, candidate) == _edge(
                variables, center, fixed_point
            ))
            for candidate in range(point_count)
            if candidate != center
        )
    )


def solve_orbit(
    point_count: int,
    period: int,
    query: str,
    *,
    fixed_apex_radius: bool = False,
    timeout_ms: int = 20_000,
    seed: int = 0,
) -> dict[str, Any]:
    """Find one bounded equality-pattern model, or report UNSAT/UNKNOWN.

    Sources are fixed to labels ``1..period`` and the apex to label ``0``.
    This is without loss for existence at the selected bound.
    """

    if query not in {"some_hit", "all_omission"}:
        raise ValueError(f"unknown query: {query}")
    # The apex and the `period` distinct sources are the only globally
    # distinguished points.  A mate may be another source.  Exact shell
    # cardinality four separately forces at least five carrier points.
    if period < 2 or point_count < max(5, period + 1):
        return {"status": "UNSAT", "reason": "structural_bound"}

    solver = z3.SolverFor("QF_LIA")
    solver.set(timeout=timeout_ms, random_seed=seed)
    apex = 0
    sources = list(range(1, period + 1))
    pair_count = point_count * (point_count - 1) // 2
    edge_colors = {
        (a, b): z3.Int(f"d_{a}_{b}")
        for a, b in combinations(range(point_count), 2)
    }
    for variable in edge_colors.values():
        solver.add(variable >= 0, variable < pair_count)

    mates = [z3.Int(f"mate_{index}") for index in range(period)]
    hits = [z3.Bool(f"hit_{index}") for index in range(period)]
    opposite = [z3.Bool(f"opposite_{index}") for index in range(period)]
    cap_roles = [z3.Int(f"cap_role_{index}") for index in range(period)]

    for index, source in enumerate(sources):
        blocker = sources[(index + 1) % period]
        mate = mates[index]
        solver.add(mate >= 0, mate < point_count, mate != apex, mate != source)
        solver.add(
            _same_as_fixed_edge(edge_colors, apex, mate, source, point_count)
        )

        shell_members = [
            _edge(edge_colors, blocker, point) == _edge(
                edge_colors, blocker, source
            )
            for point in range(point_count)
            if point != blocker
        ]
        solver.add(z3.Sum(*(z3.If(member, 1, 0) for member in shell_members)) == 4)
        mate_in_shell = _same_as_fixed_edge(
            edge_colors, blocker, mate, source, point_count
        )
        solver.add(hits[index] == mate_in_shell)
        solver.add(z3.Implies(hits[index], opposite[index]))
        solver.add(cap_roles[index] >= 0, cap_roles[index] < len(CAP_ROLES))
        solver.add(z3.Implies(hits[index], cap_roles[index] != 1))

    # The banked two-circle theorem, expressed entirely in equality colors.
    for center_a, center_b in combinations(range(point_count), 2):
        candidates = [p for p in range(point_count) if p not in (center_a, center_b)]
        for p, q, r in combinations(candidates, 3):
            solver.add(
                z3.Not(
                    z3.And(
                        _edge(edge_colors, center_a, p)
                        == _edge(edge_colors, center_a, q),
                        _edge(edge_colors, center_a, p)
                        == _edge(edge_colors, center_a, r),
                        _edge(edge_colors, center_b, p)
                        == _edge(edge_colors, center_b, q),
                        _edge(edge_colors, center_b, p)
                        == _edge(edge_colors, center_b, r),
                    )
                )
            )

    if query == "some_hit":
        solver.add(z3.Or(*hits))
    else:
        solver.add(z3.And(*(z3.Not(hit) for hit in hits)))

    assumptions: list[str] = ["proved_orbit_shadow", "two_circle_rigidity"]
    if fixed_apex_radius:
        for source in sources[1:]:
            solver.add(
                _edge(edge_colors, apex, source)
                == _edge(edge_colors, apex, sources[0])
            )
        assumptions.append("fixed_apex_radius")

    verdict = solver.check()
    if verdict == z3.unknown:
        return {
            "status": "UNKNOWN",
            "reason": solver.reason_unknown(),
            "point_count": point_count,
            "period": period,
            "query": query,
        }
    if verdict == z3.unsat:
        return {
            "status": "UNSAT",
            "point_count": point_count,
            "period": period,
            "query": query,
            "assumptions": assumptions,
        }

    z3_model = solver.model()
    decoded_mates = [z3_model.eval(mate).as_long() for mate in mates]
    decoded_hits = [z3.is_true(z3_model.eval(hit, model_completion=True)) for hit in hits]
    decoded_opposite = [
        z3.is_true(z3_model.eval(side, model_completion=True)) for side in opposite
    ]
    decoded_roles = [
        CAP_ROLES[z3_model.eval(role, model_completion=True).as_long()]
        for role in cap_roles
    ]
    decoded_colors = {
        pair_key(a, b): z3_model.eval(variable, model_completion=True).as_long()
        for (a, b), variable in edge_colors.items()
    }
    model = {
        "schema_version": SCHEMA_VERSION,
        "query": query,
        "point_count": point_count,
        "period": period,
        "apex": apex,
        "sources": sources,
        "mates": decoded_mates,
        "hits": decoded_hits,
        "hit_opposite_side": decoded_opposite,
        "cap_roles": decoded_roles,
        "edge_colors": decoded_colors,
        "opaque_witnesses": [
            {
                "source_erased": True,
                "robust_pair": True,
                "double_deletion_k4": True,
            }
            for _ in range(period)
        ],
        "assumptions": assumptions,
    }
    return {"status": "SAT", "model": model}


def first_fiber_nonbisector_probe(
    *,
    second_shell_case: str | None = None,
    force_both_second_shell: bool | None = None,
    fresh_outside_points: int = 2,
    timeout_ms: int = 5_000,
) -> str:
    """Probe all four projections of the audited first-fiber packet.

    ``force_both_second_shell`` is retained for the census manifest caller:
    true selects ``both`` and false leaves the permitted side unspecified.
    """

    cases = {"both", "neither", "q_only", "o_only", "unspecified"}
    if second_shell_case is None:
        if force_both_second_shell is None:
            raise ValueError("a second-shell case is required")
        second_shell_case = "both" if force_both_second_shell else "unspecified"
    elif force_both_second_shell is not None:
        raise ValueError("use one first-fiber probe selector")
    if second_shell_case not in cases:
        raise ValueError(f"unknown second-shell case: {second_shell_case}")
    if fresh_outside_points < 0:
        raise ValueError("fresh outside-point count must be nonnegative")

    solver = z3.SolverFor("QF_UFLIA")
    solver.set(timeout=timeout_ms, random_seed=0)
    point_count = 8 + fresh_outside_points
    role_names = ("p1", "p2", "r1", "r2", "q", "o", "b", "b_rho")
    roles = {name: z3.Int(f"ff_{name}") for name in role_names}
    for role in roles.values():
        solver.add(role >= 0, role < 8)

    allowed_coincidences = {
        frozenset(("b", "r1")),
        frozenset(("b", "r2")),
        frozenset(("b_rho", "p1")),
        frozenset(("b_rho", "p2")),
    }
    for left, right in combinations(role_names, 2):
        if frozenset((left, right)) not in allowed_coincidences:
            solver.add(roles[left] != roles[right])

    distance = z3.Function("ff_distance", z3.IntSort(), z3.IntSort(), z3.IntSort())
    for left in range(point_count):
        solver.add(distance(left, left) == -1)
        for right in range(left + 1, point_count):
            solver.add(
                distance(left, right) >= 0,
                distance(left, right) == distance(right, left),
            )

    in_first_cap = z3.Function("ff_in_first_cap", z3.IntSort(), z3.BoolSort())
    # Classify every represented point.  Labels 8+ are precisely the fresh
    # outside-cap points; no anonymous outside point is available at bound 0.
    for point in range(point_count):
        solver.add(
            z3.Not(in_first_cap(point))
            == z3.Or(
                point == roles["q"],
                point == roles["o"],
                point >= 8,
            )
        )

    beta = z3.Function("ff_beta", z3.IntSort(), z3.IntSort())
    for name in ("p1", "p2", "q"):
        solver.add(beta(roles[name]) == roles["b"])
    for name in ("r1", "r2"):
        solver.add(beta(roles[name]) == roles["b_rho"])
    solver.add(roles["b"] != roles["b_rho"])

    def in_shell(source: str, point: str) -> z3.BoolRef:
        center = roles["b"] if source == "p1" else roles["b_rho"]
        return z3.And(
            roles[point] != center,
            distance(center, roles[point]) == distance(center, roles[source]),
        )

    # K(p1) is exactly the four named points on the represented carrier.
    for point in range(point_count):
        solver.add(
            z3.And(
                point != roles["b"],
                distance(roles["b"], point)
                == distance(roles["b"], roles["p1"]),
            )
            == z3.Or(
                point == roles["p1"],
                point == roles["p2"],
                point == roles["q"],
                point == roles["o"],
            )
        )

    q_second = in_shell("r1", "q")
    o_second = in_shell("r1", "o")
    second_shell_literals = [
        z3.And(
            point != roles["b_rho"],
            distance(roles["b_rho"], point)
            == distance(roles["b_rho"], roles["r1"]),
        )
        for point in range(point_count)
    ]
    solver.add(z3.Sum([z3.If(hit, 1, 0) for hit in second_shell_literals]) == 4)
    for point, hit in enumerate(second_shell_literals):
        solver.add(
            z3.And(hit, in_first_cap(point))
            == z3.Or(point == roles["r1"], point == roles["r2"])
        )
    solver.add(z3.Not(z3.And(q_second, o_second)))
    forced = {
        "both": (q_second, o_second),
        "neither": (z3.Not(q_second), z3.Not(o_second)),
        "q_only": (q_second, z3.Not(o_second)),
        "o_only": (z3.Not(q_second), o_second),
        "unspecified": (),
    }[second_shell_case]
    solver.add(*forced)

    verdict = solver.check()
    if verdict == z3.sat:
        return "SAT"
    if verdict == z3.unsat:
        return "UNSAT"
    return "UNKNOWN"
