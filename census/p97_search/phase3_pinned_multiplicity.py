"""Auxiliary full-multiplicity constraints for the Phase-3 projected cell.

The projected-static encoding keeps its old semantic interface: its first 114
DIMACS variables (90 shell literals, 21 cap literals, and three profile
selectors) are unchanged.  This module adds only auxiliary variables.

``eq[i,j]`` is an *asserted equality* of the squared-distance items indexed by
the two carrier edges.  Its false value deliberately means only "not asserted
equal"; it is never used as a distance inequality.  The transitivity clauses
make the asserted equalities an equivalence relation, and every selected
four-shell row places its four spokes in one equivalence class.

For every deleted point ``x`` one auxiliary ``low[x,p]`` chooses a centre
``p != x`` witnessing the deletion obstruction.  It is linked to ``s[p,x]``:
the selected four-shell at ``p`` must contain the deleted point.  No four
remaining spokes at ``p`` may then be in a common asserted equality class.
This is the sound Boolean shadow of full forced-equality multiplicity; it
does not manufacture any off-shell metric inequality.
"""

from __future__ import annotations

import hashlib
import itertools
import json
from collections.abc import Iterable, Mapping
from typing import Any

SCHEMA = "p97-phase3-projected-static-global-pinned-multiplicity-v1"
N = 10
LEGACY_PROJECTED_VARIABLE_COUNT = 114
SEMANTIC_VARIABLE_COUNT = 111

TAG_TRANSITIVITY = "PINNED-EQ-TRANS"
TAG_ROW = "PINNED-EQ-ROW"
TAG_BLOCKER_CHOICE = "PINNED-LOW-CHOICE"
TAG_BLOCKER_LINK = "PINNED-LOW-LINK"
TAG_BLOCKER_MULTIPLICITY = "PINNED-LOW-MULTIPLICITY"
CLAUSE_TAGS = (
    TAG_TRANSITIVITY,
    TAG_ROW,
    TAG_BLOCKER_CHOICE,
    TAG_BLOCKER_LINK,
    TAG_BLOCKER_MULTIPLICITY,
)


class PinnedMultiplicityError(RuntimeError):
    """The host SAT encoding cannot safely receive this fixed-n extension."""


def edge_items(n: int = N) -> tuple[tuple[int, int], ...]:
    """The 45 unordered carrier-distance items in deterministic order."""

    return tuple(itertools.combinations(range(n), 2))


def _canonical_json(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def _sha256_value(value: Any) -> str:
    return hashlib.sha256(_canonical_json(value)).hexdigest()


def _edge_index(items: tuple[tuple[int, int], ...]) -> dict[tuple[int, int], int]:
    return {edge: index for index, edge in enumerate(items)}


def _edge(p: int, q: int) -> tuple[int, int]:
    return (p, q) if p < q else (q, p)


def _equality_key(left: int, right: int) -> tuple[str, int, int]:
    if left == right:
        raise PinnedMultiplicityError("diagonal equality is implicit")
    low, high = sorted((left, right))
    return ("pinned-eq", low, high)


def equality_var(encoding: Any, left: int, right: int) -> int:
    """Return an auxiliary equality literal for two distinct distance items."""

    return encoding.var(*_equality_key(left, right))


def blocker_var(encoding: Any, deleted: int, center: int) -> int:
    if deleted == center:
        raise PinnedMultiplicityError("a deletion blocker centre must be distinct")
    return encoding.var("pinned-low-blocker", deleted, center)


def _host_is_compatible(encoding: Any) -> None:
    cell = encoding.cell
    if (cell.n, cell.k, cell.profile, cell.exact) != (N, 4, (4, 4, 5), True):
        raise PinnedMultiplicityError(
            "global pinned multiplicity is defined only for exact "
            "Phase-3 (4,10,(4,4,5))"
        )
    if not encoding.project_blockers:
        raise PinnedMultiplicityError("pinned multiplicity requires projected blockers")
    if encoding.num_vars != LEGACY_PROJECTED_VARIABLE_COUNT:
        raise PinnedMultiplicityError(
            "pinned multiplicity must be installed before any other auxiliary "
            f"variables; found {encoding.num_vars} variables"
        )
    if len(encoding.semantic_vars) != SEMANTIC_VARIABLE_COUNT:
        raise PinnedMultiplicityError("unexpected projected semantic namespace")
    if any(key[0].startswith("pinned-") for key in encoding.var_for):
        raise PinnedMultiplicityError("pinned multiplicity is already installed")


def _add(encoding: Any, tag: str, clause: Iterable[int]) -> None:
    encoding._add(tag, tuple(clause))


def descriptor() -> dict[str, Any]:
    items = edge_items()
    equality_count = len(tuple(itertools.combinations(range(len(items)), 2)))
    blocker_count = N * (N - 1)
    clause_counts = {
        TAG_TRANSITIVITY: 3 * len(tuple(itertools.combinations(range(len(items)), 3))),
        TAG_ROW: N * (N - 1) * (N - 2) // 2,
        TAG_BLOCKER_CHOICE: N + N * (N - 1) * (N - 2) // 2,
        TAG_BLOCKER_LINK: blocker_count,
        TAG_BLOCKER_MULTIPLICITY: blocker_count * 70,
    }
    result = {
        "schema": SCHEMA,
        "carrier_vertex_count": N,
        "distance_item_count": len(items),
        "distance_items_sha256": _sha256_value(items),
        "semantic_variable_count": SEMANTIC_VARIABLE_COUNT,
        "legacy_projected_variable_count": LEGACY_PROJECTED_VARIABLE_COUNT,
        "equality_relation_variable_count": equality_count,
        "blocker_choice_variable_count": blocker_count,
        "added_variable_count": equality_count + blocker_count,
        "first_auxiliary_variable": LEGACY_PROJECTED_VARIABLE_COUNT + 1,
        "total_variable_count": (
            LEGACY_PROJECTED_VARIABLE_COUNT + equality_count + blocker_count
        ),
        "clause_counts": clause_counts,
        "added_clause_count": sum(clause_counts.values()),
        "equality_semantics": (
            "true asserts equal squared distances; false does not assert a "
            "distance inequality"
        ),
        "blocker_semantics": (
            "low[x,p] chooses p != x with s[p,x]; no four p-incident "
            "distances avoiding p,x are one asserted equality class"
        ),
        "full_class_scope": (
            "row links use selected four-shell memberships only; no selected "
            "subset nonmembership is treated as a metric inequality"
        ),
    }
    return {**result, "descriptor_sha256": _sha256_value(result)}


def install(encoding: Any) -> dict[str, Any]:
    """Append the multiplicity extension and return its immutable descriptor."""

    _host_is_compatible(encoding)
    for tag in CLAUSE_TAGS:
        encoding.clause_counts.setdefault(tag, 0)

    before_semantic = tuple(encoding.semantic_vars)
    before_clauses = len(encoding.clauses)
    items = edge_items()
    index_of = _edge_index(items)

    for left, right in itertools.combinations(range(len(items)), 2):
        encoding._new_var(_equality_key(left, right), semantic=False)
    for deleted in range(N):
        for center in range(N):
            if deleted != center:
                encoding._new_var(
                    ("pinned-low-blocker", deleted, center), semantic=False
                )

    # Any two asserted equalities among a triple imply the third.
    for left, middle, right in itertools.combinations(range(len(items)), 3):
        eq_lm = equality_var(encoding, left, middle)
        eq_lr = equality_var(encoding, left, right)
        eq_mr = equality_var(encoding, middle, right)
        _add(encoding, TAG_TRANSITIVITY, (-eq_lm, -eq_mr, eq_lr))
        _add(encoding, TAG_TRANSITIVITY, (-eq_lm, -eq_lr, eq_mr))
        _add(encoding, TAG_TRANSITIVITY, (-eq_lr, -eq_mr, eq_lm))

    # A four-shell row at p has all four p-spokes in one equality class.
    for center in range(N):
        spokes = [point for point in range(N) if point != center]
        for left, right in itertools.combinations(spokes, 2):
            left_item = index_of[_edge(center, left)]
            right_item = index_of[_edge(center, right)]
            _add(
                encoding,
                TAG_ROW,
                (
                    -encoding.var("s", center, left),
                    -encoding.var("s", center, right),
                    equality_var(encoding, left_item, right_item),
                ),
            )

    for deleted in range(N):
        choices = [
            blocker_var(encoding, deleted, center)
            for center in range(N)
            if center != deleted
        ]
        _add(encoding, TAG_BLOCKER_CHOICE, choices)
        for left, right in itertools.combinations(choices, 2):
            _add(encoding, TAG_BLOCKER_CHOICE, (-left, -right))

    for deleted in range(N):
        for center in range(N):
            if center == deleted:
                continue
            blocker = blocker_var(encoding, deleted, center)
            _add(
                encoding,
                TAG_BLOCKER_LINK,
                (-blocker, encoding.var("s", center, deleted)),
            )

    for deleted in range(N):
        for center in range(N):
            if center == deleted:
                continue
            blocker = blocker_var(encoding, deleted, center)
            remaining = [
                point
                for point in range(N)
                if point not in {center, deleted}
            ]
            for four_points in itertools.combinations(remaining, 4):
                anchor = index_of[_edge(center, four_points[0])]
                equalities = [
                    equality_var(
                        encoding,
                        anchor,
                        index_of[_edge(center, point)],
                    )
                    for point in four_points[1:]
                ]
                _add(
                    encoding,
                    TAG_BLOCKER_MULTIPLICITY,
                    (-blocker, *(-equality for equality in equalities)),
                )

    data = descriptor()
    if tuple(encoding.semantic_vars) != before_semantic:
        raise PinnedMultiplicityError("auxiliary extension changed semantic variables")
    if encoding.num_vars != data["total_variable_count"]:
        raise PinnedMultiplicityError("unexpected auxiliary variable count")
    if len(encoding.clauses) - before_clauses != data["added_clause_count"]:
        raise PinnedMultiplicityError("unexpected auxiliary clause count")
    if any(encoding.clause_counts[tag] != count for tag, count in data["clause_counts"].items()):
        raise PinnedMultiplicityError("unexpected auxiliary clause tag count")
    encoding.pinned_multiplicity_clause_start = before_clauses
    return data


def tagged_auxiliary_clauses(encoding: Any) -> Mapping[str, tuple[tuple[int, ...], ...]]:
    """Recover appended clause blocks from their fixed descriptor counts."""

    data = descriptor()
    total = data["added_clause_count"]
    start = getattr(encoding, "pinned_multiplicity_clause_start", None)
    if not isinstance(start, int):
        raise PinnedMultiplicityError("host does not record extension clause start")
    appended = encoding.clauses[start : start + total]
    if len(appended) != total:
        raise PinnedMultiplicityError("host does not contain a complete extension")
    result: dict[str, tuple[tuple[int, ...], ...]] = {}
    cursor = 0
    for tag in CLAUSE_TAGS:
        count = data["clause_counts"][tag]
        result[tag] = tuple(appended[cursor : cursor + count])
        cursor += count
    assert cursor == total
    return result
