#!/usr/bin/env python3
"""Mine exact small Euclidean contradictions from a recorded survivor.

The target is an explicitly hash-pinned positive-row formula emitted by
``euclidean_survivor_probe.py``.  For every induced cyclic subset considered,
the miner keeps exactly those squared-distance equalities whose four endpoints
belong to the subset.  It then asks for an exact R^2 realization in the induced
cyclic order.

The coordinate gauge fixes the first local vertex at (0, 0) and the next at
(1, 0).  This is sound because they are consecutive distinct vertices and the
distance equalities and orientation signs are invariant under
translation/positive scaling and orientation-preserving rotation.  Strict
cyclic convexity is encoded by requiring every directed consecutive edge to
strictly support every other subset vertex on its left.  Pairwise distinctness
is also asserted explicitly.

Every orientation, distinctness constraint, and source equality is
assumption-tracked; the sound coordinate gauge remains fixed background.  A
Z3 UNSAT seed is greedily shrunk relative to that gauge, reconstructed from its
declarative constraint records, serialized as exact SMT-LIB, and replayed by
fresh Z3 and cvc5 processes.  Any UNKNOWN, timeout, malformed output, failed
replay, or cross-engine disagreement fails closed and is never upgraded to
UNSAT.

The output is trusted exact-solver evidence, not a kernel-checked proof.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import shutil
import subprocess
import sys
import time
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable, Sequence

import z3


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = HERE.parents[2]
DEFAULT_PROBE_RESULT = HERE / "euclidean-survivor-probe-v9-local-robust-new.json"
DEFAULT_POSITIVE_SMT2 = (
    HERE / "euclidean-survivor-probe-v9-local-robust-new.positive_rows.smt2"
)
DEFAULT_CEGAR_RESULT = HERE / "cegar-v9-local-robust-new.json"
DEFAULT_CHECKPOINT = HERE / "cegar-v9-local-robust-new.checkpoint.json"
DEFAULT_CEGAR_SCRIPT = HERE / "cegar.py"

DEFAULT_EXPECTED_PROBE_SHA256 = (
    "d08d275d1f5eee7bf31e9c68312da69dccf1e660041704a9c4e2027a960aa9a9"
)
DEFAULT_EXPECTED_POSITIVE_SMT2_SHA256 = (
    "02ad0315200190370419e0ff7192ebd321922301cc17d7b6acf7facb922514ce"
)
DEFAULT_EXPECTED_CEGAR_RESULT_SHA256 = (
    "90bdaca3614add5ca456fdbdc96dc2ea1d8009e42f729f150bada30e03bbe4d1"
)
DEFAULT_EXPECTED_CHECKPOINT_SHA256 = (
    "3d17df2d340024e18c3ec6692182eee7d5ca4c52f2d9799509506eb2f067823b"
)
DEFAULT_EXPECTED_RECORDED_CEGAR_SHA256 = (
    "4a5278cb5da186e9b7c3ec39cb002d38d1a37ae84c1d76a02718cea1d2ba85c0"
)
DEFAULT_EXPECTED_CLASS_COUNT = 20
DEFAULT_EXPECTED_EQUATION_COUNT = 48
MAX_WALL_SECONDS = 540.0


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode()).hexdigest()


def load_json(path: Path) -> dict[str, Any]:
    raw = json.loads(path.read_text())
    if not isinstance(raw, dict):
        raise ValueError(f"expected JSON object: {path}")
    return raw


def strict_json_dump(payload: dict[str, Any], path: Path) -> None:
    text = json.dumps(
        payload,
        indent=2,
        sort_keys=True,
        allow_nan=False,
    )
    path.write_text(text + "\n")


@dataclass
class WallBudget:
    started: float
    deadline: float

    @classmethod
    def start(cls, seconds: float) -> "WallBudget":
        if seconds <= 0 or seconds > MAX_WALL_SECONDS:
            raise ValueError(
                f"--timeout-seconds must lie in (0, {MAX_WALL_SECONDS}]"
            )
        started = time.monotonic()
        return cls(started, started + seconds)

    def elapsed(self) -> float:
        return time.monotonic() - self.started

    def remaining(self) -> float:
        return max(0.0, self.deadline - time.monotonic())

    def timeout_ms(self, requested_ms: int, *, reserve_seconds: float = 0.0) -> int:
        available = self.remaining() - reserve_seconds
        if available <= 0:
            raise TimeoutError("global wall-clock budget exhausted")
        return max(1, min(requested_ms, int(available * 1000)))


@dataclass(frozen=True)
class SourceConfig:
    probe_result: Path
    positive_smt2: Path
    cegar_result: Path
    checkpoint: Path
    cegar_script: Path
    expected_probe_sha256: str
    expected_positive_smt2_sha256: str
    expected_cegar_result_sha256: str
    expected_checkpoint_sha256: str
    expected_recorded_cegar_sha256: str
    expected_class_count: int
    expected_equation_count: int


@dataclass(frozen=True)
class SourceEquation:
    source_index: int
    left_edge: tuple[int, int]
    right_edge: tuple[int, int]

    @property
    def vertices(self) -> frozenset[int]:
        return frozenset((*self.left_edge, *self.right_edge))

    def as_json(self) -> dict[str, Any]:
        return {
            "source_index": self.source_index,
            "left_edge": list(self.left_edge),
            "right_edge": list(self.right_edge),
        }


@dataclass(frozen=True)
class ConstraintRecord:
    name: str
    family: str
    expression: z3.BoolRef
    data: dict[str, Any]

    def as_json(self) -> dict[str, Any]:
        return {
            "name": self.name,
            "family": self.family,
            "expression": str(self.expression),
            "data": self.data,
        }


@dataclass
class SubsetProblem:
    subset: tuple[int, ...]
    equations: tuple[SourceEquation, ...]
    x: list[z3.ArithRef]
    y: list[z3.ArithRef]
    records: list[ConstraintRecord]

    @property
    def record_by_name(self) -> dict[str, ConstraintRecord]:
        return {record.name: record for record in self.records}

    def counts(self) -> dict[str, int]:
        counts = Counter(record.family for record in self.records)
        return dict(sorted(counts.items()))


def orient(
    x: Sequence[z3.ArithRef],
    y: Sequence[z3.ArithRef],
    a: int,
    b: int,
    c: int,
) -> z3.ArithRef:
    return (x[b] - x[a]) * (y[c] - y[a]) - (
        y[b] - y[a]
    ) * (x[c] - x[a])


def dist2(
    x: Sequence[z3.ArithRef],
    y: Sequence[z3.ArithRef],
    a: int,
    b: int,
) -> z3.ArithRef:
    dx = x[a] - x[b]
    dy = y[a] - y[b]
    return dx * dx + dy * dy


def normalize_equations(
    raw: object,
    *,
    expected_class_count: int,
    expected_equation_count: int,
) -> tuple[SourceEquation, ...]:
    if not isinstance(raw, list):
        raise ValueError("positive_quotient_equations must be a list")
    equations: list[SourceEquation] = []
    seen: set[tuple[tuple[int, int], tuple[int, int]]] = set()
    for source_index, equation in enumerate(raw):
        if (
            not isinstance(equation, list)
            or len(equation) != 2
            or any(not isinstance(edge, list) or len(edge) != 2 for edge in equation)
            or any(
                not isinstance(vertex, int)
                for edge in equation
                for vertex in edge
            )
        ):
            raise ValueError(f"invalid equation at source index {source_index}")
        edges = tuple(
            sorted(
                (
                    tuple(sorted((int(equation[0][0]), int(equation[0][1])))),
                    tuple(sorted((int(equation[1][0]), int(equation[1][1])))),
                )
            )
        )
        left_edge, right_edge = edges
        if left_edge == right_edge:
            raise ValueError(f"trivial equation at source index {source_index}")
        if edges in seen:
            raise ValueError(f"duplicate equation at source index {source_index}")
        if any(a == b for a, b in edges):
            raise ValueError(f"degenerate edge at source index {source_index}")
        if any(
            v < 0 or v >= expected_class_count
            for edge in edges
            for v in edge
        ):
            raise ValueError(f"out-of-range vertex at source index {source_index}")
        seen.add(edges)
        equations.append(SourceEquation(source_index, left_edge, right_edge))
    if len(equations) != expected_equation_count:
        raise ValueError(
            f"expected {expected_equation_count} equations, got {len(equations)}"
        )
    return tuple(equations)


def validate_source(config: SourceConfig) -> tuple[
    dict[str, Any], tuple[SourceEquation, ...], dict[str, Any]
]:
    actual_hashes = {
        "exact_probe_result_sha256": sha256(config.probe_result),
        "exact_positive_rows_smt2_sha256": sha256(config.positive_smt2),
        "cegar_result_sha256": sha256(config.cegar_result),
        "checkpoint_sha256": sha256(config.checkpoint),
        "cegar_script_current_sha256": sha256(config.cegar_script),
    }
    expected = {
        "exact_probe_result_sha256": config.expected_probe_sha256,
        "exact_positive_rows_smt2_sha256": (
            config.expected_positive_smt2_sha256
        ),
        "cegar_result_sha256": config.expected_cegar_result_sha256,
        "checkpoint_sha256": config.expected_checkpoint_sha256,
    }
    mismatches = {
        key: {"expected": value, "actual": actual_hashes[key]}
        for key, value in expected.items()
        if actual_hashes[key] != value
    }
    if mismatches:
        raise ValueError(f"immutable input hash mismatch: {mismatches}")

    probe = load_json(config.probe_result)
    probe_schema = probe.get("schema")
    if probe_schema not in {
        "p97-aliased-euclidean-survivor-probe-v1",
        "p97-aliased-euclidean-survivor-probe-v2-terminal-rows",
    }:
        raise ValueError("unexpected exact probe schema")
    target = probe.get("target")
    if not isinstance(target, dict):
        raise ValueError("exact probe has no target object")
    classes = target.get("alias_classes_in_order")
    if (
        not isinstance(classes, list)
        or len(classes) != config.expected_class_count
        or any(not isinstance(cls, list) or not cls for cls in classes)
    ):
        raise ValueError("invalid ordered alias classes")
    if target.get("alias_class_count") != config.expected_class_count:
        raise ValueError("alias class count mismatch")
    equations = normalize_equations(
        target.get("positive_quotient_equations"),
        expected_class_count=config.expected_class_count,
        expected_equation_count=config.expected_equation_count,
    )
    if target.get("quotient_positive_equation_count") != len(equations):
        raise ValueError("positive quotient equation count mismatch")
    if probe_schema == "p97-aliased-euclidean-survivor-probe-v2-terminal-rows":
        outer_replay = probe.get("outer_replay")
        if not isinstance(outer_replay, dict) or outer_replay.get("status") != "SAT":
            raise ValueError("terminal-row probe has no successful outer replay")
        named_positive_count = target.get("named_positive_required_row_count")
        named_false_count = target.get("named_false_required_row_count")
        if (
            not isinstance(named_positive_count, int)
            or not isinstance(named_false_count, int)
            or outer_replay.get("required_row_assignment_count")
            != named_positive_count + named_false_count
        ):
            raise ValueError("terminal required-row assignment count mismatch")

    formula = probe.get("formulas", {}).get("positive_rows", {})
    if formula.get("smt2_sha256") != config.expected_positive_smt2_sha256:
        raise ValueError("probe SMT hash ledger mismatch")
    if formula.get("assertion_counts") != {
        "gauge": 4,
        "strict_convex_support": (
            config.expected_class_count * (config.expected_class_count - 2)
        ),
        "positive_row_equalities": config.expected_equation_count,
        "false_row_disequalities": 0,
    }:
        raise ValueError("unexpected full formula assertion counts")
    probe_inputs = probe.get("inputs", {})
    if (
        probe_inputs.get("cegar_sha256")
        != config.expected_recorded_cegar_sha256
    ):
        raise ValueError("recorded cegar implementation hash mismatch")
    if probe_inputs.get("result_sha256") != config.expected_cegar_result_sha256:
        raise ValueError("probe/result hash ledger mismatch")
    if (
        probe_inputs.get("checkpoint_sha256")
        != config.expected_checkpoint_sha256
    ):
        raise ValueError("probe/checkpoint hash ledger mismatch")

    validation = {
        "status": "PASS",
        "method": (
            "fixed hash gates for exact probe/result/checkpoint/SMT plus schema, "
            "ordered-class, normalized-equation, assertion-count, and terminal "
            "row-replay checks"
        ),
        "probe_schema": probe_schema,
        "actual_hashes": actual_hashes,
        "expected_hashes": expected,
        "recorded_cegar_script_sha256": config.expected_recorded_cegar_sha256,
        "current_cegar_matches_recorded": (
            actual_hashes["cegar_script_current_sha256"]
            == config.expected_recorded_cegar_sha256
        ),
        "current_cegar_drift_policy": (
            "current implementation drift is recorded but cannot change the "
            "immutable exact-probe target"
        ),
        "alias_class_count": len(classes),
        "positive_equation_count": len(equations),
        "full_formula_status": formula.get("evidence", {}).get("status"),
        "full_formula_reason_unknown": formula.get("evidence", {}).get(
            "reason_unknown"
        ),
    }
    return probe, equations, validation


def induced_equations(
    subset: tuple[int, ...],
    equations: Iterable[SourceEquation],
) -> tuple[SourceEquation, ...]:
    vertices = frozenset(subset)
    return tuple(equation for equation in equations if equation.vertices <= vertices)


def build_problem(
    subset: tuple[int, ...],
    equations: Sequence[SourceEquation],
) -> SubsetProblem:
    if len(subset) < 3 or tuple(sorted(subset)) != subset:
        raise ValueError("subset must be an increasing tuple of at least 3 vertices")
    if len(set(subset)) != len(subset):
        raise ValueError("subset vertices must be distinct")
    local = {global_index: index for index, global_index in enumerate(subset)}
    for equation in equations:
        if not equation.vertices <= frozenset(subset):
            raise ValueError("non-induced equation supplied to subset problem")

    k = len(subset)
    x = [z3.Real(f"x_{index}") for index in range(k)]
    y = [z3.Real(f"y_{index}") for index in range(k)]
    records: list[ConstraintRecord] = []

    def add(
        name: str,
        family: str,
        expression: z3.BoolRef,
        **data: Any,
    ) -> None:
        records.append(ConstraintRecord(name, family, expression, data))

    add("gauge_x_0", "gauge", x[0] == 0, local_vertex=0, value=0)
    add("gauge_y_0", "gauge", y[0] == 0, local_vertex=0, value=0)
    add("gauge_x_1", "gauge", x[1] == 1, local_vertex=1, value=1)
    add("gauge_y_1", "gauge", y[1] == 0, local_vertex=1, value=0)

    for a in range(k):
        b = (a + 1) % k
        for c in range(k):
            if c in (a, b):
                continue
            add(
                f"orient_{a}_{b}_{c}",
                "strict_cyclic_orientation",
                orient(x, y, a, b, c) > 0,
                local_triple=[a, b, c],
                global_triple=[subset[a], subset[b], subset[c]],
            )

    for a in range(k):
        for b in range(a + 1, k):
            add(
                f"distinct_{a}_{b}",
                "pairwise_distinct",
                dist2(x, y, a, b) > 0,
                local_pair=[a, b],
                global_pair=[subset[a], subset[b]],
            )

    for equation in equations:
        left_local = tuple(local[v] for v in equation.left_edge)
        right_local = tuple(local[v] for v in equation.right_edge)
        add(
            f"eq_source_{equation.source_index}",
            "positive_row_equality",
            dist2(x, y, *left_local) == dist2(x, y, *right_local),
            source_index=equation.source_index,
            global_left_edge=list(equation.left_edge),
            global_right_edge=list(equation.right_edge),
            local_left_edge=list(left_local),
            local_right_edge=list(right_local),
        )
    return SubsetProblem(subset, tuple(equations), x, y, records)


def make_solver(timeout_ms: int) -> z3.Solver:
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    solver.set(random_seed=0)
    return solver


def model_satisfies(
    model: z3.ModelRef,
    records: Sequence[ConstraintRecord],
) -> tuple[bool, list[str]]:
    failures: list[str] = []
    for record in records:
        value = model.eval(record.expression, model_completion=True)
        if not z3.is_true(value):
            failures.append(f"{record.name}: {value}")
    return not failures, failures


def check_tracked(
    problem: SubsetProblem,
    timeout_ms: int,
) -> dict[str, Any]:
    solver = make_solver(timeout_ms)
    solver.set(unsat_core=True)
    trackers: dict[str, z3.BoolRef] = {}
    for record in problem.records:
        if record.family == "gauge":
            solver.add(record.expression)
            continue
        tracker = z3.Bool(f"track_{record.name}")
        trackers[str(tracker)] = tracker
        solver.assert_and_track(record.expression, tracker)
    started = time.monotonic()
    try:
        verdict = solver.check()
        exception_reason = None
    except z3.Z3Exception as exc:
        verdict = z3.unknown
        exception_reason = f"Z3Exception: {exc}"
    elapsed = time.monotonic() - started
    result: dict[str, Any] = {
        "solver": "Z3 Python API",
        "timeout_ms": timeout_ms,
        "elapsed_seconds": elapsed,
        "status": str(verdict).upper(),
        "fixed_background_record_names": [
            record.name
            for record in problem.records
            if record.family == "gauge"
        ],
        "assumption_tracked_kinds": [
            "strict_cyclic_orientation",
            "pairwise_distinct",
            "positive_row_equality",
        ],
    }
    if verdict == z3.sat:
        valid, failures = model_satisfies(solver.model(), problem.records)
        result["model_substitution_status"] = "PASS" if valid else "FAIL"
        result["model_substitution_failures"] = failures[:20]
        if not valid:
            result["status"] = "ERROR_INVALID_MODEL"
    elif verdict == z3.unsat:
        core_tracker_names = {str(item) for item in solver.unsat_core()}
        unknown_trackers = core_tracker_names - set(trackers)
        if unknown_trackers:
            result["status"] = "ERROR_UNKNOWN_CORE_TRACKER"
            result["unknown_core_trackers"] = sorted(unknown_trackers)
        else:
            record_names = [
                record.name
                for record in problem.records
                if f"track_{record.name}" in core_tracker_names
            ]
            result["unsat_core_record_names"] = record_names
            result["unsat_core_size"] = len(record_names)
    else:
        result["reason_unknown"] = exception_reason or solver.reason_unknown()
    return result


def check_direct_records(
    problem: SubsetProblem,
    record_names: Sequence[str],
    timeout_ms: int,
) -> dict[str, Any]:
    by_name = problem.record_by_name
    if len(set(record_names)) != len(record_names):
        raise ValueError("duplicate record name in direct check")
    missing = set(record_names) - set(by_name)
    if missing:
        raise ValueError(f"unknown record names: {sorted(missing)}")
    records = [by_name[name] for name in record_names]
    solver = make_solver(timeout_ms)
    solver.add(*(record.expression for record in records))
    started = time.monotonic()
    try:
        verdict = solver.check()
        exception_reason = None
    except z3.Z3Exception as exc:
        verdict = z3.unknown
        exception_reason = f"Z3Exception: {exc}"
    elapsed = time.monotonic() - started
    result: dict[str, Any] = {
        "solver": "Z3 Python API fresh direct assertions",
        "timeout_ms": timeout_ms,
        "elapsed_seconds": elapsed,
        "status": str(verdict).upper(),
    }
    if verdict == z3.sat:
        valid, failures = model_satisfies(solver.model(), records)
        result["model_substitution_status"] = "PASS" if valid else "FAIL"
        result["model_substitution_failures"] = failures[:20]
        if not valid:
            result["status"] = "ERROR_INVALID_MODEL"
    elif verdict == z3.unknown:
        result["reason_unknown"] = exception_reason or solver.reason_unknown()
    return result


def solver_version(command: str) -> str | None:
    executable = shutil.which(command)
    if executable is None:
        return None
    process = subprocess.run(
        [executable, "--version"],
        capture_output=True,
        text=True,
        check=False,
        timeout=10,
    )
    lines = [line.strip() for line in process.stdout.splitlines() if line.strip()]
    return lines[0] if lines else f"returncode={process.returncode}"


def parse_solver_status(stdout: str) -> str:
    statuses = [
        line.strip().upper()
        for line in stdout.splitlines()
        if line.strip().lower() in {"sat", "unsat", "unknown"}
    ]
    if len(statuses) != 1:
        return "ERROR_MALFORMED_OUTPUT"
    return statuses[0]


def classify_subprocess_status(
    stdout: str,
    stderr: str,
    returncode: int,
) -> str:
    parsed = parse_solver_status(stdout)
    if returncode == 0:
        return parsed
    if returncode == -6 or "timeout" in stderr.lower():
        return "UNKNOWN"
    return "ERROR_NONZERO_EXIT"


def run_cvc5_text(smt2_text: str, timeout_ms: int) -> dict[str, Any]:
    executable = shutil.which("cvc5")
    if executable is None:
        return {
            "solver": "cvc5",
            "status": "UNAVAILABLE",
            "fail_closed": True,
        }
    command = [
        executable,
        "--lang",
        "smt2",
        "--nl-cov",
        "--tlimit",
        str(timeout_ms),
    ]
    started = time.monotonic()
    try:
        process = subprocess.run(
            command,
            input=smt2_text,
            capture_output=True,
            text=True,
            check=False,
            timeout=timeout_ms / 1000 + 15,
        )
        elapsed = time.monotonic() - started
        status = classify_subprocess_status(
            process.stdout, process.stderr, process.returncode
        )
        return {
            "solver": "cvc5",
            "command": command,
            "timeout_ms": timeout_ms,
            "elapsed_seconds": elapsed,
            "returncode": process.returncode,
            "status": status,
            "reason_unknown": (
                "cvc5 timeout without a status line"
                if status == "UNKNOWN" and not process.stdout.strip()
                else None
            ),
            "stdout_tail": process.stdout.splitlines()[-20:],
            "stderr_tail": process.stderr.splitlines()[-20:],
            "fail_closed": True,
        }
    except subprocess.TimeoutExpired as exc:
        return {
            "solver": "cvc5",
            "command": command,
            "timeout_ms": timeout_ms,
            "elapsed_seconds": time.monotonic() - started,
            "returncode": None,
            "status": "UNKNOWN",
            "reason_unknown": "hard subprocess timeout",
            "stdout_tail": (exc.stdout or "").splitlines()[-20:]
            if isinstance(exc.stdout, str)
            else [],
            "stderr_tail": (exc.stderr or "").splitlines()[-20:]
            if isinstance(exc.stderr, str)
            else [],
            "fail_closed": True,
        }


def direct_smt2(
    problem: SubsetProblem,
    record_names: Sequence[str],
) -> str:
    by_name = problem.record_by_name
    solver = z3.SolverFor("QF_NRA")
    solver.add(*(by_name[name].expression for name in record_names))
    text = solver.to_smt2()
    if "(set-logic" not in text:
        text = "(set-logic QF_NRA)\n" + text
    if "(check-sat)" not in text:
        text += "\n(check-sat)\n"
    elif not text.endswith("\n"):
        text += "\n"
    return text


def run_solver_file(
    solver_name: str,
    path: Path,
    timeout_ms: int,
) -> dict[str, Any]:
    executable = shutil.which(solver_name)
    if executable is None:
        return {
            "solver": solver_name,
            "status": "UNAVAILABLE",
            "fail_closed": True,
        }
    if solver_name == "z3":
        command = [
            executable,
            "-smt2",
            f"-t:{timeout_ms}",
            f"-T:{max(1, math.ceil(timeout_ms / 1000))}",
            str(path),
        ]
    elif solver_name == "cvc5":
        command = [
            executable,
            "--lang",
            "smt2",
            "--nl-cov",
            "--tlimit",
            str(timeout_ms),
            str(path),
        ]
    else:
        raise ValueError(f"unsupported solver: {solver_name}")
    started = time.monotonic()
    try:
        process = subprocess.run(
            command,
            capture_output=True,
            text=True,
            check=False,
            timeout=timeout_ms / 1000 + 15,
        )
        status = classify_subprocess_status(
            process.stdout, process.stderr, process.returncode
        )
        return {
            "solver": solver_name,
            "command": command,
            "timeout_ms": timeout_ms,
            "elapsed_seconds": time.monotonic() - started,
            "returncode": process.returncode,
            "status": status,
            "reason_unknown": (
                f"{solver_name} timeout without a status line"
                if status == "UNKNOWN" and not process.stdout.strip()
                else None
            ),
            "stdout_tail": process.stdout.splitlines()[-20:],
            "stderr_tail": process.stderr.splitlines()[-20:],
            "fail_closed": True,
        }
    except subprocess.TimeoutExpired as exc:
        return {
            "solver": solver_name,
            "command": command,
            "timeout_ms": timeout_ms,
            "elapsed_seconds": time.monotonic() - started,
            "returncode": None,
            "status": "UNKNOWN",
            "reason_unknown": "hard subprocess timeout",
            "stdout_tail": (exc.stdout or "").splitlines()[-20:]
            if isinstance(exc.stdout, str)
            else [],
            "stderr_tail": (exc.stderr or "").splitlines()[-20:]
            if isinstance(exc.stderr, str)
            else [],
            "fail_closed": True,
        }


def integer_convex_witness(k: int) -> list[list[int]]:
    """Gauge-fixed affine image of the integer moment curve (t, t^2)."""
    return [[t, t * (t - 1)] for t in range(k)]


def integer_orient(
    points: Sequence[Sequence[int]],
    a: int,
    b: int,
    c: int,
) -> int:
    return (points[b][0] - points[a][0]) * (
        points[c][1] - points[a][1]
    ) - (points[b][1] - points[a][1]) * (
        points[c][0] - points[a][0]
    )


def validate_integer_witness(k: int) -> dict[str, Any]:
    points = integer_convex_witness(k)
    if points[0] != [0, 0] or points[1] != [1, 0]:
        raise AssertionError("integer witness violates gauge")
    orientations = [
        integer_orient(points, a, (a + 1) % k, c)
        for a in range(k)
        for c in range(k)
        if c not in (a, (a + 1) % k)
    ]
    squared_distances = [
        (points[a][0] - points[b][0]) ** 2
        + (points[a][1] - points[b][1]) ** 2
        for a in range(k)
        for b in range(a + 1, k)
    ]
    if min(orientations) <= 0 or min(squared_distances) <= 0:
        raise AssertionError("integer witness is not strictly convex/distinct")
    return {
        "coordinates": points,
        "minimum_integer_orientation": min(orientations),
        "minimum_squared_pair_distance": min(squared_distances),
        "classification": (
            "exact shared SAT witness for every size-k subset with zero "
            "induced equalities, since global labels do not occur elsewhere"
        ),
    }


def self_test(timeout_ms: int) -> dict[str, Any]:
    witness_checks = {str(k): validate_integer_witness(k) for k in range(4, 9)}
    if classify_subprocess_status("unsat\n", "fatal error\n", 1) != (
        "ERROR_NONZERO_EXIT"
    ):
        raise RuntimeError("nonzero solver exit was not rejected fail-closed")
    if classify_subprocess_status("", "interrupted by timeout\n", -6) != (
        "UNKNOWN"
    ):
        raise RuntimeError("solver timeout was not classified UNKNOWN")

    square_subset = (0, 1, 2, 3)
    square_problem = build_problem(square_subset, ())
    square_check = check_tracked(square_problem, timeout_ms)
    if square_check["status"] != "SAT":
        raise RuntimeError(f"known-SAT smoke test failed: {square_check}")

    impossible = SourceEquation(10_000, (0, 1), (0, 0))
    impossible_problem = build_problem(square_subset, (impossible,))
    impossible_check = check_tracked(impossible_problem, timeout_ms)
    if impossible_check["status"] != "UNSAT":
        raise RuntimeError(f"known-UNSAT smoke test failed: {impossible_check}")
    impossible_smt2 = direct_smt2(
        impossible_problem,
        [record.name for record in impossible_problem.records],
    )
    cvc5_check = run_cvc5_text(impossible_smt2, timeout_ms)
    if cvc5_check["status"] != "UNSAT":
        raise RuntimeError(f"cvc5 known-UNSAT smoke test failed: {cvc5_check}")
    return {
        "status": "PASS",
        "subprocess_fail_closed_classifier": "PASS",
        "exact_integer_convex_witnesses": witness_checks,
        "z3_known_sat_strict_quadrilateral": square_check,
        "z3_known_unsat_gauge_distance_conflict": impossible_check,
        "cvc5_known_unsat_gauge_distance_conflict": cvc5_check,
    }


def shrink_core(
    subset: tuple[int, ...],
    equations: Sequence[SourceEquation],
    seed_names: Sequence[str],
    budget: WallBudget,
    requested_timeout_ms: int,
) -> dict[str, Any]:
    problem = build_problem(subset, equations)
    record_order = [record.name for record in problem.records]
    seed_set = set(seed_names)
    if not seed_set or not seed_set <= set(record_order):
        raise ValueError("invalid UNSAT core seed")
    fixed_background = [
        record.name for record in problem.records if record.family == "gauge"
    ]
    seed_set.update(fixed_background)
    current = [name for name in record_order if name in seed_set]
    log: list[dict[str, Any]] = []
    for name in [item for item in current if item not in fixed_background]:
        trial = [candidate for candidate in current if candidate != name]
        try:
            timeout_ms = budget.timeout_ms(
                requested_timeout_ms, reserve_seconds=45.0
            )
        except TimeoutError:
            log.append(
                {
                    "removed_candidate": name,
                    "status": "SKIPPED_GLOBAL_BUDGET",
                    "kept": True,
                }
            )
            continue
        check = check_direct_records(problem, trial, timeout_ms)
        removed = check["status"] == "UNSAT"
        if removed:
            current = trial
        log.append(
            {
                "removed_candidate": name,
                "trial_size": len(trial),
                "trial_status": check["status"],
                "elapsed_seconds": check["elapsed_seconds"],
                "removed": removed,
                "fail_closed_policy": (
                    "remove only on exact Z3 UNSAT; SAT/UNKNOWN/error retains "
                    "the constraint"
                ),
            }
        )

    final_check = check_direct_records(
        problem,
        current,
        budget.timeout_ms(requested_timeout_ms, reserve_seconds=35.0),
    )
    irredundancy_checks = [
        entry
        for entry in log
        if entry.get("removed_candidate") in current
    ]
    subset_minimal = (
        final_check["status"] == "UNSAT"
        and all(
            entry.get("trial_status") == "SAT"
            for entry in irredundancy_checks
        )
    )
    return {
        "seed_size": len(seed_set),
        "seed_record_names": list(seed_names),
        "fixed_background_record_names": fixed_background,
        "method": (
            "one-pass monotone deletion over fresh direct Z3 solvers, with "
            "the sound coordinate gauge fixed as background"
        ),
        "log": log,
        "final_record_names": current,
        "final_size": len(current),
        "final_check": final_check,
        "subset_minimal_by_decisive_deletion_checks": subset_minimal,
        "note": (
            "Subset-minimality is relative to the fixed sound gauge. If any "
            "deletion trial is UNKNOWN it is retained, so the core remains "
            "sound but is not called subset-minimal."
        ),
    }


def validate_core(
    subset: tuple[int, ...],
    equations: Sequence[SourceEquation],
    shrink: dict[str, Any],
    core_smt2_path: Path,
    z3_output_path: Path,
    cvc5_output_path: Path,
    budget: WallBudget,
    requested_timeout_ms: int,
) -> dict[str, Any]:
    final_names = shrink["final_record_names"]
    reconstructed = build_problem(subset, equations)
    records = reconstructed.record_by_name
    canonical_records = [records[name].as_json() for name in final_names]
    canonical_sha = sha256_text(
        json.dumps(canonical_records, sort_keys=True, separators=(",", ":"))
    )
    smt2_text = direct_smt2(reconstructed, final_names)
    core_smt2_path.write_text(smt2_text)

    z3_timeout_ms = budget.timeout_ms(
        requested_timeout_ms, reserve_seconds=20.0
    )
    z3_replay = run_solver_file("z3", core_smt2_path, z3_timeout_ms)
    z3_output_path.write_text(
        "\n".join(z3_replay.get("stdout_tail", []))
        + ("\n" if z3_replay.get("stdout_tail") else "")
    )
    cvc5_timeout_ms = budget.timeout_ms(
        requested_timeout_ms, reserve_seconds=5.0
    )
    cvc5_replay = run_solver_file("cvc5", core_smt2_path, cvc5_timeout_ms)
    cvc5_output_path.write_text(
        "\n".join(cvc5_replay.get("stdout_tail", []))
        + ("\n" if cvc5_replay.get("stdout_tail") else "")
    )
    status = (
        "VALIDATED_EXACT_UNSAT"
        if (
            shrink["final_check"]["status"] == "UNSAT"
            and z3_replay["status"] == "UNSAT"
            and cvc5_replay["status"] == "UNSAT"
        )
        else "UNCONFIRMED_FAIL_CLOSED"
    )
    return {
        "status": status,
        "declarative_reconstruction": {
            "status": "PASS",
            "scope": (
                "fresh rebuild from declarative records through the same "
                "build_problem implementation; engine independence is supplied "
                "by the separate cvc5 replay"
            ),
            "canonical_constraint_records_sha256": canonical_sha,
            "constraint_count": len(canonical_records),
        },
        "core_smt2": str(core_smt2_path),
        "core_smt2_sha256": sha256(core_smt2_path),
        "z3_fresh_cli_replay": z3_replay,
        "z3_output": str(z3_output_path),
        "z3_output_sha256": sha256(z3_output_path),
        "cvc5_independent_engine_replay": cvc5_replay,
        "cvc5_output": str(cvc5_output_path),
        "cvc5_output_sha256": sha256(cvc5_output_path),
        "trusted_computation_warning": (
            "Z3 and cvc5 agree on an exact QF_NRA formula, but neither result "
            "is a kernel-checked proof certificate."
        ),
    }


def candidate_rows(
    k: int,
    equations: Sequence[SourceEquation],
    class_count: int,
) -> tuple[
    list[tuple[tuple[int, ...], tuple[SourceEquation, ...]]],
    dict[int, int],
]:
    rows = [
        (subset, induced_equations(subset, equations))
        for subset in itertools.combinations(range(class_count), k)
    ]
    histogram = Counter(len(induced) for _, induced in rows)
    rows.sort(key=lambda row: (-len(row[1]), row[0]))
    return rows, dict(sorted(histogram.items()))


def enumerate_subsets(
    equations: Sequence[SourceEquation],
    *,
    class_count: int,
    min_vertices: int,
    max_vertices: int,
    per_query_ms: int,
    core_query_ms: int,
    budget: WallBudget,
    core_smt2_path: Path,
    z3_output_path: Path,
    cvc5_output_path: Path,
) -> tuple[list[dict[str, Any]], dict[str, Any] | None, list[dict[str, Any]]]:
    summaries: list[dict[str, Any]] = []
    unconfirmed_unsat: list[dict[str, Any]] = []
    validated_core: dict[str, Any] | None = None
    exact_witnesses = {
        k: validate_integer_witness(k)
        for k in range(min_vertices, max_vertices + 1)
    }

    for k in range(min_vertices, max_vertices + 1):
        rows, histogram = candidate_rows(k, equations, class_count)
        zero_count = histogram.get(0, 0)
        summary: dict[str, Any] = {
            "vertex_count": k,
            "total_induced_subsets": len(rows),
            "induced_equality_count_histogram": {
                str(key): value for key, value in histogram.items()
            },
            "ordering": (
                "descending induced equality count, then lexicographic subset"
            ),
            "zero_equality_subsets": {
                "count": zero_count,
                "status": "SAT_BY_SHARED_EXACT_INTEGER_WITNESS",
                "witness": exact_witnesses[k],
            },
            "solver_checked_nonempty_subsets": 0,
            "solver_status_counts": {},
            "fully_enumerated": False,
            "fully_resolved": False,
            "stopping_reason": None,
            "checked_examples": [],
        }
        status_counts: Counter[str] = Counter()

        for subset, induced in rows:
            if not induced:
                continue
            if budget.remaining() <= 75.0:
                summary["stopping_reason"] = "GLOBAL_BUDGET_RESERVED_FOR_REPORT"
                break
            problem = build_problem(subset, induced)
            timeout_ms = budget.timeout_ms(
                per_query_ms, reserve_seconds=70.0
            )
            all_names = [record.name for record in problem.records]
            check = check_direct_records(problem, all_names, timeout_ms)
            status = check["status"]
            status_counts[status] += 1
            summary["solver_checked_nonempty_subsets"] += 1
            example = {
                "subset": list(subset),
                "induced_equation_count": len(induced),
                "induced_source_equation_indices": [
                    equation.source_index for equation in induced
                ],
                "status": status,
                "elapsed_seconds": check["elapsed_seconds"],
            }
            if len(summary["checked_examples"]) < 20:
                summary["checked_examples"].append(example)

            if status == "UNSAT":
                tracked_timeout_ms = budget.timeout_ms(
                    core_query_ms, reserve_seconds=60.0
                )
                tracked_check = check_tracked(problem, tracked_timeout_ms)
                if tracked_check["status"] != "UNSAT":
                    # Assumption tracking can be dramatically harder for QF_NRA
                    # than the same direct conjunction.  It is needed only to
                    # obtain a small seed for deletion shrinking, not for
                    # soundness: the complete declarative conjunction can still
                    # be reconstructed and independently replayed as-is.
                    try:
                        shrink = shrink_core(
                            subset,
                            induced,
                            all_names,
                            budget,
                            core_query_ms,
                        )
                        validation = validate_core(
                            subset,
                            induced,
                            shrink,
                            core_smt2_path,
                            z3_output_path,
                            cvc5_output_path,
                            budget,
                            core_query_ms,
                        )
                    except (RuntimeError, TimeoutError, ValueError) as exc:
                        shrink = {
                            "seed_size": len(all_names),
                            "seed_record_names": all_names,
                            "fixed_background_record_names": [
                                name
                                for name in all_names
                                if name.startswith("gauge_")
                            ],
                            "method": (
                                "complete declarative seed; direct deletion "
                                "shrinking failed closed"
                            ),
                            "log": [],
                            "final_record_names": all_names,
                            "final_size": len(all_names),
                            "final_check": check,
                            "subset_minimal_by_decisive_deletion_checks": False,
                            "note": f"{type(exc).__name__}: {exc}",
                        }
                        validation = {
                            "status": "UNCONFIRMED_FAIL_CLOSED",
                            "error": f"{type(exc).__name__}: {exc}",
                        }
                    candidate = {
                        "subset": list(subset),
                        "global_alias_classes": None,
                        "induced_equations": [
                            equation.as_json() for equation in induced
                        ],
                        "problem_constraint_counts": problem.counts(),
                        "direct_seed_check": check,
                        "tracked_seed_check": tracked_check,
                        "shrink": shrink,
                        "validation": validation,
                    }
                    if validation["status"] == "VALIDATED_EXACT_UNSAT":
                        validated_core = candidate
                        summary["stopping_reason"] = (
                            "VALIDATED_EXACT_UNSAT_COMPLETE_SEED_FOUND"
                        )
                        break
                    candidate["classification"] = (
                        "UNCONFIRMED_FAIL_CLOSED: direct exact UNSAT but neither "
                        "tracked shrinking nor complete cross-engine replay "
                        "validated the candidate"
                    )
                    unconfirmed_unsat.append(candidate)
                    continue
                seed_names = tracked_check.get(
                    "unsat_core_record_names", []
                )
                try:
                    shrink = shrink_core(
                        subset,
                        induced,
                        seed_names,
                        budget,
                        core_query_ms,
                    )
                    validation = validate_core(
                        subset,
                        induced,
                        shrink,
                        core_smt2_path,
                        z3_output_path,
                        cvc5_output_path,
                        budget,
                        core_query_ms,
                    )
                except (RuntimeError, TimeoutError, ValueError) as exc:
                    shrink = {
                        "status": "ERROR_FAIL_CLOSED",
                        "error": f"{type(exc).__name__}: {exc}",
                    }
                    validation = {
                        "status": "UNCONFIRMED_FAIL_CLOSED",
                        "error": f"{type(exc).__name__}: {exc}",
                    }
                candidate = {
                    "subset": list(subset),
                    "global_alias_classes": None,
                    "induced_equations": [
                        equation.as_json() for equation in induced
                    ],
                    "problem_constraint_counts": problem.counts(),
                    "direct_seed_check": check,
                    "tracked_seed_check": tracked_check,
                    "shrink": shrink,
                    "validation": validation,
                }
                if validation["status"] == "VALIDATED_EXACT_UNSAT":
                    validated_core = candidate
                    summary["stopping_reason"] = (
                        "VALIDATED_EXACT_UNSAT_CORE_FOUND"
                    )
                    break
                unconfirmed_unsat.append(candidate)
            elif status == "UNKNOWN":
                smt2 = direct_smt2(
                    problem, [record.name for record in problem.records]
                )
                cvc5_timeout = budget.timeout_ms(
                    per_query_ms, reserve_seconds=70.0
                )
                cvc5_check = run_cvc5_text(smt2, cvc5_timeout)
                example["cvc5_fallback"] = cvc5_check
                status_counts[f"CVC5_{cvc5_check['status']}"] += 1
                if cvc5_check["status"] == "UNSAT":
                    unconfirmed_unsat.append(
                        {
                            "subset": list(subset),
                            "induced_equations": [
                                equation.as_json() for equation in induced
                            ],
                            "z3_status": "UNKNOWN",
                            "cvc5_status": "UNSAT",
                            "classification": (
                                "UNCONFIRMED_FAIL_CLOSED: no tracked Z3 core "
                                "available for shrink/replay"
                            ),
                        }
                    )

        nonempty_total = len(rows) - zero_count
        checked = summary["solver_checked_nonempty_subsets"]
        summary["solver_status_counts"] = dict(sorted(status_counts.items()))
        if validated_core is not None:
            summary["fully_enumerated"] = checked == nonempty_total
            summary["fully_resolved"] = False
        elif checked == nonempty_total:
            summary["fully_enumerated"] = True
            summary["fully_resolved"] = not any(
                key.startswith("UNKNOWN") or key.startswith("ERROR")
                for key in status_counts
            )
            summary["stopping_reason"] = "SIZE_EXHAUSTED"
        summaries.append(summary)
        if validated_core is not None or summary["stopping_reason"] != "SIZE_EXHAUSTED":
            break

    return summaries, validated_core, unconfirmed_unsat


def core_with_alias_classes(
    core: dict[str, Any],
    classes: Sequence[Sequence[str]],
) -> dict[str, Any]:
    enriched = dict(core)
    enriched["global_alias_classes"] = [
        {"quotient_index": index, "members": list(classes[index])}
        for index in core["subset"]
    ]
    final_names = core.get("shrink", {}).get("final_record_names", [])
    problem = build_problem(
        tuple(core["subset"]),
        tuple(
            SourceEquation(
                equation["source_index"],
                tuple(equation["left_edge"]),
                tuple(equation["right_edge"]),
            )
            for equation in core["induced_equations"]
        ),
    )
    enriched["minimized_constraint_records"] = [
        problem.record_by_name[name].as_json() for name in final_names
    ]
    return enriched


def make_report(payload: dict[str, Any]) -> str:
    class_count = payload["target"]["quotient_class_count"]
    equation_count = payload["target"]["positive_equation_count"]
    lines = [
        "# Exact small-subset Euclidean core mining",
        "",
        f"- Terminal status: `{payload['terminal_status']}`",
        f"- Epistemic status: `{payload['epistemic_status']}`",
        f"- Elapsed: {payload['elapsed_seconds']:.6f} seconds",
        (
            f"- Target: {class_count} ordered quotient classes, "
            f"{equation_count} explicit recorded "
            "positive-row squared-distance equalities (not claimed "
            "algebraically independent)."
        ),
        (
            "- Encoding: exact R^2 coordinates, sound consecutive-vertex "
            "gauge, pairwise distinctness, and every induced boundary edge "
            "strictly supporting every other induced vertex."
        ),
        "",
        "## Search census",
        "",
    ]
    for summary in payload["search"]["sizes"]:
        counts = summary["solver_status_counts"]
        lines.extend(
            [
                (
                    f"- k={summary['vertex_count']}: "
                    f"{summary['total_induced_subsets']} total; "
                    f"{summary['zero_equality_subsets']['count']} exact-witness "
                    f"zero-equality SAT; "
                    f"{summary['solver_checked_nonempty_subsets']} solver-checked; "
                    f"statuses={json.dumps(counts, sort_keys=True)}; "
                    f"fully_enumerated={summary['fully_enumerated']}; "
                    f"stopping={summary['stopping_reason']}."
                )
            ]
        )

    core = payload.get("validated_core")
    if core is not None:
        lines.extend(
            [
                "",
                "## Validated exact UNSAT core",
                "",
                f"- Induced quotient subset: `{core['subset']}`",
                (
                    "- Alias classes: `"
                    + json.dumps(core["global_alias_classes"], sort_keys=True)
                    + "`"
                ),
                (
                    f"- Induced source equalities: "
                    f"{len(core['induced_equations'])}; tracked Z3 seed core: "
                    f"{core['shrink']['seed_size']}; minimized core: "
                    f"{core['shrink']['final_size']} constraints."
                ),
                (
                    "- Final minimized record names: `"
                    + json.dumps(core["shrink"]["final_record_names"])
                    + "`"
                ),
                (
                    "- Shrink subset-minimal relative to the fixed sound gauge "
                    "under decisive deletion checks: "
                    f"`{core['shrink']['subset_minimal_by_decisive_deletion_checks']}`"
                ),
                (
                    "- Fresh Z3 CLI replay: `"
                    + core["validation"]["z3_fresh_cli_replay"]["status"]
                    + "`; independent cvc5 replay: `"
                    + core["validation"]["cvc5_independent_engine_replay"][
                        "status"
                    ]
                    + "`."
                ),
                (
                    f"- Core SMT-LIB SHA256: "
                    f"`{core['validation']['core_smt2_sha256']}`"
                ),
                "",
                "The core records, global/local edge maps, shrink trace, and "
                "solver commands are in the JSON artifact.",
            ]
        )
    else:
        lines.extend(
            [
                "",
                "## No validated core",
                "",
                "No candidate passed tracked UNSAT, shrinking, fresh Z3 replay, "
                "and independent cvc5 replay inside the wall-clock budget. "
                "UNKNOWN and timeout cases remain no verdict.",
            ]
        )

    lines.extend(
        [
            "",
            "## Trust boundary",
            "",
            payload["trust_warning"],
            "",
            payload["cayley_menger_note"],
            "",
        ]
    )
    return "\n".join(lines)


def sha256_argument(value: str) -> str:
    normalized = value.lower()
    if len(normalized) != 64:
        raise argparse.ArgumentTypeError("expected exactly 64 hexadecimal digits")
    try:
        int(normalized, 16)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(
            "expected exactly 64 hexadecimal digits"
        ) from exc
    return normalized


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--probe-result",
        type=Path,
        default=DEFAULT_PROBE_RESULT,
        help="exact survivor-probe JSON artifact",
    )
    parser.add_argument(
        "--positive-smt2",
        type=Path,
        default=DEFAULT_POSITIVE_SMT2,
        help="positive-row SMT-LIB artifact named by the probe",
    )
    parser.add_argument(
        "--cegar-result",
        type=Path,
        default=DEFAULT_CEGAR_RESULT,
        help="CEGAR result JSON artifact named by the probe",
    )
    parser.add_argument(
        "--checkpoint",
        type=Path,
        default=DEFAULT_CHECKPOINT,
        help="CEGAR checkpoint JSON artifact named by the probe",
    )
    parser.add_argument(
        "--cegar-script",
        type=Path,
        default=DEFAULT_CEGAR_SCRIPT,
        help=(
            "current CEGAR implementation (its drift from the recorded digest "
            "is reported, while the recorded digest remains hash-gated)"
        ),
    )
    parser.add_argument(
        "--expected-probe-sha256",
        type=sha256_argument,
        default=DEFAULT_EXPECTED_PROBE_SHA256,
    )
    parser.add_argument(
        "--expected-positive-smt2-sha256",
        type=sha256_argument,
        default=DEFAULT_EXPECTED_POSITIVE_SMT2_SHA256,
    )
    parser.add_argument(
        "--expected-cegar-result-sha256",
        type=sha256_argument,
        default=DEFAULT_EXPECTED_CEGAR_RESULT_SHA256,
    )
    parser.add_argument(
        "--expected-checkpoint-sha256",
        type=sha256_argument,
        default=DEFAULT_EXPECTED_CHECKPOINT_SHA256,
    )
    parser.add_argument(
        "--expected-recorded-cegar-sha256",
        type=sha256_argument,
        default=DEFAULT_EXPECTED_RECORDED_CEGAR_SHA256,
        help="CEGAR implementation digest recorded inside the probe ledger",
    )
    parser.add_argument(
        "--expected-class-count",
        type=int,
        default=DEFAULT_EXPECTED_CLASS_COUNT,
    )
    parser.add_argument(
        "--expected-equation-count",
        type=int,
        default=DEFAULT_EXPECTED_EQUATION_COUNT,
    )
    parser.add_argument("--timeout-seconds", type=float, default=480.0)
    parser.add_argument("--per-query-ms", type=int, default=1000)
    parser.add_argument("--core-query-ms", type=int, default=30_000)
    parser.add_argument("--min-vertices", type=int, default=4)
    parser.add_argument(
        "--max-vertices",
        type=int,
        default=None,
        help="largest subset size (default: min(8, expected-class-count))",
    )
    parser.add_argument(
        "--output-json",
        type=Path,
        default=HERE
        / "exact-euclidean-subset-core-v9-local-robust-new.json",
    )
    parser.add_argument(
        "--output-report",
        type=Path,
        default=HERE
        / "exact-euclidean-subset-core-v9-local-robust-new-report.md",
    )
    parser.add_argument(
        "--core-smt2",
        type=Path,
        default=HERE
        / "exact-euclidean-subset-core-v9-local-robust-new.smt2",
    )
    parser.add_argument(
        "--z3-output",
        type=Path,
        default=HERE
        / "exact-euclidean-subset-core-v9-local-robust-new.z3-output.txt",
    )
    parser.add_argument(
        "--cvc5-output",
        type=Path,
        default=HERE
        / "exact-euclidean-subset-core-v9-local-robust-new.cvc5-output.txt",
    )
    parser.add_argument(
        "--validate-only",
        action="store_true",
        help=(
            "validate all source hashes, ledger metadata, structural counts, "
            "and solver smoke tests without mining or writing artifacts"
        ),
    )
    args = parser.parse_args()
    if args.per_query_ms <= 0 or args.core_query_ms <= 0:
        parser.error("query timeouts must be positive")
    if args.min_vertices < 4:
        parser.error("--min-vertices must be at least 4")
    if args.expected_class_count < 4:
        parser.error("--expected-class-count must be at least 4")
    if args.expected_equation_count < 0:
        parser.error("--expected-equation-count must be nonnegative")
    if args.max_vertices is None:
        args.max_vertices = min(8, args.expected_class_count)
    if (
        args.max_vertices < args.min_vertices
        or args.max_vertices > 8
        or args.max_vertices > args.expected_class_count
    ):
        parser.error(
            "--max-vertices must lie between min-vertices and both 8 and "
            "expected-class-count"
        )
    if args.timeout_seconds <= 0 or args.timeout_seconds > MAX_WALL_SECONDS:
        parser.error(
            f"--timeout-seconds must lie in (0, {MAX_WALL_SECONDS}]"
        )
    return args


def source_config_from_args(args: argparse.Namespace) -> SourceConfig:
    return SourceConfig(
        probe_result=args.probe_result,
        positive_smt2=args.positive_smt2,
        cegar_result=args.cegar_result,
        checkpoint=args.checkpoint,
        cegar_script=args.cegar_script,
        expected_probe_sha256=args.expected_probe_sha256,
        expected_positive_smt2_sha256=args.expected_positive_smt2_sha256,
        expected_cegar_result_sha256=args.expected_cegar_result_sha256,
        expected_checkpoint_sha256=args.expected_checkpoint_sha256,
        expected_recorded_cegar_sha256=args.expected_recorded_cegar_sha256,
        expected_class_count=args.expected_class_count,
        expected_equation_count=args.expected_equation_count,
    )


def main() -> int:
    args = parse_args()
    source = source_config_from_args(args)
    budget = WallBudget.start(args.timeout_seconds)
    probe, equations, source_validation = validate_source(source)
    smoke_timeout = min(args.core_query_ms, 10_000)
    smoke = self_test(smoke_timeout)
    if args.validate_only:
        print(
            json.dumps(
                {
                    "status": "PASS",
                    "source_validation": source_validation,
                    "self_test": smoke,
                },
                sort_keys=True,
            )
        )
        return 0
    sizes, core, unconfirmed = enumerate_subsets(
        equations,
        class_count=source.expected_class_count,
        min_vertices=args.min_vertices,
        max_vertices=args.max_vertices,
        per_query_ms=args.per_query_ms,
        core_query_ms=args.core_query_ms,
        budget=budget,
        core_smt2_path=args.core_smt2,
        z3_output_path=args.z3_output,
        cvc5_output_path=args.cvc5_output,
    )
    if core is not None:
        core = core_with_alias_classes(
            core, probe["target"]["alias_classes_in_order"]
        )
        terminal_status = "EXACT_UNSAT_CORE_FOUND"
        reason = (
            "A tracked exact QF_NRA contradiction was shrunk, reconstructed, "
            "and independently replayed UNSAT by fresh Z3 and cvc5 processes."
        )
    else:
        unresolved = any(
            not summary["fully_resolved"] for summary in sizes
        ) or bool(unconfirmed)
        terminal_status = (
            "UNKNOWN_NO_VALIDATED_CORE"
            if unresolved
            else "NONE_FOUND_IN_EXHAUSTED_RANGE"
        )
        reason = (
            "No exact core passed all fail-closed validation gates within the "
            "enumerated range and wall-clock budget."
        )

    payload: dict[str, Any] = {
        "schema": "p97-exact-euclidean-subset-core-miner-v1",
        "terminal_status": terminal_status,
        "epistemic_status": "TRUSTED_EXACT_SOLVER_EVIDENCE_ONLY",
        "reason": reason,
        "elapsed_seconds": budget.elapsed(),
        "configuration": {
            "timeout_seconds": args.timeout_seconds,
            "hard_max_wall_seconds": MAX_WALL_SECONDS,
            "per_query_ms": args.per_query_ms,
            "core_query_ms": args.core_query_ms,
            "min_vertices": args.min_vertices,
            "max_vertices": args.max_vertices,
            "deterministic_enumeration": (
                "size ascending; within size, induced equality count descending "
                "then quotient tuple lexicographic"
            ),
        },
        "runtime": {
            "python": sys.version.split()[0],
            "z3_python": z3.get_version_string(),
            "z3_binary": solver_version("z3"),
            "cvc5_binary": solver_version("cvc5"),
        },
        "inputs": {
            "exact_probe_result": str(source.probe_result),
            "exact_probe_result_sha256": sha256(source.probe_result),
            "exact_positive_rows_smt2": str(source.positive_smt2),
            "exact_positive_rows_smt2_sha256": sha256(source.positive_smt2),
            "cegar_result": str(source.cegar_result),
            "cegar_result_sha256": sha256(source.cegar_result),
            "checkpoint": str(source.checkpoint),
            "checkpoint_sha256": sha256(source.checkpoint),
            "cegar_script": str(source.cegar_script),
            "cegar_script_current_sha256": sha256(source.cegar_script),
            "cegar_script_recorded_sha256": (
                source.expected_recorded_cegar_sha256
            ),
            "miner_script": str(Path(__file__).resolve()),
            "miner_script_sha256": sha256(Path(__file__).resolve()),
        },
        "source_validation": source_validation,
        "self_test": smoke,
        "target": {
            "quotient_class_count": source.expected_class_count,
            "positive_equation_count": len(equations),
            "positive_equation_independence_warning": (
                f"The {len(equations)} source rows are explicit recorded "
                "equalities; no algebraic independence claim is made."
            ),
            "ordered_alias_classes": probe["target"]["alias_classes_in_order"],
            "equations": [equation.as_json() for equation in equations],
            "subset_semantics": (
                "retain exactly the recorded positive-row equalities whose "
                "endpoints all lie in the induced cyclic subset"
            ),
            "strict_convexity_semantics": (
                "each directed consecutive induced edge strictly supports every "
                "other induced vertex on its left"
            ),
            "gauge_soundness": (
                "the first two induced vertices are consecutive and distinct; "
                "translation, orientation-preserving rotation, and positive "
                "scaling send them to (0,0),(1,0) while preserving homogeneous "
                "distance equalities and orientation signs"
            ),
        },
        "search": {
            "sizes": sizes,
            "unconfirmed_unsat_candidates": unconfirmed,
            "reached_vertex_sizes": [
                summary["vertex_count"] for summary in sizes
            ],
            "higher_sizes_not_run_reason": (
                "a validated size-"
                f"{len(core['subset'])} core was found, so larger sizes were "
                "unnecessary"
                if core is not None
                else "wall-clock/range termination"
            ),
        },
        "validated_core": core,
        "encoded_omitted_ledger": {
            "encoded": [
                "the selected induced quotient vertices in recorded cyclic order",
                "all recorded positive-row squared-distance equalities supported entirely on the subset",
                "exact R^2 coordinates",
                "sound translation/rotation/positive-scale gauge",
                "pairwise distinctness",
                "strict left support for every induced boundary edge and every other induced vertex",
            ],
            "omitted": [
                "all quotient vertices outside the selected subset",
                "positive-row equalities touching an omitted vertex",
                "recorded false-row disequalities",
                "the outer combinatorial constraints beyond the immutable selected row/equality ledger",
            ],
            "soundness_for_full_formula": (
                "Any realization of the full "
                f"{source.expected_class_count}-point positive-row formula "
                "restricts to every encoded induced subset. Therefore a "
                "validated UNSAT induced subset refutes that full recorded "
                "positive-row formula, despite the listed omissions."
            ),
        },
        "cayley_menger_note": (
            "Exact R^2 coordinates automatically imply the planar four-point "
            "Cayley-Menger determinant identities. "
            + (
                "Direct coordinate solving produced a validated core at size "
                f"{len(core['subset'])}, so a separate distance-only "
                "determinant fallback was unnecessary."
                if core is not None
                else (
                    "Direct coordinate solving was used throughout the "
                    "requested range; no separate distance-only determinant "
                    "fallback was activated."
                )
            )
        ),
        "trust_warning": (
            "This is exact QF_NRA solver evidence with independent Z3/cvc5 "
            "agreement and explicit formula replay, not a proof certificate "
            "checked by Lean or another kernel. The selected "
            f"{len(equations)} equalities are truth values from the "
            "hash-pinned survivor model, not universal "
            "consequences of the quotient/order constraints. UNKNOWN and "
            "timeouts are always no verdict."
        ),
    }
    payload["elapsed_seconds"] = budget.elapsed()
    strict_json_dump(payload, args.output_json)
    args.output_report.write_text(make_report(payload))
    print(
        json.dumps(
            {
                "terminal_status": terminal_status,
                "elapsed_seconds": payload["elapsed_seconds"],
                "output_json": str(args.output_json),
                "output_report": str(args.output_report),
                "core_smt2": (
                    str(args.core_smt2) if core is not None else None
                ),
                "core_subset": core["subset"] if core is not None else None,
                "core_size": (
                    core["shrink"]["final_size"] if core is not None else None
                ),
            },
            sort_keys=True,
        )
    )
    return 0 if core is not None else 2


if __name__ == "__main__":
    raise SystemExit(main())
