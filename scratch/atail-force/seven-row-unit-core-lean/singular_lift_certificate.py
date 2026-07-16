#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Extract an exact QQ liftstd certificate for the normalized seven rows."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from pathlib import Path

import sympy as sp

import analyze_equalities as system


HERE = Path(__file__).resolve().parent


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--output", type=Path, default=HERE / "seven_row_unit_certificate.json"
    )
    parser.add_argument("--timeout", type=float, default=900.0)
    args = parser.parse_args()

    named = system.generators()
    polynomials = [polynomial for _, polynomial in named]
    if system.canonical_sha256(polynomials) != system.EXPECTED_POLYNOMIAL_SHA256:
        raise AssertionError("pinned polynomial stream drift")
    expressions = [
        sp.sympify(
            polynomial.replace("^", "**"),
            locals={str(variable): variable for variable in system.VARIABLES},
        )
        for polynomial in polynomials
    ]
    active_symbols = tuple(
        variable
        for variable in system.VARIABLES
        if any(variable in expression.free_symbols for expression in expressions)
    )
    commands = [
        f"ring r=0,({','.join(str(variable) for variable in active_symbols)}),dp;",
        f"ideal I={','.join(polynomials)};",
        "matrix T;",
        'ideal G=liftstd(I,T,"slimgb");',
        'print("P97_BASIS="+string(G));',
        'print("P97_MULTIPLIERS_BEGIN");',
    ]
    commands.extend(
        f'print("P97_M_{index}="+string(T[{index},1]));'
        for index in range(1, len(polynomials) + 1)
    )
    commands.extend(('print("P97_MULTIPLIERS_END");', "exit;"))
    process = subprocess.run(
        ["Singular", "-q"],
        input="\n".join(commands) + "\n",
        capture_output=True,
        text=True,
        timeout=args.timeout,
        check=False,
    )
    if process.returncode != 0:
        raise RuntimeError(process.stderr or process.stdout)
    if "P97_BASIS=1" not in process.stdout:
        raise RuntimeError("liftstd did not return the unit basis")
    block = process.stdout.split("P97_MULTIPLIERS_BEGIN\n", 1)[1].split(
        "\nP97_MULTIPLIERS_END", 1
    )[0]
    parsed: dict[int, str] = {}
    for line in block.splitlines():
        prefix, value = line.split("=", 1)
        parsed[int(prefix.removeprefix("P97_M_"))] = value
    if set(parsed) != set(range(1, len(polynomials) + 1)):
        raise RuntimeError("incomplete liftstd multiplier stream")
    multipliers = [parsed[index] for index in range(1, len(polynomials) + 1)]
    identity_text = "+".join(
        f"({multiplier})*({polynomial})"
        for multiplier, polynomial in zip(multipliers, polynomials)
        if multiplier != "0"
    )
    document = {
        "schema": "p97-atail-qq-change-matrix-certificate-v1",
        "target": "normalized_seven_row_anchor_collision",
        "coordinate_model": "p0_zero_p1_e1",
        "source_full_equality_sha256": system.EXPECTED_POLYNOMIAL_SHA256,
        "raw_change_identity_sha256": hashlib.sha256(
            identity_text.encode("utf-8")
        ).hexdigest(),
        "generator_stream_sha256": hashlib.sha256(
            "\n".join(polynomials).encode("utf-8")
        ).hexdigest(),
        "variables": [str(variable) for variable in active_symbols],
        "rows": [
            {"center": center, "support": list(support)}
            for center, support in system.ROWS
        ],
        "generator_names": [name for name, _ in named],
        "generators": polynomials,
        "multipliers": multipliers,
        "identity": "1 = sum_i multipliers[i] * generators[i]",
        "basis_count": 1,
        "nonzero_multiplier_count": sum(value != "0" for value in multipliers),
        "producer": {
            "tool": "Singular",
            "algorithm": "liftstd-slimgb",
            "stdout_sha256": hashlib.sha256(process.stdout.encode()).hexdigest(),
        },
    }
    args.output.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "output": str(args.output),
        "nonzero_multiplier_count": document["nonzero_multiplier_count"],
        "raw_change_identity_sha256": document["raw_change_identity_sha256"],
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
