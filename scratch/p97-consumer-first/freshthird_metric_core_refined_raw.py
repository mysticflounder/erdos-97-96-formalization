#!/usr/bin/env python3
"""Raw tracked UNSAT core for the one source-faithful refined representative."""

from pathlib import Path

from z3 import sat

from freshthird_full_fidelity_cegar import (
    ORDER_ARMS,
    STRUCTURAL_TIMEOUT_MS,
    add_full_fidelity_constraints,
    build_pure_arm,
)
from freshthird_metric_core import tracked_metric


def main():
    structural, _stats, context = build_pure_arm(
        ORDER_ARMS["outside_fresh_between_source_canonical"], STRUCTURAL_TIMEOUT_MS
    )
    add_full_fidelity_constraints(
        structural, context, fresh_cap=1, row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    if structural.check() != sat:
        raise SystemExit("refined representative was not structural SAT")
    report = tracked_metric(structural.model(), context, raw_core=True)
    by_label = {label: (family, detail) for label, family, detail, _ in report["records"]}
    lines = [
        "campaign=freshthird_metric_refined_raw_core_v1",
        "configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1 first_refined_structural_model",
        "refinement=equal-centre blocker slots forced into ROW support",
        f"metric_result={report['result']} representatives={len(report['representatives'])} metric_assertions={report['solver_assertions']}",
        f"raw_core_size={len(report.get('raw_core', []))}",
    ]
    for label in report.get("raw_core", []):
        family, detail = by_label[label]
        lines.append(f"raw_core={label} family={family} detail={detail}")
    lines.append(f"shrunk_core_size={len(report.get('shrunk_core', []))}")
    for label in report.get("shrunk_core", []):
        family, detail = by_label[label]
        lines.append(f"shrunk_core={label} family={family} detail={detail}")
    lines.append("source_mapping=known-row assertions derive from SelectedFourClass support_eq_radius and CriticalFourShell.dist_ne_radius_of_mem_A_not_mem_support; blocker shell equalities derive only from the finite consumer packet, while exact shell cardinality is source CriticalFourShell.support_card")
    lines.append("source_gap=anonymous slot assertions remain encoder scaffolding; no Lean theorem currently lifts each slot to a named physical shell point, even after equal-centre slots are restricted to ROW")
    lines.append("core_status=diagnostic exact-rational QF_LRA tracked core; not a Lean closure")
    output = Path(__file__).with_suffix(".results.txt")
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"wrote {output} raw_core={len(report.get('raw_core', []))} shrunk_core={len(report.get('shrunk_core', []))}")


if __name__ == "__main__":
    main()
