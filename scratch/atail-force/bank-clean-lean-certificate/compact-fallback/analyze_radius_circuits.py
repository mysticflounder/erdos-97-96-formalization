#!/usr/bin/env python3
"""Factor selected specializations of the exact radius circuit eliminants."""

from __future__ import annotations

import re
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
SOURCE = HERE / "radius_circuit_compatibility.sing"


def load(name: str, symbols: dict[str, sp.Symbol]) -> sp.Expr:
    text = SOURCE.read_text(encoding="utf-8")
    match = re.search(rf"poly {name} =(.+?);", text, re.DOTALL)
    if match is None:
        raise ValueError(name)
    return sp.expand(sp.sympify(match.group(1).replace("^", "**"), locals=symbols))


def main() -> None:
    r, s, t = sp.symbols("R S T")
    symbols = {"R": r, "S": s, "T": t}
    for name in ["P4", "C1", "C2", "C3"]:
        poly = load(name, symbols)
        print(name, "R=S=1:", sp.factor(poly.subs({r: 1, s: 1})))
        print(name, "R=1:", sp.factor(poly.subs(r, 1)))


if __name__ == "__main__":
    main()
