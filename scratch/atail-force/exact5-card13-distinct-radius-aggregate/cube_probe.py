#!/usr/bin/env python3
"""Bounded march_cu plus eight-process CaDiCaL probe of the exact CNFs."""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import re
import subprocess
import time
from pathlib import Path

import run_solver


HERE = Path(__file__).resolve().parent
ORIENTATIONS = ("direct", "mirror")
CONFIGS: dict[str, tuple[str, ...]] = {
    "default_seed10": ("--default", "--seed=10"),
    "sat_seed11": ("--sat", "--seed=11"),
    "unsat_seed12": ("--unsat", "--seed=12"),
    "phase_false_seed13": ("--default", "--phase=false", "--seed=13"),
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def parse_stat(output: str, name: str) -> int | None:
    match = re.search(rf"^c {re.escape(name)}:\s+(\d+)", output, re.MULTILINE)
    return int(match.group(1)) if match else None


def inspect_icnf(path: Path, cube_limit: int) -> dict[str, object]:
    header = None
    clauses = 0
    cubes = 0
    max_cube_width = 0
    with path.open(encoding="utf-8") as stream:
        for line_number, line in enumerate(stream, start=1):
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            if stripped.startswith("p "):
                header = stripped
                continue
            values = stripped.split()
            if values[-1] != "0":
                raise AssertionError(f"unterminated ICNF line {line_number}")
            if values[0] == "a":
                cubes += 1
                max_cube_width = max(max_cube_width, len(values) - 2)
            else:
                clauses += 1
    if header != "p inccnf":
        raise AssertionError(f"bad ICNF header: {header!r}")
    if not 1 <= cubes <= cube_limit:
        raise AssertionError(f"cube count {cubes} outside 1..{cube_limit}")
    return {
        "header": header,
        "base_clause_lines": clauses,
        "cube_count": cubes,
        "max_cube_width": max_cube_width,
        "size_bytes": path.stat().st_size,
        "sha256": sha256(path),
    }


def cube(
    orientation: str,
    cnf: Path,
    root: Path,
    depth: int,
    cube_limit: int,
    timeout_seconds: int,
) -> dict[str, object]:
    cell = root / orientation
    cell.mkdir(parents=True, exist_ok=True)
    icnf = cell / f"depth{depth}-limit{cube_limit}.icnf"
    log = cell / "march.log"
    started = time.monotonic()
    try:
        with icnf.open("w", encoding="utf-8") as output:
            completed = subprocess.run(
                [
                    "march_cu", str(cnf), "-q", "-d", str(depth),
                    "-l", str(cube_limit),
                ],
                stdout=output, stderr=subprocess.PIPE, text=True,
                check=False, timeout=timeout_seconds,
            )
        stderr = completed.stderr
        returncode = completed.returncode
        timed_out = False
    except subprocess.TimeoutExpired as error:
        stderr = error.stderr.decode() if isinstance(error.stderr, bytes) else error.stderr
        returncode = None
        timed_out = True
    log.write_text(stderr or "", encoding="utf-8")
    result: dict[str, object] = {
        "orientation": orientation,
        "returncode": returncode,
        "timed_out": timed_out,
        "elapsed_seconds": time.monotonic() - started,
        "depth": depth,
        "cube_limit": cube_limit,
        "cnf_sha256": sha256(cnf),
        "icnf_path": str(icnf),
        "log_path": str(log),
        "log_sha256": sha256(log),
    }
    if not timed_out and icnf.exists():
        result["inspection"] = inspect_icnf(icnf, cube_limit)
        result["status"] = "CUBED"
    else:
        result["status"] = "UNKNOWN"
    (cell / "march.result.json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return result


def solve_icnf(
    orientation: str,
    config_name: str,
    config: tuple[str, ...],
    base_cnf: Path,
    icnf: Path,
    root: Path,
    timeout_seconds: int,
) -> dict[str, object]:
    cell = root / orientation / config_name
    cell.mkdir(parents=True, exist_ok=True)
    log = cell / "cadical.log"
    model = cell / "witness.model"
    started = time.monotonic()
    try:
        completed = subprocess.run(
            [
                "cadical", *config, "-t", str(timeout_seconds),
                "-w", str(model), str(icnf),
            ],
            text=True, capture_output=True, check=False,
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
    status = "UNKNOWN" if timed_out else {
        10: "SAT", 20: "UNSAT",
    }.get(returncode, "UNKNOWN")
    model_check = None
    if status == "SAT":
        if not model.exists():
            model_check = {"status": "FAIL", "detail": "missing witness"}
        else:
            ok, detail = run_solver.verify_model(
                base_cnf, model.read_text(encoding="utf-8")
            )
            model_check = {"status": "PASS" if ok else "FAIL", "detail": detail}
    result = {
        "schema": "p97-exact5-card13-distinct-cube-probe-cell-v1",
        "epistemic_status": "EXTERNAL_EXACT_ICNF_PROBE_ONLY",
        "orientation": orientation,
        "config": config_name,
        "config_args": list(config),
        "status": status,
        "returncode": returncode,
        "timed_out": timed_out,
        "timeout_seconds": timeout_seconds,
        "elapsed_seconds": time.monotonic() - started,
        "conflicts": parse_stat(output, "conflicts"),
        "decisions": parse_stat(output, "decisions"),
        "model_check_against_base_cnf": model_check,
        "unsat_certificate": (
            "not emitted; incremental cube proof aggregation required"
            if status == "UNSAT" else None
        ),
        "base_cnf_sha256": sha256(base_cnf),
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
    parser.add_argument("--output-dir", type=Path, default=HERE / "artifacts/cube-probe")
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
    args.output_dir.mkdir(parents=True, exist_ok=True)

    cubed: dict[str, dict[str, object]] = {}
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        futures = {
            pool.submit(
                cube, orientation, args.cnf_dir / f"{orientation}.cnf",
                args.output_dir, args.depth, args.cube_limit,
                args.cube_timeout_seconds,
            ): orientation
            for orientation in ORIENTATIONS
        }
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            cubed[str(result["orientation"])] = result
            print(
                f"march {result['orientation']}: {result['status']} "
                f"inspection={result.get('inspection')}", flush=True,
            )
    if any(result["status"] != "CUBED" for result in cubed.values()):
        raise SystemExit("cubing did not complete for both orientations")

    solve_results: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = []
        for orientation in ORIENTATIONS:
            base_cnf = args.cnf_dir / f"{orientation}.cnf"
            icnf = Path(cubed[orientation]["icnf_path"])
            for config_name, config in CONFIGS.items():
                futures.append(pool.submit(
                    solve_icnf, orientation, config_name, config,
                    base_cnf, icnf, args.output_dir,
                    args.solve_timeout_seconds,
                ))
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            solve_results.append(result)
            print(
                f"cube {result['orientation']}/{result['config']}: "
                f"{result['status']} conflicts={result['conflicts']}",
                flush=True,
            )
    solve_results.sort(key=lambda item: (
        ORIENTATIONS.index(str(item["orientation"])),
        list(CONFIGS).index(str(item["config"])),
    ))
    summary = {
        "schema": "p97-exact5-card13-distinct-cube-probe-v1",
        "epistemic_status": "EXTERNAL_EXACT_ICNF_PROBE_ONLY",
        "workers": args.workers,
        "depth": args.depth,
        "cube_limit": args.cube_limit,
        "cube_timeout_seconds": args.cube_timeout_seconds,
        "solve_timeout_seconds_per_cell": args.solve_timeout_seconds,
        "configs": {name: list(config) for name, config in CONFIGS.items()},
        "cubing": cubed,
        "results": solve_results,
    }
    (args.output_dir / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(summary, indent=2, sort_keys=True))
    if any(
        item["status"] == "SAT"
        and item["model_check_against_base_cnf"]["status"] != "PASS"
        for item in solve_results
    ):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
