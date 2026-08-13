"""One source-audited exact-17 metric probe for the common-radius W4 arm.

This is deliberately a frozen finite diagnostic.  It does not encode arbitrary
K4 witness rows and it does not claim a finite-to-universal lift.
"""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import time
from collections.abc import Iterable
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

import z3

N = 17
ROLES = {
    "apex0": 3,
    "apex1": 16,
    "apex2": 14,
    "c_first": 0,
    "c_second": 1,
    "q_source": 2,
    "q_other": 3,
    "p1": 6,
    "p2": 7,
    "rho1": 5,
    "rho2": 4,
}
RANK = [1, 6, 9, 12, 2, 3, 4, 5, 8, 13, 14, 15, 16, 10, 0, 11, 7]
CAPS = [
    {0, 1, 4, 5, 6, 7, 14, 16},
    {3, 9, 10, 11, 12, 14},
    {2, 3, 8, 13, 15, 16},
]
STRICT_CAP0 = {0, 1, 4, 5, 6, 7}
W4 = {4, 5, 6, 7}
ROWS = {
    7: {0, 1, 2, 3},
    8: {2, 3, 6, 7},
    9: {4, 5, 10, 12},
}
STAGES = (
    "geometry_core",
    "cap_classification",
    "canonical_three_radii",
    "selected_row_equalities",
    "blocker_exactness",
)


@dataclass(frozen=True)
class Clause:
    name: str
    formula: z3.BoolRef
    source: str


def area(
    x: list[z3.ArithRef], y: list[z3.ArithRef], a: int, b: int, c: int
) -> z3.ArithRef:
    return (x[b] - x[a]) * (y[c] - y[a]) - (y[b] - y[a]) * (x[c] - x[a])


def d2(x: list[z3.ArithRef], y: list[z3.ArithRef], a: int, b: int) -> z3.ArithRef:
    dx = x[a] - x[b]
    dy = y[a] - y[b]
    return dx * dx + dy * dy


class Encoding:
    def __init__(self) -> None:
        self.x = [z3.Real(f"x_{i}") for i in range(N)]
        self.y = [z3.Real(f"y_{i}") for i in range(N)]
        self.common_r = z3.Real("common_r")
        self.p_r = z3.Real("p_r")
        self.rho_r = z3.Real("rho_r")
        self.row_r = {center: z3.Real(f"row_r_{center}") for center in ROWS}
        self.groups: dict[str, list[Clause]] = {stage: [] for stage in STAGES}
        self._build()

    def add(self, stage: str, name: str, formula: z3.BoolRef, source: str) -> None:
        self.groups[stage].append(Clause(name, formula, source))

    def _build(self) -> None:
        x, y = self.x, self.y
        a0, a1, a2 = ROLES["apex0"], ROLES["apex1"], ROLES["apex2"]
        boundary = sorted(range(N), key=RANK.__getitem__)

        self.add("geometry_core", "gauge_apex2_x", x[a2] == 1, "similarity gauge")
        self.add("geometry_core", "gauge_apex2_y", y[a2] == 0, "similarity gauge")
        for apex in (a0, a1, a2):
            apex_x = x[apex]
            apex_y = y[apex]
            self.add(
                "geometry_core",
                f"mec_apex_{apex}",
                apex_x * apex_x + apex_y * apex_y == 1,
                "CircumscribedMECPacket Moser apex",
            )
        for point in range(N):
            point_x = x[point]
            point_y = y[point]
            self.add(
                "geometry_core",
                f"mec_contains_{point}",
                point_x * point_x + point_y * point_y <= 1,
                "minimum enclosing disk containment",
            )
        for apex, left, right in ((a0, a1, a2), (a1, a2, a0), (a2, a0, a1)):
            dot = (x[left] - x[apex]) * (x[right] - x[apex]) + (y[left] - y[apex]) * (
                y[right] - y[apex]
            )
            self.add(
                "geometry_core",
                f"nonobtuse_at_{apex}",
                dot >= 0,
                "triangleNonObtuse",
            )
        for i, j, k in combinations(range(N), 3):
            p, q, r = boundary[i], boundary[j], boundary[k]
            self.add(
                "geometry_core",
                f"boundary_ccw_{i}_{j}_{k}",
                area(x, y, p, q, r) < 0,
                "BoundaryIndexing.boundary_ccw",
            )

        cap_triples = ((a0, a1, a2), (a1, a2, a0), (a2, a0, a1))
        for cap_index, (opposite, left, right) in enumerate(cap_triples):
            for point in range(N):
                product = area(x, y, point, left, right) * area(
                    x, y, opposite, left, right
                )
                on_arc_opposite = product <= 0
                self.add(
                    "cap_classification",
                    f"cap_{cap_index}_{point}",
                    on_arc_opposite
                    if point in CAPS[cap_index]
                    else z3.Not(on_arc_opposite),
                    "exact frozen OnArcOpposite cap membership",
                )

        radius_classes = (
            ("common", self.common_r, {0, 1}),
            ("p", self.p_r, {6, 7}),
            ("rho", self.rho_r, {4, 5}),
        )
        for name, radius, members in radius_classes:
            self.add(
                "canonical_three_radii",
                f"{name}_radius_positive",
                radius > 0,
                "positive selected-class radius",
            )
            for point in sorted(members):
                self.add(
                    "canonical_three_radii",
                    f"{name}_radius_member_{point}",
                    d2(x, y, a0, point) == radius,
                    "apex0 selected-class membership",
                )
            for point in sorted(STRICT_CAP0 - members):
                self.add(
                    "canonical_three_radii",
                    f"{name}_radius_strict_cap_nonmember_{point}",
                    d2(x, y, a0, point) != radius,
                    "exact strict-cap radial slice in this frozen case",
                )
        self.add(
            "canonical_three_radii",
            "common_ne_p",
            self.common_r != self.p_r,
            "commonRadius_ne_radius",
        )
        self.add(
            "canonical_three_radii",
            "common_ne_rho",
            self.common_r != self.rho_r,
            "commonRadius_ne_rho",
        )
        self.add(
            "canonical_three_radii",
            "p_ne_rho",
            self.p_r != self.rho_r,
            "retained radii distinct",
        )

        for center, support in ROWS.items():
            radius = self.row_r[center]
            self.add(
                "selected_row_equalities",
                f"row_{center}_positive",
                radius > 0,
                "CriticalFourShell positive radius",
            )
            for point in sorted(support):
                self.add(
                    "selected_row_equalities",
                    f"row_{center}_member_{point}",
                    d2(x, y, center, point) == radius,
                    "named selected-support membership",
                )

        for center, support in ROWS.items():
            radius = self.row_r[center]
            for point in sorted(set(range(N)) - support):
                self.add(
                    "blocker_exactness",
                    f"row_{center}_nonmember_{point}",
                    d2(x, y, center, point) != radius,
                    "unique-four exactness at named blocker-image center",
                )

    def clauses_through(self, stage: str) -> list[Clause]:
        last = STAGES.index(stage)
        return [clause for name in STAGES[: last + 1] for clause in self.groups[name]]

    def variables(self) -> list[z3.ArithRef]:
        return [
            *self.x,
            *self.y,
            self.common_r,
            self.p_r,
            self.rho_r,
            *self.row_r.values(),
        ]


def one_check_smt2(clauses: Iterable[Clause]) -> str:
    solver = z3.SolverFor("QF_NRA")
    solver.add(*[clause.formula for clause in clauses])
    text = "(set-logic QF_NRA)\n" + solver.sexpr().rstrip() + "\n(check-sat)\n"
    if text.count("(check-sat)") != 1:
        raise RuntimeError("SMT artifact must contain exactly one check-sat")
    return text


def classify(result: z3.CheckSatResult, solver: z3.Solver) -> str:
    if result == z3.sat:
        return "SAT"
    if result == z3.unsat:
        return "UNSAT"
    return f"UNKNOWN:{solver.reason_unknown()}"


def exact_value(value: z3.ExprRef) -> dict[str, str]:
    if z3.is_rational_value(value):
        fraction = Fraction(value.numerator_as_long(), value.denominator_as_long())
        return {"kind": "rational", "exact": str(fraction)}
    if z3.is_algebraic_value(value):
        return {"kind": "algebraic", "exact": value.sexpr()}
    return {"kind": "other", "exact": value.sexpr()}


def substitute_validate(
    encoding: Encoding, clauses: list[Clause], model: z3.ModelRef
) -> tuple[list[str], dict[str, dict[str, str]]]:
    values = {
        variable.decl().name(): model.eval(variable, model_completion=True)
        for variable in encoding.variables()
    }
    substitutions = [
        (variable, values[variable.decl().name()]) for variable in encoding.variables()
    ]
    errors: list[str] = []
    for clause in clauses:
        reduced = z3.simplify(z3.substitute(clause.formula, *substitutions))
        if not z3.is_true(reduced):
            errors.append(f"{clause.name}: {reduced.sexpr()[:160]}")
    exported = {name: exact_value(value) for name, value in values.items()}
    return errors, exported


def fraction_eval(expr: z3.ExprRef, values: dict[str, Fraction]) -> Fraction | bool:
    if z3.is_true(expr):
        return True
    if z3.is_false(expr):
        return False
    if z3.is_rational_value(expr):
        return Fraction(expr.numerator_as_long(), expr.denominator_as_long())
    if z3.is_const(expr) and expr.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        return values[expr.decl().name()]
    args = [fraction_eval(child, values) for child in expr.children()]
    kind = expr.decl().kind()
    if kind == z3.Z3_OP_ADD:
        return sum(args, Fraction(0))  # type: ignore[arg-type]
    if kind == z3.Z3_OP_SUB:
        return args[0] - args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_MUL:
        product = Fraction(1)
        for arg in args:
            product *= arg  # type: ignore[operator]
        return product
    if kind == z3.Z3_OP_UMINUS:
        return -args[0]  # type: ignore[operator]
    if kind == z3.Z3_OP_POWER:
        exponent = args[1]
        if not isinstance(exponent, Fraction) or exponent.denominator != 1:
            raise ValueError(f"unsupported exponent in {expr}")
        return args[0] ** exponent.numerator  # type: ignore[operator]
    if kind == z3.Z3_OP_EQ:
        return args[0] == args[1]
    if kind == z3.Z3_OP_DISTINCT:
        return len(set(args)) == len(args)
    if kind == z3.Z3_OP_LT:
        return args[0] < args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_LE:
        return args[0] <= args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_GT:
        return args[0] > args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_GE:
        return args[0] >= args[1]  # type: ignore[operator]
    if kind == z3.Z3_OP_NOT:
        return not args[0]
    if kind == z3.Z3_OP_AND:
        return all(args)
    if kind == z3.Z3_OP_OR:
        return any(args)
    if kind == z3.Z3_OP_IMPLIES:
        return (not args[0]) or bool(args[1])
    raise ValueError(f"unsupported exact-replay operator {kind}: {expr}")


def fraction_validate(
    encoding: Encoding, clauses: list[Clause], model: z3.ModelRef
) -> tuple[str, list[str]]:
    values: dict[str, Fraction] = {}
    for variable in encoding.variables():
        value = model.eval(variable, model_completion=True)
        if not z3.is_rational_value(value):
            return "SKIPPED_ALGEBRAIC", []
        values[variable.decl().name()] = Fraction(
            value.numerator_as_long(), value.denominator_as_long()
        )
    errors: list[str] = []
    for clause in clauses:
        try:
            if fraction_eval(clause.formula, values) is not True:
                errors.append(clause.name)
        except (KeyError, TypeError, ValueError) as error:
            errors.append(f"{clause.name}: {error}")
    return ("PASS" if not errors else "FAIL"), errors


def parse_status(stdout: str) -> str:
    statuses = [
        line.strip().upper()
        for line in stdout.splitlines()
        if line.strip().lower() in {"sat", "unsat", "unknown"}
    ]
    if len(statuses) != 1:
        return f"PROTOCOL_ERROR:{statuses}"
    return statuses[0]


def run_command(
    command: list[str], timeout_seconds: int, log_path: Path
) -> dict[str, Any]:
    started = time.monotonic()
    try:
        completed = subprocess.run(
            command,
            check=False,
            capture_output=True,
            text=True,
            timeout=timeout_seconds + 5,
        )
        elapsed = time.monotonic() - started
        log_path.write_text(completed.stdout + completed.stderr)
        status = parse_status(completed.stdout)
        if status == "PROTOCOL_ERROR:[]" and elapsed >= 0.95 * timeout_seconds:
            status = "TIMEOUT"
        return {
            "status": status,
            "exit_code": completed.returncode,
            "elapsed_seconds": round(elapsed, 3),
            "command": command,
        }
    except subprocess.TimeoutExpired as error:
        elapsed = time.monotonic() - started
        stdout = (
            error.stdout.decode()
            if isinstance(error.stdout, bytes)
            else error.stdout or ""
        )
        stderr = (
            error.stderr.decode()
            if isinstance(error.stderr, bytes)
            else error.stderr or ""
        )
        log_path.write_text(stdout + stderr)
        return {
            "status": "TIMEOUT",
            "exit_code": None,
            "elapsed_seconds": round(elapsed, 3),
            "command": command,
        }


def pinned_smt2(
    encoding: Encoding, clauses: list[Clause], model: z3.ModelRef
) -> str | None:
    pins: list[Clause] = []
    for variable in encoding.variables():
        value = model.eval(variable, model_completion=True)
        if not (z3.is_rational_value(value) or z3.is_algebraic_value(value)):
            return None
        pins.append(Clause(f"pin_{variable}", variable == value, "exact Z3 model pin"))
    return one_check_smt2([*clauses, *pins])


def solve_query(
    encoding: Encoding,
    name: str,
    clauses: list[Clause],
    output_dir: Path,
    timeout_seconds: int,
) -> dict[str, Any]:
    smt_path = output_dir / f"{name}.smt2"
    smt_path.write_text(one_check_smt2(clauses))

    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_seconds * 1000)
    solver.add(*[clause.formula for clause in clauses])
    started = time.monotonic()
    internal_result = solver.check()
    internal_elapsed = time.monotonic() - started
    internal_status = classify(internal_result, solver)
    record: dict[str, Any] = {
        "name": name,
        "assertions": len(clauses),
        "z3py": {
            "status": internal_status,
            "elapsed_seconds": round(internal_elapsed, 3),
        },
    }
    model: z3.ModelRef | None = None
    if internal_result == z3.sat:
        model = solver.model()
        substitution_errors, exported = substitute_validate(encoding, clauses, model)
        fraction_status, fraction_errors = fraction_validate(encoding, clauses, model)
        model_path = output_dir / f"{name}.model.json"
        model_path.write_text(json.dumps(exported, indent=2, sort_keys=True) + "\n")
        record["z3py"].update(
            {
                "substitution_validation": "PASS"
                if not substitution_errors
                else "FAIL",
                "substitution_errors": substitution_errors[:20],
                "fraction_validation": fraction_status,
                "fraction_errors": fraction_errors[:20],
                "model": model_path.name,
            }
        )

    z3_exe = shutil.which("z3")
    cvc5_exe = shutil.which("cvc5")
    if z3_exe:
        record["z3_cli"] = run_command(
            [z3_exe, f"-T:{timeout_seconds}", str(smt_path)],
            timeout_seconds,
            output_dir / f"{name}.z3.log",
        )
    else:
        record["z3_cli"] = {"status": "MISSING"}
    if cvc5_exe:
        record["cvc5"] = run_command(
            [
                cvc5_exe,
                "--lang=smt2",
                "--nl-cov",
                f"--tlimit={timeout_seconds * 1000}",
                str(smt_path),
            ],
            timeout_seconds,
            output_dir / f"{name}.cvc5.log",
        )
        if model is not None and record["cvc5"]["status"] not in {"SAT", "UNSAT"}:
            pinned = pinned_smt2(encoding, clauses, model)
            if pinned is not None:
                pinned_path = output_dir / f"{name}.pinned.smt2"
                pinned_path.write_text(pinned)
                record["cvc5_pinned"] = run_command(
                    [
                        cvc5_exe,
                        "--lang=smt2",
                        "--nl-cov",
                        f"--tlimit={timeout_seconds * 1000}",
                        str(pinned_path),
                    ],
                    timeout_seconds,
                    output_dir / f"{name}.pinned.cvc5.log",
                )
    else:
        record["cvc5"] = {"status": "MISSING"}
    return record


def source_contract() -> dict[str, Any]:
    return {
        "scope": "one frozen exact-17 common-radius sameBlocker x sameBlocker case",
        "roles": ROLES,
        "boundary_rank": RANK,
        "closed_caps": [sorted(cap) for cap in CAPS],
        "canonical_strict_cap": sorted(STRICT_CAP0),
        "w4": sorted(W4),
        "named_selected_rows": {str(k): sorted(v) for k, v in ROWS.items()},
        "explicit_frozen_assumptions": [
            "carrier labels instantiate pairwise-distinct C/Q/P/P-rho roles as listed",
            "canonical closed cap has exact card 8 and strict interior C-pair union W4",
            "the three named selected supports are the exact four-sets listed",
            "blocker centers for C/Q, P, and P-rho are labels 7, 8, and 9",
        ],
        "not_encoded": [
            "arbitrary pointwise D.K4 witness supports",
            "anonymous deletion packets or universal minimality",
            "all FreshThird constructor arms",
            "general cardinality or a finite-to-universal lift",
        ],
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--smoke-only", action="store_true")
    args = parser.parse_args()
    output_dir = Path(__file__).resolve().parent / "artifacts"
    output_dir.mkdir(parents=True, exist_ok=True)

    encoding = Encoding()
    final_clauses = encoding.clauses_through("blocker_exactness")
    controls = {
        "control_row_equality_collision": [
            Clause(
                "malformed_row_7_0_ne_1",
                d2(encoding.x, encoding.y, 7, 0) != d2(encoding.x, encoding.y, 7, 1),
                "malformed control",
            ),
            *final_clauses,
        ],
        "control_radial_collision": [
            Clause(
                "malformed_common_equals_rho_member",
                d2(encoding.x, encoding.y, ROLES["apex0"], 0)
                == d2(encoding.x, encoding.y, ROLES["apex0"], 4),
                "malformed control",
            ),
            *final_clauses,
        ],
        "control_blocker_nonmember_collision": [
            Clause(
                "malformed_row_7_contains_4",
                d2(encoding.x, encoding.y, 7, 4) == encoding.row_r[7],
                "malformed control",
            ),
            *final_clauses,
        ],
    }
    queries: list[tuple[str, list[Clause]]] = []
    if not args.smoke_only:
        queries.extend((stage, encoding.clauses_through(stage)) for stage in STAGES)
    queries.extend(controls.items())

    results = {
        "schema_version": 1,
        "contract": source_contract(),
        "timeout_seconds": args.timeout_seconds,
        "queries": [],
    }
    for name, clauses in queries:
        record = solve_query(encoding, name, clauses, output_dir, args.timeout_seconds)
        results["queries"].append(record)
        print(
            f"{name}: z3py={record['z3py']['status']} "
            f"z3={record['z3_cli']['status']} cvc5={record['cvc5']['status']}"
        )
    results_path = Path(__file__).resolve().parent / (
        "smoke-results.json" if args.smoke_only else "results.json"
    )
    results_path.write_text(json.dumps(results, indent=2, sort_keys=True) + "\n")
    print(results_path)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
