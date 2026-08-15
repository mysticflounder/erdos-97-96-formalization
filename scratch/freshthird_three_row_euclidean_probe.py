#!/usr/bin/env python3
"""Exact nonlinear feasibility probe for the FreshThird three-row hard order.

This is theorem-discovery scratch work, not a proof artifact.  We normalize the
source and fresh centers to (0,0) and (1,0), impose the three selected-row
radius stars with squared distances, and require every increasing triple in
the proposed boundary order to have one strict orientation.
"""

from itertools import combinations
import subprocess


ORDER = ("o", "r", "f", "t", "e", "y", "s", "x")
LABELS = tuple(sorted(ORDER))


def sqdist(a: str, b: str) -> str:
    return (
        f"(+ (* (- {a}0 {b}0) (- {a}0 {b}0)) "
        f"(* (- {a}1 {b}1) (- {a}1 {b}1)))"
    )


def area(a: str, b: str, c: str) -> str:
    return (
        f"(- (* (- {b}0 {a}0) (- {c}1 {a}1)) "
        f"(* (- {b}1 {a}1) (- {c}0 {a}0)))"
    )


def main() -> None:
    lines = ["(set-logic QF_NRA)", "(set-option :timeout 600000)"]
    for label in LABELS:
        lines += [f"(declare-const {label}0 Real)", f"(declare-const {label}1 Real)"]
    lines += [
        "(assert (= s0 0))", "(assert (= s1 0))",
        "(assert (= f0 1))", "(assert (= f1 0))",
    ]
    for center, support in (
        ("s", ("o", "e", "x", "y")),
        ("f", ("o", "e", "r", "t")),
        ("e", ("x", "y", "r", "t")),
    ):
        base = sqdist(center, support[0])
        for point in support[1:]:
            lines.append(f"(assert (= {base} {sqdist(center, point)}))")
    for a, b, c in combinations(ORDER, 3):
        lines.append(f"(assert (> {area(a, b, c)} 0))")
    lines += ["(check-sat)", "(get-model)"]
    result = subprocess.run(
        ["z3", "-in"], input="\n".join(lines) + "\n", text=True,
        capture_output=True, check=False,
    )
    print(result.stdout)
    print(result.stderr)
    raise SystemExit(result.returncode)


if __name__ == "__main__":
    main()
