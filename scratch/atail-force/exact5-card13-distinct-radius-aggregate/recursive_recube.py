#!/usr/bin/env python3
"""Recube exactly the unresolved parent cubes by one bounded refinement level.

Each child is solved against an explicit CNF containing both its parent and
child assumptions.  SAT witnesses are extended through the recorded CaDiCaL
extension stack and checked against the original CNF.  An UNSAT child counts
as resolved only after drat-trim verifies its proof.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import json
import re
import subprocess
import tempfile
import time
from pathlib import Path

import preprocessed_cube_probe as pipeline
import run_solver


HERE = Path(__file__).resolve().parent
ORIENTATIONS = ("direct", "mirror")
CONFIGS: tuple[tuple[str, tuple[str, ...]], ...] = (
    ("default", ("--default",)),
    ("sat", ("--sat",)),
    ("unsat", ("--unsat",)),
    ("phase_false", ("--default", "--phase=false")),
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_cnf(path: Path) -> tuple[int, int, str]:
    declared_variables = None
    declared_clauses = None
    actual_clauses = 0
    body: list[str] = []
    with path.open(encoding="utf-8") as stream:
        for line in stream:
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            if stripped.startswith("p "):
                fields = stripped.split()
                if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    raise AssertionError(f"bad CNF header: {stripped!r}")
                if declared_variables is not None:
                    raise AssertionError("multiple CNF headers")
                declared_variables = int(fields[2])
                declared_clauses = int(fields[3])
                continue
            actual_clauses += 1
            body.append(line if line.endswith("\n") else line + "\n")
    if declared_variables is None or declared_clauses is None:
        raise AssertionError("missing CNF header")
    if actual_clauses != declared_clauses:
        raise AssertionError(
            f"CNF clause mismatch: {actual_clauses} != {declared_clauses}"
        )
    return declared_variables, declared_clauses, "".join(body)


def write_assumption_cnf(
    path: Path,
    variables: int,
    base_clauses: int,
    base_body: str,
    assumptions: tuple[int, ...],
) -> None:
    if any(not literal or abs(literal) > variables for literal in assumptions):
        raise AssertionError("assumption outside simplified CNF variable range")
    signs: dict[int, bool] = {}
    for literal in assumptions:
        variable = abs(literal)
        sign = literal > 0
        if variable in signs and signs[variable] != sign:
            raise AssertionError("contradictory assumptions")
        signs[variable] = sign
    with path.open("w", encoding="utf-8") as output:
        output.write(f"p cnf {variables} {base_clauses + len(assumptions)}\n")
        output.write(base_body)
        for literal in assumptions:
            output.write(f"{literal} 0\n")


def parse_icnf(path: Path) -> tuple[int, list[tuple[int, ...]]]:
    header_seen = False
    base_clauses = 0
    cubes: list[tuple[int, ...]] = []
    with path.open(encoding="utf-8") as stream:
        for line_number, line in enumerate(stream, start=1):
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            if stripped.startswith("p "):
                if stripped != "p inccnf" or header_seen:
                    raise AssertionError(f"bad ICNF header on line {line_number}")
                header_seen = True
                continue
            fields = stripped.split()
            if fields[-1] != "0":
                raise AssertionError(f"unterminated ICNF line {line_number}")
            if fields[0] == "a":
                cubes.append(tuple(int(value) for value in fields[1:-1]))
            else:
                base_clauses += 1
    if not header_seen or not cubes:
        raise AssertionError("incomplete ICNF partition")
    return base_clauses, cubes


def parse_count(output: str, label: str) -> int | None:
    match = re.search(rf"^c {re.escape(label)}:\s+(\d+)", output, re.MULTILINE)
    return int(match.group(1)) if match else None


def recube_parent(
    parent: dict[str, object],
    variables: int,
    base_clauses: int,
    base_body: str,
    output_root: Path,
    child_depth: int,
    child_limit: int,
    timeout_seconds: int,
) -> dict[str, object]:
    orientation = str(parent["orientation"])
    parent_index = int(parent["cube_index"])
    parent_cube = tuple(int(value) for value in parent["cube"])
    cell = output_root / orientation / f"parent-{parent_index:03d}" / "recube"
    cell.mkdir(parents=True, exist_ok=True)
    log = cell / "march.log"
    parent_cnf: Path | None = None
    icnf: Path | None = None
    started = time.monotonic()
    try:
        parent_handle = tempfile.NamedTemporaryFile(
            prefix=f"p97-exact5-{orientation}-parent-{parent_index:03d}-",
            suffix=".cnf", dir="/tmp", delete=False,
        )
        parent_handle.close()
        parent_cnf = Path(parent_handle.name)
        write_assumption_cnf(
            parent_cnf, variables, base_clauses, base_body, parent_cube
        )
        icnf_handle = tempfile.NamedTemporaryFile(
            prefix=f"p97-exact5-{orientation}-children-{parent_index:03d}-",
            suffix=".icnf", dir="/tmp", delete=False,
        )
        icnf_handle.close()
        icnf = Path(icnf_handle.name)
        command = [
            "march_cu", str(parent_cnf), "-q", "-d", str(child_depth),
            "-l", str(child_limit),
        ]
        try:
            with icnf.open("w", encoding="utf-8") as output:
                completed = subprocess.run(
                    command,
                    stdout=output,
                    stderr=subprocess.PIPE,
                    text=True,
                    check=False,
                    timeout=timeout_seconds,
                )
            stderr = completed.stderr or ""
            returncode = completed.returncode
            timed_out = False
        except subprocess.TimeoutExpired as error:
            stderr = error.stderr.decode() if isinstance(error.stderr, bytes) else error.stderr
            returncode = None
            timed_out = True
        log.write_text(stderr or "", encoding="utf-8")
        child_cubes: list[tuple[int, ...]] = []
        partition_hash = None
        partition_size = None
        icnf_base_clauses = None
        status = "UNKNOWN"
        if not timed_out and returncode == 0 and icnf.exists():
            icnf_base_clauses, child_cubes = parse_icnf(icnf)
            if not 1 <= len(child_cubes) <= child_limit:
                raise AssertionError("child cube limit violated")
            expected_base = base_clauses + len(parent_cube)
            if icnf_base_clauses != expected_base:
                raise AssertionError(
                    f"ICNF base has {icnf_base_clauses} clauses, expected {expected_base}"
                )
            partition_hash = sha256(icnf)
            partition_size = icnf.stat().st_size
            status = "PARTITIONED"
        result = {
            "schema": "p97-exact5-card13-distinct-recube-parent-v1",
            "epistemic_status": "EXTERNAL_MARCH_PARTITION_ONLY",
            "orientation": orientation,
            "parent_cube_index": parent_index,
            "parent_cube": list(parent_cube),
            "parent_cube_width": len(parent_cube),
            "parent_first_pass_status": parent["status"],
            "parent_first_pass_conflicts": parent["conflicts"],
            "status": status,
            "child_depth": child_depth,
            "child_limit": child_limit,
            "child_cube_count": len(child_cubes),
            "child_cubes": [list(cube) for cube in child_cubes],
            "returncode": returncode,
            "timed_out": timed_out,
            "timeout_seconds": timeout_seconds,
            "elapsed_seconds": time.monotonic() - started,
            "parent_cnf_sha256": sha256(parent_cnf),
            "partition_icnf_sha256": partition_hash,
            "partition_icnf_size_bytes": partition_size,
            "partition_base_clause_count": icnf_base_clauses,
            "log_path": str(log),
            "log_sha256": sha256(log),
        }
        (cell / "result.json").write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        return result
    finally:
        if parent_cnf is not None:
            parent_cnf.unlink(missing_ok=True)
        if icnf is not None:
            icnf.unlink(missing_ok=True)


def compress_proof(proof: Path) -> Path:
    compressed = proof.with_suffix(proof.suffix + ".gz")
    with proof.open("rb") as source, gzip.open(compressed, "wb", compresslevel=6) as target:
        while chunk := source.read(1024 * 1024):
            target.write(chunk)
    proof.unlink()
    return compressed


def solve_child(
    partition: dict[str, object],
    child_index: int,
    child_cube: tuple[int, ...],
    variables: int,
    base_clauses: int,
    base_body: str,
    simplified_cnf: Path,
    original_cnf: Path,
    extension: Path,
    output_root: Path,
    timeout_seconds: int,
    proof_timeout_seconds: int,
) -> dict[str, object]:
    orientation = str(partition["orientation"])
    parent_index = int(partition["parent_cube_index"])
    parent_cube = tuple(int(value) for value in partition["parent_cube"])
    assumptions = parent_cube + child_cube
    config_name, config = CONFIGS[
        (parent_index + child_index + (1 if orientation == "mirror" else 0))
        % len(CONFIGS)
    ]
    seed = 2000 + parent_index * 16 + child_index + (2000 if orientation == "mirror" else 0)
    cell = (
        output_root / orientation / f"parent-{parent_index:03d}"
        / f"child-{child_index:02d}"
    )
    cell.mkdir(parents=True, exist_ok=True)
    log = cell / "cadical.log"
    drat_log = cell / "drat-trim.log"
    model = cell / "simplified.model"
    proof = cell / "proof.drat"
    child_cnf: Path | None = None
    started = time.monotonic()
    try:
        child_handle = tempfile.NamedTemporaryFile(
            prefix=(
                f"p97-exact5-{orientation}-parent-{parent_index:03d}-"
                f"child-{child_index:02d}-"
            ),
            suffix=".cnf", dir="/tmp", delete=False,
        )
        child_handle.close()
        child_cnf = Path(child_handle.name)
        write_assumption_cnf(
            child_cnf, variables, base_clauses, base_body, assumptions
        )
        child_cnf_hash = sha256(child_cnf)
        command = [
            "cadical", *config, f"--seed={seed}",
            "-t", str(timeout_seconds), "-w", str(model),
            str(child_cnf), str(proof),
        ]
        try:
            completed = subprocess.run(
                command,
                text=True,
                capture_output=True,
                check=False,
                timeout=timeout_seconds + 15,
            )
            output = completed.stdout + completed.stderr
            returncode = completed.returncode
            timed_out = False
        except subprocess.TimeoutExpired as error:
            stdout = error.stdout.decode() if isinstance(error.stdout, bytes) else error.stdout
            stderr = error.stderr.decode() if isinstance(error.stderr, bytes) else error.stderr
            output = (stdout or "") + (stderr or "")
            returncode = None
            timed_out = True
        log.write_text(output, encoding="utf-8")
        solver_status = "UNKNOWN" if timed_out else {
            10: "SAT", 20: "UNSAT"
        }.get(returncode, "UNKNOWN")
        final_status = "UNKNOWN"
        simplified_check = None
        original_check = None
        proof_check = None
        proof_artifact = None
        if solver_status == "SAT":
            if model.exists():
                ok, detail = run_solver.verify_model(
                    child_cnf, model.read_text(encoding="utf-8")
                )
                simplified_check = {
                    "status": "PASS" if ok else "FAIL", "detail": detail
                }
                if ok:
                    original_check = pipeline.extend_and_verify(
                        model, extension, original_cnf, cell
                    )
                    if original_check["status"] == "PASS":
                        final_status = "SAT"
            else:
                simplified_check = {"status": "FAIL", "detail": "missing witness"}
        elif solver_status == "UNSAT":
            try:
                replay = subprocess.run(
                    ["drat-trim", str(child_cnf), str(proof)],
                    text=True,
                    capture_output=True,
                    check=False,
                    timeout=proof_timeout_seconds,
                )
                replay_output = replay.stdout + replay.stderr
                drat_log.write_text(replay_output, encoding="utf-8")
                verified = replay.returncode == 0 and "s VERIFIED" in replay.stdout
                proof_check = {
                    "status": "PASS" if verified else "FAIL",
                    "returncode": replay.returncode,
                    "timed_out": False,
                    "log_path": str(drat_log),
                    "log_sha256": sha256(drat_log),
                }
            except subprocess.TimeoutExpired as error:
                stdout = error.stdout.decode() if isinstance(error.stdout, bytes) else error.stdout
                stderr = error.stderr.decode() if isinstance(error.stderr, bytes) else error.stderr
                drat_log.write_text((stdout or "") + (stderr or ""), encoding="utf-8")
                verified = False
                proof_check = {
                    "status": "FAIL",
                    "returncode": None,
                    "timed_out": True,
                    "log_path": str(drat_log),
                    "log_sha256": sha256(drat_log),
                }
            if verified:
                compressed = compress_proof(proof)
                proof_artifact = {
                    "path": str(compressed),
                    "sha256": sha256(compressed),
                    "size_bytes": compressed.stat().st_size,
                    "format": "gzip-compressed CaDiCaL DRAT",
                }
                final_status = "UNSAT"
        if final_status != "UNSAT" and proof.exists():
            proof.unlink()
        result = {
            "schema": "p97-exact5-card13-distinct-recube-child-v1",
            "epistemic_status": "EXTERNAL_EXACT_CHILD_CNF_VERDICT",
            "orientation": orientation,
            "parent_cube_index": parent_index,
            "parent_cube": list(parent_cube),
            "child_cube_index": child_index,
            "child_cube": list(child_cube),
            "combined_assumptions": list(assumptions),
            "config": config_name,
            "config_args": list(config),
            "seed": seed,
            "solver_status": solver_status,
            "status": final_status,
            "returncode": returncode,
            "timed_out": timed_out,
            "timeout_seconds": timeout_seconds,
            "elapsed_seconds": time.monotonic() - started,
            "conflicts": parse_count(output, "conflicts"),
            "decisions": parse_count(output, "decisions"),
            "child_cnf_sha256": child_cnf_hash,
            "model_check_against_child_cnf": simplified_check,
            "extended_model_check_against_original_cnf": original_check,
            "drat_check": proof_check,
            "proof_artifact": proof_artifact,
            "log_path": str(log),
            "log_sha256": sha256(log),
        }
        (cell / "result.json").write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        return result
    finally:
        if child_cnf is not None:
            child_cnf.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--pipeline-dir", type=Path,
        default=HERE / "artifacts/preprocessed-cube-probe",
    )
    parser.add_argument(
        "--parent-results", type=Path,
        default=HERE / "artifacts/per-cube-probe/summary.json",
    )
    parser.add_argument("--cnf-dir", type=Path, default=HERE / "artifacts")
    parser.add_argument(
        "--output-dir", type=Path,
        default=HERE / "artifacts/recursive-recubing",
    )
    parser.add_argument("--child-depth", type=int, default=3)
    parser.add_argument("--child-limit", type=int, default=8)
    parser.add_argument("--recube-timeout-seconds", type=int, default=60)
    parser.add_argument("--solve-timeout-seconds", type=int, default=15)
    parser.add_argument("--proof-timeout-seconds", type=int, default=120)
    parser.add_argument("--workers", type=int, default=8)
    args = parser.parse_args()
    if not 1 <= args.workers <= 8:
        raise SystemExit("workers must be in 1..8")
    if not 1 <= args.child_limit <= 64:
        raise SystemExit("child limit must be in 1..64")
    args.output_dir.mkdir(parents=True, exist_ok=True)

    pipeline_summary = json.loads(
        (args.pipeline_dir / "summary.json").read_text(encoding="utf-8")
    )
    first_pass = json.loads(args.parent_results.read_text(encoding="utf-8"))
    parents = [item for item in first_pass["results"] if item["status"] == "UNKNOWN"]
    parents.sort(key=lambda item: (
        ORIENTATIONS.index(str(item["orientation"])), int(item["cube_index"])
    ))
    if len(parents) != 73:
        raise AssertionError(f"expected 73 UNKNOWN parents, found {len(parents)}")

    inputs: dict[str, dict[str, object]] = {}
    cnf_data: dict[str, tuple[int, int, str]] = {}
    for orientation in ORIENTATIONS:
        preprocessing = pipeline_summary["preprocessing"][orientation]
        simplified = Path(preprocessing["simplified_cnf_path"])
        original = args.cnf_dir / f"{orientation}.cnf"
        extension = Path(preprocessing["extension_path"])
        if sha256(simplified) != preprocessing["simplified_cnf_inspection"]["sha256"]:
            raise AssertionError(f"{orientation} simplified CNF hash drift")
        if sha256(original) != preprocessing["original_cnf_inspection"]["sha256"]:
            raise AssertionError(f"{orientation} original CNF hash drift")
        if sha256(extension) != preprocessing["extension_sha256"]:
            raise AssertionError(f"{orientation} extension stack hash drift")
        cnf_data[orientation] = load_cnf(simplified)
        inputs[orientation] = {
            "original_cnf_path": str(original),
            "original_cnf_sha256": sha256(original),
            "simplified_cnf_path": str(simplified),
            "simplified_cnf_sha256": sha256(simplified),
            "extension_path": str(extension),
            "extension_sha256": sha256(extension),
            "parent_partition_icnf_sha256": (
                pipeline_summary["cubing"][orientation]["inspection"]["sha256"]
            ),
        }

    partitions: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = []
        for parent in parents:
            orientation = str(parent["orientation"])
            variables, clauses, body = cnf_data[orientation]
            futures.append(pool.submit(
                recube_parent, parent, variables, clauses, body,
                args.output_dir, args.child_depth, args.child_limit,
                args.recube_timeout_seconds,
            ))
        for count, future in enumerate(concurrent.futures.as_completed(futures), start=1):
            result = future.result()
            partitions.append(result)
            print(
                f"recube [{count}/{len(parents)}] {result['orientation']} "
                f"parent {result['parent_cube_index']:03d}: {result['status']} "
                f"children={result['child_cube_count']}",
                flush=True,
            )
    partitions.sort(key=lambda item: (
        ORIENTATIONS.index(str(item["orientation"])), int(item["parent_cube_index"])
    ))

    child_jobs: list[tuple[object, ...]] = []
    for partition in partitions:
        if partition["status"] != "PARTITIONED":
            continue
        orientation = str(partition["orientation"])
        variables, clauses, body = cnf_data[orientation]
        preprocessing = pipeline_summary["preprocessing"][orientation]
        simplified = Path(preprocessing["simplified_cnf_path"])
        original = args.cnf_dir / f"{orientation}.cnf"
        extension = Path(preprocessing["extension_path"])
        for child_index, raw_cube in enumerate(partition["child_cubes"]):
            child_jobs.append((
                partition, child_index, tuple(int(value) for value in raw_cube),
                variables, clauses, body, simplified, original, extension,
                args.output_dir, args.solve_timeout_seconds,
                args.proof_timeout_seconds,
            ))

    child_results: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(solve_child, *job) for job in child_jobs]
        for count, future in enumerate(concurrent.futures.as_completed(futures), start=1):
            result = future.result()
            child_results.append(result)
            print(
                f"solve [{count}/{len(child_jobs)}] {result['orientation']} "
                f"parent {result['parent_cube_index']:03d}/"
                f"child {result['child_cube_index']:02d}: {result['status']} "
                f"solver={result['solver_status']} conflicts={result['conflicts']}",
                flush=True,
            )
    child_results.sort(key=lambda item: (
        ORIENTATIONS.index(str(item["orientation"])),
        int(item["parent_cube_index"]), int(item["child_cube_index"]),
    ))

    subtree_results: list[dict[str, object]] = []
    for partition in partitions:
        orientation = str(partition["orientation"])
        parent_index = int(partition["parent_cube_index"])
        children = [
            item for item in child_results
            if item["orientation"] == orientation
            and item["parent_cube_index"] == parent_index
        ]
        if partition["status"] != "PARTITIONED":
            status = "UNKNOWN"
        elif any(item["status"] == "SAT" for item in children):
            status = "SAT"
        elif len(children) == partition["child_cube_count"] and all(
            item["status"] == "UNSAT" for item in children
        ):
            status = "UNSAT_CHILDREN_DRAT_VERIFIED"
        else:
            status = "UNKNOWN"
        subtree_results.append({
            "orientation": orientation,
            "parent_cube_index": parent_index,
            "parent_cube": partition["parent_cube"],
            "partition_status": partition["status"],
            "child_count": len(children),
            "child_status_counts": {
                child_status: sum(item["status"] == child_status for item in children)
                for child_status in ("SAT", "UNSAT", "UNKNOWN")
            },
            "status": status,
        })
    status_counts = {
        orientation: {
            status: sum(
                item["orientation"] == orientation and item["status"] == status
                for item in subtree_results
            )
            for status in ("SAT", "UNSAT_CHILDREN_DRAT_VERIFIED", "UNKNOWN")
        }
        for orientation in ORIENTATIONS
    }
    summary = {
        "schema": "p97-exact5-card13-distinct-recursive-recubing-v1",
        "epistemic_status": "EXTERNAL_ONE_LEVEL_REFINEMENT_ONLY",
        "scope": "exactly the 73 UNKNOWN parents from the 64-cube first pass",
        "workers": args.workers,
        "child_depth": args.child_depth,
        "child_limit": args.child_limit,
        "recube_timeout_seconds": args.recube_timeout_seconds,
        "solve_timeout_seconds_per_child": args.solve_timeout_seconds,
        "proof_timeout_seconds": args.proof_timeout_seconds,
        "inputs": inputs,
        "partition_count": len(partitions),
        "partition_status_counts": {
            status: sum(item["status"] == status for item in partitions)
            for status in ("PARTITIONED", "UNKNOWN")
        },
        "child_count": len(child_results),
        "child_status_counts": {
            status: sum(item["status"] == status for item in child_results)
            for status in ("SAT", "UNSAT", "UNKNOWN")
        },
        "subtree_status_counts": status_counts,
        "overall_status": (
            "SAT"
            if any(item["status"] == "SAT" for item in subtree_results)
            else "UNKNOWN"
        ),
        "no_global_unsat_claim_reason": (
            "one-level refinement may leave UNKNOWN subtrees; additionally, "
            "the first-pass UNSAT parents were not rerun with proof artifacts"
        ),
        "partitions": partitions,
        "children": child_results,
        "subtrees": subtree_results,
    }
    summary_path = args.output_dir / "summary.json"
    summary_path.write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "partition_status_counts": summary["partition_status_counts"],
        "child_status_counts": summary["child_status_counts"],
        "subtree_status_counts": status_counts,
        "overall_status": summary["overall_status"],
        "summary_path": str(summary_path),
    }, indent=2, sort_keys=True))
    if any(
        item["solver_status"] in ("SAT", "UNSAT") and item["status"] == "UNKNOWN"
        for item in child_results
    ):
        print(
            "warning: at least one decisive solver verdict failed its independent check",
            flush=True,
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
