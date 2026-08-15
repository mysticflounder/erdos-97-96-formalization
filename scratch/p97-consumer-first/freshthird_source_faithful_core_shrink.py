#!/usr/bin/env python3
"""Shrink the corrected FreshThird lazy-UNSAT packet to a named exact core.

This freezes the first source-faithful arm-1 structural representative, finds
an UNSAT Kalmanson subset over the full non-Kalmanson metric base, greedily
ablates whole base families, and finally asks Z3 for an assertion-level core.
All arithmetic is exact QF_LRA.  The result is diagnostic until its named
points and incidences are lifted from the universal Lean source packet.
"""

from __future__ import annotations

import sys
from collections import defaultdict
from pathlib import Path
from time import monotonic

from z3 import Bool, SolverFor, sat, unsat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from freshthird_full_fidelity_cegar import (  # noqa: E402
    ORDER_ARMS,
    STRUCTURAL_TIMEOUT_MS,
    add_full_fidelity_constraints,
    build_pure_arm,
    model_summary,
)
from freshthird_metric_core import tracked_metric  # noqa: E402


MAIN_TIMEOUT_MS = 120_000
PROBE_TIMEOUT_MS = 30_000


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


def main():
    order_name = "outside_fresh_between_source_canonical"
    structural, _stats, context = build_pure_arm(
        ORDER_ARMS[order_name], STRUCTURAL_TIMEOUT_MS
    )
    add_full_fidelity_constraints(
        structural,
        context,
        fresh_cap=1,
        row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    if structural.check() != sat:
        raise SystemExit("corrected source-faithful structural packet is not SAT")

    model = structural.model()
    packet = tracked_metric(model, context, solve_core=False)
    records = packet["records"]
    by_label = {record[0]: record for record in records}
    base = [record for record in records if record[1] != "kalmanson"]
    kalmanson = [record for record in records if record[1] == "kalmanson"]

    # Track only Kalmanson initially.  Keeping the large exact base untracked
    # makes Z3's first conflict extraction fast while preserving full fidelity.
    solver = SolverFor("QF_LRA")
    solver.set(timeout=MAIN_TIMEOUT_MS)
    solver.add(*[record[3] for record in base])
    for label, _family, _detail, expression in kalmanson:
        solver.assert_and_track(expression, Bool("track_" + label))
    started = monotonic()
    kal_result = solver.check()
    kal_seconds = monotonic() - started
    kal_core_labels = (
        [str(literal).removeprefix("track_") for literal in solver.unsat_core()]
        if kal_result == unsat
        else []
    )
    kal_core = [by_label[label] for label in kal_core_labels]

    # Greedy whole-family ablation.  UNKNOWN is conservatively retained.
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
                for item in candidate_families
                for record in grouped[item]
            ] + kal_core
            result = check_records(candidate)
            family_ablation.append((family, str(result), result == unsat))
            if result == unsat:
                active_families = candidate_families

    active = [
        record for family in active_families for record in grouped[family]
    ] + kal_core
    active_result = check_records(active, MAIN_TIMEOUT_MS) if kal_core else kal_result
    assertion_result, raw_labels, assertion_seconds, assertion_reason = (
        tracked_core(active) if active_result == unsat else (active_result, [], 0.0, "")
    )

    # Deletion-shrink only the solver-returned exact core.  The final check is
    # independent of tracked literals and is the artifact's decisive verdict.
    shrunk_labels = list(raw_labels)
    shrink_status = []
    for label in list(raw_labels):
        candidate_labels = [item for item in shrunk_labels if item != label]
        candidate = [by_label[item] for item in candidate_labels]
        result = check_records(candidate, PROBE_TIMEOUT_MS)
        shrink_status.append((label, str(result)))
        if result == unsat:
            shrunk_labels = candidate_labels
    final_records = [by_label[label] for label in shrunk_labels]
    final_result = check_records(final_records, MAIN_TIMEOUT_MS) if final_records else sat

    summary = model_summary(model, context)
    lines = [
        "campaign=freshthird_source_faithful_core_shrink_v1",
        f"configuration={order_name} fresh_cap=1 row_cap=1 corrected_drow_center=qBetween",
        "trust=diagnostic exact-rational QF_LRA; not Lean closure without universal source lift",
        "source_fidelity=equal-centre anonymous shell slots forced into the named selected row",
        f"aliases={summary['alias_classes']}",
        f"blocker_rows={summary['blocker_rows']}",
        f"blocker_caps={summary['blocker_caps']}",
        f"representatives={len(packet['representatives'])}",
        f"base_assertions={len(base)}",
        f"kalmanson_assertions={len(kalmanson)}",
        f"kalmanson_core_result={kal_result}",
        f"kalmanson_core_runtime_seconds={kal_seconds:.3f}",
        f"kalmanson_core_size={len(kal_core_labels)}",
    ]
    for label in kal_core_labels:
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
    lines += [
        "source_status=the final exact core is a finite obstruction only; each named point/order/incidence premise must be produced from the live Lean residual before promotion",
        "next_step=map the shrunk labels to the weakest cardinality-generic Kalmanson consumer, or add their negation as the next source-faithful structural cut",
    ]
    output = Path(__file__).with_suffix(".results.txt")
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(
        f"wrote {output} kal={kal_result}/{len(kal_core_labels)} "
        f"families={len(active_families)} raw={len(raw_labels)} "
        f"shrunk={len(shrunk_labels)} final={final_result}"
    )


if __name__ == "__main__":
    main()
