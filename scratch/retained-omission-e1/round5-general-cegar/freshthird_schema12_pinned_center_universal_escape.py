#!/usr/bin/env python3
"""Finite Schema-12 checker for the FreshThird pinned-center dichotomy.

This is a deliberately small, source-faithful finite abstraction of
``exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy``.  It
checks the existential choice of one pinned center and then the universal
quantification over *every* exact-four row and every row point outside the
six-point seed.  It is not a Euclidean realization or a universal lift.
"""

from __future__ import annotations

from collections.abc import Iterable, Mapping
from dataclasses import dataclass
from pathlib import Path

SCHEMA_VERSION = 12
HERE = Path(__file__).resolve().parent


@dataclass(frozen=True)
class FourRow:
    """Finite stand-in for ``SelectedFourClass`` (support has four points)."""

    support: frozenset[int]


@dataclass(frozen=True)
class Instance:
    """All finite data needed by the public Lean theorem's conclusion.

    ``positive_shells[c]`` is the finite inventory of positive radius classes
    checked for center ``c``.  Supplying that inventory is an explicit
    finite-only assumption; it does not assert that the inventory exhausts
    arbitrary real radii.
    """

    universe: frozenset[int]
    seed: frozenset[int]
    exposed_centers: tuple[int, int]
    candidate_centers: frozenset[int]
    rows: Mapping[int, tuple[FourRow, ...]]
    blocker_center: Mapping[int, int]
    critical_support: Mapping[int, frozenset[int]]
    deletion_robust: Mapping[int, bool]
    positive_shells: Mapping[int, tuple[frozenset[int], ...]]


def _outside_points(row: FourRow, seed: frozenset[int]) -> Iterable[int]:
    return (point for point in row.support if point not in seed)


def _check_static(instance: Instance) -> list[str]:
    errors: list[str] = []
    if len(instance.seed) != 6:
        errors.append("two-shell seed must have cardinality exactly six")
    if not instance.seed <= instance.universe:
        errors.append("seed is not contained in finite universe")
    if not set(instance.exposed_centers) <= instance.universe:
        errors.append("exposed center is outside finite universe")
    for center, rows in instance.rows.items():
        if center not in instance.universe:
            errors.append(f"row center {center} is outside finite universe")
        for row_index, row in enumerate(rows):
            if len(row.support) != 4:
                errors.append(f"row {center}/{row_index} is not exact-four")
            if not row.support <= instance.universe:
                errors.append(f"row {center}/{row_index} leaves finite universe")
    for point in instance.universe:
        if point not in instance.blocker_center:
            errors.append(f"missing canonical blocker for point {point}")
        if point not in instance.critical_support:
            errors.append(f"missing canonical critical support for point {point}")
        elif len(instance.critical_support[point]) != 4:
            errors.append(f"critical support for point {point} is not exact-four")
    return errors


def _row_escape(instance: Instance, center: int, row: FourRow, point: int) -> str | None:
    """Return the successful branch label, or ``None`` when both fail."""
    blocker = instance.blocker_center[point]
    critical = instance.critical_support[point]
    if (
        center == blocker
        and row.support == critical
        and not instance.deletion_robust[center]
    ):
        return "A"
    if center != blocker and len(row.support & critical) <= 2:
        return "B"
    return None


def witness(instance: Instance) -> tuple[int, dict[str, object]] | None:
    """Find one center satisfying the exact existential/universal contract."""
    static_errors = _check_static(instance)
    if static_errors:
        return None
    for center in sorted(instance.candidate_centers):
        if center not in instance.seed:
            continue
        if center in instance.exposed_centers:
            continue
        if any(len(shell & instance.seed) > 3 for shell in instance.positive_shells.get(center, ())):
            continue
        branches: list[dict[str, object]] = []
        failed = False
        for row in instance.rows.get(center, ()):
            for point in _outside_points(row, instance.seed):
                branch = _row_escape(instance, center, row, point)
                if branch is None:
                    failed = True
                    break
                branches.append({"point": point, "branch": branch})
            if failed:
                break
        if not failed:
            return center, {"rows_checked": len(instance.rows.get(center, ())), "escapes": branches}
    return None


def satisfies(instance: Instance) -> bool:
    return witness(instance) is not None


def positive_instance() -> Instance:
    seed = frozenset(range(6))
    return Instance(
        universe=frozenset(range(10)),
        seed=seed,
        exposed_centers=(6, 7),
        candidate_centers=frozenset({0}),
        rows={0: (FourRow(frozenset({0, 1, 2, 8})), FourRow(frozenset({0, 1, 2, 9})))},
        blocker_center={p: 8 for p in range(10)} | {9: 0},
        critical_support={p: frozenset({3, 4, 8, 9}) for p in range(10)}
        | {9: frozenset({0, 1, 2, 9})},
        deletion_robust={p: True for p in range(10)} | {0: False},
        positive_shells={0: (frozenset({0, 1, 2}), frozenset({3, 4}))},
    )


def self_check() -> dict[str, object]:
    positive = positive_instance()
    assert satisfies(positive)
    # One valid row cannot discharge the universal row/point quantifier.
    bad_universal = Instance(
        **{**positive.__dict__, "rows": {0: positive.rows[0] + (FourRow(frozenset({0, 1, 8, 9})),)}}
    )
    assert not satisfies(bad_universal)
    # Branch A is invalid when deletion robustness still holds.
    bad_robust = Instance(**{**positive.__dict__, "deletion_robust": {**positive.deletion_robust, 0: True}})
    assert not satisfies(bad_robust)
    # Branch B must use the <=2 intersection bound (not <=3).
    bad_intersection = Instance(
        **{**positive.__dict__, "critical_support": {**positive.critical_support, 8: frozenset({0, 1, 2, 8})}}
    )
    assert not satisfies(bad_intersection)
    return {
        "status": "PASS",
        "schema_version": SCHEMA_VERSION,
        "positive_center": witness(positive)[0],
        "negative_cases": ["universal_row", "deletion_robustness", "intersection_bound"],
        "finite_only": True,
        "universal_lift_claim": False,
    }


if __name__ == "__main__":
    import json

    print(json.dumps(self_check(), sort_keys=True))
