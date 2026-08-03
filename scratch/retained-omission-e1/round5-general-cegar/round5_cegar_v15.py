#!/usr/bin/env python3
"""Round-5 v15: v14 plus nonapex global-K4 superadditivity.

For every nonapex carrier center, the four support points of its global K4
witness lie on one circle.  In angular order around that extreme carrier,
each supported triple therefore satisfies the same strict squared-distance
superadditivity already used for rich shells.  Margin one is sound by the
same homogeneous rescaling of the independent squared-distance relaxation.

Apex global K4 witnesses are deliberately not repeated: v13 projects them
into the rich shells whose superadditivity constraints are already inherited
from v8.  This remains external exact-n15 evidence, not a Lean proof or a
universal closure result.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import contextlib
import hashlib
import itertools
import json
import sys
import time
from collections import Counter
from dataclasses import asdict
from pathlib import Path
from typing import Sequence

import z3

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v14 as v14


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = v8.PROJECT_ROOT
TARGET = v8.TARGET
SCHEMA_VERSION = 15
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v15.json"
UV_LOCK_PATH = HERE / "uv.lock"
SAME_SHELL_SUPERADDITIVITY_PATH = (
    PROJECT_ROOT / "lean/Erdos9796Proof/P97/SameShellSuperadditivity.lean"
)
Case = v8.Case

_BASE_V14_SOURCE_CONTRACT = v14.source_contract


class Encoding(v14.Encoding):
    """The exact v14 encoding with nonapex global-K4 superadditivity."""

    def _build(self) -> None:
        super()._build()
        self._build_nonapex_global_k4_squared_superadditivity()

    def _build_nonapex_global_k4_squared_superadditivity(self) -> None:
        family = "nonapex_global_k4_squared_superadditivity"
        for center in v8.NONAPICES:
            angular_order = self._angular_order_from(center)
            for x, y, z in itertools.combinations(angular_order, 3):
                self.add(
                    family,
                    z3.Implies(
                        z3.And(
                            self.k4[center, x],
                            self.k4[center, y],
                            self.k4[center, z],
                        ),
                        self.s(x, z) >= self.s(x, y) + self.s(y, z) + 1,
                    ),
                )


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_contract() -> dict[str, object]:
    contract = _BASE_V14_SOURCE_CONTRACT()
    files = dict(contract["files"])
    files["same_shell_superadditivity"] = {
        "path": str(SAME_SHELL_SUPERADDITIVITY_PATH.relative_to(PROJECT_ROOT)),
        "sha256": file_sha256(SAME_SHELL_SUPERADDITIVITY_PATH),
    }
    role_map = dict(contract["role_map"])
    role_map["rich_apex_exclusion"] = str(role_map["rich_apex_exclusion"]).replace(
        "schema v14", "schema v15"
    )
    role_map["boolean_prepass"] = (
        "v12 Boolean-only assertion relaxation with the inherited v13/v14 "
        "Boolean projections; the v15 Real-valued superadditivity family is "
        "deliberately excluded"
    )
    role_map["nonapex_global_k4_squared_superadditivity"] = (
        "for each nonapex global K4 and angularly ordered supported triple, "
        "Problem97.CGN.sameShell_sqDist_superadditive_of_strictCapOrder; its "
        "minimal opposite-sides metric kernel is "
        "Problem97.dist_sq_gt_add_of_same_shell_opposite_sides"
    )
    contract["files"] = files
    contract["role_map"] = role_map
    return contract


def provenance() -> dict[str, object]:
    return {
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "base_v14_script_sha256": file_sha256(HERE / "round5_cegar_v14.py"),
        "base_v13_script_sha256": file_sha256(HERE / "round5_cegar_v13.py"),
        "base_v12_script_sha256": file_sha256(HERE / "round5_cegar_v12.py"),
        "base_v8_script_sha256": file_sha256(HERE / "round5_cegar_v8.py"),
        "miner_v9_script_sha256": file_sha256(HERE / "round5_cegar_v9.py"),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "uv_lock_sha256": file_sha256(UV_LOCK_PATH),
        "source_contract": source_contract(),
    }


def _configure_v12_runtime() -> None:
    """Bind the audited v12 execution engine to v15."""
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


def _worker(payload: tuple[dict[str, object], dict[str, object]]) -> dict[str, object]:
    data, frozen = payload
    local = dict(data)
    case = Case(**local.pop("case"))
    return solve_case(case, frozen_provenance=frozen, **local)


def _args_budgets(args: argparse.Namespace) -> dict[str, dict[str, int]]:
    return v12.resolved_budgets(
        args.timeout_ms, args.max_power_candidates, args.max_power_cuts,
        args.bool_timeout_ms, args.max_bool_power_candidates,
        args.max_bool_power_cuts,
    )


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


def parser() -> argparse.ArgumentParser:
    parser = v14.parser()
    parser.description = __doc__
    for action in parser._actions:
        if isinstance(action, argparse._SubParsersAction):
            for subparser in action.choices.values():
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = HERE / "artifacts-v15"
    return parser


def main() -> int:
    args = parser().parse_args()
    if args.command == "matrix":
        return run_matrix(args, v8.all_cases(), "matrix")
    if args.command == "secondcap-matrix":
        return run_matrix(args, v8.all_secondcap_endpoint_cases(), "secondcap-matrix")
    if args.command == "smoke":
        args.workers = 1
        return run_matrix(args, [Case("paired", "SSS", 0, 1, None)], "smoke")
    if args.command == "case":
        args.workers = 1
        case = Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
        return run_matrix(args, [case], "case")
    if args.command == "retry":
        prior, source_hash = v12.load_authenticated_v8_summary(args.summary)
        statuses = {"unknown"}
        if args.include_error:
            statuses.add("error")
        requested = {
            str(item["case_id"]) for item in prior.get("results", [])
            if item.get("status") in statuses
        }
        universe = {
            case.case_id: case
            for case in (*v8.all_cases(), *v8.all_secondcap_endpoint_cases())
        }
        missing = sorted(requested - universe.keys())
        if missing:
            raise SystemExit(f"summary contains unknown case ids: {missing}")
        cases = [universe[case_id] for case_id in sorted(requested)]
        if not cases:
            raise SystemExit(f"no cases with statuses {sorted(statuses)}")
        return run_matrix(args, cases, "retry", args.summary, source_hash)
    raise AssertionError(args.command)


if __name__ == "__main__":
    raise SystemExit(main())
