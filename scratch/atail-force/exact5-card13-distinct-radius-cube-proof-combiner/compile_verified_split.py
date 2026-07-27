#!/usr/bin/env python3
"""Compile and export one split verified-BVExpr root with bounded parallelism."""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import time


CHUNK_RE = re.compile(r"Chunk(\d{3})\.lean")
HERE = Path(__file__).resolve().parent
REPO = HERE.parents[2]
ATAIL_ROOT = REPO / "scratch" / "atail-force"
if str(ATAIL_ROOT) not in sys.path:
    sys.path.insert(0, str(ATAIL_ROOT))
from lean427_runtime import (  # noqa: E402
    assert_lean427,
    lean427_environment,
    require_canonical_lean_dir,
)


def log(stage: str, **fields: object) -> None:
    print(json.dumps({"stage": stage, **fields}, sort_keys=True), flush=True)


def checked_run(command: list[str], *, cwd: Path, env: dict[str, str]) -> str:
    completed = subprocess.run(
        command, cwd=cwd, env=env, text=True, capture_output=True, check=False
    )
    if completed.returncode != 0:
        raise RuntimeError(
            f"command failed ({completed.returncode}): {' '.join(command)}\n"
            f"{completed.stdout}{completed.stderr}"
        )
    return completed.stdout + completed.stderr


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def compile_module(
    lean: str, source: Path, module_root: Path, cwd: Path, env: dict[str, str]
) -> dict[str, object]:
    started = time.monotonic()
    c_file = source.with_suffix(".c")
    olean = source.with_suffix(".olean")
    output = checked_run(
        [
            lean,
            "-M",
            "16384",
            "-DwarningAsError=true",
            "-R",
            str(module_root),
            "-c",
            str(c_file),
            "-o",
            str(olean),
            str(source),
        ],
        cwd=cwd,
        env=env,
    )
    return {
        "module": str(source.relative_to(module_root)),
        "elapsed_seconds": time.monotonic() - started,
        "c_bytes": c_file.stat().st_size,
        "olean_bytes": olean.stat().st_size,
        "compiler_output": output,
    }


def compile_c_object(
    leanc: str, c_file: Path, cwd: Path, env: dict[str, str]
) -> dict[str, object]:
    started = time.monotonic()
    object_file = c_file.with_suffix(".o")
    output = checked_run(
        [leanc, "-O3", "-c", "-o", str(object_file), str(c_file)],
        cwd=cwd,
        env=env,
    )
    return {
        "c_file": str(c_file),
        "object_file": str(object_file),
        "elapsed_seconds": time.monotonic() - started,
        "object_bytes": object_file.stat().st_size,
        "compiler_output": output,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lean-workdir", type=Path, required=True)
    parser.add_argument("--module-root", type=Path, required=True)
    parser.add_argument("--module-prefix", required=True)
    parser.add_argument("--output-cnf", type=Path, required=True)
    parser.add_argument("--output-result", type=Path, required=True)
    parser.add_argument("--workers", type=int, default=4)
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        raise SystemExit("workers must be in 1..24")

    cwd = require_canonical_lean_dir(args.lean_workdir, REPO, "--lean-workdir")
    module_root = args.module_root.resolve()
    module_dir = module_root / args.module_prefix
    base = module_dir / "Base.lean"
    coordinator = module_dir / "Coordinator.lean"
    if not base.is_file() or not coordinator.is_file():
        raise SystemExit("missing split Base.lean or Coordinator.lean")
    chunks = sorted(module_dir.glob("Chunk*.lean"))
    indices: list[int] = []
    for path in chunks:
        match = CHUNK_RE.fullmatch(path.name)
        if match is None:
            raise SystemExit(f"unexpected chunk filename: {path.name}")
        indices.append(int(match.group(1)))
    if indices != list(range(len(indices))):
        raise SystemExit("chunk numbering is not the contiguous range 0..N-1")

    lake_env = lean427_environment(cwd)
    assert_lean427(cwd, lake_env)
    lean_path = checked_run(
        ["lake", "env", "printenv", "LEAN_PATH"], cwd=cwd, env=lake_env
    ).strip().splitlines()[-1]
    lean = checked_run(
        ["lake", "env", "which", "lean"], cwd=cwd, env=lake_env
    ).strip().splitlines()[-1]
    leanc = checked_run(
        ["lake", "env", "which", "leanc"], cwd=cwd, env=lake_env
    ).strip().splitlines()[-1]
    env = lean427_environment(cwd)
    env["LEAN_PATH"] = f"{module_root}:{lean_path}"

    started = time.monotonic()
    log("compile_base_started", module=str(base.relative_to(module_root)))
    base_result = compile_module(lean, base, module_root, cwd, env)
    log(
        "compile_base_finished",
        elapsed_seconds=base_result["elapsed_seconds"],
    )
    chunk_results_by_index: dict[int, dict[str, object]] = {}
    log("compile_chunks_started", chunks=len(chunks), workers=args.workers)
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = {
            pool.submit(compile_module, lean, chunk, module_root, cwd, env): index
            for index, chunk in enumerate(chunks)
        }
        for completed, future in enumerate(
            concurrent.futures.as_completed(futures), start=1
        ):
            index = futures[future]
            chunk_results_by_index[index] = future.result()
            if completed == 1 or completed % 25 == 0 or completed == len(chunks):
                log(
                    "compile_chunks_progress",
                    completed=completed,
                    chunks=len(chunks),
                    elapsed_seconds=time.monotonic() - started,
                )
    chunk_results = [
        chunk_results_by_index[index] for index in range(len(chunks))
    ]
    log("compile_coordinator_started")
    coordinator_result = compile_module(
        lean, coordinator, module_root, cwd, env
    )
    log(
        "compile_coordinator_finished",
        elapsed_seconds=coordinator_result["elapsed_seconds"],
    )

    executable = module_root / (args.module_prefix + "-export")
    c_files = [base.with_suffix(".c")]
    c_files.extend(chunk.with_suffix(".c") for chunk in chunks)
    c_files.append(coordinator.with_suffix(".c"))
    object_results_by_index: dict[int, dict[str, object]] = {}
    log("compile_c_started", c_files=len(c_files), workers=args.workers)
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = {
            pool.submit(compile_c_object, leanc, c_file, cwd, env): index
            for index, c_file in enumerate(c_files)
        }
        for completed, future in enumerate(
            concurrent.futures.as_completed(futures), start=1
        ):
            index = futures[future]
            object_results_by_index[index] = future.result()
            if completed == 1 or completed % 25 == 0 or completed == len(c_files):
                log(
                    "compile_c_progress",
                    completed=completed,
                    c_files=len(c_files),
                    elapsed_seconds=time.monotonic() - started,
                )
    object_results = [
        object_results_by_index[index] for index in range(len(c_files))
    ]
    object_files = [Path(str(item["object_file"])) for item in object_results]
    log("link_started", object_files=len(object_files))
    checked_run(
        [leanc, "-O3", "-o", str(executable), *(str(path) for path in object_files)],
        cwd=cwd,
        env=env,
    )
    log("link_finished")
    args.output_cnf.parent.mkdir(parents=True, exist_ok=True)
    log("export_started", output=str(args.output_cnf))
    checked_run(
        [str(executable), str(args.output_cnf)], cwd=cwd, env=env
    )

    with args.output_cnf.open("rt", encoding="utf-8") as stream:
        header = stream.readline().strip().split()
        actual_clauses = sum(1 for _ in stream)
    if len(header) != 4 or header[:2] != ["p", "cnf"]:
        raise RuntimeError("generated root has invalid DIMACS header")
    variables = int(header[2])
    declared_clauses = int(header[3])
    if declared_clauses != actual_clauses:
        raise RuntimeError("generated root clause-count drift")

    result = {
        "schema": "p97-exact5-distinct-aggregate-verified-split-compile-v2",
        "epistemic_status": "LEAN_COMPILED_VERIFIED_BVLOGICALEXPR_ROOT",
        "module_root": str(module_root),
        "module_prefix": args.module_prefix,
        "workers": args.workers,
        "lean_toolchain": "leanprover/lean4:v4.27.0",
        "chunk_count": len(chunks),
        "variables": variables,
        "clauses": declared_clauses,
        "cnf_bytes": args.output_cnf.stat().st_size,
        "cnf_sha256": sha256(args.output_cnf),
        "elapsed_seconds": time.monotonic() - started,
        "base": base_result,
        "chunks_max_elapsed_seconds": max(
            (float(item["elapsed_seconds"]) for item in chunk_results), default=0.0
        ),
        "chunks_total_elapsed_seconds": sum(
            float(item["elapsed_seconds"]) for item in chunk_results
        ),
        "coordinator": coordinator_result,
        "objects_max_elapsed_seconds": max(
            (float(item["elapsed_seconds"]) for item in object_results), default=0.0
        ),
        "objects_total_elapsed_seconds": sum(
            float(item["elapsed_seconds"]) for item in object_results
        ),
    }
    args.output_result.parent.mkdir(parents=True, exist_ok=True)
    args.output_result.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    log("finished", **result)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
