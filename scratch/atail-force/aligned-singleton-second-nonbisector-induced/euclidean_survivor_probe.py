#!/usr/bin/env python3
"""Bounded exact R^2 probe for a current aliased CEGAR survivor.

The input result and checkpoint are accepted only when their metadata matches
the current ``cegar.py`` implementation and a freshly constructed outer map.
Every checkpoint cut is replayed, the survivor's recorded alias classes,
their order, and every required-row truth value are pinned, and the pinned
outer map must replay SAT.

The Euclidean formula has one coordinate pair per alias class.  Every directed
boundary edge is required to strictly support every other class, which exactly
encodes the recorded strict-convex cyclic order.  Positive required-row atoms
selected by the pinned outer model become squared-distance equalities.  With
``--include-false-rows``, selected false rows are additionally imposed as
disequalities in a separate, stronger diagnostic.

Z3 is a trusted discovery/checking oracle here, not a proof-producing kernel.
SAT and UNSAT are solver evidence only.  UNKNOWN and timeouts fail closed.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import math
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from types import SimpleNamespace
from typing import Any, Iterable

import z3


HERE = Path(__file__).resolve().parent
CEGAR = HERE / "cegar.py"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_json(path: Path) -> dict[str, Any]:
    raw = json.loads(path.read_text())
    if not isinstance(raw, dict):
        raise ValueError(f"expected a JSON object: {path}")
    return raw


def load_cegar() -> Any:
    spec = importlib.util.spec_from_file_location(
        "atail_induced_cegar_survivor_probe", CEGAR
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {CEGAR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


@dataclass
class Budget:
    deadline: float

    @classmethod
    def start(cls, timeout_seconds: float) -> "Budget":
        if timeout_seconds <= 0:
            raise ValueError("--timeout-seconds must be positive")
        return cls(time.monotonic() + timeout_seconds)

    def remaining_ms(self) -> int:
        remaining = self.deadline - time.monotonic()
        if remaining <= 0:
            raise TimeoutError("global wall-clock budget expired")
        return max(1, int(remaining * 1000))


def normalize_classes(
    raw_classes: object, names: tuple[str, ...]
) -> list[list[str]]:
    if not isinstance(raw_classes, list) or len(raw_classes) < 3:
        raise ValueError("survivor must record at least three alias classes")
    classes: list[list[str]] = []
    flattened: list[str] = []
    for raw_class in raw_classes:
        if (
            not isinstance(raw_class, list)
            or not raw_class
            or not all(isinstance(name, str) for name in raw_class)
        ):
            raise ValueError("invalid survivor alias class")
        cls = list(raw_class)
        classes.append(cls)
        flattened.extend(cls)
    if len(flattened) != len(set(flattened)):
        raise ValueError("survivor alias classes overlap")
    if set(flattened) != set(names):
        missing = sorted(set(names) - set(flattened))
        extra = sorted(set(flattened) - set(names))
        raise ValueError(
            f"survivor alias classes do not partition names: "
            f"missing={missing}, extra={extra}"
        )
    return classes


def normalize_row_assignment(
    raw_assignment: object,
    cg: Any,
    outer: Any,
) -> list[Any]:
    if not isinstance(raw_assignment, list):
        raise ValueError("survivor has no terminal required-row assignment")
    literals = [cg.Literal.from_json(raw) for raw in raw_assignment]
    for literal in literals:
        if (
            literal.kind != "row"
            or len(literal.args) != 4
            or not all(isinstance(arg, str) for arg in literal.args[:3])
            or any(arg not in outer.names for arg in literal.args[:3])
            or literal.args[1] == literal.args[2]
            or type(literal.args[3]) is not bool
        ):
            raise ValueError(
                "terminal row assignment contains an invalid row entry"
            )
    expected_keys = sorted(outer.required_rows)
    actual_keys = [
        (str(literal.args[0]), str(literal.args[1]), str(literal.args[2]))
        for literal in literals
    ]
    if actual_keys != expected_keys:
        raise ValueError(
            "terminal row assignment is not the canonical complete required-row census"
        )
    return literals


def current_metadata(cg: Any, payload: dict[str, Any], outer: Any) -> dict[str, object]:
    return cg.checkpoint_metadata(
        SimpleNamespace(
            z_branch=payload["z_branch"],
            escape_arm=payload["escape_arm"],
            global_tier=payload["global_tier"],
            outer_only=payload["metadata"]["outer_only"],
        ),
        outer,
    )


def metadata_name_tuple(metadata: dict[str, Any], key: str) -> tuple[str, ...]:
    raw = metadata.get(key)
    if (
        not isinstance(raw, list)
        or not all(isinstance(name, str) for name in raw)
        or len(raw) != len(set(raw))
    ):
        raise ValueError(f"result metadata has an invalid {key} census")
    return tuple(raw)


def replay_survivor(
    result_path: Path,
    checkpoint_path: Path,
    budget: Budget,
) -> dict[str, Any]:
    payload = load_json(result_path)
    checkpoint = load_json(checkpoint_path)
    if payload.get("status") != "ALIVE":
        raise ValueError("result has no ALIVE survivor")
    survivor = payload.get("survivor")
    if not isinstance(survivor, dict):
        raise ValueError("result has no survivor object")
    metadata = payload.get("metadata")
    if not isinstance(metadata, dict):
        raise ValueError("result has no metadata object")

    implementation_sha = sha256(CEGAR)
    if payload.get("implementation_sha256") != implementation_sha:
        raise ValueError("result implementation hash does not match current cegar.py")
    if metadata.get("implementation_sha256") != implementation_sha:
        raise ValueError("result metadata implementation hash is inconsistent")
    if checkpoint.get("metadata") != metadata:
        raise ValueError("checkpoint and result metadata differ")

    cg = load_cegar()
    outer = cg.OuterMap(
        timeout_ms=budget.remaining_ms(),
        random_seed=0,
        z_branch=payload["z_branch"],
        escape_arm=payload["escape_arm"],
        global_tier=payload["global_tier"],
        cover_points=metadata_name_tuple(metadata, "cover_points"),
        global_k4_centers=metadata_name_tuple(
            metadata, "global_k4_centers"
        ),
        rich_apices=metadata_name_tuple(metadata, "rich_apices"),
        robust_deletions=metadata_name_tuple(
            metadata, "robust_deletions"
        ),
    )
    expected_metadata = current_metadata(cg, payload, outer)
    if metadata != expected_metadata:
        raise ValueError("artifact metadata does not match the current outer map")
    recorded_counts = payload.get("outer_constraint_counts")
    live_counts = dict(sorted(outer.counts.items()))
    if recorded_counts != live_counts:
        raise ValueError("recorded outer constraint ledger does not match current map")

    cuts = cg.load_checkpoint(checkpoint_path, expected_metadata, outer.names)
    if payload.get("cuts") != len(cuts):
        raise ValueError("result cut count does not match checkpoint")
    for cut in cuts:
        budget.remaining_ms()
        outer.add_cut(cut)

    classes = normalize_classes(
        survivor.get("alias_classes_in_order"), outer.names
    )
    row_assignment = normalize_row_assignment(
        survivor.get("required_row_assignment"), cg, outer
    )
    class_of = {
        name: class_index
        for class_index, cls in enumerate(classes)
        for name in cls
    }
    for cls in classes:
        for name in cls[1:]:
            outer.solver.add(outer.same(cls[0], name))
    for left, right in zip(classes, classes[1:]):
        outer.solver.add(outer.before(left[0], right[0]))
    for literal in row_assignment:
        outer.solver.add(outer.literal_expr(literal))

    outer.solver.set(timeout=budget.remaining_ms())
    started = time.monotonic()
    status = outer.solver.check()
    elapsed = time.monotonic() - started
    if status == z3.unknown:
        raise RuntimeError(
            "pinned outer replay UNKNOWN (fail closed): "
            f"{outer.solver.reason_unknown()}"
        )
    if status != z3.sat:
        raise RuntimeError(f"pinned outer replay was {status}, expected SAT")
    model = outer.solver.model()
    if outer.alias_classes(model) != classes:
        raise RuntimeError("SAT replay model does not reproduce recorded alias classes")
    if outer.required_row_assignment(model) != [
        literal.to_json() for literal in row_assignment
    ]:
        raise RuntimeError(
            "SAT replay model does not reproduce the terminal row assignment"
        )

    positive_named_rows: list[list[str]] = []
    false_named_rows: list[list[str]] = []
    for literal in row_assignment:
        center, left, right, equal = literal.args
        target = positive_named_rows if bool(equal) else false_named_rows
        target.append([str(center), str(left), str(right)])

    def quotient_rows(named_rows: Iterable[list[str]]) -> list[list[int]]:
        rows = {
            (
                class_of[center],
                min(class_of[left], class_of[right]),
                max(class_of[left], class_of[right]),
            )
            for center, left, right in named_rows
        }
        return [list(row) for row in sorted(rows)]

    positive_quotient_rows = quotient_rows(positive_named_rows)
    false_quotient_rows = quotient_rows(false_named_rows)

    def quotient_equations(
        quotient_rows: Iterable[list[int]],
    ) -> tuple[list[list[list[int]]], int]:
        equations: set[
            tuple[tuple[int, int], tuple[int, int]]
        ] = set()
        trivial = 0
        for center, left, right in quotient_rows:
            left_edge = tuple(sorted((center, left)))
            right_edge = tuple(sorted((center, right)))
            if left_edge == right_edge:
                trivial += 1
                continue
            equations.add(tuple(sorted((left_edge, right_edge))))
        return [
            [list(left_edge), list(right_edge)]
            for left_edge, right_edge in sorted(equations)
        ], trivial

    positive_equations, positive_trivial_rows = quotient_equations(
        positive_quotient_rows
    )
    false_equations, false_trivial_rows = quotient_equations(false_quotient_rows)
    if false_trivial_rows:
        raise RuntimeError(
            "pinned outer model selected a false row that is trivial after "
            "quotient collapse"
        )
    overlap = {
        tuple(tuple(edge) for edge in equation)
        for equation in positive_equations
    } & {
        tuple(tuple(edge) for edge in equation)
        for equation in false_equations
    }
    if overlap:
        raise RuntimeError(
            f"pinned model maps true and false rows to the same quotient equations: "
            f"{sorted(overlap)}"
        )

    return {
        "payload": payload,
        "outer_status": "SAT",
        "outer_elapsed_seconds": elapsed,
        "cut_count": len(cuts),
        "required_row_assignment_count": len(row_assignment),
        "classes": classes,
        "class_of": class_of,
        "positive_named_rows": positive_named_rows,
        "false_named_rows": false_named_rows,
        "positive_quotient_rows": positive_quotient_rows,
        "false_quotient_rows": false_quotient_rows,
        "positive_quotient_equations": positive_equations,
        "false_quotient_equations": false_equations,
        "positive_trivial_quotient_rows": positive_trivial_rows,
        "implementation_sha256": implementation_sha,
        "outer_constraint_counts": live_counts,
    }


def orient(
    x: list[z3.ArithRef],
    y: list[z3.ArithRef],
    a: int,
    b: int,
    c: int,
) -> z3.ArithRef:
    return (x[b] - x[a]) * (y[c] - y[a]) - (
        y[b] - y[a]
    ) * (x[c] - x[a])


def dist2(
    x: list[z3.ArithRef],
    y: list[z3.ArithRef],
    a: int,
    b: int,
) -> z3.ArithRef:
    dx = x[a] - x[b]
    dy = y[a] - y[b]
    return dx * dx + dy * dy


def build_formula(
    quotient_count: int,
    positive_equations: list[list[list[int]]],
    false_equations: list[list[list[int]]],
    *,
    timeout_ms: int,
) -> tuple[
    z3.Solver,
    list[z3.ArithRef],
    list[z3.ArithRef],
    list[z3.BoolRef],
    dict[str, int],
]:
    x = [z3.Real(f"x_q{i}") for i in range(quotient_count)]
    y = [z3.Real(f"y_q{i}") for i in range(quotient_count)]
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    trackers: list[z3.BoolRef] = []
    counts = {
        "gauge": 0,
        "strict_convex_support": 0,
        "positive_row_equalities": 0,
        "false_row_disequalities": 0,
    }

    def track(label: str, constraint: z3.BoolRef, family: str) -> None:
        token = z3.Bool(label)
        trackers.append(token)
        solver.assert_and_track(constraint, token)
        counts[family] += 1

    track("gauge_x0", x[0] == 0, "gauge")
    track("gauge_y0", y[0] == 0, "gauge")
    track("gauge_x1", x[1] == 1, "gauge")
    track("gauge_y1", y[1] == 0, "gauge")

    convex_index = 0
    for a in range(quotient_count):
        b = (a + 1) % quotient_count
        for c in range(quotient_count):
            if c in (a, b):
                continue
            track(
                f"conv_{convex_index}",
                orient(x, y, a, b, c) > 0,
                "strict_convex_support",
            )
            convex_index += 1

    for row_index, (left_edge, right_edge) in enumerate(positive_equations):
        track(
            f"row_eq_{row_index}",
            dist2(x, y, *left_edge) == dist2(x, y, *right_edge),
            "positive_row_equalities",
        )
    for row_index, (left_edge, right_edge) in enumerate(false_equations):
        track(
            f"row_neq_{row_index}",
            dist2(x, y, *left_edge) != dist2(x, y, *right_edge),
            "false_row_disequalities",
        )
    return solver, x, y, trackers, counts


def check_formula(
    smt2_path: Path,
    budget: Budget,
) -> dict[str, Any]:
    timeout_ms = budget.remaining_ms()
    command = [
        "z3",
        "-smt2",
        "-model",
        f"-t:{timeout_ms}",
        f"-T:{max(1, math.ceil(timeout_ms / 1000))}",
        str(smt2_path),
    ]
    started = time.monotonic()
    timed_out = False
    try:
        process = subprocess.run(
            command,
            capture_output=True,
            text=True,
            check=False,
            timeout=timeout_ms / 1000,
        )
        stdout = process.stdout
        stderr = process.stderr
        returncode: int | None = process.returncode
    except subprocess.TimeoutExpired as error:
        timed_out = True
        raw_stdout = error.stdout or ""
        raw_stderr = error.stderr or ""
        stdout = (
            raw_stdout.decode(errors="replace")
            if isinstance(raw_stdout, bytes)
            else raw_stdout
        )
        stderr = (
            raw_stderr.decode(errors="replace")
            if isinstance(raw_stderr, bytes)
            else raw_stderr
        )
        returncode = None
    elapsed = time.monotonic() - started
    output_path = smt2_path.with_suffix(".z3-output.txt")
    output_path.write_text(stdout)

    status = "UNKNOWN"
    for line in stdout.splitlines():
        normalized = line.strip().upper()
        if normalized in ("SAT", "UNSAT", "UNKNOWN"):
            status = normalized
            break
    evidence: dict[str, Any] = {
        "status": status,
        "elapsed_seconds": elapsed,
        "command": command,
        "returncode": returncode,
        "output": str(output_path),
        "output_sha256": sha256(output_path),
        "stdout_tail": stdout.splitlines()[-10:],
        "stderr_tail": stderr.splitlines()[-10:],
    }
    if timed_out:
        evidence["status"] = "UNKNOWN"
        evidence["reason_unknown"] = "hard subprocess wall timeout"
        evidence["fail_closed"] = True
    elif returncode != 0 or any(
        line.lstrip().startswith("(error") for line in stdout.splitlines()
    ):
        evidence["status"] = "UNKNOWN"
        evidence["reason_unknown"] = (
            "Z3 parser/solver process failed; nonzero return or error output"
        )
        evidence["fail_closed"] = True
    elif status == "UNKNOWN":
        evidence["reason_unknown"] = (
            "Z3 returned UNKNOWN or emitted no terminal status"
        )
        evidence["fail_closed"] = True
    return evidence


def write_smt2(
    solver: z3.Solver, trackers: list[z3.BoolRef], path: Path
) -> None:
    substitutions = tuple((token, z3.BoolVal(True)) for token in trackers)
    direct = z3.SolverFor("QF_NRA")
    direct.add(
        *(
            z3.simplify(z3.substitute(assertion, *substitutions))
            for assertion in solver.assertions()
        )
    )
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("(set-logic QF_NRA)\n" + direct.sexpr() + "\n(check-sat)\n")


def convex_polygon_self_test(timeout_ms: int) -> dict[str, Any]:
    names = range(4)
    x = [z3.Real(f"self_x_{i}") for i in names]
    y = [z3.Real(f"self_y_{i}") for i in names]
    coordinates = ((0, 0), (1, 0), (1, 1), (0, 1))

    def solver_for(order: tuple[int, ...]) -> z3.Solver:
        solver = z3.SolverFor("QF_NRA")
        solver.set(timeout=timeout_ms)
        for index, (x_value, y_value) in enumerate(coordinates):
            solver.add(x[index] == x_value, y[index] == y_value)
        for position, a in enumerate(order):
            b = order[(position + 1) % len(order)]
            for c in order:
                if c not in (a, b):
                    solver.add(orient(x, y, a, b, c) > 0)
        return solver

    square_status = solver_for((0, 1, 2, 3)).check()
    crossed_status = solver_for((0, 2, 1, 3)).check()
    if square_status == z3.unknown or crossed_status == z3.unknown:
        raise RuntimeError("convex-polygon self-test returned UNKNOWN")
    if square_status != z3.sat or crossed_status != z3.unsat:
        raise RuntimeError(
            f"convex-polygon self-test failed: "
            f"square={square_status}, crossed={crossed_status}"
        )
    return {
        "counterclockwise_square": "SAT",
        "crossed_order": "UNSAT",
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--result", type=Path)
    parser.add_argument("--checkpoint", type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    parser.add_argument(
        "--include-false-rows",
        action="store_true",
        help="also check the stronger selected-full-row diagnostic",
    )
    parser.add_argument(
        "--self-test",
        action="store_true",
        help="run the small convex-polygon encoding test only",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    if args.timeout_seconds <= 0:
        raise ValueError("--timeout-seconds must be positive")
    self_test = convex_polygon_self_test(
        max(1, min(30_000, int(args.timeout_seconds * 1000)))
    )
    if args.self_test:
        print(json.dumps({"self_test": self_test}, indent=2, sort_keys=True))
        return 0
    if args.result is None or args.checkpoint is None or args.output is None:
        raise ValueError(
            "--result, --checkpoint, and --output are required unless --self-test"
        )

    budget = Budget.start(args.timeout_seconds)
    started = time.monotonic()
    replay = replay_survivor(args.result, args.checkpoint, budget)
    result: dict[str, Any] = {
        "schema": "p97-aliased-euclidean-survivor-probe-v2-terminal-rows",
        "epistemic_status": "SOLVER_EVIDENCE_ONLY",
        "trust_warning": (
            "The pinned outer replay is exact QF_UFBV and the coordinate probe "
            "is exact QF_NRA, but Z3 is a trusted solver oracle rather than a "
            "kernel-checked proof. UNKNOWN and timeout are no verdict."
        ),
        "inputs": {
            "result": str(args.result),
            "result_sha256": sha256(args.result),
            "checkpoint": str(args.checkpoint),
            "checkpoint_sha256": sha256(args.checkpoint),
            "cegar": str(CEGAR),
            "cegar_sha256": replay["implementation_sha256"],
        },
        "configuration": {
            "timeout_seconds": args.timeout_seconds,
            "include_false_rows": args.include_false_rows,
            "global_tier": replay["payload"]["global_tier"],
            "escape_arm": replay["payload"]["escape_arm"],
            "z_branch": replay["payload"]["z_branch"],
        },
        "self_test": self_test,
        "outer_replay": {
            "status": replay["outer_status"],
            "elapsed_seconds": replay["outer_elapsed_seconds"],
            "cut_count": replay["cut_count"],
            "required_row_assignment_count": replay[
                "required_row_assignment_count"
            ],
            "constraint_counts": replay["outer_constraint_counts"],
            "pinning": (
                "members of each recorded class are equal and consecutive "
                "class representatives are strictly ordered; every recorded "
                "required-row truth value is fixed"
            ),
        },
        "target": {
            "alias_class_count": len(replay["classes"]),
            "alias_classes_in_order": replay["classes"],
            "named_positive_required_row_count": len(
                replay["positive_named_rows"]
            ),
            "named_false_required_row_count": len(replay["false_named_rows"]),
            "quotient_positive_row_count": len(
                replay["positive_quotient_rows"]
            ),
            "quotient_false_row_count": len(replay["false_quotient_rows"]),
            "quotient_positive_equation_count": len(
                replay["positive_quotient_equations"]
            ),
            "quotient_false_equation_count": len(
                replay["false_quotient_equations"]
            ),
            "positive_trivial_quotient_row_count": replay[
                "positive_trivial_quotient_rows"
            ],
            "positive_named_rows": replay["positive_named_rows"],
            "positive_quotient_rows": replay["positive_quotient_rows"],
            "positive_quotient_equations": replay[
                "positive_quotient_equations"
            ],
            "row_classification": (
                "the exact terminal CEGAR model's recorded required-row truth "
                "values; not separately proved universal under weaker quotient "
                "or order constraints"
            ),
            "convex_order_encoding": (
                "every directed consecutive quotient edge strictly supports "
                "every other quotient point on its left"
            ),
        },
        "formulas": {},
    }

    formula_specs = [("positive_rows", [])]
    if args.include_false_rows:
        formula_specs.append(
            ("selected_full_rows", replay["false_quotient_equations"])
        )
    for label, false_equations in formula_specs:
        solver, _x, _y, trackers, assertion_counts = build_formula(
            len(replay["classes"]),
            replay["positive_quotient_equations"],
            false_equations,
            timeout_ms=budget.remaining_ms(),
        )
        smt2_path = args.output.with_name(f"{args.output.stem}.{label}.smt2")
        write_smt2(solver, trackers, smt2_path)
        evidence = check_formula(smt2_path, budget)
        result["formulas"][label] = {
            "logic": "QF_NRA",
            "smt2": str(smt2_path),
            "smt2_sha256": sha256(smt2_path),
            "assertion_counts": assertion_counts,
            "solver": "Z3",
            "evidence": evidence,
        }
        if evidence["status"] == "UNKNOWN":
            break

    statuses = {
        label: formula["evidence"]["status"]
        for label, formula in result["formulas"].items()
    }
    if "UNKNOWN" in statuses.values():
        terminal_status = "UNKNOWN_FAIL_CLOSED"
        reason = f"at least one bounded QF_NRA check returned UNKNOWN: {statuses}"
    elif statuses.get("positive_rows") == "UNSAT":
        terminal_status = "UNSAT_SELECTED_POSITIVE_ROWS_SOLVER_EVIDENCE"
        reason = (
            "the pinned model's positive required rows conflict with its "
            "strict-convex quotient order over Euclidean R^2"
        )
    elif statuses.get("selected_full_rows") == "UNSAT":
        terminal_status = "UNSAT_SELECTED_FULL_ROWS_SOLVER_EVIDENCE"
        reason = (
            "the stronger selected full-row assignment has no strict-convex "
            "Euclidean R^2 realization"
        )
    elif all(status == "SAT" for status in statuses.values()):
        terminal_status = "SAT_SOLVER_EVIDENCE"
        reason = "all requested exact QF_NRA diagnostics returned SAT"
    else:
        terminal_status = "INTERNAL_INCOMPLETE_FAIL_CLOSED"
        reason = f"unexpected formula status map: {statuses}"

    result["terminal_status"] = terminal_status
    result["reason"] = reason
    result["elapsed_seconds"] = time.monotonic() - started
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "terminal_status": terminal_status,
                "reason": reason,
                "formula_statuses": statuses,
                "elapsed_seconds": result["elapsed_seconds"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
