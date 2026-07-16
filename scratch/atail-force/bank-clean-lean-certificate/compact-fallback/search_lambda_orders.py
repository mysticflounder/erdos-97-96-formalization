#!/usr/bin/env python3
"""Search monomial variable orders for a compact modular Kx lift.

This is discovery-only.  Promising orders are rerun over QQ separately.
"""

from __future__ import annotations

import json
import random
import subprocess
import time
from pathlib import Path

from minimize_lambda_consequences import GENERATORS, VARIABLES


HERE = Path(__file__).resolve().parent
OUTPUT = HERE / "lambda_order_search_modp.json"


def script(order: list[str]) -> str:
    rows = ",\n  ".join(poly for _, poly in GENERATORS)
    return f"""ring r=32003,({','.join(order)}),dp;
ideal I=
  {rows};
ideal T=Kx;
matrix M=lift(I,T);
matrix C=matrix(I)*M;
if(C[1,1]-Kx!=0){{print(\"FAIL\");quit;}}
int i,totalterms,totalchars,maxdeg;
totalterms=0;totalchars=0;maxdeg=0;
for(i=1;i<=12;i++){{
  totalterms=totalterms+size(M[i,1]);
  totalchars=totalchars+size(string(M[i,1]));
  if(deg(M[i,1])>maxdeg){{maxdeg=deg(M[i,1]);}}
}}
print(\"PASS_\"+string(totalterms)+\"_\"+string(totalchars)+\"_\"+string(maxdeg));
quit;
"""


def main() -> None:
    rng = random.Random(9755412)
    seeds = [
        list(VARIABLES),
        list(reversed(VARIABLES)),
        ["Fx", "Fy", "Xx", "Xy", "Yx", "Yy", "L", "Zx", "Zy", "Ky", "Kx"],
        ["Fx", "Fy", "Xx", "Xy", "Yx", "Yy", "L", "Kx", "Ky", "Zx", "Zy"],
        ["Yx", "Yy", "Fx", "Fy", "Xx", "Xy", "L", "Zx", "Zy", "Ky", "Kx"],
        ["L", "Yx", "Yy", "Fx", "Fy", "Xx", "Xy", "Zx", "Zy", "Ky", "Kx"],
    ]
    orders: list[list[str]] = []
    seen: set[tuple[str, ...]] = set()
    for order in seeds:
        key = tuple(order)
        if key not in seen:
            seen.add(key)
            orders.append(order)
    while len(orders) < 36:
        order = list(VARIABLES)
        rng.shuffle(order)
        key = tuple(order)
        if key not in seen:
            seen.add(key)
            orders.append(order)

    results = []
    for index, order in enumerate(orders):
        start = time.monotonic()
        try:
            process = subprocess.run(
                ["Singular", "-q"],
                input=script(order),
                capture_output=True,
                text=True,
                timeout=15,
                check=False,
            )
            elapsed = time.monotonic() - start
            output = process.stdout.strip()
            if process.returncode == 0 and output.startswith("PASS_"):
                _, terms, chars, degree = output.split("_")
                result = {
                    "order": order,
                    "terms": int(terms),
                    "chars": int(chars),
                    "degree": int(degree),
                    "seconds": elapsed,
                }
                results.append(result)
                print(index, result["terms"], result["degree"], order, flush=True)
            else:
                print(index, "ERROR", output, process.stderr, flush=True)
        except subprocess.TimeoutExpired:
            print(index, "TIMEOUT", order, flush=True)

    results.sort(key=lambda result: (result["terms"], result["chars"]))
    OUTPUT.write_text(json.dumps({"results": results}, indent=2) + "\n")
    print(OUTPUT)


if __name__ == "__main__":
    main()
