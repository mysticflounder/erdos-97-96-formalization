#!/usr/bin/env python3
"""CEGAR round for the full FreshThird deletion-fan abstraction.

This extends ``freshthird_outside_seed_blocker_probe.py`` with the pinned
four-row ``w0..w3`` and one canonical blocker shell for every row point.  The
model keeps only source-entitled linear facts:

* the four proved five-point source orders and their strict Kalmanson packet;
* nonnegative distances and ordinary (non-strict) triangle inequalities on
  named points, with strict positivity asserted only for source-proved
  distinct pairs;
* the source and fresh four-shells;
* a positive-radius pinned four-row;
* each blocker shell has four points, contains its ``wi``, excludes its
  blocker centre, and equal blocker centres use exactly the same support;
* the universal escape dichotomy: a blocker equal to the pinned centre has
  the pinned row as exact support, while a distinct blocker shell meets that
  row in at most two points.

The probe exhausts all set partitions of ``b0..b3`` (blocker-centre equality),
all possible pinned-centre collisions (none, or one equality class), every
allowed exact shell-intersection pattern, both endpoint/off-endpoint arms, and
all four source orders.  Cap labels are kept as the separate finite summary
``0|1|2``; no cap metric or cap-order clauses are invented.

Ingress map and boundary: ``w0`` is the named outside-seed witness in the
at-endpoint pinned row; in the off-endpoint arm ``w0`` is the K witness and
``e0`` is the separate endpoint-row witness.  All other names are explicit
finite placeholders.  Anonymous shell fillers are deliberately omitted from
the metric.  They are recorded only as the existential points needed to bring
each shell to cardinality four.  This is a source-safe weakening and a
*partial proposal generator* whose branch enumeration is exhaustive only for
the stated finite ingress; no cross-row placeholder distinctness is assumed.

SAT/UNSAT below are *abstraction evidence only*.  A SAT model is replayed
against every generated assertion.  Neither result is a Lean theorem or a
Euclidean counterexample; promotion would require a source-level ingress and
universal checked lift.
"""

from __future__ import annotations

import csv
from collections import Counter
from itertools import combinations, product
from pathlib import Path

from z3 import Real, Solver, is_true, sat, unknown, unsat


ORDER_ARMS = {
    "outside_fresh_between_source_canonical": (
        ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource"),
        "qBetween",
    ),
    "outside_fresh_between_canonical_source": (
        ("qOutside", "freshCenter", "qBetween", "canonicalSource", "sourceCenter"),
        "qOutside",
    ),
    "canonical_source_between_fresh_outside": (
        ("canonicalSource", "sourceCenter", "qBetween", "freshCenter", "qOutside"),
        "qBetween",
    ),
    "source_canonical_between_fresh_outside": (
        ("sourceCenter", "canonicalSource", "qBetween", "freshCenter", "qOutside"),
        "qOutside",
    ),
}

BASE_ROLES = (
    "qOutside",
    "freshCenter",
    "qBetween",
    "sourceCenter",
    "canonicalSource",
    "c2",
    "f1",
    "f2",
    "w0",
    "w1",
    "w2",
    "w3",
    "e0",
    "e1",
    "e2",
    "e3",
)
ROW = ("w0", "w1", "w2", "w3")
CAP_LABEL_SUMMARY = "0|1|2"
CAP_INGRESS_STATUS = "projected_away_no_cap_assignment"
COVERAGE_STATUS = (
    "downgraded_partial_no_live_row_seed_injection;"
    "offEndpoint_center_fixed_canonicalSource;"
    "no_global_rank_kalmanson"
)


def edge(a: str, b: str) -> tuple[str, str]:
    return tuple(sorted((a, b)))


def set_partitions(items: tuple[int, ...]) -> list[tuple[tuple[int, ...], ...]]:
    """Return canonical set partitions, preserving deterministic order."""

    if not items:
        return [()]
    first, *rest = items
    out: list[tuple[tuple[int, ...], ...]] = []
    for partition in set_partitions(tuple(rest)):
        # Put ``first`` into an existing block.
        for i in range(len(partition)):
            blocks = [list(block) for block in partition]
            blocks[i].insert(0, first)
            out.append(tuple(tuple(block) for block in blocks))
        # Or make it the first block.  This canonical construction has no
        # duplicate partitions and keeps block order stable.
        out.append(((first,),) + partition)
    return out


def canonical_aliases(
    partition: tuple[tuple[int, ...], ...],
    collision: str,
    pinned: str,
) -> dict[str, str]:
    """Alias equal blocker centres, optionally to the pinned centre."""

    aliases: dict[str, str] = {}
    collision_block = None if collision == "none" else int(collision.removeprefix("class"))
    for block_index, block in enumerate(partition):
        representative = pinned if block_index == collision_block else f"b{block_index}"
        for row_index in block:
            aliases[f"b{row_index}"] = representative
    return aliases


def shell_intersection_patterns(
    partition: tuple[tuple[int, ...], ...], collision: str
) -> list[dict[int, tuple[str, ...]]]:
    """Enumerate every exact shell∩W pattern allowed by the dichotomy."""

    collision_block = None if collision == "none" else int(collision.removeprefix("class"))
    choices: list[list[tuple[str, ...]]] = []
    for block_index, block in enumerate(partition):
        base = tuple(f"w{i}" for i in block)
        if block_index == collision_block:
            options = [ROW]
        elif len(base) > 2:
            # A distinct blocker may meet W in at most two points, while all
            # points of its equality class must lie in that shell.
            return []
        else:
            extras = tuple(w for w in ROW if w not in base)
            options = [
                base + extra_tuple
                for extra_count in range(0, 3 - len(base))
                for extra_tuple in combinations(extras, extra_count)
            ]
        choices.append(options)
    return [
        {block_index: option for block_index, option in enumerate(options)}
        for options in product(*choices)
    ]


def assert_pattern_census(partitions: list[tuple[tuple[int, ...], ...]]) -> int:
    """Check that every allowed exact intersection pattern is enumerated."""

    total = 0
    for partition in partitions:
        for collision in ["none"] + [f"class{i}" for i in range(len(partition))]:
            patterns = shell_intersection_patterns(partition, collision)
            collision_block = None if collision == "none" else int(collision.removeprefix("class"))
            expected = 1
            for block_index, block in enumerate(partition):
                size = len(block)
                if block_index == collision_block:
                    options = 1
                elif size > 2:
                    options = 0
                else:
                    options = sum(
                        1
                        for extra_count in range(0, 3 - size)
                        for _ in combinations(range(4 - size), extra_count)
                    )
                expected *= options
            assert len(patterns) == expected
            for pattern in patterns:
                assert set(pattern) == set(range(len(partition)))
                for block_index, block in enumerate(partition):
                    base = {f"w{i}" for i in block}
                    intersection = set(pattern[block_index])
                    if block_index == collision_block:
                        assert intersection == set(ROW)
                    else:
                        assert base <= intersection and len(intersection) <= 2
            total += len(patterns)
    return total


def build_solver(
    order: tuple[str, ...],
    endpoint: str,
    endpoint_relation: str,
    partition: tuple[tuple[int, ...], ...],
    collision: str,
    intersections: dict[int, tuple[str, ...]] | None,
) -> tuple[Solver, tuple[str, ...], str, dict[str, str], dict[tuple[str, str], object]]:
    pinned = endpoint if endpoint_relation == "atEndpoint" else "canonicalSource"
    aliases = canonical_aliases(partition, collision, pinned)

    # Blocker centres are named metric points.  Anonymous shell fillers are
    # deliberately omitted: they are existential points used only to bring
    # each shell to cardinality four, avoiding an unsound global-distinctness
    # assumption across shells.
    dynamic = {f"b{i}" for i in range(4)}
    roles = tuple(dict.fromkeys(BASE_ROLES + tuple(sorted(dynamic))))
    canonical = {name: aliases.get(name, name) for name in roles}
    metric_roles = tuple(dict.fromkeys(canonical.values()))
    distances = {edge(a, b): Real(f"d_{a}_{b}") for a, b in combinations(metric_roles, 2)}

    def d(a: str, b: str):
        aa, bb = canonical.get(a, a), canonical.get(b, b)
        return 0 if aa == bb else distances[edge(aa, bb)]

    def positive_pairs(points: tuple[str, ...]) -> None:
        """Record positivity only where source ingress proves distinctness."""

        for a, b in combinations(points, 2):
            solver.add(d(a, b) > 0)

    def equidistant(center: str, support: tuple[str, ...]) -> None:
        for point in support[1:]:
            solver.add(d(center, point) == d(center, support[0]))
        # Shell semantics prove center nonmembership in its four-point
        # support; nonnegativity plus equidistance then covers all support
        # points without imposing cross-row separation.
        solver.add(d(center, support[0]) > 0)

    solver = Solver()
    for value in distances.values():
        solver.add(value >= 0)
    for a, b, c in combinations(metric_roles, 3):
        solver.add(d(a, b) + d(b, c) >= d(a, c))
        solver.add(d(a, b) + d(a, c) >= d(b, c))
        solver.add(d(a, c) + d(b, c) >= d(a, b))

    # Source-entitled distinctness packets.
    positive_pairs(order)

    # Source-proved cyclic order and strict Kalmanson inequalities.
    for ia, ib, ic, id_ in combinations(range(5), 4):
        a, b, c, e = order[ia], order[ib], order[ic], order[id_]
        solver.add(d(b, c) + d(a, e) < d(a, c) + d(b, e))
        solver.add(d(a, b) + d(c, e) < d(a, c) + d(b, e))

    source_shell = ("qOutside", "qBetween", "canonicalSource", "c2")
    fresh_shell = ("qOutside", "qBetween", "f1", "f2")
    positive_pairs(source_shell)
    positive_pairs(fresh_shell)
    equidistant("sourceCenter", source_shell)
    equidistant("freshCenter", fresh_shell)

    # The pinned selected four-row and (only off-endpoint) the separate
    # endpoint row from the corrected probe.
    positive_pairs(ROW)
    equidistant(pinned, ROW)
    if endpoint_relation == "offEndpoint":
        endpoint_row = ("e0", "e1", "e2", "e3")
        positive_pairs(endpoint_row)
        equidistant(endpoint, endpoint_row)

    # Distinct equality classes of blocker centres are source-distinct.
    blocker_representatives = tuple(aliases[f"b{block[0]}"] for block in partition)
    positive_pairs(tuple(dict.fromkeys(blocker_representatives)))

    if intersections is not None:
        add_branch_constraints(solver, aliases, pinned, partition, intersections, distances)

    return solver, metric_roles, pinned, aliases, distances


def add_branch_constraints(
    solver: Solver,
    aliases: dict[str, str],
    pinned: str,
    partition: tuple[tuple[int, ...], ...],
    intersections: dict[int, tuple[str, ...]],
    distances: dict[tuple[str, str], object],
) -> None:
    """Add one exact shell-intersection pattern to a cached base solver."""

    def d(a: str, b: str):
        aa, bb = aliases.get(a, a), aliases.get(b, b)
        return 0 if aa == bb else distances[edge(aa, bb)]

    for block_index, block in enumerate(partition):
        intersection = intersections[block_index]
        blocker = aliases[f"b{block[0]}"]
        radius = Real(f"blocker_radius_{block_index}")
        solver.add(radius > 0)
        for point in intersection:
            solver.add(d(blocker, point) == radius)
        for row_index in block:
            if f"w{row_index}" not in intersection:
                raise AssertionError("blocker shell lost its wi")
        if blocker == pinned:
            assert intersection == ROW
        else:
            assert len(intersection) <= 2


def replay(solver: Solver, result: str) -> bool:
    """Replay every assertion on a SAT model, or re-check UNSAT exactly."""

    if result == "sat":
        model = solver.model()
        return all(is_true(model.eval(assertion, model_completion=True)) for assertion in solver.assertions())
    if result == "unsat":
        replay_solver = Solver()
        replay_solver.add(*solver.assertions())
        return replay_solver.check() == unsat
    return False


def assert_alias_and_positive_self_checks(
    aliases: dict[str, str],
    partition: tuple[tuple[int, ...], ...],
    collision: str,
    pinned: str,
    order: tuple[str, ...],
) -> None:
    """Guard against accidentally reintroducing cross-row strictness."""

    # Every member of an equality class is allowed (and required) to alias
    # its representative; no positivity packet may separate those names.
    for block in partition:
        reps = {aliases[f"b{i}"] for i in block}
        assert len(reps) == 1
    if collision != "none":
        block_index = int(collision.removeprefix("class"))
        assert aliases[f"b{partition[block_index][0]}"] == pinned

    # The five source-order points are genuinely distinct and may not alias.
    assert len({aliases.get(point, point) for point in order}) == 5


def translated_solver(base: Solver) -> Solver:
    """Clone a base solver in C++ to avoid replaying Python add() calls."""

    return base.translate(base.ctx)


def run(
    csv_path: Path,
    selected_order_names: tuple[str, ...] | None = None,
    selected_endpoint_relations: tuple[str, ...] | None = None,
) -> Counter:
    rows = []
    counts: Counter[str] = Counter()
    motifs: Counter[str] = Counter()
    partitions = set_partitions((0, 1, 2, 3))
    pattern_total = assert_pattern_census(partitions)
    order_items = ORDER_ARMS.items()
    if selected_order_names is not None:
        order_items = ((name, ORDER_ARMS[name]) for name in selected_order_names)
    endpoint_relations = selected_endpoint_relations or ("offEndpoint", "atEndpoint")
    for order_name, (order, endpoint) in order_items:
        for endpoint_relation in endpoint_relations:
            for partition in partitions:
                for collision in ["none"] + [f"class{i}" for i in range(len(partition))]:
                    base_solver, metric_roles, pinned, aliases, distances = build_solver(
                        order,
                        endpoint,
                        endpoint_relation,
                        partition,
                        collision,
                        None,
                    )
                    assert_alias_and_positive_self_checks(
                        aliases, partition, collision, pinned, order
                    )
                    patterns = shell_intersection_patterns(partition, collision)
                    for intersections in patterns:
                        solver = translated_solver(base_solver)
                        add_branch_constraints(
                            solver, aliases, pinned, partition, intersections, distances
                        )
                        chosen_intersections = intersections
                        checked = solver.check()
                        result = str(checked)
                        replay_ok = replay(solver, result)
                        label = {
                            "sat": "SAT_ABSTRACTION",
                            "unsat": "UNSAT_ABSTRACTION",
                            "unknown": "UNKNOWN_ABSTRACTION",
                        }[result]
                        overlap_profile = ";".join(
                            f"class{block_index}:{len(intersection)}"
                            for block_index, intersection in sorted(chosen_intersections.items())
                        )
                        intersection_profile = ";".join(
                            f"class{block_index}:{'+'.join(intersection)}"
                            for block_index, intersection in sorted(chosen_intersections.items())
                        )
                        motif = f"blocks={len(partition)} collision={collision} overlap={overlap_profile}"
                        counts[result] += 1
                        motifs[motif] += 1
                        rows.append(
                            {
                                "order_arm": order_name,
                                "endpoint": endpoint,
                                "endpoint_relation": endpoint_relation,
                                "blocker_partition": "|".join("".join(map(str, block)) for block in partition),
                                "center_collision": collision,
                                "shell_intersections": intersection_profile,
                                "pinned_center": pinned,
                                "hterminal_witnesses": "w0" if endpoint_relation == "atEndpoint" else "w0|e0",
                                "blocker_caps_summary": CAP_LABEL_SUMMARY,
                                "cap_ingress_status": CAP_INGRESS_STATUS,
                                "coverage_status": COVERAGE_STATUS,
                                "metric_role_count": len(metric_roles),
                                "overlap_profile": overlap_profile,
                                "result": result,
                                "abstraction_label": label,
                                "exact_replay": str(replay_ok).lower(),
                            }
                        )
    fieldnames = list(rows[0])
    with csv_path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    print(f"rows={len(rows)} pattern_cases_per_order_endpoint={pattern_total} csv={csv_path}")
    print(f"cap_ingress={CAP_INGRESS_STATUS}")
    print(f"coverage={COVERAGE_STATUS}")
    print(f"census={dict(sorted(counts.items()))}")
    print("motifs:")
    for motif, count in motifs.most_common(12):
        print(f"  {count}x {motif}")
    return counts


if __name__ == "__main__":
    output = Path(__file__).with_suffix(".csv")
    # The checked artifact is the bounded first-arm round.  The unfiltered
    # call remains available to researchers, but is intentionally not
    # presented as live-residual coverage (see COVERAGE_STATUS).
    run(output, ("outside_fresh_between_source_canonical",), ("offEndpoint",))
