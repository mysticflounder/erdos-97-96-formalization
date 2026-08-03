#!/usr/bin/env python3
"""Provenance-safe orchestrator for the 67 authenticated v17 retry cases.

The case set is derived from the pinned v8 terminal summary and checked against
the pinned v10 retry summary.  No case identifier is handwritten here.  The
driver is preflight-only unless ``--launch`` is supplied explicitly.

Each child uses v17's one-case CLI in its own artifact root.  Exit code 2 is an
expected fail-closed incomplete result and never aborts the remaining cases.
The aggregate manifest hashes and validates every child invocation, summary,
and result.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import fcntl
import hashlib
import json
import os
import shutil
import subprocess
import sys
import threading
import time
from collections import Counter
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Callable, Iterable, Sequence

import round5_cegar_v8 as v8
import round5_cegar_v17 as v17


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[2]
TARGET = v17.TARGET
MAX_WORKERS = 23
NICENESS_INCREMENT = 10

V10_RUN = HERE / "artifacts-v10/20260802T085343.215706Z-retry-pid37045"
V10_SUMMARY = V10_RUN / "matrix_summary.json"
V10_INVOCATION = V10_RUN / "invocation.json"
V8_SUMMARY = (
    HERE / "artifacts-v8/20260802T073834.774222Z-retry-pid10633/matrix_summary.json"
)

# These authenticate the terminal v8 -> v10 source chain from which the exact
# unresolved set is derived.  Changing --summary is deliberately unsupported:
# a new source requires a reviewed source-chain constant update.
V10_SUMMARY_SHA256 = "bf69859d414877a18b17d6a323595f77e7dd15a420d085f5fa84b20e5b0d0787"
V10_INVOCATION_SHA256 = "44e1494b68ec3aad1c3a1a8cb1ecbc9d4a7852cab217f9341eb63031e8d07168"
V8_SUMMARY_SHA256 = "1727b3ea7bd39e20bd22a3788ea328163bf72a33745d2c5517987b0c3e3d8ebb"


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def file_sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def canonical_sha256(value: object) -> str:
    data = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return sha256_bytes(data)


def read_json_hashed(path: Path, expected_sha256: str) -> dict[str, object]:
    data = path.read_bytes()
    actual = sha256_bytes(data)
    if actual != expected_sha256:
        raise RuntimeError(f"hash mismatch for {path}: {actual} != {expected_sha256}")
    value = json.loads(data)
    if not isinstance(value, dict):
        raise RuntimeError(f"expected JSON object in {path}")
    return value


def write_json_atomic(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()
    temporary = path.with_name(f".{path.name}.tmp-{os.getpid()}-{threading.get_ident()}")
    with temporary.open("xb") as handle:
        handle.write(payload)
        handle.flush()
        os.fsync(handle.fileno())
    temporary.replace(path)


@dataclass(frozen=True)
class SourceChain:
    v10_summary: Path = V10_SUMMARY
    v10_summary_sha256: str = V10_SUMMARY_SHA256
    v10_invocation: Path = V10_INVOCATION
    v10_invocation_sha256: str = V10_INVOCATION_SHA256
    v8_summary: Path = V8_SUMMARY
    v8_summary_sha256: str = V8_SUMMARY_SHA256


@dataclass(frozen=True)
class SelectedCase:
    source_index: int
    case: v8.Case
    v8_result_entry_sha256: str
    v10_result_entry_sha256: str


@dataclass(frozen=True)
class Budgets:
    timeout_ms: int = 600_000
    bool_timeout_ms: int = 30_000
    max_assignments: int = 100_000
    replay_timeout_ms: int = 30_000
    max_power_cuts: int = 256
    max_power_candidates: int = 2_000_000
    max_bool_power_cuts: int = 256
    max_bool_power_candidates: int = 2_000_000

    def validate(self) -> None:
        if any(value <= 0 for value in asdict(self).values()):
            raise ValueError("all v17 budgets must be positive")


@dataclass(frozen=True)
class FrozenInputs:
    file_hashes: dict[str, str]
    v17_provenance: dict[str, object]


@dataclass(frozen=True)
class ChildSpec:
    ordinal: int
    selected: SelectedCase
    child_artifacts: Path
    command: tuple[str, ...]


@dataclass(frozen=True)
class ChildExecution:
    exit_code: int
    elapsed_seconds: float
    stdout_path: Path
    stderr_path: Path


ChildRunner = Callable[[ChildSpec], ChildExecution]


def _validate_terminal_summary(
    summary: dict[str, object], *, case_count: int, statuses: dict[str, int]
) -> list[dict[str, object]]:
    if summary.get("target") != TARGET:
        raise RuntimeError("source summary target mismatch")
    if summary.get("case_count") != case_count:
        raise RuntimeError("source summary case_count mismatch")
    if summary.get("statuses") != statuses:
        raise RuntimeError("source summary statuses mismatch")
    if summary.get("complete") is not False:
        raise RuntimeError("source summary unexpectedly claims completion")
    results = summary.get("results")
    if not isinstance(results, list) or not all(isinstance(item, dict) for item in results):
        raise RuntimeError("source summary results are malformed")
    if len(results) != case_count:
        raise RuntimeError("source summary result count mismatch")
    return results  # type: ignore[return-value]


def load_case_selection(chain: SourceChain = SourceChain()) -> tuple[SelectedCase, ...]:
    """Derive the exact 67 unresolved cases from the authenticated v8/v10 chain."""
    v10 = read_json_hashed(chain.v10_summary, chain.v10_summary_sha256)
    invocation = read_json_hashed(chain.v10_invocation, chain.v10_invocation_sha256)
    v8_summary = read_json_hashed(chain.v8_summary, chain.v8_summary_sha256)

    source_path = invocation.get("source_summary")
    source_hash = invocation.get("source_summary_sha256")
    if source_hash != chain.v8_summary_sha256:
        raise RuntimeError("v10 invocation does not pin the authenticated v8 summary")
    if not isinstance(source_path, str):
        raise RuntimeError("v10 invocation lacks source_summary")
    recorded_source = Path(source_path)
    if not recorded_source.is_absolute():
        recorded_source = REPO_ROOT / recorded_source
    if recorded_source.resolve() != chain.v8_summary.resolve():
        raise RuntimeError("v10 invocation points at a different v8 source summary")

    v8_results = _validate_terminal_summary(
        v8_summary, case_count=68, statuses={"unknown": 67, "unsat": 1}
    )
    v10_results = _validate_terminal_summary(
        v10, case_count=67, statuses={"unknown": 67}
    )
    unresolved_v8 = [item for item in v8_results if item.get("status") == "unknown"]
    if len(unresolved_v8) != 67:
        raise RuntimeError("authenticated v8 summary does not have exactly 67 UNKNOWN cases")
    if any(item.get("status") != "unknown" for item in v10_results):
        raise RuntimeError("authenticated v10 summary contains a non-UNKNOWN result")

    v8_ids = [str(item.get("case_id")) for item in unresolved_v8]
    v10_ids = [str(item.get("case_id")) for item in v10_results]
    if len(set(v8_ids)) != 67 or len(set(v10_ids)) != 67:
        raise RuntimeError("source summaries contain duplicate case identifiers")
    if v8_ids != v10_ids:
        raise RuntimeError("v10 retry cases differ from the ordered v8 UNKNOWN set")

    universe = {
        case.case_id: case
        for case in (*v8.all_cases(), *v8.all_secondcap_endpoint_cases())
    }
    unknown_ids = sorted(set(v8_ids) - set(universe))
    if unknown_ids:
        raise RuntimeError(f"source summary contains unknown case ids: {unknown_ids}")

    return tuple(
        SelectedCase(
            source_index=index,
            case=universe[case_id],
            v8_result_entry_sha256=canonical_sha256(v8_results[index]),
            v10_result_entry_sha256=canonical_sha256(v10_results[index]),
        )
        for index, case_id in enumerate(v8_ids)
    )


def capture_frozen_inputs(chain: SourceChain = SourceChain()) -> FrozenInputs:
    files = {
        "orchestrator": Path(__file__).resolve(),
        "v17_script": HERE / "round5_cegar_v17.py",
        "v17_schema": HERE / "schema_v17.json",
        "v17_test": HERE / "test_round5_cegar_v17.py",
        "uv_lock": HERE / "uv.lock",
        "v10_summary": chain.v10_summary,
        "v10_invocation": chain.v10_invocation,
        "v8_summary": chain.v8_summary,
    }
    hashes = {role: file_sha256(path) for role, path in files.items()}
    expected = {
        "v10_summary": chain.v10_summary_sha256,
        "v10_invocation": chain.v10_invocation_sha256,
        "v8_summary": chain.v8_summary_sha256,
    }
    for role, digest in expected.items():
        if hashes[role] != digest:
            raise RuntimeError(f"frozen source-chain hash mismatch for {role}")

    provenance = v17.provenance()
    provenance_checks = {
        "script_sha256": hashes["v17_script"],
        "schema_sha256": hashes["v17_schema"],
        "focused_test_source_sha256": hashes["v17_test"],
        "uv_lock_sha256": hashes["uv_lock"],
    }
    for key, digest in provenance_checks.items():
        if provenance.get(key) != digest:
            raise RuntimeError(f"v17 provenance does not attest current {key}")
    return FrozenInputs(hashes, provenance)


def validate_frozen_inputs_unchanged(frozen: FrozenInputs, chain: SourceChain) -> None:
    current = capture_frozen_inputs(chain)
    if current != frozen:
        changed = sorted(
            key for key in set(frozen.file_hashes) | set(current.file_hashes)
            if frozen.file_hashes.get(key) != current.file_hashes.get(key)
        )
        raise RuntimeError(f"frozen matrix inputs changed during run: {changed}")


def bounded_workers(text: str) -> int:
    workers = int(text)
    if not 1 <= workers <= MAX_WORKERS:
        raise argparse.ArgumentTypeError(f"workers must be in the closed interval 1..{MAX_WORKERS}")
    return workers


def _resolved_budgets(budgets: Budgets) -> dict[str, int]:
    return asdict(budgets)


def build_child_command(
    selected: SelectedCase,
    child_artifacts: Path,
    budgets: Budgets,
    seed: int,
) -> tuple[str, ...]:
    case = selected.case
    command = [
        shutil.which("nice") or "nice", "-n", str(NICENESS_INCREMENT),
        shutil.which("uv") or "uv", "run", "python", "-u",
        str(HERE / "round5_cegar_v17.py"), "case",
        "--arm", case.arm, "--profiles", case.profiles,
        "--kept", str(case.kept), "--deleted", str(case.deleted),
    ]
    if case.fresh is not None:
        command.extend(("--fresh", str(case.fresh)))
    command.extend((
        "--timeout-ms", str(budgets.timeout_ms),
        "--bool-timeout-ms", str(budgets.bool_timeout_ms),
        "--max-assignments", str(budgets.max_assignments),
        "--replay-timeout-ms", str(budgets.replay_timeout_ms),
        "--max-power-cuts", str(budgets.max_power_cuts),
        "--max-power-candidates", str(budgets.max_power_candidates),
        "--max-bool-power-cuts", str(budgets.max_bool_power_cuts),
        "--max-bool-power-candidates", str(budgets.max_bool_power_candidates),
        "--seed", str(seed), "--artifacts", str(child_artifacts),
    ))
    return tuple(command)


def run_child_process(spec: ChildSpec) -> ChildExecution:
    spec.child_artifacts.mkdir(parents=True, exist_ok=False)
    stdout_path = spec.child_artifacts / "child.stdout.log"
    stderr_path = spec.child_artifacts / "child.stderr.log"
    started = time.monotonic()
    with stdout_path.open("xb") as stdout, stderr_path.open("xb") as stderr:
        process = subprocess.run(
            spec.command,
            cwd=HERE,
            stdin=subprocess.DEVNULL,
            stdout=stdout,
            stderr=stderr,
            check=False,
            start_new_session=True,
        )
    return ChildExecution(
        exit_code=process.returncode,
        elapsed_seconds=time.monotonic() - started,
        stdout_path=stdout_path,
        stderr_path=stderr_path,
    )


def _child_run_dir(child_artifacts: Path) -> Path:
    summaries = sorted(child_artifacts.glob("*/summary.json"))
    if len(summaries) != 1:
        raise RuntimeError(f"expected one child summary, found {len(summaries)}")
    return summaries[0].parent


def attest_child(
    spec: ChildSpec,
    execution: ChildExecution,
    frozen: FrozenInputs,
    budgets: Budgets,
    seed: int,
) -> dict[str, object]:
    errors: list[str] = []
    record: dict[str, object] = {
        "ordinal": spec.ordinal,
        "source_index": spec.selected.source_index,
        "case_id": spec.selected.case.case_id,
        "case": asdict(spec.selected.case),
        "command": list(spec.command),
        "exit_code": execution.exit_code,
        "elapsed_seconds": execution.elapsed_seconds,
        "worker_state": "TERMINAL",
        "child_artifacts": str(spec.child_artifacts),
        "stdout": str(execution.stdout_path),
        "stderr": str(execution.stderr_path),
        "stdout_sha256": file_sha256(execution.stdout_path),
        "stderr_sha256": file_sha256(execution.stderr_path),
        "v8_result_entry_sha256": spec.selected.v8_result_entry_sha256,
        "v10_result_entry_sha256": spec.selected.v10_result_entry_sha256,
    }
    try:
        run_dir = _child_run_dir(spec.child_artifacts)
        invocation_path = run_dir / "invocation.json"
        summary_path = run_dir / "summary.json"
        result_path = run_dir / spec.selected.case.case_id / "result.json"
        invocation = json.loads(invocation_path.read_text())
        summary = json.loads(summary_path.read_text())
        result = json.loads(result_path.read_text())
        if not all(isinstance(item, dict) for item in (invocation, summary, result)):
            raise RuntimeError("child JSON root is not an object")

        for key, value in frozen.v17_provenance.items():
            if invocation.get(key) != value:
                errors.append(f"child invocation provenance mismatch: {key}")
        expected_child_budgets = {
            "timeout_ms": budgets.timeout_ms,
            "bool_timeout_ms": budgets.bool_timeout_ms,
            "replay_timeout_ms": budgets.replay_timeout_ms,
            "max_assignments": budgets.max_assignments,
            "max_bool_power_cuts": budgets.max_bool_power_cuts,
            "max_bool_power_candidates": budgets.max_bool_power_candidates,
        }
        if invocation.get("resolved_budgets") != expected_child_budgets:
            errors.append("child resolved budgets mismatch")
        if invocation.get("case_count") != 1 or invocation.get("workers") != 1:
            errors.append("child invocation is not a one-case/one-worker run")

        summary_results = summary.get("results")
        if not isinstance(summary_results, list) or len(summary_results) != 1:
            errors.append("child summary does not attest exactly one result")
        else:
            attested = summary_results[0]
            if not isinstance(attested, dict):
                errors.append("child summary result attestation is malformed")
            elif attested.get("result_file_sha256") != file_sha256(result_path):
                errors.append("child summary result hash mismatch")
        if result.get("case_id") != spec.selected.case.case_id:
            errors.append("child result case_id mismatch")
        expected_argv = list(spec.command[spec.command.index(str(HERE / "round5_cegar_v17.py")):])
        child_argv = invocation.get("argv")
        if not isinstance(child_argv, list) or child_argv[1:] != expected_argv[1:]:
            errors.append("child invocation argv differs from frozen one-case command")

        child_complete = summary.get("complete") is True and result.get("complete") is True
        if child_complete and execution.exit_code != 0:
            errors.append("complete child returned nonzero")
        if not child_complete and execution.exit_code not in (2,):
            errors.append("incomplete child did not return fail-closed exit code 2")
        record.update({
            "run_dir": str(run_dir),
            "invocation": str(invocation_path),
            "invocation_sha256": file_sha256(invocation_path),
            "summary": str(summary_path),
            "summary_sha256": file_sha256(summary_path),
            "result": str(result_path),
            "result_sha256": file_sha256(result_path),
            "status": result.get("status", "invalid"),
            "complete": child_complete,
            "summary_complete": summary.get("complete") is True,
            "seed": seed,
        })
    except Exception as exc:  # Fail closed, but preserve the rest of the wave.
        errors.append(f"artifact attestation failed: {type(exc).__name__}: {exc}")
        record.update({"status": "artifact_error", "complete": False, "seed": seed})
    record["attestation_errors"] = errors
    record["artifact_attested"] = not errors
    return record


class MatrixLease:
    def __init__(self, path: Path):
        self.path = path
        self.handle: object | None = None

    def __enter__(self) -> "MatrixLease":
        self.path.parent.mkdir(parents=True, exist_ok=True)
        handle = self.path.open("a+")
        try:
            fcntl.flock(handle.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as exc:
            handle.close()
            raise RuntimeError(f"matrix lease already held: {self.path}") from exc
        handle.seek(0)
        handle.truncate()
        handle.write(json.dumps({"pid": os.getpid(), "started_utc": datetime.now(timezone.utc).isoformat()}))
        handle.flush()
        self.handle = handle
        return self

    def __exit__(self, *_: object) -> None:
        assert self.handle is not None
        handle = self.handle
        assert hasattr(handle, "fileno") and hasattr(handle, "close")
        fcntl.flock(handle.fileno(), fcntl.LOCK_UN)  # type: ignore[union-attr]
        handle.close()  # type: ignore[union-attr]


_print_lock = threading.Lock()


def emit_status(value: dict[str, object]) -> None:
    with _print_lock:
        print(json.dumps(value, sort_keys=True), flush=True)


def _make_run_dir(root: Path) -> Path:
    root.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ")
    run_dir = root / f"{stamp}-v17-retry-matrix-pid{os.getpid()}"
    run_dir.mkdir(exist_ok=False)
    return run_dir


def _manifest_base(
    selected_all: Sequence[SelectedCase],
    selected_run: Sequence[SelectedCase],
    excluded: Sequence[str],
    frozen: FrozenInputs,
    chain: SourceChain,
    workers: int,
    budgets: Budgets,
    seed: int,
) -> dict[str, object]:
    return {
        "kind": "retained-core-v17-retry-matrix/v1",
        "target": TARGET,
        "scope": "normalized exact-n15 retained-omission terminal",
        "source_derivation": (
            "ordered status=unknown entries of authenticated v8 terminal summary; "
            "required byte-for-byte case-id agreement with authenticated v10 retry summary"
        ),
        "source_chain": {
            "v8_summary": str(chain.v8_summary),
            "v8_summary_sha256": chain.v8_summary_sha256,
            "v10_invocation": str(chain.v10_invocation),
            "v10_invocation_sha256": chain.v10_invocation_sha256,
            "v10_summary": str(chain.v10_summary),
            "v10_summary_sha256": chain.v10_summary_sha256,
        },
        "frozen_file_hashes": frozen.file_hashes,
        "frozen_v17_provenance": frozen.v17_provenance,
        "source_case_count": len(selected_all),
        "selected_case_count": len(selected_run),
        "source_cases": [
            {
                "source_index": item.source_index,
                "case_id": item.case.case_id,
                "case": asdict(item.case),
                "v8_result_entry_sha256": item.v8_result_entry_sha256,
                "v10_result_entry_sha256": item.v10_result_entry_sha256,
            }
            for item in selected_all
        ],
        "selected_case_ids": [item.case.case_id for item in selected_run],
        "excluded_case_ids": list(excluded),
        "workers": workers,
        "global_core_lease": {"local_worker_cap": MAX_WORKERS, "requested": workers},
        "niceness_increment": NICENESS_INCREMENT,
        "seed": seed,
        "resolved_budgets": _resolved_budgets(budgets),
        "child_interface": "round5_cegar_v17.py case (one case, one worker)",
    }


def orchestrate(
    *,
    artifacts: Path,
    workers: int,
    budgets: Budgets,
    seed: int,
    exclude_case_ids: Sequence[str],
    chain: SourceChain = SourceChain(),
    runner: ChildRunner = run_child_process,
) -> tuple[int, Path, dict[str, object]]:
    if not 1 <= workers <= MAX_WORKERS:
        raise ValueError(f"workers must be in the closed interval 1..{MAX_WORKERS}")
    budgets.validate()
    selected_all = load_case_selection(chain)
    case_ids = {item.case.case_id for item in selected_all}
    excluded = tuple(dict.fromkeys(exclude_case_ids))
    missing = sorted(set(excluded) - case_ids)
    if missing:
        raise ValueError(f"cannot exclude cases outside authenticated source set: {missing}")
    selected_run = tuple(item for item in selected_all if item.case.case_id not in excluded)
    if not selected_run:
        raise ValueError("exclusions removed every authenticated source case")
    frozen = capture_frozen_inputs(chain)

    with MatrixLease(artifacts / ".v17-retry-matrix.lock"):
        run_dir = _make_run_dir(artifacts)
        base = _manifest_base(
            selected_all, selected_run, excluded, frozen, chain, workers, budgets, seed
        )
        write_json_atomic(run_dir / "run_manifest.json", {
            **base,
            "state": "RUNNING",
            "started_utc": datetime.now(timezone.utc).isoformat(),
            "children": [],
        })

        specs = tuple(
            ChildSpec(
                ordinal=ordinal,
                selected=item,
                child_artifacts=run_dir / "children" / f"{ordinal:03d}-{item.case.case_id}",
                command=build_child_command(
                    item,
                    run_dir / "children" / f"{ordinal:03d}-{item.case.case_id}",
                    budgets,
                    seed,
                ),
            )
            for ordinal, item in enumerate(selected_run)
        )
        started = time.monotonic()

        def execute(spec: ChildSpec) -> dict[str, object]:
            emit_status({"event": "case_started", "case_id": spec.selected.case.case_id, "ordinal": spec.ordinal})
            try:
                execution = runner(spec)
                record = attest_child(spec, execution, frozen, budgets, seed)
            except Exception as exc:
                record = {
                    "ordinal": spec.ordinal,
                    "source_index": spec.selected.source_index,
                    "case_id": spec.selected.case.case_id,
                    "case": asdict(spec.selected.case),
                    "command": list(spec.command),
                    "worker_state": "TERMINAL",
                    "status": "worker_error",
                    "complete": False,
                    "artifact_attested": False,
                    "attestation_errors": [f"worker failed: {type(exc).__name__}: {exc}"],
                }
            emit_status({
                "event": "case_finished",
                "case_id": spec.selected.case.case_id,
                "ordinal": spec.ordinal,
                "status": record["status"],
                "complete": record["complete"],
            })
            return record

        with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
            children = list(pool.map(execute, specs))

        children.sort(key=lambda item: int(item["ordinal"]))
        changed_error: str | None = None
        try:
            validate_frozen_inputs_unchanged(frozen, chain)
        except Exception as exc:
            changed_error = f"{type(exc).__name__}: {exc}"

        counts = Counter(str(item["status"]) for item in children)
        complete = (
            changed_error is None
            and len(children) == len(selected_run)
            and all(item.get("artifact_attested") is True for item in children)
            and all(item.get("complete") is True for item in children)
        )
        aggregate = {
            **base,
            "state": "TERMINAL",
            "complete": complete,
            "elapsed_seconds": time.monotonic() - started,
            "counts": dict(sorted(counts.items())),
            "frozen_input_recheck_error": changed_error,
            "children": children,
            "terminal_claim": (
                "all_selected_v17_one_case_runs_complete"
                if complete else "none_fail_closed_incomplete"
            ),
        }
        write_json_atomic(run_dir / "aggregate_manifest.json", aggregate)
        emit_status({
            "event": "matrix_finished",
            "complete": complete,
            "counts": dict(sorted(counts.items())),
            "run_dir": str(run_dir),
        })
        return (0 if complete else 2), run_dir, aggregate


def parser() -> argparse.ArgumentParser:
    top = argparse.ArgumentParser(description=__doc__)
    top.add_argument("--launch", action="store_true", help="actually launch v17 children; omitted means provenance-only preflight")
    top.add_argument("--artifacts", type=Path, default=HERE / "artifacts-v17-retry-matrix")
    top.add_argument("--workers", type=bounded_workers, default=MAX_WORKERS)
    top.add_argument("--exclude-case-id", action="append", default=[])
    top.add_argument("--seed", type=int, default=97)
    top.add_argument("--timeout-ms", type=int, default=600_000)
    top.add_argument("--bool-timeout-ms", type=int, default=30_000)
    top.add_argument("--max-assignments", type=int, default=100_000)
    top.add_argument("--replay-timeout-ms", type=int, default=30_000)
    top.add_argument("--max-power-cuts", type=int, default=256)
    top.add_argument("--max-power-candidates", type=int, default=2_000_000)
    top.add_argument("--max-bool-power-cuts", type=int, default=256)
    top.add_argument("--max-bool-power-candidates", type=int, default=2_000_000)
    return top


def main(argv: Sequence[str] | None = None) -> int:
    args = parser().parse_args(argv)
    budgets = Budgets(
        timeout_ms=args.timeout_ms,
        bool_timeout_ms=args.bool_timeout_ms,
        max_assignments=args.max_assignments,
        replay_timeout_ms=args.replay_timeout_ms,
        max_power_cuts=args.max_power_cuts,
        max_power_candidates=args.max_power_candidates,
        max_bool_power_cuts=args.max_bool_power_cuts,
        max_bool_power_candidates=args.max_bool_power_candidates,
    )
    selected = load_case_selection()
    frozen = capture_frozen_inputs()
    excluded = tuple(dict.fromkeys(args.exclude_case_id))
    unknown_exclusions = sorted(set(excluded) - {item.case.case_id for item in selected})
    if unknown_exclusions:
        raise SystemExit(f"unknown --exclude-case-id: {unknown_exclusions}")
    if not args.launch:
        emit_status({
            "event": "preflight_only",
            "launch": False,
            "source_case_count": len(selected),
            "selected_case_count": len(selected) - len(excluded),
            "excluded_case_ids": list(excluded),
            "workers": args.workers,
            "niceness_increment": NICENESS_INCREMENT,
            "resolved_budgets": _resolved_budgets(budgets),
            "frozen_file_hashes": frozen.file_hashes,
        })
        return 0
    code, _, _ = orchestrate(
        artifacts=args.artifacts,
        workers=args.workers,
        budgets=budgets,
        seed=args.seed,
        exclude_case_ids=excluded,
    )
    return code


if __name__ == "__main__":
    raise SystemExit(main())
