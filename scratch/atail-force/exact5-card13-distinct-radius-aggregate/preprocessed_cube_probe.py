#!/usr/bin/env python3
"""Preprocess, cube, and portfolio-solve the two exact aggregate CNFs.

The original deterministic CNFs are never modified.  CaDiCaL writes an
equisatisfiable simplified CNF plus its extension stack.  If a simplified
instance is SAT, the witness is extended and checked against the original
CNF before the result is accepted.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import re
import subprocess
import time
from pathlib import Path

import cube_probe
import run_solver


HERE = Path(__file__).resolve().parent
ORIENTATIONS = ("direct", "mirror")
EXTEND_SOLUTION = Path("/Users/adam/cadical/scripts/extend-solution.sh")
CONFIGS: dict[str, tuple[str, ...]] = {
    "default_seed20": ("--default", "--seed=20"),
    "sat_seed21": ("--sat", "--seed=21"),
    "unsat_seed22": ("--unsat", "--seed=22"),
    "phase_false_seed23": ("--default", "--phase=false", "--seed=23"),
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def inspect_cnf(path: Path) -> dict[str, object]:
    header = None
    clauses = 0
    maximum_variable = 0
    with path.open(encoding="utf-8") as stream:
        for line_number, line in enumerate(stream, start=1):
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            if stripped.startswith("p "):
                if header is not None:
                    raise AssertionError("multiple CNF headers")
                header = stripped
                continue
            values = [int(value) for value in stripped.split()]
            if not values or values[-1] != 0:
                raise AssertionError(f"unterminated clause on line {line_number}")
            clauses += 1
            maximum_variable = max(
                maximum_variable, *(abs(value) for value in values[:-1])
            )
    if header is None:
        raise AssertionError("missing CNF header")
    fields = header.split()
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise AssertionError(f"bad CNF header: {header!r}")
    declared_variables = int(fields[2])
    declared_clauses = int(fields[3])
    if clauses != declared_clauses:
        raise AssertionError(
            f"clause count mismatch: header {declared_clauses}, actual {clauses}"
        )
    if maximum_variable > declared_variables:
        raise AssertionError(
            f"variable {maximum_variable} exceeds header {declared_variables}"
        )
    return {
        "header": header,
        "declared_variables": declared_variables,
        "declared_clauses": declared_clauses,
        "maximum_variable_used": maximum_variable,
        "size_bytes": path.stat().st_size,
        "sha256": sha256(path),
    }


def parse_stat(output: str, name: str) -> int | None:
    match = re.search(rf"^c {re.escape(name)}:\s+(\d+)", output, re.MULTILINE)
    return int(match.group(1)) if match else None


def preprocess(
    orientation: str,
    original_cnf: Path,
    root: Path,
    rounds: int,
    timeout_seconds: int,
) -> dict[str, object]:
    cell = root / orientation / "preprocess"
    cell.mkdir(parents=True, exist_ok=True)
    simplified = cell / "simplified.cnf"
    extension = cell / "extension.stack"
    log = cell / "cadical.log"
    command = [
        "cadical", "--default", f"-P{rounds}", "-c", "0",
        "-t", str(timeout_seconds), "-o", str(simplified),
        "-e", str(extension), str(original_cnf),
    ]
    started = time.monotonic()
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
    status = "UNKNOWN"
    inspection = None
    if not timed_out and simplified.exists() and extension.exists():
        inspection = inspect_cnf(simplified)
        status = "PREPROCESSED"
    result: dict[str, object] = {
        "schema": "p97-exact5-card13-distinct-preprocess-cell-v1",
        "epistemic_status": "EXTERNAL_EQUI-SAT_PREPROCESSING_ONLY",
        "orientation": orientation,
        "status": status,
        "command": command,
        "returncode": returncode,
        "timed_out": timed_out,
        "timeout_seconds": timeout_seconds,
        "elapsed_seconds": time.monotonic() - started,
        "preprocess_rounds": rounds,
        "original_cnf_path": str(original_cnf),
        "original_cnf_inspection": inspect_cnf(original_cnf),
        "simplified_cnf_path": str(simplified),
        "simplified_cnf_inspection": inspection,
        "extension_path": str(extension),
        "extension_size_bytes": extension.stat().st_size if extension.exists() else None,
        "extension_sha256": sha256(extension) if extension.exists() else None,
        "log_path": str(log),
        "log_sha256": sha256(log),
    }
    (cell / "result.json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return result


def extend_and_verify(
    simplified_model: Path,
    extension: Path,
    original_cnf: Path,
    cell: Path,
) -> dict[str, object]:
    extended_model = cell / "extended-original.model"
    completed = subprocess.run(
        [str(EXTEND_SOLUTION), str(simplified_model), str(extension)],
        text=True,
        capture_output=True,
        check=False,
        timeout=60,
    )
    extended_model.write_text(completed.stdout, encoding="utf-8")
    extension_log = cell / "extend.log"
    extension_log.write_text(completed.stderr, encoding="utf-8")
    ok = False
    detail = f"extender return code {completed.returncode}"
    if completed.returncode == 10:
        ok, detail = run_solver.verify_model(original_cnf, completed.stdout)
    return {
        "status": "PASS" if ok else "FAIL",
        "detail": detail,
        "extender_returncode": completed.returncode,
        "extended_model_path": str(extended_model),
        "extended_model_sha256": sha256(extended_model),
        "extension_log_path": str(extension_log),
        "extension_log_sha256": sha256(extension_log),
    }


def solve_icnf(
    orientation: str,
    config_name: str,
    config: tuple[str, ...],
    original_cnf: Path,
    simplified_cnf: Path,
    extension: Path,
    icnf: Path,
    root: Path,
    timeout_seconds: int,
) -> dict[str, object]:
    cell = root / orientation / "solve" / config_name
    cell.mkdir(parents=True, exist_ok=True)
    log = cell / "cadical.log"
    model = cell / "simplified.model"
    command = [
        "cadical", *config, "-t", str(timeout_seconds),
        "-w", str(model), str(icnf),
    ]
    started = time.monotonic()
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
    status = "UNKNOWN" if timed_out else {10: "SAT", 20: "UNSAT"}.get(
        returncode, "UNKNOWN"
    )
    simplified_check = None
    original_check = None
    if status == "SAT":
        if not model.exists():
            simplified_check = {"status": "FAIL", "detail": "missing witness"}
        else:
            ok, detail = run_solver.verify_model(
                simplified_cnf, model.read_text(encoding="utf-8")
            )
            simplified_check = {"status": "PASS" if ok else "FAIL", "detail": detail}
            if ok:
                original_check = extend_and_verify(
                    model, extension, original_cnf, cell
                )
    result = {
        "schema": "p97-exact5-card13-distinct-preprocessed-cube-cell-v1",
        "epistemic_status": "EXTERNAL_EQUI-SAT_ICNF_PROBE_ONLY",
        "orientation": orientation,
        "config": config_name,
        "config_args": list(config),
        "command": command,
        "status": status,
        "returncode": returncode,
        "timed_out": timed_out,
        "timeout_seconds": timeout_seconds,
        "elapsed_seconds": time.monotonic() - started,
        "conflicts": parse_stat(output, "conflicts"),
        "decisions": parse_stat(output, "decisions"),
        "incremental_cubes_solved": parse_stat(output, "cubes solved"),
        "model_check_against_simplified_cnf": simplified_check,
        "extended_model_check_against_original_cnf": original_check,
        "unsat_certificate": (
            "not emitted; preprocessing and incremental proof aggregation required"
            if status == "UNSAT" else None
        ),
        "original_cnf_sha256": sha256(original_cnf),
        "simplified_cnf_sha256": sha256(simplified_cnf),
        "extension_sha256": sha256(extension),
        "icnf_sha256": sha256(icnf),
        "log_path": str(log),
        "log_sha256": sha256(log),
    }
    (cell / "result.json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cnf-dir", type=Path, default=HERE / "artifacts")
    parser.add_argument(
        "--output-dir", type=Path,
        default=HERE / "artifacts/preprocessed-cube-probe",
    )
    parser.add_argument("--preprocess-rounds", type=int, default=3)
    parser.add_argument("--preprocess-timeout-seconds", type=int, default=60)
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--cube-limit", type=int, default=64)
    parser.add_argument("--cube-timeout-seconds", type=int, default=120)
    parser.add_argument("--solve-timeout-seconds", type=int, default=90)
    parser.add_argument("--workers", type=int, default=8)
    args = parser.parse_args()
    if not 1 <= args.workers <= 8:
        raise SystemExit("workers must be in 1..8")
    if not 1 <= args.cube_limit <= 1024:
        raise SystemExit("cube limit must be in 1..1024")
    if not EXTEND_SOLUTION.is_file():
        raise SystemExit(f"missing solution extender: {EXTEND_SOLUTION}")
    args.output_dir.mkdir(parents=True, exist_ok=True)

    preprocessed: dict[str, dict[str, object]] = {}
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        futures = {
            pool.submit(
                preprocess,
                orientation,
                args.cnf_dir / f"{orientation}.cnf",
                args.output_dir,
                args.preprocess_rounds,
                args.preprocess_timeout_seconds,
            ): orientation
            for orientation in ORIENTATIONS
        }
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            preprocessed[str(result["orientation"])] = result
            print(
                f"preprocess {result['orientation']}: {result['status']} "
                f"inspection={result['simplified_cnf_inspection']}",
                flush=True,
            )
    if any(result["status"] != "PREPROCESSED" for result in preprocessed.values()):
        raise SystemExit("preprocessing did not complete for both orientations")

    cubed: dict[str, dict[str, object]] = {}
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        futures = {
            pool.submit(
                cube_probe.cube,
                orientation,
                Path(preprocessed[orientation]["simplified_cnf_path"]),
                args.output_dir / "cubing",
                args.depth,
                args.cube_limit,
                args.cube_timeout_seconds,
            ): orientation
            for orientation in ORIENTATIONS
        }
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            cubed[str(result["orientation"])] = result
            print(
                f"march {result['orientation']}: {result['status']} "
                f"inspection={result.get('inspection')}",
                flush=True,
            )

    solve_results: list[dict[str, object]] = []
    if all(result["status"] == "CUBED" for result in cubed.values()):
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
            futures = []
            for orientation in ORIENTATIONS:
                original_cnf = args.cnf_dir / f"{orientation}.cnf"
                simplified_cnf = Path(
                    preprocessed[orientation]["simplified_cnf_path"]
                )
                extension = Path(preprocessed[orientation]["extension_path"])
                icnf = Path(cubed[orientation]["icnf_path"])
                for config_name, config in CONFIGS.items():
                    futures.append(pool.submit(
                        solve_icnf,
                        orientation,
                        config_name,
                        config,
                        original_cnf,
                        simplified_cnf,
                        extension,
                        icnf,
                        args.output_dir,
                        args.solve_timeout_seconds,
                    ))
            for future in concurrent.futures.as_completed(futures):
                result = future.result()
                solve_results.append(result)
                print(
                    f"solve {result['orientation']}/{result['config']}: "
                    f"{result['status']} conflicts={result['conflicts']}",
                    flush=True,
                )
        solve_results.sort(key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])),
            list(CONFIGS).index(str(item["config"])),
        ))

    summary = {
        "schema": "p97-exact5-card13-distinct-preprocessed-cube-probe-v1",
        "epistemic_status": "EXTERNAL_EQUI-SAT_CUBE_PROBE_ONLY",
        "workers": args.workers,
        "preprocess_rounds": args.preprocess_rounds,
        "preprocess_timeout_seconds": args.preprocess_timeout_seconds,
        "depth": args.depth,
        "cube_limit": args.cube_limit,
        "cube_timeout_seconds": args.cube_timeout_seconds,
        "solve_timeout_seconds_per_cell": args.solve_timeout_seconds,
        "configs": {name: list(config) for name, config in CONFIGS.items()},
        "preprocessing": preprocessed,
        "cubing": cubed,
        "results": solve_results,
        "overall_status": (
            "SAT"
            if any(item["status"] == "SAT" for item in solve_results)
            else "UNSAT"
            if solve_results and all(item["status"] == "UNSAT" for item in solve_results)
            else "UNKNOWN"
        ),
    }
    (args.output_dir / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(summary, indent=2, sort_keys=True))
    if any(
        item["status"] == "SAT"
        and (
            item["model_check_against_simplified_cnf"] is None
            or item["model_check_against_simplified_cnf"]["status"] != "PASS"
            or item["extended_model_check_against_original_cnf"] is None
            or item["extended_model_check_against_original_cnf"]["status"] != "PASS"
        )
        for item in solve_results
    ):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
