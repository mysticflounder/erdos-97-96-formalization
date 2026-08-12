#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Mine unit equality ideals from saved core-free SAT assignments.

Each normalized ``MetricRow`` contributes three squared-distance equalities.
Coordinates are gauge-fixed at label 0 = (0, 0) and label 1 = (1, 0), and
Singular computes a standard basis over QQ.  ``UNIT`` means exactly that 1 is
in this gauge-fixed equality ideal.  ``NONUNIT`` means only that the equality
ideal is proper; it is not a claim of real, distinct, convex, or exact-row
realizability.

The smoke gates run before the saved assignments: ``<z, z - 1>`` must be unit
and ``<z^2 - 1>`` must be nonunit.  For every selected unit packet, a
deterministic greedy pass removes normalized rows whenever the smaller system
is still confirmed ``UNIT``.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import sys
from collections import Counter
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Protocol

from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _normalize_assignment,
)
from census.global_confinement.piqd_singular_backend import (
    PiqdSingularCustodyError,
    PiqdSingularRunner,
)

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
DEFAULT_INPUT = HERE / "surplus_source_metric_core_results_n11_12.json"
DEFAULT_OUT = HERE / "equality_ideal_results_n11_12.json"
DEFAULT_PIQD_DATA_ROOT = HERE / "equality_ideal_piqd_artifacts_n11_12"
INPUT_SCHEMAS = frozenset(
    {
        "p97-global-confinement-surplus-source-metric-core-v4",
        "p97-global-confinement-surplus-source-metric-core-v5",
        "p97-global-confinement-surplus-source-metric-core-v6",
    }
)
SCHEMA = "p97-global-confinement-equality-ideal-v1"
VERDICTS = ("UNIT", "NONUNIT", "TIMEOUT", "ERROR")
VERDICT_BEGIN = "P97_EQUALITY_IDEAL_VERDICT_BEGIN"
VERDICT_END = "P97_EQUALITY_IDEAL_VERDICT_END"
CONTEXT_FIELDS = (
    "n",
    "profile",
    "type",
    "pin_source",
    "deleted",
    "blocker",
    "dangerous",
)
QUERY_CONTEXT_SCHEMA = "p97-global-confinement-equality-ideal-query-v1"
CALLER_OUTPUT_SUBROOT = "equality-ideal-probe-v1"
PIQD_PROJECT = "erdos-97-96-formalization/equality-ideal"
PIQD_SOURCE = "census/global_confinement/equality_ideal_probe.py"


@dataclass(frozen=True)
class SingularQueryContext:
    source: str
    project: str
    request_id: str
    timeout_s: int
    output_directory: Path
    source_context: Mapping[str, object]


class SingularExecution(Protocol):
    run_id: str
    run_status: str
    exit_code: int | None
    stdout: bytes | None
    stderr: bytes | None
    script_path: Path
    stdout_path: Path | None
    stderr_path: Path | None
    receipt_path: Path
    manifest_path: Path
    request_sha256: str
    result_sha256: str
    script_sha256: str
    stdout_sha256: str | None
    stderr_sha256: str | None
    source_context_sha256: str
    receipt_sha256: str
    artifact_sha256: str
    replayed: bool


class SingularExecutionRunner(Protocol):
    def execute(
        self,
        script: bytes,
        *,
        source: str,
        project: str,
        request_id: str,
        timeout_s: int,
        output_directory: Path,
        source_context: Mapping[str, object],
    ) -> SingularExecution: ...


@dataclass(frozen=True)
class _LocalExecution:
    run_id: str
    run_status: str
    exit_code: int | None
    stdout: bytes | None
    stderr: bytes | None
    script_path: Path
    stdout_path: Path | None
    stderr_path: Path | None
    receipt_path: Path
    manifest_path: Path
    request_sha256: str
    result_sha256: str
    script_sha256: str
    stdout_sha256: str | None
    stderr_sha256: str | None
    source_context_sha256: str
    receipt_sha256: str
    artifact_sha256: str
    replayed: bool = False


class LegacyLocalSingularRunner:
    """Explicit compatibility backend; never selected as a PIQD fallback."""

    def __init__(self, executable: str = "Singular") -> None:
        self.executable = executable

    def execute(
        self,
        script: bytes,
        *,
        source: str,
        project: str,
        request_id: str,
        timeout_s: int,
        output_directory: Path,
        source_context: Mapping[str, object],
    ) -> _LocalExecution:
        del source, project, output_directory
        script_sha256 = hashlib.sha256(script).hexdigest()
        source_context_sha256 = _sha256(_canonical_json(source_context))
        empty = Path("")
        try:
            process = subprocess.run(
                [self.executable, "-q"],
                input=script,
                capture_output=True,
                timeout=timeout_s,
                check=False,
            )
        except subprocess.TimeoutExpired as error:
            return _LocalExecution(
                request_id,
                "TIMED_OUT",
                None,
                error.stdout,
                error.stderr,
                empty,
                None,
                None,
                empty,
                empty,
                source_context_sha256,
                source_context_sha256,
                script_sha256,
                None,
                None,
                source_context_sha256,
                script_sha256,
                script_sha256,
            )
        except OSError as error:
            message = f"{type(error).__name__}: {error}".encode()
            return _LocalExecution(
                request_id,
                "ERRORED",
                None,
                None,
                message,
                empty,
                None,
                None,
                empty,
                empty,
                script_sha256,
                hashlib.sha256(message).hexdigest(),
                script_sha256,
                None,
                hashlib.sha256(message).hexdigest(),
                source_context_sha256,
                script_sha256,
                script_sha256,
            )
        stdout = process.stdout
        stderr = process.stderr
        return _LocalExecution(
            request_id,
            "RAN" if process.returncode == 0 else "ERRORED",
            process.returncode,
            stdout,
            stderr,
            empty,
            None,
            None,
            empty,
            empty,
            source_context_sha256,
            hashlib.sha256(stdout + stderr).hexdigest(),
            script_sha256,
            hashlib.sha256(stdout).hexdigest(),
            hashlib.sha256(stderr).hexdigest(),
            source_context_sha256,
            script_sha256,
            script_sha256,
        )


@dataclass(frozen=True)
class OracleResult:
    verdict: str
    detail: str | None = None
    returncode: int | None = None
    execution: Mapping[str, Any] | None = None

    def __post_init__(self) -> None:
        if self.verdict not in VERDICTS:
            raise ValueError(f"unknown equality-ideal verdict {self.verdict!r}")

    def as_dict(self) -> dict[str, Any]:
        result: dict[str, Any] = {"verdict": self.verdict}
        if self.detail is not None:
            result["detail"] = self.detail
        if self.returncode is not None:
            result["returncode"] = self.returncode
        if self.execution is not None:
            result["execution"] = dict(self.execution)
        return result


@dataclass(frozen=True)
class GreedyAttempt:
    original_index: int
    row: MetricRow
    result: OracleResult
    removed: bool

    def as_dict(self) -> dict[str, Any]:
        return {
            "original_index": self.original_index,
            "row": self.row.as_dict(),
            "removed": self.removed,
            **self.result.as_dict(),
        }


@dataclass(frozen=True)
class GreedyResult:
    rows: tuple[MetricRow, ...]
    attempts: tuple[GreedyAttempt, ...]

    @property
    def complete(self) -> bool:
        return all(
            attempt.result.verdict in {"UNIT", "NONUNIT"}
            for attempt in self.attempts
        )

    @property
    def confirmed_row_irredundant(self) -> bool:
        retained = {
            attempt.original_index
            for attempt in self.attempts
            if not attempt.removed
        }
        return all(
            attempt.result.verdict == "NONUNIT"
            for attempt in self.attempts
            if attempt.original_index in retained
        )

    def as_dict(self, initial_row_count: int) -> dict[str, Any]:
        return {
            "strategy": "one-pass-greedy-normalized-row-deletion",
            "initial_row_count": initial_row_count,
            "final_row_count": len(self.rows),
            "final_equation_count": len(system_polynomials(self.rows)),
            "unit_preserved": True,
            "complete": self.complete,
            "confirmed_row_irredundant": self.confirmed_row_irredundant,
            "rows": [row.as_dict() for row in self.rows],
            "attempts": [attempt.as_dict() for attempt in self.attempts],
        }


Oracle = Callable[
    [tuple[MetricRow, ...]],
    OracleResult | str | Mapping[str, Any],
]


def coordinate(label: int) -> tuple[str, str]:
    """Return the coordinate expressions for a label in the fixed gauge."""

    if label < 0:
        raise ValueError("point labels must be nonnegative")
    if label == 0:
        return "0", "0"
    if label == 1:
        return "1", "0"
    return f"x{label}x", f"x{label}y"


def variable_names(n: int) -> tuple[str, ...]:
    if n < 2:
        raise ValueError("the 0/1 coordinate gauge requires at least two labels")
    return tuple(
        variable
        for point in range(2, n)
        for variable in coordinate(point)
    )


def squared_distance(left: int, right: int) -> str:
    left_x, left_y = coordinate(left)
    right_x, right_y = coordinate(right)
    return f"({left_x}-{right_x})^2+({left_y}-{right_y})^2"


def row_equalities(row: MetricRow) -> tuple[str, ...]:
    """Emit pivoted squared-distance equalities for one metric row."""

    if len(row.support) < 2:
        raise ValueError("a metric row needs at least two support labels")
    pivot = row.support[0]
    pivot_distance = squared_distance(row.center, pivot)
    return tuple(
        f"({pivot_distance})-({squared_distance(row.center, point)})"
        for point in row.support[1:]
    )


def system_polynomials(rows: Sequence[MetricRow]) -> tuple[str, ...]:
    return tuple(
        polynomial
        for row in rows
        for polynomial in row_equalities(row)
    )


def singular_script(
    variables: Sequence[str], polynomials: Sequence[str]
) -> str:
    """Render the exact QQ membership test consumed by Singular on stdin."""

    if not variables:
        raise ValueError("Singular equality-ideal rings need at least one variable")
    generators = ",\n  ".join(polynomials) if polynomials else "0"
    return "\n".join(
        (
            f"ring r = 0, ({','.join(variables)}), dp;",
            f"ideal I = {generators};",
            "ideal G = slimgb(I);",
            f'print("{VERDICT_BEGIN}");',
            "reduce(1, G);",
            f'print("{VERDICT_END}");',
            "quit;",
            "",
        )
    )


def parse_singular_verdict(stdout: str) -> str:
    """Parse the marked normal form: 0 is unit and 1 is nonunit."""

    lines = [line.strip() for line in stdout.splitlines()]
    begins = [index for index, line in enumerate(lines) if line == VERDICT_BEGIN]
    ends = [index for index, line in enumerate(lines) if line == VERDICT_END]
    if len(begins) != 1 or len(ends) != 1 or begins[0] >= ends[0]:
        return "ERROR"
    payload = [line for line in lines[begins[0] + 1 : ends[0]] if line]
    if payload == ["0"]:
        return "UNIT"
    if payload == ["1"]:
        return "NONUNIT"
    return "ERROR"


def run_singular_script(
    script: str,
    *,
    timeout_s: float,
    executable: str = "Singular",
) -> OracleResult:
    """Run one Singular stdin program under its own wall-clock timeout."""

    try:
        process = subprocess.run(
            [executable, "-q"],
            input=script,
            capture_output=True,
            text=True,
            timeout=timeout_s,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return OracleResult("TIMEOUT")
    except OSError as error:
        return OracleResult("ERROR", detail=f"{type(error).__name__}: {error}")

    if process.returncode != 0:
        detail = process.stderr.strip() or process.stdout.strip()
        return OracleResult(
            "ERROR",
            detail=detail or "Singular exited without diagnostics",
            returncode=process.returncode,
        )
    verdict = parse_singular_verdict(process.stdout)
    if verdict == "ERROR":
        return OracleResult(
            "ERROR",
            detail="missing or malformed marked Singular verdict",
            returncode=process.returncode,
        )
    return OracleResult(verdict, returncode=process.returncode)


def _canonical_json(value: object) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=False,
        allow_nan=False,
    ).encode("utf-8")


def _sha256(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _query_context(
    script: str,
    *,
    query: Mapping[str, object],
    input_metadata: Mapping[str, Any],
    packet: Mapping[str, Any] | None,
    rows: Sequence[MetricRow],
    timeout_s: int,
    output_root: Path,
    backend: str,
) -> SingularQueryContext:
    if type(timeout_s) is not int or timeout_s <= 0:
        raise ValueError("Singular timeout must be an exact positive integer")
    equations = system_polynomials(rows)
    source_context: dict[str, object] = {
        "schema": QUERY_CONTEXT_SCHEMA,
        "input_json": {
            "path": input_metadata["path"],
            "bytes": input_metadata["bytes"],
            "sha256": input_metadata["sha256"],
            "schema": input_metadata["schema"],
        },
        "upstream_source": input_metadata["upstream_source"],
        "packet": (
            None
            if packet is None
            else {
                "packet_index": packet["packet_index"],
                # The saved packet records contain timing floats, which are not
                # admissible in PIQD source_context.  Bind the complete
                # canonical record as JSON text plus its byte digest instead.
                "canonical_record_json": _canonical_json(
                    packet["canonical_record"]
                ).decode("utf-8"),
                "canonical_record_sha256": packet[
                    "canonical_record_sha256"
                ],
            }
        ),
        "normalized_rows": [row.as_dict() for row in rows],
        "equations": list(equations),
        "script_sha256": _sha256(script.encode("utf-8")),
        "query": dict(query),
        "execution_profile": {
            "backend": backend,
            "solver": "Singular",
            "sequential": True,
            "workers": 1,
            "local_fallback": False,
            "timeout_seconds": timeout_s,
        },
    }
    identity = _sha256(_canonical_json(source_context))
    request_id = f"equality-ideal-{identity[:32]}"
    return SingularQueryContext(
        source=PIQD_SOURCE,
        project=PIQD_PROJECT,
        request_id=request_id,
        timeout_s=timeout_s,
        output_directory=output_root / request_id,
        source_context=source_context,
    )


def _execution_metadata(execution: SingularExecution) -> dict[str, Any]:
    return {
        "run_id": execution.run_id,
        "run_status": execution.run_status,
        "exit_code": execution.exit_code,
        "request_sha256": execution.request_sha256,
        "result_sha256": execution.result_sha256,
        "script_sha256": execution.script_sha256,
        "stdout_sha256": execution.stdout_sha256,
        "stderr_sha256": execution.stderr_sha256,
        "source_context_sha256": execution.source_context_sha256,
        "receipt_sha256": execution.receipt_sha256,
        "artifact_sha256": execution.artifact_sha256,
        "replayed": execution.replayed,
        "artifact_directory": str(execution.manifest_path.parent),
    }


def execute_singular_script(
    script: str,
    *,
    runner: SingularExecutionRunner,
    context: SingularQueryContext,
) -> OracleResult:
    """Execute under custody, then interpret only the marked transcript."""

    script_bytes = script.encode("utf-8")
    expected_script_sha256 = _sha256(script_bytes)
    expected_context_sha256 = _sha256(_canonical_json(context.source_context))
    try:
        execution = runner.execute(
            script_bytes,
            source=context.source,
            project=context.project,
            request_id=context.request_id,
            timeout_s=context.timeout_s,
            output_directory=context.output_directory,
            source_context=context.source_context,
        )
    except PiqdSingularCustodyError as error:
        return OracleResult(
            "ERROR", detail=f"PIQD Singular custody error: {error}"
        )
    except (OSError, ValueError, TypeError) as error:
        return OracleResult(
            "ERROR", detail=f"Singular execution error: {type(error).__name__}: {error}"
        )

    metadata = _execution_metadata(execution)
    if execution.script_sha256 != expected_script_sha256:
        return OracleResult(
            "ERROR",
            detail="Singular execution did not bind the exact script bytes",
            execution=metadata,
        )
    if execution.source_context_sha256 != expected_context_sha256:
        return OracleResult(
            "ERROR",
            detail="Singular execution did not bind the exact source context",
            execution=metadata,
        )
    if execution.run_status == "TIMED_OUT":
        return OracleResult("TIMEOUT", execution=metadata)
    if execution.run_status != "RAN":
        return OracleResult(
            "ERROR",
            detail=f"Singular process outcome was {execution.run_status}",
            returncode=execution.exit_code,
            execution=metadata,
        )
    if execution.exit_code != 0:
        return OracleResult(
            "ERROR",
            detail="Singular exited nonzero",
            returncode=execution.exit_code,
            execution=metadata,
        )
    if execution.stdout is None or execution.stdout_sha256 != _sha256(
        execution.stdout
    ):
        return OracleResult(
            "ERROR",
            detail="Singular stdout custody is missing or malformed",
            execution=metadata,
        )
    try:
        stdout = execution.stdout.decode("utf-8", errors="strict")
    except UnicodeDecodeError:
        return OracleResult(
            "ERROR",
            detail="Singular stdout is not UTF-8",
            execution=metadata,
        )
    verdict = parse_singular_verdict(stdout)
    if verdict == "ERROR":
        return OracleResult(
            "ERROR",
            detail="missing or malformed marked Singular verdict",
            returncode=execution.exit_code,
            execution=metadata,
        )
    return OracleResult(
        verdict,
        returncode=execution.exit_code,
        execution=metadata,
    )


def probe_rows(
    n: int,
    rows: Sequence[MetricRow],
    *,
    runner: SingularExecutionRunner,
    context: SingularQueryContext,
) -> OracleResult:
    script = singular_script(variable_names(n), system_polynomials(rows))
    return execute_singular_script(script, runner=runner, context=context)


def _coerce_oracle_result(
    value: OracleResult | str | Mapping[str, Any],
) -> OracleResult:
    if isinstance(value, OracleResult):
        return value
    if isinstance(value, str):
        return OracleResult(value)
    return OracleResult(
        str(value["verdict"]),
        detail=(str(value["detail"]) if value.get("detail") is not None else None),
        returncode=(
            int(value["returncode"])
            if value.get("returncode") is not None
            else None
        ),
    )


def greedy_minimize_rows(
    rows: Sequence[MetricRow], oracle: Oracle
) -> GreedyResult:
    """Delete rows in input order only after an exact UNIT oracle response.

    The caller must establish that the initial row system is unit.  ``TIMEOUT``
    and ``ERROR`` conservatively retain the row and make ``complete`` false.
    """

    active = list(enumerate(tuple(rows)))
    attempts: list[GreedyAttempt] = []
    for original_index, row in tuple(active):
        candidate = tuple(
            candidate_row
            for index, candidate_row in active
            if index != original_index
        )
        result = _coerce_oracle_result(oracle(candidate))
        removed = result.verdict == "UNIT"
        attempts.append(GreedyAttempt(original_index, row, result, removed))
        if removed:
            active = [
                item for item in active if item[0] != original_index
            ]
    return GreedyResult(tuple(row for _, row in active), tuple(attempts))


def run_smoke_gates(
    *,
    runner: SingularExecutionRunner,
    input_metadata: Mapping[str, Any],
    timeout_s: int,
    output_root: Path,
    backend: str,
) -> dict[str, dict[str, Any]]:
    """Require one known unit and one known nonunit ideal before real work."""

    cases = (
        ("known_unit", ("z", "z-1"), "UNIT"),
        ("known_nonunit", ("z^2-1",), "NONUNIT"),
    )
    results: dict[str, dict[str, Any]] = {}
    for name, polynomials, expected in cases:
        script = singular_script(("z",), polynomials)
        context = _query_context(
            script,
            query={"kind": "smoke-gate", "name": name},
            input_metadata=input_metadata,
            packet=None,
            rows=(),
            timeout_s=timeout_s,
            output_root=output_root,
            backend=backend,
        )
        result = execute_singular_script(script, runner=runner, context=context)
        results[name] = {"expected": expected, **result.as_dict()}
        if result.verdict != expected:
            raise RuntimeError(
                f"smoke gate {name} expected {expected}, got {result.verdict}"
            )
    return results


def _relative_path(path: Path) -> str:
    return os.path.relpath(path.resolve(), ROOT)


def load_packet_systems(
    input_path: Path,
    packet_indices: Sequence[int] = (),
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    """Load normalized rows from saved ``core_free: SAT`` packet results."""

    raw_bytes = input_path.read_bytes()
    root = json.loads(raw_bytes)
    if not isinstance(root, dict):
        raise TypeError("input artifact root must be an object")
    if (
        type(root.get("schema")) is not str
        or root.get("schema") not in INPUT_SCHEMAS
    ):
        expected = ", ".join(sorted(repr(schema) for schema in INPUT_SCHEMAS))
        raise ValueError(
            f"input schema must be one of {expected}, got {root.get('schema')!r}"
        )
    upstream_path = root.get("input")
    upstream_sha256 = root.get("input_sha256")
    if type(upstream_path) is not str or not upstream_path:
        raise ValueError("input artifact has no typed upstream source path")
    if (
        type(upstream_sha256) is not str
        or len(upstream_sha256) != 64
        or any(character not in "0123456789abcdef" for character in upstream_sha256)
    ):
        raise ValueError("input artifact has no typed upstream source hash")
    raw_results = root.get("results")
    if type(raw_results) is not list:
        raise ValueError("input artifact has no results list")

    by_index: dict[int, Mapping[str, Any]] = {}
    for raw in raw_results:
        if type(raw) is not dict or type(raw.get("packet_index")) is not int:
            raise ValueError("input artifact contains an invalid packet result")
        index = int(raw["packet_index"])
        if index < 0 or type(raw.get("n")) is not int or raw["n"] < 2:
            raise ValueError(f"packet {index} has invalid typed dimensions")
        if "type" in raw and type(raw["type"]) is not str:
            raise ValueError(f"packet {index} has a non-string type field")
        if "pin_source" in raw and type(raw["pin_source"]) is not int:
            raise ValueError(f"packet {index} has a non-integer source field")
        if index in by_index:
            raise ValueError(f"input artifact repeats packet_index {index}")
        by_index[index] = raw

    eligible_indices = sorted(
        index
        for index, raw in by_index.items()
        if raw.get("core_free", {}).get("status") == "SAT"
        and raw.get("core_free", {}).get("assignment") is not None
    )
    requested = sorted({int(index) for index in packet_indices})
    if any(index < 0 for index in requested):
        raise ValueError("--packet-index values must be nonnegative")
    if requested:
        unavailable = sorted(set(requested) - set(eligible_indices))
        if unavailable:
            joined = ", ".join(str(index) for index in unavailable)
            raise ValueError(
                "requested packets are not saved core_free SAT assignments: "
                f"{joined}"
            )
        selected_indices = requested
    else:
        selected_indices = eligible_indices

    systems: list[dict[str, Any]] = []
    for index in selected_indices:
        raw = by_index[index]
        n = int(raw["n"])
        assignment = raw["core_free"]["assignment"]
        if not isinstance(assignment, Mapping):
            raise TypeError(f"packet {index} has a non-object assignment")
        rows = _normalize_assignment(assignment, n)
        context = {
            field: raw[field]
            for field in CONTEXT_FIELDS
            if field in raw
        }
        systems.append(
            {
                "packet_index": index,
                "n": n,
                "context": context,
                "rows": rows,
                "canonical_record": raw,
                "canonical_record_sha256": _sha256(_canonical_json(raw)),
            }
        )

    metadata = {
        "path": _relative_path(input_path),
        "bytes": len(raw_bytes),
        "sha256": hashlib.sha256(raw_bytes).hexdigest(),
        "schema": root["schema"],
        "upstream_source": {
            "path": upstream_path,
            "sha256": upstream_sha256,
        },
        "complete": bool(root.get("complete", False)),
        "saved_result_count": len(raw_results),
        "eligible_core_free_sat_packets": len(eligible_indices),
        "requested_packet_indices": requested,
        "selected_packet_count": len(systems),
    }
    return systems, metadata


def probe_packet(
    system: Mapping[str, Any],
    *,
    runner: SingularExecutionRunner,
    input_metadata: Mapping[str, Any],
    timeout_s: int,
    output_root: Path,
    backend: str,
) -> dict[str, Any]:
    n = int(system["n"])
    rows = tuple(system["rows"])
    initial_script = singular_script(variable_names(n), system_polynomials(rows))
    initial_context = _query_context(
        initial_script,
        query={
            "kind": "packet-initial",
            "packet_index": int(system["packet_index"]),
        },
        input_metadata=input_metadata,
        packet=system,
        rows=rows,
        timeout_s=timeout_s,
        output_root=output_root,
        backend=backend,
    )
    initial = probe_rows(
        n, rows, runner=runner, context=initial_context
    )
    result: dict[str, Any] = {
        "packet_index": int(system["packet_index"]),
        **dict(system["context"]),
        "normalized_rows": [row.as_dict() for row in rows],
        "normalized_row_count": len(rows),
        "equality_equation_count": len(system_polynomials(rows)),
        "initial": initial.as_dict(),
        "minimization": None,
    }
    if initial.verdict == "UNIT":
        attempt_index = 0

        def oracle(candidate: tuple[MetricRow, ...]) -> OracleResult:
            nonlocal attempt_index
            script = singular_script(
                variable_names(n), system_polynomials(candidate)
            )
            context = _query_context(
                script,
                query={
                    "kind": "packet-greedy-deletion",
                    "packet_index": int(system["packet_index"]),
                    "attempt_index": attempt_index,
                },
                input_metadata=input_metadata,
                packet=system,
                rows=candidate,
                timeout_s=timeout_s,
                output_root=output_root,
                backend=backend,
            )
            attempt_index += 1
            return probe_rows(n, candidate, runner=runner, context=context)

        minimized = greedy_minimize_rows(rows, oracle)
        result["minimization"] = minimized.as_dict(len(rows))
    return result


def run(
    input_path: Path,
    *,
    packet_indices: Sequence[int],
    timeout_s: int,
    backend: str = "piqd",
    piqd_server: str = "http://127.0.0.1:7272",
    piqd_data_root: Path = DEFAULT_PIQD_DATA_ROOT,
    executable: str = "Singular",
    workers: int = 1,
    runner: SingularExecutionRunner | None = None,
) -> dict[str, Any]:
    if type(timeout_s) is not int or timeout_s <= 0:
        raise ValueError("timeout_s must be an exact positive integer")
    if type(workers) is not int or workers != 1:
        raise ValueError("workers must be exactly 1")
    if backend not in {"piqd", "legacy-local"}:
        raise ValueError(f"unknown Singular backend {backend!r}")
    if runner is None:
        runner = (
            PiqdSingularRunner(
                base_url=piqd_server,
                max_poll_s=float(timeout_s + 60),
            )
            if backend == "piqd"
            else LegacyLocalSingularRunner(executable)
        )
    systems, input_metadata = load_packet_systems(input_path, packet_indices)
    output_root = piqd_data_root.resolve() / CALLER_OUTPUT_SUBROOT
    if backend == "piqd":
        output_root.parent.mkdir(parents=True, exist_ok=True)
        output_root.mkdir()
    smoke = run_smoke_gates(
        runner=runner,
        input_metadata=input_metadata,
        timeout_s=timeout_s,
        output_root=output_root,
        backend=backend,
    )
    results = []
    for system in systems:
        result = probe_packet(
            system,
            runner=runner,
            input_metadata=input_metadata,
            timeout_s=timeout_s,
            output_root=output_root,
            backend=backend,
        )
        results.append(result)
        print(
            f"packet {result['packet_index']}: "
            f"{result['initial']['verdict']}",
            file=sys.stderr,
            flush=True,
        )

    counts = Counter(result["initial"]["verdict"] for result in results)
    return {
        "schema": SCHEMA,
        "input": input_metadata,
        "algebra": {
            "coefficient_field": "QQ",
            "monomial_order": "dp",
            "standard_basis_command": "slimgb",
            "membership_test": "reduce(1, slimgb(I))",
            "coordinate_gauge": {"0": ["0", "0"], "1": ["1", "0"]},
            "free_coordinate_names": "x{label}x,x{label}y for labels 2..n-1",
            "row_generator": (
                "d2(center,support[0])-d2(center,support[i]), i=1..3"
            ),
            "exact_flags_used": False,
        },
        "claims": {
            "UNIT": (
                "Exact over QQ for the gauge-fixed squared-distance equality "
                "ideal: 1 belongs to the ideal."
            ),
            "NONUNIT": (
                "The equality ideal is proper; this is not a real "
                "realizability claim."
            ),
            "minimization": (
                "Rows are removed greedily only on UNIT; no "
                "minimum-cardinality claim is made."
            ),
        },
        "execution": {
            "backend": backend,
            "piqd_server": piqd_server if backend == "piqd" else None,
            "piqd_data_root": (
                str(piqd_data_root.resolve()) if backend == "piqd" else None
            ),
            "caller_output_subroot": (
                str(output_root) if backend == "piqd" else None
            ),
            "singular_command": (
                None if backend == "piqd" else [executable, "-q"]
            ),
            "timeout_seconds_per_system": timeout_s,
            "sequential": True,
            "workers": 1,
            "local_fallback": False,
            "timestamps_included": False,
            "timings_included": False,
            "result_order": "ascending packet_index",
        },
        "smoke_gates": smoke,
        "summary": {
            "selected_packets": len(results),
            "initial_verdicts": {
                verdict: counts[verdict] for verdict in VERDICTS
            },
        },
        "results": sorted(results, key=lambda result: result["packet_index"]),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument(
        "--packet-index",
        type=int,
        action="append",
        default=[],
        help="Process only this saved packet index; may be repeated.",
    )
    parser.add_argument(
        "--timeout-s",
        type=int,
        default=120,
        help="Wall-clock timeout for each Singular ideal, including smoke gates.",
    )
    parser.add_argument(
        "--backend",
        choices=("piqd", "legacy-local"),
        default="piqd",
        help="PIQD is the production default; local subprocess is explicit legacy mode.",
    )
    parser.add_argument(
        "--piqd-server",
        default="http://127.0.0.1:7272",
        help="PIQD server base URL.",
    )
    parser.add_argument(
        "--piqd-data-root",
        type=Path,
        default=DEFAULT_PIQD_DATA_ROOT,
        help="Parent for the create-once equality-ideal PIQD artifact subroot.",
    )
    parser.add_argument(
        "--workers",
        type=int,
        default=1,
        help="Must be 1; equality-ideal PIQD execution is sequential.",
    )
    parser.add_argument(
        "--singular",
        default="Singular",
        help="Singular executable name or path.",
    )
    args = parser.parse_args()
    if args.timeout_s <= 0:
        parser.error("--timeout-s must be positive")
    if args.workers != 1:
        parser.error("--workers must be exactly 1")

    try:
        artifact = run(
            args.input.resolve(),
            packet_indices=args.packet_index,
            timeout_s=args.timeout_s,
            backend=args.backend,
            piqd_server=args.piqd_server,
            piqd_data_root=args.piqd_data_root,
            executable=args.singular,
            workers=args.workers,
        )
    except (
        OSError,
        TypeError,
        ValueError,
        RuntimeError,
        json.JSONDecodeError,
    ) as error:
        parser.exit(2, f"equality-ideal probe failed: {error}\n")

    rendered = json.dumps(artifact, indent=2, sort_keys=True) + "\n"
    if str(args.out) == "-":
        sys.stdout.write(rendered)
    else:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(rendered)
        print(f"wrote {args.out}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
