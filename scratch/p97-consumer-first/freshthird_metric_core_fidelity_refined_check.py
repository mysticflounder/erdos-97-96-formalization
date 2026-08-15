#!/usr/bin/env python3
"""Bounded representative check after the source equal-shell lift.

Only one structural model and one direct metric check are run; no core
ablation/enumeration is attempted here.
"""

import sys
from pathlib import Path

from z3 import sat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from freshthird_full_fidelity_cegar import (  # noqa: E402
    ORDER_ARMS,
    STRUCTURAL_TIMEOUT_MS,
    add_full_fidelity_constraints,
    build_pure_arm,
    exact_metric_check,
)
from freshthird_metric_core_fidelity_audit import aliases, motif  # noqa: E402


def distinctness_violations(vals):
    violations = []
    for name, shell in (("SOURCE_SHELL", ("qOutside", "qBetween", "canonicalSource", "c2")),
                        ("FRESH_SHELL", ("qOutside", "qBetween", "f1", "f2")),
                        ("ROW", ("w0", "w1", "w2", "w3")),
                        ("DROW", ("e0", "e1", "e2", "e3"))):
        for i, a in enumerate(shell):
            for b in shell[i + 1:]:
                if vals[a] == vals[b]:
                    violations.append(f"{name}:{a}={b}")
    for a in ("canonicalSource", "c2"):
        for b in ("f1", "f2"):
            if vals[a] == vals[b]:
                violations.append(f"cross:{a}={b}")
    for z in range(4):
        if vals[f"b{z}"] == vals[f"w{z}"]:
            violations.append(f"shell_center:b{z}=w{z}")
        for t in range(3):
            if vals[f"b{z}"] == vals[f"a{z}_{t}"]:
                violations.append(f"shell_center:b{z}=a{z}_{t}")
    return violations


def main():
    order_name = "outside_fresh_between_source_canonical"
    structural, _stats, context = build_pure_arm(ORDER_ARMS[order_name], STRUCTURAL_TIMEOUT_MS)
    add_full_fidelity_constraints(
        structural, context, fresh_cap=1, row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    result = structural.check()
    lines = [
        "campaign=freshthird_source_fidelity_refined_representative_v1",
        f"configuration={order_name} fresh_cap=1 row_cap=1 first_structural_model",
        "refinement=equal-centre blocker anonymous slots forced into ROW support",
        f"structural_result={result}",
    ]
    if result == sat:
        model = structural.model()
        metric, stats = exact_metric_check(model, context, 4000)
        vals, classes = aliases(model, context)
        violations = distinctness_violations(vals)
        lines += [
            f"metric_result={metric} occupied={stats.get('occupied')} metric_assertions={stats.get('metric_assertions')}",
            f"motif_blockers={','.join(map(str, motif(model, context))) or 'none'}",
            f"pinned_rank={vals['pinnedCenter']} blocker_ranks=" + ",".join(str(vals[f"b{z}"]) for z in range(4)),
            "aliases=" + ";".join(classes),
            "distinctness_check=" + ("PASS" if not violations else "FAIL:" + ",".join(violations)),
            "core=not-extracted (bounded check intentionally omits expensive family/assertion ablation)",
            "source_mapping=equal-center slot-in-ROW is the direct finite lift of SourceFaithfulSelectedFourDeletionFan equal branch support equality; no residual three-assertion f1-outside-row core can be formed in this model",
        ]
    output = Path(__file__).with_suffix(".results.txt")
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"wrote {output}")


if __name__ == "__main__":
    main()
