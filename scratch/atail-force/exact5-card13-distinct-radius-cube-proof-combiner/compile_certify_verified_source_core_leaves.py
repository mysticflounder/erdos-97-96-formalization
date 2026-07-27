#!/usr/bin/env python3
"""Compile, solve, LRAT-normalize, and Lean-check verified source-core leaves."""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import time


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
NORMALIZE_LRAT = (
    HERE.parent / "exact5-bv-encoding-profile/normalize_lrat_for_lean.py"
)


def log(stage: str, **fields: object) -> None:
    print(json.dumps({"stage": stage, **fields}, sort_keys=True), flush=True)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def json_fingerprint(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def load_json(path: Path) -> dict[str, object]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"expected JSON object: {path}")
    return value


def checked_run(
    command: list[str],
    *,
    cwd: Path,
    env: dict[str, str],
    expected_codes: frozenset[int] = frozenset({0}),
) -> str:
    completed = subprocess.run(
        command, cwd=cwd, env=env, text=True, capture_output=True, check=False
    )
    output = completed.stdout + completed.stderr
    if completed.returncode not in expected_codes:
        raise RuntimeError(
            f"command failed ({completed.returncode}): {' '.join(command)}\n{output}"
        )
    return output


def compile_lean_module(
    lean: str,
    source: Path,
    module_roots: tuple[Path, ...],
    cwd: Path,
    env: dict[str, str],
    *,
    emit_c: bool,
) -> dict[str, object]:
    started = time.monotonic()
    command = [lean, "-M", "16384", "-DwarningAsError=true"]
    for root in module_roots:
        command.extend(["-R", str(root)])
    c_file = source.with_suffix(".c")
    if emit_c:
        command.extend(["-c", str(c_file)])
    olean = source.with_suffix(".olean")
    command.extend(["-o", str(olean), str(source)])
    output = checked_run(command, cwd=cwd, env=env)
    result: dict[str, object] = {
        "source": str(source),
        "elapsed_seconds": time.monotonic() - started,
        "olean_bytes": olean.stat().st_size,
        "compiler_output": output,
    }
    if emit_c:
        result["c_bytes"] = c_file.stat().st_size
    return result


def parse_dimacs_header(path: Path) -> tuple[int, int]:
    with path.open("rt", encoding="utf-8") as stream:
        header = stream.readline().strip().split()
        physical_clauses = sum(1 for _ in stream)
    if len(header) != 4 or header[:2] != ["p", "cnf"]:
        raise ValueError(f"invalid DIMACS header: {path}")
    variables = int(header[2])
    clauses = int(header[3])
    if clauses != physical_clauses:
        raise ValueError(f"DIMACS clause-count mismatch: {path}")
    return variables, clauses


def render_certificate(namespace: str, leaf_prefix: str, leaf: int) -> str:
    return f'''import {leaf_prefix}.Leaf{leaf:03d}

open Std.Sat

namespace {namespace}

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def leaf{leaf:03d}Lrat : String :=
  include_str "certificates/Leaf{leaf:03d}.normalized.lrat"

theorem leaf{leaf:03d}Cnf_unsat : leaf{leaf:03d}Cnf.Unsat := by
  apply Reflect.verifyCert_correct leaf{leaf:03d}Cnf leaf{leaf:03d}Lrat
  native_decide

theorem leaf{leaf:03d}Expr_unsat : leaf{leaf:03d}Expr.Unsat := by
  have hbitblast : leaf{leaf:03d}Expr.bitblast.Unsat := by
    rw [← AIG.Entrypoint.relabelNat_unsat_iff]
    exact (AIG.toCNF_equisat leaf{leaf:03d}Expr.bitblast.relabelNat).mp
      leaf{leaf:03d}Cnf_unsat
  exact BVLogicalExpr.unsat_of_bitblast leaf{leaf:03d}Expr hbitblast

#print axioms leaf{leaf:03d}Cnf_unsat
#print axioms leaf{leaf:03d}Expr_unsat

end {namespace}
'''


def certify_leaf(
    leaf_record: dict[str, object],
    *,
    lean: str,
    leanc: str,
    cadical: str,
    drat_trim: str,
    python: str,
    cwd: Path,
    env: dict[str, str],
    module_roots: tuple[Path, ...],
    leaf_root: Path,
    split_root: Path,
    leaf_prefix: str,
    source_prefix: str,
    namespace: str,
    resume: bool,
) -> dict[str, object]:
    started = time.monotonic()
    leaf = int(leaf_record["leaf"])
    module_dir = leaf_root / leaf_prefix
    certificate_dir = module_dir / "certificates"
    certificate_dir.mkdir(parents=True, exist_ok=True)
    result_path = certificate_dir / f"Leaf{leaf:03d}.result.json"
    leaf_record_sha = json_fingerprint(leaf_record)
    if resume and result_path.is_file():
        previous = load_json(result_path)
        if (
            previous.get("epistemic_status")
            != "LEAN_KERNEL_CHECKED_SOURCE_CORE_LEAF_UNSAT"
            or previous.get("leaf") != leaf
            or previous.get("leaf_record_sha256") != leaf_record_sha
        ):
            raise ValueError(f"leaf {leaf:03d} checkpoint identity mismatch")
        artifact_checks = (
            (certificate_dir / f"Leaf{leaf:03d}.cnf", "cnf_sha256"),
            (certificate_dir / f"Leaf{leaf:03d}.drat", "drat_sha256"),
            (certificate_dir / f"Leaf{leaf:03d}.core.cnf", "core_cnf_sha256"),
            (certificate_dir / f"Leaf{leaf:03d}.raw.lrat", "raw_lrat_sha256"),
            (
                certificate_dir / f"Leaf{leaf:03d}.normalized.lrat",
                "normalized_lrat_sha256",
            ),
            (module_dir / f"Cert{leaf:03d}.lean", "certificate_source_sha256"),
            (module_dir / f"Cert{leaf:03d}.olean", "certificate_olean_sha256"),
        )
        for artifact, key in artifact_checks:
            if not artifact.is_file() or sha256(artifact) != previous.get(key):
                raise ValueError(
                    f"leaf {leaf:03d} checkpoint artifact mismatch: {artifact}"
                )
        previous["reused_checkpoint"] = True
        return previous
    source = module_dir / f"Leaf{leaf:03d}.lean"
    compile_result = compile_lean_module(
        lean, source, module_roots, cwd, env, emit_c=True
    )
    c_file = source.with_suffix(".c")
    object_file = source.with_suffix(".o")
    checked_run(
        [leanc, "-O3", "-c", "-o", str(object_file), str(c_file)],
        cwd=cwd,
        env=env,
    )

    executable = module_dir / f"Leaf{leaf:03d}-export"
    source_module_dir = split_root / source_prefix
    objects = [source_module_dir / "Base.o"]
    required_chunks = leaf_record["required_chunks"]
    if not isinstance(required_chunks, list):
        raise ValueError(f"leaf {leaf:03d} required_chunks is not a list")
    objects.extend(source_module_dir / f"Chunk{int(chunk):03d}.o" for chunk in required_chunks)
    objects.extend([module_dir / "LeafBase.o", object_file])
    missing_objects = [str(path) for path in objects if not path.is_file()]
    if missing_objects:
        raise FileNotFoundError(
            f"leaf {leaf:03d} is missing compiled dependency objects: {missing_objects[:8]}"
        )
    checked_run(
        [leanc, "-O3", "-o", str(executable), *(str(path) for path in objects)],
        cwd=cwd,
        env=env,
    )

    cnf = certificate_dir / f"Leaf{leaf:03d}.cnf"
    drat = certificate_dir / f"Leaf{leaf:03d}.drat"
    core_cnf = certificate_dir / f"Leaf{leaf:03d}.core.cnf"
    raw_lrat = certificate_dir / f"Leaf{leaf:03d}.raw.lrat"
    normalized_lrat = certificate_dir / f"Leaf{leaf:03d}.normalized.lrat"
    checked_run([str(executable), str(cnf)], cwd=cwd, env=env)
    variables, clauses = parse_dimacs_header(cnf)

    cadical_output = checked_run(
        [cadical, "--factor=false", "--no-binary", str(cnf), str(drat)],
        cwd=cwd,
        env=env,
        expected_codes=frozenset({20}),
    )
    if "s UNSATISFIABLE" not in cadical_output:
        raise RuntimeError(f"CaDiCaL did not report UNSAT for leaf {leaf:03d}")
    trim_output = checked_run(
        [drat_trim, str(cnf), str(drat), "-c", str(core_cnf), "-L", str(raw_lrat)],
        cwd=cwd,
        env=env,
    )
    if "s VERIFIED" not in trim_output:
        raise RuntimeError(f"drat-trim did not verify leaf {leaf:03d}")
    normalize_output = checked_run(
        [
            python,
            str(NORMALIZE_LRAT),
            str(raw_lrat),
            str(normalized_lrat),
            "--base-clauses",
            str(clauses),
            "--max-variable",
            str(variables),
        ],
        cwd=cwd,
        env=env,
    )

    certificate_source = module_dir / f"Cert{leaf:03d}.lean"
    certificate_source.write_text(
        render_certificate(namespace, leaf_prefix, leaf), encoding="utf-8"
    )
    certificate_compile = compile_lean_module(
        lean, certificate_source, module_roots, cwd, env, emit_c=False
    )
    certificate_output = str(certificate_compile["compiler_output"])
    if "sorryAx" in certificate_output:
        raise RuntimeError(f"leaf {leaf:03d} certificate depends on sorryAx")

    result = {
        "leaf": leaf,
        "leaf_record_sha256": leaf_record_sha,
        "reused_checkpoint": False,
        "epistemic_status": "LEAN_KERNEL_CHECKED_SOURCE_CORE_LEAF_UNSAT",
        "core_size": leaf_record["core_size"],
        "cnf_variables": variables,
        "cnf_clauses": clauses,
        "cnf_bytes": cnf.stat().st_size,
        "cnf_sha256": sha256(cnf),
        "drat_bytes": drat.stat().st_size,
        "drat_sha256": sha256(drat),
        "core_cnf_bytes": core_cnf.stat().st_size,
        "core_cnf_sha256": sha256(core_cnf),
        "raw_lrat_bytes": raw_lrat.stat().st_size,
        "raw_lrat_sha256": sha256(raw_lrat),
        "normalized_lrat_bytes": normalized_lrat.stat().st_size,
        "normalized_lrat_sha256": sha256(normalized_lrat),
        "certificate_source_sha256": sha256(certificate_source),
        "certificate_olean_sha256": sha256(certificate_source.with_suffix(".olean")),
        "certificate_compiler_output": certificate_output,
        "normalize_output": normalize_output,
        "elapsed_seconds": time.monotonic() - started,
        "leaf_compile": compile_result,
    }
    temporary_result = result_path.with_suffix(".json.tmp")
    temporary_result.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    temporary_result.replace(result_path)
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lean-workdir", type=Path, required=True)
    parser.add_argument("--split-root", type=Path, required=True)
    parser.add_argument("--leaf-root", type=Path, required=True)
    parser.add_argument("--leaf-map", type=Path, required=True)
    parser.add_argument("--output-result", type=Path, required=True)
    parser.add_argument("--leaf-start", type=int, default=0)
    parser.add_argument("--leaf-count", type=int)
    parser.add_argument("--workers", type=int, default=10)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--drat-trim", default="drat-trim")
    parser.add_argument("--resume", action="store_true")
    args = parser.parse_args()
    if not 1 <= args.workers <= 12:
        raise ValueError("workers must lie in [1, 12]")

    cwd = require_canonical_lean_dir(args.lean_workdir, REPO, "--lean-workdir")
    split_root = args.split_root.resolve()
    leaf_root = args.leaf_root.resolve()
    mapping = load_json(args.leaf_map)
    leaf_prefix = str(mapping["leaf_module_prefix"])
    source_prefix = str(mapping["source_module_prefix"])
    orientation = str(mapping["orientation"])
    namespace = "Problem97.ATailExactFiveDistinctCore" + orientation.capitalize()
    all_records = mapping["leaves"]
    if not isinstance(all_records, list):
        raise ValueError("leaf map leaves is not a list")
    count = len(all_records) - args.leaf_start if args.leaf_count is None else args.leaf_count
    selected = [
        record
        for record in all_records
        if isinstance(record, dict)
        and args.leaf_start <= int(record["leaf"]) < args.leaf_start + count
    ]
    if len(selected) != count:
        raise ValueError("selected leaf interval is not present in the generated map")

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
    python = os.environ.get("PYTHON", "python3")
    env = lean427_environment(cwd)
    env["LEAN_PATH"] = f"{leaf_root}:{split_root}:{lean_path}"
    # Lean accepts one physical module root for the input source.  Imported
    # split modules are resolved through `LEAN_PATH`, not a second `-R` whose
    # containment check would reject the leaf source.
    module_roots = (leaf_root,)

    module_dir = leaf_root / leaf_prefix
    log("compile_leaf_base_started", orientation=orientation)
    leaf_base_result = compile_lean_module(
        lean, module_dir / "LeafBase.lean", module_roots, cwd, env, emit_c=True
    )
    checked_run(
        [
            leanc,
            "-O3",
            "-c",
            "-o",
            str(module_dir / "LeafBase.o"),
            str(module_dir / "LeafBase.c"),
        ],
        cwd=cwd,
        env=env,
    )
    log("compile_leaf_base_finished", elapsed_seconds=leaf_base_result["elapsed_seconds"])

    started = time.monotonic()
    results: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = {
            pool.submit(
                certify_leaf,
                record,
                lean=lean,
                leanc=leanc,
                cadical=args.cadical,
                drat_trim=args.drat_trim,
                python=python,
                cwd=cwd,
                env=env,
                module_roots=module_roots,
                leaf_root=leaf_root,
                split_root=split_root,
                leaf_prefix=leaf_prefix,
                source_prefix=source_prefix,
                namespace=namespace,
                resume=args.resume,
            ): int(record["leaf"])
            for record in selected
        }
        for completed, future in enumerate(
            concurrent.futures.as_completed(futures), start=1
        ):
            result = future.result()
            results.append(result)
            log(
                "leaf_certificate_progress",
                completed=completed,
                selected=len(selected),
                leaf=result["leaf"],
                core_size=result["core_size"],
                elapsed_seconds=time.monotonic() - started,
            )
    results.sort(key=lambda item: int(item["leaf"]))
    output = {
        "schema": "p97-exact5-distinct-verified-source-core-leaf-certificates-v1",
        "epistemic_status": (
            "ALL_SELECTED_LEAVES_KERNEL_CHECKED_UNSAT"
            if len(results) == len(selected)
            else "INCOMPLETE_LEAF_CERTIFICATE_SET"
        ),
        "orientation": orientation,
        "workers": args.workers,
        "lean_toolchain": "leanprover/lean4:v4.27.0",
        "selected_leaf_count": len(selected),
        "leaf_map_sha256": sha256(args.leaf_map),
        "elapsed_seconds": time.monotonic() - started,
        "leaf_base": leaf_base_result,
        "leaves": results,
    }
    args.output_result.parent.mkdir(parents=True, exist_ok=True)
    args.output_result.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    log("finished", **output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
