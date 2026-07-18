#!/usr/bin/env python3
"""Exact equality-ideal gate for the source-faithful exact-six mutual fixture.

This probes only the fourteen displayed complete radius rows from
``exact6-mutual-repeated-outside-pair``.  ``UNIT`` is a sound obstruction to
even a complex coordinate realization of that literal fixture.  ``NONUNIT``
does not establish a real, convex, or MEC realization and cannot close the
uniform Lean branch.
"""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
import tempfile
import time
from pathlib import Path

import sympy as sp


ROWS = (
    (1, 2, 5, 7),
    (2, 3, 6, 8),
    (3, 4, 7, 9),
    (4, 5, 8, 10),
    (5, 6, 9, 11),
    (6, 7, 10, 12),
    (7, 8, 11, 13),
    (0, 8, 9, 12),
    (1, 9, 10, 13),
    (0, 2, 10, 11),
    (1, 3, 11, 12),
    (2, 4, 12, 13),
    (0, 3, 5, 13),
    (0, 1, 4, 6),
)

# Greedy reverse-deletion core discovered from the 42 displayed equalities.
# The indices refer to the center-major ordering produced by ``row_equations``.
CORE15_INDICES = (0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 13, 21, 22, 24, 27)


def point(label: int) -> tuple[sp.Symbol, sp.Symbol]:
    return sp.symbols(f"x_{label} y_{label}")


def d2(left: int, right: int) -> sp.Expr:
    lx, ly = point(left)
    rx, ry = point(right)
    return sp.expand((lx - rx) ** 2 + (ly - ry) ** 2)


GAUGE = {
    point(0)[0]: sp.Integer(0),
    point(0)[1]: sp.Integer(0),
    point(1)[0]: sp.Integer(1),
    point(1)[1]: sp.Integer(0),
}


def free_variables(
    order: str = "forward", equations: list[sp.Expr] | None = None
) -> list[sp.Symbol]:
    variables = [
        coordinate
        for label in range(14)
        for coordinate in point(label)
        if coordinate not in GAUGE
    ]
    if equations is not None:
        active_symbols = set().union(*(equation.free_symbols for equation in equations))
        variables = [variable for variable in variables if variable in active_symbols]
    if order == "reverse":
        variables.reverse()
    elif order != "forward":
        raise ValueError(f"unknown variable order: {order}")
    return variables


def singular_polynomial(expression: sp.Expr) -> str:
    return sp.sstr(sp.expand(expression)).replace("**", "^").replace(" ", "")


def row_equations(centers: tuple[int, ...]) -> tuple[list[sp.Expr], list[dict[str, int]]]:
    equations: list[sp.Expr] = []
    labels: list[dict[str, int]] = []
    for center in centers:
        reference, *others = ROWS[center]
        for member in others:
            equations.append(
                sp.expand((d2(center, member) - d2(center, reference)).subs(GAUGE))
            )
            labels.append(
                {
                    "equation_index": len(equations) - 1,
                    "center": center,
                    "reference": reference,
                    "member": member,
                }
            )
    return equations, labels


def run_singular(
    equations: list[sp.Expr],
    timeout_seconds: float,
    characteristic: int,
    variable_order: str = "forward",
    active_ring: bool = False,
) -> dict[str, object]:
    variables = free_variables(
        variable_order, equations if active_ring else None
    )
    ideal = ",\n  ".join(singular_polynomial(eq) for eq in equations)
    script = (
        f"ring R={characteristic},({','.join(map(str, variables))}),dp;\n"
        f"ideal I=\n  {ideal};\n"
        "ideal G=std(I);\n"
        'if (size(G)==1 and G[1]==1) { print("UNIT"); } '
        'else { print("NONUNIT"); print(dim(G)); print(size(G)); }\n'
        "quit;\n"
    )
    started = time.monotonic()
    try:
        completed = subprocess.run(
            ["Singular", "-q"],
            input=script,
            text=True,
            capture_output=True,
            timeout=timeout_seconds,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {
            "status": "TIMEOUT",
            "timeout_seconds": timeout_seconds,
            "elapsed_seconds": round(time.monotonic() - started, 6),
            "variable_order": variable_order,
        }
    lines = [line.strip() for line in completed.stdout.splitlines() if line.strip()]
    status = (
        lines[0]
        if completed.returncode == 0
        and lines
        and lines[0] in {"UNIT", "NONUNIT"}
        else "ERROR"
    )
    return {
        "status": status,
        "returncode": completed.returncode,
        "dimension": int(lines[1]) if status == "NONUNIT" and len(lines) > 1 else None,
        "basis_size": int(lines[2]) if status == "NONUNIT" and len(lines) > 2 else None,
        "stderr": completed.stderr,
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "variable_order": variable_order,
    }


def run_msolve(
    equations: list[sp.Expr],
    timeout_seconds: float,
    threads: int,
    variable_order: str = "forward",
    active_ring: bool = False,
) -> dict[str, object]:
    variables = free_variables(
        variable_order, equations if active_ring else None
    )
    payload = (
        ",".join(map(str, variables))
        + "\n0\n"
        + ",\n".join(singular_polynomial(eq) for eq in equations)
        + "\n"
    )
    started = time.monotonic()
    try:
        with tempfile.TemporaryDirectory(prefix="p97-exact6-mutual-msolve-") as temp:
            input_path = Path(temp) / "system.ms"
            output_path = Path(temp) / "output.txt"
            input_path.write_text(payload, encoding="utf-8")
            completed = subprocess.run(
                [
                    "msolve", "-f", str(input_path), "-o", str(output_path),
                    "-t", str(threads),
                ],
                capture_output=True,
                text=True,
                timeout=timeout_seconds,
                check=False,
            )
            output = output_path.read_text(encoding="utf-8") if output_path.exists() else ""
    except subprocess.TimeoutExpired:
        return {
            "status": "TIMEOUT",
            "timeout_seconds": timeout_seconds,
            "elapsed_seconds": round(time.monotonic() - started, 6),
            "variable_order": variable_order,
        }
    except OSError as error:
        return {"status": "ERROR", "detail": f"{type(error).__name__}: {error}"}
    status = (
        "UNIT"
        if completed.returncode == 0 and output.strip().startswith("[-1]")
        else (
            "NONUNIT"
            if completed.returncode == 0 and output.strip()
            else "ERROR"
        )
    )
    return {
        "status": status,
        "returncode": completed.returncode,
        "stderr": completed.stderr,
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "variable_order": variable_order,
    }


def emit_event(
    event: dict[str, object], *, verbose: bool, log_path: Path | None
) -> None:
    payload = json.dumps(event, sort_keys=True)
    if verbose:
        print(payload, file=sys.stderr, flush=True)
    if log_path is not None:
        with log_path.open("a", encoding="utf-8") as stream:
            stream.write(payload + "\n")


def smoke_gate(timeout_seconds: float, threads: int) -> dict[str, object]:
    """Check solver/parsing behavior on hand-decidable target-shaped systems."""
    x, y = free_variables()[:2]
    unit_equations = [x, y, x + y - 1]
    nonunit_equations = [x - y]
    checks = {
        "msolve_unit_forward": run_msolve(
            unit_equations, timeout_seconds, threads, "forward"
        ),
        "msolve_unit_reverse": run_msolve(
            unit_equations, timeout_seconds, threads, "reverse"
        ),
        "msolve_nonunit_forward": run_msolve(
            nonunit_equations, timeout_seconds, threads, "forward"
        ),
        "msolve_nonunit_reverse": run_msolve(
            nonunit_equations, timeout_seconds, threads, "reverse"
        ),
        "singular_unit": run_singular(unit_equations, timeout_seconds, 0),
        "singular_nonunit": run_singular(nonunit_equations, timeout_seconds, 0),
    }
    expected = {
        "msolve_unit_forward": "UNIT",
        "msolve_unit_reverse": "UNIT",
        "msolve_nonunit_forward": "NONUNIT",
        "msolve_nonunit_reverse": "NONUNIT",
        "singular_unit": "UNIT",
        "singular_nonunit": "NONUNIT",
    }
    return {
        "status": (
            "PASS"
            if all(checks[name]["status"] == status for name, status in expected.items())
            else "FAIL"
        ),
        "expected": expected,
        "checks": checks,
    }


def mutation_gate(
    equations: list[sp.Expr],
    labels: list[dict[str, int]],
    timeout_seconds: float,
    threads: int,
    active_ring: bool = False,
) -> dict[str, object]:
    checks: list[dict[str, object]] = []
    for removed_index in range(len(equations)):
        trial = [
            equation
            for index, equation in enumerate(equations)
            if index != removed_index
        ]
        checks.append(
            {
                "removed_equation": labels[removed_index],
                "msolve_forward": run_msolve(
                    trial, timeout_seconds, threads, "forward", active_ring
                ),
                "msolve_reverse": run_msolve(
                    trial, timeout_seconds, threads, "reverse", active_ring
                ),
            }
        )
    statuses = [
        check[order]["status"]
        for check in checks
        for order in ("msolve_forward", "msolve_reverse")
    ]
    return {
        "status": (
            "FAIL"
            if "UNIT" in statuses
            else (
                "PASS"
                if all(status == "NONUNIT" for status in statuses)
                else "INDETERMINATE"
            )
        ),
        "checks": checks,
    }
def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--centers", default=",".join(map(str, range(14))),
        help="comma-separated displayed row centers",
    )
    parser.add_argument(
        "--equation-indices",
        help="optional comma-separated indices in the full 42-equation display",
    )
    parser.add_argument(
        "--core15", action="store_true", help="select the banked 15-equation core"
    )
    parser.add_argument("--timeout-seconds", type=float, default=60.0)
    parser.add_argument("--characteristic", type=int, default=0)
    parser.add_argument("--summary", action="store_true")
    parser.add_argument("--compact", action="store_true")
    parser.add_argument("--engine", choices=("singular", "msolve"), default="singular")
    parser.add_argument("--threads", type=int, default=1)
    parser.add_argument("--minimize", action="store_true")
    parser.add_argument(
        "--variable-order", choices=("forward", "reverse"), default="forward"
    )
    parser.add_argument(
        "--minimize-order", choices=("forward", "reverse"), default="reverse"
    )
    parser.add_argument(
        "--trial-timeout-seconds", type=float, default=5.0,
        help="fail-closed timeout for each deletion/mutation trial",
    )
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--mutation-check", action="store_true")
    parser.add_argument(
        "--active-ring",
        action="store_true",
        help="drop unused coordinate variables (default keeps the 24-variable ambient ring)",
    )
    parser.add_argument("--verbose", action="store_true")
    parser.add_argument("--log-path", type=Path)
    parser.add_argument("--output-path", type=Path)
    args = parser.parse_args()
    centers = tuple(int(item) for item in args.centers.split(",") if item)
    if len(set(centers)) != len(centers) or not set(centers) <= set(range(14)):
        raise SystemExit("invalid centers")
    equations, labels = row_equations(centers)
    if args.core15 and args.equation_indices is not None:
        raise SystemExit("choose at most one of --core15 and --equation-indices")
    requested_argument = (
        ",".join(map(str, CORE15_INDICES))
        if args.core15
        else args.equation_indices
    )
    if requested_argument is not None:
        requested_indices = tuple(
            int(item) for item in requested_argument.split(",") if item
        )
        by_index = {
            label["equation_index"]: (equation, label)
            for equation, label in zip(equations, labels, strict=True)
        }
        if len(set(requested_indices)) != len(requested_indices) or not set(
            requested_indices
        ) <= set(by_index):
            raise SystemExit("invalid equation indices for selected centers")
        equations = [by_index[index][0] for index in requested_indices]
        labels = [by_index[index][1] for index in requested_indices]
    if args.log_path is not None:
        args.log_path.parent.mkdir(parents=True, exist_ok=True)
    minimized: dict[str, object] | None = None
    if args.minimize:
        if args.engine != "msolve":
            raise SystemExit("--minimize currently requires --engine msolve")
        active = list(range(len(equations)))
        removed_centers: list[int] = []
        center_order = list(centers)
        if args.minimize_order == "reverse":
            center_order.reverse()
        for center in center_order:
            trial = [
                index for index in active if labels[index]["center"] != center
            ]
            oracle = run_msolve(
                [equations[index] for index in trial],
                args.trial_timeout_seconds,
                args.threads,
                args.variable_order,
                args.active_ring,
            )
            emit_event(
                {
                    "event": "row_deletion_trial",
                    "center": center,
                    "equation_count": len(trial),
                    "oracle": oracle,
                },
                verbose=args.verbose,
                log_path=args.log_path,
            )
            if oracle["status"] == "UNIT":
                active = trial
                removed_centers.append(center)
        removed_equations: list[int] = []
        equation_order = list(active)
        if args.minimize_order == "reverse":
            equation_order.reverse()
        for index in equation_order:
            trial = [candidate for candidate in active if candidate != index]
            oracle = run_msolve(
                [equations[candidate] for candidate in trial],
                args.trial_timeout_seconds,
                args.threads,
                args.variable_order,
                args.active_ring,
            )
            emit_event(
                {
                    "event": "equation_deletion_trial",
                    "equation_index": index,
                    "equation": labels[index],
                    "equation_count": len(trial),
                    "oracle": oracle,
                },
                verbose=args.verbose,
                log_path=args.log_path,
            )
            if oracle["status"] == "UNIT":
                active = trial
                removed_equations.append(labels[index]["equation_index"])
        minimized_equations = [equations[index] for index in active]
        minimized_mutation = mutation_gate(
            minimized_equations,
            [labels[index] for index in active],
            args.trial_timeout_seconds,
            args.threads,
            args.active_ring,
        )
        minimized = {
            "active_equation_indices": [
                labels[index]["equation_index"] for index in active
            ],
            "active_equations": [labels[index] for index in active],
            "removed_centers": removed_centers,
            "removed_equation_indices": removed_equations,
            "msolve_forward": run_msolve(
                minimized_equations,
                args.timeout_seconds,
                args.threads,
                "forward",
                args.active_ring,
            ),
            "msolve_reverse": run_msolve(
                minimized_equations,
                args.timeout_seconds,
                args.threads,
                "reverse",
                args.active_ring,
            ),
            "singular_qq": run_singular(
                minimized_equations, args.timeout_seconds, 0, "forward", args.active_ring
            ),
            "singular_qq_reverse": run_singular(
                minimized_equations, args.timeout_seconds, 0, "reverse", args.active_ring
            ),
            "singular_mod_32003": run_singular(
                minimized_equations, args.timeout_seconds, 32003, "forward", args.active_ring
            ),
            "mutation_checks": minimized_mutation["checks"],
            "active_free_coordinate_count": len(
                free_variables("forward", minimized_equations)
            ),
            "mutation_gate": minimized_mutation["status"],
        }
    result = {
        "schema": "p97-exact6-mutual-literal-equality-gate-v1",
        "epistemic_status": "EXACT_EQUALITY_IDEAL_NOT_UNIFORM_LEAN_PROOF",
        "centers": centers,
        "equation_count": len(equations),
        "selected_equation_indices": [
            label["equation_index"] for label in labels
        ],
        "free_coordinate_count": 24,
        "oracle_free_coordinate_count": len(
            free_variables(
                args.variable_order, equations if args.active_ring else None
            )
        ),
        "active_ring": args.active_ring,
        "gauge": {"point_0": [0, 0], "point_1": [1, 0]},
        "equations": labels,
        "characteristic": args.characteristic,
        "engine": args.engine,
        "oracle": (
            run_singular(
                equations,
                args.timeout_seconds,
                args.characteristic,
                args.variable_order,
                args.active_ring,
            )
            if args.engine == "singular"
            else run_msolve(
                equations,
                args.timeout_seconds,
                args.threads,
                args.variable_order,
                args.active_ring,
            )
        ),
    }
    if args.smoke:
        result["smoke_gate"] = smoke_gate(args.trial_timeout_seconds, args.threads)
    if args.mutation_check:
        result["mutation_gate"] = mutation_gate(
            equations,
            labels,
            args.trial_timeout_seconds,
            args.threads,
            args.active_ring,
        )
    if minimized is not None:
        result["minimized"] = minimized
    if args.summary:
        result.pop("equations")
    rendered = json.dumps(result, indent=2, sort_keys=True)
    if args.output_path is not None:
        args.output_path.parent.mkdir(parents=True, exist_ok=True)
        args.output_path.write_text(rendered + "\n", encoding="utf-8")
    if args.compact:
        oracle = result["oracle"]
        print(json.dumps({
            "centers": centers,
            "status": oracle["status"],
            "minimized_equation_count": (
                len(minimized["active_equation_indices"])
                if minimized is not None
                else None
            ),
            "mutation_gate": (
                minimized["mutation_gate"]
                if minimized is not None
                else (
                    result["mutation_gate"]["status"]
                    if "mutation_gate" in result
                    else None
                )
            ),
        }, sort_keys=True))
    else:
        print(rendered)


if __name__ == "__main__":
    main()
