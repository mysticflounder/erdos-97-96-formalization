#!/usr/bin/env python3
"""Next exact FreshThird round after the five-assertion shared-pair core.

The learned clause is the cardinality-independent shared-pair separation
theorem: two distinct selected-row centers cannot have two common support
points on the same side of their chord in the fixed boundary order.  Apply it
to every named selected row and every source-faithful canonical blocker shell,
then shrink the next exact-rational metric obstruction.
"""

from __future__ import annotations

import sys
from collections import defaultdict
from itertools import combinations
from pathlib import Path
from time import monotonic

from z3 import And, Bool, Not, Or, SolverFor, sat, unsat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_full_fidelity_cegar as F  # noqa: E402
from freshthird_metric_core import tracked_metric  # noqa: E402


MAIN_TIMEOUT_MS = 120_000
PROBE_TIMEOUT_MS = 30_000


def between(left, right, point):
    """The integer-rank image of `SurplusCOMPGBank.btw`."""
    return Or(And(left < point, point < right), And(right < point, point < left))


def shell_has(ranks, blocker: int, point: str):
    """Physical membership in a blocker's exact four-point shell."""
    return Or(
        ranks[point] == ranks[f"w{blocker}"],
        *[
            ranks[point] == ranks[f"a{blocker}_{slot}"]
            for slot in range(3)
        ],
    )


def add_all_named_row_shared_pair_cuts(solver, context):
    """Impose the proved shared-pair alternation rule on named rows/shells."""
    ranks = context["ranks"]
    known_rows = (
        ("sourceCenter", F.SOURCE_SHELL),
        ("freshCenter", F.FRESH_SHELL),
        ("pinnedCenter", F.ROW),
        ("drowCenter", F.DROW),
    )
    cut_count = 0
    for row_center, support in known_rows:
        center = ranks[row_center]
        for blocker in range(4):
            blocker_center = ranks[f"b{blocker}"]
            for first, second in combinations(support, 2):
                premise = And(
                    center != blocker_center,
                    shell_has(ranks, blocker, first),
                    shell_has(ranks, blocker, second),
                )
                separated = (
                    between(center, blocker_center, ranks[first])
                    != between(center, blocker_center, ranks[second])
                )
                solver.add(Or(Not(premise), separated))
                cut_count += 1
    return cut_count


def check_records(records, timeout_ms=PROBE_TIMEOUT_MS):
    solver = SolverFor("QF_LRA")
    solver.set(timeout=timeout_ms)
    solver.add(*[record[3] for record in records])
    return solver.check()


def tracked_core(records, timeout_ms=MAIN_TIMEOUT_MS):
    solver = SolverFor("QF_LRA")
    solver.set(timeout=timeout_ms)
    for label, _family, _detail, expression in records:
        solver.assert_and_track(expression, Bool("track_" + label))
    started = monotonic()
    result = solver.check()
    elapsed = monotonic() - started
    core = (
        [str(literal).removeprefix("track_") for literal in solver.unsat_core()]
        if result == unsat
        else []
    )
    return result, core, elapsed, solver.reason_unknown() if result != unsat else ""


def all_alias_classes(model, context):
    classes = defaultdict(list)
    for role in context["all_roles"]:
        rank = model.eval(context["ranks"][role]).as_long()
        classes[rank].append(role)
    return [
        f"{rank}:" + "/".join(roles)
        for rank, roles in sorted(classes.items())
        if len(roles) > 1
    ]


def main(
    *,
    extra_cut=None,
    output_file=None,
    campaign="freshthird_all_row_shared_pair_cut_round_v1",
    extra_lines=(),
):
    order_name = "outside_fresh_between_source_canonical"
    structural, _stats, context = F.build_pure_arm(
        F.ORDER_ARMS[order_name], F.STRUCTURAL_TIMEOUT_MS
    )
    F.add_full_fidelity_constraints(
        structural,
        context,
        fresh_cap=1,
        row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    cut_count = add_all_named_row_shared_pair_cuts(structural, context)
    extra_cut_count = extra_cut(structural, context) if extra_cut is not None else 0
    structural_started = monotonic()
    structural_result = structural.check()
    structural_seconds = monotonic() - structural_started

    lines = [
        f"campaign={campaign}",
        f"configuration={order_name} fresh_cap=1 row_cap=1 corrected_drow_center=qBetween",
        "trust=exact LIA structural abstraction plus exact-rational QF_LRA metric check; diagnostic until universal source coverage is proved",
        "cut_source=Problem97.selectedFourClass_shared_pair_separated",
        "cut_semantics=every named selected row and every canonical blocker shell alternate any two common support points across distinct centers",
        f"cut_instances={cut_count}",
        f"extra_cut_instances={extra_cut_count}",
        f"structural_result={structural_result}",
        f"structural_runtime_seconds={structural_seconds:.3f}",
    ]
    lines.extend(extra_lines)
    out = Path(output_file or __file__).with_suffix(".results.txt")
    if structural_result != sat:
        lines.append("status=no_next_representative")
        out.write_text("\n".join(lines) + "\n")
        return

    model = structural.model()
    summary = F.model_summary(model, context)
    packet = tracked_metric(model, context, solve_core=False)
    records = packet["records"]
    by_label = {record[0]: record for record in records}
    base = [record for record in records if record[1] != "kalmanson"]
    kalmanson = [record for record in records if record[1] == "kalmanson"]

    kal_solver = SolverFor("QF_LRA")
    kal_solver.set(timeout=MAIN_TIMEOUT_MS)
    kal_solver.add(*[record[3] for record in base])
    for label, _family, _detail, expression in kalmanson:
        kal_solver.assert_and_track(expression, Bool("track_" + label))
    kal_started = monotonic()
    kal_result = kal_solver.check()
    kal_seconds = monotonic() - kal_started
    kal_labels = (
        [str(literal).removeprefix("track_") for literal in kal_solver.unsat_core()]
        if kal_result == unsat
        else []
    )
    kal_core = [by_label[label] for label in kal_labels]

    grouped = defaultdict(list)
    for record in base:
        grouped[record[1]].append(record)
    active_families = list(grouped)
    family_ablation = []
    if kal_result == unsat:
        for family in list(active_families):
            candidate_families = [item for item in active_families if item != family]
            candidate = [
                record
                for candidate_family in candidate_families
                for record in grouped[candidate_family]
            ] + kal_core
            result = check_records(candidate)
            removed = result == unsat
            family_ablation.append((family, result, removed))
            if removed:
                active_families = candidate_families

    active = [
        record for family in active_families for record in grouped[family]
    ] + kal_core
    active_result = check_records(active, MAIN_TIMEOUT_MS) if kal_core else kal_result
    assertion_result, raw_labels, assertion_seconds, assertion_reason = (
        tracked_core(active) if active_result == unsat else (active_result, [], 0.0, "")
    )
    shrunk_labels = list(raw_labels)
    shrink_status = []
    for label in list(raw_labels):
        candidate_labels = [item for item in shrunk_labels if item != label]
        result = check_records([by_label[item] for item in candidate_labels])
        shrink_status.append((label, result))
        if result == unsat:
            shrunk_labels = candidate_labels
    final_result = (
        check_records([by_label[label] for label in shrunk_labels], MAIN_TIMEOUT_MS)
        if shrunk_labels
        else sat
    )

    lines += [
        "status=next_representative",
        "aliases=" + ";".join(all_alias_classes(model, context)),
        f"blocker_rows={summary['blocker_rows']}",
        f"blocker_caps={summary['blocker_caps']}",
        f"cap_profiles={summary['cap_profiles']}",
        f"representatives={len(packet['representatives'])}",
        f"base_assertions={len(base)}",
        f"kalmanson_assertions={len(kalmanson)}",
        f"kalmanson_core_result={kal_result}",
        f"kalmanson_core_runtime_seconds={kal_seconds:.3f}",
        f"kalmanson_core_size={len(kal_labels)}",
    ]
    for label in kal_labels:
        _label, family, detail, _expression = by_label[label]
        lines.append(f"kalmanson_core={label} family={family} detail={detail}")
    for family, result, removed in family_ablation:
        lines.append(f"family_ablation={family} result={result} removed={removed}")
    lines += [
        "active_families=" + ",".join(active_families),
        f"active_assertions={len(active)}",
        f"active_result={active_result}",
        f"assertion_core_result={assertion_result}",
        f"assertion_core_reason={assertion_reason}",
        f"assertion_core_runtime_seconds={assertion_seconds:.3f}",
        f"raw_assertion_core_size={len(raw_labels)}",
    ]
    for label in raw_labels:
        _label, family, detail, _expression = by_label[label]
        lines.append(f"raw_assertion_core={label} family={family} detail={detail}")
    for label, result in shrink_status:
        lines.append(f"shrink_probe={label} result_without={result}")
    lines += [
        f"shrunk_core_size={len(shrunk_labels)}",
        f"final_exact_result={final_result}",
    ]
    for label in shrunk_labels:
        _label, family, detail, _expression = by_label[label]
        lines.append(f"shrunk_core={label} family={family} detail={detail}")
    lines.append(
        "source_status=all learned shared-pair cuts are already-proved cardinality-generic consumers; the next core still requires source-level premise coverage before Lean promotion"
    )
    out.write_text("\n".join(lines) + "\n")


if __name__ == "__main__":
    main()
