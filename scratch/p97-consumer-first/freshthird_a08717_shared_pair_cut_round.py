#!/usr/bin/env python3
"""One source-faithful CEGAR round after the verified a08717 obstruction."""
from itertools import combinations
from pathlib import Path
from time import monotonic
import sys
from z3 import And, Bool, Not, SolverFor, sat, unsat

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_full_fidelity_cegar as F
from freshthird_metric_core import tracked_metric


def add_shared_pair_cut(solver, context):
    """Forbid endpoint-center/middle-pair nonalternation structurally.

    This is the rank/incidence abstraction of
    CapCrossingKalmansonBridge.false_of_four_ccw_endpoint_centers_bisect_middle_pair:
    the pinned selected row and a blocker selected shell cannot both contain
    an ordered middle pair when their centers are the ordered endpoints.
    """
    ranks = context["ranks"]
    contains = context["contains"]
    pinned = ranks["pinnedCenter"]
    cuts = []
    for z in range(4):
        blocker = ranks[f"b{z}"]
        for i, j in combinations(range(4), 2):
            wi, wj = ranks[f"w{i}"], ranks[f"w{j}"]
            # Either row-pair order is represented by the rank comparison;
            # no alias is disallowed outside the obstruction premise.
            premise_forward = And(pinned < wi, wi < wj, wj < blocker,
                                   contains[z, i], contains[z, j])
            premise_reverse = And(blocker < wi, wi < wj, wj < pinned,
                                   contains[z, i], contains[z, j])
            solver.add(Not(premise_forward), Not(premise_reverse))
            cuts.extend((premise_forward, premise_reverse))
    return cuts


def metric_core(model, context):
    records = tracked_metric(model, context, solve_core=False)["records"]
    q = SolverFor("QF_LRA"); q.set(timeout=120000)
    for label, _family, _detail, expr in records:
        q.assert_and_track(expr, Bool("track_" + label))
    started = monotonic(); result = q.check(); elapsed = monotonic() - started
    raw = [str(x).removeprefix("track_") for x in q.unsat_core()] if result == unsat else []
    by = {x[0]: x for x in records}
    shrunk = list(raw)
    for label in list(raw):
        candidate = [x for x in shrunk if x != label]
        p = SolverFor("QF_LRA"); p.set(timeout=120000)
        p.add(*[by[x][3] for x in candidate])
        if p.check() == unsat:
            shrunk = candidate
    return result, elapsed, records, raw, shrunk, by


def main():
    order_name = "outside_fresh_between_source_canonical"
    structural, base_stats, context = F.build_pure_arm(
        F.ORDER_ARMS[order_name], F.STRUCTURAL_TIMEOUT_MS)
    F.add_full_fidelity_constraints(structural, context, 1, 1,
                                    enforce_equal_shell_slots_in_row=True)
    cuts = add_shared_pair_cut(structural, context)
    started = monotonic(); structural_result = structural.check(); structural_seconds = monotonic() - started
    lines = [
        "campaign=freshthird_a08717_shared_pair_cut_round_v1",
        "configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1 corrected_source_valid_model",
        "cut_source=CapCrossingKalmansonBridge.false_of_four_ccw_endpoint_centers_bisect_middle_pair",
        "cut_semantics=for every blocker z and row pair wi,wj, forbid pinnedCenter<wi<wj<bz or bz<wi<wj<pinnedCenter when shell_z contains both wi,wj",
        f"cut_instances={len(cuts)}",
        f"structural_result={structural_result}",
        f"structural_runtime_seconds={structural_seconds:.3f}",
    ]
    if structural_result != sat:
        lines.append("status=no_next_representative")
    else:
        model = structural.model()
        summary = F.model_summary(model, context)
        aliases = []
        ranks = context["ranks"]
        classes = {}
        for role in context["all_roles"]:
            classes.setdefault(model.eval(ranks[role]).as_long(), []).append(role)
        aliases = ["/".join(rs) for _, rs in sorted(classes.items()) if len(rs) > 1]
        lines += [
            "status=next_representative",
            "aliases=" + ";".join(aliases),
            "blocker_rows=" + summary["blocker_rows"],
            "blocker_caps=" + summary["blocker_caps"],
            "cap_profiles=" + summary["cap_profiles"],
        ]
        result, metric_seconds, records, raw, shrunk, by = metric_core(model, context)
        lines += [
            f"metric_result={result}",
            f"metric_runtime_seconds={metric_seconds:.3f}",
            f"occupied_representatives={len(set(model.eval(ranks[r]).as_long() for r in context['all_roles']))}",
            f"metric_assertions={len(records)}",
            f"raw_core_size={len(raw)}",
            f"shrunk_core_size={len(shrunk)}",
        ]
        for label in shrunk:
            _label, family, detail, expr = by[label]
            lines.append(f"shrunk_core={label} family={family} detail={detail} expr={expr}")
        lines.append("core_source_mapping=a00154_known_row_equal_radius: source-shell equal-radius producer via SelectedFourClass.support_eq_radius / CriticalFourShell.support_eq_radius; cardinality-independent theorem shape, fixed qBetween witness")
        lines.append("core_source_mapping=a00209_known_row_equal_radius: D-row equal-radius producer via SelectedFourClass.support_eq_radius / CriticalFourShell.support_eq_radius; cardinality-independent theorem shape, fixed e2 witness")
        lines.append("core_source_mapping=a00237_blocker_row_membership: blocker b1 shell witness radius via CriticalFourShell.support_eq_radius after selectedFourClass_support_eq_shell; fixed b1,w1 instantiation")
        lines.append("core_source_mapping=a00240_blocker_slot_shell: exact-four shell slot radius equality uses CriticalFourShell.support_card/support_eq_radius context, but anonymous slot-to-physical lift is not a Lean producer")
        lines.append("core_source_mapping=a02884/a02900/a03922/a03935_kalmanson: no direct Lean producer; Euclidean Kalmanson consumer obligations on this fixed representative")
        lines.append("source_status=learned cut is structural rank/incidence only; source aliases outside the obstruction premise remain permitted")
    out = Path(__file__).with_suffix(".results.txt")
    out.write_text("\n".join(lines) + "\n")
    print(f"wrote {out}")


if __name__ == "__main__":
    main()
