#!/usr/bin/env python3
"""Exact Q(i) witness for the six-row `(4,5,6)` round-0 deletion.

This is a bounded certificate prototype for the proper-ideal (`NONUNIT`)
answer.  It does not modify the three-oracle CEGAR policy.  Instead it gives
the Singular arm a positive certificate that can be replayed without a
Groebner-basis computation: an evaluation homomorphism from the normalized
QQ coordinate ring to QQ(i) that kills every generator.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
import time
from pathlib import Path
from typing import Any, Mapping, Sequence

import sympy as sp


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
SOURCE = HERE / "multi-core-bank-456-round0-accepted.json"
EXPECTED_SOURCE_SHA256 = (
    "f8d2417f891515252257b185bd189bf98badf935b281de3a3418c8d1a81f0374"
)
EXPECTED_CHECKPOINT_SHA256 = (
    "e6304b556ec3645c3ca541df0d63313d67f4a4c556f59e420e3ce387737f1e9a"
)
SCHEMA = "p97-atail-456-round0-six-row-nonunit-witness-v1"
TIMEOUT_SECONDS = 5.0

for path in (str(ROOT), str(HERE), str(ORACLE_DIR)):
    if path not in sys.path:
        sys.path.insert(0, path)

import cegar  # noqa: E402


EXPECTED_ROWS = (
    "2:0,1,9,10",
    "7:0,3,6,11",
    "8:0,3,7,9",
    "9:0,4,8,10",
    "10:1,6,7,8",
    "11:2,3,8,9",
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_rows() -> tuple[Any, ...]:
    if sha256(SOURCE) != EXPECTED_SOURCE_SHA256:
        raise AssertionError("multi-core source artifact hash drift")
    artifact = json.loads(SOURCE.read_text(encoding="utf-8"))
    if artifact["source"]["checkpoint_sha256"] != EXPECTED_CHECKPOINT_SHA256:
        raise AssertionError("source checkpoint hash drift")
    unknown = tuple(str(row) for row in artifact["result"]["unknown_subset"])
    if unknown != EXPECTED_ROWS:
        raise AssertionError("saved unknown six-row subset drift")
    return tuple(cegar.decode_metric_row(row) for row in unknown)


def witness_points() -> dict[int, tuple[sp.Expr, sp.Expr]]:
    """The normalized QQ(i) point; omitted label 5 is fixed to the origin."""

    origin = (sp.Integer(0), sp.Integer(0))
    isotropic_midpoint = (sp.Rational(1, 2), -sp.I / 2)
    return {
        0: origin,
        1: (sp.Integer(1), sp.Integer(0)),
        2: isotropic_midpoint,
        3: origin,
        4: origin,
        5: origin,
        6: origin,
        7: origin,
        8: origin,
        9: isotropic_midpoint,
        10: isotropic_midpoint,
        11: origin,
    }


def substitutions(
    points: Mapping[int, tuple[sp.Expr, sp.Expr]],
) -> dict[sp.Symbol, sp.Expr]:
    values: dict[sp.Symbol, sp.Expr] = {}
    for label in range(2, 12):
        x, y = points[label]
        values[sp.Symbol(f"x{label}x")] = x
        values[sp.Symbol(f"x{label}y")] = y
    return values


def sympy_replay(
    rows: Sequence[Any], points: Mapping[int, tuple[sp.Expr, sp.Expr]]
) -> tuple[bool, list[str]]:
    values = substitutions(points)
    failures = []
    for index, polynomial in enumerate(
        cegar.metric_oracle.system_polynomials(12, rows)
    ):
        residual = sp.expand(polynomial.as_expr().subs(values))
        if residual != 0:
            failures.append(f"generator {index}: {residual}")
    return not failures, failures


def _singular_value(value: sp.Expr) -> str:
    value = sp.expand(value)
    real, imag = value.as_real_imag()
    if not (real.is_Rational and imag.is_Rational):
        raise ValueError(f"unsupported QQ(i) certificate value {value}")

    def rational_literal(number: sp.Rational) -> str:
        numerator, denominator = number.as_numer_denom()
        return str(numerator) if denominator == 1 else f"({numerator}/{denominator})"

    terms = []
    if real != 0:
        terms.append(rational_literal(real))
    if imag != 0:
        terms.append(f"({rational_literal(imag)})*i")
    return "+".join(terms) if terms else "0"


def singular_witness_script(
    rows: Sequence[Any], points: Mapping[int, tuple[sp.Expr, sp.Expr]]
) -> str:
    oracle = cegar.metric_oracle
    variables = tuple(str(value) for value in oracle.variable_symbols(12))
    polynomials = oracle.serialized_system(12, rows)
    values = substitutions(points)
    images = [_singular_value(values[sp.Symbol(variable)]) for variable in variables]
    return "\n".join(
        (
            f"ring source = 0, ({','.join(variables)}), dp;",
            "ideal I = " + ",\n  ".join(polynomials) + ";",
            "ring target = (0,i), (z), dp;",
            "minpoly=i2+1;",
            "map phi=source," + ",".join(images) + ";",
            "ideal J=phi(I);",
            "int allzero=1;",
            "int k;",
            "for(k=1;k<=size(J);k++){if(J[k]!=0){allzero=0;}}",
            'print("P97_WITNESS_BEGIN");',
            'if (allzero==1) { print("ALL_ZERO"); }',
            'else { print("NONZERO"); J; }',
            'print("P97_WITNESS_END");',
            "quit;",
            "",
        )
    )


def singular_replay(
    rows: Sequence[Any],
    points: Mapping[int, tuple[sp.Expr, sp.Expr]],
    *,
    timeout_seconds: float = TIMEOUT_SECONDS,
) -> dict[str, Any]:
    started = time.monotonic()
    try:
        process = subprocess.run(
            ("Singular", "-q"),
            input=singular_witness_script(rows, points),
            capture_output=True,
            text=True,
            timeout=timeout_seconds,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {"verdict": "TIMEOUT", "elapsed_seconds": time.monotonic() - started}
    elapsed = time.monotonic() - started
    if process.returncode != 0:
        return {
            "verdict": "ERROR",
            "elapsed_seconds": elapsed,
            "detail": process.stderr.strip() or process.stdout.strip(),
        }
    lines = [line.strip() for line in process.stdout.splitlines()]
    try:
        begin = lines.index("P97_WITNESS_BEGIN")
        end = lines.index("P97_WITNESS_END")
    except ValueError:
        return {
            "verdict": "ERROR",
            "elapsed_seconds": elapsed,
            "detail": "missing Singular witness markers",
        }
    payload = [line for line in lines[begin + 1 : end] if line]
    verdict = "NONUNIT_WITNESS_VERIFIED" if payload == ["ALL_ZERO"] else "REJECTED"
    return {"verdict": verdict, "elapsed_seconds": elapsed, "payload": payload}


def msolve_crosscheck(rows: Sequence[Any]) -> dict[str, str]:
    oracle = cegar.metric_oracle
    variables = tuple(str(value) for value in oracle.variable_symbols(12))
    polynomials = oracle.serialized_system(12, rows)
    forward = oracle.run_msolve(variables, polynomials, timeout_s=TIMEOUT_SECONDS)
    reverse = oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=TIMEOUT_SECONDS
    )
    return {"forward": forward.verdict, "reverse": reverse.verdict}


def build_report() -> dict[str, Any]:
    rows = source_rows()
    points = witness_points()
    sympy_ok, sympy_failures = sympy_replay(rows, points)
    if not sympy_ok:
        raise AssertionError(sympy_failures)
    singular = singular_replay(rows, points)
    if singular["verdict"] != "NONUNIT_WITNESS_VERIFIED":
        raise AssertionError(f"Singular rejected the exact witness: {singular}")

    mutation = dict(points)
    mutation[2] = (sp.Rational(2, 3), -sp.I / 2)
    mutation_sympy_ok, mutation_failures = sympy_replay(rows, mutation)
    if mutation_sympy_ok or not mutation_failures:
        raise AssertionError("mutated witness was not rejected by SymPy")
    mutation_singular = singular_replay(rows, mutation)
    if mutation_singular["verdict"] != "REJECTED":
        raise AssertionError("mutated witness was not rejected by Singular")

    msolve = msolve_crosscheck(rows)
    if set(msolve.values()) != {"NONUNIT"}:
        raise AssertionError(f"msolve order crosscheck drift: {msolve}")
    return {
        "schema": SCHEMA,
        "source": {
            "artifact": str(SOURCE.relative_to(ROOT)),
            "artifact_sha256": EXPECTED_SOURCE_SHA256,
            "checkpoint_sha256": EXPECTED_CHECKPOINT_SHA256,
            "rows": list(EXPECTED_ROWS),
            "equality_count": len(cegar.metric_oracle.serialized_system(12, rows)),
        },
        "certificate": {
            "field": "QQ(i), i^2+1=0",
            "coordinate_gauge": {"point_0": ["0", "0"], "point_1": ["1", "0"]},
            "points": {
                str(label): [str(sp.expand(x)), str(sp.expand(y))]
                for label, (x, y) in sorted(points.items())
            },
        },
        "verification": {
            "sympy_exact_substitution": "ALL_18_GENERATORS_ZERO",
            "singular_QQi_map": singular,
            "msolve_QQ_variable_orders": msolve,
            "mutation_rejected_by_sympy": True,
            "mutation_rejected_by_singular": True,
        },
        "verdict": "EXPLICIT_QQI_POINT_PROVES_QQ_IDEAL_NONUNIT",
        "scope": {
            "exact_proper_ideal_certificate": True,
            "real_witness": False,
            "distinct_point_witness": False,
            "target_faithful": False,
            "lean_producer": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    report = build_report()
    if args.check:
        print(
            json.dumps(
                {
                    "verdict": report["verdict"],
                    "singular": report["verification"]["singular_QQi_map"],
                    "msolve": report["verification"]["msolve_QQ_variable_orders"],
                },
                indent=2,
                sort_keys=True,
            )
        )
    else:
        print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
