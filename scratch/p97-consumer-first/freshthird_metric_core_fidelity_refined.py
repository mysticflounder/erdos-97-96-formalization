#!/usr/bin/env python3
"""Re-run the representative metric core after the equal-shell source lift."""

from pathlib import Path

from z3 import sat

from freshthird_full_fidelity_cegar import (
    ORDER_ARMS,
    STRUCTURAL_TIMEOUT_MS,
    add_full_fidelity_constraints,
    build_pure_arm,
    model_summary,
)
from freshthird_metric_core import tracked_metric


def main():
    order_name = "outside_fresh_between_source_canonical"
    structural, _stats, context = build_pure_arm(ORDER_ARMS[order_name], STRUCTURAL_TIMEOUT_MS)
    add_full_fidelity_constraints(
        structural,
        context,
        fresh_cap=1,
        row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    if structural.check() != sat:
        raise SystemExit("refined representative structural model was not SAT")
    model = structural.model()
    report = tracked_metric(model, context)
    output = Path(__file__).with_suffix(".results.txt")
    lines = [
        "campaign=freshthird_metric_unsat_core_source_fidelity_v1",
        "configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1 first_structural_model",
        "refinement=equal-centre blocker anonymous slots forced to alias ROW support (source support equality lift)",
        f"metric_result={report['result']} representatives={len(report['representatives'])} metric_assertions={report['solver_assertions']}",
        "representatives=" + ",".join(report["representatives"]),
        "alias_classes=" + ";".join(
            "/".join(role for role in report["rank_of"] if report["rank_of"][role] == rank)
            for rank in sorted(set(report["rank_of"].values()))
        ),
        "family_ablation=" + ";".join(
            f"{family}:{status}:removed={removed}"
            for family, status, removed in report["family_ablation"]
        ),
        f"family_core_size={len(report['family_core'])}",
        "family_core_families=" + ",".join(
            sorted({report["groups"][gi][0] for gi in report["family_core"]})
        ),
        f"assertion_core_size={len(report['assertion_core'])}",
    ]
    for i in report["assertion_core"]:
        label, family, detail, _ = report["records"][i]
        lines.append(f"assertion_core={label} family={family} detail={detail}")
    lines.append(
        "interpretation=with source-faithful equal-shell slot lift, the prior f1-outside-row alias is unavailable; any remaining core is a distinct structural/metric branch, not the audited three-assertion artifact"
    )
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"wrote {output} family_core={len(report['family_core'])} assertion_core={len(report['assertion_core'])} result={report['result']}")


if __name__ == "__main__":
    main()
