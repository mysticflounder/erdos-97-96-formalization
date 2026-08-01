#!/usr/bin/env python3
"""Compile a compact window replay package by authenticated dependency layers.

Common is compiled first; independent checkpoint modules share one parallel
layer; independent window modules share the next; shard coordinators and Compose
run only after their imported modules exist.  This records elaboration
provenance only and makes no theorem-closure or axiom-closure claim.
"""

from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
import importlib.util
import json
import os
from pathlib import Path, PurePosixPath
import subprocess
import sys
from typing import Any, Callable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
P5_COMPILER = (
    REPO
    / "scratch/atail-force/unique4-exact-two-lrat-ingress"
    / "compile_compact_windowed_rup_replay.py"
)
OUTPUT_SCHEMA = "p97-windowed-rup-layered-compiled-artifacts-v1"
Runner = Callable[
    [Sequence[str], Path, Mapping[str, str]],
    subprocess.CompletedProcess[str],
]


def _load_base():
    spec = importlib.util.spec_from_file_location("p5_compact_compiler", P5_COMPILER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load inherited compiler: {P5_COMPILER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


base = _load_base()
CompileError = base.CompactReplayCompileError


def dependency_graph(package: Any) -> dict[str, set[str]]:
    modules = {source.module_name: source for source in package.sources}
    graph: dict[str, set[str]] = {}
    for source in package.sources:
        source_path = package.package_dir.joinpath(*source.relative.parts)
        text = source_path.read_text(encoding="utf-8")
        graph[source.module_name] = {
            imported
            for imported in base._parse_internal_imports(text)
            if imported in modules
        }
    return graph


def dependency_layers(package: Any) -> list[list[Any]]:
    graph = dependency_graph(package)
    by_name = {source.module_name: source for source in package.sources}
    position = {
        source.module_name: index for index, source in enumerate(package.sources)
    }
    remaining = set(graph)
    done: set[str] = set()
    layers: list[list[Any]] = []
    while remaining:
        ready = sorted(
            (name for name in remaining if graph[name] <= done),
            key=position.__getitem__,
        )
        if not ready:
            raise CompileError("compact replay dependency graph is cyclic")
        layers.append([by_name[name] for name in ready])
        done.update(ready)
        remaining.difference_update(ready)
    validate_compact_layers(layers)
    return layers


def validate_compact_layers(layers: list[list[Any]]) -> None:
    if len(layers) != 5:
        raise CompileError(f"expected five compact replay dependency layers, got {len(layers)}")
    names = [[source.module_name for source in layer] for layer in layers]
    if names[0] != ["CompactWindowedRupReplay.Common"]:
        raise CompileError("layer 0 must be the singleton Common module")
    if not names[1] or any(".Checkpoint.C" not in name for name in names[1]):
        raise CompileError("layer 1 must contain only checkpoint modules")
    if not names[2] or any(
        not (name.startswith("CompactWindowedRupReplay.Shard") and ".W" in name)
        for name in names[2]
    ):
        raise CompileError("layer 2 must contain only window modules")
    if set(names[3]) != {
        "CompactWindowedRupReplay.Shard1",
        "CompactWindowedRupReplay.Shard2",
    }:
        raise CompileError("layer 3 must contain the two shard coordinators")
    if names[4] != ["CompactWindowedRupReplay.Compose"]:
        raise CompileError("layer 4 must be the singleton Compose module")


def layer_summary(layers: list[list[Any]]) -> list[dict[str, Any]]:
    labels = ["common", "checkpoints", "windows", "shard_coordinators", "final"]
    return [
        {
            "index": index,
            "kind": labels[index],
            "module_count": len(layer),
            "modules": [source.path_text for source in layer],
        }
        for index, layer in enumerate(layers)
    ]


def dependency_closed_valid_paths(
    package: Any,
    valid_paths: set[str],
) -> set[str]:
    """Discard resumable artifacts whose internal dependency is not resumable."""

    valid = set(valid_paths)
    graph = dependency_graph(package)
    path_by_module = {
        source.module_name: source.path_text for source in package.sources
    }
    changed = True
    while changed:
        changed = False
        for source in package.sources:
            if source.path_text not in valid:
                continue
            if any(
                path_by_module[module] not in valid
                for module in graph[source.module_name]
            ):
                valid.remove(source.path_text)
                changed = True
    return valid


def _artifact_valid(
    artifact: dict[str, Any],
    source: Any,
    output_dir: Path,
) -> bool:
    if artifact.get("source_path") != source.path_text:
        return False
    expected = {
        "olean_path": PurePosixPath(source.relative).with_suffix(".olean").as_posix(),
        "ilean_path": PurePosixPath(source.relative).with_suffix(".ilean").as_posix(),
    }
    for path_key, hash_key in (
        ("olean_path", "olean_sha256"),
        ("ilean_path", "ilean_sha256"),
    ):
        if artifact.get(path_key) != expected[path_key]:
            return False
        path = output_dir.joinpath(*PurePosixPath(expected[path_key]).parts)
        if path.is_symlink() or not path.is_file():
            return False
        if base._sha256_file(path) != artifact.get(hash_key):
            return False
    return True


def _package_identity(package: Any) -> dict[str, Any]:
    return {
        "schema": package.schema,
        "manifest_sha256": package.manifest_sha256,
        "compact_replay_package_sha256": package.package_sha256,
        "source_epistemic_status": package.epistemic_status,
        "lean_sources": package.source_records,
    }


def _write_manifest(path: Path, payload: dict[str, Any]) -> None:
    base._atomic_json(path, payload)


def _initial_manifest(
    package: Any,
    toolchain: dict[str, str],
    *,
    jobs: int,
    memory_mb_per_worker: int,
    layers: list[list[Any]],
) -> dict[str, Any]:
    return {
        "schema": OUTPUT_SCHEMA,
        "epistemic_status": (
            "BUILD PROVENANCE ONLY: PARALLEL OLEAN ELABORATION DOES NOT "
            "ESTABLISH SOURCE SATISFACTION, AXIOM CLOSURE, OR A PRODUCTION THEOREM"
        ),
        "package": _package_identity(package),
        "toolchain": toolchain,
        "options": {
            "jobs": jobs,
            "memory_mb_per_worker": memory_mb_per_worker,
            "warning_as_error": True,
            "scheduler": "dependency_layers",
            "single_worker": jobs == 1,
        },
        "layers": layer_summary(layers),
        "state": "IN_PROGRESS",
        "artifacts": [],
    }


def _read_manifest(path: Path) -> dict[str, Any]:
    try:
        payload = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise CompileError(f"cannot read layered output manifest: {path}") from exc
    if not isinstance(payload, dict) or payload.get("schema") != OUTPUT_SCHEMA:
        raise CompileError("unexpected layered output manifest schema")
    return payload


def _run_source(
    source: Any,
    package: Any,
    output_dir: Path,
    lean_root: Path,
    lake: str,
    memory_mb: int,
    environment: Mapping[str, str],
    runner: Runner,
) -> dict[str, Any]:
    source_file = package.package_dir.joinpath(*source.relative.parts)
    olean, ilean = base._output_paths(output_dir, source)
    olean.parent.mkdir(parents=True, exist_ok=True)
    ilean.parent.mkdir(parents=True, exist_ok=True)
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
    base._run_checked(
        command,
        cwd=lean_root,
        env=environment,
        runner=runner,
        label=f"Lean compile {source.path_text}",
    )
    return base._artifact_record(source, output_dir)


def compile_layered(
    package: Any,
    *,
    output_dir: Path,
    lean_root: Path,
    jobs: int,
    memory_mb_per_worker: int,
    resume: bool,
    runner: Runner = base._default_runner,
) -> dict[str, Any]:
    if jobs < 1:
        raise CompileError("--jobs must be positive")
    memory_mb_per_worker = base._validate_memory_mb(memory_mb_per_worker)
    output_dir = base._validate_output_location(package, output_dir)
    layers = dependency_layers(package)
    if output_dir.exists() and not resume:
        raise CompileError("refusing existing layered output without --resume")

    with base.PidLock(lean_root / ".lake" / "lake-build.lock"):
        lake, toolchain = base._toolchain_binding(lean_root, runner=runner)
        options = {
            "jobs": jobs,
            "memory_mb_per_worker": memory_mb_per_worker,
            "warning_as_error": True,
            "scheduler": "dependency_layers",
            "single_worker": jobs == 1,
        }
        manifest_path = output_dir / base.OUTPUT_MANIFEST_NAME
        log_path = output_dir / base.COMPILE_LOG_NAME
        valid: dict[str, dict[str, Any]] = {}
        if output_dir.exists():
            payload = _read_manifest(manifest_path)
            if payload.get("package") != _package_identity(package):
                raise CompileError("layered output package provenance drift")
            if payload.get("toolchain") != toolchain:
                raise CompileError("layered output toolchain drift")
            if payload.get("options") != options:
                raise CompileError("layered output compile-option drift")
            if payload.get("layers") != layer_summary(layers):
                raise CompileError("layered output dependency-layer drift")
            raw_artifacts = payload.get("artifacts")
            if not isinstance(raw_artifacts, list):
                raise CompileError("layered output artifacts are malformed")
            by_path = {
                item.get("source_path"): item
                for item in raw_artifacts
                if isinstance(item, dict) and isinstance(item.get("source_path"), str)
            }
            for source in package.sources:
                artifact = by_path.get(source.path_text)
                if artifact is not None and _artifact_valid(artifact, source, output_dir):
                    valid[source.path_text] = artifact
            # An artifact is resumable only when every internal dependency is
            # also resumable.  Otherwise keeping the dependent could preserve
            # an olean elaborated against a dependency that is about to change.
            closed = dependency_closed_valid_paths(package, set(valid))
            valid = {path: artifact for path, artifact in valid.items() if path in closed}
            payload["state"] = "IN_PROGRESS"
            payload["artifacts"] = [
                valid[source.path_text]
                for source in package.sources
                if source.path_text in valid
            ]
            _write_manifest(manifest_path, payload)
            base._append_log(log_path, {"event": "resume", "valid_modules": len(valid)})
        else:
            output_dir.mkdir(parents=True)
            payload = _initial_manifest(
                package,
                toolchain,
                jobs=jobs,
                memory_mb_per_worker=memory_mb_per_worker,
                layers=layers,
            )
            _write_manifest(manifest_path, payload)
            base._append_log(log_path, {"event": "start", "source_count": len(package.sources)})

        environment = dict(os.environ)
        environment["LEAN_PATH"] = os.pathsep.join(
            part
            for part in (
                str(output_dir),
                str(package.package_dir),
                environment.get("LEAN_PATH"),
            )
            if part
        )
        for layer_index, layer in enumerate(layers):
            pending = [
                source for source in layer if source.path_text not in valid
            ]
            if not pending:
                continue
            base._append_log(
                log_path,
                {"event": "layer_start", "layer": layer_index, "modules": len(pending)},
            )
            failures: list[str] = []
            completed: dict[str, dict[str, Any]] = {}
            with ThreadPoolExecutor(max_workers=min(jobs, len(pending))) as pool:
                futures = {
                    pool.submit(
                        _run_source,
                        source,
                        package,
                        output_dir,
                        lean_root,
                        lake,
                        memory_mb_per_worker,
                        environment,
                        runner,
                    ): source
                    for source in pending
                }
                for future in as_completed(futures):
                    source = futures[future]
                    try:
                        completed[source.path_text] = future.result()
                    except BaseException as exc:
                        failures.append(f"{source.path_text}: {exc}")
            valid.update(completed)
            payload["artifacts"] = [
                valid[source.path_text]
                for source in package.sources
                if source.path_text in valid
            ]
            if failures:
                payload["state"] = "FAILED"
                payload["failed_layer"] = layer_index
                payload["failures"] = failures
                _write_manifest(manifest_path, payload)
                base._append_log(
                    log_path,
                    {"event": "layer_failed", "layer": layer_index, "failures": failures},
                )
                raise CompileError("; ".join(failures))
            _write_manifest(manifest_path, payload)
            base._append_log(
                log_path,
                {"event": "layer_complete", "layer": layer_index, "modules": len(completed)},
            )
        payload["state"] = "COMPLETE"
        payload.pop("failed_layer", None)
        payload.pop("failures", None)
        _write_manifest(manifest_path, payload)
        base._append_log(log_path, {"event": "complete", "source_count": len(package.sources)})
    return {
        "status": "COMPILED_BY_DEPENDENCY_LAYERS",
        "modules": len(package.sources),
        "jobs": jobs,
        "output_dir": str(output_dir),
        "compact_replay_package_sha256": package.package_sha256,
    }


def dry_run(package: Any, jobs: int) -> dict[str, Any]:
    if jobs < 1:
        raise CompileError("--jobs must be positive")
    layers = dependency_layers(package)
    return {
        "status": "DRY_RUN_NO_LEAN_EXECUTED",
        "package_dir": str(package.package_dir),
        "compact_replay_package_sha256": package.package_sha256,
        "jobs": jobs,
        "layers": layer_summary(layers),
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--package-dir", type=Path, required=True)
    parser.add_argument("--olean-output-dir", type=Path)
    parser.add_argument("--lean-root", type=Path)
    parser.add_argument("--jobs", type=int, default=4)
    parser.add_argument("--memory-mb-per-worker", type=int, default=4096)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args(argv)
    try:
        package = base.read_package_spec(args.package_dir)
        if args.dry_run:
            if args.olean_output_dir is not None or args.resume:
                raise CompileError("--dry-run cannot be combined with output/resume")
            result = dry_run(package, args.jobs)
        else:
            if args.olean_output_dir is None:
                raise CompileError("compilation requires --olean-output-dir")
            lean_root = base._resolve_lean_root(args.lean_root)
            result = compile_layered(
                package,
                output_dir=args.olean_output_dir,
                lean_root=lean_root,
                jobs=args.jobs,
                memory_mb_per_worker=args.memory_mb_per_worker,
                resume=args.resume,
            )
    except (CompileError, OSError, ValueError, TypeError) as exc:
        parser.exit(1, f"error: {exc}\n")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
