#!/usr/bin/env python3
"""Run a deterministic bounded feasibility scan for the orbit shadow."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import sys
from typing import Any

import z3

from domain import canonical_key, validate_orbit_model
from encode_z3 import first_fiber_nonbisector_probe, solve_orbit
from fixtures import all_omission_orbit, mixed_hit_orbit

LANE = Path(__file__).resolve().parent
REPO = LANE.parents[2]
SOURCE_FILES = [
    REPO
    / "scratch/atail-force/r-actual-blocker-transition/ActualBlockerMinimalCycle.lean",
    REPO
    / "scratch/atail-force/r-actual-blocker-transition/ActualBlockerMinimalCycleClassifier.lean",
    REPO
    / "scratch/atail-force/r-actual-blocker-transition/ActualBlockerCycleMetricRigidity.lean",
    REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean",
    LANE / "domain.py",
    LANE / "encode_z3.py",
    LANE / "fixtures.py",
]


def _digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _atomic_json(path: Path, payload: Any) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    os.replace(temporary, path)


def _atomic_jsonl(path: Path, records: list[dict[str, Any]]) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(
        "".join(json.dumps(record, sort_keys=True) + "\n" for record in records)
    )
    os.replace(temporary, path)


def run(args: argparse.Namespace) -> dict[str, Any]:
    for fixture in (all_omission_orbit(), mixed_hit_orbit()):
        validate_orbit_model(fixture)

    first_fiber = {
        "without_forced_second_hit": first_fiber_nonbisector_probe(
            force_both_second_shell=False
        ),
        "with_forced_second_hit": first_fiber_nonbisector_probe(
            force_both_second_shell=True
        ),
    }
    if first_fiber != {
        "without_forced_second_hit": "SAT",
        "with_forced_second_hit": "UNSAT",
    }:
        raise RuntimeError(f"first-fiber nonbisector smoke failed: {first_fiber}")

    results: list[dict[str, Any]] = []
    models: list[dict[str, Any]] = []
    model_indices: dict[tuple, int] = {}
    output_dir = args.output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    for fixed_apex_radius in (False, True):
        for query in ("some_hit", "all_omission"):
            for point_count in range(4, args.max_points + 1):
                # Only the apex is forced outside the distinct source cycle;
                # a robust-pair mate may itself be another source.
                upper_period = min(args.max_period, point_count - 1)
                for period in range(2, upper_period + 1):
                    outcome = solve_orbit(
                        point_count,
                        period,
                        query,
                        fixed_apex_radius=fixed_apex_radius,
                        timeout_ms=args.timeout_ms,
                        seed=args.seed,
                    )
                    record = {
                        "point_count": point_count,
                        "period": period,
                        "query": query,
                        "fixed_apex_radius": fixed_apex_radius,
                        "status": outcome["status"],
                    }
                    if outcome["status"] == "UNKNOWN":
                        record["reason"] = outcome.get("reason", "unknown")
                    if outcome["status"] == "SAT":
                        model = outcome["model"]
                        validate_orbit_model(model)
                        key = canonical_key(model)
                        if key not in model_indices:
                            model_indices[key] = len(models)
                            models.append(model)
                        record["canonical_model_index"] = model_indices[key]
                    results.append(record)
                    _atomic_jsonl(output_dir / "models.jsonl", models)
                    _atomic_json(
                        output_dir / "checkpoint.json",
                        {
                            "completed": len(results),
                            "last": record,
                            "models": len(models),
                        },
                    )

    manifest = {
        "schema_version": 1,
        "status": (
            "COMPLETE_DISCOVERY_CENSUS"
            if all(record["status"] != "UNKNOWN" for record in results)
            else "PARTIAL_SOLVER_UNKNOWN"
        ),
        "trust_boundary": {
            "SAT": "independently verified equality-pattern shadow only",
            "UNSAT": "Z3 discovery evidence only; not proof-producing",
            "UNKNOWN": "nonterminal",
        },
        "bounds": {
            "max_points": args.max_points,
            "max_period": args.max_period,
            "timeout_ms": args.timeout_ms,
            "seed": args.seed,
        },
        "first_fiber_nonbisector_probe": first_fiber,
        "source_hashes": {
            str(path.relative_to(REPO)): _digest(path) for path in SOURCE_FILES
        },
        "runtime": {
            "python": platform.python_version(),
            "z3": z3.get_version_string(),
            "platform": platform.platform(),
        },
        "results": results,
        "model_count": len(models),
    }
    _atomic_json(output_dir / "manifest.json", manifest)
    return manifest


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-points", type=int, default=8)
    parser.add_argument("--max-period", type=int, default=4)
    parser.add_argument("--timeout-ms", type=int, default=20_000)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--output-dir", type=Path, default=LANE / "out")
    args = parser.parse_args()
    if args.max_points < 4 or args.max_period < 2 or args.timeout_ms <= 0:
        parser.error("invalid bounds")

    manifest = run(args)
    counts: dict[str, int] = {}
    for record in manifest["results"]:
        counts[record["status"]] = counts.get(record["status"], 0) + 1
    print(
        json.dumps(
            {
                "status": manifest["status"],
                "counts": counts,
                "model_count": manifest["model_count"],
                "manifest": str((args.output_dir / "manifest.json").resolve()),
            },
            sort_keys=True,
        )
    )
    return 0 if manifest["status"] == "COMPLETE_DISCOVERY_CENSUS" else 2


if __name__ == "__main__":
    sys.exit(main())
