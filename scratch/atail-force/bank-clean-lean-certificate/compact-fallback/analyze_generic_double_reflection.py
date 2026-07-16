#!/usr/bin/env python3
"""Minimize the exact generic double-reflection residual.

This is scratch discovery code.  It substitutes the first reflected branch,
adds the two denominator-free second-reflection identities, and saturates by
the squared center separation so that the generic ``K != Z`` arm is encoded
as a pure equality system.  msolve proposes deletions; Singular over QQ
independently confirms the terminal UNIT verdict.
"""

from __future__ import annotations

import json
import subprocess
import tempfile
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
CORE = HERE.parents[1] / "bank-clean-unit-independent-audit/confirm_15_from17.json"
OUTPUT = HERE / "generic_double_reflection_minimization.json"


def serialize(expr: sp.Expr) -> str:
    return sp.sstr(sp.expand(expr)).replace("**", "^")


def run_msolve(variables: list[sp.Symbol], polynomials: list[sp.Expr]) -> bool:
    with tempfile.TemporaryDirectory(prefix="p97-generic-reflection-") as temp:
        source = Path(temp) / "input.ms"
        output = Path(temp) / "output.ms"
        source.write_text(
            ",".join(map(str, variables))
            + "\n0\n"
            + ",\n".join(serialize(poly) for poly in polynomials)
            + "\n",
            encoding="utf-8",
        )
        process = subprocess.run(
            ["msolve", "-f", str(source), "-o", str(output), "-t", "2"],
            capture_output=True,
            text=True,
            timeout=120,
            check=False,
        )
        if process.returncode != 0:
            raise RuntimeError(process.stderr or process.stdout)
        return output.read_text(encoding="utf-8").strip().startswith("[-1")


def run_singular(variables: list[sp.Symbol], polynomials: list[sp.Expr]) -> bool:
    script = (
        f"ring r=0,({','.join(map(str, variables))}),dp;\n"
        f"ideal I={','.join(serialize(poly) for poly in polynomials)};\n"
        "ideal G=slimgb(I);\n"
        'if(size(G)==1 and G[1]==1){print("UNIT");}else{print("NONUNIT");}\n'
        "quit;\n"
    )
    process = subprocess.run(
        ["Singular", "-q"],
        input=script,
        capture_output=True,
        text=True,
        timeout=180,
        check=False,
    )
    if process.returncode != 0:
        raise RuntimeError(process.stderr or process.stdout)
    return process.stdout.strip() == "UNIT"


def load_core() -> tuple[list[str], dict[str, sp.Symbol], list[sp.Expr]]:
    document = json.loads(CORE.read_text(encoding="utf-8"))
    raw_names = sorted(
        {
            str(symbol)
            for item in document["generators"]
            for symbol in sp.sympify(item["polynomial"]).free_symbols
        }
    )
    local = {name: sp.Symbol(name) for name in raw_names}
    names = [str(item["name"]) for item in document["generators"]]
    polynomials = [
        sp.expand(sp.sympify(item["polynomial"], locals=local))
        for item in document["generators"]
    ]
    return names, local, polynomials


def smoke() -> None:
    x = sp.Symbol("x")
    if not run_msolve([x], [x, x - 1]):
        raise RuntimeError("msolve UNIT smoke failed")
    if run_msolve([x], [x**2 - 1]):
        raise RuntimeError("msolve SAT smoke failed")
    if not run_singular([x], [x, x - 1]):
        raise RuntimeError("Singular UNIT smoke failed")
    if run_singular([x], [x**2 - 1]):
        raise RuntimeError("Singular SAT smoke failed")


def main() -> None:
    smoke()
    names, local, polynomials = load_core()
    gx, gy = local["Gx"], local["Gy"]
    kx, ky = local["Kx"], local["Ky"]
    yx, yy = local["Yx"], local["Yy"]
    zx, zy = local["Zx"], local["Zy"]
    inv = sp.Symbol("InvD")
    reflected = {gx: 2 * ky**2, gy: 2 * ky * (1 - kx)}
    retained = [
        (name, sp.expand(poly.subs(reflected)))
        for name, poly in zip(names, polynomials, strict=True)
        if name not in {"ROW_A_O_G", "ROW_K_O_G"}
    ]
    distance = sp.expand((zx - kx) ** 2 + (zy - ky) ** 2)
    cross = sp.expand(
        -(reflected[gx] - kx) * (zy - ky)
        + (reflected[gy] - ky) * (zx - kx)
    )
    retained.extend(
        [
            (
                "GENERIC_REFLECT_X",
                sp.expand(distance * (yx - reflected[gx]) - 2 * cross * (zy - ky)),
            ),
            (
                "GENERIC_REFLECT_Y",
                sp.expand(distance * (yy - reflected[gy]) + 2 * cross * (zx - kx)),
            ),
            ("GENERIC_CENTER_SEPARATION_INV", sp.expand(inv * distance - 1)),
        ]
    )
    variables = [
        local[name]
        for name in sorted(local)
        if local[name] not in {gx, gy}
    ] + [inv]
    if not run_msolve(variables, [poly for _, poly in retained]):
        raise RuntimeError("generic residual is not UNIT in forward msolve order")
    if not run_msolve(list(reversed(variables)), [poly for _, poly in retained]):
        raise RuntimeError("generic residual is not UNIT in reverse msolve order")
    changed = True
    while changed:
        changed = False
        for index, (name, _) in enumerate(tuple(retained)):
            trial = retained[:index] + retained[index + 1 :]
            if run_msolve(variables, [poly for _, poly in trial]):
                print("delete", name, flush=True)
                retained = trial
                changed = True
                break
    if not run_singular(variables, [poly for _, poly in retained]):
        raise RuntimeError("Singular rejected the minimized UNIT system")
    document = {
        "schema": "p97-bank-clean-generic-double-reflection-minimization-v1",
        "variables": [str(variable) for variable in variables],
        "retained": [
            {"name": name, "polynomial": serialize(poly)} for name, poly in retained
        ],
        "msolve_forward_unit": True,
        "msolve_reverse_unit": True,
        "singular_qq_unit": True,
        "generic_encoding": {
            "distance": serialize(distance),
            "cross": serialize(cross),
            "saturation": "InvD * distance - 1",
        },
    }
    OUTPUT.write_text(json.dumps(document, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"output": str(OUTPUT), "retained": len(retained)}, indent=2))


if __name__ == "__main__":
    main()
