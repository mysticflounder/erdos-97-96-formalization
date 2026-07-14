#!/usr/bin/env python3
"""Enumerate multiple exact metric cores from one saved CEGAR conflict.

This is a bounded analysis runner, not a producer proof.  It deterministically
reconstructs the full metric-row assignment for one saved round, then applies
the permanent MARCO map layer to that row universe.  Singular and msolve in
both variable orders must agree before a subset is classified.  Any timeout or
disagreement stops the enumeration fail-closed.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DEFAULT_INPUT = HERE / "checkpoint-round64.json"
DEFAULT_OUTPUT = HERE / "multi-core-bank.json"
SCHEMA = "p97-atail-second-center-multi-core-bank-v1"

for path in (str(ROOT), str(HERE)):
    if path not in sys.path:
        sys.path.insert(0, path)

import cegar  # noqa: E402
from census.atail_force.producer_mus import MarcoEnumerator  # noqa: E402


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _case_for_profile(
    checkpoint: Mapping[str, object], profile: tuple[int, int, int]
) -> Mapping[str, object]:
    for case in checkpoint["cases"]:
        if tuple(int(value) for value in case["profile"]) == profile:
            return case
    raise KeyError(profile)


def recover_round_rows(
    case: Mapping[str, object], round_index: int
) -> tuple[cegar.Problem, tuple[cegar.metric_oracle.MetricRow, ...]]:
    """Replay incidence only, checking every saved hash up to the target."""

    rounds = list(case["rounds"])
    if not 0 <= round_index < len(rounds):
        raise ValueError("round index is outside the saved case")
    problem = cegar.build_problem(case["seed"])
    bootstrap = tuple(
        cegar.decode_metric_row(str(value))
        for value in case["bootstrap_cut"]["rows"]
    )
    cuts: list[cegar.Cut] = [cegar.cut_from_rows(bootstrap)]
    for saved_round in rounds[: round_index + 1]:
        result = cegar.solve_incidence(problem, cuts)
        if result["status"] != "SAT":
            raise AssertionError("saved SAT round did not replay as SAT")
        rows = cegar.assignment_rows(result)
        cegar.validate_assignment(problem, rows, cuts)
        metrics = cegar.metric_rows(rows)
        if cegar.canonical_sha256(cegar.encode_metric_rows(metrics)) != str(
            saved_round["metric_rows_sha256"]
        ):
            raise AssertionError("saved metric-row hash drift")
        if int(saved_round["round"]) == round_index:
            return problem, metrics
        accepted = tuple(
            cegar.decode_metric_row(str(value))
            for value in saved_round["accepted_cut"]["rows"]
        )
        cuts.append(cegar.cut_from_rows(accepted))
    raise AssertionError("target round was not reached")


def build_document(
    checkpoint_path: Path,
    *,
    profile: tuple[int, int, int],
    round_index: int,
    max_oracle_calls: int,
    max_minimal_cores: int,
    max_map_iterations: int,
    per_solver_timeout_seconds: float = cegar.CAS_TIMEOUT_S,
    surface: str = "full",
) -> dict[str, Any]:
    checkpoint = json.loads(checkpoint_path.read_text(encoding="utf-8"))
    case = _case_for_profile(checkpoint, profile)
    if surface not in {"full", "accepted"}:
        raise ValueError("surface must be 'full' or 'accepted'")
    if surface == "full":
        problem, metrics = recover_round_rows(case, round_index)
    else:
        problem = cegar.build_problem(case["seed"])
        saved_round = case["rounds"][round_index]
        accepted = saved_round["accepted_cut"]
        if accepted["crosscheck"]["status"] != "CROSSCHECKED_UNIT":
            raise AssertionError("saved accepted surface is not cross-checked UNIT")
        metrics = tuple(
            cegar.decode_metric_row(str(value)) for value in accepted["rows"]
        )
    smoke = cegar.metric_oracle.smoke_gates()
    if not all(
        record["singular"]["verdict"] == record["expected"]
        and record["msolve"]["verdict"] == record["expected"]
        for record in smoke.values()
    ):
        raise RuntimeError("exact-oracle smoke gate failed")

    oracle_records: list[dict[str, Any]] = []

    def oracle(subset: frozenset[str]) -> str:
        rows = tuple(
            row for row in metrics if cegar.encode_metric_row(row) in subset
        )
        checked = cegar.exact_crosscheck(
            problem.frame.n, rows, timeout_s=per_solver_timeout_seconds
        )
        status = str(checked["status"])
        if status == "CROSSCHECKED_UNIT":
            verdict = "UNSAT"
        elif status == "CROSSCHECKED_NONUNIT":
            verdict = "SAT"
        else:
            verdict = "UNKNOWN"
        oracle_records.append(
            {
                "rows": cegar.encode_metric_rows(rows),
                "row_count": len(rows),
                "verdict": verdict,
                "crosscheck": cegar.crosscheck_summary(checked),
            }
        )
        return verdict

    universe = tuple(cegar.encode_metric_row(row) for row in metrics)
    result = MarcoEnumerator(
        universe,
        oracle,
        max_oracle_calls=max_oracle_calls,
        max_minimal_cores=max_minimal_cores,
        max_map_iterations=max_map_iterations,
    ).run()
    return {
        "schema": SCHEMA,
        "source": {
            "checkpoint": str(checkpoint_path.relative_to(ROOT)),
            "checkpoint_sha256": file_sha256(checkpoint_path),
            "profile": list(profile),
            "round": round_index,
            "surface": surface,
            "full_metric_rows": list(universe),
            "full_metric_rows_sha256": cegar.canonical_sha256(list(universe)),
        },
        "budgets": {
            "max_oracle_calls": max_oracle_calls,
            "max_minimal_cores": max_minimal_cores,
            "max_map_iterations": max_map_iterations,
            "per_solver_timeout_seconds": per_solver_timeout_seconds,
        },
        "smoke_gates": smoke,
        "result": {
            "status": result.status,
            "oracle_calls": result.oracle_calls,
            "cache_hits": result.cache_hits,
            "map_iterations": result.map_iterations,
            "unknown_subset": (
                list(result.unknown_subset)
                if result.unknown_subset is not None
                else None
            ),
            "minimal_cores": [
                {
                    "discovery_index": core.discovery_index,
                    "rows": list(core.atoms),
                    "row_count": len(core.atoms),
                }
                for core in result.minimal_cores
            ],
        },
        "oracle_records": oracle_records,
        "scope": {
            "target_faithful": False,
            "fixed_placement_finite_shadow_only": True,
            "solver_output_is_not_a_lean_producer": True,
            "unknown_is_fail_closed": True,
            "cores_require_separate_bank_or_lean_consumer_check": True,
        },
    }


def parse_profile(value: str) -> tuple[int, int, int]:
    parts = tuple(int(part) for part in value.split(","))
    if len(parts) != 3:
        raise argparse.ArgumentTypeError("profile must have three comma-separated values")
    return parts


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--profile", type=parse_profile, default=(4, 5, 6))
    parser.add_argument("--round", type=int, default=0)
    parser.add_argument("--surface", choices=("full", "accepted"), default="full")
    parser.add_argument("--max-oracle-calls", type=int, default=36)
    parser.add_argument("--max-minimal-cores", type=int, default=4)
    parser.add_argument("--max-map-iterations", type=int, default=128)
    parser.add_argument(
        "--per-solver-timeout-seconds", type=float, default=cegar.CAS_TIMEOUT_S
    )
    args = parser.parse_args()
    document = build_document(
        args.input,
        profile=args.profile,
        round_index=args.round,
        max_oracle_calls=args.max_oracle_calls,
        max_minimal_cores=args.max_minimal_cores,
        max_map_iterations=args.max_map_iterations,
        per_solver_timeout_seconds=args.per_solver_timeout_seconds,
        surface=args.surface,
    )
    args.output.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(document["result"], sort_keys=True))


if __name__ == "__main__":
    main()
