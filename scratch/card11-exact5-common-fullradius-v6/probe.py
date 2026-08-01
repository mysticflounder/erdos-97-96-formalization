#!/usr/bin/env python3
"""Theorem-gated full-radius geometric-core obstructions.

This wraps ``scratch/card11-exact5-common-source-indexed`` and adds, at every
labelled center ``c``, a Boolean equality relation on the ten positive incident
edges ``{c,u}`` with ``u != c``.  Reflexivity is implicit, symmetry is obtained
by one canonical variable for each unordered pair, and three Horn clauses per
triple enforce transitivity.

Every selected Census row is required only to be equidistant internally.
Support/outside inequalities are imposed under a concrete source-choice
literal ``y[q,c,row]``: this is exactly when ``c`` is the chosen blocker of
``q``, so ``GeneralCarrierBridge.exactAt_blocker`` proves that the selected row
is the whole radius class.  In particular, the arbitrary selected row at the
first apex may be a proper four-subset of the named exact five-shell.

For every source choice, ``no_qfree`` is encoded directly: after deleting that
source, no four of the remaining positive incident edges may belong to one
equality class.  This deliberately avoids the v1 shortcut that promoted every
selected row to an entire class.

The v3 delta adds a global equality relation on the 55 unordered carrier
edges.  It is seeded only by selected-row internal equalities and the proved
exact-five first-apex shell.  An equivalence extension of those seeds is
forbidden from containing two distinct centers that are each equidistant from
the same three distinct labels: the executable ``duplicateCenterCore``
obstruction proved sound in ``CapSelectedNativeClosureSound.lean``.

The zero-variable v4 delta adds every ``perpendicularBisectorCore`` exclusion:
for each focus pair ``a < b`` and each triple ``p < q < r`` outside the pair,
not all three points may be equidistant from ``a`` and ``b``.  This is exactly
the 55 * C(9,3) clause schema proved geometrically impossible by
``EqualityCore.false_of_convexIndep_of_perpBisectorCore``.

The zero-variable v5 delta adds the complete forward
``ConvexFivePointCore.Core`` exclusion under every boundary-order selector.
For every cyclic five-tuple ``(a,x,b,c,y)`` in the selected order, the four
global equalities in ``ConvexFivePointCore.false_of_core`` (or its reflected
negative-orientation form ``false_of_core_of_neg``) cannot all hold.

The v6 delta adds the complete local U5 incompatibilities audited after v5.
The literal Family A surface has 51,993,900 clauses per shell case, so it is
encoded by exact Tseitin equivalences: a local-four-set variable is true iff
its three star equalities hold, and a q-deleted-pair variable is true iff some
such four-set excludes q and contains the pair.  One guarded incompatibility
then represents all 21² literal clauses for each (source choice,t,x).  Family B
is emitted directly.  All helpers are definitions in both directions, so the
compact CNF has exactly the same projections onto the v5 variables as the
literal theorem-family expansion.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Mapping


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
SOURCE_DIR = REPO_ROOT / "scratch" / "card11-exact5-common-source-indexed"
_source_spec = importlib.util.spec_from_file_location(
    "card11_exact5_common_source_indexed", SOURCE_DIR / "probe.py"
)
if _source_spec is None or _source_spec.loader is None:
    raise RuntimeError("could not load source-indexed common-shell lane")
source = importlib.util.module_from_spec(_source_spec)
sys.modules[_source_spec.name] = source
_source_spec.loader.exec_module(source)


SCHEMA = "card11_exact5_common_fullradius.v6"
LABELS = tuple(range(source.base.profile.N))
EXPECTED_EQUALITY_VARIABLES = len(LABELS) * (len(LABELS) - 1) * (len(LABELS) - 2) // 2
GLOBAL_EDGES = tuple(itertools.combinations(LABELS, 2))
EXPECTED_GLOBAL_EQUALITY_VARIABLES = len(GLOBAL_EDGES) * (len(GLOBAL_EDGES) - 1) // 2
EXPECTED_PERPENDICULAR_BISECTOR_CLAUSES = (
    len(GLOBAL_EDGES) * len(tuple(itertools.combinations(range(len(LABELS) - 2), 3)))
)
EXPECTED_CONVEX_FIVE_POINT_CORE_NAIVE_CLAUSES = (
    144 * len(LABELS)
    * len(tuple(itertools.combinations(range(len(LABELS) - 1), 4)))
)
EXPECTED_LOCAL_FOUR_CLASS_VARIABLES = (
    len(LABELS) * len(tuple(itertools.combinations(range(len(LABELS) - 1), 4)))
)
EXPECTED_QDELETED_PAIR_VARIABLES = (
    len(LABELS) * (len(LABELS) - 1)
    * len(tuple(itertools.combinations(range(len(LABELS) - 2), 2)))
)
EXPECTED_SOURCE_CHOICES = 6550
EXPECTED_FAMILY_A_LOGICAL_CLAUSES = (
    EXPECTED_SOURCE_CHOICES * 3 * 6 * 21 * 21
)
EXPECTED_FAMILY_A_COMPACT_CLAUSES = EXPECTED_SOURCE_CHOICES * 3 * 6
EXPECTED_FAMILY_B_CLAUSES = EXPECTED_SOURCE_CHOICES * 6


class ProbeError(RuntimeError):
    pass


@dataclass(frozen=True)
class SolverResult:
    verdict: str
    returncode: int
    stdout: str
    stderr: str
    wall_seconds: float


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def write_json(path: Path, value: object) -> None:
    write_text(path, json.dumps(value, sort_keys=True, indent=2) + "\n")


def incident_labels(center: int) -> tuple[int, ...]:
    return tuple(label for label in LABELS if label != center)


def equality_key(center: int, left: int, right: int) -> tuple[int, int, int]:
    if left == right or center in (left, right):
        raise ProbeError("equality variables compare two distinct positive incident edges")
    return center, min(left, right), max(left, right)


def edge_key(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ProbeError("global equality uses nonloop carrier edges")
    return min(left, right), max(left, right)


def global_equality_key(
    first: tuple[int, int], second: tuple[int, int]
) -> tuple[tuple[int, int], tuple[int, int]]:
    first = edge_key(*first)
    second = edge_key(*second)
    if first == second:
        raise ProbeError("global equality variable compares distinct edges")
    return tuple(sorted((first, second)))


def add_clause_block(instance, blocks: list[dict], name: str, callback) -> None:
    before = len(instance.cnf.clauses)
    callback()
    after = len(instance.cnf.clauses)
    blocks.append({
        "name": name,
        "first_clause_1based": before + 1,
        "last_clause_1based": after,
        "clause_count": after - before,
    })


def add_full_radius_layer(
    instance,
    separation,
    shell,
    indexed: Mapping[str, object],
    *,
    include_no_qfree: bool = True,
    include_global_transitivity: bool = True,
    include_duplicate_center_core: bool = True,
    include_perpendicular_bisector_core: bool = True,
    include_convex_five_point_core: bool = True,
    include_u5_nontriple_equilateral: bool = True,
    include_u5_common_bisector_triple: bool = True,
) -> dict:
    """Add local distance partitions and precisely gated blocker semantics."""

    blocks: list[dict] = []
    equality: dict[tuple[int, int, int], int] = {}
    variables_before = instance.cnf.n

    for center in LABELS:
        for left, right in itertools.combinations(incident_labels(center), 2):
            equality[(center, left, right)] = instance.cnf.new_var()

    if len(equality) != EXPECTED_EQUALITY_VARIABLES:
        raise ProbeError("unexpected equality-variable count")

    def eq(center: int, left: int, right: int) -> int:
        return equality[equality_key(center, left, right)]

    def equivalence_clauses() -> None:
        for center in LABELS:
            for a, b, d in itertools.combinations(incident_labels(center), 3):
                ab, ad, bd = eq(center, a, b), eq(center, a, d), eq(center, b, d)
                instance.cnf.add([-ab, -ad, bd])
                instance.cnf.add([-ab, -bd, ad])
                instance.cnf.add([-ad, -bd, ab])

    add_clause_block(instance, blocks, "local-equality-transitivity", equivalence_clauses)

    def selected_row_internal_equalities() -> None:
        for center in LABELS:
            for row_index, raw_support in enumerate(instance.cand[center]):
                support = set(raw_support)
                selector = instance.x[(center, row_index)]
                for left, right in itertools.combinations(sorted(support), 2):
                    instance.cnf.add([-selector, eq(center, left, right)])

    add_clause_block(
        instance, blocks, "selected-row-internal-radius-equalities",
        selected_row_internal_equalities,
    )

    choices = indexed["choices"]
    choices_by_source_center: dict[tuple[int, int], list] = {}
    for choice in choices:
        choices_by_source_center.setdefault(
            (choice.source, choice.center), []
        ).append(choice)

    source_center = {
        key: instance.cnf.new_var()
        for key in sorted(choices_by_source_center)
    }

    def source_center_semantics() -> None:
        for key, center_choices in choices_by_source_center.items():
            map_var = source_center[key]
            for choice in center_choices:
                instance.cnf.add([-choice.variable, map_var])
            instance.cnf.add(
                [-map_var] + [choice.variable for choice in center_choices]
            )

    add_clause_block(
        instance, blocks, "source-center-iff-some-source-row-choice",
        source_center_semantics,
    )

    used = {center: instance.cnf.new_var() for center in LABELS}

    def used_center_semantics() -> None:
        for center in LABELS:
            maps = [
                map_var for (source_label, mapped_center), map_var
                in source_center.items()
                if mapped_center == center
            ]
            for map_var in maps:
                instance.cnf.add([-map_var, used[center]])
            instance.cnf.add([-used[center]] + maps)

    add_clause_block(
        instance, blocks, "used-center-iff-some-source-center-map",
        used_center_semantics,
    )

    def exact_blocker_rows() -> None:
        for center in LABELS:
            for row_index, raw_support in enumerate(instance.cand[center]):
                support = set(raw_support)
                outside = set(incident_labels(center)) - support
                selector = instance.x[(center, row_index)]
                for inside in sorted(support):
                    for other in sorted(outside):
                        instance.cnf.add([
                            -used[center], -selector,
                            -eq(center, inside, other),
                        ])

    add_clause_block(
        instance, blocks, "source-choice-implies-entire-blocker-radius-class",
        exact_blocker_rows,
    )

    if include_no_qfree:
        def no_qfree_clauses() -> None:
            for (source_label, center), map_var in source_center.items():
                remaining = [
                    label for label in incident_labels(center)
                    if label != source_label
                ]
                for quad in itertools.combinations(remaining, 4):
                    anchor = quad[0]
                    instance.cnf.add([
                        -map_var,
                        -eq(center, anchor, quad[1]),
                        -eq(center, anchor, quad[2]),
                        -eq(center, anchor, quad[3]),
                    ])

        add_clause_block(
            instance, blocks,
            "source-choice-no-qfree-after-that-source-deletion",
            no_qfree_clauses,
        )

    if shell is not None:
        def exact_first_apex_shell() -> None:
            center = source.base.profile.V
            support = set(shell["u5"])
            incident = set(incident_labels(center))
            if center in support or len(support) != 5:
                raise ProbeError("first-apex shell must be five positive incident edges")
            outside = incident - support
            for left, right in itertools.combinations(sorted(support), 2):
                instance.cnf.add([eq(center, left, right)])
            for inside in sorted(support):
                for other in sorted(outside):
                    instance.cnf.add([-eq(center, inside, other)])

        add_clause_block(instance, blocks, "first-apex-named-exact-five-entire-class", exact_first_apex_shell)

    # Preserve the complete v2 variable/clause prefix.  Every v3 variable and
    # clause begins here.
    global_equality = {
        (first, second): instance.cnf.new_var()
        for first, second in itertools.combinations(GLOBAL_EDGES, 2)
    }
    if len(global_equality) != EXPECTED_GLOBAL_EQUALITY_VARIABLES:
        raise ProbeError("unexpected global equality-variable count")

    def global_eq(
        first: tuple[int, int], second: tuple[int, int]
    ) -> int:
        return global_equality[global_equality_key(first, second)]

    if include_global_transitivity:
        def global_equivalence_clauses() -> None:
            for first, second, third in itertools.combinations(GLOBAL_EDGES, 3):
                fs = global_eq(first, second)
                ft = global_eq(first, third)
                st = global_eq(second, third)
                instance.cnf.add([-fs, -ft, st])
                instance.cnf.add([-fs, -st, ft])
                instance.cnf.add([-ft, -st, fs])

        add_clause_block(
            instance, blocks, "global-edge-equality-transitivity",
            global_equivalence_clauses,
        )

    def selected_row_global_equality_seeds() -> None:
        for center in LABELS:
            for row_index, raw_support in enumerate(instance.cand[center]):
                selector = instance.x[(center, row_index)]
                for left, right in itertools.combinations(sorted(raw_support), 2):
                    instance.cnf.add([
                        -selector,
                        global_eq(edge_key(center, left), edge_key(center, right)),
                    ])

    add_clause_block(
        instance, blocks, "selected-row-global-equality-seeds",
        selected_row_global_equality_seeds,
    )

    if shell is not None:
        def exact_five_global_equality_seeds() -> None:
            center = source.base.profile.V
            for left, right in itertools.combinations(sorted(shell["u5"]), 2):
                instance.cnf.add([
                    global_eq(edge_key(center, left), edge_key(center, right))
                ])

        add_clause_block(
            instance, blocks, "first-apex-exact-five-global-equality-seeds",
            exact_five_global_equality_seeds,
        )

    if include_duplicate_center_core:
        def duplicate_center_core_exclusions() -> None:
            for p, q, r in itertools.combinations(LABELS, 3):
                centers = [
                    center for center in LABELS
                    if center not in {p, q, r}
                ]
                for first_center, second_center in itertools.combinations(centers, 2):
                    instance.cnf.add([
                        -global_eq(
                            edge_key(first_center, p),
                            edge_key(first_center, q),
                        ),
                        -global_eq(
                            edge_key(first_center, p),
                            edge_key(first_center, r),
                        ),
                        -global_eq(
                            edge_key(second_center, p),
                            edge_key(second_center, q),
                        ),
                        -global_eq(
                            edge_key(second_center, p),
                            edge_key(second_center, r),
                        ),
                    ])

        add_clause_block(
            instance, blocks, "duplicate-center-core-exclusions",
            duplicate_center_core_exclusions,
        )

    if include_perpendicular_bisector_core:
        def perpendicular_bisector_core_exclusions() -> None:
            for a, b in itertools.combinations(LABELS, 2):
                outside = [label for label in LABELS if label not in {a, b}]
                for p, q, r in itertools.combinations(outside, 3):
                    instance.cnf.add([
                        -global_eq(edge_key(p, a), edge_key(p, b)),
                        -global_eq(edge_key(q, a), edge_key(q, b)),
                        -global_eq(edge_key(r, a), edge_key(r, b)),
                    ])

        add_clause_block(
            instance, blocks, "perpendicular-bisector-core-exclusions",
            perpendicular_bisector_core_exclusions,
        )
        actual_count = blocks[-1]["clause_count"]
        if actual_count != EXPECTED_PERPENDICULAR_BISECTOR_CLAUSES:
            raise ProbeError(
                "unexpected perpendicular-bisector-core clause count: "
                f"{actual_count}"
            )

    pre_convex_prefix_variables = instance.cnf.n
    pre_convex_prefix_clauses = len(instance.cnf.clauses)
    convex_five_point_core_naive_count = 0
    convex_five_point_core_deduplicated_count = 0
    if include_convex_five_point_core:
        def convex_five_point_core_exclusions() -> None:
            nonlocal convex_five_point_core_naive_count
            nonlocal convex_five_point_core_deduplicated_count
            seen: set[tuple[int, ...]] = set()
            for order, selector in separation.order_to_selector.items():
                labels = tuple(order.labels)
                if len(labels) != len(LABELS) or set(labels) != set(LABELS):
                    raise ProbeError("boundary order is not a permutation of the labels")
                for start, a in enumerate(labels):
                    cyclic_tail = labels[start + 1:] + labels[:start]
                    for indices in itertools.combinations(
                        range(len(cyclic_tail)), 4
                    ):
                        x, b, c, y = tuple(
                            cyclic_tail[index] for index in indices
                        )
                        if len({a, x, b, c, y}) != 5:
                            raise ProbeError("convex-five tuple is not label-distinct")
                        clause = (
                            -selector,
                            -global_eq(edge_key(x, a), edge_key(x, b)),
                            -global_eq(edge_key(y, a), edge_key(y, b)),
                            -global_eq(edge_key(c, b), edge_key(c, x)),
                            -global_eq(edge_key(c, b), edge_key(c, y)),
                        )
                        if len(set(clause)) != 5:
                            raise ProbeError(
                                "convex-five exclusion has repeated literals"
                            )
                        convex_five_point_core_naive_count += 1
                        canonical = tuple(sorted(clause))
                        if canonical in seen:
                            continue
                        seen.add(canonical)
                        instance.cnf.add(list(clause))
                        convex_five_point_core_deduplicated_count += 1

        add_clause_block(
            instance, blocks, "convex-five-point-core-forward-exclusions",
            convex_five_point_core_exclusions,
        )
        actual_count = blocks[-1]["clause_count"]
        if (
            convex_five_point_core_naive_count
            != EXPECTED_CONVEX_FIVE_POINT_CORE_NAIVE_CLAUSES
        ):
            raise ProbeError(
                "unexpected convex-five naive clause count: "
                f"{convex_five_point_core_naive_count}"
            )
        if actual_count != convex_five_point_core_deduplicated_count:
            raise ProbeError("convex-five dedup count disagrees with clause block")

    pre_v6_prefix_variables = instance.cnf.n
    pre_v6_prefix_clauses = len(instance.cnf.clauses)

    # Exact definitional factorization of the 51,993,900 literal Family A
    # clauses.  local_four[(c,B)] iff the four incident edges c--B have one
    # length, using three star equalities.  qdeleted_pair[(q,c,{p,x})] iff
    # some such B excludes q and contains p,x.
    local_four: dict[tuple[int, tuple[int, ...]], int] = {}
    for center in LABELS:
        for support in itertools.combinations(incident_labels(center), 4):
            local_four[(center, support)] = instance.cnf.new_var()
    if len(local_four) != EXPECTED_LOCAL_FOUR_CLASS_VARIABLES:
        raise ProbeError("unexpected local-four-class helper count")

    def local_four_class_definitions() -> None:
        for (center, support), helper in sorted(local_four.items()):
            anchor = support[0]
            equalities = [eq(center, anchor, other) for other in support[1:]]
            if len(equalities) != 3 or len(set(equalities)) != 3:
                raise ProbeError("bad local-four-class star")
            for equality_variable in equalities:
                instance.cnf.add([-helper, equality_variable])
            instance.cnf.add([helper] + [-variable for variable in equalities])

    add_clause_block(
        instance, blocks, "v6-local-four-class-witness-iff",
        local_four_class_definitions,
    )
    if blocks[-1]["clause_count"] != 4 * EXPECTED_LOCAL_FOUR_CLASS_VARIABLES:
        raise ProbeError("unexpected local-four-class definition count")

    qdeleted_pair: dict[tuple[int, int, int, int], int] = {}
    for deleted in LABELS:
        for center in LABELS:
            if center == deleted:
                continue
            available = [
                label for label in LABELS if label not in {deleted, center}
            ]
            for first, second in itertools.combinations(available, 2):
                qdeleted_pair[(deleted, center, first, second)] = (
                    instance.cnf.new_var()
                )
    if len(qdeleted_pair) != EXPECTED_QDELETED_PAIR_VARIABLES:
        raise ProbeError("unexpected q-deleted-pair helper count")

    def qpair(deleted: int, center: int, first: int, second: int) -> int:
        if first == second:
            raise ProbeError("q-deleted pair repeats a label")
        return qdeleted_pair[
            (deleted, center, min(first, second), max(first, second))
        ]

    def qdeleted_pair_definitions() -> None:
        for (deleted, center, first, second), helper in sorted(
            qdeleted_pair.items()
        ):
            extras = [
                label for label in LABELS
                if label not in {deleted, center, first, second}
            ]
            witnesses = [
                local_four[(center, tuple(sorted((first, second, a, b))))]
                for a, b in itertools.combinations(extras, 2)
            ]
            if len(witnesses) != 21 or len(set(witnesses)) != 21:
                raise ProbeError("bad q-deleted-pair witness surface")
            for witness in witnesses:
                instance.cnf.add([-witness, helper])
            instance.cnf.add([-helper] + witnesses)

    add_clause_block(
        instance, blocks, "v6-qdeleted-pair-witness-iff",
        qdeleted_pair_definitions,
    )
    expected_qpair_definition_clauses = 22 * EXPECTED_QDELETED_PAIR_VARIABLES
    if blocks[-1]["clause_count"] != expected_qpair_definition_clauses:
        raise ProbeError("unexpected q-deleted-pair definition count")

    family_a_compact_count = 0
    family_a_logical_count = 0
    if include_u5_nontriple_equilateral:
        def u5_nontriple_equilateral_incompatibilities() -> None:
            nonlocal family_a_compact_count, family_a_logical_count
            for choice in indexed["choices"]:
                deleted = choice.source
                center = choice.center
                support = set(instance.cand[center][choice.row_index])
                if (
                    len(support) != 4
                    or deleted not in support
                    or center in support
                ):
                    raise ProbeError("malformed source choice for Family A")
                triple = sorted(support - {deleted})
                outside = sorted(set(LABELS) - support - {center})
                if len(triple) != 3 or len(outside) != 6:
                    raise ProbeError("unexpected Family A premise cardinality")
                for member in triple:
                    for off_circle in outside:
                        instance.cnf.add([
                            -choice.variable,
                            -qpair(deleted, member, center, off_circle),
                            -qpair(deleted, off_circle, center, member),
                        ])
                        family_a_compact_count += 1
                        family_a_logical_count += 21 * 21

        add_clause_block(
            instance, blocks,
            "v6-u5-nontriple-equilateral-incompatibilities",
            u5_nontriple_equilateral_incompatibilities,
        )
        if family_a_compact_count != EXPECTED_FAMILY_A_COMPACT_CLAUSES:
            raise ProbeError("unexpected compact Family A clause count")
        if family_a_logical_count != EXPECTED_FAMILY_A_LOGICAL_CLAUSES:
            raise ProbeError("unexpected logical Family A clause count")

    family_b_count = 0
    if include_u5_common_bisector_triple:
        def u5_common_bisector_triple_incompatibilities() -> None:
            nonlocal family_b_count
            for choice in indexed["choices"]:
                deleted = choice.source
                center = choice.center
                support = set(instance.cand[center][choice.row_index])
                if (
                    len(support) != 4
                    or deleted not in support
                    or center in support
                ):
                    raise ProbeError("malformed source choice for Family B")
                triple = sorted(support - {deleted})
                outside = sorted(set(LABELS) - support - {center})
                if len(triple) != 3 or len(outside) != 6:
                    raise ProbeError("unexpected Family B premise cardinality")
                for off_circle in outside:
                    instance.cnf.add(
                        [-choice.variable]
                        + [-eq(off_circle, center, member) for member in triple]
                    )
                    family_b_count += 1

        add_clause_block(
            instance, blocks,
            "v6-u5-common-bisector-triple-incompatibilities",
            u5_common_bisector_triple_incompatibilities,
        )
        if family_b_count != EXPECTED_FAMILY_B_CLAUSES:
            raise ProbeError("unexpected Family B clause count")

    return {
        "equality": equality,
        "eq": eq,
        "source_center": source_center,
        "used": used,
        "global_equality": global_equality,
        "global_eq": global_eq,
        "clause_blocks": blocks,
        "added_variables": instance.cnf.n - variables_before,
        "include_no_qfree": include_no_qfree,
        "include_global_transitivity": include_global_transitivity,
        "include_duplicate_center_core": include_duplicate_center_core,
        "include_perpendicular_bisector_core":
            include_perpendicular_bisector_core,
        "include_convex_five_point_core": include_convex_five_point_core,
        "include_u5_nontriple_equilateral":
            include_u5_nontriple_equilateral,
        "include_u5_common_bisector_triple":
            include_u5_common_bisector_triple,
        "pre_convex_prefix_variables": pre_convex_prefix_variables,
        "pre_convex_prefix_clauses": pre_convex_prefix_clauses,
        "convex_five_point_core_naive_count":
            convex_five_point_core_naive_count,
        "convex_five_point_core_deduplicated_count":
            convex_five_point_core_deduplicated_count,
        "pre_v6_prefix_variables": pre_v6_prefix_variables,
        "pre_v6_prefix_clauses": pre_v6_prefix_clauses,
        "local_four": local_four,
        "qdeleted_pair": qdeleted_pair,
        "family_a_compact_count": family_a_compact_count,
        "family_a_logical_count": family_a_logical_count,
        "family_b_count": family_b_count,
    }


def build_manifest(instance, separation, shell, indexed, layer) -> dict:
    equality_rows = [
        {"center": center, "left": left, "right": right, "variable": variable}
        for (center, left, right), variable in sorted(layer["equality"].items())
    ]
    global_equality_rows = [
        {
            "first_edge": list(first),
            "second_edge": list(second),
            "variable": variable,
        }
        for (first, second), variable
        in sorted(layer["global_equality"].items())
    ]
    x_rows = [
        {
            "center": center,
            "row_index": row_index,
            "support": sorted(instance.cand[center][row_index]),
            "variable": instance.x[(center, row_index)],
        }
        for center in LABELS
        for row_index in range(len(instance.cand[center]))
    ]
    source_choices = [
        {
            "source": choice.source,
            "center": choice.center,
            "row_index": choice.row_index,
            "variable": choice.variable,
        }
        for choice in indexed["choices"]
    ]
    orders = [
        {
            "variable": variable,
            "orientation": order.orientation,
            "internal_index": order.internal_index,
            "labels": list(order.labels),
        }
        for order, variable in separation.order_to_selector.items()
    ]
    local_four_rows = [
        {
            "center": center,
            "support": list(support),
            "variable": variable,
        }
        for (center, support), variable in sorted(layer["local_four"].items())
    ]
    qdeleted_pair_rows = [
        {
            "deleted": deleted,
            "center": center,
            "first": first,
            "second": second,
            "variable": variable,
        }
        for (deleted, center, first, second), variable
        in sorted(layer["qdeleted_pair"].items())
    ]
    return {
        "schema": SCHEMA,
        "carrier_labels": list(LABELS),
        "center_exclusion_and_positive_radius": (
            "at center c the universe is exactly the ten unordered edges {c,u} with u != c; "
            "distinct carrier labels make these edges positive-length, so the center is never a shell member"
        ),
        "equality_semantics": (
            "one canonical Boolean per unordered pair of distinct incident edges; reflexivity is implicit, "
            "symmetry is canonicalization, and all three transitivity implications are emitted per triple"
        ),
        "selected_row_semantics": (
            "every positive x[c,row] forces its six internal equalities only; "
            "for each positive y[q,c,row], exactAt_blocker additionally forces all "
            "24 support/outside inequalities, making precisely that blocker row an entire class"
        ),
        "no_qfree_semantics": (
            "map[q,c] iff some y[q,c,row], used[c] iff some map[q,c]; for each "
            "positive map[q,c], every four-subset of the nine positive incident "
            "labels remaining after deleting q is forbidden from one equality class"
            if layer["include_no_qfree"] else
            "DISABLED ONLY FOR A MUTATION-CONTROL SELF-TEST"
        ),
        "first_apex_shell_semantics": (
            "the named five labels are exactly one local class at center V, with every incident outside edge unequal"
            if shell is not None else "no named exact-five shell in this base/self-test instance"
        ),
        "global_equality_semantics": (
            "one canonical Boolean per unordered pair of the 55 nonloop carrier "
            "edges; reflexivity is implicit and symmetry is canonicalization; "
            "selected-row internal equalities and the exact-five shell are the "
            "only seeds; an equivalence extension exists exactly when the least "
            "seeded closure avoids duplicateCenterCore"
        ),
        "duplicate_center_core_semantics": (
            "for every three distinct labels p,q,r and two distinct centers "
            "outside {p,q,r}, forbid both centers from having incident edges to "
            "p,q,r in one global equality class"
            if layer["include_duplicate_center_core"] else
            "DISABLED ONLY FOR A MUTATION-CONTROL SELF-TEST"
        ),
        "perpendicular_bisector_core_semantics": (
            "for every focus pair a<b and every three distinct points p<q<r "
            "outside {a,b}, forbid all three equalities "
            "dist(p,a)=dist(p,b), dist(q,a)=dist(q,b), and "
            "dist(r,a)=dist(r,b)"
            if layer["include_perpendicular_bisector_core"] else
            "DISABLED ONLY FOR A MUTATION-CONTROL SELF-TEST"
        ),
        "convex_five_point_core_semantics": (
            "for every selected boundary order and every five distinct labels "
            "occurring cyclically as (a,x,b,c,y), forbid simultaneous global "
            "equalities xa=xb, ya=yb, cb=cx, and cb=cy; the live signed-area "
            "convention makes a forward tuple in either stored selector order "
            "negative, so ConvexFivePointCore.false_of_core_of_neg applies "
            "(and false_of_core covers the reversed positive orientation)"
            if layer["include_convex_five_point_core"] else
            "DISABLED ONLY FOR A MUTATION-CONTROL SELF-TEST"
        ),
        "v6_local_four_class_semantics": (
            "helper h[c,B] is true iff the four incident edges from c to B "
            "have one local length; both directions are encoded using the "
            "three star equalities from the least label of B"
        ),
        "v6_qdeleted_pair_semantics": (
            "helper w[q,c,{p,x}] is true iff some four-set B excludes q and c, "
            "contains p and x, and h[c,B] is true; all 21 witnesses and both "
            "directions of the disjunction equivalence are encoded"
        ),
        "u5_nontriple_equilateral_semantics": (
            "for every y[q,p,R], t in R-minus-q, and x outside R union {p}, "
            "forbid y together with q-deleted local four-classes containing "
            "{p,x} at t and {p,t} at x; this compact incompatibility is "
            "projection-equivalent to all 21 squared audited literal clauses"
            if layer["include_u5_nontriple_equilateral"] else
            "DISABLED ONLY FOR A MUTATION-CONTROL SELF-TEST"
        ),
        "u5_common_bisector_triple_semantics": (
            "for every y[q,p,{q,t1,t2,t3}] and x outside its support and p, "
            "forbid E_x(p,t1), E_x(p,t2), and E_x(p,t3) simultaneously"
            if layer["include_u5_common_bisector_triple"] else
            "DISABLED ONLY FOR A MUTATION-CONTROL SELF-TEST"
        ),
        "pre_convex_prefix_variables":
            layer["pre_convex_prefix_variables"],
        "pre_convex_prefix_clauses": layer["pre_convex_prefix_clauses"],
        "convex_five_point_core_naive_count":
            layer["convex_five_point_core_naive_count"],
        "convex_five_point_core_deduplicated_count":
            layer["convex_five_point_core_deduplicated_count"],
        "pre_v6_prefix_variables": layer["pre_v6_prefix_variables"],
        "pre_v6_prefix_clauses": layer["pre_v6_prefix_clauses"],
        "v6_local_four_class_variable_count": len(local_four_rows),
        "v6_qdeleted_pair_variable_count": len(qdeleted_pair_rows),
        "v6_family_a_literal_clause_count": layer["family_a_logical_count"],
        "v6_family_a_compact_clause_count": layer["family_a_compact_count"],
        "v6_family_b_clause_count": layer["family_b_count"],
        "variables": instance.cnf.n,
        "clauses": len(instance.cnf.clauses),
        "clause_blocks": layer["clause_blocks"],
        "equality_variables": equality_rows,
        "global_edge_equality_variables": global_equality_rows,
        "source_center_variables": [
            {
                "source": source_label,
                "center": center,
                "variable": variable,
            }
            for (source_label, center), variable
            in sorted(layer["source_center"].items())
        ],
        "used_center_variables": {
            str(center): variable
            for center, variable in sorted(layer["used"].items())
        },
        "selected_rows": x_rows,
        "source_choices": source_choices,
        "v6_local_four_class_variables": local_four_rows,
        "v6_qdeleted_pair_variables": qdeleted_pair_rows,
        "order_selectors": orders,
        "shell": shell,
    }


def build_instance(
    surplus_shell: int | None = None,
    other_shell: int | None = None,
    *,
    include_no_qfree: bool = True,
    include_global_transitivity: bool = True,
    include_duplicate_center_core: bool = True,
    include_perpendicular_bisector_core: bool = True,
    include_convex_five_point_core: bool = True,
    include_u5_nontriple_equilateral: bool = True,
    include_u5_common_bisector_triple: bool = True,
):
    instance, separation, shell, indexed, inherited_schema = source.build_instance(
        surplus_shell, other_shell
    )
    clauses_before = len(instance.cnf.clauses)
    variables_before = instance.cnf.n
    layer = add_full_radius_layer(
        instance, separation, shell, indexed,
        include_no_qfree=include_no_qfree,
        include_global_transitivity=include_global_transitivity,
        include_duplicate_center_core=include_duplicate_center_core,
        include_perpendicular_bisector_core=
            include_perpendicular_bisector_core,
        include_convex_five_point_core=include_convex_five_point_core,
        include_u5_nontriple_equilateral=include_u5_nontriple_equilateral,
        include_u5_common_bisector_triple=include_u5_common_bisector_triple,
    )
    manifest = build_manifest(instance, separation, shell, indexed, layer)
    manifest["inherited_schema"] = inherited_schema
    manifest["inherited_variables"] = variables_before
    manifest["inherited_clauses"] = clauses_before
    manifest["fullradius_added_variables"] = instance.cnf.n - variables_before
    manifest["fullradius_added_clauses"] = len(instance.cnf.clauses) - clauses_before
    return instance, separation, shell, indexed, layer, manifest


def parse_assignment(output: str) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in output.splitlines():
        if not line.startswith("v "):
            continue
        for token in line[2:].split():
            literal = int(token)
            if literal == 0:
                continue
            variable = abs(literal)
            value = literal > 0
            if variable in assignment and assignment[variable] != value:
                raise ProbeError(f"conflicting assignments for variable {variable}")
            assignment[variable] = value
    return assignment


def write_model_artifact(path: Path, assignment: dict[int, bool]) -> None:
    write_json(path, {
        "schema": f"{SCHEMA}.model.v1",
        "variable_count": len(assignment),
        "signed_literals": [
            variable if assignment[variable] else -variable
            for variable in sorted(assignment)
        ],
    })


def run_cadical(cnf_path: Path, proof_path: Path, timeout: int) -> tuple[SolverResult, list[str]]:
    command = ["cadical", "-q", "-t", str(timeout), str(cnf_path), str(proof_path)]
    started = time.monotonic()
    try:
        completed = subprocess.run(
            command, capture_output=True, text=True, timeout=timeout + 30
        )
    except subprocess.TimeoutExpired as error:
        return SolverResult(
            "TIMEOUT", 124, error.stdout or "", error.stderr or "",
            time.monotonic() - started,
        ), command
    if completed.returncode == 10:
        verdict = "SAT"
    elif completed.returncode == 20:
        verdict = "UNSAT"
    elif completed.returncode == 0:
        verdict = "UNKNOWN"
    else:
        verdict = "ERROR"
    return SolverResult(
        verdict, completed.returncode, completed.stdout, completed.stderr,
        time.monotonic() - started,
    ), command


def source_provenance() -> dict[str, dict[str, str]]:
    paths = {
        "fullradius_driver": Path(__file__).resolve(),
        "independent_verifier": HERE / "verify_artifact.py",
        "v5_fullradius_driver": (
            REPO_ROOT / "scratch/card11-exact5-common-fullradius-v5/probe.py"
        ),
        "v5_post_theorem_bank_audit": (
            REPO_ROOT
            / "scratch/card11-exact5-common-fullradius-v5/"
            "POST_V5_THEOREM_BANK_AUDIT.md"
        ),
        "source_indexed_driver": Path(source.__file__).resolve(),
        "common_projection_driver": Path(source.base.__file__).resolve(),
        "census_profile": Path(source.base.profile.__file__).resolve(),
        "cover_encoder": Path(source.base.sat_cover.__file__).resolve(),
        "separation_encoder": Path(source.base.separation_encoding.__file__).resolve(),
        "critical_shell_interface": (
            REPO_ROOT / "lean/Erdos9796Proof/P97/U1CarrierInjection.lean"
        ),
        "duplicate_center_core": (
            REPO_ROOT / "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean"
        ),
        "duplicate_center_core_executable": (
            REPO_ROOT
            / "lean/Erdos9796Proof/P97/Census554/CapSelectedNativeClassifier.lean"
        ),
        "duplicate_center_core_soundness": (
            REPO_ROOT
            / "lean/Erdos9796Proof/P97/Census554/CapSelectedNativeClosureSound.lean"
        ),
        "perpendicular_bisector_core": (
            REPO_ROOT / "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean"
        ),
        "perpendicular_bisector_core_executable": (
            REPO_ROOT
            / "lean/Erdos9796Proof/P97/Census554/CapSelectedNativeClassifier.lean"
        ),
        "perpendicular_bisector_core_soundness": (
            REPO_ROOT
            / "lean/Erdos9796Proof/P97/Census554/CapSelectedNativeClosureSound.lean"
        ),
        "convex_five_point_core": (
            REPO_ROOT
            / "lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean"
        ),
        "ordered_core_signs": (
            REPO_ROOT
            / "lean/Erdos9796Proof/P97/EndpointCertificate/OrderedCoreSigns.lean"
        ),
        "u5_global_incidence_kernels": (
            REPO_ROOT
            / "lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean"
        ),
    }
    return {
        name: {"path": str(path), "sha256": sha256_file(path)}
        for name, path in paths.items()
    }


def run_independent_verifier(case_dir: Path, timeout: int = 600) -> dict:
    command = [
        sys.executable, str(HERE / "verify_artifact.py"), str(case_dir),
        "--timeout", str(timeout),
    ]
    completed = subprocess.run(
        command, capture_output=True, text=True, timeout=timeout + 30
    )
    if completed.returncode != 0:
        raise ProbeError(
            "independent verifier failed: "
            f"returncode={completed.returncode}, stdout={completed.stdout[-500:]!r}, "
            f"stderr={completed.stderr[-500:]!r}"
        )
    return json.loads((case_dir / "verification.json").read_text(encoding="utf-8"))


def run_case(s: int, o: int, timeout: int, output_root: Path) -> dict:
    case_dir = output_root / "runs" / source.common_shell_name(s, o)
    case_dir.mkdir(parents=True, exist_ok=True)
    instance, separation, shell, indexed, layer, manifest = build_instance(s, o)
    cnf_path = case_dir / "input.cnf"
    proof_path = case_dir / "proof.drat"
    write_text(cnf_path, instance.dimacs())
    write_json(case_dir / "manifest.json", manifest)
    result, command = run_cadical(cnf_path, proof_path, timeout)
    write_text(case_dir / "cadical.stdout", result.stdout)
    write_text(case_dir / "cadical.stderr", result.stderr)
    if result.verdict == "SAT":
        write_model_artifact(case_dir / "model.json", parse_assignment(result.stdout))
    record = {
        "schema": SCHEMA,
        "case": {"s": s, "o": o},
        "verdict": result.verdict,
        "returncode": result.returncode,
        "wall_seconds": result.wall_seconds,
        "command": command,
        "variables": instance.cnf.n,
        "clauses": len(instance.cnf.clauses),
        "cnf_sha256": sha256_file(cnf_path),
        "manifest_sha256": sha256_file(case_dir / "manifest.json"),
        "proof_sha256": sha256_file(proof_path) if proof_path.exists() else None,
        "proof_bytes": proof_path.stat().st_size if proof_path.exists() else 0,
        "model_sha256": (
            sha256_file(case_dir / "model.json")
            if (case_dir / "model.json").exists() else None
        ),
    }
    write_json(case_dir / "result.json", record)
    verification = run_independent_verifier(case_dir)
    record["independent_verification"] = verification
    write_json(case_dir / "result.json", record)
    write_json(case_dir / "provenance.json", {
        "schema": SCHEMA,
        "source_provenance": source_provenance(),
        "artifact_hashes": {
            "input.cnf": sha256_file(cnf_path),
            "manifest.json": sha256_file(case_dir / "manifest.json"),
            "cadical.stdout": sha256_file(case_dir / "cadical.stdout"),
            "cadical.stderr": sha256_file(case_dir / "cadical.stderr"),
            "proof.drat": sha256_file(proof_path) if proof_path.exists() else None,
            "model.json": (
                sha256_file(case_dir / "model.json")
                if (case_dir / "model.json").exists() else None
            ),
            "verification.json": sha256_file(case_dir / "verification.json"),
        },
    })
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument(
        "--case", action="append",
        choices=[source.common_shell_name(s, o) for s, o in source.base.SHELL_CASES],
    )
    parser.add_argument("--output-root", type=Path, default=HERE)
    args = parser.parse_args()
    if not 1 <= args.timeout <= 1800:
        raise SystemExit("--timeout must be in [1, 1800]")
    selected = [
        pair for pair in source.base.SHELL_CASES
        if not args.case or source.common_shell_name(*pair) in args.case
    ]
    # Deliberately serial: at most one single-threaded CaDiCaL process exists.
    records = [
        run_case(s, o, args.timeout, args.output_root.resolve())
        for s, o in selected
    ]
    summary = {
        "schema": SCHEMA,
        "timeout_per_case_seconds": args.timeout,
        "serial": True,
        "maximum_concurrent_cadical_processes": 1,
        "results": records,
        "terminal": all(record["verdict"] in {"SAT", "UNSAT"} for record in records),
        "all_independently_verified": all(
            record["independent_verification"]["verified"] for record in records
        ),
        "trust_boundary": (
            "A complete model is independently checked against each exact CNF and "
            "the manifest semantics for SAT; drat-trim checks the exact CNF and DRAT "
            "for UNSAT.  EqualityCore.not_realizes_of_duplicateCenterCore, "
            "duplicateCenterCore_sound, "
            "EqualityCore.false_of_convexIndep_of_perpBisectorCore, and "
            "perpendicularBisectorCore_sound, plus "
            "ConvexFivePointCore.false_of_core and false_of_core_of_neg, justify "
            "the forward obstruction schemas when their live boundary-order and "
            "distance-equality premises are available.  The exact two-way Tseitin "
            "definitions compact the complete 51,993,900-clause logical surface "
            "of u5_nontriple_equilateral_on_p_circle_incompatibility, while "
            "u5_common_bisector_triple_incompatibility supplies the direct second "
            "family.  Translation "
            "from a geometric "
            "CriticalShellSystem/FaithfulCarrierPattern/boundary indexing to this fixed "
            "11-label Census-554 candidate table and four shell cases still requires "
            "a theorem-backed source-to-valuation adapter."
        ),
    }
    write_json(args.output_root.resolve() / "summary.json", summary)
    print(json.dumps({
        "cases": len(records),
        "verdicts": [record["verdict"] for record in records],
        "all_independently_verified": all(
            record["independent_verification"]["verified"] for record in records
        ),
    }, sort_keys=True))
    return 0 if summary["terminal"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
