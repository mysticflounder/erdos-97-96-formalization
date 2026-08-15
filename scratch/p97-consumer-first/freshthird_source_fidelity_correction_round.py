#!/usr/bin/env python3
"""One FreshThird CEGAR round with the order-selected endpoint repaired."""

from pathlib import Path
import sys
from time import monotonic

from z3 import sat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_full_fidelity_cegar as F  # noqa: E402
from freshthird_metric_core import tracked_metric  # noqa: E402


def main() -> None:
    order_name = "outside_fresh_between_source_canonical"
    fresh_cap = 1
    row_cap = 1
    started = monotonic()
    structural, base_stats, context = F.build_pure_arm(
        F.ORDER_ARMS[order_name], F.STRUCTURAL_TIMEOUT_MS
    )
    added = F.add_full_fidelity_constraints(
        structural, context, fresh_cap=fresh_cap, row_cap=row_cap,
        enforce_equal_shell_slots_in_row=True,
    )
    structural_result = structural.check()
    lines = [
        "campaign=freshthird_source_fidelity_correction_round_v1",
        f"configuration={order_name} fresh_cap={fresh_cap} row_cap={row_cap}",
        "source_correction=FreshThirdOrderSelectedEndpointCapSplitSurvivingRowAt arm1 fixes id=qBetween; drowCenter is no longer allowed to alias qOutside",
        "prior_cuts=full_fidelity_source_fan_and_cap_bounds_only; chained qOutside endpoint cut intentionally omitted because it is incompatible with corrected arm1 id",
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
            "ingress_caveats=the correction enforces the source packet's arm-specific endpoint; finite DROW aliases and anonymous shell slots still need a universal source lift; this is not closure"
        )

    result_path = Path(__file__).with_suffix(".results.txt")
    result_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("\n".join(lines))


if __name__ == "__main__":
    main()
