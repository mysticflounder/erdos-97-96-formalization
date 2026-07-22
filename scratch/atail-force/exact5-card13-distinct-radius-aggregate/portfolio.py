#!/usr/bin/env python3
"""Run an eight-process CaDiCaL portfolio on the two exact full CNFs."""

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
CONFIGS: dict[str, tuple[str, ...]] = {
    "default_seed0": ("--default", "--seed=0"),
    "sat_seed1": ("--sat", "--seed=1"),
    "unsat_seed2": ("--unsat", "--seed=2"),
    "phase_false_seed3": ("--default", "--phase=false", "--seed=3"),
}
ORIENTATIONS = ("direct", "mirror")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def parse_stat(output: str, name: str) -> int | None:
    match = re.search(rf"^c {re.escape(name)}:\s+(\d+)", output, re.MULTILINE)
    return int(match.group(1)) if match else None


def solve(
    orientation: str,
    config_name: str,
    config: tuple[str, ...],
    cnf: Path,
    root: Path,
    timeout_seconds: int,
) -> dict[str, object]:
    cell = root / orientation / config_name
    cell.mkdir(parents=True, exist_ok=True)
    log = cell / "cadical.log"
    model = cell / "witness.model"
    command = [
        "cadical", *config, "-t", str(timeout_seconds),
        "-w", str(model), str(cnf),
    ]
    started = time.monotonic()
    try:
        completed = subprocess.run(
            command, text=True, capture_output=True, check=False,
            timeout=timeout_seconds + 15,
        )
        output = completed.stdout + completed.stderr
        returncode = completed.returncode
        subprocess_timeout = False
    except subprocess.TimeoutExpired as error:
        stdout = error.stdout.decode() if isinstance(error.stdout, bytes) else error.stdout
        stderr = error.stderr.decode() if isinstance(error.stderr, bytes) else error.stderr
        output = (stdout or "") + (stderr or "")
        returncode = None
        subprocess_timeout = True
    log.write_text(output, encoding="utf-8")
    status = "UNKNOWN" if subprocess_timeout else {
        10: "SAT", 20: "UNSAT",
    }.get(returncode, "UNKNOWN")
    model_check = None
    if status == "SAT":
        if not model.exists():
            model_check = {"status": "FAIL", "detail": "missing witness"}
        else:
            ok, detail = run_solver.verify_model(
                cnf, model.read_text(encoding="utf-8")
            )
            model_check = {"status": "PASS" if ok else "FAIL", "detail": detail}
    result = {
        "schema": "p97-exact5-card13-distinct-portfolio-cell-v1",
        "epistemic_status": "EXTERNAL_EXACT_CNF_PORTFOLIO_VERDICT",
        "orientation": orientation,
        "config": config_name,
        "config_args": list(config),
        "status": status,
        "returncode": returncode,
        "subprocess_timeout": subprocess_timeout,
        "timeout_seconds": timeout_seconds,
        "elapsed_seconds": time.monotonic() - started,
        "conflicts": parse_stat(output, "conflicts"),
        "decisions": parse_stat(output, "decisions"),
        "model_check": model_check,
        "unsat_certificate": (
            "not emitted by portfolio probe; rerun winning cell with DRAT"
            if status == "UNSAT" else None
        ),
        "cnf_path": str(cnf),
        "cnf_sha256": sha256(cnf),
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
    parser.add_argument("--output-dir", type=Path, default=HERE / "artifacts/portfolio")
    parser.add_argument("--timeout-seconds", type=int, default=90)
    parser.add_argument("--workers", type=int, default=8)
    args = parser.parse_args()
    if not 1 <= args.workers <= 8:
        raise SystemExit("workers must be in 1..8")
    args.output_dir.mkdir(parents=True, exist_ok=True)

    cells = [
        (orientation, name, config, args.cnf_dir / f"{orientation}.cnf")
        for orientation in ORIENTATIONS
        for name, config in CONFIGS.items()
    ]
    for _, _, _, cnf in cells:
        if not cnf.exists():
            raise SystemExit(f"missing exact CNF: {cnf}")
    results: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [
            pool.submit(
                solve, orientation, name, config, cnf,
                args.output_dir, args.timeout_seconds,
            )
            for orientation, name, config, cnf in cells
        ]
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            results.append(result)
            print(
                f"{result['orientation']}/{result['config']}: "
                f"{result['status']} conflicts={result['conflicts']}",
                flush=True,
            )
    results.sort(key=lambda item: (
        ORIENTATIONS.index(str(item["orientation"])),
        list(CONFIGS).index(str(item["config"])),
    ))
    summary = {
        "schema": "p97-exact5-card13-distinct-portfolio-v1",
        "epistemic_status": "EXTERNAL_EXACT_CNF_PORTFOLIO_ONLY",
        "workers": args.workers,
        "timeout_seconds_per_cell": args.timeout_seconds,
        "configs": {name: list(config) for name, config in CONFIGS.items()},
        "results": results,
    }
    (args.output_dir / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(summary, indent=2, sort_keys=True))
    if any(
        item["status"] == "SAT"
        and item["model_check"]["status"] != "PASS"
        for item in results
    ):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
