#!/usr/bin/env python3
"""Source-faithful structural coverage query for FreshThird row consumers.

This is deliberately separate from the endpoint exact-support triangle: its
rows range over every source-entitled canonical or materialized selected row,
while the repeated-cap and mutual-cross witness pairs remain independent.  The
lazy loop searches for all four production Kalmanson schemas in each configured
branch and blocks only independently replayed metric cores.  A SAT result is a
survivor for that branch slice, never a universal survivor; an UNSAT result is
recorded with the exact branch and replay contract.
"""
from __future__ import annotations

import os, sys
from collections import Counter
from itertools import combinations, permutations, product
from pathlib import Path
from time import monotonic

from z3 import And, Bool, Int, Not, Or, SolverFor, is_expr, is_true, sat, unknown, unsat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))
import freshthird_full_fidelity_cegar as F  # noqa: E402
import freshthird_all_row_shared_pair_cut_round as RowCuts  # noqa: E402
import freshthird_all_selected_row_pair_cut_round as PairCuts  # noqa: E402
from freshthird_cross_deletion_cegar_20260807 import (  # noqa: E402
    NONFIRST_CAPS, PAIR_LIST, add_cross_survivor_layer,
)
from freshthird_cross_deletion_metric_cegar_20260808 import _metric_core_check  # noqa: E402
from freshthird_rank_kalmanson_probe import ORDER_ARMS, ROW  # noqa: E402

OUT = HERE / "freshthird_cross_row_kalmanson_universal_20260808.results.md"
BRANCH_LIMIT = int(os.environ.get("FRESHTHIRD_BRANCH_LIMIT", "576"))
TIMEOUT_MS = int(os.environ.get("FRESHTHIRD_STRUCTURAL_TIMEOUT_MS", "10000"))
METRIC_TIMEOUT_MS = int(os.environ.get("FRESHTHIRD_METRIC_TIMEOUT_MS", "2000"))
MAX_SURVIVORS = int(os.environ.get("FRESHTHIRD_MAX_SURVIVORS", "12"))
MAX_LAZY_CUTS = int(os.environ.get("FRESHTHIRD_MAX_LAZY_CUTS", "8"))

SCHEMAS = (
    ((0, (3, 5)), (1, (4, 5)), (2, (3, 4))),
    ((0, (4, 5)), (1, (3, 4)), (2, (3, 5))),
    ((3, (0, 2)), (4, (1, 2)), (5, (0, 1))),
    ((3, (1, 2)), (4, (0, 1)), (5, (0, 2))),
)


def _row_support(ranks, center: str, points: list[object], z: int | None,
                 explicit_shell=None):
    if explicit_shell is not None:
        shell = explicit_shell
    elif center == "pinnedCenter":
        shell = ROW
    else:
        assert z is not None
        shell = (f"w{z}", f"a{z}_0", f"a{z}_1", f"a{z}_2")
    return [Or(*[point == (term if is_expr(term) else ranks[term])
                 for term in shell]) for point in points]


def _descriptors(context):
    """Canonical plus materialized row origins (guards stay attached)."""
    d = [("sourceCenter", F.SOURCE_SHELL, None, None),
         ("freshCenter", F.FRESH_SHELL, None, None),
         ("pinnedCenter", ROW, None, None),
         ("drowCenter", F.DROW, None, None)]
    d += [(f"b{z}", (f"w{z}", f"a{z}_0", f"a{z}_1", f"a{z}_2"), z, None)
          for z in range(4)]
    for a, b in context["cross_survive"]:
        d.append((f"b{a}", tuple(context["cross_slots"][a, b, t] for t in range(4)),
                  a, context["cross_survive"][a, b]))
    for a, b in context["mutual_survive"]:
        d.append((f"b{a}", tuple(context["mutual_slots"][a, b, t] for t in range(4)),
                  a, context["mutual_survive"][a, b]))
    return d


def _term_value(model, context, term):
    return model.eval(context["ranks"][term] if isinstance(term, str) else term,
                      model_completion=True).as_long()


def _find_model_triangle(model, context):
    """Find one concrete six-distinct ordered bank motif in a SAT model."""
    desc = _descriptors(context)
    for triple in combinations(desc, 3):
        if any(g is not None and not is_true(model.eval(g, model_completion=True))
               for _, _, _, g in triple):
            continue
        for schema in SCHEMAS:
            for perm in permutations(range(3)):
                candidates = []
                valid = True
                for i in range(6):
                    sets = []
                    for row_index, pair in schema:
                        if i not in pair:
                            continue
                        center, shell, _, _ = triple[perm[row_index % 3]]
                        sets.append({_term_value(model, context, x) for x in shell})
                    # center indices are the physical row centers.
                    if i in {x[0] for x in schema}:
                        center, _, _, _ = triple[perm[i % 3]]
                        sets = [{_term_value(model, context, center)}]
                    if not sets:
                        valid = False; break
                    candidates.append(set.intersection(*sets))
                if not valid or any(not s for s in candidates):
                    continue
                for values in product(*candidates):
                    if len(set(values)) == 6 and all(values[i] < values[i + 1] for i in range(5)):
                        return triple, schema, perm
    return None


def _motif_formula(context, triple, schema, perm, serial):
    ranks = context["ranks"]; all_roles = tuple(context["all_roles"])
    m = [Int(f"lazy_kalm_m_{serial}_{i}") for i in range(6)]
    rows = []
    guards = [g for _, _, _, g in triple if g is not None]
    for row_index, pair in schema:
        center, shell, _, _ = triple[perm[row_index % 3]]
        rows.append(m[row_index] == ranks[center])
        rows.extend(_row_support(ranks, center, [m[i] for i in pair], None,
                                 explicit_shell=shell))
    aliases = And(*[Or(*[x == ranks[r] for r in all_roles]) for x in m])
    chain = And(*[m[i] < m[i + 1] for i in range(5)])
    return And(*(guards + [aliases, chain, *rows]))


def _branch_assertions(order, fresh_cap, row_cap):
    solver, _, context = F.build_pure_arm(order, TIMEOUT_MS)
    F.add_full_fidelity_constraints(solver, context, fresh_cap=fresh_cap,
                                   row_cap=row_cap,
                                   enforce_equal_shell_slots_in_row=True)
    RowCuts.add_all_named_row_shared_pair_cuts(solver, context)
    PairCuts.add_all_named_row_pair_cuts(solver, context)
    add_cross_survivor_layer(solver, context)
    return solver, context


def run():
    started = monotonic(); rows = []; counts = Counter(); survivors = 0
    branches = 0
    for order_name, order in ORDER_ARMS.items():
        for fresh_cap in NONFIRST_CAPS:
            for row_cap in NONFIRST_CAPS:
                solver, context = _branch_assertions(order, fresh_cap, row_cap)
                for cap_pair in PAIR_LIST:
                    for mutual_pair in PAIR_LIST:
                        if branches >= BRANCH_LIMIT: break
                        branches += 1; solver.push()
                        for p in PAIR_LIST:
                            solver.add(context["cross_active"][p] == (p == cap_pair))
                            solver.add(context["mutual_active"][p] == (p == mutual_pair))
                        base = list(solver.assertions()); cuts = 0; metric_cuts = 0
                        result = solver.check(); hit = None; terminal_metric = None
                        while result == sat and cuts < MAX_LAZY_CUTS:
                            hit = _find_model_triangle(solver.model(), context)
                            if hit is not None:
                                solver.add(Not(_motif_formula(context, *hit, cuts)))
                                cuts += 1; result = solver.check(); continue
                            model_now = solver.model()
                            metric_result, metric_stats, cut_terms = _metric_core_check(
                                model_now, context, METRIC_TIMEOUT_MS)
                            terminal_metric = (metric_result, metric_stats)
                            if metric_result == unsat and metric_stats.get("cvc5_result") == "unsat" and cut_terms:
                                solver.add(Or(*[term != model_now.eval(term, model_completion=True)
                                                for term in cut_terms]))
                                metric_cuts += 1; result = solver.check(); continue
                            break
                        info = {"branch": branches, "order": order_name,
                                "fresh_cap": fresh_cap, "row_cap": row_cap,
                                "cap_pair": cap_pair, "mutual_pair": mutual_pair}
                        info["lazy_motif_cuts"] = cuts
                        info["verified_metric_cuts"] = metric_cuts
                        if result == sat and hit is None:
                            counts["sat_survivor"] += 1; survivors += 1
                            info["result"] = "sat_survivor_under_complement"
                            if survivors <= MAX_SURVIVORS:
                                model = solver.model()
                                info["rank_model"] = {
                                    r: model.eval(context["ranks"][r], model_completion=True).as_long()
                                    for r in context["all_roles"]}
                                metric_result, metric_stats = terminal_metric or (None, {})
                                info["metric_replay"] = str(metric_result)
                                info["metric_stats"] = {
                                    k: metric_stats[k] for k in
                                    ("cvc5_result", "core_size", "core_minimized",
                                     "cut_width", "cut_terms", "core_reused")
                                    if k in metric_stats
                                }
                        elif result == unsat:
                            counts["unsat_after_lazy_cuts"] += 1
                            info["result"] = "unsat_after_lazy_cuts"
                        elif result == sat:
                            counts["sat_after_cut_budget"] += 1
                            info["result"] = "sat_after_cut_budget"
                        else:
                            counts["unknown"] += 1; info["result"] = "unknown"
                        rows.append(info); solver.pop()
                    if branches >= BRANCH_LIMIT: break
                if branches >= BRANCH_LIMIT: break
            if branches >= BRANCH_LIMIT: break
        if branches >= BRANCH_LIMIT: break
    lines = ["# FreshThird cross-row Kalmanson coverage query (2026-08-08)",
             "", "trust: source-faithful configured branch slice; no universal conclusion",
             "coverage: schemas=4, blocker_pairs=6, cap_witnesses=3, directions=2, row_permutations=6, six-index-orders=all strict chains",
             f"branches={branches}", f"counts={dict(counts)}", f"survivors_recorded={min(survivors, MAX_SURVIVORS)}", "", "## traces", ""]
    lines.extend(repr(r) for r in rows[:MAX_SURVIVORS + 20])
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"results_path={OUT}"); print(f"branches={branches} counts={dict(counts)} elapsed={monotonic()-started:.2f}s")


if __name__ == "__main__": run()
