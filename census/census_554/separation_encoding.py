"""Card-11 cyclic-separation orders and a reusable SAT encoding.

The geometric separation theorem used by the Census-554 closure says that if
two distinct centers have the same two points in their radius classes, those
two points lie on opposite sides of the center chord in a compatible convex
boundary order.  This module exposes both sides of that finite statement:

* the 72 direct orders ``U,O2,V,S,W,O1`` and their 72 reflected orders;
* a small extension for an existing ``CoverInstance``-like SAT object; and
* an independent pure-Python validator for decoded cubes and orders.

This is a **direct-row-only** encoding.  Its input must be the canonical
card-11 row with labels ``U=0``, ``V=1``, ``W=2`` and the three fixed interior
blocks below.  It must not be applied to an arbitrarily relabeled motif or to
a mirrored copy of the cube row.  "Mirror" in this module refers only to the
second boundary orientation checked for the same direct row.

The SAT object is deliberately structural rather than tied to the scratch
driver.  It needs only ``cand``, ``x``, and ``cnf`` attributes, where ``cnf``
provides ``new_var()`` and ``add(clause)``.  The caller's existing CNF must
already enforce exactly one candidate-choice variable per center; that
semantic property cannot be recovered by introspecting this small protocol.
Pair indicators use the same one-way convention as the cover encoding's
pattern indicators: choosing a candidate containing a pair forces its
indicator.  Nothing needs to force an unused indicator false because all
separation clauses contain it negatively.

Order selectors are required to be nonempty, but not one-hot.  Selecting more
than one order merely imposes more constraints; any satisfying model can set
just one valid order selector.  Avoiding an unnecessary at-most-one encoding
keeps the extension at 474 + 144 variables for the current card-11 profile.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import combinations, permutations
from typing import Iterable, Mapping, Protocol, Sequence


N_LABELS = 11
U = 0
V = 1
W = 2
SURPLUS_INTERIOR = (3, 4, 5)
FIRST_OTHER_INTERIOR = (6, 7, 8)
SECOND_OTHER_INTERIOR = (9, 10)
DIRECT_ROW_SCOPE = "canonical-card11-direct-row"


class _CNFLike(Protocol):
    def new_var(self) -> int: ...

    def add(self, clause: Sequence[int]) -> None: ...


class CoverInstanceLike(Protocol):
    cand: Mapping[int, Sequence[Iterable[int]]]
    x: Mapping[tuple[int, int], int]
    cnf: _CNFLike


@dataclass(frozen=True, slots=True)
class BoundaryOrder:
    """One direct or reflected card-11 boundary order.

    ``labels`` lists labels in increasing boundary position.  ``positions``
    is its inverse and makes strict-betweenness checks constant-time.
    ``internal_index`` pairs a reflected order with the direct order obtained
    from the same three internal permutations.  It is only the lexicographic
    Python enumeration used by this module.  It is **not** the value of Lean's
    constructive ``card11InternalOrderEquivFin72`` and must never be serialized
    as though it were a Lean ``Fin 72`` certificate index.
    """

    orientation: str
    internal_index: int
    labels: tuple[int, ...]
    positions: tuple[int, ...]

    def between(self, first: int, second: int, point: int) -> bool:
        """Whether ``point`` is strictly between the two endpoints."""

        left = self.positions[first]
        right = self.positions[second]
        value = self.positions[point]
        return min(left, right) < value < max(left, right)

    def separates(
        self, first_center: int, second_center: int,
        first_point: int, second_point: int,
    ) -> bool:
        """Whether the two points are on opposite sides of the center chord."""

        return self.between(first_center, second_center, first_point) != (
            self.between(first_center, second_center, second_point)
        )


def _make_order(
    orientation: str, internal_index: int, labels: tuple[int, ...]
) -> BoundaryOrder:
    if len(labels) != N_LABELS or set(labels) != set(range(N_LABELS)):
        raise ValueError("a boundary order must contain each label exactly once")
    positions = [0] * N_LABELS
    for position, label in enumerate(labels):
        positions[label] = position
    return BoundaryOrder(orientation, internal_index, labels, tuple(positions))


def _build_orders() -> tuple[BoundaryOrder, ...]:
    direct = []
    mirror = []
    internal_index = 0
    for second_other in permutations(SECOND_OTHER_INTERIOR):
        for surplus in permutations(SURPLUS_INTERIOR):
            for first_other in permutations(FIRST_OTHER_INTERIOR):
                direct_labels = (
                    U, *second_other, V, *surplus, W, *first_other
                )
                # Reflection fixes the cut at U and maps position i > 0 to
                # 11-i.  Writing the reflected sequence explicitly keeps the
                # implementation independent of the validator below.
                mirror_labels = (
                    U, *reversed(first_other), W, *reversed(surplus),
                    V, *reversed(second_other)
                )
                direct.append(_make_order(
                    "direct", internal_index, direct_labels
                ))
                mirror.append(_make_order(
                    "mirror", internal_index, mirror_labels
                ))
                internal_index += 1
    return tuple(direct + mirror)


_ALL_ORDERS = _build_orders()


def all_orders() -> tuple[BoundaryOrder, ...]:
    """Return the exact 72 direct and 72 reflected card-11 orders."""

    return _ALL_ORDERS


Pair = tuple[int, int]
PairIndicatorKey = tuple[int, Pair]


@dataclass(slots=True)
class SeparationEncoding:
    """Variables and counts produced by :func:`add_separation_encoding`."""

    pair_indicators: dict[PairIndicatorKey, int]
    order_to_selector: dict[BoundaryOrder, int]
    selector_to_order: dict[int, BoundaryOrder]
    bad_type_counts: tuple[int, ...]
    indicator_clause_count: int
    order_clause_count: int
    scope: str = DIRECT_ROW_SCOPE

    @property
    def bad_types_per_order(self) -> int:
        """The common bad-type count, rejecting nonuniform order surfaces."""

        counts = set(self.bad_type_counts)
        if len(counts) != 1:
            raise ValueError(f"bad-type counts are not uniform: {sorted(counts)}")
        return next(iter(counts))

    @property
    def variable_count(self) -> int:
        return len(self.pair_indicators) + len(self.order_to_selector)

    @property
    def clause_count(self) -> int:
        return self.indicator_clause_count + self.order_clause_count

    def selected_orders(
        self, positive_variables: Iterable[int]
    ) -> tuple[BoundaryOrder, ...]:
        """Decode every selected order from a SAT model's positive variables."""

        positive = set(positive_variables)
        return tuple(
            order for order in all_orders()
            if self.order_to_selector[order] in positive
        )

    def selected_order(self, positive_variables: Iterable[int]) -> BoundaryOrder:
        """Decode one selected order, failing if the model selected none.

        The encoding permits multiple selectors.  In that case the first in
        the canonical direct-then-mirror enumeration is returned; every
        selected order obeys the same separation clauses.
        """

        selected = self.selected_orders(positive_variables)
        if not selected:
            raise ValueError("SAT model contains no selected separation order")
        return selected[0]


def _candidate_pair_indices(
    candidates: Sequence[Iterable[int]],
) -> dict[Pair, list[int]]:
    result: dict[Pair, list[int]] = {}
    for candidate_index, members in enumerate(candidates):
        frozen = sorted(set(int(member) for member in members))
        for pair in combinations(frozen, 2):
            result.setdefault(pair, []).append(candidate_index)
    return result


def _require_direct_row_scope(scope: str) -> None:
    if scope != DIRECT_ROW_SCOPE:
        raise ValueError(
            "separation encoding is defined only for the canonical direct "
            f"card-11 row ({DIRECT_ROW_SCOPE!r})"
        )


def _validate_instance_candidates(
    instance: CoverInstanceLike,
) -> dict[int, tuple[frozenset[int], ...]]:
    """Validate the direct-row candidate and variable surface before mutation."""

    expected_centers = set(range(N_LABELS))
    if set(instance.cand) != expected_centers:
        raise ValueError("instance.cand must contain exactly centers 0 through 10")

    expected_keys = set()
    normalized: dict[int, tuple[frozenset[int], ...]] = {}
    for center in range(N_LABELS):
        center_candidates = []
        for candidate_index, candidate in enumerate(instance.cand[center]):
            raw = tuple(candidate)
            if len(raw) != 4:
                raise ValueError(
                    f"center {center}, candidate {candidate_index} must contain "
                    "four distinct members"
                )
            if any(not isinstance(member, int) or isinstance(member, bool)
                   for member in raw):
                raise ValueError(
                    f"center {center}, candidate {candidate_index} has a "
                    "non-integer member"
                )
            if len(set(raw)) != 4:
                raise ValueError(
                    f"center {center}, candidate {candidate_index} must contain "
                    "four distinct members"
                )
            if any(member < 0 or member >= N_LABELS for member in raw):
                raise ValueError(
                    f"center {center}, candidate {candidate_index} has a member "
                    "outside 0 through 10"
                )
            if center in raw:
                raise ValueError(
                    f"center {center}, candidate {candidate_index} contains its "
                    "own center"
                )
            expected_keys.add((center, candidate_index))
            center_candidates.append(frozenset(raw))
        normalized[center] = tuple(center_candidates)

    actual_keys = set(instance.x)
    if actual_keys != expected_keys:
        missing = sorted(expected_keys - actual_keys)
        extra = sorted(actual_keys - expected_keys)
        raise ValueError(
            "instance.x must contain exactly one variable for every candidate "
            f"choice (missing={missing[:3]}, extra={extra[:3]})"
        )
    variables = list(instance.x.values())
    if any(not isinstance(variable, int) or isinstance(variable, bool)
           or variable <= 0 for variable in variables):
        raise ValueError("instance.x candidate variables must be positive integers")
    if len(set(variables)) != len(variables):
        raise ValueError("instance.x candidate variables must be distinct")
    return normalized


def add_separation_encoding(
    instance: CoverInstanceLike, *, scope: str = DIRECT_ROW_SCOPE,
) -> SeparationEncoding:
    """Add the card-11 direct-or-mirror separation surface to ``instance``.

    ``instance`` must describe the canonical direct card-11 row.  Its candidate
    variables must already be constrained one-hot center-by-center; this
    function validates the candidate and variable tables, but deliberately
    does not attempt to recognize those pre-existing CNF clauses.

    For every feasible ``(center, member-pair)`` there is an indicator ``z``.
    Each candidate variable containing that pair adds ``x -> z``.  For every
    order and every two centers sharing the pair, an order that fails strict
    alternation adds ``not selector or not z1 or not z2``.  Finally, one clause
    requires at least one of the 144 order selectors.
    """

    _require_direct_row_scope(scope)
    normalized_candidates = _validate_instance_candidates(instance)

    pair_indicators: dict[PairIndicatorKey, int] = {}
    indicator_clause_count = 0
    centers_by_pair: dict[Pair, list[int]] = {}

    for center in range(N_LABELS):
        candidates = normalized_candidates[center]
        pair_indices = _candidate_pair_indices(candidates)
        for pair in sorted(pair_indices):
            indicator = instance.cnf.new_var()
            pair_indicators[(center, pair)] = indicator
            centers_by_pair.setdefault(pair, []).append(center)
            for candidate_index in pair_indices[pair]:
                try:
                    candidate_variable = instance.x[(center, candidate_index)]
                except KeyError as exc:
                    raise ValueError(
                        "instance.x is missing a candidate-choice variable for "
                        f"center {center}, index {candidate_index}"
                    ) from exc
                instance.cnf.add([-candidate_variable, indicator])
                indicator_clause_count += 1

    order_to_selector = {
        order: instance.cnf.new_var() for order in all_orders()
    }
    selector_to_order = {
        selector: order for order, selector in order_to_selector.items()
    }
    instance.cnf.add(list(order_to_selector.values()))
    order_clause_count = 1

    bad_type_counts = []
    for order in all_orders():
        selector = order_to_selector[order]
        bad_count = 0
        for pair in sorted(centers_by_pair):
            first_point, second_point = pair
            for first_center, second_center in combinations(
                centers_by_pair[pair], 2
            ):
                if order.separates(
                    first_center, second_center, first_point, second_point
                ):
                    continue
                instance.cnf.add([
                    -selector,
                    -pair_indicators[(first_center, pair)],
                    -pair_indicators[(second_center, pair)],
                ])
                bad_count += 1
                order_clause_count += 1
        bad_type_counts.append(bad_count)

    return SeparationEncoding(
        pair_indicators=pair_indicators,
        order_to_selector=order_to_selector,
        selector_to_order=selector_to_order,
        bad_type_counts=tuple(bad_type_counts),
        indicator_clause_count=indicator_clause_count,
        order_clause_count=order_clause_count,
        scope=scope,
    )


def _positions_from_order(
    order: BoundaryOrder | Sequence[int],
) -> tuple[int, ...]:
    if isinstance(order, BoundaryOrder):
        return order.positions
    labels = tuple(int(label) for label in order)
    if len(labels) != N_LABELS or set(labels) != set(range(N_LABELS)):
        raise ValueError("order must contain each label 0 through 10 exactly once")
    positions = [0] * N_LABELS
    for index, label in enumerate(labels):
        positions[label] = index
    return tuple(positions)


def _normalized_cube(
    cube: Mapping[int, Iterable[int]],
) -> dict[int, frozenset[int]]:
    if set(cube) != set(range(N_LABELS)):
        raise ValueError("cube must contain exactly centers 0 through 10")
    normalized = {
        center: frozenset(int(member) for member in cube[center])
        for center in range(N_LABELS)
    }
    for center, members in normalized.items():
        if len(members) != 4:
            raise ValueError(f"center {center} does not have four distinct members")
        if center in members:
            raise ValueError(f"center {center} occurs in its own class")
        if any(member < 0 or member >= N_LABELS for member in members):
            raise ValueError(f"center {center} has a member outside 0 through 10")
    return normalized


def validate_cube_order(
    cube: Mapping[int, Iterable[int]],
    order: BoundaryOrder | Sequence[int],
    *,
    scope: str = DIRECT_ROW_SCOPE,
) -> bool:
    """Independently check a canonical direct row against one boundary order.

    This validator does not inspect SAT variables or clauses.  It intersects
    each pair of selected radius classes directly, then checks strict linear
    betweenness for every pair of common points.  The cube labels must be the
    canonical direct-row labels; a mirror order changes only boundary
    orientation and does not authorize relabeling the cube.
    """

    _require_direct_row_scope(scope)
    normalized = _normalized_cube(cube)
    positions = _positions_from_order(order)
    for first_center, second_center in combinations(range(N_LABELS), 2):
        common = sorted(
            normalized[first_center] & normalized[second_center]
        )
        left = positions[first_center]
        right = positions[second_center]
        low, high = sorted((left, right))
        for first_point, second_point in combinations(common, 2):
            first_between = low < positions[first_point] < high
            second_between = low < positions[second_point] < high
            if first_between == second_between:
                return False
    return True


def valid_orders(
    cube: Mapping[int, Iterable[int]],
    *,
    scope: str = DIRECT_ROW_SCOPE,
) -> tuple[BoundaryOrder, ...]:
    """Return all boundary orientations satisfying a canonical direct row."""

    return tuple(order for order in all_orders()
                 if validate_cube_order(cube, order, scope=scope))


def validate_cube_orders(
    cube: Mapping[int, Iterable[int]],
    *,
    scope: str = DIRECT_ROW_SCOPE,
) -> bool:
    """Whether a canonical direct row has an admissible boundary order."""

    return any(validate_cube_order(cube, order, scope=scope)
               for order in all_orders())
