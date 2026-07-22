#!/usr/bin/env python3
"""Solve every preprocessed march cube independently on at most eight cores."""

from __future__ import annotations

import argparse
import concurrent.futures
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


def parse_icnf_cubes(path: Path) -> list[tuple[int, ...]]:
    header_seen = False
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
            if not stripped.startswith("a "):
                continue
            values = tuple(int(value) for value in stripped.split()[1:])
            if not values or values[-1] != 0:
                raise AssertionError(f"unterminated cube on line {line_number}")
            cubes.append(values[:-1])
    if not header_seen:
        raise AssertionError("missing ICNF header")
    if not cubes:
        raise AssertionError("ICNF contains no cubes")
    return cubes


def cnf_body(path: Path) -> str:
    body: list[str] = []
    header_seen = False
    with path.open(encoding="utf-8") as stream:
        for line in stream:
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            if stripped.startswith("p "):
                if header_seen:
                    raise AssertionError("multiple CNF headers")
                header_seen = True
                continue
            body.append(line if line.endswith("\n") else line + "\n")
    if not header_seen:
        raise AssertionError("missing CNF header")
    return "".join(body)


def parse_count(output: str, label: str) -> int | None:
    match = re.search(rf"^c {re.escape(label)}:\s+(\d+)", output, re.MULTILINE)
    return int(match.group(1)) if match else None


def solve_cube(
    orientation: str,
    cube_index: int,
    cube: tuple[int, ...],
    base_body: str,
    simplified_cnf: Path,
    original_cnf: Path,
    extension: Path,
    output_root: Path,
    timeout_seconds: int,
) -> dict[str, object]:
    config_name, config = CONFIGS[(cube_index + (1 if orientation == "mirror" else 0)) % len(CONFIGS)]
    seed = 1000 + cube_index + (100 if orientation == "mirror" else 0)
    cell = output_root / orientation / f"cube-{cube_index:03d}"
    cell.mkdir(parents=True, exist_ok=True)
    log = cell / "cadical.log"
    model = cell / "simplified.model"
    temporary_path: Path | None = None
    started = time.monotonic()
    try:
        with tempfile.NamedTemporaryFile(
            mode="w",
            encoding="utf-8",
            prefix=f"p97-exact5-{orientation}-{cube_index:03d}-",
            suffix=".icnf",
            dir="/tmp",
            delete=False,
        ) as temporary:
            temporary_path = Path(temporary.name)
            temporary.write("p inccnf\n")
            temporary.write(base_body)
            temporary.write("a " + " ".join(str(literal) for literal in cube) + " 0\n")
        command = [
            "cadical", *config, f"--seed={seed}",
            "-t", str(timeout_seconds), "-w", str(model),
            str(temporary_path),
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
    finally:
        if temporary_path is not None:
            temporary_path.unlink(missing_ok=True)
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
                original_check = pipeline.extend_and_verify(
                    model, extension, original_cnf, cell
                )
    result = {
        "orientation": orientation,
        "cube_index": cube_index,
        "cube": list(cube),
        "cube_width": len(cube),
        "config": config_name,
        "config_args": list(config),
        "seed": seed,
        "status": status,
        "returncode": returncode,
        "timed_out": timed_out,
        "elapsed_seconds": time.monotonic() - started,
        "conflicts": parse_count(output, "conflicts"),
        "decisions": parse_count(output, "decisions"),
        "model_check_against_simplified_cnf": simplified_check,
        "extended_model_check_against_original_cnf": original_check,
        "unsat_certificate": (
            "not emitted by bounded profiling probe" if status == "UNSAT" else None
        ),
        "log_path": str(log),
        "log_sha256": sha256(log),
    }
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--pipeline-dir", type=Path,
        default=HERE / "artifacts/preprocessed-cube-probe",
    )
    parser.add_argument(
        "--cnf-dir", type=Path, default=HERE / "artifacts",
    )
    parser.add_argument(
        "--output-dir", type=Path,
        default=HERE / "artifacts/per-cube-probe",
    )
    parser.add_argument("--timeout-seconds", type=int, default=15)
    parser.add_argument("--workers", type=int, default=8)
    args = parser.parse_args()
    if not 1 <= args.workers <= 8:
        raise SystemExit("workers must be in 1..8")
    summary_path = args.pipeline_dir / "summary.json"
    pipeline_summary = json.loads(summary_path.read_text(encoding="utf-8"))
    args.output_dir.mkdir(parents=True, exist_ok=True)

    orientation_data: dict[str, dict[str, object]] = {}
    jobs: list[tuple[object, ...]] = []
    for orientation in ORIENTATIONS:
        preprocessing = pipeline_summary["preprocessing"][orientation]
        cubing = pipeline_summary["cubing"][orientation]
        simplified_cnf = Path(preprocessing["simplified_cnf_path"])
        original_cnf = args.cnf_dir / f"{orientation}.cnf"
        extension = Path(preprocessing["extension_path"])
        icnf = Path(cubing["icnf_path"])
        if sha256(original_cnf) != preprocessing["original_cnf_inspection"]["sha256"]:
            raise AssertionError(f"{orientation} original CNF hash drift")
        if sha256(simplified_cnf) != preprocessing["simplified_cnf_inspection"]["sha256"]:
            raise AssertionError(f"{orientation} simplified CNF hash drift")
        cubes = parse_icnf_cubes(icnf)
        expected = cubing["inspection"]["cube_count"]
        if len(cubes) != expected:
            raise AssertionError(
                f"{orientation} cube count mismatch: {len(cubes)} != {expected}"
            )
        body = cnf_body(simplified_cnf)
        orientation_data[orientation] = {
            "original_cnf_sha256": sha256(original_cnf),
            "simplified_cnf_sha256": sha256(simplified_cnf),
            "extension_sha256": sha256(extension),
            "icnf_sha256": sha256(icnf),
            "cube_count": len(cubes),
        }
        for cube_index, cube in enumerate(cubes):
            jobs.append((
                orientation, cube_index, cube, body, simplified_cnf,
                original_cnf, extension, args.output_dir,
                args.timeout_seconds,
            ))

    results: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(solve_cube, *job) for job in jobs]
        for completed_count, future in enumerate(
            concurrent.futures.as_completed(futures), start=1
        ):
            result = future.result()
            results.append(result)
            print(
                f"[{completed_count}/{len(jobs)}] "
                f"{result['orientation']} cube {result['cube_index']:03d}: "
                f"{result['status']} conflicts={result['conflicts']}",
                flush=True,
            )
    results.sort(key=lambda item: (
        ORIENTATIONS.index(str(item["orientation"])), int(item["cube_index"])
    ))
    counts: dict[str, dict[str, int]] = {}
    for orientation in ORIENTATIONS:
        counts[orientation] = {
            status: sum(
                item["orientation"] == orientation and item["status"] == status
                for item in results
            )
            for status in ("SAT", "UNSAT", "UNKNOWN")
        }
    verified_sat = any(
        item["status"] == "SAT"
        and item["model_check_against_simplified_cnf"] is not None
        and item["model_check_against_simplified_cnf"]["status"] == "PASS"
        and item["extended_model_check_against_original_cnf"] is not None
        and item["extended_model_check_against_original_cnf"]["status"] == "PASS"
        for item in results
    )
    all_unsat = bool(results) and all(item["status"] == "UNSAT" for item in results)
    summary = {
        "schema": "p97-exact5-card13-distinct-per-cube-probe-v1",
        "epistemic_status": "EXTERNAL_BOUNDED_PER_CUBE_PROFILE_ONLY",
        "workers": args.workers,
        "timeout_seconds_per_cube": args.timeout_seconds,
        "config_assignment": "round-robin by cube index and orientation",
        "configs": {name: list(config) for name, config in CONFIGS},
        "inputs": orientation_data,
        "counts": counts,
        "overall_status": "SAT" if verified_sat else "UNSAT" if all_unsat else "UNKNOWN",
        "unsat_certificate": (
            "not emitted; all-cube UNSAT would require per-cube proof verification"
            if all_unsat else None
        ),
        "results": results,
    }
    (args.output_dir / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "counts": counts,
        "overall_status": summary["overall_status"],
        "summary_path": str(args.output_dir / "summary.json"),
    }, indent=2, sort_keys=True))
    if any(
        item["status"] == "SAT"
        and (
            item["model_check_against_simplified_cnf"] is None
            or item["model_check_against_simplified_cnf"]["status"] != "PASS"
            or item["extended_model_check_against_original_cnf"] is None
            or item["extended_model_check_against_original_cnf"]["status"] != "PASS"
        )
        for item in results
    ):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
