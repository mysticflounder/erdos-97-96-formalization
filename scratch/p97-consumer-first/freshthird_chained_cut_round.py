#!/usr/bin/env python3
"""One source-faithful FreshThird chained-bisector CEGAR round."""

from pathlib import Path
from time import monotonic

from z3 import sat

import freshthird_full_fidelity_cegar as F
from freshthird_metric_core import tracked_metric


def main() -> None:
    order_name = "outside_fresh_between_source_canonical"
    started = monotonic()
    structural, base_stats, context = F.build_pure_arm(
        F.ORDER_ARMS[order_name], F.STRUCTURAL_TIMEOUT_MS
    )
    added = F.add_full_fidelity_constraints(
        structural, context, fresh_cap=1, row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    witnesses = F.add_chained_three_bisector_cut(structural, context)
    structural_result = structural.check()
    lines = [
        "campaign=freshthird_chained_cut_round_v1",
        "configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1",
        "cut_source=CapCrossingKalmansonBridge.false_of_seven_ccw_three_chained_selected_rows",
        "cut_semantics=forbid_exists_i(c2<w_i<qOutside<freshCenter<b_i<qBetween<sourceCenter, drowCenter=qOutside, w_i aliases some DROW point, qOutside in exact blocker b_i shell); contains[i,i] is source-guaranteed",
        f"cut_witness_instances={len(witnesses)}",
        "trust=diagnostic exact-rational SMT only; finite structural encoding and metric core are not Lean closure",
        f"structural_result={structural_result}",
        f"structural_runtime_seconds={monotonic() - started:.3f}",
        f"base_assertions={base_stats['assertions']}",
        f"full_fidelity_assertions={added['full_fidelity_assertions']}",
    ]
    if structural_result != sat:
        lines.append("status=no_next_representative")
    else:
        model = structural.model()
        summary = F.model_summary(model, context)
        lines += [
            "status=next_representative",
            "aliases=" + summary["alias_classes"],
            "blocker_rows=" + summary["blocker_rows"],
            "blocker_caps=" + summary["blocker_caps"],
            "cap_profiles=" + summary["cap_profiles"],
        ]
        metric_started = monotonic()
        report = tracked_metric(model, context, raw_core=True)
        lines += [
            f"metric_result={report['result']}",
            f"metric_runtime_seconds={monotonic() - metric_started:.3f}",
            f"occupied_representatives={len(report['representatives'])}",
            f"metric_assertions={report['solver_assertions']}",
            f"raw_core_size={len(report.get('raw_core', []))}",
            f"shrunk_core_size={len(report.get('shrunk_core', []))}",
        ]
        records = {label: (family, detail) for label, family, detail, _ in report["records"]}
        for label in report.get("shrunk_core", []):
            family, detail = records[label]
            lines.append(f"shrunk_core={label} family={family} detail={detail}")
        lines.append(
            "ingress_caveats=chain/order and selected-row shell memberships require a universal source lift; DROW alias and anonymous blocker slots are finite encoder witnesses; no reflected/rotated cut or full-assignment blocking"
        )

    result_path = Path(__file__).with_suffix(".results.txt")
    result_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("\n".join(lines))


if __name__ == "__main__":
    main()
