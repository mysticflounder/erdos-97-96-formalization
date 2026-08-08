#!/usr/bin/env python3
"""FreshThird bounded motif scan over the complete cross-deletion round.

This is a structural, source-faithful diagnostic.  For every one of the 576
cap/order/pair branches from the preceding cross-deletion round, it searches
the actual blocker shells for two distinct blocker centers and two distinct
shared support points.  Shared shell membership supplies the four
source-derived equal-radius incidences.  The scanner then tests all four
nonalternating linear orders consumed by
``false_of_two_centers_equidistant_pair_{after,enclosed,split,before}``.
"""

from __future__ import annotations

import sys
from collections import Counter
from itertools import combinations, permutations
from pathlib import Path
from time import monotonic

from z3 import And, Not, Or, is_true, sat, unknown

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_full_fidelity_cegar as F  # noqa: E402
import freshthird_all_row_shared_pair_cut_round as RowCuts  # noqa: E402
import freshthird_all_selected_row_pair_cut_round as PairCuts  # noqa: E402
from freshthird_cross_deletion_cegar_20260807 import (  # noqa: E402
    NONFIRST_CAPS,
    PAIR_LIST,
    add_cross_survivor_layer,
    cross_metric_check,
)
from freshthird_rank_kalmanson_probe import ORDER_ARMS  # noqa: E402


OUT = HERE / "freshthird_cross_deletion_motif_scan_20260808.results.md"


def shell_ranks(model, context, blocker: int) -> set[int]:
    ranks = context["ranks"]
    result = {model.eval(ranks[f"w{blocker}"], model_completion=True).as_long()}
    for t in range(3):
        result.add(model.eval(ranks[f"a{blocker}_{t}"], model_completion=True).as_long())
    return result


def rank_value(model, context, role: str) -> int:
    return model.eval(context["ranks"][role], model_completion=True).as_long()


def order_kind(center_a: int, center_b: int, point_a: int, point_b: int) -> str | None:
    """Return the matching TwoCenterBisectorParity order, if any."""

    # The theorem names use p1 < p2 and then the indicated center placement.
    if point_a < point_b < center_a < center_b:
        return "after"
    if point_a < center_b < center_a < point_b:
        return "enclosed"
    if center_b < point_a < point_b < center_a:
        return "split"
    if center_b < center_a < point_a < point_b:
        return "before"
    return None


def motif_formulas(context):
    """Encode existence of any source-entitled two-centre motif.

    Slot ranks are physical representatives, so equalities between slots
    cover every alias permitted by the finite ingress.  This is the formula
    negated in each branch's universal coverage query; inspecting one SAT
    model alone is intentionally not used as a coverage proof.
    """

    ranks = context["ranks"]
    shell_roles = {
        z: (f"w{z}", f"a{z}_0", f"a{z}_1", f"a{z}_2")
        for z in range(4)
    }
    formulas = []
    for i, j in combinations(range(4), 2):
        for ca, cb in ((f"b{i}", f"b{j}"), (f"b{j}", f"b{i}")):
            # Pick both points from shell i; each is required to alias some
            # slot in shell j.  This compactly represents every shared
            # physical pair without four nested slot loops.
            for s1 in shell_roles[i]:
                for s2 in shell_roles[i]:
                    if s1 == s2:
                        continue
                    p1, p2 = ranks[s1], ranks[s2]
                    shared = And(
                        Or(*[p1 == ranks[t] for t in shell_roles[j]]),
                        Or(*[p2 == ranks[t] for t in shell_roles[j]]),
                        p1 != p2,
                    )
                    order_arms = Or(
                        And(p1 < p2, p2 < ranks[ca], ranks[ca] < ranks[cb]),
                        And(p1 < ranks[cb], ranks[cb] < ranks[ca], ranks[ca] < p2),
                        And(ranks[cb] < p1, p1 < p2, p2 < ranks[ca]),
                        And(ranks[cb] < ranks[ca], ranks[ca] < p1, p1 < p2),
                    )
                    formulas.append(And(
                        ranks[ca] != ranks[cb], shared, order_arms,
                    ))
    return formulas


def pair_relation(cap_pair: tuple[int, int], mutual_pair: tuple[int, int]) -> str:
    overlap = len(set(cap_pair) & set(mutual_pair))
    return "same" if overlap == 2 else "shared-one" if overlap == 1 else "disjoint"


def scan_model(model, context, mutual_pair: tuple[int, int]) -> dict:
    """Scan all actual blocker-shell pairs and classify missing premises."""

    centers = {z: rank_value(model, context, f"b{z}") for z in range(4)}
    shells = {z: shell_ranks(model, context, z) for z in range(4)}
    motif_rows = []
    missing = Counter()
    distinct_center_pairs = 0
    shared_pairs = 0
    for i, j in combinations(range(4), 2):
        if centers[i] == centers[j]:
            continue
        distinct_center_pairs += 1
        shared = sorted(shells[i] & shells[j])
        if len(shared) < 2:
            missing["insufficient_shared_support_points"] += 1
            continue
        shared_pairs += 1
        # Every rank in this intersection is in both exact source shells, so
        # each center has equal radius to both points: four incidences total.
        incidence_ok = all(point in shells[i] and point in shells[j] for point in shared)
        if not incidence_ok:
            missing["missing_four_equal_radius_incidences"] += 1
            continue
        found = None
        for ca, cb in ((centers[i], centers[j]), (centers[j], centers[i])):
            for pa, pb in permutations(shared, 2):
                kind = order_kind(ca, cb, pa, pb)
                if kind is not None:
                    found = {
                        "blockers": f"{i},{j}",
                        "centers": f"{ca},{cb}",
                        "points": f"{pa},{pb}",
                        "order": kind,
                        "mutual_pair": f"{mutual_pair[0]}-{mutual_pair[1]}",
                    }
                    break
            if found is not None:
                break
        if found is None:
            missing["no_nonalternating_boundary_order"] += 1
        else:
            motif_rows.append(found)
    if distinct_center_pairs == 0:
        missing["no_distinct_actual_blocker_centers"] += 1
    if not motif_rows:
        missing["no_two_center_motif"] += 1
    return {
        "motifs": motif_rows,
        "missing": dict(missing),
        "distinct_center_pairs": distinct_center_pairs,
        "shared_pairs": shared_pairs,
    }


def run() -> None:
    started = monotonic()
    total = sat_count = unknown_count = 0
    motif_count = 0
    motif_free_unsat = motif_free_sat = motif_free_unknown = 0
    branch_rows = []
    # Keep diagnostics from one arbitrary SAT model separate from the
    # source-faithful motif-free survivors.  Only the latter are relevant to
    # the universal-coverage conclusion.
    arbitrary_missing_total = Counter()
    missing_total = Counter()
    order_counts = Counter()
    metric_reps = {}
    for order_name, order in ORDER_ARMS.items():
        for fresh_cap in NONFIRST_CAPS:
            for row_cap in NONFIRST_CAPS:
                structural, _base_stats, context = F.build_pure_arm(
                    order, F.STRUCTURAL_TIMEOUT_MS
                )
                F.add_full_fidelity_constraints(
                    structural, context, fresh_cap=fresh_cap, row_cap=row_cap,
                    enforce_equal_shell_slots_in_row=True,
                )
                RowCuts.add_all_named_row_shared_pair_cuts(structural, context)
                PairCuts.add_all_named_row_pair_cuts(structural, context)
                add_cross_survivor_layer(structural, context)
                motif_expr = Or(*motif_formulas(context))
                for cap_pair in PAIR_LIST:
                    for mutual_pair in PAIR_LIST:
                        structural.push()
                        for other in PAIR_LIST:
                            structural.add(context["cross_active"][other] == (other == cap_pair))
                            structural.add(context["mutual_active"][other] == (other == mutual_pair))
                        total += 1
                        result = structural.check()
                        if result == unknown:
                            # The first pass is intentionally cheap.  Retry
                            # unresolved branches with a staged 30s timeout so
                            # coverage is not silently reported as UNKNOWN.
                            structural.set(timeout=30_000)
                            result = structural.check()
                            structural.set(timeout=F.STRUCTURAL_TIMEOUT_MS)
                        branch_info = {
                            "branch": total,
                            "order": order_name,
                            "fresh_cap": fresh_cap,
                            "row_cap": row_cap,
                            "cap_pair": f"{cap_pair[0]}-{cap_pair[1]}",
                            "mutual_pair": f"{mutual_pair[0]}-{mutual_pair[1]}",
                        }
                        if result == unknown:
                            unknown_count += 1
                            branch_rows.append({**branch_info, "result": "unknown"})
                        elif result == sat:
                            sat_count += 1
                            model = structural.model()
                            scan = scan_model(model, context, mutual_pair)
                            motifs = scan["motifs"]
                            motif_count += len(motifs)
                            for motif in motifs:
                                order_counts[motif["order"]] += 1
                            arbitrary_missing_total.update(scan["missing"])
                            # Universal coverage query: UNSAT after negating
                            # the finite motif disjunction proves every valid
                            # structural model has such a motif.  The
                            # arbitrary model above is diagnostic only.
                            structural.push()
                            structural.add(Not(motif_expr))
                            motif_free_result = structural.check()
                            if motif_free_result == unknown:
                                structural.set(timeout=30_000)
                                motif_free_result = structural.check()
                                structural.set(timeout=F.STRUCTURAL_TIMEOUT_MS)
                            motif_free_details = {}
                            if motif_free_result == sat:
                                motif_free_sat += 1
                                free_model = structural.model()
                                free_scan = scan_model(free_model, context, mutual_pair)
                                missing_total.update(free_scan["missing"])
                                motif_free_details = {
                                    "missing": free_scan["missing"],
                                    "distinct_center_pairs": free_scan["distinct_center_pairs"],
                                    "shared_pairs": free_scan["shared_pairs"],
                                }
                                relation = pair_relation(cap_pair, mutual_pair)
                                metric_reps.setdefault(
                                    (order_name, fresh_cap, row_cap, relation),
                                    (free_model, context, cap_pair, mutual_pair),
                                )
                            elif motif_free_result == unknown:
                                motif_free_unknown += 1
                            else:
                                motif_free_unsat += 1
                            structural.pop()
                            branch_rows.append({
                                **branch_info,
                                "result": "sat",
                                "motif_count": len(motifs),
                                "motifs": motifs[:8],
                                "missing": scan["missing"],
                                "motif_free_query": str(motif_free_result),
                                "motif_free_details": motif_free_details,
                            })
                        structural.pop()

    no_motif = [row for row in branch_rows if row.get("motif_free_query") == "sat"]

    # Incomplete universal motif coverage triggers one exact metric replay per
    # justified S4 row-relabeling orbit.  With fixed order/cap arms, pair
    # assignments are classified by same/shared-one/disjoint intersection.
    metric_results = {}
    for key, (model, context, cap_pair, mutual_pair) in metric_reps.items():
        metric_result, metric_stats = cross_metric_check(model, context, 4_000)
        if str(metric_result) == "unknown":
            metric_result, metric_stats = cross_metric_check(model, context, 30_000)
        metric_results[str(key)] = {
            "result": str(metric_result),
            "stats": metric_stats,
            "cap_pair": f"{cap_pair[0]}-{cap_pair[1]}",
            "mutual_pair": f"{mutual_pair[0]}-{mutual_pair[1]}",
        }
    lines = [
        "# FreshThird cross-deletion motif scan (2026-08-08)",
        "",
        "trust: source-faithful structural diagnostic; no Lean closure or promoted cut",
        "motif: two distinct actual blocker centers, two distinct shared shell points, four shell-derived equal-radius incidences, and an order matching after/enclosed/split/before",
        "coverage: 4 order arms x 2 fresh caps x 2 row caps x 6 cap pairs x 6 independent mutual pairs",
        f"structural_queries: {total}",
        f"structural_sat: {sat_count}",
        f"structural_unknown: {unknown_count}",
        f"motif_witnesses_in_arbitrary_models: {motif_count}",
        f"motif_free_unsat_universal_coverage: {motif_free_unsat}",
        f"motif_free_sat_counterexamples: {motif_free_sat}",
        f"motif_free_unknown: {motif_free_unknown}",
        f"branches_without_motif: {len(no_motif)}",
        f"order_counts: {dict(order_counts)}",
        f"arbitrary_model_missing_field_counts: {dict(arbitrary_missing_total)}",
        f"motif_free_missing_field_counts: {dict(missing_total)}",
        f"metric_representative_orbits: {len(metric_results)}",
        f"metric_results: {metric_results}",
        f"elapsed_seconds: {monotonic() - started:.3f}",
        "",
        "## First survivors and missing fields",
        "",
    ]
    for row in branch_rows[:40]:
        lines.append(repr(row))
    if len(branch_rows) > 40:
        lines.append(f"... {len(branch_rows) - 40} additional branches omitted")
    if no_motif:
        lines.extend(["", "## First branches without a motif", ""])
        for row in no_motif[:20]:
            lines.append(repr(row))
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"results_path={OUT}")
    print(f"structural_queries={total} sat={sat_count} unknown={unknown_count}")
    print(f"motif_witnesses={motif_count} universal_unsat={motif_free_unsat} counterexamples={motif_free_sat} unknown={motif_free_unknown}")
    print(f"metric_representative_orbits={len(metric_results)}")
    print(f"missing_field_counts={dict(missing_total)}")


if __name__ == "__main__":
    run()
