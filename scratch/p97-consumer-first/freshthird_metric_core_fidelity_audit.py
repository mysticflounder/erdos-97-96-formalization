#!/usr/bin/env python3
"""Bounded source-fidelity audit of the fixed FreshThird metric motif.

This enumerates only the four structural models of one completed arm.  It does
not start a new cap/order campaign.  For each frozen structure it records the
aliases, blocker shell memberships, and whether a same-centre blocker shell
contains the pinned row plus the excluded point ``f1``.
"""

from __future__ import annotations

import sys
from pathlib import Path

from z3 import sat, unknown

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from freshthird_full_fidelity_cegar import (  # noqa: E402
    DROW,
    ORDER_ARMS,
    ROW,
    STRUCTURAL_TIMEOUT_MS,
    add_full_fidelity_constraints,
    build_pure_arm,
    exact_metric_check,
    model_summary,
)
from freshthird_two_level_cegar import _signature_block  # noqa: E402
from freshthird_two_level_cegar import structural_signature  # noqa: E402


def boolv(model, name):
    return bool(model.eval(__import__("z3").Bool(name), model_completion=True))


def aliases(model, context):
    ranks = context["ranks"]
    vals = {role: model.eval(term).as_long() for role, term in ranks.items()}
    classes = {}
    for role, value in vals.items():
        classes.setdefault(value, []).append(role)
    return vals, ["/".join(v) for _, v in sorted(classes.items()) if len(v) > 1]


def motif(model, context):
    vals, _ = aliases(model, context)
    found = []
    for z in range(4):
        same = vals["pinnedCenter"] == vals[f"b{z}"]
        rows = [boolv(model, f"shell_{z}_contains_w{j}") for j in range(4)]
        f1_shell = any(
            vals["f1"] == vals[f"w{z}"]
            or vals["f1"] == vals[f"a{z}_{t}"]
            for t in range(3)
        )
        f1_outside_row = vals["f1"] not in {vals[p] for p in ROW}
        if same and all(rows) and f1_shell and f1_outside_row:
            found.append(z)
    return found


def main():
    order_name = "outside_fresh_between_source_canonical"
    structural, _stats, context = build_pure_arm(ORDER_ARMS[order_name], STRUCTURAL_TIMEOUT_MS)
    add_full_fidelity_constraints(structural, context, fresh_cap=1, row_cap=1)
    lines = [
        "campaign=freshthird_source_fidelity_audit_v1",
        f"configuration={order_name} fresh_cap=1 row_cap=1 structures=4",
        "scope=four frozen structural models only; no new order/cap campaign",
        "motif=same pinnedCenter/blocker, all four pinned-row points in blocker shell, f1 shell member, f1 outside ROW",
    ]
    for index in range(1, 5):
        result = structural.check()
        if result == unknown:
            lines.append(f"structure={index} structural=unknown")
            break
        if result != sat:
            lines.append(f"structure={index} structural={result}")
            break
        model = structural.model()
        vals, alias_classes = aliases(model, context)
        metric, stats = exact_metric_check(model, context, 4000)
        rows = ["".join("1" if boolv(model, f"shell_{z}_contains_w{j}") else "0" for j in range(4)) for z in range(4)]
        lines.append(
            f"structure={index} structural=sat metric={metric} occupied={stats.get('occupied')} "
            f"motif_blockers={','.join(map(str, motif(model, context))) or 'none'} "
            f"pinned={vals['pinnedCenter']} blockers=" + ",".join(str(vals[f"b{z}"]) for z in range(4)) +
            f" blocker_rows={','.join(rows)}"
        )
        lines.append("aliases=" + ";".join(alias_classes))
        structural.add(_signature_block(structural_signature(model, context), context))
    output = Path(__file__).with_suffix(".results.txt")
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"wrote {output}")


if __name__ == "__main__":
    main()
