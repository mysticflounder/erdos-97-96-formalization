"""Executable, non-authoritative Phase-3 CEGAR benchmark harness.

The harness only works on copies or fresh namespaces.  The transcript backend
is an in-process fake, the loader backend aborts if resume reaches a solver or
checker, and the persistent-ab command is a bounded real discovery canary.
Timing artifacts are diagnostic and never enter a CEGAR run directory or a
mathematical acceptance path.
"""

from __future__ import annotations

import argparse
import contextlib
import functools
import hashlib
import json
import math
import multiprocessing
import os
import resource
import sys
import time
from collections.abc import Callable, Iterator, Mapping, Sequence
from pathlib import Path
from types import SimpleNamespace
from typing import Any, Self

from census.p97_search import phase3_cegar_runtime as runtime
from census.p97_search import phase3_incremental_cadical as incremental
from census.p97_search import phase3_journal_checkpoint as journal_checkpoint
from census.p97_search import phase3_structural_cegar_projected_static_v3 as v3
from census.p97_search.benchmarks import phase3_cegar_timing as timing

BENCHMARK_COMMAND_SCHEMA = "p97-phase3-cegar-benchmark-command-v1"
BENCHMARK_REPORT_SCHEMA = "p97-phase3-cegar-benchmark-report-v1"
RUNTIME_AB_REPORT_SCHEMA = "p97-phase3-cegar-runtime-ab-report-v1"
PERSISTENT_AB_REPORT_SCHEMA = "p97-phase3-cegar-persistent-discovery-ab-report-v1"
COLD_START_PROFILE_SCHEMA = "p97-phase3-cegar-cold-start-profile-v1"
PREFIX_CACHE_AB_REPORT_SCHEMA = "p97-phase3-three-rhombus-prefix-cache-ab-report-v1"
PREFIX_CACHE_PROCESS_AB_REPORT_SCHEMA = (
    "p97-phase3-three-rhombus-prefix-cache-process-ab-report-v1"
)
JOURNAL_CHECKPOINT_PROCESS_AB_REPORT_SCHEMA = (
    "p97-phase3-authenticated-journal-checkpoint-process-ab-report-v1"
)
COMPILED_LOADER_PROCESS_AB_REPORT_SCHEMA = (
    "p97-phase3-compiled-loader-process-ab-report-v1"
)
REPLAY_ONLY_STATUSES = frozenset(
    {
        "STRUCTURAL_UNSAT_VERIFIED",
        "P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED",
        "ENUMERATION_COMPLETE_WITH_SURVIVORS",
        "SHARD_STRUCTURAL_UNSAT_VERIFIED",
        "SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED",
        "SHARD_ENUMERATION_COMPLETE_WITH_SURVIVORS",
        "LEARNED_CORE_LIMIT",
        "SURVIVOR_LIMIT",
        "CUBE_BATCH_NO_SAT_CHECKPOINT",
    }
)
EXPECTED_STAGE_GROUPS = (
    "encoding",
    "loader",
    "classifier",
    "classifier_minimizer",
    "minimizer",
    "cnf",
    "solver",
    "journal",
    "manifest",
    "terminal",
)


class BenchmarkError(RuntimeError):
    """A benchmark input, isolation, or replay invariant failed."""


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _tree_sha256(root: Path) -> str:
    digest = hashlib.sha256()
    for path in sorted(root.rglob("*")):
        if path.is_symlink():
            raise BenchmarkError(f"benchmark trees may not contain symlinks: {path}")
        if not path.is_file():
            continue
        relative = path.relative_to(root).as_posix().encode()
        digest.update(len(relative).to_bytes(8, "big"))
        digest.update(relative)
        digest.update(path.stat().st_size.to_bytes(8, "big"))
        digest.update(bytes.fromhex(_sha256_file(path)))
    return digest.hexdigest()


def _atomic_json(path: Path, value: Mapping[str, Any]) -> None:
    data = timing._canonical_bytes(value) + b"\n"
    temporary = path.with_name(f".{path.name}.tmp")
    path.parent.mkdir(parents=True, exist_ok=True)
    with temporary.open("wb") as handle:
        handle.write(data)
        handle.flush()
        os.fsync(handle.fileno())
    os.replace(temporary, path)


def _hashed_record(unsigned: Mapping[str, Any], field: str) -> dict[str, Any]:
    return {**unsigned, field: timing._sha256_value(unsigned)}


def _source_hashes() -> dict[str, str]:
    paths = (
        Path(__file__).resolve(),
        Path(timing.__file__).resolve(),
        Path(runtime.__file__).resolve(),
        Path(incremental.__file__).resolve(),
        Path(v3.__file__).resolve(),
        Path(v3.prefix_bank_cache.__file__).resolve(),
        Path(v3.phase3_order_universe.__file__).resolve(),
        Path(journal_checkpoint.__file__).resolve(),
    )
    return {
        str(path.relative_to(v3.ROOT)): _sha256_file(path)
        for path in paths
    }


def _chain_head(run_dir: Path) -> str | None:
    records = v3._strict_json_lines(run_dir / "learned-certificates.jsonl")
    if not records:
        return None
    value = records[-1].get("record_sha256")
    return value if isinstance(value, str) else None


def _subject_manifest(run_dir: Path) -> dict[str, Any]:
    manifest = v3._strict_json(run_dir / "manifest.json")
    unsigned = dict(manifest)
    claimed = unsigned.pop("manifest_sha256", None)
    if claimed != v3._sha256_value(unsigned):
        raise BenchmarkError("subject manifest hash is invalid")
    return manifest


def _new_output(output_dir: Path, *, subject: Path | None = None) -> Path:
    output = output_dir.resolve()
    if output.exists():
        raise BenchmarkError(f"benchmark output already exists: {output}")
    if subject is not None:
        source = subject.resolve()
        if output == source or output in source.parents or source in output.parents:
            raise BenchmarkError("benchmark output must be disjoint from its subject")
    output.mkdir(parents=True)
    return output


def _current_niceness() -> int | None:
    try:
        return os.getpriority(os.PRIO_PROCESS, 0)
    except (AttributeError, OSError):
        return None


def _max_rss_kib() -> int | None:
    """Return the spawned worker's peak RSS in KiB when the OS exposes it."""

    values: list[int] = []
    for who in (resource.RUSAGE_SELF, resource.RUSAGE_CHILDREN):
        try:
            value = int(resource.getrusage(who).ru_maxrss)
        except (AttributeError, OSError):
            continue
        if value > 0:
            if sys.platform == "darwin":
                value = (value + 1023) // 1024
            values.append(value)
    return max(values) if values else None


def _make_manifest(
    *,
    command: str,
    subject: Mapping[str, Any],
    fresh: int,
    warm: int,
) -> dict[str, Any]:
    unsigned = {
        "schema": BENCHMARK_COMMAND_SCHEMA,
        "command": command,
        "fresh_repetitions": fresh,
        "warm_repetitions": warm,
        "cache_contract": {
            "fresh": (
                "new spawned Python process and new filesystem copy; "
                "operating-system cache not controlled"
            ),
            "warm": (
                "same long-lived Python process and same filesystem copy; "
                "operating-system cache not controlled"
            ),
        },
        "niceness": _current_niceness(),
        "source_sha256": _source_hashes(),
        "subject": dict(subject),
        "trust_boundary": (
            "diagnostic timings only; fake solver/checker transcript or replay-only "
            "resume; no mathematical acceptance"
        ),
    }
    return _hashed_record(unsigned, "benchmark_manifest_sha256")


def _wrap(
    function: Callable[..., Any],
    recorder: timing.TimingRecorder,
    stage: str,
    operation: str,
) -> Callable[..., Any]:
    @functools.wraps(function)
    def measured(*args: Any, **kwargs: Any) -> Any:
        with recorder.measure(stage, operation):
            return function(*args, **kwargs)

    return measured


@contextlib.contextmanager
def _order_bitset_mode(enabled: bool) -> Iterator[None]:
    """Scope the diagnostic feature switch so benchmark calls cannot leak it."""

    previous = v3._PHASE3_ORDER_BITSETS_ENABLED
    v3._PHASE3_ORDER_BITSETS_ENABLED = enabled
    try:
        yield
    finally:
        v3._PHASE3_ORDER_BITSETS_ENABLED = previous


@contextlib.contextmanager
def _instrument_v3(recorder: timing.TimingRecorder) -> Iterator[None]:
    """Time aggregate v3 boundaries without writing into its namespaces."""

    originals: list[tuple[object, str, Any]] = []

    def patch(owner: object, name: str, replacement: Any) -> None:
        originals.append((owner, name, getattr(owner, name)))
        setattr(owner, name, replacement)

    module_boundaries = (
        ("_phase3_encoding", "encoding", "build"),
        ("_strict_json_lines", "loader", "jsonl_parse"),
        ("_load_learned", "loader", "learned_replay"),
        ("_load_survivors", "loader", "survivor_replay"),
        ("_load_logs", "loader", "log_replay"),
        ("_load_cube_batches", "loader", "cube_replay"),
        ("_run_smoke_gates", "loader", "smoke_replay"),
        (
            "_load_authenticated_three_rhombus_prefix_bank",
            "loader",
            "prefix_bank_replay",
        ),
        ("_load_algebraic_templates", "loader", "algebraic_replay"),
        ("_combined_detection", "classifier", "detect"),
        ("_commit_sat_classification", "classifier_minimizer", "commit"),
        ("_minimize_cap_facts", "minimizer", "cap_facts"),
        ("_minimize_kalmanson_cap_facts", "minimizer", "kalmanson_facts"),
        ("_minimize_shared_pair_antecedent", "minimizer", "shared_pair"),
        ("_manifest", "manifest", "construct"),
        ("_artifact_hashes", "manifest", "artifact_hashes"),
    )
    encoding_class = type(v3._phase3_encoding(projected_static_v3=True))
    try:
        for name, stage, operation in module_boundaries:
            patch(v3, name, _wrap(getattr(v3, name), recorder, stage, operation))

        original_cnf_bytes = encoding_class.cnf_bytes

        @functools.wraps(original_cnf_bytes)
        def cnf_bytes(self: Any, *args: Any, **kwargs: Any) -> bytes:
            with recorder.measure("cnf", "render"):
                return original_cnf_bytes(self, *args, **kwargs)

        patch(encoding_class, "cnf_bytes", cnf_bytes)

        original_parse_dimacs = incremental.parse_dimacs

        @functools.wraps(original_parse_dimacs)
        def parse_dimacs(data: bytes) -> Any:
            with recorder.measure(
                "cnf", "persistent_parse", counters={"bytes": len(data)}
            ):
                return original_parse_dimacs(data)

        patch(incremental, "parse_dimacs", parse_dimacs)

        original_persistent_solve = incremental.IpasirCadicalSolver.solve

        @functools.wraps(original_persistent_solve)
        def persistent_solve(self: Any, timeout_s: int) -> Any:
            with recorder.measure("solver", "persistent_invoke"):
                return original_persistent_solve(self, timeout_s)

        patch(incremental.IpasirCadicalSolver, "solve", persistent_solve)

        original_atomic_bytes = v3._atomic_bytes

        @functools.wraps(original_atomic_bytes)
        def atomic_bytes(path: Path, data: bytes) -> None:
            name = Path(path).name
            if name in {"base.cnf", ".solver.cnf"}:
                stage, operation = "cnf", "write"
            elif name.startswith("terminal."):
                stage, operation = "terminal", "artifact_write"
            elif name == "manifest.json":
                stage, operation = "manifest", "write"
            elif name.endswith(".jsonl"):
                stage, operation = "journal", "rewrite"
            else:
                stage, operation = "artifact", "write"
            with recorder.measure(stage, operation, counters={"bytes": len(data)}):
                original_atomic_bytes(path, data)

        patch(v3, "_atomic_bytes", atomic_bytes)

        original_append = v3._append_record

        @functools.wraps(original_append)
        def append_record(path: Path, value: Mapping[str, Any]) -> bytes:
            with recorder.measure("journal", "append_fsync"):
                return original_append(path, value)

        patch(v3, "_append_record", append_record)

        original_publish = runtime.FilesystemTerminalPublisher.publish

        @functools.wraps(original_publish)
        def publish(self: Any, **kwargs: Any) -> runtime.TerminalPublication:
            with recorder.measure("terminal", "publish"):
                return original_publish(self, **kwargs)

        patch(runtime.FilesystemTerminalPublisher, "publish", publish)
        yield
    finally:
        for owner, name, original in reversed(originals):
            setattr(owner, name, original)


def _driver_kwargs_from_manifest(manifest: Mapping[str, Any]) -> dict[str, Any]:
    configuration = manifest.get("configuration")
    if not isinstance(configuration, Mapping):
        raise BenchmarkError("subject has no configuration object")
    if configuration.get("three_rhombus_prefix_bank") is not None:
        raise BenchmarkError(
            "loader benchmark currently requires a run without a prefix bank; "
            "the manifest does not retain its source path"
        )
    parallel = configuration.get("parallel")
    if not isinstance(parallel, Mapping):
        raise BenchmarkError("subject parallel configuration is malformed")
    bootstrap = configuration.get("bootstrap_results")
    algebraic = configuration.get("algebraic_bootstraps")
    shard = configuration.get("shard")
    publication = configuration.get("manifest_publication", {})
    if publication is None:
        publication = {}
    if not isinstance(publication, Mapping):
        raise BenchmarkError("subject manifest publication configuration is malformed")
    fast_path = publication.get("mode") == "prospective-v1"
    audit_every = publication.get("audit_every_running_publications")
    if fast_path and type(audit_every) is not int:
        raise BenchmarkError(
            "fast-path subject has no explicit manifest audit cadence"
        )
    return {
        "timeout_s": int(configuration["timeout_seconds"]),
        "learned_core_limit": int(configuration["dynamic_learned_core_limit"]),
        "survivor_limit": int(configuration["survivor_limit"]),
        "workers": int(configuration["workers"]),
        "parallel_mode": str(parallel["mode"]),
        "cube_depth": int(parallel["cube_depth"]),
        "cube_artifact_mode": str(parallel["artifact_mode"]),
        "shard_depth": None if shard is None else int(shard["depth"]),
        "shard_index": None if shard is None else int(shard["index"]),
        "bootstrap_results": None if bootstrap is None else bootstrap["path"],
        "algebraic_bootstrap": (
            None if not algebraic else [entry["path"] for entry in algebraic]
        ),
        "projected_static_v3": v3._projected_static_v3_from_configuration(
            configuration, where="loader benchmark subject"
        ),
        "manifest_fast_path": fast_path,
        "manifest_audit_every": audit_every,
        "resume": True,
    }


def _unexpected_backend(*_args: Any, **_kwargs: Any) -> Any:
    raise BenchmarkError("replay-only loader benchmark reached a backend")


def _write_worker_result(
    path: Path,
    work: Callable[[timing.TimingRecorder], Mapping[str, Any]],
) -> None:
    recorder = timing.TimingRecorder()
    result = dict(work(recorder))
    payload: dict[str, Any] = {
        "ok": True,
        "result": result,
        "samples": recorder.samples,
        "process": {"max_rss_kib": _max_rss_kib()},
    }
    _atomic_json(path, payload)


def _loader_worker(run_dir: Path, result_path: Path) -> None:
    def work(recorder: timing.TimingRecorder) -> Mapping[str, Any]:
        manifest = _subject_manifest(run_dir)
        with _instrument_v3(recorder), recorder.measure(
            "loader", "startup_to_ready"
        ):
            return v3.run_driver(
                run_dir,
                **_driver_kwargs_from_manifest(manifest),
                solver_runner=_unexpected_backend,
                checker_runner=_unexpected_backend,
            )

    _write_worker_result(result_path, work)


def _mock_transcript_worker(
    run_dir: Path,
    assignments: tuple[dict[int, bool], ...],
    result_path: Path,
    projected_static_v3: bool,
    order_bitsets_enabled: bool,
    manifest_fast_path: bool,
    manifest_audit_every: int | None,
) -> None:
    def work(recorder: timing.TimingRecorder) -> Mapping[str, Any]:
        calls = 0

        def fake_solver(_cnf: Path, _timeout_s: int, proof: Path | None) -> Any:
            nonlocal calls
            calls += 1
            if 1 <= calls <= len(assignments):
                return v3.sat.SolverResult(
                    "SAT", assignments[calls - 1], 10, "s SATISFIABLE\n", ""
                )
            if calls in (len(assignments) + 1, len(assignments) + 2):
                proof_rerun = calls == len(assignments) + 2
                if proof_rerun != (proof is not None):
                    raise BenchmarkError(
                        "terminal fake solver proof-path phase mismatch"
                    )
                if proof is not None:
                    proof.write_bytes(b"0\n")
                return v3.sat.SolverResult(
                    "UNSAT", {}, 20, "s UNSATISFIABLE\n", ""
                )
            raise BenchmarkError("mock transcript exceeded its configured solver calls")

        def fake_checker(*_args: Any) -> Any:
            return v3.sat.CheckerResult(True, 0, "s VERIFIED\n", "")

        solver = timing.timed_runner(recorder, "solver", fake_solver)
        checker = timing.timed_checker_runner(
            recorder, "terminal.check", fake_checker
        )
        with _order_bitset_mode(order_bitsets_enabled), _instrument_v3(
            recorder
        ), recorder.measure(
            "driver", "bounded_transcript"
        ):
            result = v3.run_driver(
                run_dir,
                timeout_s=5,
                learned_core_limit=1000,
                survivor_limit=100,
                bootstrap_results=None,
                algebraic_bootstrap=None,
                projected_static_v3=projected_static_v3,
                manifest_fast_path=manifest_fast_path,
                manifest_audit_every=manifest_audit_every,
                solver_runner=solver,
                checker_runner=checker,
            )
        if calls != len(assignments) + 2 or result.get("terminal_drat_verified") is not True:
            raise BenchmarkError("mock transcript did not reach verified terminal")
        return result

    _write_worker_result(result_path, work)


def _spawn_worker(
    target: Callable[..., None],
    args: tuple[Any, ...],
    result_path: Path,
    *,
    join_timeout_s: int = 300,
) -> tuple[dict[str, Any], list[dict[str, Any]], dict[str, Any]]:
    result_path.parent.mkdir(parents=True, exist_ok=True)
    process = multiprocessing.get_context("spawn").Process(target=target, args=args)
    process.start()
    process.join(join_timeout_s)
    if process.is_alive():
        process.terminate()
        process.join()
        raise BenchmarkError("fresh benchmark worker exceeded 300 seconds")
    if process.exitcode != 0:
        raise BenchmarkError(
            f"fresh benchmark worker exited with code {process.exitcode}"
        )
    payload = v3._strict_json(result_path)
    if payload.get("ok") is not True:
        raise BenchmarkError(
            "fresh benchmark worker failed: "
            f"{payload.get('error_type')}: {payload.get('error')}"
        )
    result = payload.get("result")
    samples = payload.get("samples")
    process = payload.get("process")
    if not isinstance(result, dict) or not isinstance(samples, list):
        raise BenchmarkError("fresh benchmark worker result is malformed")
    if not isinstance(process, dict):
        raise BenchmarkError("fresh benchmark worker process metrics are malformed")
    if not all(isinstance(sample, dict) for sample in samples):
        raise BenchmarkError("fresh benchmark worker samples are malformed")
    return result, samples, process


def _spawn_worker_with_wall(
    target: Callable[..., None],
    args: tuple[Any, ...],
    result_path: Path,
    *,
    join_timeout_s: int = 900,
) -> tuple[dict[str, Any], list[dict[str, Any]], dict[str, Any], int]:
    """Spawn one worker and include process creation/join wall time."""

    started = time.perf_counter_ns()
    result, samples, process = _spawn_worker(
        target, args, result_path, join_timeout_s=join_timeout_s
    )
    return result, samples, process, time.perf_counter_ns() - started


def _append_samples(
    journal: timing.TimingJournal,
    samples: Sequence[Mapping[str, Any]],
    *,
    benchmark_manifest_sha256: str,
    run_manifest: Mapping[str, Any],
    run_dir: Path,
    cache_condition: timing.CacheCondition,
    repetition: int,
) -> None:
    journal.append(
        timing.TimingContext(
            benchmark_manifest_sha256=benchmark_manifest_sha256,
            subject_manifest_sha256=str(run_manifest["manifest_sha256"]),
            subject_chain_head_sha256=_chain_head(run_dir),
            cache_condition=cache_condition,
            repetition=repetition,
        ),
        samples,
    )


def _write_report(
    output: Path,
    *,
    benchmark_manifest: Mapping[str, Any],
    runs: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    records = timing.TimingJournal(output / "timings.jsonl").read()
    observed = sorted({str(record["stage"]) for record in records})
    unsigned = {
        "schema": BENCHMARK_REPORT_SCHEMA,
        "benchmark_manifest_sha256": benchmark_manifest[
            "benchmark_manifest_sha256"
        ],
        "timing_record_count": len(records),
        "timing_chain_head_sha256": (
            None if not records else records[-1]["record_sha256"]
        ),
        "observed_stage_groups": observed,
        "unobserved_stage_groups": [
            stage for stage in EXPECTED_STAGE_GROUPS if stage not in observed
        ],
        "summary": timing.summarize(records),
        "runs": [dict(run) for run in runs],
    }
    report = _hashed_record(unsigned, "report_sha256")
    _atomic_json(output / "report.json", report)
    return report


def benchmark_loader(
    subject_run: Path,
    output_dir: Path,
    *,
    fresh: int = 3,
    warm: int = 5,
) -> dict[str, Any]:
    """Benchmark authenticated startup replay on immutable run copies."""

    subject_run = subject_run.resolve()
    subject_manifest = _subject_manifest(subject_run)
    if subject_manifest.get("status") not in REPLAY_ONLY_STATUSES:
        raise BenchmarkError("loader subject must have a replay-only terminal status")
    output = _new_output(output_dir, subject=subject_run)
    subject_tree = _tree_sha256(subject_run)
    benchmark_manifest = _make_manifest(
        command="loader",
        subject={
            "path": str(subject_run),
            "tree_sha256": subject_tree,
            "manifest_sha256": subject_manifest["manifest_sha256"],
            "chain_head_sha256": _chain_head(subject_run),
        },
        fresh=fresh,
        warm=warm,
    )
    _atomic_json(output / "benchmark-manifest.json", benchmark_manifest)
    journal = timing.TimingJournal(output / "timings.jsonl")
    runs: list[dict[str, Any]] = []
    warm_copy = output / "runs/warm-copy"

    def run_once(condition: timing.CacheCondition, repetition: int) -> dict[str, Any]:
        if condition == "fresh-process-new-copy":
            run_dir = timing.copy_fixture(
                subject_run, output / f"runs/fresh-{repetition:03d}"
            )
            before = _tree_sha256(run_dir)
            replayed, samples, process_metrics = _spawn_worker(
                _loader_worker,
                (
                    run_dir,
                    output / f"workers/loader-fresh-{repetition:03d}.json",
                ),
                output / f"workers/loader-fresh-{repetition:03d}.json",
            )
        else:
            if not warm_copy.exists():
                timing.copy_fixture(subject_run, warm_copy)
            run_dir = warm_copy
            before = _tree_sha256(run_dir)
            recorder = timing.TimingRecorder()
            with _instrument_v3(recorder), recorder.measure(
                "loader", "startup_to_ready"
            ):
                replayed = v3.run_driver(
                    run_dir,
                    **_driver_kwargs_from_manifest(subject_manifest),
                    solver_runner=_unexpected_backend,
                    checker_runner=_unexpected_backend,
                )
            samples = recorder.samples
        after = _tree_sha256(run_dir)
        if before != subject_tree or after != before:
            raise BenchmarkError("loader replay mutated or mismatched its copy")
        if replayed != subject_manifest:
            raise BenchmarkError("loader replay manifest differs from its subject")
        _append_samples(
            journal,
            samples,
            benchmark_manifest_sha256=benchmark_manifest[
                "benchmark_manifest_sha256"
            ],
            run_manifest=replayed,
            run_dir=run_dir,
            cache_condition=condition,
            repetition=repetition,
        )
        entry = {
            "cache_condition": condition,
            "repetition": repetition,
            "run": str(run_dir.relative_to(output)),
            "status": replayed["status"],
            "manifest_sha256": replayed["manifest_sha256"],
            "tree_sha256_before": before,
            "tree_sha256_after": after,
            "max_rss_kib": (
                process_metrics.get("max_rss_kib")
                if condition == "fresh-process-new-copy"
                else None
            ),
        }
        runs.append(entry)
        return entry

    timing.run_repetitions(run_once, fresh=fresh, warm=warm)
    return _write_report(output, benchmark_manifest=benchmark_manifest, runs=runs)


def _assignment_from_jsonl(
    path: Path,
    index: int,
    *,
    projected_static_v3: bool,
) -> tuple[dict[int, bool], str]:
    assignments, hashes = _assignment_sequence_from_jsonl(
        path,
        index,
        count=1,
        projected_static_v3=projected_static_v3,
    )
    return assignments[0], hashes[0]


def _assignment_sequence_from_jsonl(
    path: Path,
    index: int,
    *,
    count: int,
    indices: Sequence[int] | None = None,
    projected_static_v3: bool,
) -> tuple[tuple[dict[int, bool], ...], tuple[str, ...]]:
    if type(count) is not int or count <= 0:
        raise BenchmarkError("transcript SAT count must be positive")
    records = v3._strict_json_lines(path)
    selected_indices = (
        tuple(range(index, index + count))
        if indices is None
        else tuple(int(selected) for selected in indices)
    )
    if not selected_indices or any(
        selected < 0 or selected >= len(records) for selected in selected_indices
    ):
        raise BenchmarkError(
            "assignment indices are out of bounds: "
            f"indices={selected_indices}, records={len(records)}"
        )
    encoding = v3._phase3_encoding(projected_static_v3=projected_static_v3)
    assignments: list[dict[int, bool]] = []
    hashes: list[str] = []
    for selected in selected_indices:
        record = records[selected]
        assignment = encoding.assignment_from_record(record)
        obj = encoding.decode(assignment)
        encoding.validate(obj, assignment)
        assignments.append(assignment)
        hashes.append(v3._sha256_value(record))
    return tuple(assignments), tuple(hashes)


def benchmark_mock_transcript(
    assignment_jsonl: Path,
    output_dir: Path,
    *,
    assignment_index: int = 0,
    transcript_sat_count: int = 1,
    transcript_indices: Sequence[int] | None = None,
    fresh: int = 3,
    warm: int = 5,
    projected_static_v3: bool = True,
    order_bitsets_enabled: bool = True,
    manifest_fast_path: bool = False,
    manifest_audit_every: int | None = None,
) -> dict[str, Any]:
    """Run a bounded fake SAT-then-UNSAT transcript in fresh namespaces."""

    assignment_jsonl = assignment_jsonl.resolve()
    normalized_transcript_indices = (
        None
        if transcript_indices is None
        else tuple(int(selected) for selected in transcript_indices)
    )
    assignments, assignment_record_sha256s = _assignment_sequence_from_jsonl(
        assignment_jsonl,
        assignment_index,
        count=transcript_sat_count,
        indices=normalized_transcript_indices,
        projected_static_v3=projected_static_v3,
    )
    transcript_sat_count = len(assignments)
    output = _new_output(output_dir)
    benchmark_manifest = _make_manifest(
        command="mock-transcript",
        subject={
            "assignment_jsonl": str(assignment_jsonl),
            "assignment_jsonl_sha256": _sha256_file(assignment_jsonl),
            "assignment_index": assignment_index,
            "transcript_sat_count": transcript_sat_count,
            "transcript_indices": (
                None
                if normalized_transcript_indices is None
                else list(normalized_transcript_indices)
            ),
            "assignment_record_sha256": assignment_record_sha256s[0],
            "assignment_record_sha256s": list(assignment_record_sha256s),
            "projected_static_v3": projected_static_v3,
            "order_bitsets_enabled": order_bitsets_enabled,
            "manifest_fast_path": manifest_fast_path,
            "manifest_audit_every": manifest_audit_every,
            "transcript": ["SAT"] * transcript_sat_count
            + ["UNSAT_WITH_FAKE_VERIFIED_DRAT"],
        },
        fresh=fresh,
        warm=warm,
    )
    _atomic_json(output / "benchmark-manifest.json", benchmark_manifest)
    journal = timing.TimingJournal(output / "timings.jsonl")
    runs: list[dict[str, Any]] = []
    first_fresh: Path | None = None

    def run_once(condition: timing.CacheCondition, repetition: int) -> dict[str, Any]:
        nonlocal first_fresh
        if condition == "fresh-process-new-copy":
            run_dir = output / f"runs/fresh-{repetition:03d}"
            worker_result = output / f"workers/transcript-fresh-{repetition:03d}.json"
            result, samples, process_metrics = _spawn_worker(
                _mock_transcript_worker,
                (
                    run_dir,
                    assignments,
                    worker_result,
                    projected_static_v3,
                    order_bitsets_enabled,
                    manifest_fast_path,
                    manifest_audit_every,
                ),
                worker_result,
            )
            if first_fresh is None:
                first_fresh = run_dir
        else:
            if first_fresh is None:
                raise AssertionError("fresh repetitions must precede warm repetitions")
            run_dir = first_fresh
            before = _tree_sha256(run_dir)
            recorder = timing.TimingRecorder()
            with _order_bitset_mode(order_bitsets_enabled), _instrument_v3(
                recorder
            ), recorder.measure(
                "loader", "startup_to_ready"
            ):
                result = v3.run_driver(
                    run_dir,
                    timeout_s=5,
                    learned_core_limit=1000,
                    survivor_limit=100,
                    bootstrap_results=None,
                    algebraic_bootstrap=None,
                    projected_static_v3=projected_static_v3,
                    manifest_fast_path=manifest_fast_path,
                    manifest_audit_every=manifest_audit_every,
                    resume=True,
                    solver_runner=_unexpected_backend,
                    checker_runner=_unexpected_backend,
                )
            if _tree_sha256(run_dir) != before:
                raise BenchmarkError("warm transcript replay mutated its namespace")
            samples = recorder.samples
        tree = _tree_sha256(run_dir)
        _append_samples(
            journal,
            samples,
            benchmark_manifest_sha256=benchmark_manifest[
                "benchmark_manifest_sha256"
            ],
            run_manifest=result,
            run_dir=run_dir,
            cache_condition=condition,
            repetition=repetition,
        )
        entry = {
            "cache_condition": condition,
            "repetition": repetition,
            "run": str(run_dir.relative_to(output)),
            "status": result["status"],
            "manifest_sha256": result["manifest_sha256"],
            "tree_sha256": tree,
            "max_rss_kib": (
                process_metrics.get("max_rss_kib")
                if condition == "fresh-process-new-copy"
                else None
            ),
        }
        runs.append(entry)
        return entry

    timing.run_repetitions(run_once, fresh=fresh, warm=warm)
    fresh_hashes = {
        run["tree_sha256"]
        for run in runs
        if run["cache_condition"] == "fresh-process-new-copy"
    }
    if len(fresh_hashes) != 1:
        raise BenchmarkError("fresh mocked transcripts are not byte-identical")
    return _write_report(output, benchmark_manifest=benchmark_manifest, runs=runs)


def _nearest_rank_p95(values: Sequence[int]) -> int | None:
    if not values:
        return None
    ordered = sorted(int(value) for value in values)
    return ordered[max(0, math.ceil(0.95 * len(ordered)) - 1)]


def _timing_summary_value(
    report: Mapping[str, Any],
    *,
    stage: str,
    operation: str,
    field: str,
) -> int | None:
    summary = report.get("summary")
    if not isinstance(summary, Mapping):
        return None
    summaries = summary.get("summaries")
    if not isinstance(summaries, list):
        return None
    for item in summaries:
        if not isinstance(item, Mapping):
            continue
        if item.get("stage") == stage and item.get("operation") == operation:
            value = item.get(field)
            return value if type(value) is int else None
    return None


def _fresh_timing_summary(root: Path) -> dict[str, Any]:
    records = timing.TimingJournal(root / "timings.jsonl").read()
    return timing.summarize(
        [
            record
            for record in records
            if record.get("cache_condition") == "fresh-process-new-copy"
        ]
    )


def _stage_summary(summary: Mapping[str, Any]) -> dict[str, dict[str, Any]]:
    summaries = summary.get("summaries")
    if not isinstance(summaries, list):
        raise BenchmarkError("timing summary has no summaries list")
    result: dict[str, dict[str, Any]] = {}
    for item in summaries:
        if not isinstance(item, Mapping):
            raise BenchmarkError("timing summary item is malformed")
        stage = item.get("stage")
        operation = item.get("operation")
        if not isinstance(stage, str) or not isinstance(operation, str):
            raise BenchmarkError("timing summary item has malformed identity")
        result[f"{stage}/{operation}"] = dict(item)
    return result


def _stage_ratios(
    full: Mapping[str, Mapping[str, Any]],
    fast: Mapping[str, Mapping[str, Any]],
) -> dict[str, dict[str, float]]:
    ratios: dict[str, dict[str, float]] = {}
    for key in sorted(set(full) & set(fast)):
        full_item = full[key]
        fast_item = fast[key]
        ratio: dict[str, float] = {}
        for field in ("wall_ns_median", "wall_ns_p95", "cpu_ns_median", "cpu_ns_p95"):
            full_value = full_item.get(field)
            fast_value = fast_item.get(field)
            if type(full_value) is int and full_value > 0 and type(fast_value) is int:
                ratio[field] = fast_value / full_value
        if ratio:
            ratios[key] = ratio
    return ratios


def _fresh_rss_p95(report: Mapping[str, Any]) -> int | None:
    runs = report.get("runs")
    if not isinstance(runs, list):
        return None
    values = [
        int(run["max_rss_kib"])
        for run in runs
        if isinstance(run, Mapping)
        and run.get("cache_condition") == "fresh-process-new-copy"
        and type(run.get("max_rss_kib")) is int
    ]
    return _nearest_rank_p95(values)


def _semantic_manifest_projection(manifest: Mapping[str, Any]) -> dict[str, Any]:
    """Remove only publication-chain metadata from a full/fast comparison."""

    projection = json.loads(json.dumps(manifest, sort_keys=True))
    projection.pop("manifest_sha256", None)
    projection.pop("previous_manifest_sha256", None)
    configuration = projection.get("configuration")
    if isinstance(configuration, dict):
        configuration.pop("manifest_publication", None)
    return projection


def _non_manifest_artifacts(root: Path) -> dict[str, str]:
    artifacts: dict[str, str] = {}
    for path in sorted(root.rglob("*")):
        if not path.is_file():
            continue
        if path.name.startswith("manifest"):
            continue
        relative = path.relative_to(root).as_posix()
        artifacts[relative] = _sha256_file(path)
    return artifacts


def _parse_transcript_indices(value: str) -> tuple[int, ...]:
    pieces = tuple(piece.strip() for piece in value.split(","))
    if not pieces or any(piece == "" for piece in pieces):
        raise argparse.ArgumentTypeError(
            "transcript indices must be a comma-separated list"
        )
    try:
        indices = tuple(int(piece) for piece in pieces)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(
            "transcript indices must be integers"
        ) from exc
    if any(index < 0 for index in indices):
        raise argparse.ArgumentTypeError("transcript indices must be nonnegative")
    return indices


def _parse_shard_family(value: str) -> tuple[str, int]:
    """Parse the stable ``name:index`` label used by the real A/B canary."""

    separator = ":" if ":" in value else "="
    name, _, raw_index = value.partition(separator)
    if not name or not raw_index or any(
        not (character.isalnum() or character in "._-") for character in name
    ):
        raise argparse.ArgumentTypeError(
            "shard family must be NAME:INDEX with a safe NAME"
        )
    try:
        index = int(raw_index)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(
            "shard family index must be an integer"
        ) from exc
    if index < 0:
        raise argparse.ArgumentTypeError("shard family index must be nonnegative")
    return name, index


def _sample_wall_ns(
    samples: Sequence[Mapping[str, Any]], *, stage: str, operation: str
) -> int | None:
    values = [
        int(sample["wall_ns"])
        for sample in samples
        if sample.get("stage") == stage
        and sample.get("operation") == operation
        and type(sample.get("wall_ns")) is int
    ]
    if len(values) != 1:
        return None
    return values[0]


_PROFILE_BUCKETS = (
    "loader_replay",
    "cnf_construction",
    "manifest_hash",
    "solver",
    "terminal_proof",
    "certificate_minimizer",
    "journal_io",
    "artifact_io",
    "terminal_publication",
    "driver_total",
    "other",
)


def _profile_bucket(stage: str) -> str:
    if stage == "loader":
        return "loader_replay"
    if stage in {"encoding", "cnf"}:
        return "cnf_construction"
    if stage == "manifest":
        return "manifest_hash"
    if stage == "solver":
        return "solver"
    if stage == "terminal.check":
        return "terminal_proof"
    if stage in {"classifier", "classifier_minimizer", "minimizer"}:
        return "certificate_minimizer"
    if stage == "journal":
        return "journal_io"
    if stage == "artifact":
        return "artifact_io"
    if stage == "terminal":
        return "terminal_publication"
    if stage == "driver":
        return "driver_total"
    return "other"


def _profile_stats(samples: Sequence[Mapping[str, Any]]) -> dict[str, Any]:
    wall = sorted(int(sample["wall_ns"]) for sample in samples)
    cpu = sorted(int(sample["cpu_ns"]) for sample in samples)
    if not wall:
        return {
            "sample_count": 0,
            "wall_ns_total": 0,
            "cpu_ns_total": 0,
            "wall_ns_median": None,
            "wall_ns_p95": None,
            "cpu_ns_median": None,
            "cpu_ns_p95": None,
        }
    p95 = max(0, math.ceil(0.95 * len(wall)) - 1)
    middle = len(wall) // 2
    if len(wall) % 2:
        wall_median = wall[middle]
        cpu_median = cpu[middle]
    else:
        wall_median = (wall[middle - 1] + wall[middle]) // 2
        cpu_median = (cpu[middle - 1] + cpu[middle]) // 2
    return {
        "sample_count": len(wall),
        "wall_ns_total": sum(wall),
        "cpu_ns_total": sum(cpu),
        "wall_ns_median": wall_median,
        "wall_ns_p95": wall[p95],
        "cpu_ns_median": cpu_median,
        "cpu_ns_p95": cpu[p95],
    }


def _profile_observation(
    label: str,
    samples: Sequence[Mapping[str, Any]],
    *,
    source_kind: str,
    source_path: Path,
) -> dict[str, Any]:
    checked: list[dict[str, Any]] = []
    for sample in samples:
        if not isinstance(sample, Mapping):
            raise BenchmarkError(f"{source_path}: timing sample is not an object")
        if not isinstance(sample.get("stage"), str) or not isinstance(
            sample.get("operation"), str
        ):
            raise BenchmarkError(
                f"{source_path}: timing sample identity is malformed"
            )
        if type(sample.get("wall_ns")) is not int or type(
            sample.get("cpu_ns")
        ) is not int:
            raise BenchmarkError(
                f"{source_path}: timing sample clocks are malformed"
            )
        checked.append(dict(sample))

    by_stage: dict[tuple[str, str], list[Mapping[str, Any]]] = {}
    by_bucket: dict[str, list[Mapping[str, Any]]] = {
        bucket: [] for bucket in _PROFILE_BUCKETS
    }
    for sample in checked:
        identity = (str(sample["stage"]), str(sample["operation"]))
        by_stage.setdefault(identity, []).append(sample)
        by_bucket[_profile_bucket(identity[0])].append(sample)

    stages = {
        f"{stage}/{operation}": _profile_stats(group)
        for (stage, operation), group in sorted(by_stage.items())
    }
    buckets = {
        bucket: _profile_stats(by_bucket[bucket])
        for bucket in _PROFILE_BUCKETS
    }
    driver = buckets["driver_total"]
    solver = buckets["solver"]
    driver_wall = driver["wall_ns_total"]
    return {
        "label": label,
        "source_kind": source_kind,
        "source_path": str(source_path.resolve()),
        "source_sha256": _sha256_file(source_path),
        "sample_count": len(checked),
        "stages": stages,
        "buckets": buckets,
        "derived": {
            "solver_wall_fraction_of_driver_total": (
                None
                if driver_wall <= 0
                else solver["wall_ns_total"] / driver_wall
            ),
            "non_solver_components_are_non_additive": True,
        },
    }


def _read_worker_samples(path: Path) -> list[dict[str, Any]]:
    payload = v3._strict_json(path)
    if not isinstance(payload, Mapping) or payload.get("ok") is not True:
        raise BenchmarkError(f"{path}: worker result is not successful")
    samples = payload.get("samples")
    if not isinstance(samples, list):
        raise BenchmarkError(f"{path}: worker result has no timing samples")
    return [dict(sample) for sample in samples]


def benchmark_cold_start_profile(
    worker_json: Sequence[Path],
    timing_journals: Sequence[Path],
    output_dir: Path,
) -> dict[str, Any]:
    """Profile fresh worker samples without touching their run namespaces.

    Component buckets intentionally remain diagnostic: nested boundaries such
    as manifest construction and artifact hashing are not summed into an
    end-to-end total.  The driver bucket is the only end-to-end boundary.
    """

    if not worker_json and not timing_journals:
        raise BenchmarkError("cold-start profile needs a worker or timing journal")
    output = _new_output(output_dir)
    observations: list[dict[str, Any]] = []
    inputs: list[dict[str, Any]] = []
    loaded_sources: list[tuple[str, Path, list[dict[str, Any]]]] = []
    for path in tuple(worker_json):
        path = path.resolve()
        if not path.is_file():
            raise BenchmarkError(f"missing worker timing artifact: {path}")
        samples = _read_worker_samples(path)
        loaded_sources.append(("fresh-worker", path, samples))
        observations.append(
            _profile_observation(
                path.stem,
                samples,
                source_kind="fresh-worker",
                source_path=path,
            )
        )
        inputs.append(
            {
                "kind": "fresh-worker",
                "path": str(path),
                "sha256": _sha256_file(path),
            }
        )
    for path in tuple(timing_journals):
        path = path.resolve()
        if not path.is_file():
            raise BenchmarkError(f"missing timing journal: {path}")
        records = timing.TimingJournal(path).read()
        fresh = [
            record
            for record in records
            if record.get("cache_condition") == "fresh-process-new-copy"
        ]
        if not fresh:
            raise BenchmarkError(f"{path}: timing journal has no fresh records")
        loaded_sources.append(("fresh-timing-journal", path, fresh))
        observations.append(
            _profile_observation(
                path.stem,
                fresh,
                source_kind="fresh-timing-journal",
                source_path=path,
            )
        )
        inputs.append(
            {
                "kind": "fresh-timing-journal",
                "path": str(path),
                "sha256": _sha256_file(path),
            }
        )

    all_samples: list[Mapping[str, Any]] = []
    for _kind, _path, samples in loaded_sources:
        all_samples.extend(samples)
    aggregate_source = output / "profile-inputs.json"
    _atomic_json(aggregate_source, {"inputs": inputs})
    aggregate = _profile_observation(
        "all-inputs",
        all_samples,
        source_kind="profile-aggregate",
        source_path=aggregate_source,
    )
    unsigned = {
        "schema": COLD_START_PROFILE_SCHEMA,
        "command": "cold-start-profile",
        "inputs": inputs,
        "observations": observations,
        "aggregate": aggregate,
        "interpretation": {
            "driver_total": "end-to-end observed driver boundary",
            "component_buckets": "diagnostic boundaries; nested timings may overlap",
            "persistent_solver": (
                "reported under solver/persistent_invoke when instrumented"
            ),
            "os_cache_control": "none",
        },
        "trust_boundary": (
            "read-only diagnostic profile; source worker and timing journals are "
            "hash-bound and no run artifact is rewritten"
        ),
    }
    manifest = _hashed_record(
        {
            "schema": BENCHMARK_COMMAND_SCHEMA,
            "command": "cold-start-profile",
            "source_sha256": _source_hashes(),
            "subject": {"inputs": inputs},
            "trust_boundary": unsigned["trust_boundary"],
        },
        "benchmark_manifest_sha256",
    )
    _atomic_json(output / "benchmark-manifest.json", manifest)
    report = _hashed_record(
        {
            **unsigned,
            "benchmark_manifest_sha256": manifest["benchmark_manifest_sha256"],
        },
        "report_sha256",
    )
    _atomic_json(output / "report.json", report)
    return report


def benchmark_prefix_bank_cache_ab(
    bank_path: Path,
    output_dir: Path,
    *,
    expected_root_sha256: str,
    expected_source_prefix_sha256: str,
    warm_repetitions: int = 3,
) -> dict[str, Any]:
    """Measure one authoritative replay against disk-cache validation.

    The warm arm still validates the pinned bank root, manifest, cache
    envelope, and canonical certificate stream.  It is a same-process
    diagnostic, so OS page-cache effects are reported rather than hidden.
    """

    if warm_repetitions <= 0:
        raise BenchmarkError("warm_repetitions must be positive")
    bank = bank_path.resolve()
    output = _new_output(output_dir, subject=bank)
    if not bank.is_dir():
        raise BenchmarkError(f"missing prefix-bank directory: {bank}")
    manifest_path = bank / "manifest.json"
    manifest = v3._strict_json(manifest_path)
    source = manifest.get("source")
    if not isinstance(source, Mapping):
        raise BenchmarkError("prefix-bank manifest has no source metadata")
    actual_source_prefix_sha256 = source.get("prefix_sha256")
    if actual_source_prefix_sha256 != expected_source_prefix_sha256:
        raise BenchmarkError("prefix-bank source-prefix pin does not match manifest")
    actual_root_sha256 = _sha256_file(bank / "SHA256SUMS")
    if actual_root_sha256 != expected_root_sha256:
        raise BenchmarkError("prefix-bank root pin does not match SHA256SUMS")

    producer_source_sha256 = v3._prefix_bank_cache_source_sha256()
    cold_start = time.perf_counter_ns()
    authenticated = v3._load_authenticated_three_rhombus_prefix_bank(
        bank,
        expected_root_sha256=expected_root_sha256,
        expected_source_prefix_sha256=expected_source_prefix_sha256,
    )
    cold_wall_ns = time.perf_counter_ns() - cold_start
    cache_path = output / "prefix-cache.json"
    cache_start = time.perf_counter_ns()
    v3.prefix_bank_cache.write_cache(
        cache_path,
        bank_path=bank,
        expected_root_sha256=expected_root_sha256,
        expected_source_prefix_sha256=expected_source_prefix_sha256,
        producer_source_sha256=producer_source_sha256,
        descriptor=authenticated["configuration"],
        entries=authenticated["entries"],
    )
    cache_write_wall_ns = time.perf_counter_ns() - cache_start

    warm_wall_ns: list[int] = []
    for _ in range(warm_repetitions):
        warm_start = time.perf_counter_ns()
        result = v3.prefix_bank_cache.try_load(
            cache_path,
            bank_path=bank,
            expected_root_sha256=expected_root_sha256,
            expected_source_prefix_sha256=expected_source_prefix_sha256,
            producer_source_sha256=producer_source_sha256,
        )
        elapsed = time.perf_counter_ns() - warm_start
        if not result.hit or result.entries is None or result.descriptor is None:
            raise BenchmarkError(
                f"prefix-bank cache warm validation failed: {result.reason}"
            )
        if (
            result.descriptor != authenticated["configuration"]
            or result.entries != authenticated["entries"]
        ):
            raise BenchmarkError("prefix-bank cache differs from cold replay")
        warm_wall_ns.append(elapsed)
    ordered_warm = sorted(warm_wall_ns)
    warm_median_ns = ordered_warm[len(ordered_warm) // 2]
    unsigned = {
        "schema": PREFIX_CACHE_AB_REPORT_SCHEMA,
        "command": "prefix-cache-ab",
        "subject": {
            "bank_path": str(bank),
            "bank_sha256sums_root_sha256": expected_root_sha256,
            "source_prefix_sha256": expected_source_prefix_sha256,
            "producer_source_sha256": producer_source_sha256,
            "entry_count": len(authenticated["entries"]),
        },
        "cold_full_replay": {"wall_ns": cold_wall_ns},
        "cache_publication": {
            "wall_ns": cache_write_wall_ns,
            "path": str(cache_path),
            "sha256": _sha256_file(cache_path),
            "bytes": cache_path.stat().st_size,
        },
        "warm_cache_validation": {
            "wall_ns": warm_wall_ns,
            "wall_ns_median": warm_median_ns,
            "hit_count": warm_repetitions,
        },
        "derived": {
            "warm_over_cold": warm_median_ns / max(cold_wall_ns, 1),
            "cold_over_warm_median": cold_wall_ns / max(warm_median_ns, 1),
            "same_process": True,
            "os_cache_control": "none",
        },
        "trust_boundary": (
            "diagnostic cache benchmark; the cold arm is the authoritative full "
            "replay, and production cache hits require terminal or explicit "
            "audit replay"
        ),
    }
    manifest_record = _hashed_record(
        {
            "schema": BENCHMARK_COMMAND_SCHEMA,
            "command": "prefix-cache-ab",
            "source_sha256": _source_hashes(),
            "subject": unsigned["subject"],
            "trust_boundary": unsigned["trust_boundary"],
        },
        "benchmark_manifest_sha256",
    )
    _atomic_json(output / "benchmark-manifest.json", manifest_record)
    report = _hashed_record(
        {
            **unsigned,
            "benchmark_manifest_sha256": manifest_record[
                "benchmark_manifest_sha256"
            ],
        },
        "report_sha256",
    )
    _atomic_json(output / "report.json", report)
    return report


def _prefix_bank_payload_sha256(
    descriptor: Mapping[str, Any], entries: Sequence[Mapping[str, Any]]
) -> str:
    return _sha256_bytes(
        v3._canonical_bytes(
            {"configuration": dict(descriptor), "entries": list(entries)}
        )
    )


def _prefix_cache_process_worker(
    bank_path: Path,
    expected_root_sha256: str,
    expected_source_prefix_sha256: str,
    cache_path: Path | None,
    result_path: Path,
) -> None:
    """Measure one fresh projected-static-v3 prefix-loader boundary."""

    def work(recorder: timing.TimingRecorder) -> Mapping[str, Any]:
        with _instrument_v3(recorder), recorder.measure(
            "loader", "process_startup_to_ready"
        ):
            if cache_path is None:
                authenticated = v3._load_authenticated_three_rhombus_prefix_bank(
                    bank_path,
                    expected_root_sha256=expected_root_sha256,
                    expected_source_prefix_sha256=expected_source_prefix_sha256,
                )
                descriptor = authenticated["configuration"]
                entries = authenticated["entries"]
                cache_hit = False
            else:
                producer_source_sha256 = v3._prefix_bank_cache_source_sha256()
                with recorder.measure("loader", "prefix_bank_cache_validate"):
                    cache_result = v3.prefix_bank_cache.try_load(
                        cache_path,
                        bank_path=bank_path,
                        expected_root_sha256=expected_root_sha256,
                        expected_source_prefix_sha256=expected_source_prefix_sha256,
                        producer_source_sha256=producer_source_sha256,
                    )
                if (
                    not cache_result.hit
                    or cache_result.descriptor is None
                    or cache_result.entries is None
                ):
                    raise BenchmarkError(
                        "fresh-process prefix-bank cache validation failed: "
                        f"{cache_result.reason}"
                    )
                descriptor = v3._validate_three_rhombus_prefix_descriptor(
                    cache_result.descriptor,
                    where="fresh-process cached prefix bank",
                )
                if descriptor is None:
                    raise BenchmarkError(
                        "fresh-process cached prefix-bank descriptor is invalid"
                    )
                entries = cache_result.entries
                cache_hit = True
            return {
                "cache_hit": cache_hit,
                "entry_count": len(entries),
                "descriptor_sha256": _sha256_bytes(
                    v3._canonical_bytes(descriptor)
                ),
                "payload_sha256": _prefix_bank_payload_sha256(
                    descriptor, entries
                ),
            }

    _write_worker_result(result_path, work)


def benchmark_prefix_bank_process_ab(
    bank_path: Path,
    cache_path: Path,
    output_dir: Path,
    *,
    expected_root_sha256: str,
    expected_source_prefix_sha256: str,
    fresh_repetitions: int = 3,
    worker_timeout_s: int = 900,
) -> dict[str, Any]:
    """Compare full replay and cache validation in fresh OS processes.

    This is intentionally a loader-boundary benchmark rather than a terminal
    proof benchmark.  Exact payload equality between the two arms is required;
    the full replay arm remains the authority for the cache result.
    """

    if fresh_repetitions <= 0:
        raise BenchmarkError("fresh_repetitions must be positive")
    if worker_timeout_s <= 0:
        raise BenchmarkError("worker_timeout_s must be positive")
    bank = bank_path.resolve()
    cache = cache_path.resolve()
    output = _new_output(output_dir, subject=bank)
    if not bank.is_dir():
        raise BenchmarkError(f"missing prefix-bank directory: {bank}")
    if not cache.is_file():
        raise BenchmarkError(f"missing prefix-bank cache: {cache}")
    if cache == bank or bank in cache.parents:
        raise BenchmarkError("prefix-bank cache must be outside the source bank")

    producer_source_sha256 = v3._prefix_bank_cache_source_sha256()
    arms: dict[str, list[dict[str, Any]]] = {"full": [], "cache": []}
    for arm, arm_cache in (("full", None), ("cache", cache)):
        arm_output = output / arm
        arm_output.mkdir(parents=True)
        for repetition in range(fresh_repetitions):
            result_path = arm_output / f"worker-{repetition:03d}.json"
            result, samples, process, worker_wall_ns = _spawn_worker_with_wall(
                _prefix_cache_process_worker,
                (
                    bank,
                    expected_root_sha256,
                    expected_source_prefix_sha256,
                    arm_cache,
                    result_path,
                ),
                result_path,
                join_timeout_s=worker_timeout_s,
            )
            max_rss_kib = process.get("max_rss_kib")
            if type(max_rss_kib) is not int or max_rss_kib <= 0:
                raise BenchmarkError(
                    f"{arm} repetition {repetition} has no positive peak RSS"
                )
            arms[arm].append(
                {
                    "repetition": repetition,
                    "cache_condition": "fresh-process-same-copy",
                    "worker_wall_ns": worker_wall_ns,
                    "max_rss_kib": max_rss_kib,
                    "result": result,
                    "timing_summary": timing.summarize(samples),
                }
            )

    full_results = [run["result"] for run in arms["full"]]
    cache_results = [run["result"] for run in arms["cache"]]
    full_payloads = {result.get("payload_sha256") for result in full_results}
    cache_payloads = {result.get("payload_sha256") for result in cache_results}
    exact_payload_agreement = (
        len(full_payloads) == 1
        and full_payloads == cache_payloads
        and all(result.get("cache_hit") is False for result in full_results)
        and all(result.get("cache_hit") is True for result in cache_results)
    )
    full_wall = [int(run["worker_wall_ns"]) for run in arms["full"]]
    cache_wall = [int(run["worker_wall_ns"]) for run in arms["cache"]]
    full_rss = [int(run["max_rss_kib"]) for run in arms["full"]]
    cache_rss = [int(run["max_rss_kib"]) for run in arms["cache"]]
    full_wall_p95 = _nearest_rank_p95(full_wall)
    cache_wall_p95 = _nearest_rank_p95(cache_wall)
    full_rss_p95 = _nearest_rank_p95(full_rss)
    cache_rss_p95 = _nearest_rank_p95(cache_rss)
    wall_ratio = (
        None
        if full_wall_p95 is None or full_wall_p95 <= 0 or cache_wall_p95 is None
        else cache_wall_p95 / full_wall_p95
    )
    rss_ratio = (
        None
        if full_rss_p95 is None or full_rss_p95 <= 0 or cache_rss_p95 is None
        else cache_rss_p95 / full_rss_p95
    )
    unsigned = {
        "schema": PREFIX_CACHE_PROCESS_AB_REPORT_SCHEMA,
        "command": "prefix-cache-process-ab",
        "subject": {
            "bank_path": str(bank),
            "cache_path": str(cache),
            "bank_sha256sums_root_sha256": expected_root_sha256,
            "source_prefix_sha256": expected_source_prefix_sha256,
            "producer_source_sha256": producer_source_sha256,
            "fresh_repetitions": fresh_repetitions,
            "worker_timeout_seconds": worker_timeout_s,
        },
        "arms": arms,
        "metrics": {
            "full_worker_wall_ns_p95": full_wall_p95,
            "cache_worker_wall_ns_p95": cache_wall_p95,
            "cache_over_full_worker_wall_ratio": wall_ratio,
            "full_peak_rss_kib_p95": full_rss_p95,
            "cache_peak_rss_kib_p95": cache_rss_p95,
            "cache_over_full_rss_ratio": rss_ratio,
        },
        "gate": {
            "exact_payload_agreement": exact_payload_agreement,
            "max_cache_over_full_wall_ratio": 0.20,
            "max_cache_over_full_rss_ratio": 1.10,
            "wall_pass": wall_ratio is not None and wall_ratio <= 0.20,
            "rss_pass": rss_ratio is not None and rss_ratio <= 1.10,
            "process_level_prefix_cache_gate_pass": (
                exact_payload_agreement
                and wall_ratio is not None
                and wall_ratio <= 0.20
                and rss_ratio is not None
                and rss_ratio <= 1.10
            ),
        },
        "trust_boundary": (
            "fresh-process diagnostic at the projected-static-v3 prefix-loader "
            "boundary; full replay is authoritative, exact payload equality is "
            "required, and cache validation is not a proof or terminal result"
        ),
    }
    manifest_record = _hashed_record(
        {
            "schema": BENCHMARK_COMMAND_SCHEMA,
            "command": "prefix-cache-process-ab",
            "source_sha256": _source_hashes(),
            "subject": unsigned["subject"],
            "trust_boundary": unsigned["trust_boundary"],
        },
        "benchmark_manifest_sha256",
    )
    _atomic_json(output / "benchmark-manifest.json", manifest_record)
    report = _hashed_record(
        {
            **unsigned,
            "benchmark_manifest_sha256": manifest_record[
                "benchmark_manifest_sha256"
            ],
        },
        "report_sha256",
    )
    _atomic_json(output / "report.json", report)
    return report


def _compiled_loader_state_digest(
    records: Sequence[Mapping[str, Any]],
    clauses: Sequence[Sequence[int]],
    bank: Any,
) -> dict[str, Any]:
    """Return exact, ordered identities for one compiled loader state."""

    def array_sha256(values: Iterator[Any]) -> str:
        """Hash one canonical JSON array without materializing the array."""

        digest = hashlib.sha256()
        digest.update(b"[")
        first = True
        for value in values:
            if not first:
                digest.update(b",")
            digest.update(v3._canonical_bytes(value))
            first = False
        digest.update(b"]")
        return digest.hexdigest()

    def active_values() -> Iterator[Mapping[str, Any]]:
        for key, certificate in bank.active.items():
            yield {
                "key": [
                    [int(center), list(support), bool(exact)]
                    for center, support, exact in key
                ],
                # The certificate is already immutable for this diagnostic
                # boundary; do not copy 40k nested dictionaries just to hash
                # their canonical representation.
                "certificate": certificate,
            }

    payload = {
        "record_count": len(records),
        "clause_count": len(clauses),
        "records_sha256": array_sha256(iter(records)),
        "clauses_sha256": array_sha256((list(clause) for clause in clauses)),
        "active_entries_sha256": array_sha256(active_values()),
        "index_sha256": _sha256_bytes(
            v3._canonical_bytes(bank.index_snapshot())
        ),
    }
    return {
        **payload,
        "state_sha256": _sha256_bytes(v3._canonical_bytes(payload)),
    }


def _compiled_loader_process_worker(
    run_dir: Path,
    mode: str,
    result_path: Path,
) -> None:
    """Run one fresh-process full replay or compiled-cache hit."""

    if mode not in {"full", "cache"}:
        raise BenchmarkError(f"unknown compiled-loader worker mode: {mode}")

    def work(recorder: timing.TimingRecorder) -> Mapping[str, Any]:
        manifest = _subject_manifest(run_dir)
        configuration = manifest.get("configuration")
        if not isinstance(configuration, Mapping):
            raise BenchmarkError("compiled-loader subject has no configuration")
        projected_static_v3 = v3._projected_static_v3_from_configuration(
            configuration, where="compiled-loader benchmark subject"
        )
        encoding = v3._phase3_encoding(
            projected_static_v3=projected_static_v3
        )
        source_path = run_dir / "learned-certificates.jsonl"
        cache_path = run_dir / v3.COMPILED_LOADER_CACHE_NAME
        scan = runtime.JournalScan()
        cache_reason = "not-requested"
        source_identity: Mapping[str, Any] | None = None
        if mode == "full":
            with _instrument_v3(recorder), recorder.measure(
                "loader", "full_semantic_replay"
            ):
                records, bank, clauses = v3._load_learned(
                    source_path,
                    encoding,
                    stream_scan=scan,
                )
        else:
            with _instrument_v3(recorder), recorder.measure(
                "loader", "compiled_cache_hit"
            ):
                cache_result = v3.loader_cache.try_load(
                    cache_path,
                    source_path=source_path,
                    configuration=configuration,
                    loader_source_sha256=v3._loader_source_sha256(),
                )
                cache_reason = cache_result.reason
                if not cache_result.hit or cache_result.payload is None:
                    raise BenchmarkError(
                        f"compiled-loader cache did not hit: {cache_result.reason}"
                    )
                if cache_result.source is not None:
                    v3.loader_cache.prime_journal_scan(
                        scan, cache_result.source, source_path
                    )
                    source_identity = cache_result.source.as_dict()
                records, bank, clauses = v3._cached_learned_state(
                    cache_result.payload
                )
                del cache_result
        state = _compiled_loader_state_digest(records, clauses, bank)
        return {
            "mode": mode,
            "cache_hit": mode == "cache",
            "cache_reason": cache_reason,
            "source_identity": source_identity,
            **state,
        }

    _write_worker_result(result_path, work)


def _materialize_compiled_loader_fixture(
    source_path: Path,
    fixture_dir: Path,
) -> dict[str, Any]:
    """Translate one legacy authenticated bank into a cache-bearing v3 run."""

    source = source_path.resolve()

    def unknown_solver(
        _cnf: Path, _timeout_s: int, _proof: Path | None
    ) -> Any:
        return v3.sat.SolverResult("UNKNOWN", {}, 0, "", "fixture only")

    started = time.perf_counter_ns()
    result = v3.run_driver(
        fixture_dir,
        timeout_s=5,
        learned_core_limit=1,
        survivor_limit=1,
        bootstrap_results=source,
        algebraic_bootstrap=None,
        projected_static_v3=False,
        compiled_loader_cache=True,
        solver_runner=unknown_solver,
        checker_runner=_unexpected_backend,
    )
    elapsed = time.perf_counter_ns() - started
    cache_path = fixture_dir / v3.COMPILED_LOADER_CACHE_NAME
    if result.get("status") != "UNKNOWN":
        raise BenchmarkError(
            "compiled-loader fixture did not stop at the controlled UNKNOWN boundary"
        )
    if not cache_path.is_file():
        raise BenchmarkError("compiled-loader fixture did not publish its cache")
    manifest = _subject_manifest(fixture_dir)
    source_identity = v3.loader_cache.source_identity(
        fixture_dir / "learned-certificates.jsonl"
    )
    return {
        "source_path": str(source),
        "fixture_path": str(fixture_dir),
        "cache_path": str(cache_path),
        "source_record_count": source_identity.record_count,
        "source_byte_count": source_identity.byte_count,
        "translated_record_count": int(manifest["counts"]["learned_core_count"]),
        "translated_source_sha256": source_identity.file_sha256,
        "fixture_status": result.get("status"),
        "materialization_wall_ns": elapsed,
        "fixture_manifest_sha256": manifest["manifest_sha256"],
        "fixture_cache_sha256": _sha256_file(cache_path),
    }


def benchmark_compiled_loader_process_ab(
    source_paths: Sequence[Path],
    output_dir: Path,
    *,
    fresh_repetitions: int = 3,
    worker_timeout_s: int = 1_800,
) -> dict[str, Any]:
    """Compare full semantic replay and the exact v3 compiled-cache hit path."""

    if len(source_paths) != 2:
        raise BenchmarkError(
            "compiled-loader process A/B requires exactly two source banks"
        )
    if fresh_repetitions <= 0:
        raise BenchmarkError("fresh_repetitions must be positive")
    if worker_timeout_s <= 0:
        raise BenchmarkError("worker_timeout_s must be positive")
    sources = tuple(path.resolve() for path in source_paths)
    if len(set(sources)) != len(sources):
        raise BenchmarkError("compiled-loader source banks must be distinct")
    output = _new_output(output_dir, subject=sources[0])
    for source in sources:
        if not source.is_file():
            raise BenchmarkError(f"missing compiled-loader source: {source}")
        if output == source or output in source.parents:
            raise BenchmarkError(
                "compiled-loader benchmark output must be disjoint from sources"
            )

    subjects: list[dict[str, Any]] = []
    for index, source in enumerate(sources):
        fixture = output / "fixtures" / f"bank-{index:02d}"
        subjects.append(_materialize_compiled_loader_fixture(source, fixture))

    benchmark_runs: list[dict[str, Any]] = []
    for subject_index, subject in enumerate(subjects):
        fixture = Path(subject["fixture_path"])
        arms: dict[str, list[dict[str, Any]]] = {"full": [], "cache": []}
        for mode in ("full", "cache"):
            arm_output = output / "workers" / f"bank-{subject_index:02d}" / mode
            arm_output.mkdir(parents=True, exist_ok=True)
            for repetition in range(fresh_repetitions):
                result_path = arm_output / f"worker-{repetition:03d}.json"
                result, samples, process, worker_wall_ns = (
                    _spawn_worker_with_wall(
                        _compiled_loader_process_worker,
                        (fixture, mode, result_path),
                        result_path,
                        join_timeout_s=worker_timeout_s,
                    )
                )
                max_rss_kib = process.get("max_rss_kib")
                if type(max_rss_kib) is not int or max_rss_kib <= 0:
                    raise BenchmarkError(
                        f"{mode} bank {subject_index} has no positive peak RSS"
                    )
                arms[mode].append(
                    {
                        "repetition": repetition,
                        "cache_condition": "fresh-process-same-fixture",
                        "worker_wall_ns": worker_wall_ns,
                        "max_rss_kib": max_rss_kib,
                        "result": result,
                        "timing_summary": timing.summarize(samples),
                    }
                )
        full_results = [run["result"] for run in arms["full"]]
        cache_results = [run["result"] for run in arms["cache"]]
        full_states = {result.get("state_sha256") for result in full_results}
        cache_states = {result.get("state_sha256") for result in cache_results}
        exact_state_agreement = (
            len(full_states) == 1
            and full_states == cache_states
            and all(result.get("cache_hit") is False for result in full_results)
            and all(result.get("cache_hit") is True for result in cache_results)
        )
        full_wall = [int(run["worker_wall_ns"]) for run in arms["full"]]
        cache_wall = [int(run["worker_wall_ns"]) for run in arms["cache"]]
        full_rss = [int(run["max_rss_kib"]) for run in arms["full"]]
        cache_rss = [int(run["max_rss_kib"]) for run in arms["cache"]]
        full_wall_p95 = _nearest_rank_p95(full_wall)
        cache_wall_p95 = _nearest_rank_p95(cache_wall)
        full_rss_p95 = _nearest_rank_p95(full_rss)
        cache_rss_p95 = _nearest_rank_p95(cache_rss)
        cache_over_full_wall_ratio = (
            None
            if full_wall_p95 is None
            or full_wall_p95 <= 0
            or cache_wall_p95 is None
            else cache_wall_p95 / full_wall_p95
        )
        cache_over_full_rss_ratio = (
            None
            if full_rss_p95 is None
            or full_rss_p95 <= 0
            or cache_rss_p95 is None
            else cache_rss_p95 / full_rss_p95
        )
        benchmark_runs.append(
            {
                "subject": subject,
                "arms": arms,
                "metrics": {
                    "full_worker_wall_ns_p95": full_wall_p95,
                    "cache_worker_wall_ns_p95": cache_wall_p95,
                    "cache_over_full_worker_wall_ratio": (
                        cache_over_full_wall_ratio
                    ),
                    "full_peak_rss_kib_p95": full_rss_p95,
                    "cache_peak_rss_kib_p95": cache_rss_p95,
                    "cache_over_full_rss_ratio": cache_over_full_rss_ratio,
                },
                "gate": {
                    "exact_state_agreement": exact_state_agreement,
                    "max_cache_over_full_wall_ratio": 0.20,
                    "max_cache_over_full_rss_ratio": 1.10,
                    "wall_pass": (
                        cache_over_full_wall_ratio is not None
                        and cache_over_full_wall_ratio <= 0.20
                    ),
                    "rss_pass": (
                        cache_over_full_rss_ratio is not None
                        and cache_over_full_rss_ratio <= 1.10
                    ),
                    "compiled_loader_cache_gate_pass": (
                        exact_state_agreement
                        and cache_over_full_wall_ratio is not None
                        and cache_over_full_wall_ratio <= 0.20
                        and cache_over_full_rss_ratio is not None
                        and cache_over_full_rss_ratio <= 1.10
                    ),
                },
            }
        )

    all_pass = all(
        run["gate"]["compiled_loader_cache_gate_pass"]
        for run in benchmark_runs
    )
    unsigned = {
        "schema": COMPILED_LOADER_PROCESS_AB_REPORT_SCHEMA,
        "command": "compiled-loader-process-ab",
        "subject": {
            "source_paths": [str(source) for source in sources],
            "fresh_repetitions": fresh_repetitions,
            "worker_timeout_seconds": worker_timeout_s,
        },
        "runs": benchmark_runs,
        "gate": {
            "required_bank_count": 2,
            "observed_bank_count": len(benchmark_runs),
            "required_wall_speedup": 5.0,
            "required_cache_over_full_wall_ratio": 0.20,
            "max_cache_over_full_rss_ratio": 1.10,
            "per_bank_pass": all_pass,
            "compiled_loader_process_gate_pass": all_pass,
        },
        "trust_boundary": (
            "fresh-process diagnostic at the v3 compiled-loader boundary; "
            "full semantic replay is authoritative, exact ordered state "
            "agreement is required, and the cache is never a proof or terminal "
            "claim"
        ),
    }
    manifest_record = _hashed_record(
        {
            "schema": BENCHMARK_COMMAND_SCHEMA,
            "command": "compiled-loader-process-ab",
            "source_sha256": _source_hashes(),
            "subject": unsigned["subject"],
            "trust_boundary": unsigned["trust_boundary"],
        },
        "benchmark_manifest_sha256",
    )
    _atomic_json(output / "benchmark-manifest.json", manifest_record)
    report = _hashed_record(
        {
            **unsigned,
            "benchmark_manifest_sha256": manifest_record[
                "benchmark_manifest_sha256"
            ],
        },
        "report_sha256",
    )
    _atomic_json(output / "report.json", report)
    return report


def _journal_record_count(path: Path) -> int:
    """Count framed source records without parsing their JSON payloads."""

    if not path.is_file():
        raise BenchmarkError(f"missing journal source: {path}")
    count = 0
    last: bytes = b""
    with path.open("rb") as handle:
        for raw in handle:
            count += 1
            last = raw
    if count == 0:
        raise BenchmarkError(f"journal source is empty: {path}")
    if not last.endswith(b"\n"):
        raise BenchmarkError(f"journal source has a torn tail: {path}")
    return count


def _journal_identity(scan: journal_checkpoint.SuffixScan) -> dict[str, Any]:
    return {
        "total_record_count": scan.total_record_count,
        "total_byte_count": scan.total_byte_count,
        "terminal_record_sha256": scan.terminal_record_sha256,
        "file_sha256": scan.file_sha256,
        "clause_count": scan.clause_count,
        "clause_sha256": scan.clause_sha256,
    }


def _journal_checkpoint_process_worker(
    journal_paths: tuple[Path, ...],
    checkpoint_paths: tuple[Path, ...] | None,
    configuration: Mapping[str, Any],
    result_path: Path,
) -> None:
    """Run one fresh-process full or authenticated-suffix journal scan."""

    mode = "full" if checkpoint_paths is None else "suffix"
    if checkpoint_paths is not None and len(checkpoint_paths) != len(journal_paths):
        raise BenchmarkError("journal/checkpoint arity mismatch")

    def work(recorder: timing.TimingRecorder) -> Mapping[str, Any]:
        identities: list[dict[str, Any]] = []
        suffix_records = 0
        suffix_bytes = 0
        for index, journal_path in enumerate(journal_paths):
            with recorder.measure("loader", f"journal_{mode}_scan"):
                if checkpoint_paths is None:
                    scan = journal_checkpoint.full_scan(
                        journal_path, configuration=configuration
                    )
                else:
                    scan = journal_checkpoint.scan_suffix(
                        journal_path,
                        checkpoint_paths[index],
                        configuration=configuration,
                    )
            identities.append(
                {
                    "source_path": str(journal_path),
                    "identity": _journal_identity(scan),
                }
            )
            suffix_records += scan.suffix_record_count
            suffix_bytes += scan.suffix_byte_count
        payload = {"journals": identities}
        return {
            "mode": mode,
            "journal_count": len(identities),
            "total_record_count": sum(
                item["identity"]["total_record_count"] for item in identities
            ),
            "total_byte_count": sum(
                item["identity"]["total_byte_count"] for item in identities
            ),
            "suffix_record_count": suffix_records,
            "suffix_byte_count": suffix_bytes,
            "identity_payload_sha256": _sha256_bytes(
                timing._canonical_bytes(payload)
            ),
            "journals": identities,
        }

    _write_worker_result(result_path, work)


def benchmark_journal_checkpoint_process_ab(
    journal_paths: Sequence[Path],
    output_dir: Path,
    *,
    checkpoint_fraction: float = 0.75,
    fresh_repetitions: int = 3,
    worker_timeout_s: int = 1_800,
) -> dict[str, Any]:
    """Compare full replay with authenticated suffix replay in fresh processes."""

    if not journal_paths:
        raise BenchmarkError("at least one journal source is required")
    if not 0.0 < checkpoint_fraction < 1.0:
        raise BenchmarkError("checkpoint_fraction must be between zero and one")
    if fresh_repetitions <= 0:
        raise BenchmarkError("fresh_repetitions must be positive")
    if worker_timeout_s <= 0:
        raise BenchmarkError("worker_timeout_s must be positive")
    journals = tuple(path.resolve() for path in journal_paths)
    if len(set(journals)) != len(journals):
        raise BenchmarkError("journal sources must be distinct")
    output = _new_output(output_dir, subject=journals[0])
    for journal_path in journals[1:]:
        if output == journal_path or output in journal_path.parents:
            raise BenchmarkError("benchmark output must be disjoint from journals")

    configuration = {
        "schema": journal_checkpoint.CHECKPOINT_SCHEMA,
        "clause_digest": "p97-phase3-clause-order-digest-v1",
    }
    checkpoint_dir = output / "checkpoints"
    checkpoint_paths: list[Path] = []
    checkpoint_metadata: list[dict[str, Any]] = []
    for index, journal_path in enumerate(journals):
        record_count = _journal_record_count(journal_path)
        if record_count < 2:
            raise BenchmarkError(
                f"journal must have a nonempty suffix: {journal_path}"
            )
        prefix_count = min(
            record_count - 1,
            max(1, math.floor(record_count * checkpoint_fraction)),
        )
        checkpoint_path = checkpoint_dir / f"journal-{index:03d}.checkpoint.json"
        prefix = journal_checkpoint.build_checkpoint(
            journal_path,
            checkpoint_path,
            record_count=prefix_count,
            configuration=configuration,
        )
        checkpoint_paths.append(checkpoint_path)
        checkpoint_metadata.append(
            {
                "source_path": str(journal_path),
                "source_bytes": journal_path.stat().st_size,
                "source_record_count_estimate": record_count,
                "checkpoint_path": str(checkpoint_path),
                "checkpoint_sha256": _sha256_file(checkpoint_path),
                "prefix": prefix.as_dict(),
                "suffix_record_count_estimate": record_count - prefix_count,
            }
        )

    arms: dict[str, list[dict[str, Any]]] = {"full": [], "suffix": []}
    for arm, arm_checkpoints in (("full", None), ("suffix", tuple(checkpoint_paths))):
        arm_output = output / arm
        arm_output.mkdir(parents=True)
        for repetition in range(fresh_repetitions):
            result_path = arm_output / f"worker-{repetition:03d}.json"
            result, samples, process, worker_wall_ns = _spawn_worker_with_wall(
                _journal_checkpoint_process_worker,
                (journals, arm_checkpoints, configuration, result_path),
                result_path,
                join_timeout_s=worker_timeout_s,
            )
            max_rss_kib = process.get("max_rss_kib")
            if type(max_rss_kib) is not int or max_rss_kib <= 0:
                raise BenchmarkError(
                    f"{arm} repetition {repetition} has no positive peak RSS"
                )
            arms[arm].append(
                {
                    "repetition": repetition,
                    "cache_condition": "fresh-process-same-source",
                    "worker_wall_ns": worker_wall_ns,
                    "max_rss_kib": max_rss_kib,
                    "result": result,
                    "timing_summary": timing.summarize(samples),
                }
            )

    full_results = [run["result"] for run in arms["full"]]
    suffix_results = [run["result"] for run in arms["suffix"]]
    full_payloads = {result.get("identity_payload_sha256") for result in full_results}
    suffix_payloads = {
        result.get("identity_payload_sha256") for result in suffix_results
    }
    exact_identity_agreement = (
        len(full_payloads) == 1
        and full_payloads == suffix_payloads
        and all(result.get("mode") == "full" for result in full_results)
        and all(result.get("mode") == "suffix" for result in suffix_results)
    )
    full_wall = [int(run["worker_wall_ns"]) for run in arms["full"]]
    suffix_wall = [int(run["worker_wall_ns"]) for run in arms["suffix"]]
    full_rss = [int(run["max_rss_kib"]) for run in arms["full"]]
    suffix_rss = [int(run["max_rss_kib"]) for run in arms["suffix"]]
    full_wall_p95 = _nearest_rank_p95(full_wall)
    suffix_wall_p95 = _nearest_rank_p95(suffix_wall)
    full_rss_p95 = _nearest_rank_p95(full_rss)
    suffix_rss_p95 = _nearest_rank_p95(suffix_rss)
    speedup = (
        None
        if full_wall_p95 is None
        or full_wall_p95 <= 0
        or suffix_wall_p95 is None
        or suffix_wall_p95 <= 0
        else full_wall_p95 / suffix_wall_p95
    )
    rss_ratio = (
        None
        if full_rss_p95 is None
        or full_rss_p95 <= 0
        or suffix_rss_p95 is None
        else suffix_rss_p95 / full_rss_p95
    )
    unsigned = {
        "schema": JOURNAL_CHECKPOINT_PROCESS_AB_REPORT_SCHEMA,
        "command": "journal-checkpoint-process-ab",
        "subject": {
            "journal_paths": [str(path) for path in journals],
            "journal_count": len(journals),
            "aggregate_record_count_estimate": sum(
                item["source_record_count_estimate"] for item in checkpoint_metadata
            ),
            "aggregate_source_bytes": sum(
                item["source_bytes"] for item in checkpoint_metadata
            ),
            "checkpoint_fraction": checkpoint_fraction,
            "configuration_sha256": journal_checkpoint._sha256_value(
                configuration
            ),
            "fresh_repetitions": fresh_repetitions,
            "worker_timeout_seconds": worker_timeout_s,
        },
        "checkpoints": checkpoint_metadata,
        "arms": arms,
        "metrics": {
            "full_worker_wall_ns_p95": full_wall_p95,
            "suffix_worker_wall_ns_p95": suffix_wall_p95,
            "full_over_suffix_speedup": speedup,
            "full_peak_rss_kib_p95": full_rss_p95,
            "suffix_peak_rss_kib_p95": suffix_rss_p95,
            "suffix_over_full_rss_ratio": rss_ratio,
            "suffix_record_count": sum(
                result.get("suffix_record_count", 0) for result in suffix_results
            ),
            "suffix_byte_count": sum(
                result.get("suffix_byte_count", 0) for result in suffix_results
            ),
        },
        "gate": {
            "exact_identity_agreement": exact_identity_agreement,
            "minimum_speedup": 1.5,
            "speedup_pass": speedup is not None and speedup >= 1.5,
            "max_suffix_over_full_rss_ratio": 1.10,
            "rss_pass": rss_ratio is not None and rss_ratio <= 1.10,
            "journal_checkpoint_process_gate_pass": (
                exact_identity_agreement
                and speedup is not None
                and speedup >= 1.5
                and rss_ratio is not None
                and rss_ratio <= 1.10
            ),
        },
        "trust_boundary": (
            "fresh-process diagnostic for authenticated append-only journal "
            "startup; full replay is authoritative, suffix checkpoints are "
            "not a terminal certificate, and no suffix result may replace "
            "the v3 proof/replay boundary without a separate promotion gate"
        ),
    }
    manifest_record = _hashed_record(
        {
            "schema": BENCHMARK_COMMAND_SCHEMA,
            "command": "journal-checkpoint-process-ab",
            "source_sha256": _source_hashes(),
            "subject": unsigned["subject"],
            "trust_boundary": unsigned["trust_boundary"],
        },
        "benchmark_manifest_sha256",
    )
    _atomic_json(output / "benchmark-manifest.json", manifest_record)
    report = _hashed_record(
        {
            **unsigned,
            "benchmark_manifest_sha256": manifest_record[
                "benchmark_manifest_sha256"
            ],
        },
        "report_sha256",
    )
    _atomic_json(output / "report.json", report)
    return report


def _real_discovery_worker(
    run_dir: Path,
    result_path: Path,
    driver_kwargs: Mapping[str, Any],
    persistent: bool,
    ipasir_library: Path | None,
) -> None:
    """Run one isolated real discovery arm for the P7 diagnostic canary."""

    def work(recorder: timing.TimingRecorder) -> Mapping[str, Any]:
        solver = timing.timed_runner(recorder, "solver", v3.sat.run_cadical)
        checker = timing.timed_checker_runner(
            recorder, "terminal.check", v3.sat.run_drat_trim
        )
        kwargs = dict(driver_kwargs)
        kwargs["persistent_discovery"] = persistent
        if persistent:
            if ipasir_library is None:
                raise BenchmarkError("persistent arm has no IPASIR library")
            kwargs["incremental_solver_factory"] = incremental.IpasirCadicalFactory(
                ipasir_library
            )
        with _instrument_v3(recorder), recorder.measure(
            "driver", "hard_shard_discovery"
        ):
            return v3.run_driver(
                run_dir,
                **kwargs,
                solver_runner=solver,
                checker_runner=checker,
            )

    _write_worker_result(result_path, work)


def _real_arm_record(
    *,
    result: Mapping[str, Any],
    samples: Sequence[Mapping[str, Any]],
    process: Mapping[str, Any],
    run_dir: Path,
    persistent: bool,
) -> dict[str, Any]:
    counts = result.get("counts")
    if not isinstance(counts, Mapping):
        raise BenchmarkError("real discovery arm returned no counts")
    wall_ns = _sample_wall_ns(
        samples, stage="driver", operation="hard_shard_discovery"
    )
    classified = counts.get("classified_raw_sat_count")
    if type(classified) is not int or classified < 0:
        raise BenchmarkError("real discovery arm returned malformed SAT count")
    throughput = (
        None
        if wall_ns is None or wall_ns <= 0
        else classified * 3_600_000_000_000 / wall_ns
    )
    manifest = _subject_manifest(run_dir)
    unsigned = {
        "arm": "persistent" if persistent else "subprocess",
        "status": result.get("status"),
        "diagnostic": result.get("diagnostic"),
        "counts": dict(counts),
        "terminal_clause_count": result.get("terminal_clause_count"),
        "terminal_drat_verified": result.get("terminal_drat_verified"),
        "terminal_proof_exercised": result.get("terminal_clause_count") is not None,
        "manifest_sha256": manifest["manifest_sha256"],
        "run_tree_sha256": _tree_sha256(run_dir),
        "timing_summary": timing.summarize(samples),
        "wall_ns": wall_ns,
        "classified_models_per_hour": throughput,
        "max_rss_kib": process.get("max_rss_kib"),
        "incremental_discovery": result.get("incremental_discovery"),
    }
    return _hashed_record(unsigned, "arm_record_sha256")


def benchmark_persistent_discovery_ab(
    families: Sequence[tuple[str, int]],
    output_dir: Path,
    *,
    prefix_bank: Path,
    prefix_root_sha256: str,
    prefix_source_sha256: str,
    ipasir_library: Path | None = None,
    shard_depth: int = 5,
    timeout_s: int = 120,
    learned_core_limit: int = 1_000,
    survivor_limit: int = 1_000,
    max_new_raw: int = 2,
    worker_timeout_s: int = 1_800,
) -> dict[str, Any]:
    """Compare real subprocess and persistent discovery in fresh directories.

    This is a diagnostic promotion gate.  Each arm has its own spawned Python
    process and run namespace, and terminal proof production is still handled
    by the driver's fresh proof boundary.  The canary does not treat a
    checkpoint as a mathematical or terminal result.
    """

    output = _new_output(output_dir)
    normalized = tuple((str(name), int(index)) for name, index in families)
    if len(normalized) < 3:
        raise BenchmarkError("P7 A/B gate requires at least three shard families")
    if len({name for name, _ in normalized}) != len(normalized):
        raise BenchmarkError("P7 A/B shard family names must be unique")
    if not prefix_bank.is_dir():
        raise BenchmarkError(f"missing authenticated prefix bank: {prefix_bank}")
    if not 1 <= shard_depth <= v3.MAX_CUBE_DEPTH:
        raise BenchmarkError("P7 shard depth is outside the v3 cube range")
    if any(index >= 1 << shard_depth for _, index in normalized):
        raise BenchmarkError("P7 shard family index exceeds shard depth")
    if worker_timeout_s <= 0:
        raise BenchmarkError("P7 worker timeout must be positive")
    if ipasir_library is None:
        raw_library = os.environ.get("P97_CADICAL_IPASIR_LIB")
        ipasir_library = None if raw_library is None else Path(raw_library)
    if ipasir_library is None or not ipasir_library.is_file():
        raise BenchmarkError(
            "P7 persistent arm requires P97_CADICAL_IPASIR_LIB or --ipasir-library"
        )
    ipasir_library = ipasir_library.resolve()
    prefix_bank = prefix_bank.resolve()
    family_records: list[dict[str, Any]] = []
    for name, index in normalized:
        family_output = output / "families" / name
        baseline_dir = family_output / "subprocess"
        persistent_dir = family_output / "persistent"
        driver_kwargs = {
            "timeout_s": timeout_s,
            "learned_core_limit": learned_core_limit,
            "survivor_limit": survivor_limit,
            "workers": 1,
            "parallel_mode": "sequential",
            "shard_depth": shard_depth,
            "shard_index": index,
            "bootstrap_results": None,
            "algebraic_bootstrap": (),
            "three_rhombus_prefix_bank": prefix_bank,
            "three_rhombus_prefix_root_sha256": prefix_root_sha256,
            "three_rhombus_prefix_source_sha256": prefix_source_sha256,
            "projected_static_v3": True,
            "max_new_raw": max_new_raw,
        }
        arm_records: dict[str, dict[str, Any]] = {}
        for arm, persistent, run_dir in (
            ("subprocess", False, baseline_dir),
            ("persistent", True, persistent_dir),
        ):
            result, samples, process = _spawn_worker(
                _real_discovery_worker,
                (
                    run_dir,
                    family_output / f"{arm}-worker.json",
                    driver_kwargs,
                    persistent,
                    ipasir_library if persistent else None,
                ),
                family_output / f"{arm}-worker.json",
                join_timeout_s=worker_timeout_s,
            )
            arm_records[arm] = _real_arm_record(
                result=result,
                samples=samples,
                process=process,
                run_dir=run_dir,
                persistent=persistent,
            )
        baseline = arm_records["subprocess"]
        persistent = arm_records["persistent"]
        baseline_rss = baseline["max_rss_kib"]
        persistent_rss = persistent["max_rss_kib"]
        throughput_ratio = (
            None
            if not baseline.get("classified_models_per_hour")
            or persistent.get("classified_models_per_hour") is None
            else persistent["classified_models_per_hour"]
            / baseline["classified_models_per_hour"]
        )
        rss_ratio = (
            None
            if type(baseline_rss) is not int
            or type(persistent_rss) is not int
            or baseline_rss <= 0
            else persistent_rss / baseline_rss
        )
        status_agreement = baseline["status"] == persistent["status"]
        counts_agreement = all(
            baseline["counts"].get(field) == persistent["counts"].get(field)
            for field in (
                "classified_raw_sat_count",
                "dynamic_learned_core_count",
                "structural_survivor_count",
            )
        )
        terminal_exercised = bool(
            baseline["terminal_proof_exercised"]
            or persistent["terminal_proof_exercised"]
        )
        terminal_agreement = (
            not terminal_exercised
            or (
                baseline["status"] == persistent["status"]
                and baseline["terminal_drat_verified"]
                is True
                and persistent["terminal_drat_verified"] is True
            )
        )
        performance_pass = (
            throughput_ratio is not None
            and throughput_ratio >= 1.5
            and rss_ratio is not None
            and rss_ratio <= 1.25
        )
        family_records.append(
            {
                "name": name,
                "shard_depth": shard_depth,
                "shard_index": index,
                "arms": arm_records,
                "metrics": {
                    "persistent_over_subprocess_models_per_hour_ratio": throughput_ratio,
                    "persistent_over_subprocess_rss_ratio": rss_ratio,
                },
                "checks": {
                    "status_agreement": status_agreement,
                    "counts_agreement": counts_agreement,
                    "terminal_proof_exercised": terminal_exercised,
                    "terminal_status_agreement": terminal_agreement,
                    "performance_pass": performance_pass,
                    "family_performance_and_outcome_pass": (
                        performance_pass
                        and status_agreement
                        and counts_agreement
                        and terminal_agreement
                    ),
                },
            }
        )

    family_passes = sum(
        int(record["checks"]["family_performance_and_outcome_pass"])
        for record in family_records
    )
    terminal_exercised_any = any(
        record["checks"]["terminal_proof_exercised"] for record in family_records
    )
    unsigned = {
        "schema": PERSISTENT_AB_REPORT_SCHEMA,
        "command": "persistent-ab",
        "families": family_records,
        "configuration": {
            "shard_depth": shard_depth,
            "timeout_seconds": timeout_s,
            "learned_core_limit": learned_core_limit,
            "survivor_limit": survivor_limit,
            "max_new_raw": max_new_raw,
            "prefix_bank": str(prefix_bank),
            "prefix_root_sha256": prefix_root_sha256,
            "prefix_source_sha256": prefix_source_sha256,
            "ipasir_library": str(ipasir_library),
            "ipasir_library_sha256": _sha256_file(ipasir_library),
        },
        "gate": {
            "required_family_count": 3,
            "required_performance_family_count": 2,
            "models_per_hour_ratio_threshold": 1.5,
            "rss_ratio_threshold": 1.25,
            "family_pass_count": family_passes,
            "two_of_three_performance_pass": family_passes >= 2,
            "terminal_proof_exercised": terminal_exercised_any,
            "terminal_gate_pass": terminal_exercised_any
            and all(
                record["checks"]["terminal_status_agreement"]
                for record in family_records
            ),
            "promotion_status": (
                "P7_PRODUCTION_CANARY_OPEN"
                if family_passes >= 2 and terminal_exercised_any
                else (
                    "P7_PROMOTION_CLOSED_TERMINAL_GATE_INCOMPLETE"
                    if not terminal_exercised_any
                    else "P7_PROMOTION_CLOSED_PERFORMANCE_GATE_INCOMPLETE"
                )
            ),
        },
        "trust_boundary": (
            "real solver discovery timing in fresh namespaces; all prefix-bank "
            "and run artifacts remain authenticated by the v3 driver; no bounded "
            "checkpoint is treated as terminal proof or mathematical closure"
        ),
    }
    benchmark_manifest = _hashed_record(
        {
            "schema": BENCHMARK_COMMAND_SCHEMA,
            "command": "persistent-ab",
            "source_sha256": _source_hashes(),
            "subject": {
                "prefix_root_sha256": prefix_root_sha256,
                "prefix_source_sha256": prefix_source_sha256,
                "families": [(name, index) for name, index in normalized],
            },
            "trust_boundary": unsigned["trust_boundary"],
        },
        "benchmark_manifest_sha256",
    )
    _atomic_json(output / "benchmark-manifest.json", benchmark_manifest)
    report = _hashed_record(
        {
            **unsigned,
            "benchmark_manifest_sha256": benchmark_manifest[
                "benchmark_manifest_sha256"
            ],
        },
        "report_sha256",
    )
    _atomic_json(output / "report.json", report)
    return report


def benchmark_runtime_ab(
    assignment_jsonl: Path,
    output_dir: Path,
    *,
    assignment_index: int = 0,
    transcript_sat_count: int = 1,
    transcript_indices: Sequence[int] | None = None,
    fresh: int = 3,
    warm: int = 1,
    projected_static_v3: bool = True,
    order_bitsets_enabled: bool = True,
    manifest_audit_every: int = 1_000,
) -> dict[str, Any]:
    """Run full/fast bounded canaries and compare fresh end-to-end metrics."""

    output = output_dir.resolve()
    if output.exists():
        raise BenchmarkError(f"runtime A/B output already exists: {output}")
    if type(manifest_audit_every) is not int or manifest_audit_every <= 0:
        raise BenchmarkError("runtime A/B audit cadence must be positive")
    normalized_transcript_indices = (
        None
        if transcript_indices is None
        else tuple(int(selected) for selected in transcript_indices)
    )
    effective_transcript_sat_count = (
        transcript_sat_count
        if normalized_transcript_indices is None
        else len(normalized_transcript_indices)
    )

    full = benchmark_mock_transcript(
        assignment_jsonl,
        output / "full",
        assignment_index=assignment_index,
        transcript_sat_count=effective_transcript_sat_count,
        transcript_indices=normalized_transcript_indices,
        fresh=fresh,
        warm=warm,
        projected_static_v3=projected_static_v3,
        order_bitsets_enabled=order_bitsets_enabled,
        manifest_fast_path=False,
        manifest_audit_every=None,
    )
    fast = benchmark_mock_transcript(
        assignment_jsonl,
        output / "fast",
        assignment_index=assignment_index,
        transcript_sat_count=effective_transcript_sat_count,
        transcript_indices=normalized_transcript_indices,
        fresh=fresh,
        warm=warm,
        projected_static_v3=projected_static_v3,
        order_bitsets_enabled=order_bitsets_enabled,
        manifest_fast_path=True,
        manifest_audit_every=manifest_audit_every,
    )

    full_run = output / "full/runs/fresh-000"
    fast_run = output / "fast/runs/fresh-000"
    full_manifest = _subject_manifest(full_run)
    fast_manifest = _subject_manifest(fast_run)
    semantic_equal = _semantic_manifest_projection(
        full_manifest
    ) == _semantic_manifest_projection(fast_manifest)
    full_artifacts = _non_manifest_artifacts(full_run)
    fast_artifacts = _non_manifest_artifacts(fast_run)
    artifacts_equal = full_artifacts == fast_artifacts

    full_fresh_summary = _fresh_timing_summary(output / "full")
    fast_fresh_summary = _fresh_timing_summary(output / "fast")
    full_fresh_stages = _stage_summary(full_fresh_summary)
    fast_fresh_stages = _stage_summary(fast_fresh_summary)
    full_wall_p95 = _timing_summary_value(
        {"summary": full_fresh_summary},
        stage="driver",
        operation="bounded_transcript",
        field="wall_ns_p95",
    )
    fast_wall_p95 = _timing_summary_value(
        {"summary": fast_fresh_summary},
        stage="driver",
        operation="bounded_transcript",
        field="wall_ns_p95",
    )
    full_rss_p95 = _fresh_rss_p95(full)
    fast_rss_p95 = _fresh_rss_p95(fast)
    wall_ratio = (
        None
        if full_wall_p95 is None or full_wall_p95 <= 0 or fast_wall_p95 is None
        else fast_wall_p95 / full_wall_p95
    )
    rss_ratio = (
        None
        if full_rss_p95 is None or full_rss_p95 <= 0 or fast_rss_p95 is None
        else fast_rss_p95 / full_rss_p95
    )
    bounded_canary_pass = (
        semantic_equal
        and artifacts_equal
        and wall_ratio is not None
        and wall_ratio <= 1.10
        and rss_ratio is not None
        and rss_ratio <= 1.10
    )
    unsigned = {
        "schema": RUNTIME_AB_REPORT_SCHEMA,
        "subject": {
            "assignment_jsonl": str(assignment_jsonl.resolve()),
            "assignment_index": assignment_index,
            "transcript_sat_count": effective_transcript_sat_count,
            "transcript_indices": (
                None
                if normalized_transcript_indices is None
                else list(normalized_transcript_indices)
            ),
            "projected_static_v3": projected_static_v3,
            "order_bitsets_enabled": order_bitsets_enabled,
            "manifest_audit_every": manifest_audit_every,
            "fresh_repetitions": fresh,
            "warm_repetitions": warm,
        },
        "full_report_sha256": full["report_sha256"],
        "fast_report_sha256": fast["report_sha256"],
        "semantic_manifest_equal": semantic_equal,
        "non_manifest_artifacts_equal": artifacts_equal,
        "non_manifest_artifact_count": len(full_artifacts),
        "metrics": {
            "full_end_to_end_wall_ns_p95": full_wall_p95,
            "fast_end_to_end_wall_ns_p95": fast_wall_p95,
            "fast_over_full_wall_ratio": wall_ratio,
            "full_peak_rss_kib_p95": full_rss_p95,
            "fast_peak_rss_kib_p95": fast_rss_p95,
            "fast_over_full_rss_ratio": rss_ratio,
        },
        "fresh_stage_summary": {
            "full": full_fresh_stages,
            "fast": fast_fresh_stages,
            "fast_over_full_ratios": _stage_ratios(
                full_fresh_stages, fast_fresh_stages
            ),
        },
        "gate": {
            "max_regression_ratio": 1.10,
            "end_to_end_p95_pass": wall_ratio is not None and wall_ratio <= 1.10,
            "rss_p95_pass": rss_ratio is not None and rss_ratio <= 1.10,
            "semantic_equivalence_pass": semantic_equal,
            "artifact_equivalence_pass": artifacts_equal,
            "bounded_canary_pass": bounded_canary_pass,
            "promotion_status": (
                "BOUNDED_CANARY_PASS_PRODUCTION_CANARY_OPEN"
                if bounded_canary_pass
                else "BOUNDED_CANARY_FAIL_PRODUCTION_CANARY_OPEN"
            ),
        },
        "trust_boundary": (
            "diagnostic full-vs-fast measurement over a fake SAT/UNSAT transcript; "
            "no production solver, DRAT, finite-exhaustion, or Lean-closure claim"
        ),
    }
    output.mkdir(parents=True, exist_ok=True)
    benchmark_manifest = _make_manifest(
        command="runtime-ab",
        subject={
            **unsigned["subject"],
            "full_report_sha256": full["report_sha256"],
            "fast_report_sha256": fast["report_sha256"],
        },
        fresh=fresh,
        warm=warm,
    )
    _atomic_json(output / "benchmark-manifest.json", benchmark_manifest)
    report = _hashed_record(
        {**unsigned, "benchmark_manifest_sha256": benchmark_manifest[
            "benchmark_manifest_sha256"
        ]},
        "report_sha256",
    )
    _atomic_json(output / "report.json", report)
    return report


def _write_jsonl_records(path: Path, records: Sequence[Mapping[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("wb") as handle:
        for record in records:
            handle.write(timing._canonical_bytes(record) + b"\n")


def _accounting_stream_ledgers(
    output: Path,
    learned: Sequence[Mapping[str, Any]],
    logs: Sequence[Mapping[str, Any]],
) -> dict[str, dict[str, Any]]:
    streams = {
        "learned": ("learned-certificates.jsonl", learned),
        "survivors": ("survivors.jsonl", ()),
        "solver-logs": ("solver-logs.jsonl", logs),
        "cube-batches": ("cube-batches.jsonl", ()),
    }
    result: dict[str, dict[str, Any]] = {}
    for name, (filename, records) in streams.items():
        data = (output / filename).read_bytes()
        result[name] = {
            "record_count": len(records),
            "byte_count": len(data),
            "terminal_record_sha256": (
                records[-1].get("record_sha256") if records else None
            ),
            "file_sha256": _sha256_bytes(data),
        }
    return result


class _AppendFaultHandle:
    """Small file-handle proxy for the append durability fault matrix."""

    def __init__(self, handle: Any, fault: str | None) -> None:
        self._handle = handle
        self._fault = fault

    def __enter__(self) -> Self:
        self._handle.__enter__()
        return self

    def __exit__(self, *args: object) -> Any:
        return self._handle.__exit__(*args)

    def write(self, data: bytes) -> int:
        if self._fault == "write":
            raise OSError("injected append write failure")
        return self._handle.write(data)

    def flush(self) -> None:
        if self._fault == "flush":
            raise OSError("injected append flush failure")
        self._handle.flush()

    def fileno(self) -> int:
        if self._fault == "fsync":
            # _append_record calls os.fsync(handle.fileno()).  An invalid
            # descriptor injects the failure at precisely that boundary.
            return 1_000_000
        return self._handle.fileno()


class _AppendFaultPath:
    """Path-shaped adapter that injects failures without patching Path.open."""

    def __init__(self, path: Path, fault: str | None) -> None:
        self._path = path
        self._fault = fault

    def open(self, mode: str) -> _AppendFaultHandle:
        return _AppendFaultHandle(self._path.open(mode), self._fault)


def _append_fault_case(output: Path, fault: str | None) -> dict[str, Any]:
    path = output / "append" / f"{fault or 'success'}.jsonl"
    path.parent.mkdir(parents=True, exist_ok=True)
    record = {
        "previous_record_sha256": None,
        "record_sha256": "append-record-0",
    }
    ledger = runtime.JsonlRunLedger.from_authenticated_records(
        [], runtime.JournalScan(), stream_name="fault-matrix-append"
    )
    before = ledger.snapshot().as_dict()
    exception: Exception | None = None
    succeeded = False
    try:
        serialized = v3._append_record(
            _AppendFaultPath(path, fault),
            record,
        )
        ledger.observe_durable_append(record, serialized)
        succeeded = True
    except OSError as exc:  # report the injected boundary, then fail closed
        exception = exc
    after = ledger.snapshot().as_dict()
    expected_success = fault is None
    passed = (
        succeeded == expected_success
        and (
            after["record_count"] == 1
            if expected_success
            else after == before
        )
        and (
            exception is None
            if expected_success
            else isinstance(exception, OSError)
        )
    )
    return {
        "boundary": f"append-{fault or 'success'}",
        "expected": "ledger-commit" if expected_success else "no-ledger-commit",
        "passed": passed,
        "succeeded": succeeded,
        "exception": None
        if exception is None
        else {"type": type(exception).__name__, "message": str(exception)},
        "ledger_before": before,
        "ledger_after": after,
        "file_size": path.stat().st_size if path.exists() else 0,
        "file_sha256": _sha256_file(path) if path.exists() else None,
    }


def _manifest_fault_case(output: Path, fault: str | None) -> dict[str, Any]:
    case = output / "manifest" / (fault or "success")
    case.mkdir(parents=True, exist_ok=True)
    manifest_path = case / "manifest.json"
    generation_two = case / runtime.manifest_generation_name(2)

    baseline = runtime.ManifestGenerationPublisher(
        atomic_writer=v3._atomic_bytes,
        sync_directory=v3._fsync_directory,
    )
    baseline.publish(
        out=case,
        manifest_path=manifest_path,
        generation=1,
        data=b"manifest-generation-one\n",
    )

    sync_count = 0

    def atomic_writer(path: Path, data: bytes) -> None:
        if fault == "generation-write" and path == generation_two:
            raise OSError("injected generation write failure")
        if fault == "pointer-replace" and path == manifest_path:
            raise OSError("injected pointer replacement failure")
        v3._atomic_bytes(path, data)

    def sync_directory(path: Path) -> None:
        nonlocal sync_count
        sync_count += 1
        if fault == "first-directory-sync" and sync_count == 1:
            raise OSError("injected first directory sync failure")
        if fault == "second-directory-sync" and sync_count == 2:
            raise OSError("injected second directory sync failure")
        v3._fsync_directory(path)

    publisher = runtime.ManifestGenerationPublisher(
        atomic_writer=atomic_writer,
        sync_directory=sync_directory,
    )
    exception: Exception | None = None
    succeeded = False
    try:
        publisher.publish(
            out=case,
            manifest_path=manifest_path,
            generation=2,
            data=b"manifest-generation-two\n",
        )
        succeeded = True
    except OSError as exc:  # the publisher must leave a classified state
        exception = exc

    pointer = manifest_path.read_bytes()
    generation_two_bytes = (
        generation_two.read_bytes() if generation_two.exists() else None
    )
    expected_success = fault is None
    expected_pointer = (
        b"manifest-generation-two\n"
        if fault == "second-directory-sync" or expected_success
        else b"manifest-generation-one\n"
    )
    expected_generation_two = fault != "generation-write"
    passed = (
        succeeded == expected_success
        and pointer == expected_pointer
        and (generation_two_bytes is not None) == expected_generation_two
        and (
            exception is None
            if expected_success
            else isinstance(exception, OSError)
        )
    )
    return {
        "boundary": fault or "manifest-success",
        "expected": (
            "new-pointer" if expected_success else "exception-classified"
        ),
        "passed": passed,
        "succeeded": succeeded,
        "exception": None
        if exception is None
        else {"type": type(exception).__name__, "message": str(exception)},
        "directory_sync_calls": sync_count,
        "pointer_sha256": _sha256_bytes(pointer),
        "pointer_generation": 2 if pointer == b"manifest-generation-two\n" else 1,
        "generation_two_exists": generation_two_bytes is not None,
        "generation_two_sha256": (
            None
            if generation_two_bytes is None
            else _sha256_bytes(generation_two_bytes)
        ),
        "post_commit_sync_failure": fault == "second-directory-sync",
    }


def benchmark_fault_matrix(output_dir: Path) -> dict[str, Any]:
    """Exercise append and two-file manifest failure boundaries.

    The matrix is a diagnostic trust-boundary test: an append error must not
    advance the in-memory ledger, and a manifest error must leave either the
    old pointer or an explicitly observable post-pointer-sync state.  It does
    not certify a mathematical result or replace the full restart audit.
    """
    output = _new_output(output_dir)
    append_cases = [
        _append_fault_case(output, fault)
        for fault in (None, "write", "flush", "fsync")
    ]
    manifest_cases = [
        _manifest_fault_case(output, fault)
        for fault in (
            None,
            "generation-write",
            "first-directory-sync",
            "pointer-replace",
            "second-directory-sync",
        )
    ]
    cases = append_cases + manifest_cases
    benchmark_manifest = _make_manifest(
        command="fault-matrix",
        subject={
            "boundaries": [case["boundary"] for case in cases],
            "append_contract": (
                "ledger updates occur only after append/write/flush/fsync returns"
            ),
            "manifest_contract": (
                "generation is synced before pointer replacement; a post-pointer "
                "directory-sync failure is classified as UNKNOWN on the caller side"
            ),
        },
        fresh=1,
        warm=0,
    )
    _atomic_json(output / "benchmark-manifest.json", benchmark_manifest)
    unsigned = {
        "schema": "p97-phase3-cegar-fault-matrix-report-v1",
        "benchmark_manifest_sha256": benchmark_manifest[
            "benchmark_manifest_sha256"
        ],
        "append_cases": append_cases,
        "manifest_cases": manifest_cases,
        "matrix_pass": all(case["passed"] for case in cases),
        "trust_boundary": (
            "diagnostic filesystem fault injection only; no solver, DRAT, "
            "finite-exhaustion, or Lean-closure result"
        ),
    }
    if not unsigned["matrix_pass"]:
        raise BenchmarkError("durability fault matrix failed")
    report = _hashed_record(unsigned, "report_sha256")
    _atomic_json(output / "report.json", report)
    return report


def benchmark_accounting(
    output_dir: Path,
    *,
    records: int = 40_000,
    sample_every: int = 1_000,
) -> dict[str, Any]:
    """Compare one full 40k-record manifest projection with the hot projection.

    This is deliberately synthetic and non-authoritative.  It exercises the
    production ``_manifest`` and ``_manifest_from_prospective_state`` helpers
    over authenticated-sized stream files, while leaving solver, certificate,
    and terminal-proof work outside the measurement.  The sampled cumulative
    comparison measures the existing repeated full projection at fixed
    prefixes; it is reported as sampled rather than presented as a complete
    every-record CEGAR run.
    """
    if type(records) is not int or records <= 0:
        raise BenchmarkError("records must be a positive integer")
    if type(sample_every) is not int or sample_every <= 0:
        raise BenchmarkError("sample_every must be a positive integer")
    output = _new_output(output_dir)
    learned = [
        {
            "origin": "solver",
            "stage": "row-membership",
            "raw_sat_index": index,
            "certificate_kind": "STRUCTURAL",
            "clause": [-1],
        }
        for index in range(records)
    ]
    logs = [{"verdict": "SAT"} for _ in range(records)]
    _write_jsonl_records(output / "learned-certificates.jsonl", learned)
    _write_jsonl_records(output / "solver-logs.jsonl", logs)
    _write_jsonl_records(output / "survivors.jsonl", ())
    _write_jsonl_records(output / "cube-batches.jsonl", ())
    stream_ledgers = _accounting_stream_ledgers(output, learned, logs)
    configuration = {
        "artifact_schema": v3.PROJECTED_STATIC_SCHEMA,
        "manifest_publication": {
            "mode": "prospective-v1",
            "audit_every_running_publications": 1_000,
        },
    }
    bank = SimpleNamespace(active={})
    prefixes = list(range(sample_every, records + 1, sample_every))
    if not prefixes or prefixes[-1] != records:
        prefixes.append(records)
    prefix_inputs = [
        (learned[:prefix], logs[:prefix]) for prefix in prefixes
    ]

    benchmark_manifest = _make_manifest(
        command="accounting",
        subject={
            "records": records,
            "sample_every": sample_every,
            "sampled_publications": len(prefixes),
            "measurement": (
                "production full recount versus prospective projection; "
                "synthetic streams, no solver or certificate acceptance"
            ),
        },
        fresh=1,
        warm=0,
    )
    _atomic_json(output / "benchmark-manifest.json", benchmark_manifest)

    def full_manifest(
        learned_input: Sequence[Mapping[str, Any]],
        logs_input: Sequence[Mapping[str, Any]],
        generation: int = 1,
    ) -> dict[str, Any]:
        return v3._manifest(
            output,
            configuration=configuration,
            status="RUNNING",
            diagnostic=None,
            learned=learned_input,
            survivors=(),
            logs=logs_input,
            cube_batches=(),
            bank=bank,
            bootstrap_summary={},
            terminal_clause_count=None,
            unsat_verified=False,
            stream_ledgers=stream_ledgers,
            manifest_generation=generation,
            previous_manifest_sha256=None,
        )

    full_start = time.perf_counter_ns()
    full = full_manifest(learned, logs)
    full_wall_ns = time.perf_counter_ns() - full_start

    state_start = time.perf_counter_ns()
    state = v3.ManifestProspectiveState(
        learned=learned,
        survivors=(),
        logs=logs,
        cube_batches=(),
        bank=bank,
        artifact_hashes=v3._artifact_hashes(output),
    )
    state_init_wall_ns = time.perf_counter_ns() - state_start
    fast_start = time.perf_counter_ns()
    fast = v3._manifest_from_prospective_state(
        full,
        configuration=configuration,
        status="RUNNING",
        diagnostic=None,
        bootstrap_summary={},
        terminal_clause_count=None,
        unsat_verified=False,
        stream_ledgers=stream_ledgers,
        manifest_generation=1,
        previous_manifest_sha256=None,
        state=state,
    )
    fast_wall_ns = time.perf_counter_ns() - fast_start
    if full != fast:
        raise BenchmarkError("full and prospective 40k manifests differ")

    sampled_full_start = time.perf_counter_ns()
    for learned_input, logs_input in prefix_inputs:
        full_manifest(learned_input, logs_input)
    sampled_full_wall_ns = time.perf_counter_ns() - sampled_full_start

    sampled_fast_state = v3.ManifestProspectiveState(
        learned=(),
        survivors=(),
        logs=(),
        cube_batches=(),
        bank=bank,
        artifact_hashes=v3._artifact_hashes(output),
    )
    sampled_fast_start = time.perf_counter_ns()
    previous = full
    prefix_index = 0
    for index, (learned_record, log_record) in enumerate(
        zip(learned, logs), start=1
    ):
        sampled_fast_state.observe_log(log_record)
        sampled_fast_state.observe_learned(learned_record)
        if index == prefixes[prefix_index]:
            previous = v3._manifest_from_prospective_state(
                previous,
                configuration=configuration,
                status="RUNNING",
                diagnostic=None,
                bootstrap_summary={},
                terminal_clause_count=None,
                unsat_verified=False,
                stream_ledgers=stream_ledgers,
                manifest_generation=1,
                previous_manifest_sha256=None,
                state=sampled_fast_state,
            )
            prefix_index += 1
            if prefix_index == len(prefixes):
                break
    sampled_fast_wall_ns = time.perf_counter_ns() - sampled_fast_start
    if prefix_index != len(prefixes):
        raise BenchmarkError("prospective sample loop did not reach 40k")

    unsigned = {
        "schema": "p97-phase3-cegar-accounting-report-v1",
        "benchmark_manifest_sha256": benchmark_manifest[
            "benchmark_manifest_sha256"
        ],
        "records": records,
        "sample_every": sample_every,
        "sampled_publications": len(prefixes),
        "manifest_equivalent": True,
        "full_manifest_sha256": full["manifest_sha256"],
        "fast_manifest_sha256": fast["manifest_sha256"],
        "wall_ns": {
            "full_manifest_at_40k": full_wall_ns,
            "prospective_state_initialization": state_init_wall_ns,
            "prospective_manifest_at_40k": fast_wall_ns,
            "sampled_full_recount": sampled_full_wall_ns,
            "sampled_prospective_projection": sampled_fast_wall_ns,
        },
        "speedup": {
            "single_projection": full_wall_ns / max(fast_wall_ns, 1),
            "sampled_cumulative": sampled_full_wall_ns
            / max(sampled_fast_wall_ns, 1),
        },
        "gate": {
            "accounting_threshold": 5.0,
            "accounting_pass": (
                full_wall_ns / max(fast_wall_ns, 1) >= 5.0
                and sampled_full_wall_ns / max(sampled_fast_wall_ns, 1) >= 5.0
            ),
            "promotion_status": "OPEN_PENDING_END_TO_END_CANARY",
        },
        "trust_boundary": (
            "synthetic diagnostic timing only; the report is not a solver, "
            "DRAT, finite-exhaustion, or Lean-closure result"
        ),
    }
    report = _hashed_record(unsigned, "report_sha256")
    _atomic_json(output / "report.json", report)
    return report


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    loader = subparsers.add_parser("loader", help="benchmark replay-only startup")
    loader.add_argument("--subject-run", required=True, type=Path)
    loader.add_argument("--output", required=True, type=Path)
    transcript = subparsers.add_parser(
        "mock-transcript", help="benchmark a fake SAT-then-UNSAT transcript"
    )
    transcript.add_argument("--assignment-jsonl", required=True, type=Path)
    transcript.add_argument("--assignment-index", type=int, default=0)
    transcript.add_argument("--transcript-sat-count", type=int, default=1)
    transcript.add_argument(
        "--transcript-indices",
        type=_parse_transcript_indices,
        default=None,
        help="optional comma-separated source record indices; overrides count",
    )
    transcript.add_argument("--output", required=True, type=Path)
    transcript.add_argument("--nonprojected", action="store_true")
    transcript.add_argument("--legacy-order-coverage", action="store_true")
    runtime_ab = subparsers.add_parser(
        "runtime-ab", help="compare full and fast bounded transcript canaries"
    )
    runtime_ab.add_argument("--assignment-jsonl", required=True, type=Path)
    runtime_ab.add_argument("--assignment-index", type=int, default=0)
    runtime_ab.add_argument("--transcript-sat-count", type=int, default=1)
    runtime_ab.add_argument(
        "--transcript-indices",
        type=_parse_transcript_indices,
        default=None,
        help="optional comma-separated source record indices; overrides count",
    )
    runtime_ab.add_argument("--output", required=True, type=Path)
    runtime_ab.add_argument("--nonprojected", action="store_true")
    runtime_ab.add_argument("--legacy-order-coverage", action="store_true")
    runtime_ab.add_argument("--manifest-audit-every", type=int, default=1_000)
    persistent_ab = subparsers.add_parser(
        "persistent-ab",
        help="compare real subprocess and persistent discovery on hard shards",
    )
    persistent_ab.add_argument(
        "--family",
        action="append",
        required=True,
        type=_parse_shard_family,
        help="repeat at least three times as NAME:SHARD_INDEX",
    )
    persistent_ab.add_argument("--output", required=True, type=Path)
    persistent_ab.add_argument("--prefix-bank", required=True, type=Path)
    persistent_ab.add_argument("--prefix-root-sha256", required=True)
    persistent_ab.add_argument("--prefix-source-sha256", required=True)
    persistent_ab.add_argument("--ipasir-library", type=Path, default=None)
    persistent_ab.add_argument("--shard-depth", type=int, default=5)
    persistent_ab.add_argument("--timeout", type=int, default=120)
    persistent_ab.add_argument("--learned-core-limit", type=int, default=1_000)
    persistent_ab.add_argument("--survivor-limit", type=int, default=1_000)
    persistent_ab.add_argument("--max-new-raw", type=int, default=2)
    persistent_ab.add_argument("--worker-timeout", type=int, default=1_800)
    accounting = subparsers.add_parser(
        "accounting", help="benchmark the 40k full/fast manifest projections"
    )
    accounting.add_argument("--output", required=True, type=Path)
    accounting.add_argument("--records", type=int, default=40_000)
    accounting.add_argument("--sample-every", type=int, default=1_000)
    fault_matrix = subparsers.add_parser(
        "fault-matrix", help="exercise append and manifest durability boundaries"
    )
    fault_matrix.add_argument("--output", required=True, type=Path)
    cold_profile = subparsers.add_parser(
        "cold-start-profile",
        help="profile fresh worker and timing-journal stage boundaries",
    )
    cold_profile.add_argument(
        "--worker-json",
        action="append",
        type=Path,
        default=[],
        help="fresh spawned-worker JSON; repeat for multiple arms/families",
    )
    cold_profile.add_argument(
        "--timing-journal",
        action="append",
        type=Path,
        default=[],
        help="hash-chained benchmark timing journal; fresh records are selected",
    )
    cold_profile.add_argument("--output", required=True, type=Path)
    prefix_cache_ab = subparsers.add_parser(
        "prefix-cache-ab",
        help="compare authoritative prefix-bank replay with cache validation",
    )
    prefix_cache_ab.add_argument("--prefix-bank", required=True, type=Path)
    prefix_cache_ab.add_argument("--prefix-root-sha256", required=True)
    prefix_cache_ab.add_argument("--prefix-source-sha256", required=True)
    prefix_cache_ab.add_argument("--output", required=True, type=Path)
    prefix_cache_ab.add_argument("--warm", type=int, default=3)
    prefix_cache_process_ab = subparsers.add_parser(
        "prefix-cache-process-ab",
        help="compare prefix-bank replay and cache validation in fresh processes",
    )
    prefix_cache_process_ab.add_argument("--prefix-bank", required=True, type=Path)
    prefix_cache_process_ab.add_argument("--prefix-cache", required=True, type=Path)
    prefix_cache_process_ab.add_argument("--prefix-root-sha256", required=True)
    prefix_cache_process_ab.add_argument("--prefix-source-sha256", required=True)
    prefix_cache_process_ab.add_argument("--output", required=True, type=Path)
    prefix_cache_process_ab.add_argument("--fresh", type=int, default=3)
    prefix_cache_process_ab.add_argument("--worker-timeout", type=int, default=900)
    journal_checkpoint_process_ab = subparsers.add_parser(
        "journal-checkpoint-process-ab",
        help="compare full and authenticated journal-suffix scans in fresh processes",
    )
    journal_checkpoint_process_ab.add_argument(
        "--journal",
        action="append",
        required=True,
        type=Path,
        help="authenticated JSONL journal source; repeat for a source set",
    )
    journal_checkpoint_process_ab.add_argument("--output", required=True, type=Path)
    journal_checkpoint_process_ab.add_argument(
        "--checkpoint-fraction", type=float, default=0.75
    )
    journal_checkpoint_process_ab.add_argument("--fresh", type=int, default=3)
    journal_checkpoint_process_ab.add_argument(
        "--worker-timeout", type=int, default=1_800
    )
    compiled_loader_process_ab = subparsers.add_parser(
        "compiled-loader-process-ab",
        help="compare full v3 loader replay with compiled-cache hits",
    )
    compiled_loader_process_ab.add_argument(
        "--source",
        action="append",
        required=True,
        type=Path,
        help="legacy authenticated learned journal; repeat exactly twice",
    )
    compiled_loader_process_ab.add_argument("--output", required=True, type=Path)
    compiled_loader_process_ab.add_argument("--fresh", type=int, default=3)
    compiled_loader_process_ab.add_argument(
        "--worker-timeout", type=int, default=1_800
    )
    for subparser in (loader, transcript, runtime_ab):
        subparser.add_argument("--fresh", type=int, default=3)
        subparser.add_argument("--warm", type=int, default=5)
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    if args.command == "loader":
        report = benchmark_loader(
            args.subject_run, args.output, fresh=args.fresh, warm=args.warm
        )
    elif args.command == "mock-transcript":
        report = benchmark_mock_transcript(
            args.assignment_jsonl,
            args.output,
            assignment_index=args.assignment_index,
            transcript_sat_count=args.transcript_sat_count,
            transcript_indices=args.transcript_indices,
            fresh=args.fresh,
            warm=args.warm,
            projected_static_v3=not args.nonprojected,
            order_bitsets_enabled=not args.legacy_order_coverage,
        )
    elif args.command == "runtime-ab":
        report = benchmark_runtime_ab(
            args.assignment_jsonl,
            args.output,
            assignment_index=args.assignment_index,
            transcript_sat_count=args.transcript_sat_count,
            transcript_indices=args.transcript_indices,
            fresh=args.fresh,
            warm=args.warm,
            projected_static_v3=not args.nonprojected,
            order_bitsets_enabled=not args.legacy_order_coverage,
            manifest_audit_every=args.manifest_audit_every,
        )
    elif args.command == "persistent-ab":
        report = benchmark_persistent_discovery_ab(
            args.family,
            args.output,
            prefix_bank=args.prefix_bank,
            prefix_root_sha256=args.prefix_root_sha256,
            prefix_source_sha256=args.prefix_source_sha256,
            ipasir_library=args.ipasir_library,
            shard_depth=args.shard_depth,
            timeout_s=args.timeout,
            learned_core_limit=args.learned_core_limit,
            survivor_limit=args.survivor_limit,
            max_new_raw=args.max_new_raw,
            worker_timeout_s=args.worker_timeout,
        )
    elif args.command == "cold-start-profile":
        report = benchmark_cold_start_profile(
            args.worker_json,
            args.timing_journal,
            args.output,
        )
    elif args.command == "prefix-cache-ab":
        report = benchmark_prefix_bank_cache_ab(
            args.prefix_bank,
            args.output,
            expected_root_sha256=args.prefix_root_sha256,
            expected_source_prefix_sha256=args.prefix_source_sha256,
            warm_repetitions=args.warm,
        )
    elif args.command == "prefix-cache-process-ab":
        report = benchmark_prefix_bank_process_ab(
            args.prefix_bank,
            args.prefix_cache,
            args.output,
            expected_root_sha256=args.prefix_root_sha256,
            expected_source_prefix_sha256=args.prefix_source_sha256,
            fresh_repetitions=args.fresh,
            worker_timeout_s=args.worker_timeout,
        )
    elif args.command == "journal-checkpoint-process-ab":
        report = benchmark_journal_checkpoint_process_ab(
            args.journal,
            args.output,
            checkpoint_fraction=args.checkpoint_fraction,
            fresh_repetitions=args.fresh,
            worker_timeout_s=args.worker_timeout,
        )
    elif args.command == "compiled-loader-process-ab":
        report = benchmark_compiled_loader_process_ab(
            args.source,
            args.output,
            fresh_repetitions=args.fresh,
            worker_timeout_s=args.worker_timeout,
        )
    else:
        if args.command == "accounting":
            report = benchmark_accounting(
                args.output, records=args.records, sample_every=args.sample_every
            )
        else:
            report = benchmark_fault_matrix(args.output)
    print(timing._canonical_bytes(report).decode())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
