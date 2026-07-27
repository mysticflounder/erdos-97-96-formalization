#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Compile a hashed compact windowed-RUP replay package, one Lean module at a time.

This is deliberately build tooling, not a source-satisfaction check or a proof
closure claim.  In particular, a successful run records that Lean elaborated the
listed generated sources in the current project environment; it does not audit
the terminal theorem's axioms or certify the package's mathematical encoding.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import subprocess
import sys
from typing import Any, Callable, Mapping, Sequence


PACKAGE_MANIFEST_NAME = "compact-replay-manifest.json"
OUTPUT_MANIFEST_NAME = "compact-replay-compile-manifest.json"
COMPILE_LOG_NAME = "compact-replay-compile.log"
OUTPUT_SCHEMA = "p97-compact-windowed-rup-single-worker-compile-v1"
EXPECTED_PACKAGE_SCHEMA = "p97-windowed-rup-compact-lean-replay-v2"
DEFAULT_MEMORY_MB = 16384
MAX_MEMORY_MB = 1048576
SHA256_RE = re.compile(r"^[0-9a-f]{64}$")
MODULE_COMPONENT_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_']*$")
IMPORT_RE = re.compile(r"^\s*import\s+([A-Za-z_][A-Za-z0-9_'.]*)\b")


class CompactReplayCompileError(RuntimeError):
    """The compilation inputs, lock, or recorded output are unsafe or inconsistent."""


@dataclass(frozen=True)
class LeanSource:
    """One source entry in the package manifest, retaining its manifest order."""

    relative: PurePosixPath
    byte_count: int
    sha256: str
    module_name: str

    @property
    def path_text(self) -> str:
        return self.relative.as_posix()

    def manifest_record(self) -> dict[str, Any]:
        return {
            "path": self.path_text,
            "byte_count": self.byte_count,
            "sha256": self.sha256,
        }


@dataclass(frozen=True)
class PackageSpec:
    """Validated, relocation-safe compilation inputs."""

    package_dir: Path
    manifest_sha256: str
    package_sha256: str
    schema: str
    epistemic_status: str | None
    sources: tuple[LeanSource, ...]

    @property
    def source_records(self) -> list[dict[str, Any]]:
        return [source.manifest_record() for source in self.sources]


Runner = Callable[[Sequence[str], Path, Mapping[str, str]], subprocess.CompletedProcess[str]]


def _sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        while block := source.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def _canonical_json(payload: object) -> bytes:
    return json.dumps(payload, separators=(",", ":"), sort_keys=True).encode("utf-8")


def _package_digest(payload: dict[str, Any]) -> str:
    copied = dict(payload)
    copied.pop("compact_replay_package_sha256", None)
    return _sha256_bytes(_canonical_json(copied))


def _is_relative_to(path: Path, root: Path) -> bool:
    try:
        path.relative_to(root)
    except ValueError:
        return False
    return True


def _require_plain_directory(path: Path, *, label: str) -> Path:
    if path.is_symlink() or not path.is_dir():
        raise CompactReplayCompileError(f"{label} is not a non-symlink directory: {path}")
    return path.resolve()


def _safe_relative_lean_path(value: object) -> PurePosixPath:
    if not isinstance(value, str) or not value:
        raise CompactReplayCompileError("manifest Lean source path is not a nonempty string")
    if "\\" in value or "\x00" in value:
        raise CompactReplayCompileError(f"unsafe manifest Lean source path: {value!r}")
    relative = PurePosixPath(value)
    if (
        relative.is_absolute()
        or not relative.parts
        or relative == PurePosixPath(".")
        or ".." in relative.parts
        or relative.as_posix() != value
        or relative.suffix != ".lean"
    ):
        raise CompactReplayCompileError(f"unsafe manifest Lean source path: {value!r}")
    if not all(MODULE_COMPONENT_RE.fullmatch(part) for part in relative.with_suffix("").parts):
        raise CompactReplayCompileError(f"non-module manifest Lean source path: {value!r}")
    return relative


def _module_name(relative: PurePosixPath) -> str:
    return ".".join(relative.with_suffix("").parts)


def _require_nonnegative_int(value: object, *, label: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value < 0:
        raise CompactReplayCompileError(f"{label} is not a nonnegative integer")
    return value


def _require_sha256(value: object, *, label: str) -> str:
    if not isinstance(value, str) or SHA256_RE.fullmatch(value) is None:
        raise CompactReplayCompileError(f"{label} is not a lowercase SHA-256 digest")
    return value


def _assert_no_symlink_ancestors(root: Path, target: Path, *, label: str) -> None:
    relative = target.relative_to(root)
    current = root
    if current.is_symlink():
        raise CompactReplayCompileError(f"{label} has a symlinked package root")
    for part in relative.parts:
        current = current / part
        if current.is_symlink():
            raise CompactReplayCompileError(f"{label} contains symlink: {relative}")


def _parse_internal_imports(source: str) -> set[str]:
    return {
        match.group(1)
        for line in source.splitlines()
        if (match := IMPORT_RE.match(line)) is not None
    }


def read_package_spec(package_dir: Path) -> PackageSpec:
    """Rehash the manifest-listed Lean sources and enforce their declared order."""

    package_dir = _require_plain_directory(package_dir, label="package directory")
    manifest_path = package_dir / PACKAGE_MANIFEST_NAME
    if manifest_path.is_symlink() or not manifest_path.is_file():
        raise CompactReplayCompileError(f"missing non-symlink package manifest: {manifest_path}")
    try:
        raw_manifest = manifest_path.read_bytes()
        manifest = json.loads(raw_manifest.decode("utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise CompactReplayCompileError(f"cannot read package manifest: {manifest_path}") from exc
    if not isinstance(manifest, dict):
        raise CompactReplayCompileError("package manifest is not an object")
    if manifest.get("schema") != EXPECTED_PACKAGE_SCHEMA:
        raise CompactReplayCompileError(f"unexpected compact replay schema: {manifest.get('schema')!r}")
    package_sha256 = _require_sha256(
        manifest.get("compact_replay_package_sha256"), label="package manifest digest"
    )
    if package_sha256 != _package_digest(manifest):
        raise CompactReplayCompileError("package manifest digest does not match its canonical contents")
    raw_sources = manifest.get("lean_sources")
    if not isinstance(raw_sources, list) or not raw_sources:
        raise CompactReplayCompileError("package manifest lean_sources is not a nonempty list")
    counts = manifest.get("counts")
    if not isinstance(counts, dict) or counts.get("lean_sources") != len(raw_sources):
        raise CompactReplayCompileError("package manifest Lean-source count drift")

    sources: list[LeanSource] = []
    source_texts: list[str] = []
    seen_paths: set[str] = set()
    seen_modules: set[str] = set()
    for index, record in enumerate(raw_sources):
        if not isinstance(record, dict):
            raise CompactReplayCompileError(f"manifest Lean source {index} is not an object")
        relative = _safe_relative_lean_path(record.get("path"))
        path_text = relative.as_posix()
        if path_text in seen_paths:
            raise CompactReplayCompileError(f"duplicate manifest Lean source path: {path_text}")
        source_path = package_dir.joinpath(*relative.parts)
        if not _is_relative_to(source_path.resolve(), package_dir):
            raise CompactReplayCompileError(f"manifest Lean source escapes package: {path_text}")
        _assert_no_symlink_ancestors(package_dir, source_path, label="manifest Lean source")
        if not source_path.is_file():
            raise CompactReplayCompileError(f"missing manifest Lean source: {path_text}")
        byte_count = _require_nonnegative_int(record.get("byte_count"), label="Lean source byte_count")
        source_sha256 = _require_sha256(record.get("sha256"), label="Lean source sha256")
        if source_path.stat().st_size != byte_count:
            raise CompactReplayCompileError(f"manifest Lean source byte-count drift: {path_text}")
        if _sha256_file(source_path) != source_sha256:
            raise CompactReplayCompileError(f"manifest Lean source SHA-256 drift: {path_text}")
        try:
            source_text = source_path.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError) as exc:
            raise CompactReplayCompileError(f"cannot decode manifest Lean source: {path_text}") from exc
        module_name = _module_name(relative)
        if module_name in seen_modules:
            raise CompactReplayCompileError(f"duplicate manifest Lean module: {module_name}")
        seen_paths.add(path_text)
        seen_modules.add(module_name)
        sources.append(LeanSource(relative, byte_count, source_sha256, module_name))
        source_texts.append(source_text)

    module_positions = {source.module_name: index for index, source in enumerate(sources)}
    for index, source_text in enumerate(source_texts):
        for imported in _parse_internal_imports(source_text):
            imported_index = module_positions.get(imported)
            if imported_index is not None and imported_index >= index:
                raise CompactReplayCompileError(
                    "manifest Lean sources are not in dependency order: "
                    f"{sources[index].path_text} imports {imported}"
                )
    epistemic_status = manifest.get("epistemic_status")
    if epistemic_status is not None and not isinstance(epistemic_status, str):
        raise CompactReplayCompileError("package manifest epistemic_status is not a string")
    return PackageSpec(
        package_dir=package_dir,
        manifest_sha256=_sha256_bytes(raw_manifest),
        package_sha256=package_sha256,
        schema=EXPECTED_PACKAGE_SCHEMA,
        epistemic_status=epistemic_status,
        sources=tuple(sources),
    )


class PidLock:
    """The stale-PID-aware O_EXCL lock protocol used by this project's lake-build wrapper."""

    def __init__(self, path: Path) -> None:
        self.path = path
        self._payload: bytes | None = None

    @staticmethod
    def _pid_is_alive(pid: int) -> bool:
        if pid <= 0:
            return False
        try:
            os.kill(pid, 0)
        except ProcessLookupError:
            return False
        except PermissionError:
            return True
        return True

    def acquire(self) -> None:
        if self.path.parent.is_symlink() or not self.path.parent.is_dir():
            raise CompactReplayCompileError(f"lock parent is unsafe: {self.path.parent}")
        payload = f"{os.getpid()}\n".encode("ascii")
        while True:
            try:
                descriptor = os.open(
                    self.path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o644
                )
            except FileExistsError:
                if self.path.is_symlink() or not self.path.is_file():
                    raise CompactReplayCompileError(f"build lock is not a regular file: {self.path}")
                try:
                    stale_payload = self.path.read_text(encoding="ascii")
                except OSError as exc:
                    raise CompactReplayCompileError(f"cannot inspect build lock: {self.path}") from exc
                match = re.fullmatch(r"([0-9]+)\n", stale_payload)
                if match is not None and self._pid_is_alive(int(match.group(1))):
                    raise CompactReplayCompileError(
                        f"another Lean build is already running (pid {match.group(1)}): {self.path}"
                    )
                try:
                    self.path.unlink()
                except FileNotFoundError:
                    continue
                except OSError as exc:
                    raise CompactReplayCompileError(f"cannot clear stale build lock: {self.path}") from exc
                continue
            try:
                os.write(descriptor, payload)
                os.fsync(descriptor)
            finally:
                os.close(descriptor)
            self._payload = payload
            return

    def release(self) -> None:
        if self._payload is None:
            return
        try:
            if self.path.is_file() and not self.path.is_symlink() and self.path.read_bytes() == self._payload:
                self.path.unlink()
        finally:
            self._payload = None

    def __enter__(self) -> PidLock:
        self.acquire()
        return self

    def __exit__(self, exc_type: object, exc: object, traceback: object) -> None:
        self.release()


def _default_runner(
    command: Sequence[str], cwd: Path, env: Mapping[str, str]
) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        list(command), cwd=cwd, env=dict(env), text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
        check=False,
    )


def _command_output(result: subprocess.CompletedProcess[str]) -> str:
    return "".join(part for part in (result.stdout, result.stderr) if part)


def _run_checked(
    command: Sequence[str], *, cwd: Path, env: Mapping[str, str], runner: Runner, label: str
) -> subprocess.CompletedProcess[str]:
    result = runner(command, cwd, env)
    if result.returncode != 0:
        detail = _command_output(result).strip()
        suffix = f"\n{detail}" if detail else ""
        raise CompactReplayCompileError(f"{label} failed with exit code {result.returncode}{suffix}")
    return result


def _find_default_lean_root() -> Path:
    script_root = Path(__file__).resolve().parents[3]
    candidate = script_root / "lean"
    if candidate.is_dir():
        return candidate
    for candidate in (Path.cwd(), *Path.cwd().parents):
        if (candidate / "lakefile.toml").is_file() or (candidate / "lakefile.lean").is_file():
            return candidate
    raise CompactReplayCompileError("cannot find the project's Lean root; pass --lean-root")


def _resolve_lean_root(value: Path | None) -> Path:
    lean_root = _require_plain_directory(value or _find_default_lean_root(), label="Lean root")
    if not ((lean_root / "lakefile.toml").is_file() or (lean_root / "lakefile.lean").is_file()):
        raise CompactReplayCompileError(f"Lean root has no lakefile: {lean_root}")
    toolchain = lean_root / "lean-toolchain"
    if toolchain.is_symlink() or not toolchain.is_file():
        raise CompactReplayCompileError(f"Lean root has no non-symlink lean-toolchain: {lean_root}")
    return lean_root


def _toolchain_binding(lean_root: Path, *, runner: Runner) -> tuple[str, dict[str, str]]:
    toolchain_path = lean_root / "lean-toolchain"
    toolchain_text = toolchain_path.read_text(encoding="utf-8").strip()
    if re.search(r"(?:^|[^0-9])v?4\.27(?:\.|$)", toolchain_text) is None:
        raise CompactReplayCompileError(f"expected a Lean 4.27 toolchain, found: {toolchain_text!r}")
    lake = os.environ.get("REAL_LAKE", "lake")
    environment = dict(os.environ)
    lake_result = _run_checked([lake, "--version"], cwd=lean_root, env=environment, runner=runner, label="lake version probe")
    lean_result = _run_checked(
        [lake, "env", "lean", "--version"], cwd=lean_root, env=environment, runner=runner, label="Lean version probe"
    )
    lean_version = lean_result.stdout.strip() or lean_result.stderr.strip()
    if re.search(r"Lean \(version 4\.27(?:\.|\))", lean_version) is None:
        raise CompactReplayCompileError(f"project environment did not select Lean 4.27: {lean_version!r}")
    lakefile = lean_root / ("lakefile.toml" if (lean_root / "lakefile.toml").is_file() else "lakefile.lean")
    binding = {
        "lean_toolchain": toolchain_text,
        "lean_toolchain_sha256": _sha256_file(toolchain_path),
        "lean_version": lean_version,
        "lake_version": lake_result.stdout.strip() or lake_result.stderr.strip(),
        "lakefile_sha256": _sha256_file(lakefile),
        "lake_manifest_sha256": _sha256_file(lean_root / "lake-manifest.json")
        if (lean_root / "lake-manifest.json").is_file()
        else "",
    }
    return lake, binding


def _validate_memory_mb(value: int) -> int:
    if isinstance(value, bool) or value < 1 or value > MAX_MEMORY_MB:
        raise CompactReplayCompileError(f"memory cap must be between 1 and {MAX_MEMORY_MB} MB")
    return value


def _output_paths(output_dir: Path, source: LeanSource) -> tuple[Path, Path]:
    relative = Path(*source.relative.parts)
    return (
        output_dir / relative.with_suffix(".olean"),
        output_dir / relative.with_suffix(".ilean"),
    )


def _validate_output_location(package: PackageSpec, output_dir: Path) -> Path:
    output_dir = output_dir.absolute()
    if output_dir.exists():
        if output_dir.is_symlink() or not output_dir.is_dir():
            raise CompactReplayCompileError(f"olean output path is unsafe: {output_dir}")
        output_dir = output_dir.resolve()
    else:
        parent = output_dir.parent
        while not parent.exists():
            parent = parent.parent
        if parent.is_symlink() or not parent.is_dir():
            raise CompactReplayCompileError(f"olean output parent is unsafe: {parent}")
        output_dir = output_dir.resolve()
    if _is_relative_to(output_dir, package.package_dir) or _is_relative_to(package.package_dir, output_dir):
        raise CompactReplayCompileError("olean output directory must not overlap the package directory")
    return output_dir


def _atomic_json(path: Path, payload: dict[str, Any]) -> None:
    temporary = path.with_name(f".{path.name}.tmp")
    try:
        temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        with temporary.open("rb") as handle:
            os.fsync(handle.fileno())
        temporary.replace(path)
    except OSError as exc:
        raise CompactReplayCompileError(f"cannot atomically write {path.name}: {exc}") from exc


def _append_log(log_path: Path, event: dict[str, Any]) -> None:
    with log_path.open("a", encoding="utf-8", newline="\n") as handle:
        handle.write(json.dumps(event, separators=(",", ":"), sort_keys=True) + "\n")
        handle.flush()
        os.fsync(handle.fileno())


def _base_output_manifest(
    package: PackageSpec, *, toolchain: dict[str, str], memory_mb: int
) -> dict[str, Any]:
    return {
        "schema": OUTPUT_SCHEMA,
        "epistemic_status": (
            "BUILD PROVENANCE ONLY: OLEAN REHASHING DOES NOT ESTABLISH SOURCE "
            "SATISFACTION, AXIOM CLOSURE, OR A PRODUCTION THEOREM"
        ),
        "package": {
            "schema": package.schema,
            "manifest_sha256": package.manifest_sha256,
            "compact_replay_package_sha256": package.package_sha256,
            "source_epistemic_status": package.epistemic_status,
            "lean_sources": package.source_records,
        },
        "toolchain": toolchain,
        "options": {"memory_mb": memory_mb, "single_worker": True, "warning_as_error": True},
        "state": "IN_PROGRESS",
        "artifacts": [],
    }


def _read_output_manifest(output_dir: Path) -> dict[str, Any]:
    path = output_dir / OUTPUT_MANIFEST_NAME
    if path.is_symlink() or not path.is_file():
        raise CompactReplayCompileError(f"missing non-symlink output manifest: {path}")
    try:
        payload = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise CompactReplayCompileError(f"cannot read output manifest: {path}") from exc
    if not isinstance(payload, dict) or payload.get("schema") != OUTPUT_SCHEMA:
        raise CompactReplayCompileError("unexpected output-manifest schema")
    return payload


def _check_output_identity(
    payload: dict[str, Any], package: PackageSpec, toolchain: dict[str, str] | None = None
) -> None:
    recorded_package = payload.get("package")
    if not isinstance(recorded_package, dict):
        raise CompactReplayCompileError("output manifest lacks package provenance")
    expected_package = {
        "schema": package.schema,
        "manifest_sha256": package.manifest_sha256,
        "compact_replay_package_sha256": package.package_sha256,
        "source_epistemic_status": package.epistemic_status,
        "lean_sources": package.source_records,
    }
    if recorded_package != expected_package:
        raise CompactReplayCompileError("output manifest package provenance does not match current inputs")
    if toolchain is not None and payload.get("toolchain") != toolchain:
        raise CompactReplayCompileError("output manifest toolchain binding does not match current project")


def _artifact_record(
    source: LeanSource, output_dir: Path
) -> dict[str, Any]:
    olean, ilean = _output_paths(output_dir, source)
    for artifact in (olean, ilean):
        if artifact.is_symlink() or not artifact.is_file():
            raise CompactReplayCompileError(f"missing non-symlink compiled artifact: {artifact}")
    return {
        "source_path": source.path_text,
        "olean_path": olean.relative_to(output_dir).as_posix(),
        "olean_sha256": _sha256_file(olean),
        "ilean_path": ilean.relative_to(output_dir).as_posix(),
        "ilean_sha256": _sha256_file(ilean),
    }


def _valid_artifact_prefix(
    payload: dict[str, Any], package: PackageSpec, output_dir: Path
) -> tuple[int, list[dict[str, Any]]]:
    raw_artifacts = payload.get("artifacts")
    if not isinstance(raw_artifacts, list):
        raise CompactReplayCompileError("output manifest artifacts is not a list")
    by_source: dict[str, dict[str, Any]] = {}
    for artifact in raw_artifacts:
        if not isinstance(artifact, dict) or not isinstance(artifact.get("source_path"), str):
            raise CompactReplayCompileError("output manifest contains a malformed artifact record")
        path_text = artifact["source_path"]
        if path_text in by_source:
            raise CompactReplayCompileError(f"output manifest repeats artifact: {path_text}")
        by_source[path_text] = artifact
    prefix: list[dict[str, Any]] = []
    for source in package.sources:
        expected_paths = _output_paths(output_dir, source)
        recorded = by_source.get(source.path_text)
        if recorded is None:
            break
        try:
            actual = _artifact_record(source, output_dir)
        except CompactReplayCompileError:
            break
        if recorded != actual:
            break
        if (recorded["olean_path"], recorded["ilean_path"]) != tuple(
            path.relative_to(output_dir).as_posix() for path in expected_paths
        ):
            break
        prefix.append(recorded)
    return len(prefix), prefix


def verify_output(package: PackageSpec, output_dir: Path) -> dict[str, Any]:
    """Rehash recorded oleans and report provenance only; no soundness claim is made."""

    output_dir = _validate_output_location(package, output_dir)
    if not output_dir.exists():
        raise CompactReplayCompileError(f"olean output directory does not exist: {output_dir}")
    payload = _read_output_manifest(output_dir)
    _check_output_identity(payload, package)
    prefix, _ = _valid_artifact_prefix(payload, package, output_dir)
    if prefix != len(package.sources) or payload.get("state") != "COMPLETE":
        raise CompactReplayCompileError(
            "compiled artifact set is incomplete or has hash drift; no complete build provenance exists"
        )
    return {
        "status": "OLEAN_ARTIFACTS_REHASHED",
        "modules": len(package.sources),
        "package_manifest_sha256": package.manifest_sha256,
        "compact_replay_package_sha256": package.package_sha256,
        "epistemic_status": payload["epistemic_status"],
        "toolchain_binding": payload.get("toolchain"),
    }


def compile_package(
    package: PackageSpec,
    *,
    olean_output_dir: Path,
    lean_root: Path,
    memory_mb: int,
    resume: bool,
    runner: Runner = _default_runner,
) -> dict[str, Any]:
    """Compile the manifest order under the project lock, optionally resuming a verified prefix."""

    memory_mb = _validate_memory_mb(memory_mb)
    output_dir = _validate_output_location(package, olean_output_dir)
    if output_dir.exists() and not resume:
        raise CompactReplayCompileError(
            f"refusing to use existing olean output without --resume or --verify-only: {output_dir}"
        )
    lock = PidLock(lean_root / ".lake" / "lake-build.lock")
    with lock:
        lake, toolchain = _toolchain_binding(lean_root, runner=runner)
        if output_dir.exists():
            payload = _read_output_manifest(output_dir)
            _check_output_identity(payload, package, toolchain)
            if payload.get("options") != {
                "memory_mb": memory_mb,
                "single_worker": True,
                "warning_as_error": True,
            }:
                raise CompactReplayCompileError("output manifest compile options do not match --resume request")
            start_index, artifacts = _valid_artifact_prefix(payload, package, output_dir)
            if start_index == len(package.sources) and payload.get("state") == "COMPLETE":
                return {
                    "status": "ALREADY_COMPLETE",
                    "modules": len(package.sources),
                    "output_dir": str(output_dir),
                    "compact_replay_package_sha256": package.package_sha256,
                }
            payload["state"] = "IN_PROGRESS"
            payload["artifacts"] = artifacts
            _atomic_json(output_dir / OUTPUT_MANIFEST_NAME, payload)
            log_path = output_dir / COMPILE_LOG_NAME
            _append_log(log_path, {"event": "resume", "start_index": start_index})
        else:
            output_dir.mkdir(parents=True)
            payload = _base_output_manifest(package, toolchain=toolchain, memory_mb=memory_mb)
            _atomic_json(output_dir / OUTPUT_MANIFEST_NAME, payload)
            log_path = output_dir / COMPILE_LOG_NAME
            _append_log(log_path, {"event": "start", "source_count": len(package.sources)})
            start_index = 0

        environment = dict(os.environ)
        source_path = str(package.package_dir)
        output_path = str(output_dir)
        existing_path = environment.get("LEAN_PATH")
        environment["LEAN_PATH"] = os.pathsep.join(
            part for part in (output_path, source_path, existing_path) if part
        )
        for source in package.sources[start_index:]:
            source_file = package.package_dir.joinpath(*source.relative.parts)
            olean, ilean = _output_paths(output_dir, source)
            olean.parent.mkdir(parents=True, exist_ok=True)
            ilean.parent.mkdir(parents=True, exist_ok=True)
            _append_log(log_path, {"event": "compile", "module": source.path_text})
            command = [
                lake,
                "env",
                "lean",
                f"-M{memory_mb}",
                "-DwarningAsError=true",
                "-R",
                str(package.package_dir),
                "-o",
                str(olean),
                "-i",
                str(ilean),
                str(source_file),
            ]
            try:
                _run_checked(command, cwd=lean_root, env=environment, runner=runner, label=f"Lean compile {source.path_text}")
                artifact = _artifact_record(source, output_dir)
            except CompactReplayCompileError:
                payload["state"] = "FAILED"
                payload["failed_module"] = source.path_text
                _atomic_json(output_dir / OUTPUT_MANIFEST_NAME, payload)
                _append_log(log_path, {"event": "failed", "module": source.path_text})
                raise
            payload["artifacts"].append(artifact)
            _atomic_json(output_dir / OUTPUT_MANIFEST_NAME, payload)
            _append_log(log_path, {"event": "compiled", "module": source.path_text})
        payload["state"] = "COMPLETE"
        payload.pop("failed_module", None)
        _atomic_json(output_dir / OUTPUT_MANIFEST_NAME, payload)
        _append_log(log_path, {"event": "complete", "source_count": len(package.sources)})
    return {
        "status": "COMPILED",
        "modules": len(package.sources),
        "output_dir": str(output_dir),
        "compact_replay_package_sha256": package.package_sha256,
    }


def _memory_default() -> int:
    raw = os.environ.get("MEMORY_MB", str(DEFAULT_MEMORY_MB))
    try:
        return int(raw)
    except ValueError as exc:
        raise argparse.ArgumentTypeError("MEMORY_MB must be an integer") from exc


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--package-dir", type=Path, required=True)
    parser.add_argument("--olean-output-dir", type=Path, required=True)
    parser.add_argument("--lean-root", type=Path)
    parser.add_argument("--memory-mb", type=int, default=_memory_default())
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--resume", action="store_true", help="resume only a provenance-matching verified prefix")
    mode.add_argument("--verify-only", action="store_true", help="rehash an existing completed output; makes no soundness claim")
    args = parser.parse_args(argv)
    try:
        package = read_package_spec(args.package_dir)
        output_dir = _validate_output_location(package, args.olean_output_dir)
        if args.verify_only:
            lean_root = _resolve_lean_root(args.lean_root)
            with PidLock(lean_root / ".lake" / "lake-build.lock"):
                result = verify_output(package, output_dir)
        else:
            lean_root = _resolve_lean_root(args.lean_root)
            result = compile_package(
                package,
                olean_output_dir=output_dir,
                lean_root=lean_root,
                memory_mb=args.memory_mb,
                resume=args.resume,
            )
    except CompactReplayCompileError as exc:
        parser.exit(1, f"error: {exc}\n")
    print(json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
