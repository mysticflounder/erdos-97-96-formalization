#!/usr/bin/env python3
"""Small exact QF_NRA proposal/checker for the two abstract survivors."""

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


def x(i: int) -> str:
    return f"x{i}"


def y(i: int) -> str:
    return f"y{i}"


def cross(i: int, j: int, k: int) -> str:
    """cross(Pj-Pi, Pk-Pi)."""
    return (
        f"(- (* (- {x(j)} {x(i)}) (- {y(k)} {y(i)}))"
        f" (* (- {y(j)} {y(i)}) (- {x(k)} {x(i)})))"
    )


def d2(i: int, j: int) -> str:
    dx = f"(- {x(i)} {x(j)})"
    dy = f"(- {y(i)} {y(j)})"
    return f"(+ (* {dx} {dx}) (* {dy} {dy}))"


def row_eq(i: int, a: int, b: int) -> str:
    return f"(= {d2(i, a)} {d2(i, b)})"


def smt_for(name: str, m: tuple[int, int, int]) -> str:
    out = ["(set-logic QF_NRA)", "(set-option :produce-models true)", "(set-option :timeout 120000)"]
    out += [f"(declare-fun {x(i)} () Real)" for i in range(6)]
    out += [f"(declare-fun {y(i)} () Real)" for i in range(6)]
    out += ["(assert (= x0 0))", "(assert (= y0 0))", "(assert (= x1 1))", "(assert (= y1 0))"]
    # Every edge has all other vertices strictly to its left: strict convex CCW order.
    q = 0
    for i in range(6):
        j = (i + 1) % 6
        for k in range(6):
            if k not in (i, j):
                q += 1
                out.append(f"(assert (! (> {cross(i, j, k)} 0) :named C{q}))")
    # Pairwise distinctness follows from the strict edge-support constraints.
    supports = (3, 4, 5)
    for i, omitted in enumerate(m):
        kept = [supports[t] for t in range(3) if t != omitted]
        out.append(f"(assert (! {row_eq(i, kept[0], kept[1])} :named R{i}))")
    out += ["(check-sat)"]
    return "\n".join(out) + "\n"


def run(cmd: list[str], path: Path, suffix: str = "") -> str:
    try:
        if suffix:
            stdin_cmd = cmd + (["-in"] if "z3" in cmd[0] else [])
            p = subprocess.run(stdin_cmd, input=path.read_text() + suffix, text=True, capture_output=True, check=False, timeout=130)
        else:
            p = subprocess.run(cmd + [str(path)], text=True, capture_output=True, check=False, timeout=130)
    except subprocess.TimeoutExpired as e:
        return "unknown\n; timeout after 130s\n" + (e.stdout or "")
    return p.stdout + ("\n; stderr\n" + p.stderr if p.stderr else "")


def status(raw: str) -> str:
    for line in raw.splitlines():
        if line.strip() in {"sat", "unsat", "unknown"}:
            return line.strip()
    return "no-status"


def main() -> None:
    cases = {"m012": (0, 1, 2), "m210": (2, 1, 0)}
    result = {
        "encoding": "QF_NRA; fixed p0=(0,0), p1=(1,0); every cyclic edge supports all other vertices strictly left",
        "cases": {},
    }
    zcmd = ["/Users/adam/bin/z3", "-smt2"]
    ccmd = ["/Users/adam/bin/cvc5", "--lang=smt2", "--produce-models", "--produce-unsat-cores", "--tlimit=120000"]
    for name, m in cases.items():
        path = SMT / f"{name}.smt2"
        path.write_text(smt_for(name, m))
        zr = run(zcmd, path)
        cr = run(ccmd, path)
        zs, cs = status(zr), status(cr)
        zq = run(zcmd, path, "(get-model)\n") if zs == "sat" else run(zcmd, path, "(get-unsat-core)\n")
        cq = run(ccmd, path, "(get-model)\n") if cs == "sat" else run(ccmd, path, "(get-unsat-core)\n")
        (RAW / f"{name}.z3.txt").write_text(zq)
        (RAW / f"{name}.cvc5.txt").write_text(cq)
        result["cases"][name] = {"m": list(m), "z3": zs, "cvc5": cs}
    (ROOT / "results.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
