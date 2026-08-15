#!/usr/bin/env python3
"""Exact QF_LRA diagnostic for six-point shared-fourth row equalities."""

from __future__ import annotations

import itertools
import json
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parent
SMT = ROOT / "smt2"
RAW = ROOT / "raw"
SMT.mkdir(parents=True, exist_ok=True)
RAW.mkdir(parents=True, exist_ok=True)

POINTS = range(6)
CENTERS = range(3)
SUPPORTS = (3, 4, 5)


def v(i: int, j: int) -> str:
    i, j = sorted((i, j))
    return f"d_{i}_{j}"


def eq(a: int, b: int, c: int, d: int) -> str:
    return f"(= (+ {v(a, b)} (* (- 1) {v(c, d)})) 0)"


def smt_for(m: tuple[int, int, int], rows: bool) -> str:
    names = [v(i, j) for i in POINTS for j in POINTS if i < j]
    out = [
        "(set-logic QF_LRA)",
        "(set-option :produce-unsat-cores true)",
        *[f"(declare-fun {x} () Real)" for x in names],
    ]
    q = 0
    for i, j, k, l in itertools.combinations(POINTS, 4):
        q += 1
        out.append(
            f"(assert (! (< (+ {v(i,j)} {v(k,l)}) (+ {v(i,k)} {v(j,l)})) :named K{q}a))"
        )
        out.append(
            f"(assert (! (< (+ {v(i,l)} {v(j,k)}) (+ {v(i,k)} {v(j,l)})) :named K{q}b))"
        )
    if rows:
        for i, omitted in zip(CENTERS, m):
            kept = [SUPPORTS[t] for t in range(3) if t != omitted]
            out.append(f"(assert (! {eq(i, kept[0], i, kept[1])} :named R{i}))")
    out += ["(check-sat)"]
    return "\n".join(out) + "\n"


def run(cmd: list[str], path: Path, suffix: str = "") -> str:
    if suffix:
        stdin_cmd = cmd + (["-in"] if "z3" in cmd[0] else [])
        p = subprocess.run(
            stdin_cmd, input=path.read_text() + suffix, text=True, capture_output=True, check=False
        )
    else:
        p = subprocess.run(cmd + [str(path)], text=True, capture_output=True, check=False)
    return p.stdout + ("\n; stderr\n" + p.stderr if p.stderr else "")


def status(raw: str) -> str:
    for line in raw.splitlines():
        line = line.strip()
        if line in {"sat", "unsat", "unknown"}:
            return line
    return "no-status"


def main() -> None:
    cases: list[tuple[str, tuple[int, int, int], bool]] = [("control_no_rows", (0, 1, 2), False)]
    cases += [(f"m_{a}{b}{c}", (a, b, c), True) for a, b, c in itertools.permutations(range(3))]
    cases += [("known_m_102", (1, 0, 2), True)]
    result = {"mapping": "m[i] is omitted support slot; slots 0,1,2 are points 3,4,5", "cases": {}}
    for label, m, rows in cases:
        path = SMT / f"{label}.smt2"
        path.write_text(smt_for(m, rows))
        zstatus_raw = run(["/Users/adam/bin/z3", "-smt2"], path)
        cstatus_raw = run(
            [
                "/Users/adam/bin/cvc5",
                "--lang=smt2",
                "--produce-models",
                "--produce-unsat-cores",
            ],
            path,
        )
        zstat = status(zstatus_raw)
        cstat = status(cstatus_raw)
        query = "(get-model)\n" if zstat == "sat" else "(get-unsat-core)\n"
        zraw = run(["/Users/adam/bin/z3", "-smt2"], path, query)
        query = "(get-model)\n" if cstat == "sat" else "(get-unsat-core)\n"
        craw = run(
            [
                "/Users/adam/bin/cvc5",
                "--lang=smt2",
                "--produce-models",
                "--produce-unsat-cores",
            ],
            path,
            query,
        )
        (RAW / f"{label}.z3.txt").write_text(zraw)
        (RAW / f"{label}.cvc5.txt").write_text(craw)
        result["cases"][label] = {
            "m": list(m),
            "rows": rows,
            "z3": zstat,
            "cvc5": cstat,
        }
    (ROOT / "results.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
