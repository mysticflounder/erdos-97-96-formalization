#!/usr/bin/env python3
"""Schema-v4 target-specific CEGAR with full K4-shell multiplicity.

This imports the frozen schema-v3 implementation without modifying it, then
replaces only the global K4 witness encoding.  At a non-apex centre the chosen
radius now names its *entire* carrier shell (membership iff equal distance),
whose cardinality is at least four.  Used critical centres remain tied to their
canonical exact-four row.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import importlib.util
import json
import sys
import time
from dataclasses import asdict
from datetime import datetime, timezone
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
BASE_PATH = HERE.parent / "round5-general-cegar" / "round5_cegar.py"
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 4
TARGET = "Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_base():
    spec = importlib.util.spec_from_file_location("round5_cegar_frozen", BASE_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load frozen base {BASE_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


base = load_base()


class FullMultiplicityEncoding(base.Encoding):
    """Schema v3 plus full-shell semantics for every global K4 witness."""

    def _build_global_k4(self) -> None:
        for center in base.NONAPICES:
            radius = z3.Real(f"k4_radius_{center}")
            self.k4_radius[center] = radius
            support = []
            for point in base.POINTS:
                bit = z3.Bool(f"k4_{center}_{point}")
                self.k4[center, point] = bit
                support.append(bit)
                if point == center:
                    self.add("global_K4_full_shell", z3.Not(bit))
                else:
                    self.add(
                        "global_K4_full_shell",
                        bit == (self.d(center, point) == radius),
                        z3.Implies(self.used(center), bit == self.row[center, point]),
                    )
            self.add(
                "global_K4_full_shell",
                radius >= 1,
                z3.PbGe([(bit, 1) for bit in support], 4),
            )
            self.circles.append(
                base.Circle(
                    f"globalK4Full_{center}",
                    support,
                    {center: z3.BoolVal(True)},
                )
            )


def provenance() -> dict[str, object]:
    return {
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "base_script_sha256": file_sha256(BASE_PATH),
        "base_schema_sha256": file_sha256(BASE_PATH.parent / "schema.json"),
        "uv_lock_sha256": file_sha256(BASE_PATH.parent / "uv.lock"),
    }


def timestamp_slug() -> str:
    return datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ")


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def solve_case(case, timeout_ms: int, out_dir: Path, seed: int) -> dict[str, object]:
    started = time.monotonic()
    case_dir = out_dir / case.case_id
    case_dir.mkdir(parents=True, exist_ok=False)
    result: dict[str, object] = {
        **provenance(),
        "case": asdict(case),
        "case_id": case.case_id,
        "solver": {"name": "z3", "version": z3.get_version_string(), "seed": seed},
    }
    try:
        encoding = FullMultiplicityEncoding(case, timeout_ms=timeout_ms, seed=seed)
        solver, smt2 = encoding.make_solver()
        result["encoding_sha256"] = hashlib.sha256(smt2.encode()).hexdigest()
        with gzip.open(case_dir / "encoding.smt2.gz", "wt", encoding="utf-8") as handle:
            handle.write(smt2)
        check_started = time.monotonic()
        outcome = solver.check()
        result["solver_elapsed_seconds"] = time.monotonic() - check_started
        if outcome == z3.sat:
            result["status"] = "sat"
            write_json(case_dir / "model.json", encoding.extract_model(solver.model()))
        elif outcome == z3.unsat:
            result["status"] = "unsat"
        else:
            result["status"] = "unknown"
            result["reason_unknown"] = solver.reason_unknown()
    except Exception as exc:  # fail closed and retain the case artifact
        result["status"] = "error"
        result["error"] = f"{type(exc).__name__}: {exc}"
    result["elapsed_seconds"] = time.monotonic() - started
    write_json(case_dir / "result.json", result)
    return result


def worker(payload):
    case, timeout_ms, out_dir, seed = payload
    return solve_case(case, timeout_ms, Path(out_dir), seed)


def selected_cases(case_ids: list[str]):
    by_id = {case.case_id: case for case in base.all_cases()}
    missing = sorted(set(case_ids) - by_id.keys())
    if missing:
        raise SystemExit(f"unknown case ids: {missing}")
    return [by_id[case_id] for case_id in case_ids]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--case-id", action="append", required=True)
    parser.add_argument("--workers", type=int, default=4)
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--seed", type=int, default=97)
    parser.add_argument("--artifacts", type=Path, default=HERE / "artifacts")
    args = parser.parse_args()

    cases = selected_cases(args.case_id)
    run_dir = args.artifacts / f"{timestamp_slug()}-cases-pid{__import__('os').getpid()}"
    run_dir.mkdir(parents=True, exist_ok=False)
    write_json(run_dir / "source_authentication.json", provenance())
    started = time.monotonic()
    payloads = [(case, args.timeout_ms, run_dir, args.seed) for case in cases]
    results = []
    with concurrent.futures.ProcessPoolExecutor(max_workers=args.workers) as pool:
        for result in pool.map(worker, payloads):
            results.append(result)
            print(json.dumps({"case_id": result["case_id"], "status": result["status"]}), flush=True)
    statuses: dict[str, int] = {}
    for result in results:
        status = str(result["status"])
        statuses[status] = statuses.get(status, 0) + 1
    summary = {
        **provenance(),
        "case_count": len(cases),
        "elapsed_seconds": time.monotonic() - started,
        "statuses": statuses,
        "results": sorted(results, key=lambda item: str(item["case_id"])),
    }
    write_json(run_dir / "summary.json", summary)
    print(json.dumps({"run_dir": str(run_dir), "statuses": statuses}, sort_keys=True))
    return 0 if not ({"unknown", "error"} & statuses.keys()) else 2


if __name__ == "__main__":
    raise SystemExit(main())
