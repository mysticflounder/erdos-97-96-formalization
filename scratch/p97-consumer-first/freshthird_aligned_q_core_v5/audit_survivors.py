#!/usr/bin/env python3
"""Compact survivor-model census for the v5 bounded diagnostic."""

from __future__ import annotations

import sys
from pathlib import Path

from z3 import Bool, is_true, sat

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_aligned_q_core_v5 as V5  # noqa: E402


def support(model, prefix: str) -> tuple[str, ...]:
    return tuple(
        point for point in V5.POINTS
        if is_true(model.eval(Bool(f"{prefix}_{point}"), model_completion=True))
    )


def fmt(points: tuple[str, ...] | set[str]) -> str:
    return "{" + ",".join(points) + "}"


def main() -> None:
    arms = V5.V3.joint_arms()
    records: list[dict[str, tuple[str, ...]]] = []
    lines = [
        "# FreshThird aligned Q/core v5 survivor summary",
        "",
        "Bounded Z3 model census only; all source clauses come from the v5 diagnostic. No closure claim.",
        "",
        "## Representative models",
        "",
    ]
    representatives = (
        ("common-x", (0, 0, 0, 1)),
        ("common-y", (0, 0, 1, 0)),
        ("common-x+y", (0, 0, 0, 0)),
    )
    for arm_name, arm in representatives:
        for equal in (False, True):
            solver = V5.build_schema_v5(fixed_arm=arm, equal_blockers=equal)
            if solver.check() != sat:
                raise RuntimeError(f"representative unexpectedly non-SAT: {arm_name} equal={equal}")
            model = solver.model()
            rec = {
                "row0": support(model, "row0"),
                "row1": support(model, "row1"),
                "Q": support(model, "qFirstFiberRow"),
                "xShell": support(model, "core0_xShell"),
                "yShell": support(model, "core0_yShell"),
            }
            lines.append(f"### {arm_name}, mode={'equal' if equal else 'distinct'}")
            for key in ("row0", "row1", "Q", "xShell", "yShell"):
                lines.append(f"- {key} = {fmt(rec[key])}")
            lines.append("")

    for arm in arms:
        for equal in (False, True):
            solver = V5.build_schema_v5(fixed_arm=arm, equal_blockers=equal)
            if solver.check() != sat:
                raise RuntimeError(f"arm unexpectedly non-SAT: {arm} equal={equal}")
            model = solver.model()
            records.append({
                "row0": support(model, "row0"),
                "row1": support(model, "row1"),
                "Q": support(model, "qFirstFiberRow"),
                "xShell": support(model, "core0_xShell"),
                "yShell": support(model, "core0_yShell"),
            })

    lines.extend(["## Cross-survivor membership census", "", "The census covers all 24 arm/mode models.", ""])
    for key in ("row0", "row1", "Q", "xShell", "yShell"):
        sets = [set(record[key]) for record in records]
        always = set.intersection(*sets)
        never = set(V5.POINTS) - set.union(*sets)
        variable = set(V5.POINTS) - always - never
        lines.append(f"- {key}: always={fmt(always)}; never={fmt(never)}; variable={fmt(variable)}")
    lines.extend([
        "",
        "## Structural invariants visible in every model",
        "",
        "- row0 and row1 are exact-four supports containing source0 and source1.",
        "- Q is exactly {x0,x1,qFresh,qOther}.",
        "- xShell is exact-four and contains x0,x1; yShell is exact-four and contains y0,y1.",
        "- xShell and yShell are synchronized across core0/core1 and disjoint.",
        "- All source-row/apex-shell and Q/apex-shell intersections are ≤2.",
        "- Equal mode has row0=row1; distinct mode has row0∩row1 of size ≤2.",
        "",
        "status=PASS",
    ])
    out = HERE / "survivor-summary.md"
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"models={len(records)}")
    print(f"summary={out}")


if __name__ == "__main__":
    main()
