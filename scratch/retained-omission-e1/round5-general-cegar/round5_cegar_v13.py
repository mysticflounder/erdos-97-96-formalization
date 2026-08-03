#!/usr/bin/env python3
"""Round-5 v13: v12 plus Boolean-visible apex K4/profile compatibility.

At exact n=15 every rich apex has either one exact six-shell (profile S) or
two disjoint exact four-shells (profile D), and v8 already rules out an unnamed
third K4 radius.  Consequently the arbitrary global K4 witness at that apex is
a four-subset of the S shell, or is exactly one of the two D shells.  V13 adds
this already-implied fact explicitly so that v12's Boolean relaxation retains
it before the Real distance equalities are discarded.

This remains an external exact-n15 experiment, not a universal Lean closure.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import contextlib
import hashlib
import json
import sys
import time
from collections import Counter
from dataclasses import asdict
from pathlib import Path
from typing import Sequence

import z3

import round5_cegar_v8 as v8
import round5_cegar_v9 as v9
import round5_cegar_v12 as v12


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = HERE.parents[2]
TARGET = v8.TARGET
SCHEMA_VERSION = 13
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v13.json"
UV_LOCK_PATH = HERE / "uv.lock"
Case = v8.Case

_BASE_V12_SOURCE_CONTRACT = v12.source_contract


def z3_and(bits):
    values = list(bits)
    return z3.And(*values) if values else z3.BoolVal(True)


class Encoding(v8.Encoding):
    """The exact v8 encoding with one redundant Boolean projection."""

    def _build(self) -> None:
        super()._build()
        self._build_apex_global_k4_profile_compatibility()

    def _build_apex_global_k4_profile_compatibility(self) -> None:
        family = "apex_global_k4_profile_compatibility"
        for apex_index, (apex, profile) in enumerate(
            zip(v8.APICES, self.case.profiles, strict=True)
        ):
            global_support = [self.k4[apex, point] for point in v8.POINTS]
            first = self.rich[apex_index, 0]["support"]
            if profile == "S":
                self.add(
                    family,
                    *(z3.Implies(global_support[point], first[point])
                      for point in v8.POINTS),
                )
                continue
            second = self.rich[apex_index, 1]["support"]
            equals_first = z3_and(
                global_support[point] == first[point] for point in v8.POINTS
            )
            equals_second = z3_and(
                global_support[point] == second[point] for point in v8.POINTS
            )
            self.add(family, z3.Or(equals_first, equals_second))


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_contract() -> dict[str, object]:
    contract = _BASE_V12_SOURCE_CONTRACT()
    role_map = dict(contract["role_map"])
    role_map["rich_apex_exclusion"] = str(role_map["rich_apex_exclusion"]).replace(
        "schema v12", "schema v13"
    )
    role_map["boolean_prepass"] = (
        "v12 Boolean-only assertion relaxation, augmented by the exact-n15 "
        "apex global-K4/profile compatibility consequence"
    )
    role_map["apex_global_k4_profile_compatibility"] = (
        "at an S apex global K4 is contained in the exact six-shell; at a D "
        "apex it equals one of the two disjoint exact four-shells"
    )
    contract["role_map"] = role_map
    return contract


def provenance() -> dict[str, object]:
    return {
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "base_v8_script_sha256": file_sha256(HERE / "round5_cegar_v8.py"),
        "base_v12_script_sha256": file_sha256(HERE / "round5_cegar_v12.py"),
        "miner_v9_script_sha256": file_sha256(HERE / "round5_cegar_v9.py"),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "uv_lock_sha256": file_sha256(UV_LOCK_PATH),
        "source_contract": source_contract(),
    }


def _configure_v12_runtime() -> None:
    """Bind the audited v12 engine to v13 in parent and spawned workers."""
    v12.SCHEMA_VERSION = SCHEMA_VERSION
    v12.SCRIPT_PATH = SCRIPT_PATH
    v12.SCHEMA_PATH = SCHEMA_PATH
    v12.Encoding = Encoding
    v12.source_contract = source_contract
    v12.provenance = provenance


@contextlib.contextmanager
def _bound_v12_runtime():
    names = (
        "SCHEMA_VERSION", "SCRIPT_PATH", "SCHEMA_PATH", "Encoding",
        "source_contract", "provenance",
    )
    previous = {name: getattr(v12, name) for name in names}
    _configure_v12_runtime()
    try:
        yield
    finally:
        for name, value in previous.items():
            setattr(v12, name, value)


def solve_case(*args, **kwargs) -> dict[str, object]:
    with _bound_v12_runtime():
        return v12.solve_case(*args, **kwargs)


def _case_from_args(args: argparse.Namespace) -> Case:
    return Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)


def _solve_args(
    args: argparse.Namespace, case: Case, run_dir: Path, frozen: dict[str, object]
) -> dict[str, object]:
    return solve_case(
        case, args.timeout_ms, run_dir, args.seed, args.max_power_cuts,
        args.max_power_candidates, args.bool_timeout_ms, args.max_bool_power_cuts,
        args.max_bool_power_candidates, str(frozen["script_sha256"]), frozen,
    )


def _args_budgets(args: argparse.Namespace) -> dict[str, dict[str, int]]:
    return v12.resolved_budgets(
        args.timeout_ms, args.max_power_candidates, args.max_power_cuts,
        args.bool_timeout_ms, args.max_bool_power_candidates,
        args.max_bool_power_cuts,
    )


def command_case(args: argparse.Namespace) -> int:
    run_dir = v8.make_run_dir(args.artifacts, "case")
    frozen = provenance()
    v12.write_json(run_dir / "invocation.json", {
        **frozen, "argv": sys.argv, "case_count": 1,
        "resolved_budgets": _args_budgets(args),
    })
    result = _solve_args(args, _case_from_args(args), run_dir, frozen)
    print(json.dumps({"status": result["status"], "case_id": result["case_id"], "run_dir": str(run_dir)}, sort_keys=True))
    return 0 if result["status"] in {"sat", "unsat", "unknown"} else 1


def command_smoke(args: argparse.Namespace) -> int:
    run_dir = v8.make_run_dir(args.artifacts, "smoke")
    frozen = provenance()
    v12.write_json(run_dir / "invocation.json", {
        **frozen, "argv": sys.argv, "case_count": 1,
        "resolved_budgets": _args_budgets(args),
    })
    result = _solve_args(args, Case("paired", "SSS", 0, 1, None), run_dir, frozen)
    print(json.dumps({"status": result["status"], "case_id": result["case_id"], "run_dir": str(run_dir)}, sort_keys=True))
    return 0 if result["status"] in {"sat", "unsat", "unknown"} else 1


def _worker(payload: tuple[dict[str, object], dict[str, object]]) -> dict[str, object]:
    data, frozen = payload
    local = dict(data)
    case = Case(**local.pop("case"))
    return solve_case(case, frozen_provenance=frozen, **local)


def run_matrix(
    args: argparse.Namespace,
    cases: Sequence[Case],
    command: str,
    source_summary: Path | None = None,
    source_summary_sha256: str | None = None,
) -> int:
    started = time.monotonic()
    if not 1 <= args.workers <= 24:
        raise ValueError("workers must be in the closed interval 1..24")
    if (source_summary is None) != (source_summary_sha256 is None):
        raise ValueError("retry source path and authenticated byte hash must be paired")
    run_dir = v8.make_run_dir(args.artifacts, command)
    frozen = provenance()
    invocation = {
        **frozen, "argv": sys.argv, "case_count": len(cases), "workers": args.workers,
        "resolved_budgets": _args_budgets(args),
        "source_summary": str(source_summary) if source_summary else None,
        "source_summary_sha256": source_summary_sha256,
    }
    v12.write_json(run_dir / "invocation.json", invocation)
    payloads = [({
        "case": asdict(case), "timeout_ms": args.timeout_ms, "out_dir": run_dir,
        "seed": args.seed + index, "max_power_cuts": args.max_power_cuts,
        "max_power_candidates": args.max_power_candidates,
        "bool_timeout_ms": args.bool_timeout_ms,
        "max_bool_power_cuts": args.max_bool_power_cuts,
        "max_bool_power_candidates": args.max_bool_power_candidates,
        "expected_script_sha256": str(frozen["script_sha256"]),
    }, frozen) for index, case in enumerate(cases)]
    with concurrent.futures.ProcessPoolExecutor(max_workers=args.workers) as pool:
        results = list(pool.map(_worker, payloads))
    counts = Counter(str(result["status"]) for result in results)
    complete = v12.matrix_is_complete(cases, results)
    summary = {
        **invocation, "command": command,
        "elapsed_seconds": time.monotonic() - started,
        "counts": dict(sorted(counts.items())), "complete": complete,
        "full_encoding_sha256_by_case": {
            str(result["case_id"]): result.get("full_encoding_sha256")
            for result in sorted(results, key=lambda item: str(item["case_id"]))
        },
        "results": results,
    }
    v12.write_json(run_dir / "summary.json", summary)
    print(json.dumps({"counts": summary["counts"], "run_dir": str(run_dir)}, sort_keys=True))
    return 0 if complete else 2


def command_matrix(args: argparse.Namespace) -> int:
    return run_matrix(args, v8.all_cases(), "matrix")


def command_secondcap_matrix(args: argparse.Namespace) -> int:
    return run_matrix(args, v8.all_secondcap_endpoint_cases(), "secondcap-matrix")


def command_retry(args: argparse.Namespace) -> int:
    try:
        prior, source_hash = v12.load_authenticated_v8_summary(args.summary)
    except ValueError as exc:
        raise SystemExit(str(exc)) from exc
    statuses = {"unknown"}
    if args.include_error:
        statuses.add("error")
    requested = {
        str(item["case_id"]) for item in prior.get("results", [])
        if item.get("status") in statuses
    }
    universe = [*v8.all_cases(), *v8.all_secondcap_endpoint_cases()]
    cases_by_id = {case.case_id: case for case in universe}
    missing = sorted(requested - cases_by_id.keys())
    if missing:
        raise SystemExit(f"summary contains unknown case ids: {missing}")
    cases = [cases_by_id[case_id] for case_id in sorted(requested)]
    if not cases:
        raise SystemExit(f"no cases with statuses {sorted(statuses)}")
    return run_matrix(args, cases, "retry", args.summary, source_hash)


def bounded_workers(value: str) -> int:
    workers = int(value)
    if not 1 <= workers <= 24:
        raise argparse.ArgumentTypeError("workers must be in the closed interval 1..24")
    return workers


def parser() -> argparse.ArgumentParser:
    common = argparse.ArgumentParser(add_help=False)
    common.add_argument("--timeout-ms", type=int, default=300_000)
    common.add_argument("--bool-timeout-ms", type=int, default=30_000)
    common.add_argument("--seed", type=int, default=97)
    common.add_argument("--max-power-cuts", type=int, default=256)
    common.add_argument("--max-power-candidates", type=int, default=2_000_000)
    common.add_argument("--max-bool-power-cuts", type=int, default=256)
    common.add_argument("--max-bool-power-candidates", type=int, default=2_000_000)
    common.add_argument("--artifacts", type=Path, default=HERE / "artifacts-v13")
    top = argparse.ArgumentParser(description=__doc__)
    sub = top.add_subparsers(dest="command", required=True)
    sub.add_parser("smoke", parents=[common]).set_defaults(func=command_smoke)
    one = sub.add_parser("case", parents=[common])
    one.add_argument("--arm", choices=("paired", "fresh", "secondcap_collision", "secondcap_distinct"), required=True)
    one.add_argument("--profiles", required=True)
    one.add_argument("--kept", type=int, required=True)
    one.add_argument("--deleted", type=int, required=True)
    one.add_argument("--fresh", type=int)
    one.set_defaults(func=command_case)
    matrix = sub.add_parser("matrix", parents=[common])
    matrix.add_argument("--workers", type=bounded_workers, default=12)
    matrix.set_defaults(func=command_matrix)
    second = sub.add_parser("secondcap-matrix", parents=[common])
    second.add_argument("--workers", type=bounded_workers, default=12)
    second.set_defaults(func=command_secondcap_matrix)
    retry = sub.add_parser("retry", parents=[common])
    retry.add_argument("--summary", type=Path, required=True)
    retry.add_argument("--workers", type=bounded_workers, default=12)
    retry.add_argument("--include-error", action="store_true")
    retry.set_defaults(func=command_retry)
    return top


def main() -> int:
    args = parser().parse_args()
    return args.func(args)


if __name__ == "__main__":
    raise SystemExit(main())
