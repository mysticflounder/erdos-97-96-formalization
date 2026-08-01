#!/usr/bin/env python3
"""Parallel, resumable threshold sweep for the actual-blocker orbit shadow.

This is a discovery driver.  SAT models are checked by the solver-free domain
validator before admission.  UNSAT is only Z3 discovery evidence.
"""

from __future__ import annotations

import argparse
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import socket
from typing import Any, Iterable

import z3

from census import REPO, SOURCE_FILES
from domain import canonical_key, validate_orbit_model
from encode_z3 import solve_orbit


LANE = Path(__file__).resolve().parent
SCHEMA_VERSION = 2
SAT_STATUS = "SAT_INDEPENDENTLY_VERIFIED_EQUALITY_PATTERN_ONLY"
UNSAT_STATUS = "UNSAT_Z3_DISCOVERY_ONLY"
UNKNOWN_STATUS = "UNKNOWN"
TERMINAL_STATUSES = frozenset({SAT_STATUS, UNSAT_STATUS})
ALL_STATUSES = frozenset({SAT_STATUS, UNSAT_STATUS, UNKNOWN_STATUS})
QUERY_ORDER = {"some_hit": 0, "all_omission": 1}
PROVENANCE_FIELDS = ("python", "z3", "platform", "host")


@dataclass(frozen=True, order=True)
class Job:
    period: int
    point_slack: int
    query_rank: int
    fixed_apex_radius: bool

    @property
    def point_count(self) -> int:
        return self.period + self.point_slack

    @property
    def query(self) -> str:
        return ("some_hit", "all_omission")[self.query_rank]

    @property
    def key(self) -> str:
        radius = "fixed" if self.fixed_apex_radius else "free"
        return (
            f"period={self.period};slack={self.point_slack};"
            f"query={self.query};radius={radius}"
        )


def build_jobs(
    *,
    min_period: int,
    max_period: int,
    min_point_slack: int,
    max_point_slack: int,
    queries: Iterable[str],
    fixed_radius_cases: Iterable[bool],
) -> list[Job]:
    query_ranks = sorted({QUERY_ORDER[query] for query in queries})
    radius_cases = sorted(set(fixed_radius_cases))
    return sorted(
        Job(period, slack, query_rank, fixed)
        for period in range(min_period, max_period + 1)
        for slack in range(min_point_slack, max_point_slack + 1)
        for query_rank in query_ranks
        for fixed in radius_cases
    )


def _digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _source_hashes() -> dict[str, str]:
    sources = sorted(set(SOURCE_FILES + [Path(__file__).resolve()]))
    return {str(path.relative_to(REPO)): _digest(path) for path in sources}


def _atomic_text(path: Path, content: str) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(content)
    os.replace(temporary, path)


def _atomic_json(path: Path, payload: Any) -> None:
    _atomic_text(path, json.dumps(payload, indent=2, sort_keys=True) + "\n")


def _atomic_jsonl(path: Path, records: Iterable[dict[str, Any]]) -> None:
    _atomic_text(
        path,
        "".join(json.dumps(record, sort_keys=True) + "\n" for record in records),
    )


def _read_json(path: Path) -> Any:
    try:
        return json.loads(path.read_text())
    except (OSError, json.JSONDecodeError) as error:
        raise RuntimeError(f"cannot safely resume from {path}: {error}") from error


def _read_jsonl(path: Path) -> list[dict[str, Any]]:
    try:
        lines = path.read_text().splitlines()
        return [json.loads(line) for line in lines if line.strip()]
    except (OSError, json.JSONDecodeError) as error:
        raise RuntimeError(f"cannot safely resume from {path}: {error}") from error


def _configuration(args: argparse.Namespace, jobs: list[Job]) -> dict[str, Any]:
    return {
        "min_period": args.min_period,
        "max_period": args.max_period,
        "min_point_slack": args.min_point_slack,
        "max_point_slack": args.max_point_slack,
        "queries": list(args.queries),
        "fixed_radius_cases": [
            "fixed" if fixed else "free" for fixed in args.fixed_radius_cases
        ],
        "timeout_ms": args.timeout_ms,
        "seed": args.seed,
        "max_circle_triple_constraints": args.max_circle_triple_constraints,
        "max_canonical_candidates": args.max_canonical_candidates,
        "job_keys": [job.key for job in jobs],
    }


def _configuration_hash(configuration: dict[str, Any]) -> str:
    encoded = json.dumps(configuration, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(encoded.encode()).hexdigest()


def _runtime_provenance() -> dict[str, str]:
    return {
        "python": platform.python_version(),
        "z3": z3.get_version_string(),
        "platform": platform.platform(),
        "host": socket.gethostname(),
    }


def _validate_provenance(value: Any, *, job_key: str) -> dict[str, str]:
    if not isinstance(value, dict) or set(value) != set(PROVENANCE_FIELDS):
        raise RuntimeError(f"invalid runtime provenance for {job_key}")
    if not all(isinstance(value[field], str) and value[field] for field in PROVENANCE_FIELDS):
        raise RuntimeError(f"invalid runtime provenance values for {job_key}")
    return value


def _bounded_factorial(value: int, limit: int) -> int:
    result = 1
    for factor in range(2, value + 1):
        result *= factor
        if result > limit:
            return limit + 1
    return result


def _resource_estimate(job: Job, canonical_limit: int) -> dict[str, int]:
    point_count = job.point_count
    if point_count < job.period + 2:
        return {
            "circle_triple_constraints": 0,
            "canonical_candidates": 0,
            "residual_point_count": max(0, point_count - job.period - 1),
        }
    circle_triples = (
        math.comb(point_count, 2) * math.comb(point_count - 2, 3)
        if point_count >= 5
        else 0
    )
    residual_count = max(0, point_count - job.period - 1)
    residual_permutations = _bounded_factorial(residual_count, canonical_limit)
    return {
        "circle_triple_constraints": circle_triples,
        "canonical_candidates": job.period * residual_permutations,
        "residual_point_count": residual_count,
    }


def _preflight(
    jobs: list[Job],
    *,
    max_circle_triple_constraints: int,
    max_canonical_candidates: int,
) -> dict[str, int]:
    if max_circle_triple_constraints <= 0 or max_canonical_candidates <= 0:
        raise RuntimeError("resource budgets must be positive")
    maxima = {
        "circle_triple_constraints": 0,
        "canonical_candidates": 0,
        "residual_point_count": 0,
    }
    rejected: list[tuple[Job, dict[str, int]]] = []
    factorial_limit = max_canonical_candidates
    for job in jobs:
        estimate = _resource_estimate(job, factorial_limit)
        for key in maxima:
            maxima[key] = max(maxima[key], estimate[key])
        if (
            estimate["circle_triple_constraints"] > max_circle_triple_constraints
            or estimate["canonical_candidates"] > max_canonical_candidates
        ):
            rejected.append((job, estimate))
    if rejected:
        samples = ", ".join(
            (
                f"{job.key}[circle={estimate['circle_triple_constraints']},"
                f"canonical={estimate['canonical_candidates']}]"
            )
            for job, estimate in rejected[:4]
        )
        raise RuntimeError(
            f"resource preflight rejected {len(rejected)} job(s): {samples}; "
            "raise the explicit resource budgets to proceed"
        )
    return maxima


def _solve_job(job: Job, timeout_ms: int, seed: int) -> dict[str, Any]:
    base = {
        "job_key": job.key,
        "period": job.period,
        "point_slack": job.point_slack,
        "point_count": job.point_count,
        "query": job.query,
        "fixed_apex_radius": job.fixed_apex_radius,
        "runtime_provenance": _runtime_provenance(),
    }
    try:
        outcome = solve_orbit(
            job.point_count,
            job.period,
            job.query,
            fixed_apex_radius=job.fixed_apex_radius,
            timeout_ms=timeout_ms,
            seed=seed,
        )
        if outcome["status"] == "SAT":
            model = outcome["model"]
            validate_orbit_model(model)
            return {
                **base,
                "status": SAT_STATUS,
                "_model": model,
                "_canonical_key": canonical_key(model),
            }
        if outcome["status"] == "UNSAT":
            return {**base, "status": UNSAT_STATUS}
        if outcome["status"] == "UNKNOWN":
            return {
                **base,
                "status": UNKNOWN_STATUS,
                "reason": outcome.get("reason", "solver_unknown"),
            }
        return {
            **base,
            "status": UNKNOWN_STATUS,
            "reason": f"unrecognized_solver_status:{outcome.get('status')!r}",
        }
    except Exception as error:  # fail closed and leave the job nonterminal
        return {
            **base,
            "status": UNKNOWN_STATUS,
            "reason": f"worker_exception:{type(error).__name__}:{error}",
        }


def _record_job(record: dict[str, Any]) -> Job:
    query = record.get("query")
    if query not in QUERY_ORDER:
        raise RuntimeError(f"invalid resumed query: {query!r}")
    fixed_apex_radius = record.get("fixed_apex_radius")
    if not isinstance(fixed_apex_radius, bool):
        raise RuntimeError(
            f"invalid resumed fixed-radius flag: {fixed_apex_radius!r}"
        )
    period = record.get("period")
    point_slack = record.get("point_slack")
    point_count = record.get("point_count")
    if (
        not isinstance(period, int)
        or isinstance(period, bool)
        or not isinstance(point_slack, int)
        or isinstance(point_slack, bool)
        or not isinstance(point_count, int)
        or isinstance(point_count, bool)
        or point_count != period + point_slack
    ):
        raise RuntimeError(f"invalid resumed result dimensions: {record!r}")
    return Job(
        period=period,
        point_slack=point_slack,
        query_rank=QUERY_ORDER[query],
        fixed_apex_radius=fixed_apex_radius,
    )


def _expected_base(job: Job) -> dict[str, Any]:
    return {
        "job_key": job.key,
        "period": job.period,
        "point_slack": job.point_slack,
        "point_count": job.point_count,
        "query": job.query,
        "fixed_apex_radius": job.fixed_apex_radius,
    }


def _validate_exact_base(record: dict[str, Any], job: Job) -> None:
    for field, expected in _expected_base(job).items():
        actual = record.get(field)
        if type(actual) is not type(expected) or actual != expected:
            raise RuntimeError(
                f"resumed base field mismatch for {job.key}: "
                f"{field}={actual!r}, expected {expected!r}"
            )


def _materialize(
    records_by_key: dict[str, dict[str, Any]],
) -> tuple[list[dict[str, Any]], list[dict[str, Any]]]:
    models: list[dict[str, Any]] = []
    model_indices: dict[tuple[Any, ...], int] = {}
    public_records: list[dict[str, Any]] = []
    for record in sorted(records_by_key.values(), key=_record_job):
        job = _record_job(record)
        _validate_exact_base(record, job)
        _validate_provenance(record.get("runtime_provenance"), job_key=job.key)
        if record.get("status") not in ALL_STATUSES:
            raise RuntimeError(f"invalid status for {job.key}: {record.get('status')!r}")
        public = {
            key: value
            for key, value in record.items()
            if key not in {"_model", "_canonical_key"}
        }
        if record["status"] == SAT_STATUS:
            model = record.get("_model")
            if not isinstance(model, dict):
                raise RuntimeError(f"SAT result lacks a model: {record['job_key']}")
            key = record.get("_canonical_key")
            if not isinstance(key, tuple):
                raise RuntimeError(
                    f"SAT result lacks a canonical key: {record['job_key']}"
                )
            if key not in model_indices:
                model_indices[key] = len(models)
                models.append(model)
            public["canonical_model_index"] = model_indices[key]
        public_records.append(public)
    return public_records, models


def _snapshot(
    output_dir: Path,
    records_by_key: dict[str, dict[str, Any]],
    *,
    configuration_hash: str,
    source_hashes: dict[str, str],
) -> tuple[list[dict[str, Any]], list[dict[str, Any]]]:
    public_records, models = _materialize(records_by_key)
    _atomic_jsonl(output_dir / "results.jsonl", public_records)
    _atomic_jsonl(output_dir / "models.jsonl", models)
    _atomic_json(
        output_dir / "checkpoint.json",
        {
            "schema_version": SCHEMA_VERSION,
            "configuration_hash": configuration_hash,
            "source_hashes": source_hashes,
            "recorded_jobs": [record["job_key"] for record in public_records],
            "terminal_jobs": [
                record["job_key"]
                for record in public_records
                if record["status"] in TERMINAL_STATUSES
            ],
            "unknown_jobs": [
                record["job_key"]
                for record in public_records
                if record["status"] == UNKNOWN_STATUS
            ],
            "model_count": len(models),
        },
    )
    return public_records, models


def _load_resume(
    output_dir: Path,
    *,
    jobs: list[Job],
    configuration_hash: str,
    source_hashes: dict[str, str],
) -> dict[str, dict[str, Any]]:
    checkpoint_path = output_dir / "checkpoint.json"
    results_path = output_dir / "results.jsonl"
    models_path = output_dir / "models.jsonl"
    artifacts_exist = [
        path.exists() for path in (checkpoint_path, results_path, models_path)
    ]
    if not any(artifacts_exist):
        return {}
    if not all(artifacts_exist):
        raise RuntimeError("incomplete resume artifacts; refusing to guess state")

    checkpoint = _read_json(checkpoint_path)
    if checkpoint.get("schema_version") != SCHEMA_VERSION:
        raise RuntimeError("resume checkpoint schema mismatch")
    if checkpoint.get("configuration_hash") != configuration_hash:
        raise RuntimeError("resume configuration mismatch")
    if checkpoint.get("source_hashes") != source_hashes:
        raise RuntimeError("resume source hash mismatch")

    allowed_jobs = {job.key: job for job in jobs}
    models = _read_jsonl(models_path)
    model_keys: list[tuple[Any, ...]] = []
    for model in models:
        validate_orbit_model(model)
        model_keys.append(canonical_key(model))
    public_records = _read_jsonl(results_path)
    records_by_key: dict[str, dict[str, Any]] = {}
    for public in public_records:
        job_key = public.get("job_key")
        if not isinstance(job_key, str) or job_key not in allowed_jobs:
            raise RuntimeError(f"resumed result is outside this sweep: {public!r}")
        job = allowed_jobs[job_key]
        _validate_exact_base(public, job)
        _record_job(public)
        _validate_provenance(public.get("runtime_provenance"), job_key=job.key)
        status = public.get("status")
        if status not in ALL_STATUSES:
            raise RuntimeError(f"invalid resumed status: {status!r}")
        if job.key in records_by_key:
            raise RuntimeError(f"duplicate resumed job: {job.key}")
        record = {
            key: value for key, value in public.items() if key != "canonical_model_index"
        }
        if status == SAT_STATUS:
            index = public.get("canonical_model_index")
            if not isinstance(index, int) or not 0 <= index < len(models):
                raise RuntimeError(f"invalid model index for {job.key}")
            model = models[index]
            if (
                model["period"] != job.period
                or model["point_count"] != job.point_count
                or model["query"] != job.query
                or ("fixed_apex_radius" in model["assumptions"])
                != job.fixed_apex_radius
            ):
                raise RuntimeError(f"model/result mismatch for {job.key}")
            record["_model"] = model
            record["_canonical_key"] = model_keys[index]
        records_by_key[job.key] = record

    recorded = [record["job_key"] for record in public_records]
    terminal = [
        record["job_key"]
        for record in public_records
        if record["status"] in TERMINAL_STATUSES
    ]
    unknown = [
        record["job_key"]
        for record in public_records
        if record["status"] == UNKNOWN_STATUS
    ]
    expected_checkpoint_fields = {
        "recorded_jobs": recorded,
        "terminal_jobs": terminal,
        "unknown_jobs": unknown,
        "model_count": len(models),
    }
    for field, expected in expected_checkpoint_fields.items():
        if checkpoint.get(field) != expected:
            raise RuntimeError(f"checkpoint/results disagreement in {field}")
    return records_by_key


def _aggregate_provenance(
    records: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    counts: dict[tuple[str, ...], int] = {}
    for record in records:
        provenance = _validate_provenance(
            record.get("runtime_provenance"), job_key=record["job_key"]
        )
        key = tuple(provenance[field] for field in PROVENANCE_FIELDS)
        counts[key] = counts.get(key, 0) + 1
    return [
        {
            **dict(zip(PROVENANCE_FIELDS, key, strict=True)),
            "job_count": count,
        }
        for key, count in sorted(counts.items())
    ]


def run(args: argparse.Namespace) -> dict[str, Any]:
    if args.workers <= 0 or args.checkpoint_every <= 0:
        raise RuntimeError("workers and checkpoint interval must be positive")
    jobs = build_jobs(
        min_period=args.min_period,
        max_period=args.max_period,
        min_point_slack=args.min_point_slack,
        max_point_slack=args.max_point_slack,
        queries=args.queries,
        fixed_radius_cases=args.fixed_radius_cases,
    )
    resource_maxima = _preflight(
        jobs,
        max_circle_triple_constraints=args.max_circle_triple_constraints,
        max_canonical_candidates=args.max_canonical_candidates,
    )
    configuration = _configuration(args, jobs)
    configuration_hash = _configuration_hash(configuration)
    source_hashes = _source_hashes()
    output_dir = args.output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)
    records_by_key = _load_resume(
        output_dir,
        jobs=jobs,
        configuration_hash=configuration_hash,
        source_hashes=source_hashes,
    )
    resumed_terminal_count = sum(
        record["status"] in TERMINAL_STATUSES for record in records_by_key.values()
    )
    pending = [
        job
        for job in jobs
        if records_by_key.get(job.key, {}).get("status") not in TERMINAL_STATUSES
    ]

    if pending:
        completed_this_invocation = 0
        with ProcessPoolExecutor(max_workers=args.workers) as executor:
            futures = {
                executor.submit(_solve_job, job, args.timeout_ms, args.seed): job
                for job in pending
            }
            for future in as_completed(futures):
                job = futures[future]
                try:
                    record = future.result()
                except Exception as error:
                    record = {
                        "job_key": job.key,
                        "period": job.period,
                        "point_slack": job.point_slack,
                        "point_count": job.point_count,
                        "query": job.query,
                        "fixed_apex_radius": job.fixed_apex_radius,
                        "runtime_provenance": _runtime_provenance(),
                        "status": UNKNOWN_STATUS,
                        "reason": (
                            f"process_exception:{type(error).__name__}:{error}"
                        ),
                    }
                records_by_key[job.key] = record
                completed_this_invocation += 1
                if completed_this_invocation % args.checkpoint_every == 0:
                    _snapshot(
                        output_dir,
                        records_by_key,
                        configuration_hash=configuration_hash,
                        source_hashes=source_hashes,
                    )

    public_records, models = _snapshot(
        output_dir,
        records_by_key,
        configuration_hash=configuration_hash,
        source_hashes=source_hashes,
    )
    status_counts = {
        status: sum(record["status"] == status for record in public_records)
        for status in sorted(ALL_STATUSES)
    }
    manifest = {
        "schema_version": SCHEMA_VERSION,
        "status": (
            "COMPLETE_DISCOVERY_SWEEP"
            if status_counts[UNKNOWN_STATUS] == 0
            and len(public_records) == len(jobs)
            else "PARTIAL_SOLVER_UNKNOWN"
        ),
        "trust_boundary": {
            SAT_STATUS: "solver-free validated equality-pattern shadow only",
            UNSAT_STATUS: "Z3 discovery evidence only; not proof-producing",
            UNKNOWN_STATUS: "nonterminal; retried on resume",
        },
        "configuration": configuration,
        "configuration_hash": configuration_hash,
        "source_hashes": source_hashes,
        "resource_preflight_maxima": resource_maxima,
        "runtime": {
            **_runtime_provenance(),
            "workers": args.workers,
        },
        "job_runtime_provenance": _aggregate_provenance(public_records),
        "job_count": len(jobs),
        "record_count": len(public_records),
        "attempted_this_invocation": len(pending),
        "resumed_terminal_count": resumed_terminal_count,
        "status_counts": status_counts,
        "model_count": len(models),
    }
    _atomic_json(output_dir / "manifest.json", manifest)
    return manifest


def _parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workers", type=int, default=max(1, os.cpu_count() or 1))
    parser.add_argument("--min-period", type=int, default=2)
    parser.add_argument("--max-period", type=int, default=12)
    parser.add_argument("--min-point-slack", type=int, default=1)
    parser.add_argument("--max-point-slack", type=int, default=6)
    parser.add_argument(
        "--query",
        dest="queries",
        action="append",
        choices=tuple(QUERY_ORDER),
    )
    parser.add_argument(
        "--fixed-radius-case",
        dest="radius_case_names",
        action="append",
        choices=("free", "fixed"),
    )
    parser.add_argument("--timeout-ms", type=int, default=20_000)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument(
        "--max-circle-triple-constraints",
        type=int,
        default=500_000,
        help="maximum estimated two-circle rigidity constraints in one job",
    )
    parser.add_argument(
        "--max-canonical-candidates",
        type=int,
        default=50_000,
        help="maximum period times residual factorial in one SAT job",
    )
    parser.add_argument(
        "--checkpoint-every",
        type=int,
        default=32,
        help="atomically snapshot after this many completed jobs",
    )
    parser.add_argument("--output-dir", type=Path, default=LANE / "out-parallel")
    args = parser.parse_args()
    if args.queries is None:
        args.queries = ["some_hit", "all_omission"]
    else:
        args.queries = sorted(set(args.queries), key=QUERY_ORDER.__getitem__)
    if args.radius_case_names is None:
        args.fixed_radius_cases = [False, True]
    else:
        args.fixed_radius_cases = sorted(
            {name == "fixed" for name in args.radius_case_names}
        )
    if (
        args.workers <= 0
        or args.min_period < 2
        or args.max_period < args.min_period
        or args.min_point_slack < 1
        or args.max_point_slack < args.min_point_slack
        or args.timeout_ms <= 0
        or args.max_circle_triple_constraints <= 0
        or args.max_canonical_candidates <= 0
        or args.checkpoint_every <= 0
    ):
        parser.error("invalid sweep bounds")
    return args


def main() -> int:
    manifest = run(_parse_args())
    print(
        manifest["status"],
        f"jobs={manifest['job_count']}",
        f"models={manifest['model_count']}",
        f"counts={json.dumps(manifest['status_counts'], sort_keys=True)}",
    )
    return 0 if manifest["status"] == "COMPLETE_DISCOVERY_SWEEP" else 2


if __name__ == "__main__":
    raise SystemExit(main())
