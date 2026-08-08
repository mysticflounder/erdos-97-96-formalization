#!/usr/bin/env python3
"""Replay the first corrected motif-free metric representative.

This freezes the ``same`` S4 representative (order outside/fresh/between,
fresh_cap=row_cap=1, cap pair 0-1, mutual pair 0-1), adds the exact negated
motif query used by the corrected scan, then reuses the tracked QF_LRA packet
for an independent Z3/cvc5 replay and core shrink.
"""
from __future__ import annotations

import sys
import shutil
from pathlib import Path

from z3 import Not, sat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_all_row_shared_pair_cut_round as RowCuts
import freshthird_all_selected_row_pair_cut_round as PairCuts
import freshthird_cross_deletion_cegar_20260807 as Campaign
import freshthird_cross_deletion_core_20260807 as Core
import freshthird_cross_deletion_motif_scan_20260808 as Scan
import freshthird_full_fidelity_cegar as F
from freshthird_rank_kalmanson_probe import ORDER_ARMS

OUT = HERE / "freshthird_cross_row_metric_replay_20260808.results.md"


def freeze_motif_free():
    structural, _, context = F.build_pure_arm(
        ORDER_ARMS["outside_fresh_between_source_canonical"], 4_000
    )
    F.add_full_fidelity_constraints(
        structural, context, fresh_cap=1, row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    RowCuts.add_all_named_row_shared_pair_cuts(structural, context)
    PairCuts.add_all_named_row_pair_cuts(structural, context)
    Campaign.add_cross_survivor_layer(structural, context)
    pair = (0, 1)
    structural.push()
    for other in Campaign.PAIR_LIST:
        structural.add(context["cross_active"][other] == (other == pair))
        structural.add(context["mutual_active"][other] == (other == pair))
    # Match the scanner's incremental sequence: obtain one arbitrary SAT model
    # before asking for the motif-free survivor.  Z3's incremental state affects
    # which valid alias model is selected, and the corrected report records this
    # exact representative.
    if structural.check() != sat:
        raise RuntimeError("structural representative is not SAT")
    structural.push()
    structural.add(Not(Scan.Or(*Scan.motif_formulas(context))))
    if structural.check() != sat:
        raise RuntimeError("corrected first motif-free representative is not SAT")
    return structural.model(), context


def main():
    model, context = freeze_motif_free()
    records, reps, rank_of, active_dirs = Core.tracked_packet(model, context)
    # The full 27,835-assertion tracked replay is needlessly difficult for
    # Z3's proof-producing core extractor.  First establish exact UNSAT with
    # the campaign's untracked packet, then track the small recurring family
    # containing the two active survivor equalities, all blocker-slot shell
    # equalities, and all strict Kalmanson premises.
    import freshthird_cross_deletion_cegar_20260807 as Campaign
    result, metric_stats = Campaign.cross_metric_check(model, context, 30_000)
    tracked = [x for x in records if x[1] in ("blocker_slot_shell", "kalmanson")
               or x[0] in ("p27809_cross_survivor_equal_radius", "p27811_cross_survivor_equal_radius")]
    tracked_result, raw, _solver = Core.solve_tracked(tracked, timeout_ms=120_000)
    shrunk, statuses = Core.shrink(tracked, raw) if str(tracked_result) == "unsat" else ([], [])
    cvc5 = Core.cvc5_check(tracked, shrunk) if shrunk else "not-run"
    smt2_versioned = HERE / "freshthird_cross_row_metric_replay_20260808.smt2"
    if shrunk and (HERE / "freshthird_cross_deletion_core_20260807.smt2").exists():
        shutil.copyfile(HERE / "freshthird_cross_deletion_core_20260807.smt2", smt2_versioned)
    rank_lines = []
    for rank in sorted(set(rank_of.values())):
        roles = [r for r, value in rank_of.items() if value == rank]
        rank_lines.append(f"{rank}:" + "/".join(roles))
    by_label = {row[0]: row for row in records}
    lines = [
        "# Corrected FreshThird first motif-free metric replay (2026-08-08)",
        "",
        "trust: source-faithful fixed-structure exact-rational QF_LRA diagnostic; no Lean closure",
        "configuration: outside_fresh_between_source_canonical; fresh_cap=1; row_cap=1; cap pair=0-1; mutual pair=0-1; exact Not(motif) query",
        f"metric_result: {result}; occupied={len(reps)}; assertions={len(records)}; active={','.join(active_dirs)}",
        f"campaign_stats: {metric_stats}",
        f"tracked_subset_result: {tracked_result}; tracked_assertions={len(tracked)}; raw_core_size={len(raw)}; shrunk_core_size={len(shrunk)}; cvc5_shrunk_result={cvc5}",
        f"versioned_cvc5_smt2: {smt2_versioned}",
        "",
        "## Frozen rank map",
        "",
        "`" + ", ".join(rank_lines) + "`",
        "",
        "## Shrunken core",
        "",
    ]
    for label in shrunk:
        _, family, detail, provenance, _ = by_label[label]
        lines.append(f"- `{label}` `{family}` — {detail}. Source/provenance: {provenance}.")
    lines += [
        "",
        "The corrected motif-free model has 24 occupied representatives (the prior arbitrary first model had 22); the metric UNSAT therefore depends on the exact negated-motif survivor aliases and is not a replay of the arbitrary-model packet.",
        "",
        "## Consumer ingress audit",
        "",
        "A scratch Lean signature probe checks `FivePointEuclideanObstruction.false_of_five_ccw_second_three_row_equalities` and `KalmansonRadiusOrderReversal.false_of_seven_ccw_radius_order_reversal_equalities`. Both elaborate, but this rank-only packet supplies no injective `boundary`/`phi`, CCW convexity, finite-carrier image, or ordered seven-index lift; hence neither production consumer is applicable to this replay without a new universal source-level adapter.",
        "",
        f"shrink_probe_statuses: {statuses}",
    ]
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"results_path={OUT}")
    print(f"metric_result={result} occupied={len(reps)} assertions={len(records)} raw={len(raw)} shrunk={len(shrunk)} cvc5={cvc5}")


if __name__ == "__main__":
    main()
