#!/usr/bin/env python3
"""Run bounded, preservation-safe A/B experiments on a frozen Census-554 probe.

The harness never resumes or opens a source run in place.  It first proves that
the source workdir lock is not held, copies the complete resumable surface into
a private snapshot while holding that lock, hashes both sides, validates the
private SQLite copy, and only then makes one independent workdir per arm.

Each arm may use a different ``frozen_separation_probe.py``.  The harness
updates the runtime fingerprint in that arm's private metadata and checkpoint,
then lets the ordinary probe perform its strict ordered replay.  A worker shim
times the search solver, algebra-bank refinement, and formalized structural
scan without changing the probe implementation.  Probe exit 2 (a bounded
budget result) is a successful experimental outcome, not a harness failure.

Example::

    uv run scratch/census-554/run_separation_experiment.py \
      --source scratch/census-554/separation_probe_runs/experiment-source \
      --baseline-probe scratch/census-554/baseline/frozen_separation_probe.py \
      --variant structural-first=scratch/census-554/frozen_separation_probe.py \
      --variant-refinement-order structural-first=structural-first \
      --iterations 20 --wall-seconds 600 --hard-wall-seconds 1200

Optional variant preparers are JSON argv arrays.  They are executed without a
shell and may use ``{workdir}``, ``{experiment}``, ``{source_snapshot}``, and
``{arm}`` placeholders.  Preparers can therefore add a theorem-backed preseed
to a private arm without gaining a path to the source run.
"""

from __future__ import annotations

import argparse
from contextlib import contextmanager
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
import errno
import fcntl
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import platform
import resource
import secrets
import shutil
import signal
import sqlite3
import subprocess
import sys
import time
from typing import Any, Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
SCHEMA = "census554_separation_experiment.v1"
SOURCE_SCHEMA = "census554_separation_experiment_source.v1"
METRICS_SCHEMA = "census554_separation_experiment_metrics.v1"
PROBE_SCHEMA = "census554_frozen_separation_probe.v1"
PROBE_LOCK = ".frozen_separation_probe.lock"
TERMINAL_STATUSES = frozenset({"combined-frontier", "UNSAT-verified"})
DEFAULT_WORK_ROOT = HERE / "separation_experiments"


class ExperimentError(RuntimeError):
    """The experiment cannot proceed without violating its safety contract."""


def _cpu_snapshot() -> tuple[float, float]:
    """Return CPU seconds for this process and its completed children."""
    children = resource.getrusage(resource.RUSAGE_CHILDREN)
    return (
        time.process_time(),
        float(children.ru_utime + children.ru_stime),
    )


def _cpu_delta(start: tuple[float, float]) -> tuple[float, float]:
    current_self, current_children = _cpu_snapshot()
    return (
        max(0.0, current_self - start[0]),
        max(0.0, current_children - start[1]),
    )


def _utc_now() -> str:
    return datetime.now(timezone.utc).isoformat()


def _canonical_json(value: Any) -> str:
    try:
        return json.dumps(
            value, sort_keys=True, separators=(",", ":"), allow_nan=False
        )
    except (TypeError, ValueError) as exc:
        raise ExperimentError("value is not canonical-JSON compatible") from exc


def _sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _fsync_dir(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _atomic_write_bytes(path: Path, raw: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp-{secrets.token_hex(6)}")
    try:
        with open(temporary, "xb") as handle:
            handle.write(raw)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
        _fsync_dir(path.parent)
    finally:
        temporary.unlink(missing_ok=True)


def _atomic_write_json(path: Path, value: Any) -> None:
    raw = (json.dumps(value, sort_keys=True, indent=2, allow_nan=False) + "\n").encode()
    _atomic_write_bytes(path, raw)


def _load_json_object(path: Path, *, description: str) -> dict[str, Any]:
    try:
        value = json.loads(path.read_bytes())
    except (FileNotFoundError, json.JSONDecodeError) as exc:
        raise ExperimentError(f"{description} is absent or malformed: {path}") from exc
    if not isinstance(value, dict):
        raise ExperimentError(f"{description} is not an object: {path}")
    return value


def _safe_relative(value: Any, *, field: str) -> Path:
    if not isinstance(value, str) or not value:
        raise ExperimentError(f"invalid snapshot path in {field}")
    path = Path(value)
    if path.is_absolute() or ".." in path.parts or path == Path("."):
        raise ExperimentError(f"unsafe snapshot path in {field}: {value!r}")
    return path


def _is_relative_to(path: Path, root: Path) -> bool:
    try:
        path.relative_to(root)
    except ValueError:
        return False
    return True


@contextmanager
def _offline_source_lock(source: Path):
    """Acquire the probe lock without creating or changing a source artifact."""

    lock_path = source / PROBE_LOCK
    if lock_path.exists():
        if not lock_path.is_file() or lock_path.is_symlink():
            raise ExperimentError(f"invalid source probe lock: {lock_path}")
        descriptor = os.open(lock_path, os.O_RDONLY)
        lock_kind = "probe-lock-file"
    else:
        # Validated offline exports intentionally omit the live workdir lock.
        # flocking the existing directory gives cooperating harnesses a lock
        # without writing anything into the source directory.
        descriptor = os.open(source, os.O_RDONLY)
        lock_kind = "offline-directory"
    try:
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except OSError as exc:
            if exc.errno in (errno.EACCES, errno.EAGAIN):
                raise ExperimentError(
                    f"source is live or already being snapshotted: {source}"
                ) from exc
            raise
        try:
            yield lock_kind
        finally:
            fcntl.flock(descriptor, fcntl.LOCK_UN)
    finally:
        os.close(descriptor)


def _declared_resume_files(
    source: Path, metadata: Mapping[str, Any]
) -> tuple[Path, ...]:
    relatives: set[Path] = {
        Path("run_metadata.json"),
        Path("bank_snapshot.jsonl"),
        Path("checkpoint.sqlite3"),
    }
    for sidecar in ("checkpoint.sqlite3-wal", "checkpoint.sqlite3-shm"):
        if (source / sidecar).is_file():
            relatives.add(Path(sidecar))
    if (source / "migration_manifest.json").is_file():
        relatives.add(Path("migration_manifest.json"))

    seeds = metadata.get("convex_structural_seeds")
    if seeds is not None:
        if not isinstance(seeds, Mapping):
            raise ExperimentError("convex structural seed metadata is malformed")
        for field in (
            "snapshot",
            "source_result_snapshot",
            "theorem_source_snapshot",
        ):
            relatives.add(_safe_relative(seeds.get(field), field=field))

    oracle = metadata.get("formalized_structural_oracle")
    if oracle is not None:
        if not isinstance(oracle, Mapping):
            raise ExperimentError("formalized structural oracle metadata is malformed")
        relatives.add(_safe_relative(oracle.get("snapshot"), field="oracle.snapshot"))
        for group in ("theorem_sources", "build_artifacts"):
            entries = oracle.get(group, ())
            if not isinstance(entries, list):
                raise ExperimentError(f"oracle {group} inventory is malformed")
            for ordinal, entry in enumerate(entries):
                if not isinstance(entry, Mapping):
                    raise ExperimentError(f"oracle {group}[{ordinal}] is malformed")
                relatives.add(
                    _safe_relative(
                        entry.get("snapshot"), field=f"oracle.{group}[{ordinal}]"
                    )
                )

    runtime_root = source / "runtime_sources"
    if runtime_root.exists():
        if not runtime_root.is_dir() or runtime_root.is_symlink():
            raise ExperimentError(f"invalid runtime source directory: {runtime_root}")
        for path in runtime_root.rglob("*"):
            if path.is_symlink():
                raise ExperimentError(f"runtime source contains a symlink: {path}")
            if path.is_file():
                relatives.add(path.relative_to(source))

    ordered = tuple(sorted(relatives, key=lambda path: path.as_posix()))
    for relative in ordered:
        path = source / relative
        if not path.is_file() or path.is_symlink():
            raise ExperimentError(f"required source artifact is absent or unsafe: {path}")
    return ordered


def _copy_file(source: Path, destination: Path) -> None:
    destination.parent.mkdir(parents=True, exist_ok=True)
    if destination.exists():
        raise ExperimentError(f"refusing to replace experiment artifact: {destination}")
    copied = False
    if platform.system() == "Darwin":
        result = subprocess.run(
            ["/bin/cp", "-c", str(source), str(destination)],
            stdin=subprocess.DEVNULL,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            check=False,
        )
        copied = result.returncode == 0
        if not copied:
            destination.unlink(missing_ok=True)
    if not copied:
        with open(source, "rb") as source_handle, open(destination, "xb") as dest_handle:
            shutil.copyfileobj(source_handle, dest_handle, 1 << 20)
            dest_handle.flush()
            os.fsync(dest_handle.fileno())
    shutil.copystat(source, destination, follow_symlinks=False)


@dataclass(frozen=True, slots=True)
class FileDigest:
    path: str
    bytes: int
    sha256: str


def _digest_inventory(root: Path, relatives: Iterable[Path]) -> list[FileDigest]:
    result = []
    for relative in relatives:
        path = root / relative
        result.append(
            FileDigest(
                path=relative.as_posix(),
                bytes=path.stat().st_size,
                sha256=_sha256_file(path),
            )
        )
    return result


def _copy_inventory(
    source: Path, destination: Path, inventory: Sequence[FileDigest]
) -> None:
    destination.mkdir(parents=True)
    for artifact in inventory:
        relative = Path(artifact.path)
        _copy_file(source / relative, destination / relative)
        copied = destination / relative
        if copied.stat().st_size != artifact.bytes or _sha256_file(copied) != artifact.sha256:
            raise ExperimentError(f"private-copy digest mismatch: {source / relative}")
    _fsync_dir(destination)


def _verify_inventory(root: Path, inventory: Sequence[FileDigest]) -> None:
    current = _digest_inventory(root, (Path(item.path) for item in inventory))
    if current != list(inventory):
        raise ExperimentError(f"source artifacts changed while locked: {root}")


@dataclass(frozen=True, slots=True)
class CheckpointState:
    iteration: int
    elapsed_seconds: float
    status: str
    instance_count: int
    order_conditional_records: int


def _validate_declared_hashes(snapshot: Path, metadata: Mapping[str, Any]) -> None:
    bank = snapshot / "bank_snapshot.jsonl"
    raw = bank.read_bytes()
    if raw and not raw.endswith(b"\n"):
        raise ExperimentError("bank snapshot has a truncated final row")
    if _sha256_bytes(raw) != metadata.get("bank_sha256"):
        raise ExperimentError("bank snapshot hash disagrees with run metadata")
    lines = raw.splitlines()
    if len(lines) != metadata.get("bank_rows"):
        raise ExperimentError("bank snapshot row count disagrees with run metadata")
    for ordinal, line in enumerate(lines, 1):
        try:
            row = json.loads(line)
        except json.JSONDecodeError as exc:
            raise ExperimentError(f"bank snapshot row {ordinal} is malformed") from exc
        if not isinstance(row, dict):
            raise ExperimentError(f"bank snapshot row {ordinal} is not an object")

    seeds = metadata.get("convex_structural_seeds")
    if isinstance(seeds, Mapping):
        checks = (
            ("snapshot", "sha256"),
            ("source_result_snapshot", "source_result_sha256"),
            ("theorem_source_snapshot", "theorem_source_sha256"),
        )
        for path_field, hash_field in checks:
            relative = _safe_relative(seeds.get(path_field), field=path_field)
            if _sha256_file(snapshot / relative) != seeds.get(hash_field):
                raise ExperimentError(f"structural seed hash mismatch: {relative}")

    oracle = metadata.get("formalized_structural_oracle")
    if isinstance(oracle, Mapping):
        relative = _safe_relative(oracle.get("snapshot"), field="oracle.snapshot")
        if _sha256_file(snapshot / relative) != oracle.get("sha256"):
            raise ExperimentError("formalized structural oracle snapshot hash mismatch")
        for group in ("theorem_sources", "build_artifacts"):
            for entry in oracle.get(group, ()):
                relative = _safe_relative(entry.get("snapshot"), field=f"oracle.{group}")
                if _sha256_file(snapshot / relative) != entry.get("sha256"):
                    raise ExperimentError(f"formalized oracle artifact hash mismatch: {relative}")


def _validate_checkpoint(
    snapshot: Path, metadata: Mapping[str, Any], *, permit_terminal: bool = False
) -> CheckpointState:
    database = snapshot / "checkpoint.sqlite3"
    connection = sqlite3.connect(database)
    try:
        integrity = connection.execute("PRAGMA integrity_check").fetchall()
        if integrity != [("ok",)]:
            raise ExperimentError(f"checkpoint integrity check failed: {integrity!r}")
        stored = dict(connection.execute("SELECT key, value FROM metadata"))
        if json.loads(stored.get("run_metadata", "null")) != dict(metadata):
            raise ExperimentError("checkpoint run metadata disagrees with run_metadata.json")
        row = connection.execute(
            """SELECT iteration, elapsed_seconds, status, instance_count
               FROM progress WHERE singleton = 1"""
        ).fetchone()
        if row is None:
            raise ExperimentError("checkpoint progress row is absent")
        actual = connection.execute("SELECT COUNT(*) FROM instances").fetchone()[0]
        if int(row[3]) != int(actual):
            raise ExperimentError("checkpoint progress count disagrees with instances")
        order_conditional = int(connection.execute(
            """SELECT COUNT(*) FROM instances
               WHERE json_extract(record_json, '$.provenance.source_kind') =
                     'formalized_structural_core'
                 AND json_extract(record_json, '$.provenance.cut_scope') =
                     'order-conditional'"""
        ).fetchone()[0])
        if order_conditional:
            raise ExperimentError(
                "checkpoint contains order-conditional structural records; "
                "the current global seen-set replay is not scope-safe"
            )
        state = CheckpointState(
            iteration=int(row[0]),
            elapsed_seconds=float(row[1]),
            status=str(row[2]),
            instance_count=int(row[3]),
            order_conditional_records=order_conditional,
        )
        if not permit_terminal and state.status in TERMINAL_STATUSES:
            raise ExperimentError(f"source checkpoint is terminal: {state.status}")
        # Normalize a privately copied WAL before it becomes the parent of two
        # arms.  This write is confined to the experiment snapshot.
        connection.execute("PRAGMA wal_checkpoint(TRUNCATE)")
    except sqlite3.Error as exc:
        raise ExperimentError(f"checkpoint validation failed: {database}: {exc}") from exc
    finally:
        connection.close()
    for suffix in ("-wal", "-shm"):
        sidecar = Path(f"{database}{suffix}")
        if sidecar.exists() and sidecar.stat().st_size == 0:
            sidecar.unlink()
    return state


def _allocate_experiment(work_root: Path, output: Path | None) -> Path:
    if output is not None:
        final = output.resolve()
        final.parent.mkdir(parents=True, exist_ok=True)
        if final.exists():
            raise ExperimentError(f"experiment output already exists: {final}")
        final.mkdir()
        _fsync_dir(final.parent)
        return final
    root = work_root.resolve()
    root.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    for _ in range(100):
        final = root / f"experiment-{stamp}-{os.getpid()}-{secrets.token_hex(4)}"
        try:
            final.mkdir()
            _fsync_dir(root)
            return final
        except FileExistsError:
            continue
    raise ExperimentError("could not allocate a unique experiment directory")


def _snapshot_source(source: Path, experiment: Path) -> tuple[Path, dict[str, Any]]:
    source = source.resolve()
    if not source.is_dir():
        raise ExperimentError(f"source run does not exist: {source}")
    snapshot = experiment / "source_snapshot"
    with _offline_source_lock(source) as lock_kind:
        metadata = _load_json_object(
            source / "run_metadata.json", description="source run metadata"
        )
        if metadata.get("schema") != PROBE_SCHEMA:
            raise ExperimentError("source run metadata has the wrong schema")
        relatives = _declared_resume_files(source, metadata)
        inventory = _digest_inventory(source, relatives)
        _copy_inventory(source, snapshot, inventory)
        _verify_inventory(source, inventory)

    private_metadata = _load_json_object(
        snapshot / "run_metadata.json", description="private source metadata"
    )
    _validate_declared_hashes(snapshot, private_metadata)
    state = _validate_checkpoint(snapshot, private_metadata)
    normalized_relatives = _declared_resume_files(snapshot, private_metadata)
    normalized_inventory = _digest_inventory(snapshot, normalized_relatives)
    manifest = {
        "schema": SOURCE_SCHEMA,
        "status": "validated-offline-clone",
        "source": str(source),
        "source_lock_kind": lock_kind,
        "captured_utc": _utc_now(),
        "source_artifacts": [asdict(item) for item in inventory],
        "private_snapshot_artifacts": [asdict(item) for item in normalized_inventory],
        "checkpoint": asdict(state),
        "bank_sha256": private_metadata["bank_sha256"],
        "bank_rows": private_metadata["bank_rows"],
        "run_metadata_sha256": _sha256_file(snapshot / "run_metadata.json"),
    }
    _atomic_write_json(experiment / "source_manifest.json", manifest)
    return snapshot, manifest


def _parse_named_path(value: str, *, option: str) -> tuple[str, Path]:
    name, separator, raw_path = value.partition("=")
    if not separator or not name or not raw_path:
        raise ExperimentError(f"{option} must be NAME=PATH")
    if not all(character.isalnum() or character in "-_" for character in name):
        raise ExperimentError(f"unsafe arm name: {name!r}")
    return name, Path(raw_path).resolve()


def _parse_named_json_argv(value: str) -> tuple[str, tuple[str, ...]]:
    name, separator, raw = value.partition("=")
    if not separator or not name or not raw:
        raise ExperimentError("--variant-preparer must be NAME=JSON_ARGV")
    try:
        argv = json.loads(raw)
    except json.JSONDecodeError as exc:
        raise ExperimentError(f"variant preparer is malformed JSON: {name}") from exc
    if not isinstance(argv, list) or not argv or not all(isinstance(item, str) for item in argv):
        raise ExperimentError(f"variant preparer must be a nonempty string array: {name}")
    return name, tuple(argv)


def _parse_named_refinement_order(value: str) -> tuple[str, str]:
    name, separator, order = value.partition("=")
    if not separator or not name or order not in ("bank-first", "structural-first"):
        raise ExperimentError(
            "--variant-refinement-order must be NAME=bank-first or "
            "NAME=structural-first"
        )
    return name, order


def _parse_arm_name(value: str, *, option: str) -> str:
    if not value or not all(
        character.isalnum() or character in "-_" for character in value
    ):
        raise ExperimentError(f"{option} requires a safe arm name")
    return value


def _map_probe_into_snapshot(probe_path: Path, source: Path, snapshot: Path) -> Path:
    resolved = probe_path.resolve()
    if _is_relative_to(resolved, source):
        mapped = snapshot / resolved.relative_to(source)
        if not mapped.is_file():
            raise ExperimentError(f"probe was not captured in source snapshot: {resolved}")
        return mapped
    if not resolved.is_file():
        raise ExperimentError(f"probe script does not exist: {resolved}")
    return resolved


def _worker_command(*arguments: str) -> list[str]:
    return [sys.executable, str(Path(__file__).resolve()), *arguments]


def _probe_fingerprint(probe_script: Path) -> dict[str, str]:
    result = subprocess.run(
        _worker_command("_fingerprint", "--probe-script", str(probe_script)),
        cwd=REPO_ROOT,
        stdin=subprocess.DEVNULL,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        check=False,
        timeout=120,
    )
    if result.returncode != 0:
        raise ExperimentError(
            f"could not fingerprint probe {probe_script}: {result.stderr.strip()}"
        )
    try:
        fingerprint = json.loads(result.stdout)
    except json.JSONDecodeError as exc:
        raise ExperimentError(f"probe fingerprint output is malformed: {probe_script}") from exc
    if not isinstance(fingerprint, dict) or not all(
        isinstance(key, str) and isinstance(value, str)
        for key, value in fingerprint.items()
    ):
        raise ExperimentError(f"probe fingerprint has the wrong shape: {probe_script}")
    return fingerprint


def _clone_arm(snapshot: Path, workdir: Path) -> None:
    metadata = _load_json_object(
        snapshot / "run_metadata.json", description="source snapshot metadata"
    )
    relatives = tuple(
        relative
        for relative in _declared_resume_files(snapshot, metadata)
        if relative.parts[0] != "runtime_sources"
    )
    inventory = _digest_inventory(snapshot, relatives)
    _copy_inventory(snapshot, workdir, inventory)
    descriptor = os.open(workdir / PROBE_LOCK, os.O_RDWR | os.O_CREAT | os.O_EXCL, 0o600)
    os.close(descriptor)
    _fsync_dir(workdir)


def _rewrite_arm_metadata(
    workdir: Path,
    *,
    source_manifest: Mapping[str, Any],
    arm: str,
    seed: int,
    fingerprint: Mapping[str, str],
    probe_script: Path,
    refinement_order: str | None,
    perp_template_preseed: bool,
) -> dict[str, Any]:
    path = workdir / "run_metadata.json"
    old_raw = path.read_bytes()
    metadata = _load_json_object(path, description="arm run metadata")
    metadata["seed"] = seed
    metadata["runtime_fingerprint"] = dict(fingerprint)
    if refinement_order is not None:
        metadata["refinement_order"] = refinement_order
    if perp_template_preseed:
        metadata["perp_bisector_template_preseed"] = True
    metadata["experiment_provenance"] = {
        "schema": SCHEMA,
        "arm": arm,
        "source_run_metadata_sha256": source_manifest["run_metadata_sha256"],
        "source_checkpoint": source_manifest["checkpoint"],
        "probe_script": str(probe_script),
        "probe_script_sha256": _sha256_file(probe_script),
        "rewritten_utc": _utc_now(),
        "note": (
            "runtime fingerprint and seed rewritten only in this private arm; "
            "ordinary probe replay remains the validation gate"
        ),
    }
    _atomic_write_json(path, metadata)
    connection = sqlite3.connect(workdir / "checkpoint.sqlite3")
    try:
        with connection:
            cursor = connection.execute(
                "UPDATE metadata SET value = ? WHERE key = 'run_metadata'",
                (_canonical_json(metadata),),
            )
            if cursor.rowcount != 1:
                raise ExperimentError("arm checkpoint has no run_metadata row")
        connection.execute("PRAGMA wal_checkpoint(TRUNCATE)")
    finally:
        connection.close()
    for suffix in ("-wal", "-shm"):
        sidecar = Path(f"{workdir / 'checkpoint.sqlite3'}{suffix}")
        if sidecar.exists() and sidecar.stat().st_size == 0:
            sidecar.unlink()
    state = _validate_checkpoint(workdir, metadata)
    return {
        "source_run_metadata_sha256": _sha256_bytes(old_raw),
        "arm_run_metadata_sha256": _sha256_file(path),
        "checkpoint": asdict(state),
    }


def _format_preparer(
    template: Sequence[str], *, arm: str, workdir: Path, experiment: Path, snapshot: Path
) -> list[str]:
    values = {
        "arm": arm,
        "workdir": str(workdir),
        "experiment": str(experiment),
        "source_snapshot": str(snapshot),
    }
    try:
        return [argument.format(**values) for argument in template]
    except (KeyError, ValueError) as exc:
        raise ExperimentError(f"invalid preparer placeholder for arm {arm}") from exc


def _run_preparer(
    command: Sequence[str], *, workdir: Path, timeout: float
) -> dict[str, Any]:
    started = time.monotonic()
    result = subprocess.run(
        list(command),
        cwd=REPO_ROOT,
        stdin=subprocess.DEVNULL,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        check=False,
        timeout=timeout,
    )
    record = {
        "command": list(command),
        "returncode": result.returncode,
        "elapsed_seconds": time.monotonic() - started,
        "stdout": result.stdout,
        "stderr": result.stderr,
    }
    _atomic_write_json(workdir / "preparer_result.json", record)
    if result.returncode != 0:
        raise ExperimentError(f"variant preparer failed for {workdir.name}")
    return record


def _terminate_group(process: subprocess.Popen[str]) -> None:
    if process.poll() is not None:
        return
    try:
        os.killpg(process.pid, signal.SIGTERM)
    except ProcessLookupError:
        return
    try:
        process.wait(timeout=10)
        return
    except subprocess.TimeoutExpired:
        pass
    try:
        os.killpg(process.pid, signal.SIGKILL)
    except ProcessLookupError:
        pass
    process.wait()


def _run_arm_worker(
    *,
    arm: str,
    probe_script: Path,
    workdir: Path,
    seed: int,
    max_iteration: int,
    wall_seconds: float,
    hard_wall_seconds: float,
    solver_timeout: float,
    proof_timeout: float,
    cadical: str,
    drat_trim: str,
    refinement_order: str | None,
    perp_template_preseed: bool,
) -> dict[str, Any]:
    metrics_path = workdir / "experiment_metrics.json"
    command = _worker_command(
        "_worker",
        "--probe-script", str(probe_script),
        "--workdir", str(workdir),
        "--metrics", str(metrics_path),
        "--seed", str(seed),
        "--max-iteration", str(max_iteration),
        "--wall-seconds", str(wall_seconds),
        "--solver-timeout", str(solver_timeout),
        "--proof-timeout", str(proof_timeout),
        "--cadical", cadical,
        "--drat-trim", drat_trim,
    )
    if refinement_order is not None:
        command.extend(("--refinement-order", refinement_order))
    if perp_template_preseed:
        command.append("--perp-bisector-template-preseed")
    stdout_path = workdir / "experiment_stdout.log"
    stderr_path = workdir / "experiment_stderr.log"
    started = time.monotonic()
    timed_out = False
    with open(stdout_path, "xb") as stdout, open(stderr_path, "xb") as stderr:
        process = subprocess.Popen(
            command,
            cwd=REPO_ROOT,
            stdin=subprocess.DEVNULL,
            stdout=stdout,
            stderr=stderr,
            start_new_session=True,
            text=False,
        )
        try:
            returncode = process.wait(timeout=hard_wall_seconds)
        except subprocess.TimeoutExpired:
            timed_out = True
            _terminate_group(process)
            returncode = process.returncode
    elapsed = time.monotonic() - started
    if metrics_path.is_file():
        metrics = _load_json_object(metrics_path, description=f"{arm} metrics")
    else:
        metrics = {
            "schema": METRICS_SCHEMA,
            "status": "hard-timeout" if timed_out else "worker-failed",
            "events": [],
        }
    return {
        "arm": arm,
        "command": command,
        "returncode": returncode,
        "hard_timeout": timed_out,
        "wall_elapsed_seconds": elapsed,
        "stdout_sha256": _sha256_file(stdout_path),
        "stderr_sha256": _sha256_file(stderr_path),
        "metrics": metrics,
    }


def _summarize_arm(result: Mapping[str, Any], start: CheckpointState) -> dict[str, Any]:
    metrics = result.get("metrics", {})
    events = metrics.get("events", ()) if isinstance(metrics, Mapping) else ()
    events = [event for event in events if isinstance(event, Mapping)]
    final = metrics.get("final_progress") if isinstance(metrics, Mapping) else None
    final_iteration = start.iteration
    final_instances = start.instance_count
    if isinstance(final, Mapping):
        final_iteration = int(final.get("iteration", final_iteration))
        final_instances = int(final.get("instance_count", final_instances))
    dynamic_instances = max(0, final_instances - start.instance_count)
    solver_seconds = sum(
        float(event.get("solver_seconds", 0.0)) for event in events
    )
    algebra_seconds = sum(
        float(event.get("algebra_seconds", 0.0)) for event in events
    )
    structural_seconds = sum(
        float(event.get("structural_seconds", 0.0)) for event in events
    )
    solver_cpu_seconds = sum(
        float(event.get("solver_cpu_seconds", 0.0)) for event in events
    )
    solver_child_cpu_seconds = sum(
        float(event.get("solver_child_cpu_seconds", 0.0)) for event in events
    )
    solver_driver_cpu_seconds = sum(
        float(event.get("solver_driver_cpu_seconds", 0.0)) for event in events
    )
    algebra_cpu_seconds = sum(
        float(event.get("algebra_cpu_seconds", 0.0)) for event in events
    )
    structural_cpu_seconds = sum(
        float(event.get("structural_cpu_seconds", 0.0)) for event in events
    )
    phase_totals = metrics.get("phase_totals", {}) if isinstance(metrics, Mapping) else {}
    if not isinstance(phase_totals, Mapping):
        phase_totals = {}
    formula_build_seconds = float(phase_totals.get("formula_build_seconds", 0.0))
    dimacs_seconds = float(phase_totals.get("dimacs_seconds", 0.0))
    current_cnf_write_seconds = float(
        phase_totals.get("current_cnf_write_seconds", 0.0)
    )
    seen_backstop_seconds = float(
        phase_totals.get("seen_backstop_seconds", 0.0)
    )
    formula_build_cpu_seconds = float(
        phase_totals.get("formula_build_cpu_seconds", 0.0)
    )
    dimacs_cpu_seconds = float(phase_totals.get("dimacs_cpu_seconds", 0.0))
    current_cnf_write_cpu_seconds = float(
        phase_totals.get("current_cnf_write_cpu_seconds", 0.0)
    )
    seen_backstop_cpu_seconds = float(
        phase_totals.get("seen_backstop_cpu_seconds", 0.0)
    )
    wall_elapsed = result.get("wall_elapsed_seconds")
    accounted_seconds = (
        solver_seconds
        + algebra_seconds
        + structural_seconds
        + formula_build_seconds
        + dimacs_seconds
        + current_cnf_write_seconds
        + seen_backstop_seconds
    )
    unclassified_seconds = None
    if isinstance(wall_elapsed, (int, float)):
        unclassified_seconds = max(0.0, float(wall_elapsed) - accounted_seconds)
    worker_self_cpu_seconds = float(metrics.get("worker_self_cpu_seconds", 0.0))
    worker_child_cpu_seconds = float(metrics.get("worker_child_cpu_seconds", 0.0))
    worker_total_cpu_seconds = worker_self_cpu_seconds + worker_child_cpu_seconds
    accounted_cpu_seconds = (
        solver_cpu_seconds
        + algebra_cpu_seconds
        + structural_cpu_seconds
        + formula_build_cpu_seconds
        + dimacs_cpu_seconds
        + current_cnf_write_cpu_seconds
        + seen_backstop_cpu_seconds
    )
    unclassified_cpu_seconds = max(
        0.0, worker_total_cpu_seconds - accounted_cpu_seconds
    )
    probe_result = metrics.get("probe_result") if isinstance(metrics, Mapping) else None
    if not isinstance(probe_result, Mapping):
        probe_result = {}
    return {
        "status": metrics.get("status") if isinstance(metrics, Mapping) else "invalid",
        "probe_exit_code": metrics.get("probe_exit_code") if isinstance(metrics, Mapping) else None,
        "hard_timeout": result.get("hard_timeout"),
        "completed_iterations": max(0, final_iteration - start.iteration),
        # Kept as a compatibility alias.  These are checkpointed lazy cuts,
        # not built-in seed clauses reconstructed when the formula is built.
        "new_instances": dynamic_instances,
        "new_checkpoint_instances": dynamic_instances,
        "final_seed_instances": probe_result.get("seed_instances"),
        "final_formula_instances": probe_result.get("formula_instances"),
        "preseed_new_instances": probe_result.get("preseed_new_instances"),
        "preseed_already_present_instances": probe_result.get(
            "preseed_already_present_instances"
        ),
        "event_count": len(events),
        "solver_seconds": solver_seconds,
        "solver_wall_seconds": solver_seconds,
        "solver_cpu_seconds": solver_cpu_seconds,
        "solver_child_cpu_seconds": solver_child_cpu_seconds,
        "solver_driver_cpu_seconds": solver_driver_cpu_seconds,
        "algebra_seconds": algebra_seconds,
        "algebra_wall_seconds": algebra_seconds,
        "algebra_cpu_seconds": algebra_cpu_seconds,
        "structural_seconds": structural_seconds,
        "structural_wall_seconds": structural_seconds,
        "structural_cpu_seconds": structural_cpu_seconds,
        "formula_build_calls": int(phase_totals.get("formula_build_calls", 0)),
        "formula_build_seconds": formula_build_seconds,
        "formula_build_wall_seconds": formula_build_seconds,
        "formula_build_cpu_seconds": formula_build_cpu_seconds,
        "dimacs_calls": int(phase_totals.get("dimacs_calls", 0)),
        "dimacs_seconds": dimacs_seconds,
        "dimacs_wall_seconds": dimacs_seconds,
        "dimacs_cpu_seconds": dimacs_cpu_seconds,
        "current_cnf_write_calls": int(
            phase_totals.get("current_cnf_write_calls", 0)
        ),
        "current_cnf_write_seconds": current_cnf_write_seconds,
        "current_cnf_write_wall_seconds": current_cnf_write_seconds,
        "current_cnf_write_cpu_seconds": current_cnf_write_cpu_seconds,
        "seen_backstop_calls": int(phase_totals.get("seen_backstop_calls", 0)),
        "seen_backstop_seconds": seen_backstop_seconds,
        "seen_backstop_wall_seconds": seen_backstop_seconds,
        "seen_backstop_cpu_seconds": seen_backstop_cpu_seconds,
        "worker_self_cpu_seconds": worker_self_cpu_seconds,
        "worker_child_cpu_seconds": worker_child_cpu_seconds,
        "worker_total_cpu_seconds": worker_total_cpu_seconds,
        "accounted_cpu_seconds": accounted_cpu_seconds,
        "unclassified_cpu_seconds": unclassified_cpu_seconds,
        "unclassified_wall_seconds": unclassified_seconds,
        "algebra_records": sum(int(event.get("algebra_records", 0)) for event in events),
        "structural_records": sum(int(event.get("structural_records", 0)) for event in events),
        "unsafe_order_conditional_records": sum(
            int(event.get("unsafe_order_conditional_records", 0)) for event in events
        ),
        "deferred_order_conditional_scans": sum(
            int(event.get("deferred_order_conditional_scans", 0)) for event in events
        ),
        "unsafe_deferred_without_algebra": sum(
            int(event.get("unsafe_deferred_without_algebra", 0)) for event in events
        ),
        "wall_elapsed_seconds": wall_elapsed,
    }


def run_experiment(args: argparse.Namespace) -> tuple[Path, dict[str, Any]]:
    source = args.source.resolve()
    experiment = _allocate_experiment(args.work_root, args.output)
    base_manifest = {
        "schema": SCHEMA,
        "status": "initializing",
        "experiment": str(experiment),
        "created_utc": _utc_now(),
        "harness_sha256": _sha256_file(Path(__file__).resolve()),
        "source": str(source),
        "caps": {
            "iterations": args.iterations,
            "wall_seconds_per_arm": args.wall_seconds,
            "hard_wall_seconds_per_arm": args.hard_wall_seconds,
            "solver_timeout": args.solver_timeout,
            "proof_timeout": args.proof_timeout,
            "preparer_timeout": args.preparer_timeout,
        },
    }
    _atomic_write_json(experiment / "experiment_manifest.json", base_manifest)
    try:
        snapshot, source_manifest = _snapshot_source(source, experiment)
        start = CheckpointState(**source_manifest["checkpoint"])
        max_iteration = start.iteration + args.iterations
        source_metadata = _load_json_object(
            snapshot / "run_metadata.json", description="source snapshot metadata"
        )
        seed = source_metadata["seed"] if args.seed is None else args.seed

        arms: list[tuple[str, Path]] = [("baseline", args.baseline_probe)]
        arms.extend(_parse_named_path(value, option="--variant") for value in args.variant)
        names = [name for name, _ in arms]
        if len(names) != len(set(names)):
            raise ExperimentError("arm names must be unique")
        preparers = dict(_parse_named_json_argv(value) for value in args.variant_preparer)
        refinement_orders = dict(
            _parse_named_refinement_order(value)
            for value in args.variant_refinement_order
        )
        if args.baseline_refinement_order is not None:
            refinement_orders["baseline"] = args.baseline_refinement_order
        perp_preseed_arms = {
            _parse_arm_name(
                value, option="--variant-perp-template-preseed"
            )
            for value in args.variant_perp_template_preseed
        }
        if args.baseline_perp_template_preseed:
            perp_preseed_arms.add("baseline")
        unknown_preparers = set(preparers) - set(names)
        if unknown_preparers or "baseline" in preparers:
            raise ExperimentError(
                "preparers may name only non-baseline arms: "
                + ", ".join(sorted(unknown_preparers | ({"baseline"} & set(preparers))))
            )
        unknown_orders = set(refinement_orders) - set(names)
        if unknown_orders:
            raise ExperimentError(
                "refinement orders may name only non-baseline arms: "
                + ", ".join(sorted(unknown_orders))
            )
        unknown_preseed_arms = perp_preseed_arms - set(names)
        if unknown_preseed_arms:
            raise ExperimentError(
                "perpendicular-template preseed names unknown arms: "
                + ", ".join(sorted(unknown_preseed_arms))
            )

        arm_results = []
        for name, requested_probe in arms:
            probe_script = _map_probe_into_snapshot(requested_probe, source, snapshot)
            fingerprint = _probe_fingerprint(probe_script)
            workdir = experiment / "arms" / name
            _clone_arm(snapshot, workdir)
            rewrite = _rewrite_arm_metadata(
                workdir,
                source_manifest=source_manifest,
                arm=name,
                seed=seed,
                fingerprint=fingerprint,
                probe_script=probe_script,
                refinement_order=refinement_orders.get(name),
                perp_template_preseed=name in perp_preseed_arms,
            )
            preparer_result = None
            if name in preparers:
                command = _format_preparer(
                    preparers[name],
                    arm=name,
                    workdir=workdir,
                    experiment=experiment,
                    snapshot=snapshot,
                )
                preparer_result = _run_preparer(
                    command, workdir=workdir, timeout=args.preparer_timeout
                )
            result = _run_arm_worker(
                arm=name,
                probe_script=probe_script,
                workdir=workdir,
                seed=seed,
                max_iteration=max_iteration,
                wall_seconds=args.wall_seconds,
                hard_wall_seconds=args.hard_wall_seconds,
                solver_timeout=args.solver_timeout,
                proof_timeout=args.proof_timeout,
                cadical=args.cadical,
                drat_trim=args.drat_trim,
                refinement_order=refinement_orders.get(name),
                perp_template_preseed=name in perp_preseed_arms,
            )
            arm_results.append({
                **result,
                "probe_script": str(probe_script),
                "probe_script_sha256": _sha256_file(probe_script),
                "runtime_fingerprint": fingerprint,
                "metadata_rewrite": rewrite,
                "preparer": preparer_result,
                "refinement_order": refinement_orders.get(name),
                "perp_bisector_template_preseed": name in perp_preseed_arms,
                "summary": _summarize_arm(result, start),
            })
            _atomic_write_json(
                experiment / "experiment_manifest.json",
                {
                    **base_manifest,
                    "status": "running",
                    "source_manifest": source_manifest,
                    "seed": seed,
                    "start_checkpoint": asdict(start),
                    "max_iteration": max_iteration,
                    "arms": arm_results,
                    "updated_utc": _utc_now(),
                },
            )

        complete = all(
            result["returncode"] == 0 and not result["hard_timeout"]
            for result in arm_results
        )
        manifest = {
            **base_manifest,
            "status": "complete" if complete else "failed",
            "source_manifest": source_manifest,
            "seed": seed,
            "start_checkpoint": asdict(start),
            "max_iteration": max_iteration,
            "arms": arm_results,
            "completed_utc": _utc_now(),
        }
        _atomic_write_json(experiment / "experiment_manifest.json", manifest)
        return experiment, manifest
    except Exception as exc:
        failure = {
            **base_manifest,
            "status": "failed",
            "error": f"{type(exc).__name__}: {exc}",
            "failed_utc": _utc_now(),
        }
        _atomic_write_json(experiment / "experiment_manifest.json", failure)
        raise


def _load_probe(path: Path):
    probe_path = path.resolve()
    if not probe_path.is_file():
        raise ExperimentError(f"probe script does not exist: {probe_path}")
    probe_here = probe_path.parent
    probe_root = probe_here.parent.parent
    sys.path.insert(0, str(probe_here))
    sys.path.insert(0, str(probe_root))
    module_name = f"census554_experiment_probe_{secrets.token_hex(8)}"
    spec = importlib.util.spec_from_file_location(module_name, probe_path)
    if spec is None or spec.loader is None:
        raise ExperimentError(f"could not load probe script: {probe_path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[module_name] = module
    spec.loader.exec_module(module)
    if getattr(module, "SCHEMA", None) != PROBE_SCHEMA:
        raise ExperimentError(f"probe has the wrong schema: {probe_path}")
    return module


class _MetricsRecorder:
    def __init__(self) -> None:
        self.current_iteration: int | None = None
        self.events: list[dict[str, Any]] = []
        self.current: dict[str, Any] = {}
        self.formula_build_calls = 0
        self.formula_build_seconds = 0.0
        self.formula_build_cpu_seconds = 0.0
        self.dimacs_calls = 0
        self.dimacs_seconds = 0.0
        self.dimacs_cpu_seconds = 0.0
        self.current_cnf_write_calls = 0
        self.current_cnf_write_seconds = 0.0
        self.current_cnf_write_cpu_seconds = 0.0
        self.seen_backstop_calls = 0
        self.seen_backstop_seconds = 0.0
        self.seen_backstop_cpu_seconds = 0.0

    def begin(self, iteration: int) -> None:
        if self.current_iteration != iteration:
            self.flush()
            self.current_iteration = iteration
            self.current = {
                "iteration": iteration,
                "solver_calls": 0,
                "solver_seconds": 0.0,
                "solver_cpu_seconds": 0.0,
                "solver_child_cpu_seconds": 0.0,
                "solver_driver_cpu_seconds": 0.0,
                "algebra_calls": 0,
                "algebra_seconds": 0.0,
                "algebra_cpu_seconds": 0.0,
                "algebra_records": 0,
                "structural_calls": 0,
                "structural_seconds": 0.0,
                "structural_cpu_seconds": 0.0,
                "structural_records": 0,
                "unsafe_order_conditional_records": 0,
                "deferred_order_conditional_scans": 0,
                "unsafe_deferred_without_algebra": 0,
            }

    def add(self, key: str, value: int | float) -> None:
        if self.current_iteration is not None:
            self.current[key] = self.current.get(key, 0) + value

    def flush(self) -> None:
        if self.current_iteration is not None:
            self.events.append(dict(self.current))
        self.current_iteration = None
        self.current = {}


def _instrument_probe(probe, recorder: _MetricsRecorder) -> None:
    original_build = getattr(probe, "_prepare_formula", None)
    if original_build is not None:
        def timed_build(*args, **kwargs):
            started = time.monotonic()
            cpu_started = _cpu_snapshot()
            try:
                return original_build(*args, **kwargs)
            finally:
                self_cpu, child_cpu = _cpu_delta(cpu_started)
                recorder.formula_build_calls += 1
                recorder.formula_build_seconds += time.monotonic() - started
                recorder.formula_build_cpu_seconds += self_cpu + child_cpu

        probe._prepare_formula = timed_build

    cover_instance = getattr(getattr(probe, "sat_cover", None), "CoverInstance", None)
    original_dimacs = getattr(cover_instance, "dimacs", None)
    if original_dimacs is not None:
        def timed_dimacs(*args, **kwargs):
            started = time.monotonic()
            cpu_started = _cpu_snapshot()
            try:
                return original_dimacs(*args, **kwargs)
            finally:
                self_cpu, child_cpu = _cpu_delta(cpu_started)
                recorder.dimacs_calls += 1
                recorder.dimacs_seconds += time.monotonic() - started
                recorder.dimacs_cpu_seconds += self_cpu + child_cpu

        cover_instance.dimacs = timed_dimacs

    original_atomic_write = getattr(probe, "_atomic_write_bytes", None)
    if original_atomic_write is not None:
        def timed_atomic_write(path, *args, **kwargs):
            if Path(path).name != "current.cnf":
                return original_atomic_write(path, *args, **kwargs)
            started = time.monotonic()
            cpu_started = _cpu_snapshot()
            try:
                return original_atomic_write(path, *args, **kwargs)
            finally:
                self_cpu, child_cpu = _cpu_delta(cpu_started)
                recorder.current_cnf_write_calls += 1
                recorder.current_cnf_write_seconds += time.monotonic() - started
                recorder.current_cnf_write_cpu_seconds += self_cpu + child_cpu

        probe._atomic_write_bytes = timed_atomic_write

    original_seen_backstop = getattr(probe, "_assert_no_seen_exclusion", None)
    if original_seen_backstop is not None:
        def timed_seen_backstop(*args, **kwargs):
            started = time.monotonic()
            cpu_started = _cpu_snapshot()
            try:
                return original_seen_backstop(*args, **kwargs)
            finally:
                self_cpu, child_cpu = _cpu_delta(cpu_started)
                recorder.seen_backstop_calls += 1
                recorder.seen_backstop_seconds += time.monotonic() - started
                recorder.seen_backstop_cpu_seconds += self_cpu + child_cpu

        probe._assert_no_seen_exclusion = timed_seen_backstop

    original_seed = probe._solver_seed

    def timed_seed(run_seed, iteration, purpose):
        if purpose == "search":
            recorder.begin(int(iteration))
        return original_seed(run_seed, iteration, purpose)

    probe._solver_seed = timed_seed

    original_command = probe._run_command

    def timed_command(*args, **kwargs):
        started = time.monotonic()
        cpu_started = _cpu_snapshot()
        try:
            return original_command(*args, **kwargs)
        finally:
            self_cpu, child_cpu = _cpu_delta(cpu_started)
            output = kwargs.get("stdout_path")
            if output is None and len(args) >= 2:
                output = args[1]
            name = "" if output is None else Path(output).name
            if name == "search_solver.stdout":
                recorder.add("solver_calls", 1)
                recorder.add("solver_seconds", time.monotonic() - started)
                recorder.add("solver_driver_cpu_seconds", self_cpu)
                recorder.add("solver_child_cpu_seconds", child_cpu)
                recorder.add("solver_cpu_seconds", self_cpu + child_cpu)

    probe._run_command = timed_command

    original_algebra = probe._add_lazy_embeddings

    def timed_algebra(*args, **kwargs):
        started = time.monotonic()
        cpu_started = _cpu_snapshot()
        try:
            records = original_algebra(*args, **kwargs)
            recorder.add("algebra_records", len(records))
            if (
                not records
                and recorder.current.get("pending_deferred_order_conditional")
            ):
                recorder.add("unsafe_deferred_without_algebra", 1)
                raise ExperimentError(
                    "a deferred order-conditional structural hit had no "
                    "algebra fallback; fail-stop avoids a false frontier"
                )
            if records:
                recorder.current.pop("pending_deferred_order_conditional", None)
            return records
        finally:
            self_cpu, child_cpu = _cpu_delta(cpu_started)
            recorder.add("algebra_calls", 1)
            recorder.add("algebra_seconds", time.monotonic() - started)
            recorder.add("algebra_cpu_seconds", self_cpu + child_cpu)

    probe._add_lazy_embeddings = timed_algebra

    original_structural = probe._add_formalized_structural_refinements

    def timed_structural(*args, **kwargs):
        started = time.monotonic()
        cpu_started = _cpu_snapshot()
        try:
            result = original_structural(*args, **kwargs)
            records = result[0] if isinstance(result, tuple) else result
            summary = result[1] if isinstance(result, tuple) and len(result) > 1 else None
            recorder.add("structural_records", len(records))
            unsafe = sum(
                1
                for record in records
                if isinstance(record, Mapping)
                and isinstance(record.get("provenance"), Mapping)
                and record["provenance"].get("cut_scope") == "order-conditional"
            )
            if unsafe:
                recorder.add("unsafe_order_conditional_records", unsafe)
                raise ExperimentError(
                    "formalized structural scan emitted an order-conditional "
                    "record; fail-stop avoids the current scope-unsafe seen set"
                )
            if (
                isinstance(summary, Mapping)
                and summary.get("status") == "deferred-order-conditional"
            ):
                recorder.add("deferred_order_conditional_scans", 1)
                if (
                    recorder.current.get("algebra_calls", 0)
                    and not recorder.current.get("algebra_records", 0)
                ):
                    recorder.add("unsafe_deferred_without_algebra", 1)
                    raise ExperimentError(
                        "a deferred order-conditional structural hit followed "
                        "an empty algebra scan; fail-stop avoids a false frontier"
                    )
                recorder.current["pending_deferred_order_conditional"] = True
            return result
        finally:
            self_cpu, child_cpu = _cpu_delta(cpu_started)
            recorder.add("structural_calls", 1)
            recorder.add("structural_seconds", time.monotonic() - started)
            recorder.add("structural_cpu_seconds", self_cpu + child_cpu)

    probe._add_formalized_structural_refinements = timed_structural


def _checkpoint_progress_readonly(workdir: Path) -> dict[str, Any] | None:
    database = workdir / "checkpoint.sqlite3"
    if not database.is_file():
        return None
    try:
        connection = sqlite3.connect(f"file:{database}?mode=ro", uri=True)
        try:
            row = connection.execute(
                """SELECT iteration, elapsed_seconds, status, instance_count
                   FROM progress WHERE singleton = 1"""
            ).fetchone()
        finally:
            connection.close()
    except sqlite3.Error:
        return None
    if row is None:
        return None
    return {
        "iteration": int(row[0]),
        "elapsed_seconds": float(row[1]),
        "status": str(row[2]),
        "instance_count": int(row[3]),
    }


def _probe_result_summary(workdir: Path) -> dict[str, Any] | None:
    result_path = workdir / "result.json"
    if not result_path.is_file():
        return None
    try:
        result = _load_json_object(result_path, description="probe result")
    except ExperimentError:
        return None
    formula_sources = result.get("formula_sources")
    perp = None
    if isinstance(formula_sources, Mapping):
        candidate = formula_sources.get("perp_bisector_template")
        if isinstance(candidate, Mapping):
            perp = candidate
    return {
        "status": result.get("status"),
        "seed_instances": result.get("seed_instances"),
        "formula_instances": result.get("instances"),
        "preseed_new_instances": (
            perp.get("new_instances") if isinstance(perp, Mapping) else None
        ),
        "preseed_already_present_instances": (
            perp.get("already_present_instances")
            if isinstance(perp, Mapping)
            else None
        ),
    }


def _worker_main(argv: Sequence[str]) -> int:
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--probe-script", type=Path, required=True)
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--metrics", type=Path, required=True)
    parser.add_argument("--seed", type=int, required=True)
    parser.add_argument("--max-iteration", type=int, required=True)
    parser.add_argument("--wall-seconds", type=float, required=True)
    parser.add_argument("--solver-timeout", type=float, required=True)
    parser.add_argument("--proof-timeout", type=float, required=True)
    parser.add_argument("--cadical", required=True)
    parser.add_argument("--drat-trim", required=True)
    parser.add_argument("--refinement-order")
    parser.add_argument(
        "--perp-bisector-template-preseed", action="store_true"
    )
    args = parser.parse_args(argv)
    started = time.monotonic()
    cpu_started = _cpu_snapshot()
    probe = _load_probe(args.probe_script)
    recorder = _MetricsRecorder()
    _instrument_probe(probe, recorder)
    probe_exit = None
    error = None
    try:
        probe_argv = [
            "--resume", str(args.workdir),
            "--seed", str(args.seed),
            "--max-iterations", str(args.max_iteration),
            "--wall-seconds", str(args.wall_seconds),
            "--solver-timeout", str(args.solver_timeout),
            "--proof-timeout", str(args.proof_timeout),
            "--cadical", args.cadical,
            "--drat-trim", args.drat_trim,
        ]
        if args.refinement_order is not None:
            probe_argv.extend(("--refinement-order", args.refinement_order))
        if args.perp_bisector_template_preseed:
            probe_argv.append("--perp-bisector-template-preseed")
        probe_exit = probe.main(probe_argv)
    except BaseException as exc:  # preserve metrics even for an unexpected probe exit
        error = f"{type(exc).__name__}: {exc}"
    finally:
        recorder.flush()
        final_progress = _checkpoint_progress_readonly(args.workdir)
        probe_result = _probe_result_summary(args.workdir)
        worker_self_cpu, worker_child_cpu = _cpu_delta(cpu_started)
        metrics = {
            "schema": METRICS_SCHEMA,
            "status": (
                "completed" if probe_exit in (0, 2) and error is None else "failed"
            ),
            "probe_exit_code": probe_exit,
            "error": error,
            "worker_elapsed_seconds": time.monotonic() - started,
            "worker_self_cpu_seconds": worker_self_cpu,
            "worker_child_cpu_seconds": worker_child_cpu,
            "worker_total_cpu_seconds": worker_self_cpu + worker_child_cpu,
            "cpu_accounting": {
                "self": "time.process_time user plus system CPU",
                "children": "RUSAGE_CHILDREN user plus system CPU",
                "wall_time_role": "safety budget and secondary diagnostic only",
            },
            "phase_totals": {
                "formula_build_calls": recorder.formula_build_calls,
                "formula_build_seconds": recorder.formula_build_seconds,
                "formula_build_cpu_seconds": recorder.formula_build_cpu_seconds,
                "dimacs_calls": recorder.dimacs_calls,
                "dimacs_seconds": recorder.dimacs_seconds,
                "dimacs_cpu_seconds": recorder.dimacs_cpu_seconds,
                "current_cnf_write_calls": recorder.current_cnf_write_calls,
                "current_cnf_write_seconds": recorder.current_cnf_write_seconds,
                "current_cnf_write_cpu_seconds": (
                    recorder.current_cnf_write_cpu_seconds
                ),
                "seen_backstop_calls": recorder.seen_backstop_calls,
                "seen_backstop_seconds": recorder.seen_backstop_seconds,
                "seen_backstop_cpu_seconds": recorder.seen_backstop_cpu_seconds,
            },
            "events": recorder.events,
            "final_progress": final_progress,
            "probe_result": probe_result,
            "completed_utc": _utc_now(),
        }
        _atomic_write_json(args.metrics, metrics)
    return 0 if probe_exit in (0, 2) and error is None else 1


def _fingerprint_main(argv: Sequence[str]) -> int:
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--probe-script", type=Path, required=True)
    args = parser.parse_args(argv)
    probe = _load_probe(args.probe_script)
    print(_canonical_json(probe._runtime_fingerprint()))
    return 0


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--baseline-probe", type=Path, required=True)
    parser.add_argument(
        "--baseline-refinement-order",
        choices=("bank-first", "structural-first"),
        help="explicit scheduling policy for a single-arm or custom baseline",
    )
    parser.add_argument(
        "--baseline-perp-template-preseed",
        action="store_true",
        help="enable the pinned perpendicular template in the baseline arm",
    )
    parser.add_argument(
        "--variant", action="append", default=[], metavar="NAME=PATH",
        help="variant name and probe script; repeat to compare multiple variants",
    )
    parser.add_argument(
        "--variant-preparer", action="append", default=[], metavar="NAME=JSON_ARGV",
        help="optional no-shell preparer command for a non-baseline private arm",
    )
    parser.add_argument(
        "--variant-refinement-order", action="append", default=[],
        metavar="NAME=ORDER",
        help=(
            "persist and pass a variant probe's bank-first or structural-first "
            "candidate schedule"
        ),
    )
    parser.add_argument(
        "--variant-perp-template-preseed",
        action="append",
        default=[],
        metavar="NAME",
        help=(
            "enable the pinned perpendicular-bisector template preseed for "
            "one non-baseline arm"
        ),
    )
    parser.add_argument("--work-root", type=Path, default=DEFAULT_WORK_ROOT)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--iterations", type=int, default=20)
    parser.add_argument("--wall-seconds", type=float, default=600)
    parser.add_argument("--hard-wall-seconds", type=float, default=1200)
    parser.add_argument("--solver-timeout", type=float, default=600)
    parser.add_argument("--proof-timeout", type=float, default=600)
    parser.add_argument("--preparer-timeout", type=float, default=600)
    parser.add_argument("--seed", type=int)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--drat-trim", default="drat-trim")
    args = parser.parse_args(argv)
    if args.iterations <= 0:
        parser.error("--iterations must be positive")
    for field in (
        "wall_seconds", "hard_wall_seconds", "solver_timeout",
        "proof_timeout", "preparer_timeout",
    ):
        if getattr(args, field) <= 0:
            parser.error(f"--{field.replace('_', '-')} must be positive")
    if args.seed is not None and not 0 <= args.seed <= 2_000_000_000:
        parser.error("--seed must be in 0..2000000000")
    return args


def main(argv: Sequence[str] | None = None) -> int:
    argv = list(sys.argv[1:] if argv is None else argv)
    if argv and argv[0] == "_worker":
        return _worker_main(argv[1:])
    if argv and argv[0] == "_fingerprint":
        return _fingerprint_main(argv[1:])
    args = _parse_args(argv)
    try:
        experiment, manifest = run_experiment(args)
    except (ExperimentError, OSError, sqlite3.Error, subprocess.SubprocessError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr, flush=True)
        return 1
    print(
        json.dumps(
            {
                "status": manifest["status"],
                "experiment": str(experiment),
                "arms": {
                    arm["arm"]: arm["summary"] for arm in manifest.get("arms", ())
                },
            },
            sort_keys=True,
        ),
        flush=True,
    )
    return 0 if manifest["status"] == "complete" else 1


if __name__ == "__main__":
    raise SystemExit(main())
