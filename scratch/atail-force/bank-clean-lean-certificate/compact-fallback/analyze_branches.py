#!/usr/bin/env python3
"""Minimize the two exact circle-intersection branches of the 15-row core.

This is scratch discovery code.  It substitutes either ``G = O`` or the
explicit reflection of ``O`` across the line ``AK`` after the normalized
``O=(0,0), A=(1,0)`` gauge, then uses msolve as a proposal oracle and Singular
as an independent characteristic-zero check.
"""

from __future__ import annotations

import json
import subprocess
import tempfile
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
CORE = HERE.parents[1] / "bank-clean-unit-independent-audit/confirm_15_from17.json"


def serialize(expr: sp.Expr) -> str:
    return sp.sstr(sp.expand(expr)).replace("**", "^")


def msolve_unit(variables: list[sp.Symbol], polys: list[sp.Expr]) -> bool:
    with tempfile.TemporaryDirectory(prefix="p97-bank-clean-branch-") as temp:
        root = Path(temp)
        source = root / "input.ms"
        output = root / "output.ms"
        source.write_text(
            ",".join(map(str, variables))
            + "\n0\n"
            + ",\n".join(serialize(poly) for poly in polys)
            + "\n",
            encoding="utf-8",
        )
        proc = subprocess.run(
            ["msolve", "-f", str(source), "-o", str(output), "-t", "4"],
            capture_output=True,
            text=True,
            timeout=60,
            check=False,
        )
        text = output.read_text(encoding="utf-8") if output.exists() else ""
        if proc.returncode != 0:
            raise RuntimeError(proc.stderr or proc.stdout)
        return text.strip().startswith("[-1")


def singular_unit(variables: list[sp.Symbol], polys: list[sp.Expr]) -> bool:
    script = (
        f"ring r=0,({','.join(map(str, variables))}),dp;\n"
        f"ideal I={','.join(serialize(poly) for poly in polys)};\n"
        "ideal G=slimgb(I);\n"
        'if (reduce(1,G)==0) { print("UNIT"); } else { print("PROPER"); }\n'
        "exit;\n"
    )
    proc = subprocess.run(
        ["Singular", "-q"],
        input=script,
        capture_output=True,
        text=True,
        timeout=120,
        check=False,
    )
    if proc.returncode != 0:
        raise RuntimeError(proc.stderr or proc.stdout)
    return "UNIT" in proc.stdout


def load() -> tuple[list[str], list[sp.Symbol], list[sp.Expr]]:
    document = json.loads(CORE.read_text(encoding="utf-8"))
    names = [str(item["name"]) for item in document["generators"]]
    raw_names = sorted(
        {
            token
            for item in document["generators"]
            for token in sp.sympify(item["polynomial"]).free_symbols
        },
        key=str,
    )
    # Reparse under one shared symbol table.
    symbols = [sp.Symbol(str(symbol)) for symbol in raw_names]
    local = {str(symbol): symbol for symbol in symbols}
    polys = [
        sp.expand(sp.sympify(item["polynomial"], locals=local))
        for item in document["generators"]
    ]
    return names, symbols, polys


def minimize(names: list[str], variables: list[sp.Symbol], polys: list[sp.Expr]):
    retained = [(name, poly) for name, poly in zip(names, polys, strict=True) if poly != 0]
    changed = True
    while changed:
        changed = False
        for index, (name, _poly) in enumerate(tuple(retained)):
            trial = retained[:index] + retained[index + 1 :]
            if msolve_unit(variables, [poly for _name, poly in trial]):
                print("delete", name, flush=True)
                retained = trial
                changed = True
                break
    if not msolve_unit(variables, [poly for _name, poly in retained]):
        raise RuntimeError("minimized branch lost UNIT in msolve")
    if not singular_unit(variables, [poly for _name, poly in retained]):
        raise RuntimeError("minimized branch failed independent Singular check")
    return retained


def main() -> None:
    names, symbols, polys = load()
    local = {str(symbol): symbol for symbol in symbols}
    gx, gy = local["Gx"], local["Gy"]
    kx, ky = local["Kx"], local["Ky"]
    yx, yy = local["Yx"], local["Yy"]
    zx, zy = local["Zx"], local["Zy"]
    reflected_g = {gx: 2 * ky**2, gy: 2 * ky * (1 - kx)}
    branches = {
        "coincident": {gx: 0, gy: 0},
        "reflected": reflected_g,
        "reflected_then_y_eq_g": {
            **reflected_g,
            yx: 2 * ky**2,
            yy: 2 * ky * (1 - kx),
        },
        "reflected_then_z_eq_k": {**reflected_g, zx: kx, zy: ky},
    }
    output = {}
    for branch, substitution in branches.items():
        branch_polys = [sp.expand(poly.subs(substitution)) for poly in polys]
        variables = [symbol for symbol in symbols if symbol not in substitution]
        print(branch, "start", len([p for p in branch_polys if p != 0]), flush=True)
        retained = minimize(names, variables, branch_polys)
        output[branch] = {
            "variables": [str(variable) for variable in variables],
            "retained": [
                {"name": name, "polynomial": serialize(poly)} for name, poly in retained
            ],
        }
        print(branch, "retained", len(retained), [name for name, _ in retained], flush=True)
    (HERE / "branch_minimization.json").write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


if __name__ == "__main__":
    main()
