#!/usr/bin/env python3
"""Exact-algebra probe for the saved card-12 critical-row skeleton.

The QF_NRA query in ``fixed_shadow_query.py`` is already solver-hard when it
contains only the similarity gauge and the twelve four-point row equalities.
This driver removes the auxiliary radius variables (three distance-difference
equations per row) and asks Singular whether selected row subsets generate the
unit ideal.  ``UNIT`` is a sound complex-algebraic obstruction, hence also a
real obstruction.  ``NONUNIT`` is only a statement about the equality ideal;
it is not a real or nondegenerate realization witness.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
SHADOWS = HERE.parent / "global_count_boundary" / "shadows.json"
EXPECTED_SHADOW_SHA256 = (
    "e771d39cd7291aaf8e6adb7a7853495623e54439b2205d5fcdac4a085161064c"
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_rows(profile: tuple[int, int, int]) -> dict[int, tuple[int, ...]]:
    require(sha256(SHADOWS) == EXPECTED_SHADOW_SHA256, "shadow source drift")
    document = json.loads(SHADOWS.read_text(encoding="utf-8"))
    matches = [
        item for item in document["cases"]
        if tuple(item["profile"]) == profile
    ]
    require(len(matches) == 1, "profile does not select exactly one shadow")
    case = matches[0]
    rows = {int(center): tuple(map(int, support))
            for center, support in case["rows"].items()}
    require(set(rows) == set(range(12)), "row map is not total")
    require(all(len(set(row)) == 4 for row in rows.values()), "malformed row")
    return rows


def point(label: int) -> tuple[sp.Symbol, sp.Symbol]:
    return sp.symbols(f"x_{label} y_{label}")


def d2(left: int, right: int) -> sp.Expr:
    lx, ly = point(left)
    rx, ry = point(right)
    return sp.expand((lx - rx) ** 2 + (ly - ry) ** 2)


GAUGE = {
    point(4)[0]: sp.Integer(0),
    point(4)[1]: sp.Integer(0),
    point(0)[0]: sp.Integer(1),
    point(0)[1]: sp.Integer(0),
}


def row_equations(rows: dict[int, tuple[int, ...]], centers: tuple[int, ...]) -> list[sp.Expr]:
    equations: list[sp.Expr] = []
    for center in centers:
        reference, *others = rows[center]
        equations.extend(
            sp.expand((d2(center, member) - d2(center, reference)).subs(GAUGE))
            for member in others
        )
    return equations


def row_equation_labels(
    rows: dict[int, tuple[int, ...]], centers: tuple[int, ...]
) -> list[dict[str, int]]:
    labels: list[dict[str, int]] = []
    for center in centers:
        reference, *others = rows[center]
        labels.extend(
            {"center": center, "reference": reference, "member": member}
            for member in others
        )
    return labels


def singular_polynomial(expression: sp.Expr) -> str:
    return sp.sstr(sp.expand(expression)).replace("**", "^").replace(" ", "")


def run_singular(
    equations: list[sp.Expr], *, characteristic: int, timeout_seconds: float,
    scan_pairs: tuple[tuple[int, int], ...] = (),
    lift_pair: tuple[int, int] | None = None,
    include_lift: bool = False,
) -> dict[str, object]:
    variables = [coordinate for label in range(12) for coordinate in point(label)
                 if coordinate not in GAUGE]
    require(equations, "empty equation list")
    ideal = ",\n  ".join(singular_polynomial(eq) for eq in equations)
    scan_lines = ""
    for left, right in scan_pairs:
        distance = singular_polynomial(sp.expand(d2(left, right).subs(GAUGE)))
        scan_lines += (
            f'if (reduce({distance},G)==0) '
            f'{{ print("FORCED_ZERO_{left}_{right}"); }}\n'
        )
    lift_lines = ""
    lift_target: sp.Expr | None = None
    if lift_pair is not None:
        left, right = lift_pair
        lift_target = sp.expand(d2(left, right).subs(GAUGE))
        lift_lines = (
            f"ideal T={singular_polynomial(lift_target)};\n"
            "matrix L=lift(I,T);\n"
            + "".join(
                f'print("LIFT_{index}="+string(L[{index},1]));\n'
                for index in range(1, len(equations) + 1)
            )
            + "poly LIFT_CHECK=0;\n"
            + "".join(
                f"LIFT_CHECK=LIFT_CHECK+L[{index},1]*I[{index}];\n"
                for index in range(1, len(equations) + 1)
            )
            + 'print("LIFT_CHECK="+string(LIFT_CHECK));\n'
        )
    script = (
        f"ring R={characteristic},({','.join(map(str, variables))}),dp;\n"
        f"ideal I =\n  {ideal};\n"
        "ideal G = std(I);\n"
        'if (size(G)==1 and G[1]==1) { print("UNIT"); } '
        'else { print("NONUNIT"); print(dim(G)); print(size(G)); }\n'
        f"{scan_lines}"
        f"{lift_lines}"
        "quit;\n"
    )
    try:
        completed = subprocess.run(
            ["Singular", "-q"], input=script, text=True,
            capture_output=True, timeout=timeout_seconds, check=False,
        )
    except subprocess.TimeoutExpired:
        return {
            "status": "TIMEOUT",
            "characteristic": characteristic,
            "timeout_seconds": timeout_seconds,
        }
    lines = [line.strip() for line in completed.stdout.splitlines() if line.strip()]
    first = lines[0] if lines else ""
    result: dict[str, object] = {
        "status": first if first in {"UNIT", "NONUNIT"} else "ERROR",
        "characteristic": characteristic,
        "timeout_seconds": timeout_seconds,
        "returncode": completed.returncode,
        "stdout": completed.stdout,
        "stderr": completed.stderr,
        "dimension": int(lines[1]) if first == "NONUNIT" and len(lines) > 1 else None,
        "basis_size": int(lines[2]) if first == "NONUNIT" and len(lines) > 2 else None,
        "ideal_forced_zero_pairs": [
            [int(part) for part in line.removeprefix("FORCED_ZERO_").split("_")]
            for line in lines if line.startswith("FORCED_ZERO_")
        ],
    }
    if lift_target is not None:
        coefficient_text = [
            line.split("=", 1)[1] for line in lines if line.startswith("LIFT_")
            and not line.startswith("LIFT_CHECK=")
        ]
        check_lines = [line.split("=", 1)[1]
                       for line in lines if line.startswith("LIFT_CHECK=")]
        locals_map = {str(variable): variable for variable in variables}
        coefficients = [
            sp.sympify(value.replace("^", "**"), locals=locals_map)
            for value in coefficient_text
        ]
        replay = sum(
            (coefficient * equation for coefficient, equation in
             zip(coefficients, equations, strict=True)), sp.S.Zero,
        )
        result["lift"] = {
            "pair": list(lift_pair),
            "coefficient_count": len(coefficients),
            "nonzero_coefficient_count": sum(value != 0 for value in coefficients),
            "total_coefficient_char_count": sum(map(len, coefficient_text)),
            "max_coefficient_char_count": max(map(len, coefficient_text), default=0),
            "singular_check": check_lines,
            "exact_sympy_replay": sp.expand(replay - lift_target) == 0,
            "certificate_sha256": hashlib.sha256(
                "\n".join(coefficient_text).encode()
            ).hexdigest(),
        }
        if include_lift:
            result["lift"]["coefficients"] = coefficient_text
            result["lift"]["generators"] = [singular_polynomial(eq) for eq in equations]
            result["lift"]["target"] = singular_polynomial(lift_target)
    if lift_pair is not None and not include_lift:
        result.pop("stdout", None)
    return result


def smoke_gate(timeout_seconds: float) -> dict[str, object]:
    x = sp.Symbol("x_1")
    unit = run_singular([x, x - 1], characteristic=0, timeout_seconds=timeout_seconds)
    nonunit = run_singular([x**2 - 1], characteristic=0, timeout_seconds=timeout_seconds)
    return {
        "passed": unit["status"] == "UNIT" and nonunit["status"] == "NONUNIT",
        "unit_probe": unit["status"],
        "nonunit_probe": nonunit["status"],
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--centers", default=",".join(map(str, range(12))),
        help="comma-separated row centers",
    )
    parser.add_argument(
        "--profile", default="5,5,5",
        help="saved cap profile (5,5,5 or 4,5,6)",
    )
    parser.add_argument("--characteristic", type=int, default=0)
    parser.add_argument("--timeout-seconds", type=float, default=20.0)
    parser.add_argument(
        "--equation-indices",
        help="comma-separated indices into the canonical three-equations-per-row list",
    )
    parser.add_argument("--scan-collisions", action="store_true")
    parser.add_argument(
        "--scan-pair", action="append", default=[],
        help="additional pair left,right whose squared distance is reduced modulo the row ideal",
    )
    parser.add_argument("--lift-pair", help="extract a Singular lift for left,right")
    parser.add_argument("--include-lift", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    require(0 < args.timeout_seconds <= 30.0, "timeout must be in (0, 30]")
    profile = tuple(int(item) for item in args.profile.split(",") if item)
    require(profile in {(5, 5, 5), (4, 5, 6)}, "unsupported profile")
    centers = tuple(int(item) for item in args.centers.split(",") if item)
    require(len(set(centers)) == len(centers), "duplicate center")
    require(set(centers) <= set(range(12)), "center out of range")
    scan_pairs = {
        tuple(sorted(map(int, item.split(",")))) for item in args.scan_pair
    }
    if args.scan_collisions:
        scan_pairs.update(
            (left, right) for left in range(12) for right in range(left + 1, 12)
        )
    require(all(len(pair) == 2 and pair[0] != pair[1] and
                0 <= pair[0] < pair[1] < 12 for pair in scan_pairs),
            "invalid scan pair")
    lift_pair = None
    if args.lift_pair:
        lift_pair = tuple(sorted(map(int, args.lift_pair.split(","))))
        require(len(lift_pair) == 2 and lift_pair[0] != lift_pair[1] and
                0 <= lift_pair[0] < lift_pair[1] < 12, "invalid lift pair")
    rows = load_rows(profile)
    all_equations = row_equations(rows, centers)
    all_labels = row_equation_labels(rows, centers)
    require(len(all_equations) == 3 * len(centers), "equation-count drift")
    equation_indices = tuple(range(len(all_equations)))
    if args.equation_indices:
        equation_indices = tuple(
            int(item) for item in args.equation_indices.split(",") if item
        )
        require(len(set(equation_indices)) == len(equation_indices),
                "duplicate equation index")
        require(all(0 <= index < len(all_equations) for index in equation_indices),
                "equation index out of range")
    equations = [all_equations[index] for index in equation_indices]
    equation_labels = [
        {"index": index, **all_labels[index]} for index in equation_indices
    ]
    result = {
        "shadow_sha256": sha256(SHADOWS),
        "profile": list(profile),
        "centers": list(centers),
        "equation_count": len(equations),
        "equations": equation_labels,
        "free_coordinate_count": 20,
        "gauge": {"point_4": [0, 0], "point_0": [1, 0]},
        "evidence_scope": (
            "exact equality-ideal computation; UNIT obstructs even complex "
            "realization, NONUNIT does not establish real feasibility"
        ),
        "singular": run_singular(
            equations,
            characteristic=args.characteristic,
            timeout_seconds=args.timeout_seconds,
            scan_pairs=tuple(sorted(scan_pairs)),
            lift_pair=lift_pair,
            include_lift=args.include_lift,
        ),
    }
    if args.check:
        result["smoke_gate"] = smoke_gate(min(args.timeout_seconds, 5.0))
        require(result["smoke_gate"]["passed"], "Singular smoke gate failed")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
