#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Structural metric CEGAR using one source-indexed critical system directly.

Unlike ``second_center_metric_cegar``, this shadow does not choose a global row
at every carrier center.  It chooses the five live supplied rows and one exact
row for every source of a single finite critical-system abstraction.  Rows
chosen at the same blocker center obey the exact-row compatibility rule, and
every such row contains every source assigned to that center.  This is still a
finite necessary-condition model, not a construction of Lean's
``CriticalShellSystem`` and not a target-faithful configuration.  Every
formalized metric obstruction becomes a monotone no-good cut.  Equality CAS
is consulted only for the first-round diagnostic or when the formalized bank
does not already reject the proposed exact-row system.
"""

from __future__ import annotations

import argparse
import json
import sys
from itertools import combinations
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
CEGAR_DIR = HERE / "second_center_metric_cegar"
QUERY_DIR = HERE / "second_center_query"
ORACLE_DIR = HERE / "second_center_metric_oracle"
for path in (str(ROOT), str(CEGAR_DIR), str(QUERY_DIR), str(ORACLE_DIR)):
    if path not in sys.path:
        sys.path.insert(0, path)

import cegar  # noqa: E402
from census.global_confinement import metric_realizability_probe as metric_structure  # noqa: E402
from census.global_confinement import shadow  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402


DEFAULT_MAX_ROUNDS = 32
MAX_NODES = 500_000
CAS_TIMEOUT_S = 30.0
CHECKPOINT = HERE / "common_system_metric_probe.json"
PRE_ARC_OVERTAKE_CHECKPOINT = (
    HERE / "common_system_metric_probe_round28_pre_arc_overtake.json"
)


def exact_crosscheck(
    n: int, rows: Sequence[metric_structure.MetricRow]
) -> dict[str, Any]:
    """Run the shared three-oracle check with this probe's recorded budget."""

    previous_timeout = cegar.CAS_TIMEOUT_S
    cegar.CAS_TIMEOUT_S = CAS_TIMEOUT_S
    try:
        return cegar.exact_crosscheck(n, rows)
    finally:
        cegar.CAS_TIMEOUT_S = previous_timeout


def build_problem(seed: Mapping[str, object]) -> cegar.Problem:
    profile = tuple(int(value) for value in seed["profile"])
    labels = {str(name): int(value) for name, value in seed["labels"].items()}
    frame, candidates = mc.cached_candidate_lists(profile, set(mc.PROVEN_ROWS))
    if candidates is None:
        raise AssertionError("missing candidate lists")
    p = labels["p"]
    dangerous = frozenset(labels[name] for name in ("q", "t1", "t2", "t3"))
    fixed = (shadow.ClassRow("supplied:t2", p, dangerous, exact=True),)
    choices: list[shadow.ChoiceRow] = []
    for role in ("q", "t1", "t3", "u"):
        choices.append(
            shadow.ChoiceRow(
                f"supplied:{role}",
                cegar.metric_oracle.source_query.row_choice_candidates(
                    frame, candidates, source=labels[role]
                ),
                exact=True,
            )
        )
    for source in range(frame.n):
        choices.append(
            shadow.ChoiceRow(
                f"system:{source}",
                cegar.metric_oracle.source_query.row_choice_candidates(
                    frame, candidates, source=source
                ),
                exact=True,
            )
        )
    caps = cegar.metric_oracle.source_query.cap_sets(frame)
    p_caps = tuple(name for name in ("S", "O1", "O2") if p in caps[name])
    return cegar.Problem(
        seed,
        frame,
        candidates,
        labels,
        dangerous,
        fixed,
        tuple(choices),
        p_caps,
    )


def common_system_consistent(rows: Sequence[shadow.ClassRow]) -> bool:
    system_rows = {
        int(row.name.split(":", maxsplit=1)[1]): row
        for row in rows
        if row.name.startswith("system:")
    }
    if set(system_rows) != set(range(len(system_rows))):
        return False
    for source, row in system_rows.items():
        if source not in row.support or row.center == source:
            return False
        for other in system_rows.values():
            if other.center == row.center and source not in other.support:
                return False
    return True


def solve_incidence(
    problem: cegar.Problem, cuts: Sequence[cegar.Cut]
) -> dict[str, Any]:
    def prefix(rows: Sequence[shadow.ClassRow]) -> bool:
        return cegar.q_c_ok(problem, rows) and not any(
            cegar.contains_cut(rows, cut) for cut in cuts
        )

    return shadow.solve_choice_rows(
        problem.frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=problem.fixed_rows,
        choice_rows=problem.choice_rows,
        max_nodes=MAX_NODES,
        want_assignment=True,
        prefix_compatible=prefix,
        complete_compatible=common_system_consistent,
    )


def validate_assignment(
    problem: cegar.Problem,
    rows: Sequence[shadow.ClassRow],
    cuts: Sequence[cegar.Cut],
) -> None:
    ok, reason = shadow.verify_assignment(
        problem.frame, set(mc.PROVEN_ROWS), rows
    )
    if not ok:
        raise AssertionError(reason)
    if not cegar.q_c_ok(problem, rows):
        raise AssertionError("saved assignment violates Q-C negation")
    if not common_system_consistent(rows):
        raise AssertionError("saved assignment violates common-system coupling")
    if any(cegar.contains_cut(rows, cut) for cut in cuts):
        raise AssertionError("saved assignment contains a prior no-good cut")
    if any(not row.exact for row in rows):
        raise AssertionError("common-system model unexpectedly contains a non-exact row")


def exact_metric_rows(
    rows: Sequence[shadow.ClassRow],
) -> tuple[metric_structure.MetricRow, ...]:
    return tuple(
        metric_structure.MetricRow(row.center, row.support, exact=True)
        for row in cegar.metric_rows(rows)
    )


def five_point_hinge_cycle_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
) -> dict[str, Any] | None:
    """Match the seven-equality five-point hinge-cycle closure."""

    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    labels = tuple(range(n))
    for a in labels:
        for b in labels:
            if a == b:
                continue
            base = roots[a][b]
            for d in labels:
                if d in (a, b) or roots[a][d] != base:
                    continue
                for h in labels:
                    if (
                        h in (a, b, d)
                        or roots[a][h] != base
                        or roots[b][h] != base
                        or roots[d][h] != roots[d][b]
                    ):
                        continue
                    for c in labels:
                        if (
                            c in (a, b, d, h)
                            or roots[b][c] != base
                            or roots[c][d] != roots[c][a]
                            or roots[h][d] != roots[h][c]
                        ):
                            continue
                        return {
                            "stage": "equality-five-point-hinge-cycle",
                            "core": {"A": a, "B": b, "C": c, "D": d, "H": h},
                            "lean_consumer": (
                                "Problem97.Census554.EqualityCore."
                                "false_of_fivePointHingeCycleCore"
                            ),
                        }
    return None


def six_point_hinge_tail_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
) -> dict[str, Any] | None:
    """Match the nine-equality six-point hinge-tail closure."""

    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    labels = tuple(range(n))
    for a in labels:
        for b in labels:
            if a == b:
                continue
            base = roots[a][b]
            for d in labels:
                if d in (a, b) or roots[a][d] != base:
                    continue
                for h in labels:
                    if (
                        h in (a, b, d)
                        or roots[a][h] != base
                        or roots[b][h] != base
                        or roots[d][h] != roots[d][b]
                    ):
                        continue
                    for c in labels:
                        if (
                            c in (a, b, d, h)
                            or roots[b][c] != base
                            or roots[c][d] != roots[c][a]
                        ):
                            continue
                        for t in labels:
                            if (
                                t in (a, b, c, d, h)
                                or roots[c][t] != roots[c][a]
                                or roots[d][t] != roots[d][b]
                                or roots[h][t] != roots[h][c]
                            ):
                                continue
                            return {
                                "stage": "equality-six-point-hinge-tail",
                                "core": {
                                    "A": a,
                                    "B": b,
                                    "C": c,
                                    "D": d,
                                    "H": h,
                                    "T": t,
                                },
                                "lean_consumer": (
                                    "Problem97.Census554.EqualityCore."
                                    "false_of_sixPointHingeTailCore"
                                ),
                            }
    return None


def six_point_hinge_double_spoke_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
) -> dict[str, Any] | None:
    """Match the nine-equality six-point double-spoke hinge closure."""

    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    labels = tuple(range(n))
    for a in labels:
        for b in labels:
            if a == b:
                continue
            base = roots[a][b]
            for l in labels:
                if l in (a, b) or roots[a][l] != base:
                    continue
                for h in labels:
                    if (
                        h in (a, b, l)
                        or roots[a][h] != base
                        or roots[b][h] != base
                    ):
                        continue
                    for c in labels:
                        if (
                            c in (a, b, l, h)
                            or roots[b][c] != base
                            or roots[l][c] != roots[l][b]
                        ):
                            continue
                        for r in labels:
                            if (
                                r in (a, b, c, l, h)
                                or roots[b][r] != base
                                or roots[h][r] != roots[h][c]
                                or roots[r][c] != roots[r][a]
                                or roots[r][l] != roots[r][a]
                            ):
                                continue
                            return {
                                "stage": "equality-six-point-hinge-double-spoke",
                                "core": {
                                    "A": a,
                                    "B": b,
                                    "C": c,
                                    "L": l,
                                    "H": h,
                                    "R": r,
                                },
                                "lean_consumer": (
                                    "Problem97.Census554.EqualityCore."
                                    "false_of_sixPointHingeDoubleSpokeCore"
                                ),
                            }
    return None


def seven_point_hinge_closed_tail_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
) -> dict[str, Any] | None:
    """Match the eleven-equality seven-point closed-tail hinge closure."""

    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    labels = tuple(range(n))
    for a in labels:
        for b in labels:
            if a == b:
                continue
            base = roots[a][b]
            for l in labels:
                if l in (a, b) or roots[a][l] != base:
                    continue
                for m in labels:
                    if m in (a, b, l) or roots[a][m] != base:
                        continue
                    for h in labels:
                        if (
                            h in (a, b, l, m)
                            or roots[a][h] != base
                            or roots[b][h] != base
                            or roots[l][h] != roots[l][b]
                        ):
                            continue
                        for r in labels:
                            if (
                                r in (a, b, l, m, h)
                                or roots[b][r] != base
                                or roots[h][r] != roots[h][m]
                            ):
                                continue
                            for t in labels:
                                if (
                                    t in (a, b, l, m, h, r)
                                    or roots[l][t] != roots[l][b]
                                    or roots[h][t] != roots[h][m]
                                    or roots[t][m] != roots[t][a]
                                    or roots[t][r] != roots[t][a]
                                ):
                                    continue
                                return {
                                    "stage": "equality-seven-point-hinge-closed-tail",
                                    "core": {
                                        "A": a,
                                        "B": b,
                                        "L": l,
                                        "M": m,
                                        "H": h,
                                        "R": r,
                                        "T": t,
                                    },
                                    "lean_consumer": (
                                        "Problem97.Census554.EqualityCore."
                                        "false_of_sevenPointHingeClosedTailCore"
                                    ),
                                }
    return None


def equilateral_hinge_collision_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
) -> dict[str, Any] | None:
    """Return the first of the four production equilateral-hinge cores."""

    for matcher in (
        five_point_hinge_cycle_core,
        six_point_hinge_tail_core,
        six_point_hinge_double_spoke_core,
        seven_point_hinge_closed_tail_core,
    ):
        core = matcher(rows, n)
        if core is not None:
            return core
    return None


def scan_formalized_core(
    problem: cegar.Problem,
    rows: Sequence[metric_structure.MetricRow],
) -> dict[str, Any] | None:
    core = equilateral_hinge_collision_core(rows, problem.frame.n)
    if core is not None:
        return core
    order = shadow.hull_order(problem.frame)
    core = six_point_two_circle_arc_overtake_order_core(
        rows, problem.frame.n, order
    )
    if core is not None:
        return core
    reverse_core = six_point_two_circle_arc_overtake_order_core(
        rows, problem.frame.n, tuple(reversed(order))
    )
    if reverse_core is not None:
        return {
            **reverse_core,
            "stage": (
                "equality-convex-six-point-"
                "two-circle-arc-overtake-order-reverse"
            ),
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554."
                "SixPointTwoCircleArcOvertakeOrderCore.false_of_core_of_neg"
            ),
        }
    core = metric_structure._formalized_metric_core(
        rows,
        problem.frame.n,
        order,
        include_extended=True,
        include_ordered=True,
    )
    if core is not None:
        if core["stage"] == (
            "equality-convex-eight-point-"
            "five-row-circle-intersection-order"
        ):
            return {
                **core,
                "cyclic_orientation": "forward",
                "lean_consumer": (
                    "Problem97.Census554."
                    "FiveRowCircleIntersectionOrderCore.false_of_core"
                ),
            }
        if core["stage"] == (
            "equality-convex-eight-point-"
            "five-row-circle-intersection-order-reverse"
        ):
            return {
                **core,
                "cyclic_orientation": "reverse",
                "lean_consumer": (
                    "Problem97.Census554."
                    "FiveRowCircleIntersectionOrderCore."
                    "false_of_core_of_neg"
                ),
            }
        return core
    core = nested_equal_chord_core(
        rows, problem.frame.n, shadow.hull_order(problem.frame)
    )
    if core is not None:
        return core
    core = six_point_nested_center_order_core(rows, problem.frame.n, order)
    if core is not None:
        return core
    reverse_core = six_point_nested_center_order_core(
        rows, problem.frame.n, tuple(reversed(order))
    )
    if reverse_core is not None:
        return {
            **reverse_core,
            "stage": "equality-convex-six-point-nested-center-order-reverse",
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554.SixPointNestedCenterOrderCore."
                "false_of_core_of_neg"
            ),
        }
    core = six_point_two_circle_order_core(rows, problem.frame.n, order)
    if core is not None:
        return core
    reverse_core = six_point_two_circle_order_core(
        rows, problem.frame.n, tuple(reversed(order))
    )
    if reverse_core is not None:
        return {
            **reverse_core,
            "stage": "equality-convex-six-point-two-circle-order-reverse",
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554.SixPointTwoCircleOrderCore."
                "false_of_core_of_neg"
            ),
        }
    core = mec_straddling_row_core(problem, rows)
    if core is not None:
        return core
    core = six_point_circle_chain_order_core(rows, problem.frame.n, order)
    if core is not None:
        return core
    reverse_core = six_point_circle_chain_order_core(
        rows, problem.frame.n, tuple(reversed(order))
    )
    if reverse_core is not None:
        return {
            **reverse_core,
            "stage": "equality-convex-six-point-circle-chain-order-reverse",
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554.SixPointCircleChainOrderCore."
                "false_of_core_of_neg"
            ),
        }
    core = six_point_circle_chain_wrap_order_core(rows, problem.frame.n, order)
    if core is not None:
        return core
    reverse_core = six_point_circle_chain_wrap_order_core(
        rows, problem.frame.n, tuple(reversed(order))
    )
    if reverse_core is not None:
        return {
            **reverse_core,
            "stage": "equality-convex-six-point-circle-chain-wrap-order-reverse",
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554.SixPointCircleChainWrapOrderCore."
                "false_of_core_of_neg"
            ),
        }
    core = seven_point_split_bridge_order_core(rows, problem.frame.n, order)
    if core is not None:
        return core
    reverse_core = seven_point_split_bridge_order_core(
        rows, problem.frame.n, tuple(reversed(order))
    )
    if reverse_core is not None:
        return {
            **reverse_core,
            "stage": "equality-convex-seven-point-split-bridge-order-reverse",
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554.SevenPointSplitBridgeOrderCore."
                "false_of_core_of_neg"
            ),
        }
    core = seven_point_split_bridge_tail_order_core(
        rows, problem.frame.n, order
    )
    if core is not None:
        return core
    reverse_core = seven_point_split_bridge_tail_order_core(
        rows, problem.frame.n, tuple(reversed(order))
    )
    if reverse_core is not None:
        return {
            **reverse_core,
            "stage": (
                "equality-convex-seven-point-"
                "split-bridge-tail-order-reverse"
            ),
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554.SevenPointSplitBridgeTailOrderCore."
                "false_of_core_of_neg"
            ),
        }
    core = four_point_two_circle_bisector_order_core(
        rows, problem.frame.n, order
    )
    if core is not None:
        return core
    reverse_core = four_point_two_circle_bisector_order_core(
        rows, problem.frame.n, tuple(reversed(order))
    )
    if reverse_core is not None:
        return {
            **reverse_core,
            "stage": (
                "equality-convex-four-point-"
                "two-circle-bisector-order-reverse"
            ),
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554.FourPointTwoCircleBisectorOrderCore."
                "false_of_core_of_neg"
            ),
        }
    core = five_row_circle_intersection_order_core(
        rows, problem.frame.n, order
    )
    if core is not None:
        return core
    reverse_core = five_row_circle_intersection_order_core(
        rows, problem.frame.n, tuple(reversed(order))
    )
    if reverse_core is not None:
        return {
            **reverse_core,
            "stage": (
                "equality-convex-eight-point-"
                "five-row-circle-intersection-order-reverse"
            ),
            "cyclic_orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554."
                "FiveRowCircleIntersectionOrderCore.false_of_core_of_neg"
            ),
        }
    return None


def six_point_two_circle_arc_overtake_order_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked six-point arc-overtake pattern.

    For six distinct labels in cyclic order ``O,A,D,E,F,C``, the metric
    equality closure must supply

    ``OA = OC = AC = OD = OE`` and ``DA = DE = DF``.

    The Lean carrier adapter obtains these equalities from only three exact
    rows, centered at ``O``, ``A``, and ``D``.  The closure comparison makes
    this matcher monotone: adding rows or equalities cannot destroy a match.
    """

    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        o = rotated[0]
        for i_a, i_d, i_e, i_f, i_c in combinations(range(1, n), 5):
            a, d, e, f, c = (
                rotated[i_a],
                rotated[i_d],
                rotated[i_e],
                rotated[i_f],
                rotated[i_c],
            )
            base_root = roots[o][a]
            d_root = roots[d][a]
            if (
                roots[o][c] == base_root
                and roots[a][c] == base_root
                and roots[o][d] == base_root
                and roots[o][e] == base_root
                and roots[d][e] == d_root
                and roots[d][f] == d_root
            ):
                return {
                    "stage": (
                        "equality-convex-six-point-"
                        "two-circle-arc-overtake-order"
                    ),
                    "core": {
                        "O": o,
                        "A": a,
                        "D": d,
                        "E": e,
                        "F": f,
                        "C": c,
                    },
                    "cyclic_orientation": "forward",
                    "lean_consumer": (
                        "Problem97.Census554."
                        "SixPointTwoCircleArcOvertakeOrderCore.false_of_core"
                    ),
                }
    return None


def five_row_circle_intersection_order_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked five-row circle-intersection pattern.

    Five distinct spine labels occur in cyclic order ``O,A,D,E,C``.  Three
    auxiliary labels may occur anywhere.  The equality closure must supply

    ``OA = OC = OD = OE = AC``, ``DA = DX5``, ``OA = EX5``,
    ``OA = AX6``, ``DA = DX6``, ``CD = CX9``, and ``OA = EX9``.

    These are exactly the hypotheses of
    ``FiveRowCircleIntersectionOrderCore``.  All comparisons use the
    transitive row-equality closure, so adding rows or equalities cannot
    destroy a match and the resulting no-good cut is monotone.
    """

    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    labels = tuple(range(n))
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        o = rotated[0]
        for i_a, i_d, i_e, i_c in combinations(range(1, n), 4):
            a, d, e, c = (
                rotated[i_a],
                rotated[i_d],
                rotated[i_e],
                rotated[i_c],
            )
            base_root = roots[o][a]
            d_root = roots[d][a]
            if not (
                roots[o][c] == base_root
                and roots[o][d] == base_root
                and roots[o][e] == base_root
                and roots[a][c] == base_root
            ):
                continue
            x5 = next(
                (
                    label
                    for label in labels
                    if roots[d][label] == d_root
                    and roots[e][label] == base_root
                ),
                None,
            )
            if x5 is None:
                continue
            x6 = next(
                (
                    label
                    for label in labels
                    if roots[a][label] == base_root
                    and roots[d][label] == d_root
                ),
                None,
            )
            if x6 is None:
                continue
            x9 = next(
                (
                    label
                    for label in labels
                    if roots[c][label] == roots[c][d]
                    and roots[e][label] == base_root
                ),
                None,
            )
            if x9 is None:
                continue
            return {
                "stage": (
                    "equality-convex-eight-point-"
                    "five-row-circle-intersection-order"
                ),
                "core": {
                    "O": o,
                    "A": a,
                    "C": c,
                    "D": d,
                    "E": e,
                    "X5": x5,
                    "X6": x6,
                    "X9": x9,
                },
                "cyclic_orientation": "forward",
                "lean_consumer": (
                    "Problem97.Census554."
                    "FiveRowCircleIntersectionOrderCore.false_of_core"
                ),
            }
    return None


def nested_equal_chord_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked `NestedEqualChordCore` closure pattern."""

    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        o = rotated[0]
        for ia, ib, ic, id_ in combinations(range(1, n), 4):
            a, b, c, d = (
                rotated[ia],
                rotated[ib],
                rotated[ic],
                rotated[id_],
            )
            radius_root = roots[o][a]
            if (
                roots[o][b] == radius_root
                and roots[o][c] == radius_root
                and roots[o][d] == radius_root
                and roots[a][d] == radius_root
                and roots[b][c] == radius_root
            ):
                return {
                    "stage": "equality-convex-nested-equal-chords",
                    "core": {"o": o, "a": a, "b": b, "c": c, "d": d},
                    "lean_consumer": (
                        "Problem97.Census554.NestedEqualChordCore.false_of_core"
                    ),
                }
    return None


def six_point_nested_center_order_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked `SixPointNestedCenterOrderCore` pattern.

    For six distinct labels in cyclic order ``O,A,D,E,X,C``, the production
    core needs

    ``OA = OC = OD = OE = AC``, ``DA = DE = DX``, and ``EO = EX``.

    All comparisons are made in the transitive row-equality closure, so the
    matcher is monotone and is sound for use as a CEGAR no-good cut.
    """

    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        o = rotated[0]
        for i_a, i_d, i_e, i_x, i_c in combinations(range(1, n), 5):
            a, d, e, x, c = (
                rotated[i_a],
                rotated[i_d],
                rotated[i_e],
                rotated[i_x],
                rotated[i_c],
            )
            base_root = roots[o][a]
            d_root = roots[d][a]
            if (
                roots[o][c] == base_root
                and roots[o][d] == base_root
                and roots[o][e] == base_root
                and roots[a][c] == base_root
                and roots[d][e] == d_root
                and roots[d][x] == d_root
                and roots[e][x] == roots[e][o]
            ):
                return {
                    "stage": "equality-convex-six-point-nested-center-order",
                    "core": {
                        "O": o,
                        "A": a,
                        "D": d,
                        "E": e,
                        "X": x,
                        "C": c,
                    },
                    "cyclic_orientation": "forward",
                    "lean_consumer": (
                        "Problem97.Census554.SixPointNestedCenterOrderCore."
                        "false_of_core"
                    ),
                }
    return None


def six_point_two_circle_order_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked `SixPointTwoCircleOrderCore` pattern.

    For six distinct labels in cyclic order ``A,P,Q,B,D,C``, the production
    core needs

    ``AB = AC = AD = BC``, ``CD = CP``, and ``DA = DQ``.

    All comparisons are made in the transitive row-equality closure, so the
    matcher is monotone and is sound for use as a CEGAR no-good cut.
    """

    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        a = rotated[0]
        for i_p, i_q, i_b, i_d, i_c in combinations(range(1, n), 5):
            p, q, b, d, c = (
                rotated[i_p],
                rotated[i_q],
                rotated[i_b],
                rotated[i_d],
                rotated[i_c],
            )
            base_root = roots[a][b]
            if (
                roots[a][c] == base_root
                and roots[a][d] == base_root
                and roots[b][c] == base_root
                and roots[c][d] == roots[c][p]
                and roots[d][a] == roots[d][q]
            ):
                return {
                    "stage": "equality-convex-six-point-two-circle-order",
                    "core": {
                        "A": a,
                        "P": p,
                        "Q": q,
                        "B": b,
                        "D": d,
                        "C": c,
                    },
                    "cyclic_orientation": "forward",
                    "lean_consumer": (
                        "Problem97.Census554.SixPointTwoCircleOrderCore."
                        "false_of_core"
                    ),
                }
    return None


def six_point_circle_chain_order_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked `SixPointCircleChainOrderCore` pattern.

    For six distinct labels in cyclic order ``O,A,D,E,C,Y``, the production
    core needs

    ``OA = OC = AC = OD = OE``, ``DA = DE``, ``EA = EC = EY``, and
    ``CD = CY``.

    All comparisons are made in the transitive row-equality closure, so the
    matcher is monotone and is sound for use as a CEGAR no-good cut.
    """

    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        o = rotated[0]
        for i_a, i_d, i_e, i_c, i_y in combinations(range(1, n), 5):
            a, d, e, c, y = (
                rotated[i_a],
                rotated[i_d],
                rotated[i_e],
                rotated[i_c],
                rotated[i_y],
            )
            base_root = roots[o][a]
            e_root = roots[e][a]
            if (
                roots[o][c] == base_root
                and roots[a][c] == base_root
                and roots[o][d] == base_root
                and roots[o][e] == base_root
                and roots[d][e] == roots[d][a]
                and roots[e][c] == e_root
                and roots[e][y] == e_root
                and roots[c][y] == roots[c][d]
            ):
                return {
                    "stage": "equality-convex-six-point-circle-chain-order",
                    "core": {
                        "O": o,
                        "A": a,
                        "D": d,
                        "E": e,
                        "C": c,
                        "Y": y,
                    },
                    "cyclic_orientation": "forward",
                    "lean_consumer": (
                        "Problem97.Census554.SixPointCircleChainOrderCore."
                        "false_of_core"
                    ),
                }
    return None


def six_point_circle_chain_wrap_order_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked wrap-order circle-chain pattern.

    For six distinct labels in cyclic order ``O,Y,A,D,E,C``, the equality
    closure is the same as ``SixPointCircleChainOrderCore``:

    ``OA = OC = AC = OD = OE``, ``DA = DE``, ``EA = EC = EY``, and
    ``CD = CY``.

    The changed position of ``Y`` supplies the ``OYA`` sign used by
    ``SixPointCircleChainWrapOrderCore``.  As with the original matcher, all
    equality comparisons use the transitive row closure, so the resulting cut
    is monotone.
    """

    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        o = rotated[0]
        for i_y, i_a, i_d, i_e, i_c in combinations(range(1, n), 5):
            y, a, d, e, c = (
                rotated[i_y],
                rotated[i_a],
                rotated[i_d],
                rotated[i_e],
                rotated[i_c],
            )
            base_root = roots[o][a]
            e_root = roots[e][a]
            if (
                roots[o][c] == base_root
                and roots[a][c] == base_root
                and roots[o][d] == base_root
                and roots[o][e] == base_root
                and roots[d][e] == roots[d][a]
                and roots[e][c] == e_root
                and roots[e][y] == e_root
                and roots[c][y] == roots[c][d]
            ):
                return {
                    "stage": "equality-convex-six-point-circle-chain-wrap-order",
                    "core": {
                        "O": o,
                        "Y": y,
                        "A": a,
                        "D": d,
                        "E": e,
                        "C": c,
                    },
                    "cyclic_orientation": "forward",
                    "lean_consumer": (
                        "Problem97.Census554.SixPointCircleChainWrapOrderCore."
                        "false_of_core"
                    ),
                }
    return None


def seven_point_split_bridge_order_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked seven-point split-bridge order pattern.

    Five distinct spine labels occur in cyclic order ``O,A,D,E,C``.  Two
    further distinct labels ``U,W`` may occur anywhere in the cyclic order.
    The equality closure must supply exactly the generic core's nine edges:

    ``OA = OC = AC = OD = OE``, ``DA = DE = DU``, ``AO = AU``,
    ``CD = CW``, and ``EA = EW``.

    Comparisons use the transitive row-equality closure.  Adding rows or
    equalities cannot destroy a match, so the resulting CEGAR cut is monotone.
    """

    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    labels = tuple(range(n))
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        o = rotated[0]
        for i_a, i_d, i_e, i_c in combinations(range(1, n), 4):
            a, d, e, c = (
                rotated[i_a],
                rotated[i_d],
                rotated[i_e],
                rotated[i_c],
            )
            spine = {o, a, d, e, c}
            remaining = tuple(label for label in labels if label not in spine)
            base_root = roots[o][a]
            d_root = roots[d][a]
            if not (
                roots[o][c] == base_root
                and roots[a][c] == base_root
                and roots[o][d] == base_root
                and roots[o][e] == base_root
                and roots[d][e] == d_root
            ):
                continue
            for u in remaining:
                if not (
                    roots[d][u] == d_root
                    and roots[a][u] == roots[a][o]
                ):
                    continue
                for w in remaining:
                    if w == u:
                        continue
                    if (
                        roots[c][w] == roots[c][d]
                        and roots[e][w] == roots[e][a]
                    ):
                        return {
                            "stage": (
                                "equality-convex-seven-point-"
                                "split-bridge-order"
                            ),
                            "core": {
                                "O": o,
                                "A": a,
                                "C": c,
                                "D": d,
                                "E": e,
                                "U": u,
                                "W": w,
                            },
                            "cyclic_orientation": "forward",
                            "lean_consumer": (
                                "Problem97.Census554."
                                "SevenPointSplitBridgeOrderCore.false_of_core"
                            ),
                        }
    return None


def seven_point_split_bridge_tail_order_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked tail split-bridge order pattern.

    Five distinct spine labels occur in cyclic order ``O,A,D,E,C``.  Two
    further distinct labels ``U,W`` lie off the spine.  The equality closure
    must supply

    ``OA = OC = AC = OD = OE``, ``DA = DE = DU``, ``AO = AU``,
    ``CD = CW``, and ``EC = EW``.

    This is the tail variant of ``seven_point_split_bridge_order_core``: its
    final bridge is based at ``E`` on ``EC`` rather than ``EA``.  Comparisons
    use the transitive row-equality closure, hence adding rows or equalities
    cannot destroy a match and the resulting CEGAR cut is monotone.
    """

    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    labels = tuple(range(n))
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        o = rotated[0]
        for i_a, i_d, i_e, i_c in combinations(range(1, n), 4):
            a, d, e, c = (
                rotated[i_a],
                rotated[i_d],
                rotated[i_e],
                rotated[i_c],
            )
            spine = {o, a, d, e, c}
            remaining = tuple(label for label in labels if label not in spine)
            base_root = roots[o][a]
            d_root = roots[d][a]
            if not (
                roots[o][c] == base_root
                and roots[a][c] == base_root
                and roots[o][d] == base_root
                and roots[o][e] == base_root
                and roots[d][e] == d_root
            ):
                continue
            for u in remaining:
                if not (
                    roots[d][u] == d_root
                    and roots[a][u] == roots[a][o]
                ):
                    continue
                for w in remaining:
                    if w == u:
                        continue
                    if (
                        roots[c][w] == roots[c][d]
                        and roots[e][w] == roots[e][c]
                    ):
                        return {
                            "stage": (
                                "equality-convex-seven-point-"
                                "split-bridge-tail-order"
                            ),
                            "core": {
                                "O": o,
                                "A": a,
                                "C": c,
                                "D": d,
                                "E": e,
                                "U": u,
                                "W": w,
                            },
                            "cyclic_orientation": "forward",
                            "lean_consumer": (
                                "Problem97.Census554."
                                "SevenPointSplitBridgeTailOrderCore."
                                "false_of_core"
                            ),
                        }
    return None


def four_point_two_circle_bisector_order_core(
    rows: Sequence[metric_structure.MetricRow],
    n: int,
    order: Sequence[int],
) -> dict[str, Any] | None:
    """Match the kernel-checked two-circle same-side order pattern.

    Four distinct labels occur in cyclic order ``Q,U,Y,V``.  The equality
    closure supplies the two common-circle equations ``QU = QY`` and
    ``UV = YV``.  The order makes the two intersections lie on the same side
    of the center chord, exactly as required by
    ``FourPointTwoCircleBisectorOrderCore``.

    Both comparisons use the transitive row-equality closure, so adding rows
    or equalities cannot destroy a match and the resulting cut is monotone.
    """

    cyclic_order = tuple(int(label) for label in order)
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("invalid cyclic order")
    closure = metric_structure._row_equality_closure(n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, n)
    for start in range(n):
        rotated = cyclic_order[start:] + cyclic_order[:start]
        q = rotated[0]
        for i_u, i_y, i_v in combinations(range(1, n), 3):
            u, y, v = rotated[i_u], rotated[i_y], rotated[i_v]
            if (
                roots[q][u] == roots[q][y]
                and roots[u][v] == roots[y][v]
            ):
                return {
                    "stage": (
                        "equality-convex-four-point-"
                        "two-circle-bisector-order"
                    ),
                    "core": {"Q": q, "V": v, "U": u, "Y": y},
                    "cyclic_orientation": "forward",
                    "lean_consumer": (
                        "Problem97.Census554."
                        "FourPointTwoCircleBisectorOrderCore.false_of_core"
                    ),
                }
    return None


def _cyclic_triple_direction(
    order: Sequence[int], first: int, second: int, third: int
) -> str:
    """Return the orientation of three distinct labels in one cyclic order."""

    cyclic_order = tuple(int(label) for label in order)
    if len(set(cyclic_order)) != len(cyclic_order):
        raise ValueError("cyclic order contains duplicate labels")
    if len({first, second, third}) != 3:
        raise ValueError("cyclic orientation needs three distinct labels")
    positions = {label: index for index, label in enumerate(cyclic_order)}
    if any(label not in positions for label in (first, second, third)):
        raise ValueError("cyclic orientation label is absent from the order")
    size = len(cyclic_order)
    second_offset = (positions[second] - positions[first]) % size
    third_offset = (positions[third] - positions[first]) % size
    return "forward" if second_offset < third_offset else "reverse"


def mec_straddling_row_core(
    problem: cegar.Problem,
    rows: Sequence[metric_structure.MetricRow],
) -> dict[str, Any] | None:
    """Match the fixed-frame `(4,5,6)` MEC straddling-row consumer.

    Only the four radius equalities come from ``rows``.  Boundary membership,
    MEC-disk containment, nonobtuseness, and strict orientations are ambient
    dependencies of the live Moser/MEC frame and are recorded in the result.
    """

    frame = problem.frame
    if frame.profile != (4, 5, 6) or frame.n != 12:
        return None
    moser_labels = {0, 1, 2}
    if (
        frame.S & moser_labels != {1, 2}
        or frame.O1 & moser_labels != {0, 2}
        or frame.O2 & moser_labels != {0, 1}
    ):
        return None
    carrier_labels = moser_labels | set().union(*frame.caps_int.values())
    if carrier_labels != set(range(frame.n)):
        return None

    labels = {"o": 0, "a": 1, "p": 2, "s": 3, "x": 10, "y": 7}
    closure = metric_structure._row_equality_closure(frame.n, rows)
    roots, _classes = metric_structure._closure_circle_index(closure, frame.n)
    o, a, p, s, x, y = (labels[name] for name in ("o", "a", "p", "s", "x", "y"))
    radius_root = roots[o][a]
    if not (
        roots[a][p] == radius_root
        and roots[o][s] == radius_root
        and roots[s][x] == radius_root
        and roots[s][y] == radius_root
    ):
        return None

    order = shadow.hull_order(frame)
    orientation_triples = ((o, a, p), (o, a, s), (o, x, s), (o, s, y))
    directions = {
        _cyclic_triple_direction(order, *triple)
        for triple in orientation_triples
    }
    if len(directions) != 1:
        return None
    direction = directions.pop()
    return {
        "stage": "equality-mec-straddling-row-fixed-frame",
        "core": labels,
        "cyclic_orientation_in_saved_order": direction,
        "lean_consumers": {
            "positive_global_orientation": (
                "Problem97.Census554.MECStraddlingRowCore.false_of_core"
            ),
            "negative_global_orientation": (
                "Problem97.Census554.MECStraddlingRowCore.false_of_core_of_neg"
            ),
        },
        "non_equality_dependencies": {
            "status": "REQUIRED_FROM_LIVE_FIXED_FRAME_NOT_EQUALITY_ROWS",
            "profile": [4, 5, 6],
            "moser_mec_boundary_labels": [o, a, p],
            "mec_disk_labels": [x, y],
            "nonobtuse_moser_vertex": a,
            "strict_cyclic_orientation_triples": [
                list(triple) for triple in orientation_triples
            ],
            "saved_hull_order": list(order),
        },
    }


def minimize_formalized_core(
    problem: cegar.Problem,
    rows: Sequence[metric_structure.MetricRow],
) -> tuple[tuple[metric_structure.MetricRow, ...], dict[str, Any]]:
    """Greedily delete rows while some formalized monotone core remains."""

    kept = list(rows)
    initial = scan_formalized_core(problem, kept)
    if initial is None:
        raise ValueError("cannot minimize an assignment without a formalized core")
    for index in range(len(kept) - 1, -1, -1):
        candidate = kept[:index] + kept[index + 1 :]
        if scan_formalized_core(problem, candidate) is not None:
            kept = candidate
    final = scan_formalized_core(problem, kept)
    if final is None:
        raise AssertionError("formalized-core minimization lost its obstruction")
    return tuple(kept), final


def encoded_exact_rows(
    rows: Sequence[metric_structure.MetricRow],
) -> list[dict[str, Any]]:
    return [
        {
            "center": row.center,
            "support": list(row.support),
            "exact": row.exact,
        }
        for row in rows
    ]


def solve_case(problem: cegar.Problem, *, max_rounds: int) -> dict[str, Any]:
    cuts: list[cegar.Cut] = []
    rounds: list[dict[str, Any]] = []
    final_status = "STOPPED_ROUND_BUDGET"
    for round_index in range(max_rounds):
        print(
            f"common-system profile={problem.profile} round={round_index} "
            f"cuts={len(cuts)}: incidence solve",
            file=sys.stderr,
        )
        result = solve_incidence(problem, cuts)
        if result["status"] != "SAT":
            rounds.append(
                {
                    "round": round_index,
                    "incidence_status": result["status"],
                    "nodes": int(result["nodes"]),
                }
            )
            final_status = (
                "EXHAUSTED_COMMON_SYSTEM_FINITE_SHADOW"
                if result["status"] == "UNSAT"
                else "STOPPED_INCIDENCE_NODE_CAP"
            )
            break

        rows = cegar.assignment_rows(result)
        validate_assignment(problem, rows, cuts)
        metrics = cegar.metric_rows(rows)
        exact_metrics = exact_metric_rows(rows)
        assignment = cegar.assignment_document(rows)
        formalized_core = scan_formalized_core(problem, exact_metrics)
        record: dict[str, Any] = {
            "round": round_index,
            "incidence_status": "SAT",
            "nodes": int(result["nodes"]),
            "assignment": assignment,
            "assignment_sha256": cegar.canonical_sha256(assignment),
            "metric_row_count": len(metrics),
            "metric_rows": cegar.encode_metric_rows(metrics),
            "formalized_structural_core": formalized_core,
        }

        # Preserve the initial equality-only diagnostic which motivated this
        # exact-row CEGAR.  Later formalized rounds do not need redundant CAS.
        if round_index == 0:
            record["equality_ideal_diagnostic"] = cegar.crosscheck_summary(
                exact_crosscheck(problem.frame.n, metrics)
            )

        if formalized_core is not None:
            retained, retained_core = minimize_formalized_core(
                problem, exact_metrics
            )
            accepted_cut = cegar.cut_from_rows(retained)
            if not accepted_cut or accepted_cut in cuts:
                raise AssertionError("invalid or duplicate formalized-core cut")
            if not accepted_cut <= cegar.cut_from_rows(metrics):
                raise AssertionError("formalized-core cut is not an assignment subset")
            record["accepted_cut"] = {
                "origin": "greedy_formalized_structural_core",
                "rows": encoded_exact_rows(retained),
                "row_count": len(retained),
                "row_set_sha256": cegar.canonical_sha256(
                    encoded_exact_rows(retained)
                ),
                "core": retained_core,
            }
            record["reported_status"] = "FORMALIZED_STRUCTURAL_CUT_ACCEPTED"
            rounds.append(record)
            cuts.append(accepted_cut)
            print(
                f"common-system profile={problem.profile} round={round_index}: "
                f"accepted {len(accepted_cut)}-row {retained_core['stage']} cut",
                file=sys.stderr,
            )
            continue

        crosscheck = exact_crosscheck(problem.frame.n, metrics)
        record["full_equality_ideal"] = cegar.crosscheck_summary(crosscheck)
        if crosscheck["status"] == "CROSSCHECKED_NONUNIT":
            record["reported_status"] = (
                "FOUND_NONUNIT_WITHOUT_FORMALIZED_CORE_REAL_FEASIBILITY_UNDECIDED"
            )
            rounds.append(record)
            final_status = "FOUND_UNCOVERED_CROSSCHECKED_NONUNIT_EQUALITY_SHADOW"
            break
        if crosscheck["status"] != "CROSSCHECKED_UNIT":
            record["reported_status"] = "UNDECIDED_FAIL_CLOSED"
            rounds.append(record)
            final_status = "STOPPED_FULL_ORACLE_UNDECIDED"
            break

        minimization = cegar.bounded_minimize_unit(problem.frame.n, metrics)
        retained = tuple(
            cegar.row_from_dict(row) for row in minimization["retained_rows"]
        )
        retained_check = exact_crosscheck(problem.frame.n, retained)
        if retained_check["status"] != "CROSSCHECKED_UNIT":
            retained = metrics
            retained_check = exact_crosscheck(problem.frame.n, retained)
        accepted_cut = cegar.cut_from_rows(retained)
        if not accepted_cut or accepted_cut in cuts:
            raise AssertionError("invalid or duplicate cross-checked UNIT cut")
        record["unit_minimization"] = minimization
        record["accepted_cut"] = cegar.cut_document(
            problem.frame.n,
            retained,
            retained_check,
            origin="crosschecked_unit_without_formalized_core",
        )
        record["reported_status"] = "CROSSCHECKED_UNIT_CUT_ACCEPTED"
        rounds.append(record)
        cuts.append(accepted_cut)

    return {
        "profile": list(problem.profile),
        "rounds": rounds,
        "accepted_cut_count": len(cuts),
        "final_status": final_status,
    }


def build_checkpoint(*, max_rounds: int) -> dict[str, Any]:
    if max_rounds < 1:
        raise ValueError("max_rounds must be positive")
    cases = [
        solve_case(build_problem(seed), max_rounds=max_rounds)
        for seed in cegar.metric_oracle.source_query.CASE_SEEDS
    ]
    return {
        "schema": "p97-atail-common-critical-system-metric-cegar-v2",
        "epistemic_status": "FINITE_NECESSARY_CONDITION_SHADOW_ONLY",
        "scope": {
            "target_faithful": False,
            "lean_critical_shell_system_constructed": False,
            "unencoded_radius_classes_excluded": False,
            "global_row_at_every_center_assumed": False,
            "one_exact_row_per_source": True,
            "same_center_exact_row_coupling": True,
            "formalized_metric_core_scan": True,
            "formalized_cores_are_monotone_cuts": True,
            "mec_straddling_fixed_frame_scan": True,
            "mec_geometry_derived_from_equality_rows": False,
            "mec_geometry_required_from_live_target_frame": True,
            "mec_geometry_dependencies_recorded": True,
            "q_c_negation": True,
            "real_feasibility_decided": False,
            "producer_proved": False,
        },
        "budgets": {
            "max_rounds_per_case": max_rounds,
            "max_incidence_nodes_per_round": MAX_NODES,
            "cas_timeout_seconds_per_call": CAS_TIMEOUT_S,
        },
        "cases": cases,
    }


def _saved_round_budget() -> int:
    if not CHECKPOINT.exists():
        raise AssertionError(f"missing checkpoint: {CHECKPOINT}")
    saved = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    return int(saved["budgets"]["max_rounds_per_case"])


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--max-rounds", type=int)
    args = parser.parse_args()
    if args.write and args.check:
        parser.error("--write and --check are mutually exclusive")
    max_rounds = args.max_rounds
    if max_rounds is None:
        max_rounds = _saved_round_budget() if args.check else DEFAULT_MAX_ROUNDS
    checkpoint = build_checkpoint(max_rounds=max_rounds)
    rendered = json.dumps(checkpoint, indent=2, sort_keys=True) + "\n"
    if args.write:
        CHECKPOINT.write_text(rendered, encoding="utf-8")
    elif args.check:
        if CHECKPOINT.read_text(encoding="utf-8") != rendered:
            raise AssertionError("saved common-system checkpoint is stale")
    else:
        print(rendered, end="")
    summary = {
        "checkpoint": str(CHECKPOINT.relative_to(ROOT)),
        "max_rounds_per_case": max_rounds,
        "cases": [
            {
                "profile": case["profile"],
                "round_count": len(case["rounds"]),
                "accepted_cut_count": case["accepted_cut_count"],
                "final_status": case["final_status"],
                "last_incidence_status": (
                    case["rounds"][-1]["incidence_status"]
                    if case["rounds"] else None
                ),
                "last_formalized_stage": (
                    (
                        case["rounds"][-1].get("formalized_structural_core")
                        or {}
                    ).get("stage")
                    if case["rounds"] else None
                ),
            }
            for case in checkpoint["cases"]
        ],
    }
    if args.write or args.check:
        print(json.dumps(summary, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
