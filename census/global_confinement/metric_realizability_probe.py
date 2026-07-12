# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact QF_NRA realizability probe for saved confinement assignments.

The incidence probes save selected same-radius rows without coordinates.  This
module asks whether each saved row system has even a relaxed Euclidean
realization: all ambient labels are distinct vertices of a strictly convex
polygon in the recorded cyclic order, every row is equidistant from its center,
and an exact row contains every point at that radius.

An UNSAT result is an exclusion of that saved assignment.  A SAT result is only
a realization of this row-level relaxation, not a Problem 97 counterexample.
Z3 results are trusted computations rather than kernel-checked certificates.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
import time
from collections import Counter
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
from datetime import datetime, timezone
from itertools import combinations, permutations
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence

from census.multi_center import multi_center_census as mc

from .shadow import hull_order


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
DEFAULT_INPUTS = (
    HERE / "results_n11_12.json",
    HERE / "critical_shell_results_all_placements_n11_12.json",
    HERE / "shell_audit_results_all_frames_n11_12.json",
)
SCHEMA = "p97-global-confinement-metric-realizability-v1"
CONTEXT_FIELDS = (
    "n",
    "profile",
    "type",
    "pin_source",
    "pin_source_index",
    "deleted",
    "deleted_index",
    "blocker",
    "dangerous",
    "aux",
    "audit_centers",
)


@dataclass(frozen=True)
class MetricRow:
    center: int
    support: tuple[int, ...]
    exact: bool

    def as_dict(self) -> dict[str, Any]:
        return {
            "center": self.center,
            "support": list(self.support),
            "exact": self.exact,
        }


def _edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("metric-row distance edge has equal endpoints")
    return (left, right) if left < right else (right, left)


class _EdgeClosure:
    def __init__(self, n: int) -> None:
        self.parent = {edge: edge for edge in combinations(range(n), 2)}

    def find(self, edge: tuple[int, int]) -> tuple[int, int]:
        root = self.parent[edge]
        if root != edge:
            self.parent[edge] = self.find(root)
        return self.parent[edge]

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


_ClosureCircleIndex = tuple[
    list[list[tuple[int, int]]],
    list[list[int]],
]


def _closure_circle_index(
    closure: _EdgeClosure, n: int
) -> _ClosureCircleIndex:
    """Index closure roots and same-center equality classes by bit mask."""

    labels = tuple(range(n))
    roots = [
        [
            (left, left)
            if left == right
            else closure.find(_edge(left, right))
            for right in labels
        ]
        for left in labels
    ]
    circle_masks = [
        [
            sum(
                1 << point
                for point in labels
                if roots[center][point] == roots[center][anchor]
            )
            for anchor in labels
        ]
        for center in labels
    ]
    return roots, circle_masks


def _row_equality_closure(n: int, rows: Sequence[MetricRow]) -> _EdgeClosure:
    closure = _EdgeClosure(n)
    for row in rows:
        reference = _edge(row.center, row.support[0])
        for point in row.support[1:]:
            closure.union(reference, _edge(row.center, point))
    return closure


def _duplicate_center_core(
    rows: Sequence[MetricRow], n: int | None = None
) -> dict[str, list[int]] | None:
    """Find the row-equality core of two centers through three shared points.

    Every row identifies the four squared-distance edges incident to its center.
    If transitive closure identifies three edges from each of two distinct
    centers, the ambient-label distinctness makes the system geometrically
    impossible by the duplicate-center kernel.  This is a deterministic
    prefilter, not a Z3 result.
    """

    if n is None:
        n = 1 + max(
            {row.center for row in rows}
            | {point for row in rows for point in row.support}
        )
    return _duplicate_center_core_from_closure(_row_equality_closure(n, rows), n)


def _duplicate_center_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, list[int]] | None:
    roots, _ = index if index is not None else _closure_circle_index(closure, n)
    labels = range(n)
    for triple in combinations(labels, 3):
        centers = []
        for center in labels:
            if center in triple:
                continue
            if (
                roots[center][triple[0]]
                == roots[center][triple[1]]
                == roots[center][triple[2]]
            ):
                centers.append(center)
        if len(centers) >= 2:
            return {"triple": list(triple), "centers": centers[:2]}
    return None


def _equal_k4_core(
    rows: Sequence[MetricRow], n: int | None = None
) -> dict[str, list[int]] | None:
    """Find four labels whose six pair distances equality closure identifies."""

    if n is None:
        n = 1 + max(
            {row.center for row in rows}
            | {point for row in rows for point in row.support}
        )
    return _equal_k4_core_from_closure(_row_equality_closure(n, rows), n)


def _equal_k4_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, list[int]] | None:
    roots, _ = index if index is not None else _closure_circle_index(closure, n)
    for points in combinations(range(n), 4):
        edges = tuple(combinations(points, 2))
        root = roots[edges[0][0]][edges[0][1]]
        if all(roots[left][right] == root for left, right in edges[1:]):
            return {"points": list(points)}
    return None


def _equilateral_bisector_collision_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, int] | None:
    """Find the generic five-label equilateral-bisector collision core."""

    roots, _ = index if index is not None else _closure_circle_index(closure, n)
    labels = range(n)
    for p, a, b in permutations(labels, 3):
        radius_root = roots[p][a]
        if roots[p][b] != radius_root:
            continue
        if roots[a][b] != radius_root:
            continue
        for x in labels:
            if x in (p, a, b):
                continue
            if roots[a][x] != radius_root:
                continue
            if roots[b][x] != radius_root:
                continue
            for c in labels:
                if c in (p, a, b, x):
                    continue
                if roots[p][c] != radius_root:
                    continue
                if roots[c][x] == roots[c][a]:
                    return {"p": p, "a": a, "b": b, "c": c, "x": x}
    return None


def _three_triad_collision_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, int] | None:
    """Find the generic five-label three-triad collision core."""

    roots, _ = index if index is not None else _closure_circle_index(closure, n)
    for a, b, c, d, e in permutations(range(n), 5):
        if not (
            roots[b][c] == roots[b][d] == roots[d][a]
        ):
            continue
        if not (
            roots[c][a] == roots[c][d] == roots[c][e]
        ):
            continue
        if roots[e][a] == roots[e][b] == roots[e][d]:
            return {"a": a, "b": b, "c": c, "d": d, "e": e}
    return None


def _surplus_source_collision_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, int] | None:
    """Find the generic seven-role surplus-source collision core.

    The Lean core requires only ``O != A``; every other pair of roles may
    coincide. Diagonal edges are isolated closure classes because selected
    rows never contain their own center.
    """

    labels = tuple(range(n))
    roots, circle_masks = (
        index if index is not None else _closure_circle_index(closure, n)
    )

    u_masks: dict[tuple[int, int], int] = {}
    v_masks: dict[tuple[int, int, int], int] = {}

    def u_mask(a: int, b: int) -> int:
        key = (a, b)
        if key not in u_masks:
            u_masks[key] = sum(
                1 << u
                for u in labels
                if roots[u][a] == roots[u][b]
                and roots[b][u] == roots[b][a]
            )
        return u_masks[key]

    def v_mask(c: int, b: int, o: int) -> int:
        key = (c, b, o)
        if key not in v_masks:
            v_masks[key] = sum(
                1 << v
                for v in labels
                if roots[c][v] == roots[c][o]
                and roots[v][b] == roots[v][o]
            )
        return v_masks[key]

    def first_label(mask: int) -> int:
        return (mask & -mask).bit_length() - 1

    for o in labels:
        circle_groups: dict[tuple[int, int], list[int]] = {}
        for point in labels:
            if point != o:
                circle_groups.setdefault(roots[o][point], []).append(point)
        for circle in circle_groups.values():
            for a in circle:
                for b in circle:
                    candidates_u = u_mask(a, b)
                    if not candidates_u:
                        continue
                    b_root = roots[b][a]
                    for c in circle:
                        if roots[c][a] != roots[c][o]:
                            continue
                        if roots[b][c] != b_root:
                            continue
                        candidates_v = v_mask(c, b, o)
                        if not candidates_v:
                            continue
                        for w in labels:
                            w_circle = circle_masks[w][o]
                            if not w_circle & (1 << c):
                                continue
                            candidates_uw = candidates_u & w_circle
                            candidates_vw = candidates_v & w_circle
                            if candidates_uw and candidates_vw:
                                return {
                                    "o": o,
                                    "a": a,
                                    "b": b,
                                    "c": c,
                                    "u": first_label(candidates_uw),
                                    "v": first_label(candidates_vw),
                                    "w": w,
                                }
    return None


def _six_row_anchor_collision_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, int] | None:
    """Find the generic six-role anchor-collision equality core.

    The Lean core requires only ``O != A``. Every other role may alias, and
    diagonal edges remain isolated equality classes.
    """

    labels = tuple(range(n))
    roots, circle_masks = (
        index if index is not None else _closure_circle_index(closure, n)
    )

    def labels_in(mask: int) -> Iterable[int]:
        while mask:
            bit = mask & -mask
            yield bit.bit_length() - 1
            mask ^= bit

    for o in labels:
        for a in labels:
            if o == a:
                continue
            a_circle = circle_masks[a][o]
            for b in labels_in(a_circle):
                c_mask = circle_masks[o][b] & circle_masks[b][a]
                for c in labels_in(c_mask):
                    u_mask = a_circle & circle_masks[c][a]
                    for u in labels_in(u_mask):
                        v_mask = (
                            circle_masks[u][o] & circle_masks[c][a]
                        )
                        for v in labels_in(v_mask):
                            va_root = roots[v][a]
                            if (
                                roots[v][b] == va_root
                                and roots[v][c] == va_root
                            ):
                                return {
                                    "o": o,
                                    "a": a,
                                    "b": b,
                                    "c": c,
                                    "u": u,
                                    "v": v,
                                }
    return None


def _seven_point_orbit_collision_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, int] | None:
    """Find the generic seven-role orbit-collision equality core.

    The Lean core requires only ``O != A``. Every other role may alias, and
    diagonal edges remain isolated equality classes.
    """

    labels = tuple(range(n))
    roots, circle_masks = (
        index if index is not None else _closure_circle_index(closure, n)
    )
    bisector_masks = [
        [
            sum(
                1 << center
                for center in labels
                if roots[center][left] == roots[center][right]
            )
            for right in labels
        ]
        for left in labels
    ]

    def labels_in(mask: int) -> Iterable[int]:
        while mask:
            bit = mask & -mask
            yield bit.bit_length() - 1
            mask ^= bit

    for o in labels:
        for a in labels:
            if o == a:
                continue
            o_circle = circle_masks[o][a]
            a_circle = circle_masks[a][o]
            for b in labels_in(o_circle & a_circle):
                for c in labels_in(o_circle):
                    b_circle = circle_masks[b][c]
                    v_mask = a_circle & b_circle & circle_masks[c][a]
                    for v in labels_in(v_mask):
                        u_mask = b_circle & circle_masks[v][a]
                        for u in labels_in(u_mask):
                            w_mask = (
                                a_circle
                                & circle_masks[u][c]
                                & circle_masks[v][a]
                                & bisector_masks[o][b]
                                & bisector_masks[o][u]
                            )
                            if w_mask:
                                w = (w_mask & -w_mask).bit_length() - 1
                                return {
                                    "o": o,
                                    "a": a,
                                    "b": b,
                                    "c": c,
                                    "u": u,
                                    "v": v,
                                    "w": w,
                                }
    return None


def _seven_point_circle_network_collision_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, int] | None:
    """Find the generic seven-role circle-network collision core.

    The Lean core requires only ``O != A``. Every other role may alias, so the
    mask intersections deliberately retain centers and repeated role labels.
    """

    labels = tuple(range(n))
    _, circle_masks = (
        index if index is not None else _closure_circle_index(closure, n)
    )

    def labels_in(mask: int) -> Iterable[int]:
        while mask:
            bit = mask & -mask
            yield bit.bit_length() - 1
            mask ^= bit

    for o in labels:
        for a in labels:
            if o == a:
                continue
            oa_circle = circle_masks[o][a]
            av_circle = circle_masks[a][o]
            for b in labels_in(oa_circle):
                bo_circle = circle_masks[b][o]
                for c in labels_in(bo_circle):
                    ca_circle = circle_masks[c][a]
                    for u in labels_in(oa_circle & ca_circle):
                        ub_circle = circle_masks[u][b]
                        for v in labels_in(av_circle & ub_circle):
                            w_mask = (
                                bo_circle
                                & ca_circle
                                & ub_circle
                                & circle_masks[v][b]
                            )
                            for w in labels_in(w_mask):
                                if circle_masks[w][o] & (1 << u):
                                    return {
                                        "o": o,
                                        "a": a,
                                        "b": b,
                                        "c": c,
                                        "u": u,
                                        "v": v,
                                        "w": w,
                                    }
    return None


def _exact_off_circle_core(
    rows: Sequence[MetricRow], n: int | None = None
) -> dict[str, Any] | None:
    """Find an exact row whose excluded label is equality-forced on its circle."""

    if n is None:
        n = 1 + max(
            {row.center for row in rows}
            | {point for row in rows for point in row.support}
        )
    return _exact_off_circle_core_from_closure(
        rows, _row_equality_closure(n, rows), n
    )


def _exact_off_circle_core_from_closure(
    rows: Sequence[MetricRow],
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, Any] | None:
    roots, _ = index if index is not None else _closure_circle_index(closure, n)
    for row in rows:
        if not row.exact:
            continue
        reference_root = roots[row.center][row.support[0]]
        support = frozenset(row.support)
        for point in range(n):
            if point == row.center or point in support:
                continue
            if roots[row.center][point] == reference_root:
                return {
                    "center": row.center,
                    "support": list(row.support),
                    "off_support": point,
                }
    return None


def _perpendicular_bisector_core(
    rows: Sequence[MetricRow], n: int | None = None
) -> dict[str, list[int]] | None:
    """Find three labels equality-forced onto one perpendicular bisector.

    For distinct foci ``a`` and ``b``, every label ``p`` satisfying
    ``d(p,a) = d(p,b)`` lies on the perpendicular bisector of ``ab``.  Three
    distinct ambient labels on that line contradict strict convex position.
    """

    if n is None:
        n = 1 + max(
            {row.center for row in rows}
            | {point for row in rows for point in row.support}
        )
    return _perpendicular_bisector_core_from_closure(
        _row_equality_closure(n, rows), n
    )


def _perpendicular_bisector_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, list[int]] | None:
    roots, _ = index if index is not None else _closure_circle_index(closure, n)
    for left, right in combinations(range(n), 2):
        witnesses = [
            point
            for point in range(n)
            if point not in (left, right)
            and roots[point][left] == roots[point][right]
        ]
        if len(witnesses) >= 3:
            return {"foci": [left, right], "points": witnesses[:3]}
    return None


def _five_point_bisector_circle_core(
    rows: Sequence[MetricRow], n: int, order: Sequence[int]
) -> dict[str, int] | None:
    """Find the order-sensitive five-point bisector/circle obstruction.

    In cyclic order ``a,x,b,c,y``, the core forces ``x`` and ``y`` onto the
    perpendicular bisector of ``ab`` and forces ``b,x,y`` onto a circle
    centered at ``c``.  The two corresponding CCW signed areas must have
    opposite signs, contradicting strict convexity.
    """

    if sorted(order) != list(range(n)):
        raise ValueError("order is not a permutation of the ambient labels")
    return _five_point_bisector_circle_core_from_closure(
        _row_equality_closure(n, rows), n, order
    )


def _five_point_bisector_circle_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    order: Sequence[int],
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, int] | None:
    if sorted(order) != list(range(n)):
        raise ValueError("order is not a permutation of the ambient labels")

    roots, _ = index if index is not None else _closure_circle_index(closure, n)

    def equidistant(center: int, left: int, right: int) -> bool:
        return roots[center][left] == roots[center][right]

    cyclic_order = tuple(order)
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        a = rotated[0]
        for x_pos, b_pos, c_pos, y_pos in combinations(range(1, n), 4):
            x = rotated[x_pos]
            b = rotated[b_pos]
            c = rotated[c_pos]
            y = rotated[y_pos]
            if (
                equidistant(x, a, b)
                and equidistant(y, a, b)
                and equidistant(c, b, x)
                and equidistant(c, b, y)
            ):
                return {"a": a, "x": x, "b": b, "c": c, "y": y}
    return None


def _convex_rhombus_equilateral_core(
    rows: Sequence[MetricRow], n: int, order: Sequence[int]
) -> dict[str, int] | None:
    """Find the cyclic rhombus-with-two-equilateral-apices obstruction.

    In cyclic order ``a,b,c,x,y,d``, force the four sides of ``a,b,c,d``
    and the remaining sides of the equilateral triangles ``b,c,y`` and
    ``x,d,a`` into one distance class.  The equal-sided quadrilateral is a
    rhombus, while the two inward equilateral apices make the turns at
    ``c,x,y`` and ``x,y,d`` incompatible with strict convexity.
    """

    if sorted(order) != list(range(n)):
        raise ValueError("order is not a permutation of the ambient labels")
    return _convex_rhombus_equilateral_core_from_closure(
        _row_equality_closure(n, rows), n, order
    )


def _convex_rhombus_equilateral_core_from_closure(
    closure: _EdgeClosure,
    n: int,
    order: Sequence[int],
    *,
    index: _ClosureCircleIndex | None = None,
) -> dict[str, int] | None:
    if sorted(order) != list(range(n)):
        raise ValueError("order is not a permutation of the ambient labels")

    roots, _ = index if index is not None else _closure_circle_index(closure, n)
    cyclic_order = tuple(order)

    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        a = rotated[0]
        for b_pos, c_pos, x_pos, y_pos, d_pos in combinations(range(1, n), 5):
            b = rotated[b_pos]
            c = rotated[c_pos]
            x = rotated[x_pos]
            y = rotated[y_pos]
            d = rotated[d_pos]
            root = roots[a][b]
            if roots[b][c] != root:
                continue
            if roots[b][y] != root or roots[c][y] != root:
                continue
            if roots[x][d] != root or roots[x][a] != root:
                continue
            if roots[c][d] == root and roots[d][a] == root:
                return {
                    "a": a,
                    "b": b,
                    "c": c,
                    "x": x,
                    "y": y,
                    "d": d,
                }
    return None


def _formalized_metric_core(
    rows: Sequence[MetricRow], n: int, order: Sequence[int],
    *, include_extended: bool = True, include_ordered: bool = True,
) -> dict[str, Any] | None:
    """Find the first obstruction covered by `MetricCoreAlternative`.

    Duplicate-center, exact-off-circle, and perpendicular-bisector detection
    are suitable for frequent monotone prefix pruning. ``include_ordered``
    adds the more expensive cyclic five-point and rhombus scans. At a complete
    assignment, ``include_extended`` adds seven further proved equality-only
    Census554 cores.
    """

    closure = _row_equality_closure(n, rows)
    closure_index: _ClosureCircleIndex | None = None

    def shared_closure_index() -> _ClosureCircleIndex:
        nonlocal closure_index
        if closure_index is None:
            closure_index = _closure_circle_index(closure, n)
        return closure_index

    checks = [
        ("equality-duplicate-center", lambda:
            _duplicate_center_core_from_closure(
                closure, n, index=shared_closure_index()
            )),
        ("equality-exact-off-circle", lambda:
            _exact_off_circle_core_from_closure(
                rows, closure, n, index=shared_closure_index()
            )),
        ("equality-perpendicular-bisector-convex", lambda:
            _perpendicular_bisector_core_from_closure(
                closure, n, index=shared_closure_index()
            )),
    ]
    if include_ordered:
        reverse_order = tuple(reversed(tuple(order)))
        checks.extend([
            ("equality-convex-five-point", lambda:
                _five_point_bisector_circle_core_from_closure(
                    closure, n, order, index=shared_closure_index()
                )),
            ("equality-convex-rhombus-equilateral", lambda:
                _convex_rhombus_equilateral_core_from_closure(
                    closure, n, order, index=shared_closure_index()
                )),
            ("equality-convex-five-point-reverse", lambda:
                _five_point_bisector_circle_core_from_closure(
                    closure, n, reverse_order, index=shared_closure_index()
                )),
            ("equality-convex-rhombus-equilateral-reverse", lambda:
                _convex_rhombus_equilateral_core_from_closure(
                    closure, n, reverse_order, index=shared_closure_index()
                )),
        ])
    if include_extended:
        checks[2:2] = [
            ("equality-equal-k4", lambda:
                _equal_k4_core_from_closure(
                    closure, n, index=shared_closure_index()
                )),
            ("equality-equilateral-bisector-collision", lambda:
                _equilateral_bisector_collision_core_from_closure(
                    closure, n, index=shared_closure_index()
                )),
            ("equality-three-triad-collision", lambda:
                _three_triad_collision_core_from_closure(
                    closure, n, index=shared_closure_index()
                )),
            ("equality-surplus-source-collision", lambda:
                _surplus_source_collision_core_from_closure(
                    closure, n, index=shared_closure_index()
                )),
            ("equality-six-row-anchor-collision", lambda:
                _six_row_anchor_collision_core_from_closure(
                    closure, n, index=shared_closure_index()
                )),
            ("equality-seven-point-orbit-collision", lambda:
                _seven_point_orbit_collision_core_from_closure(
                    closure, n, index=shared_closure_index()
                )),
            ("equality-seven-point-circle-network-collision", lambda:
                _seven_point_circle_network_collision_core_from_closure(
                    closure, n, index=shared_closure_index()
                )),
        ]
    for stage, find_core in checks:
        core = find_core()
        if core is not None:
            return {"stage": stage, "core": core}
    return None


def _constraint_counts(n: int, rows: Sequence[MetricRow]) -> dict[str, int]:
    return {
        "equalities": sum(len(row.support) - 1 for row in rows),
        "distinctness": n * (n - 1) // 2,
        "convex_order": n * (n - 2),
        "exact_exclusions": sum(
            n - 1 - len(row.support) for row in rows if row.exact
        ),
    }


def _metric_row_constraints(
    n: int, rows: Sequence[MetricRow], d2: Any
) -> list[tuple[str, list[Any], list[Any]]]:
    """Build row-owned equality and exactness constraints for one system."""

    constraints = []
    for index, row in enumerate(rows):
        reference = row.support[0]
        equalities = [
            d2(row.center, point) == d2(row.center, reference)
            for point in row.support[1:]
        ]
        exactness = []
        if row.exact:
            radius2 = d2(row.center, reference)
            support = frozenset(row.support)
            for point in range(n):
                if point == row.center or point in support:
                    continue
                delta = d2(row.center, point) - radius2
                exactness.append(delta * delta > 0)
        constraints.append((f"row-{index}", equalities, exactness))
    return constraints


def _exact_metric_unsat_core(
    system: Mapping[str, Any], timeout_s: float
) -> dict[str, Any]:
    """Return a tracked QF_NRA core for one exact-metric system when available."""

    import z3

    n = int(system["n"])
    rows = tuple(
        MetricRow(int(row["center"]), tuple(row["support"]), bool(row["exact"]))
        for row in system["rows"]
    )
    points: dict[int, tuple[Any, Any]] = {
        0: (z3.RealVal(0), z3.RealVal(0)),
        1: (z3.RealVal(1), z3.RealVal(0)),
    }
    for point in range(2, n):
        points[point] = z3.Reals(f"core_x_{point} core_y_{point}")

    def d2(left: int, right: int) -> Any:
        lx, ly = points[left]
        rx, ry = points[right]
        return (lx - rx) ** 2 + (ly - ry) ** 2

    row_constraints = _metric_row_constraints(n, rows, d2)
    distinctness = [
        d2(left, right) > 0 for left in range(n) for right in range(left + 1, n)
    ]
    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", max(1, int(timeout_s * 1000)))
    solver.set("unsat_core", True)
    solver.assert_and_track(z3.And(*distinctness), z3.Bool("ambient-distinct"))
    for tag, equalities, exactness in row_constraints:
        solver.assert_and_track(z3.And(*(equalities + exactness)), z3.Bool(tag))
    verdict = solver.check()
    if verdict == z3.unsat:
        core = {str(item) for item in solver.unsat_core()}
        return {
            "system_id": system["system_id"],
            "status": "UNSAT",
            "row_indices": [
                index for index, (tag, _equalities, _exactness)
                in enumerate(row_constraints) if tag in core
            ],
            "uses_ambient_distinctness": "ambient-distinct" in core,
        }
    if verdict == z3.sat:
        return {"system_id": system["system_id"], "status": "SAT"}
    return {
        "system_id": system["system_id"],
        "status": "UNKNOWN",
        "reason": solver.reason_unknown(),
    }


def _jsonable(value: Any) -> bool:
    try:
        json.dumps(value)
    except (TypeError, ValueError):
        return False
    return True


def _source_family(path: Path, json_path: Sequence[Any]) -> str:
    joined = "/".join(str(part) for part in json_path)
    if path.name.startswith("shell_audit"):
        if "first_critical_witness" in joined:
            return "shell-audit-critical"
        if "first_survival_witness" in joined:
            return "shell-audit-survival"
        return "shell-audit"
    if path.name.startswith("critical_shell"):
        return "critical-shell-global"
    if "first_critical_witness" in joined:
        return "base-critical"
    if "first_survival_witness" in joined:
        return "base-survival"
    return "base"


def _json_pointer(path: Sequence[Any]) -> str:
    def escape(part: Any) -> str:
        return str(part).replace("~", "~0").replace("/", "~1")

    return "/" + "/".join(escape(part) for part in path)


def _normalize_assignment(
    assignment: Mapping[str, Any], n: int
) -> tuple[MetricRow, ...]:
    """Merge duplicate named rows while preserving the strongest exact flag."""

    merged: dict[tuple[int, tuple[int, ...]], bool] = {}
    for name, raw in assignment.items():
        if not isinstance(raw, Mapping):
            raise ValueError(f"row {name!r} is not an object")
        center = int(raw["center"])
        support = tuple(sorted(int(point) for point in raw["support"]))
        if len(support) != 4 or len(set(support)) != 4:
            raise ValueError(f"row {name!r} does not have four distinct points")
        if not 0 <= center < n or any(not 0 <= point < n for point in support):
            raise ValueError(f"row {name!r} has a label outside 0..{n - 1}")
        if center in support:
            raise ValueError(f"row {name!r} contains its center")
        key = (center, support)
        merged[key] = merged.get(key, False) or bool(raw.get("exact", False))
    return tuple(
        MetricRow(center, support, exact)
        for (center, support), exact in sorted(merged.items())
    )


def _system_key(
    n: int, profile: Sequence[int], order: Sequence[int], rows: Sequence[MetricRow]
) -> str:
    payload = {
        "n": n,
        "profile": list(profile),
        "order": list(order),
        "rows": [row.as_dict() for row in rows],
    }
    return json.dumps(payload, sort_keys=True, separators=(",", ":"))


def extract_systems(paths: Sequence[Path]) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    """Extract and metric-deduplicate every saved SAT assignment."""

    by_key: dict[str, dict[str, Any]] = {}
    raw_assignments = 0
    rejected_non_sat = 0
    input_files = []

    for path in paths:
        raw_bytes = path.read_bytes()
        root = json.loads(raw_bytes)
        input_files.append(
            {
                "path": os.path.relpath(path, ROOT),
                "sha256": hashlib.sha256(raw_bytes).hexdigest(),
            }
        )

        def visit(value: Any, json_path: tuple[Any, ...], context: dict[str, Any]) -> None:
            nonlocal raw_assignments, rejected_non_sat
            if isinstance(value, dict):
                next_context = dict(context)
                for field in CONTEXT_FIELDS:
                    if field in value and _jsonable(value[field]):
                        next_context[field] = value[field]
                labels = value.get("labels")
                if isinstance(labels, dict):
                    for field in ("pin_source", "deleted", "pin_center", "pin_class"):
                        if field in labels:
                            next_context[field] = labels[field]

                if value.get("assignment") is not None:
                    raw_assignments += 1
                    if str(value.get("status", "")).upper() != "SAT":
                        rejected_non_sat += 1
                    else:
                        if "n" not in next_context or "profile" not in next_context:
                            raise ValueError(
                                f"missing frame metadata at {path}:{_json_pointer(json_path)}"
                            )
                        n = int(next_context["n"])
                        profile = tuple(int(x) for x in next_context["profile"])
                        frame = mc.build_frame(profile)
                        if frame.n != n:
                            raise ValueError(f"profile {profile} builds n={frame.n}, not {n}")
                        order = tuple(hull_order(frame))
                        if sorted(order) != list(range(n)):
                            raise ValueError(f"invalid hull order for profile {profile}")
                        rows = _normalize_assignment(value["assignment"], n)
                        key = _system_key(n, profile, order, rows)
                        source_context = {
                            field: next_context[field]
                            for field in CONTEXT_FIELDS
                            if field in next_context
                        }
                        source = {
                            "file": os.path.relpath(path, ROOT),
                            "json_pointer": _json_pointer(json_path + ("assignment",)),
                            "family": _source_family(path, json_path),
                            "context": source_context,
                        }
                        if key not in by_key:
                            system_id = hashlib.sha256(key.encode()).hexdigest()[:20]
                            by_key[key] = {
                                "system_id": system_id,
                                "n": n,
                                "profile": list(profile),
                                "order": list(order),
                                "rows": [row.as_dict() for row in rows],
                                "sources": [],
                            }
                        by_key[key]["sources"].append(source)

                for key_part, child in value.items():
                    if key_part != "assignment":
                        visit(child, json_path + (key_part,), next_context)
            elif isinstance(value, list):
                for index, child in enumerate(value):
                    visit(child, json_path + (index,), context)

        visit(root, (), {})

    systems = sorted(by_key.values(), key=lambda item: item["system_id"])
    for system in systems:
        system["sources"].sort(
            key=lambda source: (source["file"], source["json_pointer"])
        )
    extraction = {
        "input_files": input_files,
        "raw_assignments": raw_assignments,
        "rejected_non_sat_assignments": rejected_non_sat,
        "unique_metric_systems": len(systems),
        "deduplicated_assignments": raw_assignments - len(systems),
        "source_family_counts": dict(
            sorted(
                Counter(
                    source["family"]
                    for system in systems
                    for source in system["sources"]
                ).items()
            )
        ),
    }
    return systems, extraction


def _probe_system(system: Mapping[str, Any], timeout_s: float) -> dict[str, Any]:
    """Worker entrypoint.  All Z3 objects remain process-local."""
    n = int(system["n"])
    order = tuple(int(point) for point in system["order"])
    rows = tuple(
        MetricRow(int(row["center"]), tuple(row["support"]), bool(row["exact"]))
        for row in system["rows"]
    )
    constraint_counts = _constraint_counts(n, rows)
    equality_core = _duplicate_center_core(rows, n)
    if equality_core is not None:
        equality_constraints = (
            constraint_counts["equalities"] + constraint_counts["distinctness"]
        )
        return {
            "system_id": system["system_id"],
            "status": "UNSAT",
            "decisive_stage": "equality-duplicate-center",
            "stages": [
                {
                    "stage": "equality-duplicate-center",
                    "added_constraints": equality_constraints,
                    "total_constraints": equality_constraints,
                    "status": "UNSAT",
                    "elapsed_sec": 0.0,
                }
            ],
            "constraint_counts": constraint_counts,
            "equality_core": equality_core,
        }
    exact_off_circle_core = _exact_off_circle_core(rows, n)
    if exact_off_circle_core is not None:
        exact_constraints = (
            constraint_counts["equalities"] + constraint_counts["exact_exclusions"]
        )
        return {
            "system_id": system["system_id"],
            "status": "UNSAT",
            "decisive_stage": "equality-exact-off-circle",
            "stages": [
                {
                    "stage": "equality-exact-off-circle",
                    "added_constraints": exact_constraints,
                    "total_constraints": exact_constraints,
                    "status": "UNSAT",
                    "elapsed_sec": 0.0,
                }
            ],
            "constraint_counts": constraint_counts,
            "exact_off_circle_core": exact_off_circle_core,
        }
    equal_k4_core = _equal_k4_core(rows, n)
    if equal_k4_core is not None:
        equality_constraints = (
            constraint_counts["equalities"] + constraint_counts["distinctness"]
        )
        return {
            "system_id": system["system_id"],
            "status": "UNSAT",
            "decisive_stage": "equality-equal-k4",
            "stages": [
                {
                    "stage": "equality-equal-k4",
                    "added_constraints": equality_constraints,
                    "total_constraints": equality_constraints,
                    "status": "UNSAT",
                    "elapsed_sec": 0.0,
                }
            ],
            "constraint_counts": constraint_counts,
            "equal_k4_core": equal_k4_core,
        }
    perpendicular_bisector_core = _perpendicular_bisector_core(rows, n)
    if perpendicular_bisector_core is not None:
        convex_constraints = (
            constraint_counts["equalities"]
            + constraint_counts["distinctness"]
            + constraint_counts["convex_order"]
        )
        return {
            "system_id": system["system_id"],
            "status": "UNSAT",
            "decisive_stage": "equality-perpendicular-bisector-convex",
            "stages": [
                {
                    "stage": "equality-perpendicular-bisector-convex",
                    "added_constraints": convex_constraints,
                    "total_constraints": convex_constraints,
                    "status": "UNSAT",
                    "elapsed_sec": 0.0,
                }
            ],
            "constraint_counts": constraint_counts,
            "perpendicular_bisector_core": perpendicular_bisector_core,
        }
    convex_constraints = (
        constraint_counts["equalities"]
        + constraint_counts["distinctness"]
        + constraint_counts["convex_order"]
    )
    ordered_orientations = (
        ("", order),
        ("-reverse", tuple(reversed(order))),
    )
    for suffix, cyclic_order in ordered_orientations:
        five_point_core = _five_point_bisector_circle_core(
            rows, n, cyclic_order
        )
        if five_point_core is not None:
            stage = f"equality-convex-five-point{suffix}"
            return {
                "system_id": system["system_id"],
                "status": "UNSAT",
                "decisive_stage": stage,
                "stages": [
                    {
                        "stage": stage,
                        "added_constraints": convex_constraints,
                        "total_constraints": convex_constraints,
                        "status": "UNSAT",
                        "elapsed_sec": 0.0,
                    }
                ],
                "constraint_counts": constraint_counts,
                "five_point_core": five_point_core,
            }
        rhombus_equilateral_core = _convex_rhombus_equilateral_core(
            rows, n, cyclic_order
        )
        if rhombus_equilateral_core is not None:
            stage = f"equality-convex-rhombus-equilateral{suffix}"
            return {
                "system_id": system["system_id"],
                "status": "UNSAT",
                "decisive_stage": stage,
                "stages": [
                    {
                        "stage": stage,
                        "added_constraints": convex_constraints,
                        "total_constraints": convex_constraints,
                        "status": "UNSAT",
                        "elapsed_sec": 0.0,
                    }
                ],
                "constraint_counts": constraint_counts,
                "rhombus_equilateral_core": rhombus_equilateral_core,
            }

    import z3

    zero = z3.RealVal(0)
    one = z3.RealVal(1)
    points: dict[int, tuple[Any, Any]] = {
        0: (zero, zero),
        1: (one, zero),
    }
    for point in range(2, n):
        points[point] = z3.Reals(f"x_{point} y_{point}")

    def d2(left: int, right: int) -> Any:
        lx, ly = points[left]
        rx, ry = points[right]
        return (lx - rx) ** 2 + (ly - ry) ** 2

    def cross(a: int, b: int, c: int) -> Any:
        ax, ay = points[a]
        bx, by = points[b]
        cx, cy = points[c]
        return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)

    row_constraints = _metric_row_constraints(n, rows, d2)
    equalities = [
        constraint
        for _tag, row_equalities, _row_exactness in row_constraints
        for constraint in row_equalities
    ]
    distinctness: list[Any] = [
        d2(left, right) > 0 for left in range(n) for right in range(left + 1, n)
    ]
    convexity: list[Any] = []
    for index, left in enumerate(order):
        right = order[(index + 1) % n]
        convexity.extend(
            cross(left, right, point) > 0
            for point in order
            if point != left and point != right
        )

    exactness = [
        constraint
        for _tag, _row_equalities, row_exactness in row_constraints
        for constraint in row_exactness
    ]

    timeout_ms = max(1, int(timeout_s * 1000))

    def new_solver() -> Any:
        instance = z3.Tactic("qfnra-nlsat").solver()
        instance.set("timeout", timeout_ms)
        return instance

    def check_stage(
        solver: Any, stage_name: str, added: Sequence[Any], total: int
    ) -> tuple[dict[str, Any], Any, Any | None]:
        if added:
            solver.add(*added)
        started = time.monotonic()
        verdict = solver.check()
        elapsed = time.monotonic() - started
        if verdict == z3.sat:
            status = "SAT"
            model = solver.model()
        elif verdict == z3.unsat:
            status = "UNSAT"
            model = None
        else:
            status = "UNKNOWN"
            model = None
        stage = {
            "stage": stage_name,
            "added_constraints": len(added),
            "total_constraints": total,
            "status": status,
            "elapsed_sec": round(elapsed, 6),
        }
        if status == "UNKNOWN":
            stage["reason"] = solver.reason_unknown()
        return stage, verdict, model

    solver = new_solver()
    stages = []
    metric_constraints = equalities + distinctness + exactness
    full_constraints = metric_constraints + convexity
    final_model = None
    decisive_stage = None
    final_status = "UNKNOWN"

    metric_stage, metric_verdict, _ = check_stage(
        solver,
        "exact-metric-relaxation",
        metric_constraints,
        len(metric_constraints),
    )
    stages.append(metric_stage)
    if metric_verdict == z3.unsat:
        final_status = "UNSAT"
        decisive_stage = "exact-metric-relaxation"
    else:
        full_stage, full_verdict, full_model = check_stage(
            solver, "full-convex", convexity, len(full_constraints)
        )
        stages.append(full_stage)
        if full_verdict == z3.unsat:
            final_status = "UNSAT"
            decisive_stage = "full-convex"
        elif full_verdict == z3.sat:
            final_status = "SAT"
            decisive_stage = "full-convex"
            final_model = full_model
        else:
            # Exact disequalities can obscure a simpler convex-only kill.
            convex_solver = new_solver()
            convex_relaxation = equalities + distinctness + convexity
            convex_stage, convex_verdict, _ = check_stage(
                convex_solver,
                "convex-only-relaxation",
                convex_relaxation,
                len(convex_relaxation),
            )
            stages.append(convex_stage)
            if convex_verdict == z3.unsat:
                final_status = "UNSAT"
                decisive_stage = "convex-only-relaxation"

    result: dict[str, Any] = {
        "system_id": system["system_id"],
        "status": final_status,
        "decisive_stage": decisive_stage,
        "stages": stages,
        "constraint_counts": constraint_counts,
    }

    if final_status != "SAT" or final_model is None:
        return result

    bad_assertions = []
    for index, assertion in enumerate(full_constraints):
        evaluated = z3.simplify(final_model.eval(assertion, model_completion=True))
        if not z3.is_true(evaluated):
            bad_assertions.append({"index": index, "value": str(evaluated)})

    exact_coordinates: dict[str, dict[str, str]] = {}
    numeric_coordinates: dict[int, tuple[float, float]] = {}

    def encode_value(expression: Any) -> tuple[str, float]:
        value = z3.simplify(final_model.eval(expression, model_completion=True))
        if z3.is_rational_value(value):
            numerator = value.numerator_as_long()
            denominator = value.denominator_as_long()
            return f"{numerator}/{denominator}", numerator / denominator
        if z3.is_algebraic_value(value):
            approximation = value.approx(50)
            return value.sexpr(), (
                approximation.numerator_as_long() / approximation.denominator_as_long()
            )
        decimal = value.as_decimal(40) if hasattr(value, "as_decimal") else str(value)
        return str(value), float(decimal.rstrip("?"))

    for point in range(n):
        x_exact, x_float = encode_value(points[point][0])
        y_exact, y_float = encode_value(points[point][1])
        exact_coordinates[str(point)] = {"x": x_exact, "y": y_exact}
        numeric_coordinates[point] = (x_float, y_float)

    def d2_float(left: int, right: int) -> float:
        lx, ly = numeric_coordinates[left]
        rx, ry = numeric_coordinates[right]
        return (lx - rx) ** 2 + (ly - ry) ** 2

    def cross_float(a: int, b: int, c: int) -> float:
        ax, ay = numeric_coordinates[a]
        bx, by = numeric_coordinates[b]
        cx, cy = numeric_coordinates[c]
        return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)

    equality_residuals = []
    exact_gaps = []
    for row in rows:
        radius2 = d2_float(row.center, row.support[0])
        equality_residuals.extend(
            abs(d2_float(row.center, point) - radius2)
            for point in row.support[1:]
        )
        if row.exact:
            support = frozenset(row.support)
            exact_gaps.extend(
                abs(d2_float(row.center, point) - radius2)
                for point in range(n)
                if point != row.center and point not in support
            )
    distinct_margins = [
        d2_float(left, right)
        for left in range(n)
        for right in range(left + 1, n)
    ]
    hull_margins = [
        cross_float(left, order[(index + 1) % n], point)
        for index, left in enumerate(order)
        for point in order
        if point != left and point != order[(index + 1) % n]
    ]
    result["verification"] = {
        "all_z3_assertions_true": not bad_assertions,
        "bad_assertions": bad_assertions,
        "numeric_max_row_equality_residual": max(equality_residuals, default=0.0),
        "numeric_min_pair_distance_squared": min(distinct_margins),
        "numeric_min_convex_cross": min(hull_margins),
        "numeric_min_exact_radius_gap": min(exact_gaps, default=None),
    }
    result["model"] = exact_coordinates
    if bad_assertions:
        result["status"] = "ERROR"
        result["decisive_stage"] = None
    return result


def _smoke_systems() -> tuple[dict[str, Any], dict[str, Any]]:
    sat = {
        "system_id": "smoke-sat",
        "n": 5,
        "profile": [0, 0, 0],
        "order": [0, 1, 2, 3, 4],
        "rows": [MetricRow(0, (1, 2, 3, 4), True).as_dict()],
    }
    unsat = {
        "system_id": "smoke-unsat",
        "n": 6,
        "profile": [0, 0, 0],
        "order": [0, 1, 2, 3, 4, 5],
        "rows": [
            MetricRow(0, (1, 2, 3, 4), True).as_dict(),
            MetricRow(0, (1, 2, 3, 5), True).as_dict(),
        ],
    }
    return sat, unsat


def run_smoke(timeout_s: float = 10.0) -> dict[str, Any]:
    sat_system, unsat_system = _smoke_systems()
    sat_result = _probe_system(sat_system, timeout_s)
    unsat_result = _probe_system(unsat_system, timeout_s)
    passed = (
        sat_result["status"] == "SAT"
        and sat_result.get("verification", {}).get("all_z3_assertions_true") is True
        and unsat_result["status"] == "UNSAT"
    )
    return {"passed": passed, "sat": sat_result, "unsat": unsat_result}


def _atomic_json(path: Path, payload: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(
        "w", encoding="utf-8", dir=path.parent, delete=False
    ) as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        temporary = Path(handle.name)
    temporary.replace(path)


def _summary(results: Iterable[Mapping[str, Any]]) -> dict[str, Any]:
    results = list(results)
    statuses = Counter(result["status"] for result in results)
    decisive = Counter(
        result.get("decisive_stage") or "none" for result in results
    )
    stage_statuses: dict[str, Counter[str]] = {}
    for result in results:
        for stage in result.get("stages", []):
            stage_statuses.setdefault(stage["stage"], Counter())[stage["status"]] += 1
    return {
        "status_counts": dict(sorted(statuses.items())),
        "decisive_stage_counts": dict(sorted(decisive.items())),
        "stage_status_counts": {
            stage: dict(sorted(counts.items()))
            for stage, counts in sorted(stage_statuses.items())
        },
    }


def _render_markdown(payload: Mapping[str, Any]) -> str:
    extraction = payload["extraction"]
    summary = payload["summary"]
    lines = [
        "# Metric realizability probe",
        "",
        "## Result",
        "",
        f"- Saved SAT assignments: **{extraction['raw_assignments']}**",
        f"- Unique metric row systems: **{extraction['unique_metric_systems']}**",
        f"- Systems selected in this run: **{payload['selected_systems']}**",
        f"- Systems completed: **{len(payload['results'])}**",
        "",
        "| Final status | Count |",
        "|---|---:|",
    ]
    for status, count in summary["status_counts"].items():
        lines.append(f"| {status} | {count} |")
    lines.extend(
        [
            "",
            "| Decisive stage | Count |",
            "|---|---:|",
        ]
    )
    for stage, count in summary["decisive_stage_counts"].items():
        lines.append(f"| {stage} | {count} |")
    lines.extend(
        [
            "",
            "## Formula ledger",
            "",
            "Encoded exactly over the reals:",
            "",
            "- the gauge `p0 = (0,0)` and `p1 = (1,0)`;",
            "- all selected-row squared-distance equalities;",
            "- pairwise distinctness of every ambient label;",
            "- strict convexity in the cap frame's recorded cyclic order, using",
            "  the left-half-plane condition for every oriented hull edge; and",
            "- for every exact row, exclusion of each nonmember from its radius.",
            "",
            "Before invoking QF_NRA, the probe deterministically closes row",
            "equalities and checks for two distinct centers equidistant from the",
            "same three labels. Such a duplicate-center core is reported as",
            "`equality-duplicate-center` UNSAT. It is a structural consequence",
            "of the selected rows and ambient-label distinctness, not a Z3 result.",
            "",
            "The same prefilter also rejects an exact row when equality closure",
            "forces a label outside its support onto that row's circle. Such a",
            "witness is reported as `equality-exact-off-circle` UNSAT.",
            "",
            "Equality closure also rejects four labels whose six pair distances",
            "are all forced equal. Such a witness is reported as",
            "`equality-equal-k4` UNSAT.",
            "",
            "With strict convexity enabled, equality closure also rejects three",
            "distinct labels forced onto the perpendicular bisector of the same",
            "two distinct foci. Such a witness is reported as",
            "`equality-perpendicular-bisector-convex` UNSAT.",
            "",
            "Finally, equality closure rejects a cyclic five-label pattern",
            "`a,x,b,c,y` when `x,y` are equidistant from `a,b` and `c` is",
            "equidistant from `b,x,y`. Such a witness is reported as",
            "`equality-convex-five-point` UNSAT.",
            "",
            "Equality closure finally rejects a cyclic six-label pattern",
            "`a,b,c,x,y,d` consisting of an equal-sided quadrilateral",
            "`a,b,c,d` and the equilateral triangles `b,c,y` and `x,d,a`.",
            "Such a witness is reported as",
            "`equality-convex-rhombus-equilateral` UNSAT.",
            "",
            "Not encoded:",
            "",
            "- the diameter, minimal-enclosing-circle, nonobtuse-frame, and other",
            "  geometric hypotheses not present in the saved row assignment; and",
            "- any selected radius classes not represented by a saved row.",
            "",
            "Therefore `UNSAT` soundly excludes a saved incidence assignment even",
            "under this relaxation. `SAT` establishes only row-level realizability",
            "and is not a Problem 97 configuration. `UNKNOWN` is no verdict. Z3",
            "QF_NRA outcomes are trusted computations, not Lean certificates.",
            "",
            "## Inputs",
            "",
        ]
    )
    for item in extraction["input_files"]:
        lines.append(f"- `{item['path']}`: `{item['sha256']}`")
    lines.extend(
        [
            "",
            "## Command parameters",
            "",
            f"- Workers: `{payload['config']['workers']}`",
            f"- Per-stage timeout: `{payload['config']['timeout_seconds']}` seconds",
            f"- Smoke gate passed: `{str(payload['smoke']['passed']).lower()}`",
            "",
        ]
    )
    return "\n".join(lines)


def _write_checkpoint(
    out: Path,
    markdown: Path | None,
    *,
    extraction: Mapping[str, Any],
    config: Mapping[str, Any],
    smoke: Mapping[str, Any],
    systems_by_id: Mapping[str, Mapping[str, Any]],
    results_by_id: Mapping[str, Mapping[str, Any]],
) -> None:
    enriched = []
    for system_id in sorted(results_by_id):
        system = systems_by_id[system_id]
        result = dict(results_by_id[system_id])
        result.update(
            {
                "n": system["n"],
                "profile": system["profile"],
                "order": system["order"],
                "rows": system["rows"],
                "row_count": len(system["rows"]),
                "exact_row_count": sum(row["exact"] for row in system["rows"]),
                "source_count": len(system["sources"]),
                "sources": system["sources"],
            }
        )
        enriched.append(result)
    payload = {
        "schema": SCHEMA,
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "extraction": extraction,
        "config": config,
        "smoke": smoke,
        "selected_systems": len(systems_by_id),
        "summary": _summary(enriched),
        "results": enriched,
    }
    _atomic_json(out, payload)
    if markdown is not None:
        markdown.write_text(_render_markdown(payload), encoding="utf-8")


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", action="append", type=Path, dest="inputs")
    parser.add_argument(
        "--out", type=Path, default=HERE / "metric_realizability_results.json"
    )
    parser.add_argument(
        "--markdown", type=Path, default=HERE / "metric_realizability_results.md"
    )
    parser.add_argument("--workers", type=int, default=8)
    parser.add_argument("--timeout", type=float, default=2.0)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--system-id", action="append", default=[])
    parser.add_argument("--checkpoint-every", type=int, default=25)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--smoke-only", action="store_true")
    parser.add_argument("--explain-exact-core", action="store_true")
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    if args.workers < 1 or args.workers > 8:
        raise SystemExit("--workers must be between 1 and 8")
    if args.timeout <= 0:
        raise SystemExit("--timeout must be positive")
    if args.checkpoint_every < 1:
        raise SystemExit("--checkpoint-every must be positive")

    smoke = run_smoke(max(10.0, args.timeout))
    if not smoke["passed"]:
        print(json.dumps(smoke, indent=2, sort_keys=True))
        raise SystemExit("metric realizability smoke gate failed")
    if args.smoke_only:
        print(json.dumps(smoke, indent=2, sort_keys=True))
        return 0

    inputs = tuple(path.resolve() for path in (args.inputs or DEFAULT_INPUTS))
    systems, extraction = extract_systems(inputs)
    if args.system_id:
        selected_ids = set(args.system_id)
        systems = [system for system in systems if system["system_id"] in selected_ids]
        missing = selected_ids - {system["system_id"] for system in systems}
        if missing:
            raise SystemExit(f"unknown system ids: {', '.join(sorted(missing))}")
    if args.limit is not None:
        if args.limit < 1:
            raise SystemExit("--limit must be positive")
        systems = systems[: args.limit]

    if args.explain_exact_core:
        if not args.system_id:
            raise SystemExit("--explain-exact-core requires at least one --system-id")
        reports = [_exact_metric_unsat_core(system, args.timeout) for system in systems]
        print(json.dumps({"reports": reports}, indent=2, sort_keys=True))
        return 0

    systems_by_id = {system["system_id"]: system for system in systems}
    results_by_id: dict[str, dict[str, Any]] = {}
    if args.resume and args.out.exists():
        old = json.loads(args.out.read_text(encoding="utf-8"))
        if old.get("schema") != SCHEMA:
            raise SystemExit(f"cannot resume incompatible schema in {args.out}")
        for result in old.get("results", []):
            system_id = result["system_id"]
            if system_id in systems_by_id and result["status"] in ("SAT", "UNSAT"):
                results_by_id[system_id] = {
                    key: value
                    for key, value in result.items()
                    if key
                    not in {
                        "n",
                        "profile",
                        "order",
                        "rows",
                        "row_count",
                        "exact_row_count",
                        "source_count",
                        "sources",
                    }
                }

    pending = [system for system in systems if system["system_id"] not in results_by_id]
    config = {
        "workers": args.workers,
        "timeout_seconds": args.timeout,
        "checkpoint_every": args.checkpoint_every,
        "resume": args.resume,
    }
    _write_checkpoint(
        args.out,
        args.markdown,
        extraction=extraction,
        config=config,
        smoke=smoke,
        systems_by_id=systems_by_id,
        results_by_id=results_by_id,
    )

    completed = 0
    started = time.monotonic()
    with ProcessPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(_probe_system, system, args.timeout): system["system_id"]
            for system in pending
        }
        for future in as_completed(futures):
            system_id = futures[future]
            try:
                results_by_id[system_id] = future.result()
            except Exception as error:  # noqa: BLE001
                results_by_id[system_id] = {
                    "system_id": system_id,
                    "status": "ERROR",
                    "decisive_stage": None,
                    "error": f"{type(error).__name__}: {error}",
                    "stages": [],
                }
            completed += 1
            if completed % args.checkpoint_every == 0 or completed == len(pending):
                _write_checkpoint(
                    args.out,
                    args.markdown,
                    extraction=extraction,
                    config=config,
                    smoke=smoke,
                    systems_by_id=systems_by_id,
                    results_by_id=results_by_id,
                )
                counts = _summary(results_by_id.values())["status_counts"]
                elapsed = time.monotonic() - started
                print(
                    f"completed {completed}/{len(pending)} new systems "
                    f"({len(results_by_id)}/{len(systems)} total) in {elapsed:.1f}s; "
                    f"statuses={counts}",
                    flush=True,
                )

    return 0 if all(
        result["status"] != "ERROR" for result in results_by_id.values()
    ) else 1


if __name__ == "__main__":
    raise SystemExit(main())
