#!/usr/bin/env python3
"""Greedily minimize exact ideal-membership consequences of the lambda system."""

from __future__ import annotations

import json
import subprocess
from pathlib import Path


HERE = Path(__file__).resolve().parent
OUTPUT = HERE / "lambda_consequence_minimization.json"
VARIABLES = ["L", "Fx", "Fy", "Kx", "Ky", "Xx", "Xy", "Yx", "Yy", "Zx", "Zy"]
GENERATORS = [
    ("AOK", "-Kx^2+2*Kx-Ky^2"),
    ("FAK", "2*Fx*Kx-2*Fx+2*Fy*Ky-2*Kx+1"),
    ("FKZ", "2*Fx*Zx+2*Fy*Zy-2*Fx*Kx-2*Fy*Ky-Zx^2-Zy^2+2*Kx"),
    ("GXK", "4*Kx*Ky*Xy-2*Kx-4*Ky^2*Xx+4*Ky^2-4*Ky*Xy+Xx^2+Xy^2"),
    ("XZ", "Xx^2+Xy^2-2*Xx*Zx-2*Xy*Zy+Zx^2+Zy^2-2*Kx"),
    ("XF", "-Fx^2-Fy^2+2*Fx*Xx+2*Fy*Xy-Xx^2-Xy^2+2*Kx"),
    ("YOX", "-Xx^2+2*Xx*Yx-Xy^2+2*Xy*Yy"),
    ("YOZ", "2*Yx*Zx+2*Yy*Zy-Zx^2-Zy^2"),
    ("ZAG", "-4*Kx*Ky*Zy+4*Ky^2*Zx-4*Ky^2+4*Ky*Zy-2*Zx+1"),
    ("LDEF", "L*(-2*Kx*Zx+2*Kx-2*Ky*Zy+Zx^2+Zy^2)-(2*Kx*Ky-2*Kx*Ky*Zx+Kx*Zy-2*Ky^2*Zy+Ky*Zx)"),
    ("REFLECT_X", "Yx-2*Ky^2-2*L*(Zy-Ky)"),
    ("REFLECT_Y", "Yy-2*Ky*(1-Kx)+2*L*(Zx-Kx)"),
]
TARGETS = [
    ("Kx", "Kx"),
    ("Ky", "Ky"),
    ("Zx", "2*Zx-1"),
    ("Zy", "4*Zy^2+1"),
    ("D", "-2*Kx*Zx+2*Kx-2*Ky*Zy+Zx^2+Zy^2"),
]


def consequence(rows: list[tuple[str, str]], target: str) -> bool:
    script = "\n".join(
        [
            f"ring r=0,({','.join(VARIABLES)}),dp;",
            f"ideal I={','.join(poly for _, poly in rows)};",
            "ideal G=slimgb(I);",
            f"poly rem=reduce({target},G);",
            'if(rem==0){print("YES");}else{print("NO");}',
            "quit;",
        ]
    )
    process = subprocess.run(
        ["Singular", "-q"],
        input=script + "\n",
        capture_output=True,
        text=True,
        timeout=60,
        check=False,
    )
    if process.returncode != 0:
        raise RuntimeError(process.stderr or process.stdout)
    return process.stdout.strip() == "YES"


def minimize(target: str) -> list[tuple[str, str]]:
    rows = list(GENERATORS)
    if not consequence(rows, target):
        raise RuntimeError(f"full system does not imply {target}")
    changed = True
    while changed:
        changed = False
        for index, (name, _) in enumerate(tuple(rows)):
            trial = rows[:index] + rows[index + 1 :]
            if consequence(trial, target):
                print(target, "delete", name, flush=True)
                rows = trial
                changed = True
                break
    return rows


def main() -> None:
    results = []
    for name, target in TARGETS:
        rows = minimize(target)
        results.append(
            {
                "name": name,
                "target": target,
                "retained_names": [row_name for row_name, _ in rows],
                "retained": [poly for _, poly in rows],
                "singular_qq_ideal_membership": True,
            }
        )
    OUTPUT.write_text(
        json.dumps(
            {
                "schema": "p97-bank-clean-lambda-consequence-minimization-v1",
                "variables": VARIABLES,
                "results": results,
            },
            indent=2,
            sort_keys=True,
        )
        + "\n",
        encoding="utf-8",
    )
    print(OUTPUT)


if __name__ == "__main__":
    main()
