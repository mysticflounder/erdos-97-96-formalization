#!/usr/bin/env python3
"""Emit the exact QQ lift proving Kx is in the low-degree lambda ideal.

The artifact is deterministic and independently checkable by multiplying the
listed generators by the listed cofactors over QQ.  It is an external algebra
certificate until translated into and checked by Lean's kernel.
"""

from __future__ import annotations

import hashlib
import json
import subprocess
from pathlib import Path

from minimize_lambda_consequences import GENERATORS


HERE = Path(__file__).resolve().parent
OUTPUT = HERE / "lambda_kx_qq_lift_certificate.json"
ORDER = ["Ky", "Fx", "Fy", "Xy", "Zx", "Kx", "Yx", "Yy", "Zy", "L", "Xx"]


def main() -> None:
    rows = ",\n  ".join(poly for _, poly in GENERATORS)
    script = f"""ring r=0,({','.join(ORDER)}),dp;
ideal I=
  {rows};
ideal T=Kx;
matrix M=lift(I,T);
matrix C=matrix(I)*M;
if(C[1,1]-Kx!=0){{print(\"IDENTITY_FAIL\");quit;}}
print(\"IDENTITY_PASS\");
int i;
for(i=1;i<=12;i++){{
  print(\"BEGIN_COFACTOR_\"+string(i));
  print(string(M[i,1]));
  print(\"END_COFACTOR_\"+string(i));
}}
quit;
"""
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
    lines = process.stdout.splitlines()
    if not lines or lines[0] != "IDENTITY_PASS":
        raise RuntimeError(process.stdout[:2000])
    cofactors: list[str] = []
    cursor = 1
    for index in range(1, 13):
        begin = f"BEGIN_COFACTOR_{index}"
        end = f"END_COFACTOR_{index}"
        if cursor >= len(lines) or lines[cursor] != begin:
            raise RuntimeError(f"missing {begin} at output line {cursor}")
        cursor += 1
        body: list[str] = []
        while cursor < len(lines) and lines[cursor] != end:
            body.append(lines[cursor])
            cursor += 1
        if cursor >= len(lines):
            raise RuntimeError(f"missing {end}")
        cursor += 1
        cofactors.append("\n".join(body))

    payload = {
        "schema": "p97-bank-clean-lambda-kx-qq-lift-v1",
        "coefficient_field": "QQ",
        "monomial_order": "dp",
        "variable_order": ORDER,
        "target": "Kx",
        "generator_names": [name for name, _ in GENERATORS],
        "generators": [poly for _, poly in GENERATORS],
        "cofactors": cofactors,
        "identity": "sum_i generators[i] * cofactors[i] = Kx",
        "singular_exact_identity_check": True,
        "epistemic_status": "exact external algebra certificate; Lean kernel translation pending",
    }
    canonical = json.dumps(payload, sort_keys=True, separators=(",", ":")).encode()
    payload["content_sha256"] = hashlib.sha256(canonical).hexdigest()
    OUTPUT.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(OUTPUT)
    print("terms", sum(cofactor.count("+") + cofactor.count("-") for cofactor in cofactors))
    print("bytes", OUTPUT.stat().st_size)
    print("sha256", payload["content_sha256"])


if __name__ == "__main__":
    main()
