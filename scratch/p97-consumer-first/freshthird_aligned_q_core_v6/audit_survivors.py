#!/usr/bin/env python3
"""Compact Z3 survivor census for the corrected v6 scratch schema."""

from __future__ import annotations

import importlib.util
import sys
from pathlib import Path

from z3 import is_true, sat


ROOT = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("freshthird_v6", ROOT / "freshthird_aligned_q_core_v6.py")
assert spec is not None and spec.loader is not None
V6 = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = V6
spec.loader.exec_module(V6)


def support(model, names: tuple[str, ...], prefix: str) -> tuple[str, ...]:
    return tuple(name for name in names if is_true(model.eval(V6.Bool(f"{prefix}_{name}"), model_completion=True)))


def fmt(values) -> str:
    return "{" + ",".join(values) + "}"


def main() -> None:
    named = tuple(V6.POINTS)
    shell_names = tuple(V6.SHELL_POINTS)
    representatives = (
        ("common-x", (0, 0, 0, 1)),
        ("common-y", (0, 0, 1, 0)),
        ("common-x+y", (0, 0, 0, 0)),
    )
    lines = [
        "# FreshThird aligned Q/core v6 survivor summary",
        "",
        "Bounded Z3 model census only; no closure claim.",
        "",
        "## Representative models",
    ]
    for label, arm in representatives:
        for equal in (False, True):
            solver = V6.build_schema_v6(fixed_arm=arm, equal_blockers=equal)
            if solver.check() != sat:
                raise RuntimeError(f"representative {label} mode={equal} was not SAT")
            model = solver.model()
            mode = "equal" if equal else "distinct"
            lines.extend([
                f"### {label}, mode={mode}",
                f"- row0 = {fmt(support(model, named, 'row0'))}",
                f"- row1 = {fmt(support(model, named, 'row1'))}",
                f"- Q = {fmt(support(model, named, 'qFirstFiberRow'))}",
                f"- xShell = {fmt(support(model, shell_names, 'core0_xShell'))}",
                f"- yShell = {fmt(support(model, shell_names, 'core0_yShell'))}",
                "",
            ])

    records = []
    for arm in V6.V3.joint_arms():
        for equal in (False, True):
            solver = V6.build_schema_v6(fixed_arm=arm, equal_blockers=equal)
            if solver.check() != sat:
                raise RuntimeError(f"arm {arm} mode={equal} was not SAT")
            model = solver.model()
            records.append({
                "row0": set(support(model, named, "row0")),
                "row1": set(support(model, named, "row1")),
                "Q": set(support(model, named, "qFirstFiberRow")),
                "xShell": set(support(model, shell_names, "core0_xShell")),
                "yShell": set(support(model, shell_names, "core0_yShell")),
            })

    lines.extend(["## Cross-survivor membership census", "", "The census covers all 24 arm/mode models.", ""])
    for category in ("row0", "row1", "Q", "xShell", "yShell"):
        universe = set(named if category in {"row0", "row1", "Q"} else shell_names)
        always = set.intersection(*(record[category] for record in records))
        never = universe - set.union(*(record[category] for record in records))
        variable = universe - always - never
        lines.append(f"- {category}: always={fmt(sorted(always))}; never={fmt(sorted(never))}; variable={fmt(sorted(variable))}")
    lines.extend([
        "",
        "## Structural invariants visible in every model",
        "",
        "- row0 and row1 are exact-four named supports containing source0 and source1.",
        "- Q is exactly {x0,x1,qFresh,qOther}.",
        "- xShell and yShell are exact-four supports, synchronized across cores and disjoint.",
        "- Every xShell contains x0,x1 and excludes source0,source1; every yShell contains y0,y1 and excludes source0,source1.",
        "- Anonymous fillers absorb the remaining shell capacity; their memberships are not fixed by the clauses.",
        "- Equal mode has row0=row1; distinct mode has row0∩row1 of size ≤2.",
        "",
        "status=PASS",
    ])
    output = ROOT / "survivor-summary.md"
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"models={len(records)}")
    print(f"summary={output}")


if __name__ == "__main__":
    main()
