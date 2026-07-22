#!/usr/bin/env python3
"""Profile semantic-block ablations without changing the full source CNFs."""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import re
import subprocess
import sys
import time
from pathlib import Path

import run_solver


HERE = Path(__file__).resolve().parent
PROFILES: dict[str, tuple[str, ...]] = {
    "full": (),
    "no_connectivity": ("connectivity",),
    "no_complete_classes": ("complete_classes",),
    "no_unique_k4_second": ("unique_k4_second",),
    "no_unique_k4_first": ("unique_k4_first",),
    "no_unique_k4_critical": ("unique_k4_critical",),
    "no_all_unique_k4": (
        "unique_k4_second", "unique_k4_first", "unique_k4_critical",
    ),
    "no_kalmanson": ("kalmanson",),
    "kalmanson_only": (
        "connectivity", "complete_classes", "unique_k4_second",
        "unique_k4_first", "unique_k4_critical",
    ),
    "kalmanson_plus_connectivity": (
        "complete_classes", "unique_k4_second", "unique_k4_first",
        "unique_k4_critical",
    ),
    "kalmanson_plus_complete": (
        "connectivity", "unique_k4_second", "unique_k4_first",
        "unique_k4_critical",
    ),
    "kalmanson_plus_unique": ("connectivity", "complete_classes"),
}
ORIENTATIONS = ("direct", "mirror")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def parse_stat(output: str, name: str) -> int | None:
    match = re.search(rf"^c {re.escape(name)}:\s+(\d+)", output, re.MULTILINE)
    return int(match.group(1)) if match else None


def export(profile: str, orientation: str, root: Path, seed: int) -> dict[str, object]:
    cell = root / profile / orientation
    cell.mkdir(parents=True, exist_ok=True)
    cnf = cell / "formula.cnf"
    metadata = cell / "metadata.json"
    command = [
        sys.executable, str(HERE / "export_cnf.py"),
        "--orientation", orientation,
        "--seed", str(seed),
        "--output-cnf", str(cnf),
        "--output-metadata", str(metadata),
    ]
    for block in PROFILES[profile]:
        command.extend(("--disable-block", block))
    started = time.monotonic()
    completed = subprocess.run(
        command, text=True, capture_output=True, check=False, timeout=180
    )
    (cell / "build.log").write_text(
        completed.stdout + completed.stderr, encoding="utf-8"
    )
    if completed.returncode != 0:
        raise RuntimeError(f"export failed for {profile}/{orientation}")
    raw = json.loads(metadata.read_text())
    return {
        "profile": profile,
        "orientation": orientation,
        "disabled_blocks": list(PROFILES[profile]),
        "cnf": cnf,
        "metadata": raw,
        "build_elapsed_seconds": time.monotonic() - started,
    }


def solve(cell_info: dict[str, object], timeout_seconds: int, seed: int) -> dict[str, object]:
    profile = str(cell_info["profile"])
    orientation = str(cell_info["orientation"])
    cnf = Path(cell_info["cnf"])
    cell = cnf.parent
    model_path = cell / "model.out"
    log_path = cell / "cadical.log"
    command = [
        "cadical", "--default", f"--seed={seed}",
        "-t", str(timeout_seconds), "-w", str(model_path), str(cnf),
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
    log_path.write_text(output, encoding="utf-8")
    status = "UNKNOWN" if subprocess_timeout else {
        10: "SAT", 20: "UNSAT",
    }.get(returncode, "UNKNOWN")
    model_check = None
    if status == "SAT":
        if not model_path.exists():
            model_check = {"status": "FAIL", "detail": "missing model file"}
        else:
            model_output = model_path.read_text(encoding="utf-8")
            ok, detail = run_solver.verify_model(cnf, model_output)
            model_check = {"status": "PASS" if ok else "FAIL", "detail": detail}
    result = {
        "schema": "p97-exact5-card13-distinct-ablation-cell-v1",
        "epistemic_status": "DIAGNOSTIC_WEAKENED_CNF_ONLY",
        "profile": profile,
        "orientation": orientation,
        "disabled_blocks": list(cell_info["disabled_blocks"]),
        "status": status,
        "returncode": returncode,
        "subprocess_timeout": subprocess_timeout,
        "timeout_seconds": timeout_seconds,
        "elapsed_seconds": time.monotonic() - started,
        "conflicts": parse_stat(output, "conflicts"),
        "decisions": parse_stat(output, "decisions"),
        "cnf_sha256": sha256(cnf),
        "cnf_variable_count": cell_info["metadata"]["cnf_variable_count"],
        "cnf_clause_count": cell_info["metadata"]["cnf_clause_count"],
        "model_check": model_check,
        "log_path": str(log_path),
        "log_sha256": sha256(log_path),
    }
    (cell / "result.json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=HERE / "artifacts/ablation")
    parser.add_argument("--timeout-seconds", type=int, default=20)
    parser.add_argument("--workers", type=int, default=8)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument(
        "--profile", action="append", choices=tuple(PROFILES), default=[],
        help="Run only the named profile; may be repeated.",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 8:
        raise SystemExit("workers must be in 1..8")
    args.output_dir.mkdir(parents=True, exist_ok=True)

    selected_profiles = args.profile or list(PROFILES)
    cells = [
        export(profile, orientation, args.output_dir, args.seed)
        for profile in selected_profiles
        for orientation in ORIENTATIONS
    ]
    results: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = {
            pool.submit(solve, cell, args.timeout_seconds, args.seed + index): cell
            for index, cell in enumerate(cells)
        }
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            results.append(result)
            print(
                f"{result['profile']}/{result['orientation']}: "
                f"{result['status']} conflicts={result['conflicts']}",
                flush=True,
            )
    results.sort(key=lambda item: (
        list(PROFILES).index(str(item["profile"])),
        ORIENTATIONS.index(str(item["orientation"])),
    ))
    summary = {
        "schema": "p97-exact5-card13-distinct-ablation-profile-v1",
        "epistemic_status": "DIAGNOSTIC_ABLATION_ONLY",
        "workers": args.workers,
        "timeout_seconds_per_cell": args.timeout_seconds,
        "seed_base": args.seed,
        "profiles": {
            name: list(PROFILES[name]) for name in selected_profiles
        },
        "results": results,
    }
    (args.output_dir / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
