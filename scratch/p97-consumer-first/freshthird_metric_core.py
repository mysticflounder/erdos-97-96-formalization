#!/usr/bin/env python3
"""Named UNSAT-core audit for one completed FreshThird structure.

This freezes the first model of the full-fidelity structural solver for
``outside_fresh_between_source_canonical`` with caps ``(1, 1)`` and rebuilds
the exact metric checker with tracked assertions.  It deliberately does not
enumerate another structural arm or cap pair.
"""

from __future__ import annotations

import sys
from collections import Counter, defaultdict
from itertools import combinations
from pathlib import Path

from z3 import And, Bool, If, Implies, Not, Or, Real, Solver, SolverFor, Sum, sat, unknown

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from freshthird_full_fidelity_cegar import (  # noqa: E402
    ANON_ROLES,
    DROW,
    FRESH_SHELL,
    ORDER_ARMS,
    ROW,
    SEED,
    SOURCE_SHELL,
    STRUCTURAL_TIMEOUT_MS,
    add_full_fidelity_constraints,
    build_pure_arm,
    model_summary,
)
from freshthird_two_level_cegar import (  # noqa: E402
    METRIC_TIMEOUT_MS,
    _bool_value,
    _occupied_representatives,
)


def tracked_metric(model, context, *, solve_core=True, raw_core=False):
    representatives, rank_of = _occupied_representatives(model, context)
    occupied_ranks = sorted({rank_of[role] for role in rank_of})
    rank_position = {rank: i for i, rank in enumerate(occupied_ranks)}
    role_index = {role: rank_position[rank] for role, rank in rank_of.items()}
    distances = {
        (i, j): Real(f"core_fixed_d_{i}_{j}")
        for i, j in combinations(range(len(representatives)), 2)
    }

    def d(a: str, b: str):
        ia, ib = role_index[a], role_index[b]
        if ia == ib:
            return 0
        return distances[(ia, ib) if ia < ib else (ib, ia)]

    records = []
    kalmanson_specs = {}

    def record(family: str, detail: str, expr):
        index = len(records)
        label = f"a{index:05d}_{family}"
        records.append((label, family, detail, expr))
        return label

    for pair, variable in distances.items():
        record("distance_positive", f"occupied_pair={pair}", variable > 0)

    known_rows = (
        ("sourceCenter", SOURCE_SHELL),
        ("freshCenter", FRESH_SHELL),
        ("pinnedCenter", ROW),
        ("drowCenter", DROW),
    )
    for center, support in known_rows:
        radius = d(center, support[0])
        record("known_row_radius_positive", f"center={center}", radius > 0)
        for point in support[1:]:
            record("known_row_equal_radius", f"center={center},point={point}", d(center, point) == radius)
        support_ranks = {rank_of[point] for point in support}
        for representative in representatives:
            if rank_of[representative] not in support_ranks:
                record("known_row_exclusion", f"center={center},point={representative}", d(center, representative) != radius)

    radii = [Real(f"core_fixed_blocker_radius_{z}") for z in range(4)]
    for z, radius in enumerate(radii):
        record("blocker_radius_positive", f"blocker=b{z}", radius > 0)
        for j, point in enumerate(ROW):
            member = _bool_value(model, f"shell_{z}_contains_w{j}")
            relation = d(f"b{z}", point) == radius if member else d(f"b{z}", point) != radius
            record("blocker_row_membership", f"blocker=b{z},point={point},member={member}", relation)
        for t in range(3):
            record("blocker_slot_shell", f"blocker=b{z},slot=a{z}_{t}", d(f"b{z}", f"a{z}_{t}") == radius)
        # The frozen structural model already fixes the exact support of this
        # critical shell: w_z and its three pairwise-distinct anonymous slots.
        # Assert the complementary exclusions directly.  Together with the
        # four positive equalities above, this is equivalent to the previous
        # branching `Sum (If ...) = 4`, but leaves the metric packet in LRA.
        shell_ranks = {
            rank_of[f"w{z}"],
            *[rank_of[f"a{z}_{t}"] for t in range(3)],
        }
        assert len(shell_ranks) == 4
        for representative in representatives:
            if rank_of[representative] not in shell_ranks:
                record(
                    "blocker_shell_exclusion",
                    f"blocker=b{z},point={representative}",
                    d(f"b{z}", representative) != radius,
                )
        same_center = rank_of["pinnedCenter"] == rank_of[f"b{z}"]
        if same_center:
            for point in ROW:
                record("pinned_blocker_full_row_shell", f"blocker=b{z},point={point}", d(f"b{z}", point) == radius)

    for z, w in combinations(range(4), 2):
        if rank_of[f"b{z}"] == rank_of[f"b{w}"]:
            record("equal_blocker_radius", f"blockers=b{z},b{w}", radii[z] == radii[w])

    for a, b, c in combinations(representatives, 3):
        dab, dac, dbc = d(a, b), d(a, c), d(b, c)
        record("triangle", f"triple={a},{b},{c};side=bc+ab>ac", dab + dbc > dac)
        record("triangle", f"triple={a},{b},{c};side=ac+ab>bc", dab + dac > dbc)
        record("triangle", f"triple={a},{b},{c};side=ac+bc>ab", dac + dbc > dab)

    for a, b, c, e in combinations(representatives, 4):
        rhs = d(a, c) + d(b, e)
        first = record(
            "kalmanson",
            f"quad={a},{b},{c},{e};first",
            d(b, c) + d(a, e) < rhs,
        )
        second = record(
            "kalmanson",
            f"quad={a},{b},{c},{e};second",
            d(a, b) + d(c, e) < rhs,
        )
        kalmanson_specs[first] = (a, b, c, e, "first")
        kalmanson_specs[second] = (a, b, c, e, "second")

    groups = []
    grouped = defaultdict(list)
    for i, (_label, family, _detail, expr) in enumerate(records):
        grouped[family].append((i, expr))
    for family, entries in grouped.items():
        groups.append((family, entries))

    if not solve_core:
        return {
            "result": None,
            "representatives": representatives,
            "rank_of": rank_of,
            "records": records,
            "groups": groups,
            "metric_distances": distances,
            "metric_role_index": role_index,
            "kalmanson_specs": kalmanson_specs,
            "family_core": [],
            "assertion_core": [],
            "family_ablation": [],
            "solver_assertions": len(records),
        }

    if raw_core:
        # One-shot tracked solve followed by deletion shrink over only the
        # solver-returned core.  This avoids the expensive family ablation.
        tracked = SolverFor("QF_LRA")
        tracked.set(timeout=120000)
        literals = {}
        for label, _family, _detail, expr in records:
            literal = Bool(f"track_{label}")
            literals[label] = literal
            tracked.assert_and_track(expr, literal)
        result = tracked.check()
        raw_labels = [str(lit).removeprefix("track_")
                      for lit in tracked.unsat_core()] if result == solver_check_unsat else []
        shrunk = list(raw_labels)
        shrink_status = []
        for label in list(raw_labels):
            candidate = [other for other in shrunk if other != label]
            probe = SolverFor("QF_LRA")
            probe.set(timeout=3000)
            for other in candidate:
                probe.add(next(expr for lab, _fam, _det, expr in records if lab == other))
            test = probe.check()
            shrink_status.append((label, str(test)))
            if test == solver_check_unsat:
                shrunk = candidate
        return {
            "result": result,
            "representatives": representatives,
            "rank_of": rank_of,
            "records": records,
            "groups": groups,
            "metric_distances": distances,
            "metric_role_index": role_index,
            "kalmanson_specs": kalmanson_specs,
            "family_core": [],
            "assertion_core": [],
            "family_ablation": [],
            "solver_assertions": len(records),
            "raw_core": raw_labels,
            "shrunk_core": shrunk,
            "shrink_status": shrink_status,
        }

    def solve(group_indices, timeout_ms=2000):
        solver = SolverFor("QF_LRA")
        solver.set(timeout=timeout_ms)
        for gi in group_indices:
            solver.add(*[expr for _i, expr in groups[gi][1]])
        return solver.check()

    # Unguarded family ablation preserves the exact QF_LRA packet and avoids
    # the severe performance loss caused by implication guards.  Remove every
    # non-protected family when the remainder is still UNSAT, then test the two
    # families that the resulting source/order motif is expected to retain.
    result = solve(list(range(len(groups))), timeout_ms=10000)
    family_ablation = []
    protected = {"known_row_exclusion", "blocker_slot_shell"}
    active = list(range(len(groups)))
    for gi, (family, _entries) in enumerate(groups):
        if family in protected:
            continue
        candidate = [i for i in active if i != gi]
        test = solve(candidate, timeout_ms=3000)
        family_ablation.append((family, str(test), test == solver_check_unsat))
        if test == solver_check_unsat:
            active = candidate
    for gi, (family, _entries) in enumerate(groups):
        if family not in protected:
            continue
        candidate = [i for i in active if i != gi]
        test = solve(candidate, timeout_ms=3000)
        family_ablation.append((family, str(test), test == solver_check_unsat))
        if test == solver_check_unsat:
            active = candidate

    # Shrink individual assertions inside the surviving family set.
    assertion_core = [i for gi in active for i, _expr in groups[gi][1]]
    for index in list(assertion_core):
        candidate = [i for i in assertion_core if i != index]
        test_solver = SolverFor("QF_LRA")
        test_solver.set(timeout=2000)
        test_solver.add(*[records[i][3] for i in candidate])
        test = test_solver.check()
        if test == solver_check_unsat:
            assertion_core = candidate

    return {
        "result": result,
        "representatives": representatives,
        "rank_of": rank_of,
        "records": records,
        "groups": groups,
        "metric_distances": distances,
        "metric_role_index": role_index,
        "kalmanson_specs": kalmanson_specs,
        "family_core": active,
        "assertion_core": assertion_core,
        "family_ablation": family_ablation,
        "solver_assertions": len(records),
    }


# Avoid a second z3 import in the shrink loop's comparison expression.
solver_check_unsat = __import__("z3").unsat


def render(report):
    records = report["records"]
    lines = [
        "campaign=freshthird_metric_unsat_core_v1",
        "configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1 first_structural_model",
        "trust=diagnostic exact-rational SMT only; core is fixed-structure metric UNSAT, not Lean closure",
        f"metric_result={report['result']} representatives={len(report['representatives'])} metric_assertions={report['solver_assertions']}",
        "representatives=" + ",".join(report["representatives"]),
        "alias_classes=" + ";".join(
            "/".join(role for role in context_roles if report["rank_of"][role] == rank)
            for rank in sorted(set(report["rank_of"].values()))
            for context_roles in [tuple(report["rank_of"])]
        ),
    ]
    groups = report["groups"]
    lines.append("family_ablation=" + ";".join(f"{family}:{status}:removed={removed}" for family, status, removed in report["family_ablation"]))
    for key in ("family_core",):
        group_indices = report[key]
        family_counts = Counter(groups[gi][0] for gi in group_indices)
        lines.append(f"{key}_size={len(group_indices)}")
        lines.append(f"{key}_families=" + ",".join(f"{k}:{v}" for k, v in sorted(family_counts.items())))
        for gi in group_indices:
            family, entries = groups[gi]
            lines.append(f"{key}_family={family} assertions={len(entries)}")
    lines.append(f"assertion_core_size={len(report['assertion_core'])}")
    for i in report["assertion_core"]:
        label, family, detail, _stored_expr = records[i]
        lines.append(f"assertion_core={label} family={family} detail={detail}")
    lines += [
        "source_produced_families=known_row_radius_positive,known_row_equal_radius,known_row_exclusion,blocker_row_membership,blocker_shell_exclusion,pinned_blocker_full_row_shell,equal_blocker_radius",
        "encoder_or_consumer_families=distance_positive,blocker_radius_positive,blocker_slot_shell,triangle,kalmanson",
        "structural_constraints=full-fidelity aliases/order/caps were solved before freezing this model; each blocker shell is replayed as four positive radius equalities plus complementary exclusions over all occupied representatives; anonymous slots and occupied-representative compression remain finite encoder scaffolding and are not re-proven by the metric core",
        "core_reading=interpret only the core emitted by this run; the source-fidelity correction changes the first structural representative and invalidates the historical three-assertion reading",
    ]
    return "\n".join(lines) + "\n"


if __name__ == "__main__":
    order_name = "outside_fresh_between_source_canonical"
    structural, base_stats, context = build_pure_arm(ORDER_ARMS[order_name], STRUCTURAL_TIMEOUT_MS)
    added = add_full_fidelity_constraints(structural, context, fresh_cap=1, row_cap=1)
    if structural.check() != sat:
        raise SystemExit("first structural model was not SAT")
    model = structural.model()
    summary = model_summary(model, context)
    report = tracked_metric(model, context)
    output = Path(__file__).with_suffix(".results.txt")
    output.write_text(render(report), encoding="utf-8")
    print(f"wrote {output} family_core={len(report['family_core'])} assertion_core={len(report['assertion_core'])} result={report['result']}")
