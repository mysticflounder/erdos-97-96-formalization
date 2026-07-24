#!/usr/bin/env python3
"""Exact QF_LRA strict-Kalmanson metric oracle for the lcap14 surface.

Metric layer — exactly the family production has PROVEN from strict convex
position with cyclic boundary order 0..13:

  d_uv > 0 for every pair;
  strict triangle inequality for every triple;
  for every 4-subset a < b < c < d (increasing index = cyclic order):
      d_ac + d_bd > d_ab + d_cd   and   d_ac + d_bd > d_ad + d_bc.

A witness's complete equality/disequality pattern (the decoded `eq` atoms)
is asserted with per-atom names so z3 returns an unsat core over the
pattern atoms only.  The geometry axioms are unnamed and hence background:
a core is a set of signed pattern atoms jointly infeasible for *every*
strict-Kalmanson metric on the fixed cyclic order.

Self-test (`python metric_oracle.py --self-test`):

1. Realizable direction: the exact Q(sqrt(3)) regression carrier of
   `cardge14-nonlinear-escape-geometry` is a genuine strictly convex
   planar 14-point set, so its complete equality pattern (indices taken in
   its own convex order) must be metric-SAT.
2. Infeasible direction: the first equality-pattern core logged by the
   independent cover14 CEGAR implementation (`/tmp/cover14-cores.txt`,
   same vertex convention: cyclic order 0..13) must be metric-UNSAT here,
   cross-validating the two oracles against each other.
"""

from __future__ import annotations

import argparse
import ast
import itertools
import subprocess
import sys
from pathlib import Path

N = 14

Atom = tuple[int, int, int]  # (center, left, right) with left < right


def dvar(u: int, v: int) -> str:
    u, v = min(u, v), max(u, v)
    return f"d_{u}_{v}"


def emit_smt(epos: list[Atom], eneg: list[Atom], path: Path) -> dict[str, tuple[str, Atom]]:
    lines = [
        "(set-option :produce-unsat-cores true)",
        "(set-logic QF_LRA)",
    ]
    for u, v in itertools.combinations(range(N), 2):
        lines.append(f"(declare-const {dvar(u, v)} Real)")
        lines.append(f"(assert (> {dvar(u, v)} 0))")
    for a, b, c in itertools.combinations(range(N), 3):
        lines.append(f"(assert (< {dvar(a, c)} (+ {dvar(a, b)} {dvar(b, c)})))")
        lines.append(f"(assert (< {dvar(a, b)} (+ {dvar(a, c)} {dvar(b, c)})))")
        lines.append(f"(assert (< {dvar(b, c)} (+ {dvar(a, b)} {dvar(a, c)})))")
    for a, b, c, d in itertools.combinations(range(N), 4):
        diag = f"(+ {dvar(a, c)} {dvar(b, d)})"
        lines.append(f"(assert (> {diag} (+ {dvar(a, b)} {dvar(c, d)})))")
        lines.append(f"(assert (> {diag} (+ {dvar(a, d)} {dvar(b, c)})))")
    named: dict[str, tuple[str, Atom]] = {}
    for i, (y, u, v) in enumerate(sorted(epos)):
        name = f"EP{i}"
        named[name] = ("+", (y, u, v))
        lines.append(f"(assert (! (= {dvar(y, u)} {dvar(y, v)}) :named {name}))")
    for i, (y, u, v) in enumerate(sorted(eneg)):
        name = f"EN{i}"
        named[name] = ("-", (y, u, v))
        lines.append(
            f"(assert (! (not (= {dvar(y, u)} {dvar(y, v)})) :named {name}))"
        )
    lines.append("(check-sat)")
    lines.append("(get-unsat-core)")
    path.write_text("\n".join(lines) + "\n", encoding="ascii")
    return named


def run_oracle(
    epos: list[Atom], eneg: list[Atom], workdir: Path, timeout: float = 600.0
) -> tuple[str, list[tuple[str, Atom]]]:
    """Returns ("sat", []) or ("unsat", signed core atoms)."""
    workdir.mkdir(parents=True, exist_ok=True)
    smt = workdir / "oracle.smt2"
    named = emit_smt(epos, eneg, smt)
    completed = subprocess.run(
        ["z3", "-smt2", str(smt)],
        capture_output=True, text=True, timeout=timeout, check=False,
    )
    out = completed.stdout
    if out.startswith("sat"):
        return "sat", []
    if not out.startswith("unsat"):
        raise RuntimeError(f"z3 unexpected output: {out[:500]}")
    core: list[tuple[str, Atom]] = []
    for line in out.splitlines():
        line = line.strip()
        if line.startswith("(") and ("EP" in line or "EN" in line):
            for token in line.split():
                token = token.strip("()")
                if token in named:
                    core.append(named[token])
    return "unsat", core


def q3_pattern() -> tuple[list[Atom], list[Atom]]:
    root = Path(__file__).resolve().parent.parents[2]
    sys.path.insert(
        0, str(root / "scratch/atail-force/cardge14-nonlinear-escape-geometry")
    )
    import verify_exact_regression as G

    order = list(G.ORDER)
    position = {name: index for index, name in enumerate(order)}
    epos: list[Atom] = []
    eneg: list[Atom] = []
    for center in order:
        c = position[center]
        blocks = [
            {position[p] for p in block}
            for block in G.distance_classes(center).values()
        ]
        member = {}
        for i, block in enumerate(blocks):
            for p in block:
                member[p] = i
        for left, right in itertools.combinations(sorted(member), 2):
            atom = (c, left, right)
            if member[left] == member[right]:
                epos.append(atom)
            else:
                eneg.append(atom)
    return epos, eneg


def first_cover14_core(path: Path) -> tuple[list[Atom], list[Atom]]:
    line = path.read_text(encoding="ascii").splitlines()[0]
    atoms = ast.literal_eval(line)
    epos = [(y, min(u, v), max(u, v)) for sign, y, u, v in atoms if sign == "+"]
    eneg = [(y, min(u, v), max(u, v)) for sign, y, u, v in atoms if sign == "-"]
    return epos, eneg


def self_test(workdir: Path) -> int:
    epos, eneg = q3_pattern()
    status, _ = run_oracle(epos, eneg, workdir / "q3")
    assert status == "sat", f"Q(sqrt3) realizable pattern reported {status}"
    print(f"PASS oracle gate: Q(sqrt3) carrier pattern is metric-SAT "
          f"({len(epos)} equalities, {len(eneg)} disequalities)")

    core_bank = Path("/tmp/cover14-cores.txt")
    if core_bank.exists():
        epos, eneg = first_cover14_core(core_bank)
        status, core = run_oracle(epos, eneg, workdir / "xcheck")
        assert status == "unsat", (
            f"cover14 core reported {status}; cross-validation failed"
        )
        print(f"PASS oracle gate: first cover14 core ({len(epos)}+ "
              f"{len(eneg)}- atoms) is metric-UNSAT; core size {len(core)}")
    else:
        print("SKIP cross-validation: /tmp/cover14-cores.txt not present")

    print("PASS: lcap14 metric oracle self-test")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--workdir", type=Path,
                        default=Path(__file__).resolve().parent / "cegar-work")
    args = parser.parse_args()
    if args.self_test:
        return self_test(args.workdir)
    parser.error("only --self-test is supported as a direct entry point")
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
