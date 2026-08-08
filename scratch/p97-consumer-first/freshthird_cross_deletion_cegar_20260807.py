#!/usr/bin/env python3
"""Source-faithful FreshThird cross-deletion successor round.

This is a diagnostic CEGAR round.  It keeps the full four-row/cap/equality
packet, selects one repeated-cap pair (with the source theorem's disjunction)
and one independent mutual-cross pair from the strengthened producer.  Each
selected survivor carries a four-point support over the represented carrier,
avoids the deleted source, and is checked as an exact positive-radius row in
the QF_LRA replay.
"""

from __future__ import annotations

import subprocess
import shutil
import sys
from itertools import combinations
from pathlib import Path
from time import monotonic

from z3 import And, Bool, If, Implies, Int, Not, Or, SolverFor, Sum, is_true, sat, unknown, unsat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_full_fidelity_cegar as F  # noqa: E402
import freshthird_all_row_shared_pair_cut_round as RowCuts  # noqa: E402
import freshthird_all_selected_row_pair_cut_round as PairCuts  # noqa: E402
from freshthird_rank_kalmanson_probe import ORDER_ARMS, DROW, ROW  # noqa: E402


OUT = HERE / "freshthird_cross_deletion_cegar_20260807.results.txt"
PAIR_LIST = tuple(combinations(range(4), 2))
NONFIRST_CAPS = (1, 2)
STRUCTURAL_TIMEOUT_MS = 4_000
METRIC_TIMEOUT_MS = 4_000


def add_cross_survivor_layer(solver, context):
    """Add cap-synchronized and independent mutual cross-deletion pairs.

    ``survive[z,w]`` means a row centered at blocker ``b_z`` survives deletion
    of source ``w_z``.  For the active pair the source theorem requires one or
    both directions; inactive pairs are forced false.  Support slots are rank
    selectors into the existing finite carrier abstraction, so every alias
    permitted by the source packet remains available.
    """
    ranks = context["ranks"]
    all_roles = tuple(context["all_roles"])
    bound = context["rank_bound"]
    blocker_cap = context["blocker_cap"]
    contains = context["contains"]
    active = {pair: Bool(f"cross_active_{pair[0]}_{pair[1]}") for pair in PAIR_LIST}
    survive = {}
    slots = {}
    for z, w in PAIR_LIST:
        survive[z, w] = Bool(f"cross_survive_{z}_{w}")
        survive[w, z] = Bool(f"cross_survive_{w}_{z}")
        for a, b in ((z, w), (w, z)):
            for t in range(4):
                key = (a, b, t)
                slots[key] = Int(f"cross_rank_{a}_{b}_{t}")
                solver.add(0 <= slots[key], slots[key] < bound)
                solver.add(Or(*[slots[key] == ranks[role] for role in all_roles]))

    solver.add(Sum([If(v, 1, 0) for v in active.values()]) == 1)
    for z, w in PAIR_LIST:
        same_cap = Or(*[
            And(blocker_cap[z, k], blocker_cap[w, k]) for k in range(3)
        ])
        pair_active = active[z, w]
        solver.add(Implies(pair_active, And(
            ranks[f"b{z}"] != ranks[f"b{w}"], same_cap,
        )))
        solver.add(Implies(Not(pair_active), And(
            Not(survive[z, w]), Not(survive[w, z]),
        )))
        # The source conclusion is disjunctive; do not assume both rows.
        solver.add(Implies(pair_active, Or(survive[z, w], survive[w, z])))

        for a, b in ((z, w), (w, z)):
            survived = survive[a, b]
            deleted = ranks[f"w{b}"]
            center = ranks[f"b{a}"]
            for t in range(4):
                slot = slots[a, b, t]
                solver.add(Implies(survived, slot != deleted))
                solver.add(Implies(survived, slot != center))
                for u in range(t):
                    solver.add(Implies(survived, slot != slots[a, b, u]))
            # The source equivalence identifies survival with omission from
            # the actual selectedAt(a) critical row, not merely from an
            # existential ambient witness.
            solver.add(Implies(survived, Not(contains[a, b])))

    # The strengthened source producer supplies a *separate* pair z,w with
    # both cross deletions surviving.  Do not identify it with the
    # cap-synchronized pair above: no source clause permits that equality.
    mutual_active = {pair: Bool(f"mutual_active_{pair[0]}_{pair[1]}")
                     for pair in PAIR_LIST}
    mutual_survive = {}
    mutual_slots = {}
    for z, w in PAIR_LIST:
        mutual_survive[z, w] = Bool(f"mutual_survive_{z}_{w}")
        mutual_survive[w, z] = Bool(f"mutual_survive_{w}_{z}")
        for a, b in ((z, w), (w, z)):
            solver.add(Implies(mutual_survive[a, b], Not(contains[a, b])))
            for t in range(4):
                key = (a, b, t)
                mutual_slots[key] = Int(f"mutual_rank_{a}_{b}_{t}")
                solver.add(0 <= mutual_slots[key], mutual_slots[key] < bound)
                solver.add(Or(*[mutual_slots[key] == ranks[role]
                                for role in all_roles]))
    solver.add(Sum([If(v, 1, 0) for v in mutual_active.values()]) == 1)
    for z, w in PAIR_LIST:
        pair_active = mutual_active[z, w]
        solver.add(Implies(pair_active, And(
            ranks[f"b{z}"] != ranks[f"b{w}"],
            mutual_survive[z, w], mutual_survive[w, z],
        )))
        solver.add(Implies(Not(pair_active), And(
            Not(mutual_survive[z, w]), Not(mutual_survive[w, z]),
        )))
        for a, b in ((z, w), (w, z)):
            for t in range(4):
                slot = mutual_slots[a, b, t]
                solver.add(Implies(mutual_survive[a, b],
                                   slot != ranks[f"w{b}"]))
                solver.add(Implies(mutual_survive[a, b],
                                   slot != ranks[f"b{a}"]))
                for u in range(t):
                    solver.add(Implies(mutual_survive[a, b],
                                       slot != mutual_slots[a, b, u]))

    context["cross_active"] = active
    context["cross_survive"] = survive
    context["cross_slots"] = slots
    context["mutual_active"] = mutual_active
    context["mutual_survive"] = mutual_survive
    context["mutual_slots"] = mutual_slots
    return {
        "active_pairs": len(PAIR_LIST),
        "mutual_active_pairs": len(PAIR_LIST),
        "directional_survivor_atoms": len(survive) + len(mutual_survive),
        "support_slots": len(slots) + len(mutual_slots),
        "assertions": len(solver.assertions()),
    }


def cross_metric_check(model, context, timeout_ms):
    """Replay F's exact-rational metric packet plus selected cross rows."""
    # Reuse the existing metric builder by reproducing its frozen structure and
    # then add the survivor equal-radius constraints in the same QF_LRA solver.
    from itertools import combinations as comb
    from z3 import Real

    representatives, rank_of = F._occupied_representatives(model, context)
    occupied = sorted(set(rank_of.values()))
    pos = {rank: i for i, rank in enumerate(occupied)}
    role_index = {role: pos[rank] for role, rank in rank_of.items()}
    solver = SolverFor("QF_LRA")
    solver.set(timeout=timeout_ms)
    distances = {
        (i, j): Real(f"cross_fixed_d_{i}_{j}")
        for i, j in comb(range(len(representatives)), 2)
    }

    def d(a, b):
        ia, ib = role_index[a], role_index[b]
        if ia == ib:
            return 0
        return distances[(ia, ib) if ia < ib else (ib, ia)]

    for variable in distances.values():
        solver.add(variable > 0)
    known_rows = (
        ("sourceCenter", F.SOURCE_SHELL),
        ("freshCenter", F.FRESH_SHELL),
        ("pinnedCenter", ROW),
        ("drowCenter", DROW),
    )
    for center, support in known_rows:
        radius = d(center, support[0])
        solver.add(radius > 0)
        for point in support[1:]:
            solver.add(d(center, point) == radius)
        support_ranks = {rank_of[p] for p in support}
        for representative in representatives:
            if rank_of[representative] not in support_ranks:
                solver.add(d(center, representative) != radius)

    radii = [Real(f"cross_blocker_radius_{z}") for z in range(4)]
    for z, radius in enumerate(radii):
        solver.add(radius > 0)
        for j, point in enumerate(ROW):
            member = F._bool_value(model, f"shell_{z}_contains_w{j}")
            solver.add(d(f"b{z}", point) == radius if member else d(f"b{z}", point) != radius)
        for t in range(3):
            solver.add(d(f"b{z}", f"a{z}_{t}") == radius)
        shell_ranks = {rank_of[f"w{z}"], *[rank_of[f"a{z}_{t}"] for t in range(3)]}
        for representative in representatives:
            if rank_of[representative] not in shell_ranks:
                solver.add(d(f"b{z}", representative) != radius)
        if rank_of["pinnedCenter"] == rank_of[f"b{z}"]:
            for point in ROW:
                solver.add(d(f"b{z}", point) == radius)
    for z, w in comb(range(4), 2):
        if rank_of[f"b{z}"] == rank_of[f"b{w}"]:
            solver.add(radii[z] == radii[w])

    for a, b, c in comb(representatives, 3):
        dab, dac, dbc = d(a, b), d(a, c), d(b, c)
        solver.add(dab + dbc > dac, dab + dac > dbc, dac + dbc > dab)
    for a, b, c, e in comb(representatives, 4):
        rhs = d(a, c) + d(b, e)
        solver.add(d(b, c) + d(a, e) < rhs)
        solver.add(d(a, b) + d(c, e) < rhs)

    rank_role = {}
    for role, rank in rank_of.items():
        rank_role.setdefault(rank, role)
    active_dirs = []
    for family in ("cross", "mutual"):
        survives = context[f"{family}_survive"]
        slots = context[f"{family}_slots"]
        for (a, b), survived in survives.items():
            if is_true(model.eval(survived, model_completion=True)):
                active_dirs.append(f"{family}:{a}->{b}")
                support = [rank_role[model.eval(slots[a, b, t]).as_long()]
                           for t in range(4)]
                radius = Real(f"{family}_survivor_radius_{a}_{b}")
                solver.add(radius > 0)
                for point in support:
                    solver.add(d(f"b{a}", point) == radius)
                    solver.add(d(f"b{a}", point) > 0)

    result = solver.check()
    cvc5_result = None
    cvc5_smt2 = None
    if result == unsat:
        # Cross-check an UNSAT metric replay with an independent exact-LRA
        # solver before treating it as a candidate obstruction.
        cvc5_smt2_path = HERE / "freshthird_cross_deletion_cegar_20260807.metric.smt2"
        cvc5_smt2_path.write_text(solver.to_smt2(), encoding="utf-8")
        cvc5_bin = shutil.which("cvc5")
        if cvc5_bin:
            try:
                proc = subprocess.run(
                    [cvc5_bin, "--lang=smt2"],
                    input=cvc5_smt2_path.read_text(encoding="utf-8"),
                    text=True, capture_output=True, timeout=timeout_ms / 1000,
                    check=False,
                )
                cvc5_result = proc.stdout.strip() or proc.stderr.strip()
            except subprocess.TimeoutExpired:
                cvc5_result = "timeout"
        cvc5_smt2 = str(cvc5_smt2_path)
    return result, {
        "occupied": len(representatives),
        "metric_assertions": len(solver.assertions()),
        "active_directions": ",".join(active_dirs),
        "cvc5_result": cvc5_result,
        "cvc5_smt2": cvc5_smt2,
    }


def run() -> None:
    started = monotonic()
    rows = []
    first_sat = None
    first_metric = None
    structural_total = 0
    structural_sat = 0
    structural_unknown = 0
    for order_name, order in ORDER_ARMS.items():
        for fresh_cap in NONFIRST_CAPS:
            for row_cap in NONFIRST_CAPS:
                structural, base_stats, context = F.build_pure_arm(order, STRUCTURAL_TIMEOUT_MS)
                added = F.add_full_fidelity_constraints(
                    structural, context, fresh_cap=fresh_cap, row_cap=row_cap,
                    enforce_equal_shell_slots_in_row=True,
                )
                # Preserve the prior source-derived 96 + 36 named-row cuts.
                row_cut_count = RowCuts.add_all_named_row_shared_pair_cuts(structural, context)
                pair_cut_count = PairCuts.add_all_named_row_pair_cuts(structural, context)
                cross_stats = add_cross_survivor_layer(structural, context)
                for pair in PAIR_LIST:
                    for mutual_pair in PAIR_LIST:
                        # Force concrete cap and independent mutual pairs for
                        # this branch while retaining all directional/support
                        # encodings in the common layer.  The two assignments
                        # are intentionally independent.
                        structural.push()
                        for other in PAIR_LIST:
                            structural.add(context["cross_active"][other] == (other == pair))
                            structural.add(context["mutual_active"][other] == (other == mutual_pair))
                        structural_total += 1
                        result = structural.check()
                        if result == unknown:
                            structural_unknown += 1
                        if result == sat:
                            structural_sat += 1
                            model = structural.model()
                            directions = [
                                f"cross:{a}->{b}" for (a, b), flag in context["cross_survive"].items()
                                if is_true(model.eval(flag, model_completion=True))
                            ] + [
                                f"mutual:{a}->{b}" for (a, b), flag in context["mutual_survive"].items()
                                if is_true(model.eval(flag, model_completion=True))
                            ]
                            record = {
                                "order": order_name, "fresh_cap": fresh_cap,
                                "row_cap": row_cap, "pair": f"{pair[0]}-{pair[1]}",
                                "mutual_pair": f"{mutual_pair[0]}-{mutual_pair[1]}",
                                "directions": ",".join(directions),
                                "aliases": F.model_summary(model, context)["alias_classes"],
                            }
                            if first_sat is None:
                                first_sat = record
                                metric_result, metric_stats = cross_metric_check(
                                    model, context, METRIC_TIMEOUT_MS
                                )
                                first_metric = {
                                    "result": str(metric_result), **metric_stats,
                                }
                            rows.append(record)
                        structural.pop()

    lines = [
        "campaign=freshthird_cross_deletion_cegar_20260807",
        "trust=diagnostic source-faithful finite rank abstraction plus exact-rational QF_LRA replay; no Lean closure",
        "source_contract=one repeated-cap distinct-blocker pair has a disjunctive cross survivor; an independent pair has both cross survivors and distinct blockers",
        "support_contract=each active direction has four distinct carrier-backed slots, excludes opposite deleted source and blocker center, and has positive equal-radius metric incidences",
        "coverage=4 order arms x 2 fresh caps x 2 row caps x 6 cap pairs x 6 independent mutual pairs; no pair identification assumed",
        f"structural_queries={structural_total}",
        f"structural_sat={structural_sat}",
        f"structural_unknown={structural_unknown}",
        "prior_cuts=named-row shared-pair separation: 96; selected-row pair separation: 36",
        f"first_structural_survivor={first_sat}",
        f"first_exact_metric_replay={first_metric}",
        f"elapsed_seconds={monotonic() - started:.3f}",
        "interpretation=SAT/UNKNOWN is diagnostic; no contradiction cut was promoted",
    ]
    for record in rows[:20]:
        lines.append("survivor=" + repr(record))
    if len(rows) > 20:
        lines.append(f"survivor_records_truncated={len(rows) - 20}")
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"results_path={OUT}")
    print(f"structural_queries={structural_total} sat={structural_sat} unknown={structural_unknown}")
    print(f"first_metric={first_metric}")


if __name__ == "__main__":
    run()
