#!/usr/bin/env python3
"""Mine generic equality-core cuts from FreshThird shadows.

Every selected four-row supplies equal-distance edges.  It supplies an
off-circle exclusion only when its center is the actual blocker of at least
one source, because only then does ``critical_support_exact`` identify the
chosen row with the full radius class.  Other cuts replay generic radius
partition, duplicate-center, perpendicular-bisector, and ordered convex-five
theorems from the checked equality-core bank.

This is bounded external theorem mining.  Even a replayed UNSAT result is not
a Lean proof and does not lift the n=17 packet to arbitrary cardinality.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from collections import deque
from pathlib import Path

import freshthird_exact_geometry_probe as geometry
import n17_freshthird_incidence_probe as base
import n19_freshthird_global_ingress_probe as ingress
import z3

HERE = Path(__file__).resolve().parent
DEFAULT_OUT = HERE / "artifacts-exact-off-circle-cegar-n17"


# Checked equality schemas already present in the production Lean theorem bank.
# Each triple is (center role, left endpoint role, right endpoint role).
KALMANSON_EQUALITY_SCHEMAS = (
    (
        "false_of_six_ccw_three_shell_equalities_013_412_523",
        6,
        ((0, 1, 3), (4, 1, 2), (5, 2, 3)),
    ),
    (
        "false_of_six_ccw_three_shell_equalities_012_325_415",
        6,
        ((0, 1, 2), (3, 2, 5), (4, 1, 5)),
    ),
    (
        "false_of_five_ccw_three_shell_equalities_012_124_314",
        5,
        ((0, 1, 2), (1, 2, 4), (3, 1, 4)),
    ),
    (
        "false_of_six_ccw_three_shell_equalities_013_235_415",
        6,
        ((0, 1, 3), (2, 3, 5), (4, 1, 5)),
    ),
    (
        "false_of_five_ccw_three_shell_equalities_043_431_241",
        5,
        ((0, 4, 3), (4, 3, 1), (2, 4, 1)),
    ),
    (
        "false_of_five_ccw_three_shell_equalities_302_021_410",
        5,
        ((3, 0, 2), (0, 2, 1), (4, 1, 0)),
    ),
    (
        "false_of_five_ccw_three_row_equalities",
        5,
        ((1, 0, 4), (2, 0, 1), (2, 0, 3)),
    ),
    (
        "false_of_five_ccw_second_three_row_equalities",
        5,
        ((3, 0, 2), (3, 2, 4), (4, 0, 1)),
    ),
    (
        "false_of_five_ccw_three_shell_equalities",
        5,
        ((2, 0, 3), (0, 3, 4), (1, 4, 0)),
    ),
)


# Literal selected-row patterns; unlike the equality schemas above, these
# cores retain the exact support memberships needed by the checked consumers.
SELECTED_ROW_TRIANGLE_SCHEMAS = (
    (
        "false_of_center_first_two_k2_three_selected_rows_triangle",
        ((0, (3, 5)), (1, (4, 5)), (2, (3, 4))),
    ),
    (
        "false_of_center_first_two_k2_three_selected_rows_triangle_reflected",
        ((0, (4, 5)), (1, (3, 4)), (2, (3, 5))),
    ),
    (
        "false_of_support_first_two_k2_three_selected_rows_triangle",
        ((3, (0, 2)), (4, (1, 2)), (5, (0, 1))),
    ),
    (
        "false_of_support_first_two_k2_three_selected_rows_triangle_reflected",
        ((3, (1, 2)), (4, (0, 1)), (5, (0, 2))),
    ),
)


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def selected_supports(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> dict[int, tuple[int, ...]]:
    return {
        center: tuple(
            point
            for point in base.ALL
            if geometry.is_true(model, probe.m[center, point])
        )
        for center in base.ALL
    }


def all_radius_rows(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> list[geometry.MetricRow]:
    """Materialize every full radius-equivalence class as an exact row."""
    return [
        geometry.MetricRow(center, support, True)
        for center in base.ALL
        for support in geometry.radius_classes(probe, model, center)
    ]


def blocker_guard(probe: ingress.FreshThirdN19Global, center: int) -> z3.BoolRef:
    return z3.Or(*(probe.b[source, center] for source in base.ALL))


def find_core_batch(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
    limit: int,
) -> list[dict[str, object]]:
    """Return distinct model-true exact-off-circle explanations."""
    supports = selected_supports(probe, model)
    adjacency: dict[
        tuple[int, int],
        list[tuple[tuple[int, int], tuple[int, int, int]]],
    ] = {}
    for row_center, support in supports.items():
        if len(support) != 4 or row_center in support:
            raise AssertionError((row_center, support))
        anchor = support[0]
        anchor_edge = edge(row_center, anchor)
        for point in support[1:]:
            other_edge = edge(row_center, point)
            explanation = (row_center, anchor, point)
            adjacency.setdefault(anchor_edge, []).append((other_edge, explanation))
            adjacency.setdefault(other_edge, []).append((anchor_edge, explanation))

    candidates: list[dict[str, object]] = []
    seen: set[tuple[int, int, int, tuple[tuple[int, int, int], ...]]] = set()
    for center, support in supports.items():
        if not geometry.is_true(model, blocker_guard(probe, center)):
            continue
        goal_edges = {edge(center, point): point for point in support}
        support_set = frozenset(support)
        for off_support in base.ALL:
            if off_support == center or off_support in support_set:
                continue
            start = edge(center, off_support)
            queue = deque([start])
            previous: dict[
                tuple[int, int],
                tuple[tuple[int, int], tuple[int, int, int]] | None,
            ] = {start: None}
            found = start if start in goal_edges else None
            while queue and found is None:
                current = queue.popleft()
                for neighbor, explanation in adjacency.get(current, ()):
                    if neighbor in previous:
                        continue
                    previous[neighbor] = (current, explanation)
                    if neighbor in goal_edges:
                        found = neighbor
                        break
                    queue.append(neighbor)
            if found is None:
                continue
            steps: list[dict[str, object]] = []
            cursor = found
            while previous[cursor] is not None:
                prior, (row_center, anchor, point) = previous[cursor]  # type: ignore[misc]
                steps.append({
                    "from_edge": list(prior),
                    "to_edge": list(cursor),
                    "row_center": row_center,
                    "row_anchor": anchor,
                    "row_point": point,
                })
                cursor = prior
            steps.reverse()
            candidate = {
                "kind": "blocker_exact_row",
                "target_center": center,
                "target_support_point": goal_edges[found],
                "off_support": off_support,
                "steps": steps,
            }
            signature = (
                center,
                goal_edges[found],
                off_support,
                tuple(
                    (
                        int(step["row_center"]),
                        int(step["row_anchor"]),
                        int(step["row_point"]),
                    )
                    for step in steps
                ),
            )
            if signature in seen:
                continue
            seen.add(signature)
            candidates.append(candidate)
    candidates.sort(
        key=lambda candidate: (
            len(candidate["steps"]),  # type: ignore[arg-type]
            int(candidate["target_center"]),
            int(candidate["target_support_point"]),
            int(candidate["off_support"]),
        )
    )
    return candidates[:limit]


def find_radius_partition_core(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> dict[str, object] | None:
    """Find equality closure contradicting one explicit radius disequality."""
    supports = selected_supports(probe, model)
    adjacency: dict[
        tuple[int, int],
        list[tuple[tuple[int, int], dict[str, object]]],
    ] = {}

    def connect(
        left: tuple[int, int],
        right: tuple[int, int],
        explanation: dict[str, object],
    ) -> None:
        adjacency.setdefault(left, []).append((right, explanation))
        adjacency.setdefault(right, []).append((left, explanation))

    for row_center, support in supports.items():
        anchor = support[0]
        for point in support[1:]:
            connect(
                edge(row_center, anchor),
                edge(row_center, point),
                {
                    "kind": "selected_row",
                    "row_center": row_center,
                    "row_anchor": anchor,
                    "row_point": point,
                },
            )
    for center in base.ALL:
        targets = [point for point in base.ALL if point != center]
        for left_index, left in enumerate(targets):
            for right in targets[left_index + 1:]:
                if geometry.is_true(model, probe.E(center, left, right)):
                    connect(
                        edge(center, left),
                        edge(center, right),
                        {
                            "kind": "radius_equality",
                            "center": center,
                            "left": left,
                            "right": right,
                        },
                    )

    best: dict[str, object] | None = None
    for center in base.ALL:
        targets = [point for point in base.ALL if point != center]
        for left_index, left in enumerate(targets):
            for right in targets[left_index + 1:]:
                if geometry.is_true(model, probe.E(center, left, right)):
                    continue
                start, goal = edge(center, left), edge(center, right)
                queue = deque([start])
                previous: dict[
                    tuple[int, int],
                    tuple[tuple[int, int], dict[str, object]] | None,
                ] = {start: None}
                while queue and goal not in previous:
                    current = queue.popleft()
                    for neighbor, explanation in adjacency.get(current, ()):
                        if neighbor in previous:
                            continue
                        previous[neighbor] = (current, explanation)
                        queue.append(neighbor)
                if goal not in previous:
                    continue
                steps: list[dict[str, object]] = []
                cursor = goal
                while previous[cursor] is not None:
                    prior, explanation = previous[cursor]  # type: ignore[misc]
                    steps.append({
                        **explanation,
                        "from_edge": list(prior),
                        "to_edge": list(cursor),
                    })
                    cursor = prior
                steps.reverse()
                candidate = {
                    "kind": "radius_disequality",
                    "target_center": center,
                    "target_left": left,
                    "target_right": right,
                    "steps": steps,
                }
                if best is None or len(steps) < len(best["steps"]):  # type: ignore[arg-type]
                    best = candidate
    return best


def find_duplicate_center_core(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> dict[str, object] | None:
    """Find two distinct centers equidistant from the same three labels."""
    supports = selected_supports(probe, model)
    adjacency: dict[
        tuple[int, int],
        list[tuple[tuple[int, int], dict[str, object]]],
    ] = {}

    def connect(
        left: tuple[int, int],
        right: tuple[int, int],
        explanation: dict[str, object],
    ) -> None:
        adjacency.setdefault(left, []).append((right, explanation))
        adjacency.setdefault(right, []).append((left, explanation))

    for row_center, support in supports.items():
        anchor = support[0]
        for point in support[1:]:
            connect(
                edge(row_center, anchor),
                edge(row_center, point),
                {
                    "kind": "selected_row",
                    "row_center": row_center,
                    "row_anchor": anchor,
                    "row_point": point,
                },
            )
    for center in base.ALL:
        targets = [point for point in base.ALL if point != center]
        for left, right in itertools.combinations(targets, 2):
            if geometry.is_true(model, probe.E(center, left, right)):
                connect(
                    edge(center, left),
                    edge(center, right),
                    {
                        "kind": "radius_equality",
                        "center": center,
                        "left": left,
                        "right": right,
                    },
                )

    def path(
        start: tuple[int, int], goal: tuple[int, int]
    ) -> list[dict[str, object]] | None:
        queue = deque([start])
        previous: dict[
            tuple[int, int],
            tuple[tuple[int, int], dict[str, object]] | None,
        ] = {start: None}
        while queue and goal not in previous:
            current = queue.popleft()
            for neighbor, explanation in adjacency.get(current, ()):
                if neighbor in previous:
                    continue
                previous[neighbor] = (current, explanation)
                queue.append(neighbor)
        if goal not in previous:
            return None
        result: list[dict[str, object]] = []
        cursor = goal
        while previous[cursor] is not None:
            prior, explanation = previous[cursor]  # type: ignore[misc]
            result.append({
                **explanation,
                "from_edge": list(prior),
                "to_edge": list(cursor),
            })
            cursor = prior
        result.reverse()
        return result

    best: dict[str, object] | None = None
    for p, q, r in itertools.combinations(base.ALL, 3):
        centers = []
        for center in base.ALL:
            if center in (p, q, r):
                continue
            pq_path = path(edge(center, p), edge(center, q))
            if pq_path is None:
                continue
            pr_path = path(edge(center, p), edge(center, r))
            if pr_path is not None:
                centers.append((center, pq_path, pr_path))
        for left, right in itertools.combinations(centers, 2):
            steps = left[1] + left[2] + right[1] + right[2]
            candidate = {
                "kind": "duplicate_center",
                "p": p,
                "q": q,
                "r": r,
                "a": left[0],
                "b": right[0],
                "paths": {
                    "ap_aq": left[1],
                    "ap_ar": left[2],
                    "bp_bq": right[1],
                    "bp_br": right[2],
                },
            }
            if best is None:
                best = candidate
            else:
                best_size = sum(
                    len(items) for items in best["paths"].values()  # type: ignore[union-attr]
                )
                if len(steps) < best_size:
                    best = candidate
    return best


def find_perp_bisector_core(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> dict[str, object] | None:
    """Find three labels equality-forced onto one perpendicular bisector."""
    supports = selected_supports(probe, model)
    adjacency: dict[
        tuple[int, int],
        list[tuple[tuple[int, int], dict[str, object]]],
    ] = {}

    def connect(
        left: tuple[int, int],
        right: tuple[int, int],
        explanation: dict[str, object],
    ) -> None:
        adjacency.setdefault(left, []).append((right, explanation))
        adjacency.setdefault(right, []).append((left, explanation))

    for row_center, support in supports.items():
        anchor = support[0]
        for point in support[1:]:
            connect(
                edge(row_center, anchor),
                edge(row_center, point),
                {
                    "kind": "selected_row",
                    "row_center": row_center,
                    "row_anchor": anchor,
                    "row_point": point,
                },
            )
    for center in base.ALL:
        targets = [point for point in base.ALL if point != center]
        for left, right in itertools.combinations(targets, 2):
            if geometry.is_true(model, probe.E(center, left, right)):
                connect(
                    edge(center, left),
                    edge(center, right),
                    {
                        "kind": "radius_equality",
                        "center": center,
                        "left": left,
                        "right": right,
                    },
                )

    def path(
        start: tuple[int, int], goal: tuple[int, int]
    ) -> list[dict[str, object]] | None:
        queue = deque([start])
        previous: dict[
            tuple[int, int],
            tuple[tuple[int, int], dict[str, object]] | None,
        ] = {start: None}
        while queue and goal not in previous:
            current = queue.popleft()
            for neighbor, explanation in adjacency.get(current, ()):
                if neighbor in previous:
                    continue
                previous[neighbor] = (current, explanation)
                queue.append(neighbor)
        if goal not in previous:
            return None
        result: list[dict[str, object]] = []
        cursor = goal
        while previous[cursor] is not None:
            prior, explanation = previous[cursor]  # type: ignore[misc]
            result.append({
                **explanation,
                "from_edge": list(prior),
                "to_edge": list(cursor),
            })
            cursor = prior
        result.reverse()
        return result

    best: dict[str, object] | None = None
    for a, b in itertools.combinations(base.ALL, 2):
        points = []
        for point in base.ALL:
            if point in (a, b):
                continue
            equality_path = path(edge(point, a), edge(point, b))
            if equality_path is not None:
                points.append((point, equality_path))
        for triple in itertools.combinations(points, 3):
            candidate = {
                "kind": "perp_bisector",
                "a": a,
                "b": b,
                "p": triple[0][0],
                "q": triple[1][0],
                "r": triple[2][0],
                "paths": {
                    "pa_pb": triple[0][1],
                    "qa_qb": triple[1][1],
                    "ra_rb": triple[2][1],
                },
            }
            if best is None:
                best = candidate
            else:
                candidate_size = sum(len(item[1]) for item in triple)
                best_size = sum(
                    len(items) for items in best["paths"].values()  # type: ignore[union-attr]
                )
                if candidate_size < best_size:
                    best = candidate
    return best


def find_two_center_bisector_parity_core(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> dict[str, object] | None:
    """Find two equidistant centers in a forbidden nonalternating order."""
    positions = {
        point: model.eval(
            probe.position[point], model_completion=True
        ).as_long()
        for point in base.ALL
    }
    for endpoint_left, endpoint_right in itertools.combinations(base.ALL, 2):
        centers = [
            center
            for center in base.ALL
            if center not in (endpoint_left, endpoint_right)
            and geometry.is_true(
                model, probe.E(center, endpoint_left, endpoint_right)
            )
        ]
        for center_left, center_right in itertools.combinations(centers, 2):
            labels = tuple(sorted(
                (endpoint_left, endpoint_right, center_left, center_right),
                key=positions.__getitem__,
            ))
            endpoint_set = {endpoint_left, endpoint_right}
            roles = tuple(
                "E" if label in endpoint_set else "C" for label in labels
            )
            alternating = all(
                roles[index] != roles[(index + 1) % 4] for index in range(4)
            )
            if alternating:
                continue
            return {
                "kind": "two_center_bisector_parity",
                "endpoint_left": endpoint_left,
                "endpoint_right": endpoint_right,
                "center_left": center_left,
                "center_right": center_right,
                "labels": labels,
                "roles": roles,
                "paths": {
                    "left_center": [{
                        "kind": "radius_equality",
                        "center": center_left,
                        "left": endpoint_left,
                        "right": endpoint_right,
                        "from_edge": list(edge(center_left, endpoint_left)),
                        "to_edge": list(edge(center_left, endpoint_right)),
                    }],
                    "right_center": [{
                        "kind": "radius_equality",
                        "center": center_right,
                        "left": endpoint_left,
                        "right": endpoint_right,
                        "from_edge": list(edge(center_right, endpoint_left)),
                        "to_edge": list(edge(center_right, endpoint_right)),
                    }],
                },
            }
    return None


def add_all_two_center_bisector_parity_cuts(
    probe: ingress.FreshThirdN19Global,
) -> int:
    """Compile the complete checked two-center parity family at fixed ``n``."""
    clauses: list[z3.BoolRef] = []
    for endpoint_left, endpoint_right in itertools.combinations(base.ALL, 2):
        possible_centers = [
            point
            for point in base.ALL
            if point not in (endpoint_left, endpoint_right)
        ]
        for center_left, center_right in itertools.combinations(
            possible_centers, 2
        ):
            nonalternating = z3.Or(
                cyclic_order_guard(
                    probe,
                    (endpoint_left, endpoint_right, center_left, center_right),
                ),
                cyclic_order_guard(
                    probe,
                    (endpoint_left, endpoint_right, center_right, center_left),
                ),
            )
            clauses.append(z3.Or(
                z3.Not(probe.E(
                    center_left, endpoint_left, endpoint_right
                )),
                z3.Not(probe.E(
                    center_right, endpoint_left, endpoint_right
                )),
                z3.Not(nonalternating),
            ))
    probe.add("two_center_bisector_parity_eager", *clauses)
    return len(clauses)


def cyclic_order_guard(
    probe: ingress.FreshThirdN19Global,
    labels: tuple[int, ...],
) -> z3.BoolRef:
    """The distinct labels occur in the given cyclic order, up to orientation."""
    if len(labels) < 2 or len(set(labels)) != len(labels):
        raise AssertionError(labels)

    def one_direction(oriented: tuple[int, ...]) -> z3.BoolRef:
        arity = len(oriented)
        positions = [probe.position[label] for label in oriented]
        return z3.Or(*(
            z3.And(*(
                positions[(start + offset) % arity]
                < positions[(start + offset + 1) % arity]
                for offset in range(arity - 1)
            ))
            for start in range(arity)
        ))

    return z3.Or(one_direction(labels), one_direction(tuple(reversed(labels))))


def cyclic_five_guard(
    probe: ingress.FreshThirdN19Global,
    a: int,
    x: int,
    b: int,
    c: int,
    y: int,
) -> z3.BoolRef:
    """The five labels occur in cyclic order ``a,x,b,c,y``.

    The five disjuncts account for the cut in the linearized cyclic order.
    Reversing the ambient orientation is harmless: ConvexFivePointCore uses
    the common-orientation wrapper.
    """
    return cyclic_order_guard(probe, (a, x, b, c, y))


def find_convex_five_point_core(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> dict[str, object] | None:
    """Find a source-sound ``ConvexFivePointCore`` explanation.

    Equalities come only from selected rows and explicit radius equalities.
    The order guard records precisely the cyclic-subsequence hypothesis used
    by the generic Lean consumer.
    """
    supports = selected_supports(probe, model)
    adjacency: dict[
        tuple[int, int],
        list[tuple[tuple[int, int], dict[str, object]]],
    ] = {}

    def connect(
        left: tuple[int, int],
        right: tuple[int, int],
        explanation: dict[str, object],
    ) -> None:
        adjacency.setdefault(left, []).append((right, explanation))
        adjacency.setdefault(right, []).append((left, explanation))

    for row_center, support in supports.items():
        anchor = support[0]
        for point in support[1:]:
            connect(
                edge(row_center, anchor),
                edge(row_center, point),
                {
                    "kind": "selected_row",
                    "row_center": row_center,
                    "row_anchor": anchor,
                    "row_point": point,
                },
            )
    for center in base.ALL:
        targets = [point for point in base.ALL if point != center]
        for left, right in itertools.combinations(targets, 2):
            if geometry.is_true(model, probe.E(center, left, right)):
                connect(
                    edge(center, left),
                    edge(center, right),
                    {
                        "kind": "radius_equality",
                        "center": center,
                        "left": left,
                        "right": right,
                    },
                )

    def path(
        start: tuple[int, int], goal: tuple[int, int]
    ) -> list[dict[str, object]] | None:
        queue = deque([start])
        previous: dict[
            tuple[int, int],
            tuple[tuple[int, int], dict[str, object]] | None,
        ] = {start: None}
        while queue and goal not in previous:
            current = queue.popleft()
            for neighbor, explanation in adjacency.get(current, ()):
                if neighbor in previous:
                    continue
                previous[neighbor] = (current, explanation)
                queue.append(neighbor)
        if goal not in previous:
            return None
        result: list[dict[str, object]] = []
        cursor = goal
        while previous[cursor] is not None:
            prior, explanation = previous[cursor]  # type: ignore[misc]
            result.append({
                **explanation,
                "from_edge": list(prior),
                "to_edge": list(cursor),
            })
            cursor = prior
        result.reverse()
        return result

    component: dict[tuple[int, int], int] = {}
    next_component = 0
    for node in adjacency:
        if node in component:
            continue
        queue = deque([node])
        component[node] = next_component
        while queue:
            current = queue.popleft()
            for neighbor, _ in adjacency.get(current, ()):
                if neighbor in component:
                    continue
                component[neighbor] = next_component
                queue.append(neighbor)
        next_component += 1

    def connected(left: tuple[int, int], right: tuple[int, int]) -> bool:
        return left == right or (
            left in component
            and right in component
            and component[left] == component[right]
        )

    order = tuple(sorted(
        base.ALL,
        key=lambda point: model.eval(
            probe.position[point], model_completion=True
        ).as_long(),
    ))
    for oriented_order in (order, tuple(reversed(order))):
        for start in range(base.N):
            rotated = oriented_order[start:] + oriented_order[:start]
            a = rotated[0]
            for x_pos, b_pos, c_pos, y_pos in itertools.combinations(
                range(1, base.N), 4
            ):
                x, b, c, y = (
                    rotated[x_pos],
                    rotated[b_pos],
                    rotated[c_pos],
                    rotated[y_pos],
                )
                requirements = {
                    "xa_xb": (edge(x, a), edge(x, b)),
                    "ya_yb": (edge(y, a), edge(y, b)),
                    "cb_cx": (edge(c, b), edge(c, x)),
                    "cb_cy": (edge(c, b), edge(c, y)),
                }
                if not all(connected(left, right) for left, right in requirements.values()):
                    continue
                paths = {
                    name: path(left, right)
                    for name, (left, right) in requirements.items()
                }
                if any(value is None for value in paths.values()):
                    raise AssertionError(paths)
                return {
                    "kind": "convex_five_point",
                    "a": a,
                    "x": x,
                    "b": b,
                    "c": c,
                    "y": y,
                    "paths": paths,
                }
    return None


def find_kalmanson_equality_core(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
    center_scope: str,
) -> dict[str, object] | None:
    """Find an instance of a checked five/six-role equality schema."""
    supports = selected_supports(probe, model)
    adjacency: dict[
        tuple[int, int],
        list[tuple[tuple[int, int], dict[str, object]]],
    ] = {}

    def connect(
        left: tuple[int, int],
        right: tuple[int, int],
        explanation: dict[str, object],
    ) -> None:
        adjacency.setdefault(left, []).append((right, explanation))
        adjacency.setdefault(right, []).append((left, explanation))

    for row_center, support in supports.items():
        anchor = support[0]
        for point in support[1:]:
            connect(
                edge(row_center, anchor),
                edge(row_center, point),
                {
                    "kind": "selected_row",
                    "row_center": row_center,
                    "row_anchor": anchor,
                    "row_point": point,
                },
            )
    for center in base.ALL:
        targets = [point for point in base.ALL if point != center]
        for left, right in itertools.combinations(targets, 2):
            if geometry.is_true(model, probe.E(center, left, right)):
                connect(
                    edge(center, left),
                    edge(center, right),
                    {
                        "kind": "radius_equality",
                        "center": center,
                        "left": left,
                        "right": right,
                    },
                )

    component: dict[tuple[int, int], int] = {}
    next_component = 0
    for node in adjacency:
        if node in component:
            continue
        queue = deque([node])
        component[node] = next_component
        while queue:
            current = queue.popleft()
            for neighbor, _ in adjacency.get(current, ()):
                if neighbor in component:
                    continue
                component[neighbor] = next_component
                queue.append(neighbor)
        next_component += 1

    def connected(left: tuple[int, int], right: tuple[int, int]) -> bool:
        return left == right or (
            left in component
            and right in component
            and component[left] == component[right]
        )

    def path(
        start: tuple[int, int], goal: tuple[int, int]
    ) -> list[dict[str, object]] | None:
        queue = deque([start])
        previous: dict[
            tuple[int, int],
            tuple[tuple[int, int], dict[str, object]] | None,
        ] = {start: None}
        while queue and goal not in previous:
            current = queue.popleft()
            for neighbor, explanation in adjacency.get(current, ()):
                if neighbor in previous:
                    continue
                previous[neighbor] = (current, explanation)
                queue.append(neighbor)
        if goal not in previous:
            return None
        result: list[dict[str, object]] = []
        cursor = goal
        while previous[cursor] is not None:
            prior, explanation = previous[cursor]  # type: ignore[misc]
            result.append({
                **explanation,
                "from_edge": list(prior),
                "to_edge": list(cursor),
            })
            cursor = prior
        result.reverse()
        return result

    order = tuple(sorted(
        base.ALL,
        key=lambda point: model.eval(
            probe.position[point], model_completion=True
        ).as_long(),
    ))
    schemas = sorted(KALMANSON_EQUALITY_SCHEMAS, key=lambda item: item[1])
    for theorem, arity, equality_roles in schemas:
        for oriented_order in (order, tuple(reversed(order))):
            for start in range(base.N):
                rotated = oriented_order[start:] + oriented_order[:start]
                for tail_positions in itertools.combinations(
                    range(1, base.N), arity - 1
                ):
                    labels = (rotated[0],) + tuple(
                        rotated[position] for position in tail_positions
                    )
                    if center_scope == "apex" and any(
                        labels[center] not in base.APEXES
                        for center, _, _ in equality_roles
                    ):
                        continue
                    requirements = {
                        f"eq{number}": (
                            edge(labels[center], labels[left]),
                            edge(labels[center], labels[right]),
                        )
                        for number, (center, left, right) in enumerate(
                            equality_roles
                        )
                    }
                    if not all(
                        connected(left, right)
                        for left, right in requirements.values()
                    ):
                        continue
                    paths = {
                        name: path(left, right)
                        for name, (left, right) in requirements.items()
                    }
                    if any(value is None for value in paths.values()):
                        raise AssertionError(paths)
                    return {
                        "kind": "kalmanson_equality",
                        "theorem": theorem,
                        "labels": labels,
                        "equality_roles": equality_roles,
                        "paths": paths,
                    }
    return None


def find_dominant_kalmanson_batch(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
    limit: int,
    center_scope: str,
) -> list[dict[str, object]]:
    """Collect many instances of the dominant five-role bank theorem.

    Radius equality is already an equivalence relation in the ingress model,
    so the three direct ``E`` literals are a complete proof witness.  Batching
    all hits in one model preserves the checked cut semantics while avoiding
    hundreds of nearly identical solver round trips.
    """
    theorem = "false_of_five_ccw_three_shell_equalities_012_124_314"
    equality_roles = ((0, 1, 2), (1, 2, 4), (3, 1, 4))
    order = tuple(sorted(
        base.ALL,
        key=lambda point: model.eval(
            probe.position[point], model_completion=True
        ).as_long(),
    ))
    results: list[dict[str, object]] = []
    seen: set[tuple[int, ...]] = set()
    for oriented_order in (order, tuple(reversed(order))):
        for start in range(base.N):
            rotated = oriented_order[start:] + oriented_order[:start]
            for tail_positions in itertools.combinations(
                range(1, base.N), 4
            ):
                labels = (rotated[0],) + tuple(
                    rotated[position] for position in tail_positions
                )
                if center_scope == "apex" and any(
                    labels[center] not in base.APEXES
                    for center, _, _ in equality_roles
                ):
                    continue
                if labels in seen:
                    continue
                seen.add(labels)
                requirements = tuple(
                    (
                        labels[center],
                        labels[left],
                        labels[right],
                    )
                    for center, left, right in equality_roles
                )
                if not all(
                    geometry.is_true(model, probe.E(center, left, right))
                    for center, left, right in requirements
                ):
                    continue
                results.append({
                    "kind": "kalmanson_equality",
                    "theorem": theorem,
                    "labels": labels,
                    "equality_roles": equality_roles,
                    "paths": {
                        f"eq{number}": [{
                            "kind": "radius_equality",
                            "center": center,
                            "left": left,
                            "right": right,
                            "from_edge": list(edge(center, left)),
                            "to_edge": list(edge(center, right)),
                        }]
                        for number, (center, left, right) in enumerate(
                            requirements
                        )
                    },
                })
                if len(results) >= limit:
                    return results
    return results


def find_selected_row_triangle_core(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
) -> dict[str, object] | None:
    """Find one literal six-role selected-row triangle consumer."""
    supports = {
        center: frozenset(support)
        for center, support in selected_supports(probe, model).items()
    }
    order = tuple(sorted(
        base.ALL,
        key=lambda point: model.eval(
            probe.position[point], model_completion=True
        ).as_long(),
    ))
    for theorem, row_roles in SELECTED_ROW_TRIANGLE_SCHEMAS:
        for oriented_order in (order, tuple(reversed(order))):
            for start in range(base.N):
                rotated = oriented_order[start:] + oriented_order[:start]
                for tail_positions in itertools.combinations(range(1, base.N), 5):
                    labels = (rotated[0],) + tuple(
                        rotated[position] for position in tail_positions
                    )
                    memberships = tuple(
                        (labels[center], labels[point])
                        for center, points in row_roles
                        for point in points
                    )
                    if all(
                        point in supports[center]
                        for center, point in memberships
                    ):
                        return {
                            "kind": "selected_row_triangle",
                            "theorem": theorem,
                            "labels": labels,
                            "memberships": memberships,
                        }
    return None


def cut_clause(
    probe: ingress.FreshThirdN19Global,
    core: dict[str, object],
) -> z3.BoolRef:
    if core["kind"] == "selected_row_triangle":
        positive = [
            probe.m[int(center), int(point)]
            for center, point in core["memberships"]  # type: ignore[union-attr]
        ]
        positive.append(cyclic_order_guard(
            probe,
            tuple(int(label) for label in core["labels"]),  # type: ignore[union-attr]
        ))
        unique = {str(term): term for term in positive}
        return z3.Or(*(z3.Not(unique[name]) for name in sorted(unique)))

    if core["kind"] in (
        "duplicate_center", "perp_bisector", "convex_five_point",
        "kalmanson_equality", "two_center_bisector_parity",
    ):
        positive: list[z3.BoolRef] = []
        for path in core["paths"].values():  # type: ignore[union-attr]
            for step in path:
                if step["kind"] == "selected_row":
                    row_center = int(step["row_center"])
                    positive.extend((
                        probe.m[row_center, int(step["row_anchor"])],
                        probe.m[row_center, int(step["row_point"])],
                    ))
                elif step["kind"] == "radius_equality":
                    positive.append(probe.E(
                        int(step["center"]),
                        int(step["left"]),
                        int(step["right"]),
                    ))
                else:
                    raise AssertionError(step["kind"])
        if core["kind"] == "convex_five_point":
            positive.append(cyclic_five_guard(
                probe,
                *(int(core[field]) for field in ("a", "x", "b", "c", "y")),
            ))
        elif core["kind"] == "kalmanson_equality" or core["kind"] == "two_center_bisector_parity":
            positive.append(cyclic_order_guard(
                probe,
                tuple(int(label) for label in core["labels"]),  # type: ignore[union-attr]
            ))
        unique = {str(term): term for term in positive}
        return z3.Or(*(z3.Not(unique[name]) for name in sorted(unique)))

    if core["kind"] == "radius_disequality":
        positive: list[z3.BoolRef] = []
        for step in core["steps"]:  # type: ignore[assignment]
            if step["kind"] == "selected_row":
                row_center = int(step["row_center"])
                positive.extend((
                    probe.m[row_center, int(step["row_anchor"])],
                    probe.m[row_center, int(step["row_point"])],
                ))
            elif step["kind"] == "radius_equality":
                positive.append(probe.E(
                    int(step["center"]), int(step["left"]), int(step["right"])
                ))
            else:
                raise AssertionError(step["kind"])
        unique = {str(term): term for term in positive}
        target = probe.E(
            int(core["target_center"]),
            int(core["target_left"]),
            int(core["target_right"]),
        )
        return z3.Or(*(z3.Not(unique[name]) for name in sorted(unique)), target)

    if core["kind"] != "blocker_exact_row":
        raise AssertionError(core["kind"])
    center = int(core["target_center"])
    support_point = int(core["target_support_point"])
    off_support = int(core["off_support"])
    positive = [blocker_guard(probe, center), probe.m[center, support_point]]
    for step in core["steps"]:  # type: ignore[assignment]
        row_center = int(step["row_center"])
        positive.extend((
            probe.m[row_center, int(step["row_anchor"])],
            probe.m[row_center, int(step["row_point"])],
        ))
    unique = {str(term): term for term in positive}
    return z3.Or(
        *(z3.Not(unique[name]) for name in sorted(unique)),
        probe.m[center, off_support],
    )


def named_core(core: dict[str, object]) -> dict[str, object]:
    def names(pair: object) -> list[str]:
        return [base.NAMES[int(point)] for point in pair]  # type: ignore[union-attr]

    def named_step(step: dict[str, object]) -> dict[str, object]:
        named = {
            "kind": step["kind"],
            "from_edge": names(step["from_edge"]),
            "to_edge": names(step["to_edge"]),
        }
        if step["kind"] == "selected_row":
            named.update({
                "row_center": base.NAMES[int(step["row_center"])],
                "row_anchor": base.NAMES[int(step["row_anchor"])],
                "row_point": base.NAMES[int(step["row_point"])],
            })
        else:
            named.update({
                "center": base.NAMES[int(step["center"])],
                "left": base.NAMES[int(step["left"])],
                "right": base.NAMES[int(step["right"])],
            })
        return named

    if core["kind"] in ("duplicate_center", "perp_bisector"):
        return {
            "kind": core["kind"],
            **{
                field: base.NAMES[int(core[field])]
                for field in ("p", "q", "r", "a", "b")
            },
            "paths": {
                label: [named_step(step) for step in path]
                for label, path in core["paths"].items()  # type: ignore[union-attr]
            },
        }

    if core["kind"] == "convex_five_point":
        return {
            "kind": core["kind"],
            **{
                field: base.NAMES[int(core[field])]
                for field in ("a", "x", "b", "c", "y")
            },
            "paths": {
                label: [named_step(step) for step in path]
                for label, path in core["paths"].items()  # type: ignore[union-attr]
            },
        }

    if core["kind"] == "kalmanson_equality":
        return {
            "kind": core["kind"],
            "theorem": core["theorem"],
            "labels": [
                base.NAMES[int(label)]
                for label in core["labels"]  # type: ignore[union-attr]
            ],
            "equality_roles": [
                list(roles)
                for roles in core["equality_roles"]  # type: ignore[union-attr]
            ],
            "paths": {
                label: [named_step(step) for step in path]
                for label, path in core["paths"].items()  # type: ignore[union-attr]
            },
        }

    if core["kind"] == "two_center_bisector_parity":
        return {
            "kind": core["kind"],
            **{
                field: base.NAMES[int(core[field])]
                for field in (
                    "endpoint_left", "endpoint_right",
                    "center_left", "center_right",
                )
            },
            "labels": [
                base.NAMES[int(label)]
                for label in core["labels"]  # type: ignore[union-attr]
            ],
            "roles": list(core["roles"]),  # type: ignore[arg-type]
            "paths": {
                label: [named_step(step) for step in path]
                for label, path in core["paths"].items()  # type: ignore[union-attr]
            },
        }

    if core["kind"] == "selected_row_triangle":
        return {
            "kind": core["kind"],
            "theorem": core["theorem"],
            "labels": [
                base.NAMES[int(label)]
                for label in core["labels"]  # type: ignore[union-attr]
            ],
            "memberships": [
                [base.NAMES[int(center)], base.NAMES[int(point)]]
                for center, point in core["memberships"]  # type: ignore[union-attr]
            ],
        }

    if core["kind"] == "radius_disequality":
        named_steps = []
        for step in core["steps"]:  # type: ignore[assignment]
            named_steps.append(named_step(step))
        return {
            "kind": core["kind"],
            "target_center": base.NAMES[int(core["target_center"])],
            "target_left": base.NAMES[int(core["target_left"])],
            "target_right": base.NAMES[int(core["target_right"])],
            "steps": named_steps,
        }

    return {
        "kind": core["kind"],
        "target_center": base.NAMES[int(core["target_center"])],
        "target_support_point": base.NAMES[int(core["target_support_point"])],
        "off_support": base.NAMES[int(core["off_support"])],
        "steps": [
            {
                "from_edge": names(step["from_edge"]),
                "to_edge": names(step["to_edge"]),
                "row_center": base.NAMES[int(step["row_center"])],
                "row_anchor": base.NAMES[int(step["row_anchor"])],
                "row_point": base.NAMES[int(step["row_point"])],
            }
            for step in core["steps"]  # type: ignore[assignment]
        ],
    }


def build_probe(
    arm: str,
    radius_mode: str,
    timeout_ms: int,
) -> ingress.FreshThirdN19Global:
    probe, _, _ = geometry.solve_ingress(arm, radius_mode, timeout_ms)
    return probe


def solve(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    probe = build_probe(args.arm, args.radius_mode, args.timeout_ms)
    eager_two_center_cut_count = 0
    if args.eager_two_center_bisector_parity:
        eager_two_center_cut_count = add_all_two_center_bisector_parity_cuts(
            probe
        )
    learned: list[dict[str, object]] = []
    checks: list[dict[str, object]] = []
    terminal = "CUT_LIMIT"
    survivor: dict[str, object] | None = None
    for iteration in range(args.max_cuts + 1):
        check_started = time.monotonic()
        status = probe.solver.check()
        checks.append({
            "iteration": iteration,
            "status": str(status).upper(),
            "seconds": round(time.monotonic() - check_started, 6),
        })
        if status == z3.unsat:
            terminal = "UNSAT"
            break
        if status == z3.unknown:
            terminal = "UNKNOWN"
            checks[-1]["reason"] = probe.solver.reason_unknown()
            break
        model = probe.solver.model()
        blocker_exact_batch = find_core_batch(
            probe, model, args.blocker_exact_batch_limit
        )
        core = None
        kalmanson_batch: list[dict[str, object]] = []
        if not blocker_exact_batch and args.include_two_center_bisector_parity:
            core = find_two_center_bisector_parity_core(probe, model)
        if core is None and args.include_kalmanson_equality:
            kalmanson_batch = find_dominant_kalmanson_batch(
                probe, model, args.kalmanson_batch_limit,
                args.kalmanson_center_scope,
            )
            if not kalmanson_batch:
                core = find_kalmanson_equality_core(
                    probe, model, args.kalmanson_center_scope
                )
        if (
            core is None and not blocker_exact_batch and not kalmanson_batch
            and args.include_selected_row_triangle
        ):
            core = find_selected_row_triangle_core(probe, model)
        if (
            core is None and not blocker_exact_batch and not kalmanson_batch
            and args.include_convex_five_point
        ):
            core = find_convex_five_point_core(probe, model)
        if (
            core is None and not blocker_exact_batch and not kalmanson_batch
            and args.include_duplicate_center
        ):
            core = find_duplicate_center_core(probe, model)
        if (
            core is None and not blocker_exact_batch and not kalmanson_batch
            and args.include_perp_bisector
        ):
            core = find_perp_bisector_core(probe, model)
        if (
            core is None and not blocker_exact_batch and not kalmanson_batch
            and args.include_radius_equalities
        ):
            core = find_radius_partition_core(probe, model)
        if core is None and not blocker_exact_batch and not kalmanson_batch:
            terminal = "CORE_FREE_SAT"
            supports = selected_supports(probe, model)
            order = tuple(
                sorted(
                    base.ALL,
                    key=lambda point: model.eval(
                        probe.position[point], model_completion=True
                    ).as_long(),
                )
            )
            survivor = {
                "cyclic_order": [base.NAMES[point] for point in order],
                "selected_rows": {
                    base.NAMES[center]: [base.NAMES[point] for point in support]
                    for center, support in supports.items()
                },
                "blocker_preimages": geometry.blocker_preimages(probe, model),
                "radius_classes": {
                    base.NAMES[center]: [
                        [base.NAMES[point] for point in support]
                        for support in geometry.radius_classes(probe, model, center)
                    ]
                    for center in base.ALL
                },
            }
            if args.metric_screen_survivor:
                metric_rows = geometry.selected_rows(probe, model) + all_radius_rows(
                    probe, model
                )
                survivor["metric_screen"] = geometry.probe_metric_rows(
                    base.N,
                    metric_rows,
                    order=order,
                    timeout_s=args.metric_timeout_s,
                )
            break
        remaining_cut_budget = args.max_cuts - len(learned)
        if remaining_cut_budget <= 0:
            break
        if blocker_exact_batch:
            blocker_exact_batch = blocker_exact_batch[:remaining_cut_budget]
            probe.add(
                "exact_off_circle_cegar_cut",
                *(cut_clause(probe, item) for item in blocker_exact_batch),
            )
            learned.extend(blocker_exact_batch)
            continue
        if kalmanson_batch:
            kalmanson_batch = kalmanson_batch[:remaining_cut_budget]
            probe.add(
                "exact_off_circle_cegar_cut",
                *(cut_clause(probe, item) for item in kalmanson_batch),
            )
            learned.extend(kalmanson_batch)
            continue
        probe.add("exact_off_circle_cegar_cut", cut_clause(probe, core))
        learned.append(core)

    replay = None
    if terminal == "UNSAT":
        fresh = build_probe(args.arm, args.radius_mode, args.timeout_ms)
        if args.eager_two_center_bisector_parity:
            add_all_two_center_bisector_parity_cuts(fresh)
        for core in learned:
            fresh.add("exact_off_circle_cegar_cut", cut_clause(fresh, core))
        replay_started = time.monotonic()
        replay_status = fresh.solver.check()
        replay = {
            "status": str(replay_status).upper(),
            "seconds": round(time.monotonic() - replay_started, 6),
            "reason": fresh.solver.reason_unknown() if replay_status == z3.unknown else "",
        }

    return {
        "schema": "p97-freshthird-equality-core-cegar-v4",
        "arm": args.arm,
        "radius_mode": args.radius_mode,
        "kalmanson_center_scope": args.kalmanson_center_scope,
        "n": base.N,
        "terminal_status": terminal,
        "learned_cut_count": len(learned),
        "eager_two_center_cut_count": eager_two_center_cut_count,
        "learned_cores": [named_core(core) for core in learned],
        "checks": checks,
        "fresh_replay": replay,
        "survivor": survivor,
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "trust_boundary": (
            "bounded external Z3 theorem mining; exact-row exclusions are "
            "actual-blocker guarded and all other cuts instantiate checked "
            "generic equality kernels; no Lean or general-cardinality claim"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--arm", choices=base.FreshThirdN17.RESIDUALS, default="firstNonHit"
    )
    parser.add_argument(
        "--radius-mode", choices=("aligned", "common"), default="aligned"
    )
    parser.add_argument("--timeout-ms", type=int, default=180_000)
    parser.add_argument("--max-cuts", type=int, default=100)
    parser.add_argument(
        "--include-radius-equalities",
        action=argparse.BooleanOptionalAction,
        default=True,
    )
    parser.add_argument(
        "--metric-screen-survivor",
        action=argparse.BooleanOptionalAction,
        default=True,
    )
    parser.add_argument(
        "--include-duplicate-center",
        action=argparse.BooleanOptionalAction,
        default=True,
    )
    parser.add_argument(
        "--include-perp-bisector",
        action=argparse.BooleanOptionalAction,
        default=True,
    )
    parser.add_argument(
        "--include-two-center-bisector-parity",
        action=argparse.BooleanOptionalAction,
        default=True,
    )
    parser.add_argument(
        "--eager-two-center-bisector-parity",
        action=argparse.BooleanOptionalAction,
        default=True,
    )
    parser.add_argument(
        "--include-convex-five-point",
        action=argparse.BooleanOptionalAction,
        default=True,
    )
    parser.add_argument(
        "--include-kalmanson-equality",
        action=argparse.BooleanOptionalAction,
        default=True,
    )
    parser.add_argument("--kalmanson-batch-limit", type=int, default=2_000)
    parser.add_argument(
        "--kalmanson-center-scope", choices=("all", "apex"), default="all"
    )
    parser.add_argument("--blocker-exact-batch-limit", type=int, default=1_000)
    parser.add_argument(
        "--include-selected-row-triangle",
        action=argparse.BooleanOptionalAction,
        default=True,
    )
    parser.add_argument("--metric-timeout-s", type=float, default=180.0)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    args = parser.parse_args()
    payload = solve(args)
    args.out.mkdir(parents=True, exist_ok=True)
    artifact = args.out / f"{time.strftime('%Y%m%dT%H%M%SZ')}.json"
    artifact.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "artifact": str(artifact),
        "terminal_status": payload["terminal_status"],
        "learned_cut_count": payload["learned_cut_count"],
        "last_checks": payload["checks"][-3:],
        "fresh_replay": payload["fresh_replay"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
