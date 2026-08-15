#!/usr/bin/env python3
"""Run the QF_NRA search and cross-check the exact rational witness."""

from __future__ import annotations

import json
import subprocess
from concurrent.futures import ThreadPoolExecutor
from fractions import Fraction as Q
from pathlib import Path

HERE = Path(__file__).resolve().parent


def smt_atom(raw: str) -> str:
    q = Q(raw)
    magnitude = str(abs(q.numerator)) if q.denominator == 1 else f"(/ {abs(q.numerator)} {q.denominator})"
    return f"(- {magnitude})" if q < 0 else magnitude


def pinned_source(base: str) -> str:
    source = base.rsplit("(check-sat)", 1)[0]
    points = json.loads((HERE / "witness.json").read_text())["points"]
    for name, (x, y) in points.items():
        source += f"(assert (= x_{name} {smt_atom(x)}))\n"
        source += f"(assert (= y_{name} {smt_atom(y)}))\n"
    return source + "(check-sat)\n"


def run(name: str, command: list[str], source: str, wall_seconds: int) -> str:
    try:
        result = subprocess.run(
            command,
            input=source,
            text=True,
            capture_output=True,
            timeout=wall_seconds,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return f"{name}: UNKNOWN_TIMEOUT"
    stdout = result.stdout.strip().splitlines()
    if result.returncode == 0 and stdout and stdout[0] in {"sat", "unsat", "unknown"}:
        return f"{name}: {stdout[0].upper()}"
    combined = (result.stdout + "\n" + result.stderr).lower()
    if "timeout" in combined:
        return f"{name}: UNKNOWN_TIMEOUT (exit {result.returncode})"
    return f"{name}: UNKNOWN_ERROR (exit {result.returncode})"


def main() -> None:
    source = (HERE / "probe.smt2").read_text()
    pinned = pinned_source(source)
    jobs = [
        ("z3-search", ["z3", "-in", "-T:30"], source, 35),
        ("cvc5-search", ["cvc5", "--lang=smt2", "--tlimit=20000", "--nl-cov"], source, 25),
        ("z3-pinned-replay", ["z3", "-in", "-T:10"], pinned, 15),
        ("cvc5-pinned-replay", ["cvc5", "--lang=smt2", "--tlimit=10000", "--nl-cov"], pinned, 15),
    ]
    with ThreadPoolExecutor(max_workers=len(jobs)) as pool:
        futures = [pool.submit(run, name, command, text, timeout) for name, command, text, timeout in jobs]
        for future in futures:
            print(future.result())


if __name__ == "__main__":
    main()
