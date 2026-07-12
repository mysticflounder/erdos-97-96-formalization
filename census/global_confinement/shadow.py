# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Global selected-class incidence shadow used by confinement probes.

The solver deliberately has no metric variables.  It enforces necessary
finite consequences of same-radius classes in convex position, but a SAT
assignment is not a Euclidean realization.
"""
from __future__ import annotations

from dataclasses import dataclass
from itertools import combinations
from typing import Callable, Iterable, Mapping, Sequence

from census.multi_center import multi_center_census as mc


@dataclass(frozen=True)
class ClassRow:
    """One selected four-point class at a named center.

    ``exact`` marks a class known to be the whole radius class.  If an exact
    row and another row have the same center, sharing one point forces the
    rows to be equal.
    """

    name: str
    center: int
    support: frozenset[int]
    exact: bool = False


@dataclass(frozen=True)
class VariableRow:
    """A row whose support is selected by the DFS."""

    name: str
    center: int
    candidates: tuple[frozenset[int], ...]
    exact: bool = False


@dataclass(frozen=True)
class RowChoice:
    """One center/support option for a source-indexed row."""

    center: int
    support: frozenset[int]


@dataclass(frozen=True)
class ChoiceRow:
    """A named row that may choose both its center and its support."""

    name: str
    choices: tuple[RowChoice, ...]
    exact: bool = False


def hull_order(frame: mc.Frame) -> tuple[int, ...]:
    """Cyclic label order for an ``(m,4,4)`` Moser-cap profile."""

    return (
        0,
        *frame.ints["O2"],
        1,
        *frame.ints["S"],
        2,
        *frame.ints["O1"],
    )


def cyclic_between(order: Sequence[int], a: int, b: int, x: int) -> bool:
    """Whether ``x`` lies strictly on the oriented cyclic arc ``a`` to ``b``."""

    pos = {point: index for index, point in enumerate(order)}
    size = len(order)
    dx = (pos[x] + size - pos[a]) % size
    db = (pos[b] + size - pos[a]) % size
    return 0 < dx < db


def cyclic_separated(
    order: Sequence[int], a: int, b: int, x: int, y: int
) -> bool:
    """Whether the endpoint pairs ``(a,b)`` and ``(x,y)`` alternate."""

    return cyclic_between(order, a, b, x) != cyclic_between(order, a, b, y)


def cross_separation_ok(
    order: Sequence[int], left: ClassRow, right: ClassRow
) -> bool:
    """Apply the two-common-point cyclic separation consequence."""

    if left.center == right.center:
        return True
    common = sorted(left.support & right.support)
    if len(common) < 2:
        return True
    positions = {point: index for index, point in enumerate(order)}
    size = len(order)

    def between(a: int, b: int, x: int) -> bool:
        dx = (positions[x] + size - positions[a]) % size
        db = (positions[b] + size - positions[a]) % size
        return 0 < dx < db

    x, y = common
    return between(left.center, right.center, x) != between(
        left.center, right.center, y
    )


def rows_compatible(frame: mc.Frame, left: ClassRow, right: ClassRow) -> bool:
    """Pairwise necessary compatibility for two selected-class rows."""

    if left.center == right.center:
        if left.support == right.support:
            return True
        if left.exact or right.exact:
            return left.support.isdisjoint(right.support)
        return True

    if len(left.support & right.support) > 2:
        return False
    if left.center in mc.MOSER_SET and right.center in mc.MOSER_SET:
        if not mc.q3.joint_ok(
            left.center,
            left.support,
            right.center,
            right.support,
            frame.caps_int,
        ):
            return False
    return cross_separation_ok(hull_order(frame), left, right)


def _serialize_rows(rows: Iterable[ClassRow]) -> dict[str, dict]:
    return {
        row.name: {
            "center": row.center,
            "support": sorted(row.support),
            "exact": row.exact,
        }
        for row in sorted(rows, key=lambda row: row.name)
    }


def verify_assignment(
    frame: mc.Frame,
    killed_rows: set[tuple[int, int, int, int]],
    rows: Iterable[ClassRow],
    *,
    extra_compatible: Callable[[ClassRow, ClassRow], bool] | None = None,
) -> tuple[bool, str | None]:
    """Independently verify every constraint represented by this shadow."""

    rows = tuple(rows)
    names = [row.name for row in rows]
    if len(names) != len(set(names)):
        return False, "duplicate row name"
    for row in rows:
        if not 0 <= row.center < frame.n:
            return False, f"{row.name}: center outside frame"
        if not mc.candidate_ok(frame, killed_rows, row.center, row.support):
            return False, f"{row.name}: invalid local class"
    for left, right in combinations(rows, 2):
        if not rows_compatible(frame, left, right):
            return False, f"incompatible rows {left.name}, {right.name}"
        if extra_compatible is not None and not extra_compatible(left, right):
            return False, f"extra-incompatible rows {left.name}, {right.name}"
    for x, y in combinations(range(frame.n), 2):
        centers = {
            row.center for row in rows if x in row.support and y in row.support
        }
        if len(centers) > 2:
            return False, f"point pair {(x, y)} occurs at {len(centers)} centers"
    return True, None


def solve_rows(
    frame: mc.Frame,
    killed_rows: set[tuple[int, int, int, int]],
    *,
    fixed_rows: Sequence[ClassRow],
    variable_rows: Sequence[VariableRow],
    max_nodes: int,
    want_assignment: bool = False,
    extra_compatible: Callable[[ClassRow, ClassRow], bool] | None = None,
    prefix_compatible: Callable[[Sequence[ClassRow]], bool] | None = None,
    complete_compatible: Callable[[Sequence[ClassRow]], bool] | None = None,
) -> dict:
    """Find a globally compatible support for every variable row.

    ``UNSAT`` means exhaustive failure in this finite shadow.  Hitting
    ``max_nodes`` returns ``INDETERMINATE`` rather than overclaiming UNSAT.
    """

    choice_rows = tuple(
        ChoiceRow(
            row.name,
            tuple(RowChoice(row.center, support) for support in row.candidates),
            exact=row.exact,
        )
        for row in variable_rows
    )
    return solve_choice_rows(
        frame,
        killed_rows,
        fixed_rows=fixed_rows,
        choice_rows=choice_rows,
        max_nodes=max_nodes,
        want_assignment=want_assignment,
        extra_compatible=extra_compatible,
        prefix_compatible=prefix_compatible,
        complete_compatible=complete_compatible,
    )


def solve_choice_rows(
    frame: mc.Frame,
    killed_rows: set[tuple[int, int, int, int]],
    *,
    fixed_rows: Sequence[ClassRow],
    choice_rows: Sequence[ChoiceRow],
    max_nodes: int,
    want_assignment: bool = False,
    extra_compatible: Callable[[ClassRow, ClassRow], bool] | None = None,
    prefix_compatible: Callable[[Sequence[ClassRow]], bool] | None = None,
    complete_compatible: Callable[[Sequence[ClassRow]], bool] | None = None,
) -> dict:
    """Find one globally compatible center/support choice for every row.

    ``prefix_compatible`` may reject a partial assignment using a monotone
    whole-row-set constraint: once it returns ``False``, adding rows must not
    make that prefix admissible again. This supports early pruning for global
    obstructions such as equality-closure cores.

    ``complete_compatible`` is checked only after every choice row has been
    assigned. It supports more expensive whole-system checks without paying
    their cost at every DFS prefix.
    """

    if max_nodes < 1:
        raise ValueError("max_nodes must be positive")

    names = [row.name for row in fixed_rows] + [row.name for row in choice_rows]
    if len(names) != len(set(names)):
        raise ValueError("row names must be unique")

    normalized: list[ChoiceRow] = []
    for row in choice_rows:
        choices = tuple(
            sorted(
                {
                    choice
                    for choice in row.choices
                    if mc.candidate_ok(
                        frame, killed_rows, choice.center, choice.support
                    )
                },
                key=lambda choice: (choice.center, tuple(sorted(choice.support))),
            )
        )
        if not choices:
            return {"status": "UNSAT", "nodes": 0}
        normalized.append(ChoiceRow(row.name, choices, exact=row.exact))

    assigned: list[ClassRow] = []
    pair_centers: dict[tuple[int, int], set[int]] = {}

    def pair_bound_ok(row: ClassRow) -> bool:
        for pair in combinations(sorted(row.support), 2):
            centers = pair_centers.get(pair, set())
            if row.center not in centers and len(centers) >= 2:
                return False
        return True

    def push(row: ClassRow) -> list[tuple[int, int]]:
        assigned.append(row)
        added: list[tuple[int, int]] = []
        for pair in combinations(sorted(row.support), 2):
            centers = pair_centers.setdefault(pair, set())
            if row.center not in centers:
                centers.add(row.center)
                added.append(pair)
        return added

    def pop(added: list[tuple[int, int]]) -> None:
        row = assigned.pop()
        for pair in added:
            centers = pair_centers[pair]
            centers.remove(row.center)
            if not centers:
                del pair_centers[pair]

    for row in fixed_rows:
        if not mc.candidate_ok(frame, killed_rows, row.center, row.support):
            return {"status": "UNSAT", "nodes": 0}
        if any(not rows_compatible(frame, row, other) for other in assigned):
            return {"status": "UNSAT", "nodes": 0}
        if extra_compatible is not None and any(
            not extra_compatible(row, other) for other in assigned
        ):
            return {"status": "UNSAT", "nodes": 0}
        if not pair_bound_ok(row):
            return {"status": "UNSAT", "nodes": 0}
        added = push(row)
        if prefix_compatible is not None and not prefix_compatible(assigned):
            pop(added)
            return {"status": "UNSAT", "nodes": 0}

    # Fixed-row filtering is a large win for the repeated packet probes.
    filtered: list[ChoiceRow] = []
    for spec in normalized:
        choices = []
        for choice in spec.choices:
            candidate = ClassRow(
                spec.name, choice.center, choice.support, spec.exact
            )
            if not pair_bound_ok(candidate):
                continue
            if any(
                not rows_compatible(frame, candidate, fixed)
                or (
                    extra_compatible is not None
                    and not extra_compatible(candidate, fixed)
                )
                for fixed in assigned
            ):
                continue
            if prefix_compatible is not None and not prefix_compatible(
                (*assigned, candidate)
            ):
                continue
            choices.append(choice)
        choices = tuple(choices)
        if not choices:
            return {"status": "UNSAT", "nodes": 0}
        filtered.append(ChoiceRow(spec.name, choices, exact=spec.exact))
    option_rows = tuple(
        tuple(
            ClassRow(spec.name, choice.center, choice.support, spec.exact)
            for choice in spec.choices
        )
        for spec in filtered
    )
    nodes = 0
    hit_cap = False
    compatibility_cache: dict[tuple[int, int, int, int], bool] = {}

    def option_compatible(
        left_index: int,
        left_candidate: int,
        right_index: int,
        right_candidate: int,
    ) -> bool:
        if left_index < right_index:
            key = (left_index, left_candidate, right_index, right_candidate)
        else:
            key = (right_index, right_candidate, left_index, left_candidate)
        if key not in compatibility_cache:
            left_row = option_rows[left_index][left_candidate]
            right_row = option_rows[right_index][right_candidate]
            compatibility_cache[key] = rows_compatible(
                frame, left_row, right_row
            ) and (
                extra_compatible is None
                or extra_compatible(left_row, right_row)
            )
        return compatibility_cache[key]

    Domain = tuple[int, tuple[int, ...]]

    def dfs(remaining: tuple[Domain, ...]) -> bool:
        nonlocal nodes, hit_cap
        if not remaining:
            return complete_compatible is None or complete_compatible(assigned)

        best_index = min(
            range(len(remaining)), key=lambda index: len(remaining[index][1])
        )
        spec_index, viable = remaining[best_index]
        rest = remaining[:best_index] + remaining[best_index + 1 :]
        for candidate_index in viable:
            nodes += 1
            if nodes > max_nodes:
                hit_cap = True
                return False
            row = option_rows[spec_index][candidate_index]
            if not pair_bound_ok(row):
                continue
            added = push(row)
            if prefix_compatible is not None and not prefix_compatible(assigned):
                pop(added)
                continue
            next_domains: list[Domain] = []
            dead = False
            for other_index, other_domain in rest:
                next_domain = tuple(
                    other_candidate
                    for other_candidate in other_domain
                    if (
                        option_compatible(
                            spec_index,
                            candidate_index,
                            other_index,
                            other_candidate,
                        )
                        and pair_bound_ok(option_rows[other_index][other_candidate])
                    )
                )
                if not next_domain:
                    dead = True
                    break
                next_domains.append((other_index, next_domain))
            if not dead and dfs(tuple(next_domains)):
                return True
            pop(added)
            if hit_cap:
                return False
        return False

    sat = dfs(
        tuple(
            (index, tuple(range(len(spec.choices))))
            for index, spec in enumerate(filtered)
        )
    )
    if sat:
        ok, reason = verify_assignment(
            frame,
            killed_rows,
            assigned,
            extra_compatible=extra_compatible,
        )
        if not ok:
            raise AssertionError(f"internal witness verification failed: {reason}")
        if prefix_compatible is not None and not prefix_compatible(assigned):
            raise AssertionError("internal witness failed prefix compatibility")
        if complete_compatible is not None and not complete_compatible(assigned):
            raise AssertionError("internal witness failed complete compatibility")
        out = {"status": "SAT", "nodes": nodes}
        if want_assignment:
            out["assignment"] = _serialize_rows(assigned)
        return out
    if hit_cap:
        return {"status": "INDETERMINATE", "nodes": nodes}
    return {"status": "UNSAT", "nodes": nodes}


def full_center_extension_rows(
    frame: mc.Frame,
    base_candidates: Mapping[int, Sequence[frozenset[int]]],
    occupied_centers: Iterable[int],
) -> tuple[VariableRow, ...]:
    """Add one selected K4 row at every otherwise-unrepresented center."""

    occupied = set(occupied_centers)
    return tuple(
        VariableRow(f"global:{center}", center, tuple(base_candidates[center]))
        for center in range(frame.n)
        if center not in occupied
    )
