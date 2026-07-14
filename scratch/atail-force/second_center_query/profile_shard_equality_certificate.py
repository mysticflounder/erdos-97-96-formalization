#!/usr/bin/env python3
"""Profile a minimized shard equality core's Singular certificate size."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
import time
from pathlib import Path
from typing import Mapping

import sympy as sp


HERE = Path(__file__).resolve().parent
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
if str(ORACLE_DIR) not in sys.path:
    sys.path.insert(0, str(ORACLE_DIR))

import oracle  # noqa: E402


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument("--shard-index", type=int, required=True)
    parser.add_argument("--anchor-left", type=int, default=0)
    parser.add_argument("--anchor-right", type=int, default=1)
    parser.add_argument(
        "--order", choices=("dp", "Dp", "ds", "Ds", "lp"), default="dp"
    )
    parser.add_argument("--timeout-seconds", type=float, default=180.0)
    parser.add_argument("--include-lift", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    checkpoint = json.loads(args.checkpoint.read_text(encoding="utf-8"))
    case = next(
        case
        for case in checkpoint["cases"]
        if int(case["shard_index"]) == args.shard_index
    )
    minimization = case["minimization"]
    records: list[Mapping[str, object]] = minimization["retained_equalities"]
    active_points = sorted(
        {
            int(record[key])
            for record in records
            for key in ("center", "left", "right")
        }
    )
    if args.anchor_left == args.anchor_right:
        parser.error("normalization anchors must be distinct")
    if args.anchor_left not in active_points or args.anchor_right not in active_points:
        parser.error("normalization anchors must occur in the equality core")
    relabeling = {args.anchor_left: 0, args.anchor_right: 1}
    relabeling.update(
        {
            point: index
            for index, point in enumerate(
                (
                    point
                    for point in active_points
                    if point not in {args.anchor_left, args.anchor_right}
                ),
                start=2,
            )
        }
    )
    n = len(active_points)
    rows = tuple(
        oracle.MetricRow(
            relabeling[int(record["center"])],
            (
                relabeling[int(record["left"])],
                relabeling[int(record["right"])],
            ),
            exact=False,
        )
        for record in records
    )
    variables = tuple(str(variable) for variable in oracle.variable_symbols(n))
    polynomials = tuple(
        oracle.serialize_poly(oracle.row_polynomials(n, row)[0]) for row in rows
    )

    commands = [
        f"ring r=0,({','.join(variables)}),{args.order};",
        f"ideal I={','.join(polynomials)};",
        "option(redSB);",
        "ideal G=std(I);",
        'print("P97_BASIS_BEGIN");',
        "print(G);",
        'print("P97_BASIS_END");',
        "matrix L=lift(I,ideal(1));",
        'print("P97_LIFT_BEGIN");',
        *(
            f'print("L[{index},1]="+string(L[{index},1]));'
            for index in range(1, len(polynomials) + 1)
        ),
        'print("P97_LIFT_END");',
        "exit;",
    ]
    started = time.monotonic()
    try:
        completed = subprocess.run(
            ("Singular", "-q"),
            input="\n".join(commands) + "\n",
            capture_output=True,
            text=True,
            timeout=args.timeout_seconds,
            check=False,
        )
        elapsed = time.monotonic() - started
        stdout = completed.stdout
        basis = stdout.split("P97_BASIS_BEGIN\n", 1)[1].split(
            "\nP97_BASIS_END", 1
        )[0]
        lift = stdout.split("P97_LIFT_BEGIN\n", 1)[1].split(
            "\nP97_LIFT_END", 1
        )[0]
        coefficients = lift.splitlines()
        symbols = sp.symbols(" ".join(variables))
        locals_map = dict(zip(variables, symbols, strict=True))
        coefficient_values = [
            coefficient.split("=", 1)[1] for coefficient in coefficients
        ]
        replay = sum(
            (
                sp.sympify(coefficient.replace("^", "**"), locals=locals_map)
                * sp.sympify(polynomial.replace("^", "**"), locals=locals_map)
                for coefficient, polynomial in zip(
                    coefficient_values, polynomials, strict=True
                )
            ),
            sp.S.Zero,
        )
        singular = {
            "status": "COMPLETED",
            "returncode": completed.returncode,
            "elapsed_seconds": elapsed,
            "stderr": completed.stderr,
            "stdout_sha256": hashlib.sha256(stdout.encode()).hexdigest(),
            "basis": basis,
            "basis_is_unit": basis.strip() == "1",
            "lift_replays_unit": sp.expand(replay - 1) == 0,
            "lift_total_char_count": len(lift),
            "lift_max_coefficient_char_count": max(map(len, coefficients), default=0),
            "lift_nonzero_coefficient_count": sum(
                not coefficient.endswith("=0") for coefficient in coefficients
            ),
        }
        if args.include_lift:
            singular["lift_coefficients"] = coefficients
    except subprocess.TimeoutExpired as error:
        singular = {
            "status": "TIMEOUT",
            "elapsed_seconds": time.monotonic() - started,
            "partial_stdout_char_count": len(error.stdout or b""),
            "partial_stderr_char_count": len(error.stderr or b""),
        }

    result = {
        "schema": "p97-atail-shard-equality-certificate-profile-v1",
        "scope": {
            "trusted_singular_computation": True,
            "certificate_replayed": False,
            "lean_theorem_proved": False,
            "target_faithful": False,
            "fixed_placement_only": True,
        },
        "shard_index": args.shard_index,
        "normalization_anchors": [args.anchor_left, args.anchor_right],
        "active_points": active_points,
        "relabeling": {str(key): value for key, value in relabeling.items()},
        "equality_count": len(polynomials),
        "variables": list(variables),
        "polynomials_sha256": hashlib.sha256(
            json.dumps(polynomials, separators=(",", ":")).encode()
        ).hexdigest(),
        "monomial_order": args.order,
        "singular": singular,
    }
    if args.include_lift:
        result["polynomials"] = list(polynomials)
    rendered = json.dumps(result, indent=2, sort_keys=True)
    if args.output is None:
        print(rendered)
    else:
        temporary = args.output.with_suffix(args.output.suffix + ".tmp")
        temporary.write_text(rendered + "\n")
        temporary.replace(args.output)
        print(f"wrote {args.output}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
