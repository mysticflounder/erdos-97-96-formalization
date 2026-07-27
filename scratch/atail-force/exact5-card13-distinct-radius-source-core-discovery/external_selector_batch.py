#!/usr/bin/env python3
"""Externally certify every source-core gap left by the level-two pass."""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
from pathlib import Path
import subprocess
import sys
from typing import Any

import source_core_pilot as pilot


HERE = Path(__file__).resolve().parent
PILOT = HERE / "external_selector_core_pilot.py"
SCHEMA = "p97-exact5-card13-external-selector-source-core-batch-v1"
RESULT_SCHEMA = "p97-exact5-card13-external-selector-source-core-pilot-v1"
ORBITS = pilot.ORBITS


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"expected JSON object: {path}")
    return value


def external_cube_payload(leaf: int) -> list[dict[str, Any]]:
    return [
        {key: item[key] for key in ("atom", "value", "assertion")}
        for item in pilot.expected_cube_payload(leaf)
    ]


def selected_gaps(level2: Path) -> dict[str, list[dict[str, Any]]]:
    selected: dict[str, list[dict[str, Any]]] = {}
    for orbit in ORBITS:
        manifest_path = level2 / orbit / "manifest.json"
        manifest = load_json(manifest_path)
        if manifest.get("orbit") != orbit:
            raise ValueError(f"level-2 orbit mismatch: {manifest_path}")
        if manifest.get("completed_count") != manifest.get("selected_count"):
            raise ValueError(f"level-2 pass is incomplete: {manifest_path}")
        gaps = manifest.get("persistent_unresolved")
        if not isinstance(gaps, list):
            raise ValueError(f"missing persistent gap list: {manifest_path}")
        if len(gaps) != manifest.get("persistent_unresolved_count"):
            raise ValueError(f"persistent gap count drift: {manifest_path}")
        selected[orbit] = sorted(gaps, key=lambda item: int(item["leaf"]))
    return selected


def validate_result(
    path: Path,
    *,
    orbit: str,
    leaf: int,
    fingerprint: str,
) -> dict[str, Any]:
    result = load_json(path)
    expected = {
        "schema": RESULT_SCHEMA,
        "orbit": orbit,
        "leaf": leaf,
        "source_assertion_count": 58_433,
        "source_assertions_sha256": fingerprint,
        "cube": external_cube_payload(leaf),
    }
    for key, value in expected.items():
        if result.get(key) != value:
            raise ValueError(f"external result mismatch at {path} field {key}")
    if result.get("external_status") == "SAT":
        raise RuntimeError(f"fail-closed external SAT result: {path}")
    return result


def run_task(task: dict[str, Any]) -> dict[str, Any]:
    output_dir = Path(task["output_dir"])
    output_dir.mkdir(parents=True, exist_ok=True)
    command = [
        sys.executable,
        str(PILOT),
        "--orbit",
        str(task["orbit"]),
        "--leaf",
        str(task["leaf"]),
        "--output-dir",
        str(output_dir),
        "--seed",
        str(task["seed"]),
        "--solve-seconds",
        str(task["solve_seconds"]),
        "--trim-seconds",
        str(task["trim_seconds"]),
    ]
    process = subprocess.run(
        command,
        capture_output=True,
        text=True,
        timeout=float(task["solve_seconds"]) + float(task["trim_seconds"]) + 900,
        check=False,
    )
    result_path = output_dir / "result.json"
    if not result_path.exists():
        raise RuntimeError(
            f"external pilot produced no result for {task['orbit']} leaf {task['leaf']}; "
            f"returncode={process.returncode}; stderr={process.stderr[-2000:]}"
        )
    return {
        "orbit": task["orbit"],
        "leaf": task["leaf"],
        "returncode": process.returncode,
        "stdout_tail": process.stdout.splitlines()[-20:],
        "stderr_tail": process.stderr.splitlines()[-20:],
        "result_path": str(result_path),
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--first-pass", type=Path, required=True)
    parser.add_argument("--level2", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument(
        "--retry-from",
        type=Path,
        help="prior batch; select only its unresolved orbit/leaf pairs",
    )
    parser.add_argument("--workers", type=int, default=10)
    parser.add_argument("--seed-base", type=int, default=200_000)
    parser.add_argument("--solve-seconds", type=float, default=600.0)
    parser.add_argument("--trim-seconds", type=float, default=300.0)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--plan-only", action="store_true")
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        raise ValueError("workers must lie in [1, 24]")
    if args.solve_seconds <= 0 or args.trim_seconds <= 0:
        raise ValueError("timeouts must be positive")
    return args


def main() -> None:
    args = parse_args()
    first_config_path = args.first_pass / "run-config.json"
    first_config = load_json(first_config_path)
    first_config_sha = sha256(first_config_path)
    level2_config_path = args.level2 / "run-config.json"
    level2_config = load_json(level2_config_path)
    level2_config_sha = sha256(level2_config_path)
    if level2_config.get("first_pass_run_config_sha256") != first_config_sha:
        raise ValueError("level-2 pass does not descend from first pass")
    fingerprints = {
        item["orbit"]: item["source_assertions_sha256"]
        for item in first_config["orbits"]
    }
    gaps = selected_gaps(args.level2)
    retry_manifest_sha = None
    if args.retry_from is not None:
        retry_manifest_path = args.retry_from / "manifest.json"
        retry_manifest = load_json(retry_manifest_path)
        retry_manifest_sha = sha256(retry_manifest_path)
        unresolved = {
            (str(item["orbit"]), int(item["leaf"]))
            for item in retry_manifest.get("unresolved", [])
        }
        gaps = {
            orbit: [
                item
                for item in gaps[orbit]
                if (orbit, int(item["leaf"])) in unresolved
            ]
            for orbit in ORBITS
        }
    selections = [
        {
            "orbit": orbit,
            "leaf": int(item["leaf"]),
            "cube_bits": item["cube_bits"],
            "level2_classification_status": item["classification_status"],
            "level2_core_extraction_status": item.get("core_extraction_status"),
        }
        for orbit in ORBITS
        for item in gaps[orbit]
    ]
    run_config = {
        "schema": f"{SCHEMA}-run-config",
        "epistemic_status": "EXACT_LEVEL2_SOURCE_CORE_GAP_SELECTION",
        "first_pass": str(args.first_pass),
        "first_pass_run_config_sha256": first_config_sha,
        "level2": str(args.level2),
        "level2_run_config_sha256": level2_config_sha,
        "retry_from": str(args.retry_from) if args.retry_from is not None else None,
        "retry_manifest_sha256": retry_manifest_sha,
        "source_assertions_sha256": fingerprints,
        "selections": selections,
        "workers": args.workers,
        "seed_base": args.seed_base,
        "solve_seconds": args.solve_seconds,
        "trim_seconds": args.trim_seconds,
    }
    args.output_dir.mkdir(parents=True, exist_ok=True)
    config_path = args.output_dir / "run-config.json"
    if config_path.exists():
        if not args.resume:
            raise FileExistsError(f"existing batch requires --resume: {config_path}")
        if load_json(config_path) != run_config:
            raise ValueError("strict external batch run-config mismatch")
    else:
        config_path.write_text(
            json.dumps(run_config, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    print(json.dumps({
        "event": "external_gap_selection",
        "selected_count": len(selections),
        "selections": selections,
    }, sort_keys=True), flush=True)
    if args.plan_only:
        return

    completed: dict[tuple[str, int], dict[str, Any]] = {}
    tasks: list[dict[str, Any]] = []
    for orbit_index, orbit in enumerate(ORBITS):
        for item in gaps[orbit]:
            leaf = int(item["leaf"])
            leaf_dir = args.output_dir / orbit / f"leaf-{leaf:03d}"
            result_path = leaf_dir / "result.json"
            if result_path.exists():
                if not args.resume:
                    raise FileExistsError(
                        f"existing external leaf requires --resume: {result_path}"
                    )
                completed[(orbit, leaf)] = validate_result(
                    result_path,
                    orbit=orbit,
                    leaf=leaf,
                    fingerprint=fingerprints[orbit],
                )
            else:
                tasks.append({
                    "orbit": orbit,
                    "leaf": leaf,
                    "output_dir": str(leaf_dir),
                    "seed": args.seed_base + orbit_index * 10_000 + leaf,
                    "solve_seconds": args.solve_seconds,
                    "trim_seconds": args.trim_seconds,
                })
    print(json.dumps({
        "event": "external_gap_resume_audit",
        "selected": len(selections),
        "reused": len(completed),
        "new": len(tasks),
    }, sort_keys=True), flush=True)

    with concurrent.futures.ThreadPoolExecutor(
        max_workers=min(args.workers, max(1, len(tasks)))
    ) as pool:
        futures = {pool.submit(run_task, task): task for task in tasks}
        for future in concurrent.futures.as_completed(futures):
            task = futures[future]
            process_result = future.result()
            result_path = Path(process_result["result_path"])
            result = validate_result(
                result_path,
                orbit=str(task["orbit"]),
                leaf=int(task["leaf"]),
                fingerprint=fingerprints[str(task["orbit"])],
            )
            completed[(str(task["orbit"]), int(task["leaf"]))] = result
            event = {
                "event": "external_gap_complete",
                "orbit": task["orbit"],
                "leaf": task["leaf"],
                "returncode": process_result["returncode"],
                "external_status": result.get("external_status"),
                "drat_trim_verified": result.get("drat_trim_verified"),
                "source_packet_z3_recheck": result.get("source_packet_z3_recheck"),
                "source_core_size": result.get("core_source_assertion_count"),
                "cube_core_size": result.get("core_cube_literal_count"),
            }
            print(json.dumps(event, sort_keys=True), flush=True)
            if result.get("external_status") == "SAT":
                raise RuntimeError(
                    f"fail-closed external SAT: {task['orbit']} leaf {task['leaf']}"
                )

    rows = []
    for item in selections:
        key = (str(item["orbit"]), int(item["leaf"]))
        result = completed.get(key)
        checked = bool(
            result is not None
            and result.get("external_status") == "UNSAT"
            and result.get("drat_trim_verified") is True
            and result.get("source_packet_z3_recheck") == "UNSAT"
            and int(result.get("core_source_assertion_count", 0)) > 0
            and int(result.get("core_cube_literal_count", 0)) > 0
        )
        rows.append({
            **item,
            "checked_source_core": checked,
            "result_path": (
                str(
                    args.output_dir
                    / str(item["orbit"])
                    / f"leaf-{int(item['leaf']):03d}"
                    / "result.json"
                )
                if result is not None
                else None
            ),
            "result_sha256": (
                sha256(
                    args.output_dir
                    / str(item["orbit"])
                    / f"leaf-{int(item['leaf']):03d}"
                    / "result.json"
                )
                if result is not None
                else None
            ),
            "source_core_size": (
                result.get("core_source_assertion_count") if result else None
            ),
            "cube_core_size": (
                result.get("core_cube_literal_count") if result else None
            ),
            "external_status": result.get("external_status") if result else None,
            "drat_trim_verified": (
                result.get("drat_trim_verified") if result else None
            ),
            "source_packet_z3_recheck": (
                result.get("source_packet_z3_recheck") if result else None
            ),
        })
    unresolved = [
        {"orbit": item["orbit"], "leaf": item["leaf"], "cube_bits": item["cube_bits"]}
        for item in rows
        if not item["checked_source_core"]
    ]
    manifest = {
        "schema": f"{SCHEMA}-manifest",
        "epistemic_status": (
            "ALL_LEVEL2_GAPS_HAVE_CHECKED_EXTERNAL_SOURCE_CORES"
            if not unresolved
            else "EXTERNAL_SOURCE_CORE_COVERAGE_INCOMPLETE"
        ),
        "run_config": str(config_path),
        "run_config_sha256": sha256(config_path),
        "selected_count": len(selections),
        "completed_count": len(completed),
        "checked_source_core_count": sum(
            1 for item in rows if item["checked_source_core"]
        ),
        "unresolved": unresolved,
        "results": rows,
    }
    manifest_path = args.output_dir / "manifest.json"
    manifest_path.write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "event": "external_gap_batch_complete",
        "status": manifest["epistemic_status"],
        "checked_source_core_count": manifest["checked_source_core_count"],
        "selected_count": manifest["selected_count"],
        "output": str(manifest_path),
    }, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
