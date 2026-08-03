#!/usr/bin/env python3
"""Schema-v6 target probe: v5 plus cap-localized rich-double-hit exclusion.

If a used critical-shell centre is in strict cap ``i``, its shell cannot hit
one rich radius slice in another strict cap ``j`` twice.  The exact source
theorem is
``false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap`` in
``ATail/FrontierLiveClosure.lean``.  This wrapper adds precisely that
target-independent consequence to the frozen v5 equality-shell model.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import json
import time
from dataclasses import asdict
from datetime import datetime, timezone
from pathlib import Path

import z3

import run_full_multiplicity_sqsep as v5


HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 6
TARGET = v5.TARGET


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


class FullMultiplicityCapLocalizationEncoding(
    v5.FullMultiplicitySquaredSeparationEncoding
):
    """Add the proved cross-cap rich-slice two-hit exclusion."""

    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        base = v5.v4.base
        for i, interior in enumerate(base.INTERIORS):
            for center in interior:
                for (j, _cls), rich in self.rich.items():
                    if i == j:
                        continue
                    support = rich["support"]
                    assert isinstance(support, list)
                    hits = [
                        z3.And(self.row[center, point], support[point])
                        for point in base.INTERIORS[j]
                    ]
                    self.add(
                        "cap_localized_rich_double_hit",
                        z3.Implies(self.used(center), v5.v4.base.at_most(hits, 1)),
                    )


def provenance() -> dict[str, object]:
    return {
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "v5_script_sha256": file_sha256(v5.SCRIPT_PATH),
        "v4_script_sha256": file_sha256(v5.v4.SCRIPT_PATH),
        "base_script_sha256": file_sha256(v5.v4.BASE_PATH),
        "base_schema_sha256": file_sha256(v5.v4.BASE_PATH.parent / "schema.json"),
        "uv_lock_sha256": file_sha256(v5.v4.BASE_PATH.parent / "uv.lock"),
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
        encoding = FullMultiplicityCapLocalizationEncoding(
            case, timeout_ms=timeout_ms, seed=seed
        )
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
    by_id = {case.case_id: case for case in v5.v4.base.all_cases()}
    missing = sorted(set(case_ids) - by_id.keys())
    if missing:
        raise SystemExit(f"unknown case ids: {missing}")
    cases = [by_id[case_id] for case_id in case_ids]
    invalid = [case.case_id for case in cases if case.arm != "fresh"]
    if invalid:
        raise SystemExit(f"schema v6 is fresh-arm only: {invalid}")
    return cases


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--case-id", action="append", required=True)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--seed", type=int, default=97)
    parser.add_argument("--artifacts", type=Path, default=HERE / "artifacts")
    args = parser.parse_args()

    cases = selected_cases(args.case_id)
    run_dir = args.artifacts / f"{timestamp_slug()}-caplocal-pid{__import__('os').getpid()}"
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
