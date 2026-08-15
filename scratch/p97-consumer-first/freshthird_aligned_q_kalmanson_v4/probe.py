#!/usr/bin/env python3
"""Small source-faithful cyclic-order probe for the aligned FreshThird packet.

This deliberately uses only linear metric consequences.  It is not a Euclidean
realization checker and has no universal lifting step.
"""

from __future__ import annotations

import itertools
import subprocess
from pathlib import Path


OUT = Path(__file__).resolve().parent
LABELS = ("P1", "P2", "Pr1", "Pr2", "C1", "C2", "Qfresh", "Qother")


def pair(a: str, b: str) -> str:
    x, y = sorted((a, b))
    return f"d_{x}_{y}"


def dist(a: str, b: str) -> str:
    if a == b:
        return "0"
    return pair(a, b)


def lt(a: str, b: str) -> str:
    return f"(< {a} {b})"


def canonical_orders() -> list[tuple[str, ...]]:
    # Rotation is fixed by P1; the second-vs-last test quotients reversal.
    tail = [x for x in LABELS if x != "P1"]
    return [
        ("P1", *tail)
        for tail in itertools.permutations(tail)
        if tail[0] < tail[-1]
    ]


def base_assertions(*, shell_equalities: bool = True) -> list[str]:
    out: list[str] = []
    for a, b in itertools.combinations(LABELS, 2):
        out.append(f"(assert (> {dist(a, b)} 0))")
    # Strict triangle inequalities are used only as a diagnostic metric filter.
    for a, b, c in itertools.combinations(LABELS, 3):
        out.extend(
            [
                f"(assert {lt(dist(a,c), f'(+ {dist(a,b)} {dist(b,c)})')})",
                f"(assert {lt(dist(b,c), f'(+ {dist(a,b)} {dist(a,c)})')})",
                f"(assert {lt(dist(a,b), f'(+ {dist(a,c)} {dist(b,c)})')})",
            ]
        )
    # The only named metric equalities currently justified by the source
    # packet: P1/P2/Qfresh/Qother lie in C1's selected critical shell.
    if shell_equalities:
        out.append(f"(assert (= {dist('C1','P1')} {dist('C1','P2')}))")
        out.append(f"(assert (= {dist('C1','P2')} {dist('C1','Qfresh')}))")
        out.append(f"(assert (= {dist('C1','Qfresh')} {dist('C1','Qother')}))")
    return out


def order_assertions(order: tuple[str, ...]) -> list[str]:
    out: list[str] = []
    # Both strict inequalities supplied by CapCrossingKalmansonBridge.
    for a, b, c, d in itertools.combinations(order, 4):
        out.append(
            f"(assert {lt(f'(+ {dist(b,c)} {dist(a,d)})', f'(+ {dist(a,c)} {dist(b,d)})')})"
        )
        out.append(
            f"(assert {lt(f'(+ {dist(a,b)} {dist(c,d)})', f'(+ {dist(a,c)} {dist(b,d)})')})"
        )
    return out


def main() -> None:
    orders = canonical_orders()
    assert len(orders) == 2520
    # Independent positive smoke: the order/Kalmanson filter without the
    # FreshThird shell equalities must admit a metric.
    smoke = OUT / "smoke.smt2"
    smoke_lines = ["(set-logic QF_LRA)"]
    vars_ = [pair(a, b) for a, b in itertools.combinations(LABELS, 2)]
    smoke_lines.extend(f"(declare-fun {v} () Real)" for v in vars_)
    smoke_lines.extend(base_assertions(shell_equalities=False))
    smoke_lines.extend(order_assertions(orders[0]))
    smoke_lines.extend(["(check-sat)", "(exit)"])
    smoke.write_text("\n".join(smoke_lines) + "\n")
    smoke_proc = subprocess.run(
        ["z3", smoke.name], cwd=OUT, text=True, capture_output=True, timeout=10
    )
    smoke_statuses = [x.strip() for x in smoke_proc.stdout.splitlines() if x.strip() in {"sat", "unsat", "unknown"}]
    smoke_status = smoke_statuses[-1] if smoke_statuses else "missing"
    if smoke_status != "sat":
        raise SystemExit(f"positive smoke failed: {smoke_status!r}")
    query = OUT / "orders.smt2"
    lines = ["(set-logic QF_LRA)"]
    vars_ = [pair(a, b) for a, b in itertools.combinations(LABELS, 2)]
    lines.extend(f"(declare-fun {v} () Real)" for v in vars_)
    lines.extend(base_assertions())
    for i, order in enumerate(orders):
        lines.append(f"; arm {i} {' '.join(order)}")
        lines.append("(push)")
        lines.extend(order_assertions(order))
        lines.append("(check-sat)")
        lines.append("(pop)")
    lines.append("(exit)")
    query.write_text("\n".join(lines) + "\n")
    proc = subprocess.run(
        ["z3", query.name], cwd=OUT, text=True, capture_output=True, timeout=30
    )
    statuses = [x.strip() for x in proc.stdout.splitlines() if x.strip() in {"sat", "unsat", "unknown"}]
    counts = {s: statuses.count(s) for s in ("sat", "unsat", "unknown")}
    result = OUT / "results.txt"
    result.write_text(
        "campaign=freshthird_aligned_q_kalmanson_v4\n"
        "scope=2520 cyclic orders modulo dihedral symmetry; QF_LRA metric projection\n"
        "labels=" + ",".join(LABELS) + "\n"
        + "orders=" + str(len(orders)) + "\n"
        + "statuses=" + str(counts) + "\n"
        + "positive_smoke_without_shell_equalities=z3:" + smoke_status + "\n"
        + "first_order=" + " ".join(orders[0]) + "\n"
        + "last_order=" + " ".join(orders[-1]) + "\n"
        + "z3_exit=" + str(proc.returncode) + "\n"
    )
    if proc.returncode != 0 or len(statuses) != len(orders):
        raise SystemExit(f"solver failed: exit={proc.returncode}, statuses={len(statuses)}")
    print(result)
    print(counts)


if __name__ == "__main__":
    main()
