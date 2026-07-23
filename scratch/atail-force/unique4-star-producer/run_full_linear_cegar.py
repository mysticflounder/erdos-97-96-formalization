#!/usr/bin/env python3
"""Full-linear Kalmanson CEGAR for the corrected unique-four projection.

The Boolean outer contains the complete source projection, displayed-cap
own-row bounds, and the static no-four-curvature-terminal overlay.  Every SAT
row table is then checked against positivity, every strict Kalmanson
inequality, all triangle inequalities, and all selected-row equalities.  An
infeasible table contributes its fully tracked order schema, transported over
all order-preserving and reflected injections.

This is fixed-cardinality theorem discovery.  Neither Boolean exhaustion nor
a surviving abstract distance table is by itself a Lean proof or Euclidean
realization.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import sys
import time
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OWN_CAP_RUNNER_PATH = HERE / "run_direct_overlay_with_own_cap.py"
FULL_LINEAR_PATH = (
    HERE.parent / "whole-carrier-ordinal-coverage" / "full_linear_replay.py"
)


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


OWN_CAP = load_module("unique4_star_owncap_runner", OWN_CAP_RUNNER_PATH)
DIRECT = OWN_CAP.DIRECT
FULL_LINEAR = load_module("unique4_star_cegar_full_linear", FULL_LINEAR_PATH)


def write_checkpoint(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


def add_schema_cuts(
    cnf: Any,
    n: int,
    core_vertices: tuple[int, ...],
    required_memberships: tuple[tuple[int, int], ...],
) -> tuple[tuple[tuple[int, int], ...], int]:
    role = {vertex: index for index, vertex in enumerate(core_vertices)}
    order_schema = tuple(
        sorted((role[center], role[point]) for center, point in required_memberships)
    )
    reflected = tuple(
        sorted(
            (
                len(core_vertices) - 1 - center,
                len(core_vertices) - 1 - point,
            )
            for center, point in order_schema
        )
    )
    canonical = min(order_schema, reflected)
    count = 0
    for targets in itertools.combinations(range(n), len(core_vertices)):
        for schema in {order_schema, reflected}:
            transformed = tuple(
                sorted((targets[center], targets[point]) for center, point in schema)
            )
            cnf.add(
                "full_linear_kalmanson_cegar_cut",
                [-cnf.ids[f"m_{center}_{point}"] for center, point in transformed],
            )
            count += 1
    return canonical, count


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--opp1-card", required=True, type=int, choices=(4, 5))
    parser.add_argument("--work-cnf", required=True, type=Path)
    parser.add_argument("--work-log", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--wall-seconds", type=int, default=3600)
    parser.add_argument("--solver-timeout-seconds", type=int, default=900)
    parser.add_argument("--metric-timeout-ms", type=int, default=120_000)
    parser.add_argument("--max-refinements", type=int, default=1000)
    args = parser.parse_args()

    n = 11
    started = time.monotonic()
    deadline = started + args.wall_seconds
    cnf, metadata = DIRECT.OUTER.encode(
        n,
        args.opp1_card,
        DIRECT.PLANAR_BANK,
        DIRECT.KALMANSON_BANK,
        DIRECT.U5_BANK,
        strict_cap_minimality_overlay=True,
        pair_minimality_overlay=False,
        exact_two_strict_hit_overlay=True,
    )
    own_cap_counts = OWN_CAP.add_own_cap_bounds(cnf, metadata)
    direct_overlay = DIRECT.add_direct_curvature_overlay(cnf, n)
    source_hashes = {
        str(path.relative_to(ROOT)): DIRECT.sha256(path)
        for path in (
            Path(__file__).resolve(),
            OWN_CAP_RUNNER_PATH,
            FULL_LINEAR_PATH,
            DIRECT.DIRECT_PATH if hasattr(DIRECT, "DIRECT_PATH") else Path(
                DIRECT.__file__
            ),
            DIRECT.OUTER_PATH,
            DIRECT.PLANAR_BANK,
            DIRECT.KALMANSON_BANK,
            DIRECT.U5_BANK,
        )
    }
    payload: dict[str, Any] = {
        "schema": "p97-unique4-owncap-curvature-full-linear-cegar-v1",
        "epistemic_status": "BOUNDED THEOREM DISCOVERY; NOT A LEAN PROOF",
        "claim_scope": (
            "fixed n=11 corrected finite projection plus exact full-linear "
            "Kalmanson/triangle oracle"
        ),
        "opp1_card": args.opp1_card,
        "n": n,
        "source_hashes": source_hashes,
        "own_cap_clause_counts": own_cap_counts,
        "direct_curvature_overlay": direct_overlay,
        "refinements": [],
        "terminal_status": "RUNNING",
    }
    seen: set[tuple[int, tuple[tuple[int, int], ...]]] = set()

    for attempt in range(1, args.max_refinements + 1):
        remaining = int(deadline - time.monotonic())
        if remaining <= 0:
            payload["terminal_status"] = "UNKNOWN_WALL_BUDGET"
            break
        round_metadata = {
            **metadata,
            **own_cap_counts,
            **direct_overlay,
            "full_linear_refinement_count": len(payload["refinements"]),
            "final_variable_count": len(cnf.names) - 1,
            "final_clause_count": len(cnf.clauses),
        }
        cnf.write_dimacs(args.work_cnf, round_metadata)
        status, log = DIRECT.solve(
            args.work_cnf,
            min(args.solver_timeout_seconds, remaining),
            "cadical",
            None,
        )
        args.work_log.write_text(log, encoding="utf-8")
        if status != "SAT":
            payload["terminal_status"] = (
                "BOOLEAN_UNSAT_PENDING_PROOF_REPLAY"
                if status == "UNSAT"
                else "UNKNOWN_BOOLEAN_SOLVER"
            )
            payload["terminal_cnf_sha256"] = DIRECT.sha256(args.work_cnf)
            payload["terminal_solver_log_sha256"] = DIRECT.sha256(args.work_log)
            break

        assignment = DIRECT.parse_solver_assignment(log)
        decoded = DIRECT.OUTER.decode_sat(cnf, assignment, round_metadata)
        DIRECT.assert_sat_projection_has_no_terminal(decoded, n)
        OWN_CAP.assert_own_cap_bounds(decoded, metadata)
        rows = {
            int(center): tuple(sorted(map(int, support)))
            for center, support in decoded["rows"].items()
        }
        metric_status, centers, core_names, details = (
            FULL_LINEAR.CEGAR.metric_check(
                rows,
                n,
                args.metric_timeout_ms,
                deadline,
            )
        )
        if metric_status == z3.sat:
            payload["terminal_status"] = "SAT_VERIFIED_FULL_LINEAR_SHADOW"
            payload["terminal_decoded"] = decoded
            payload["terminal_distance_model"] = details
            break
        if metric_status == z3.unknown:
            payload["terminal_status"] = "UNKNOWN_FULL_LINEAR_ORACLE"
            payload["reason_unknown"] = str(details)
            break

        core_vertices = tuple(map(int, details["core_vertices"]))
        required = tuple(
            tuple(map(int, pair)) for pair in details["required_memberships"]
        )
        canonical, cut_count = add_schema_cuts(cnf, n, core_vertices, required)
        schema_key = (len(core_vertices), canonical)
        if schema_key in seen:
            raise AssertionError("full-linear oracle rediscovered a banked schema")
        seen.add(schema_key)
        payload["refinements"].append(
            {
                "attempt": attempt,
                "dependency_centers": list(centers),
                "metric_core": list(core_names),
                "constraint_kinds": list(details["constraint_kinds"]),
                "core_vertices": list(core_vertices),
                "required_memberships": [list(pair) for pair in required],
                "canonical_order_schema": [list(pair) for pair in canonical],
                "order_embedding_cut_count": cut_count,
                "cnf_sha256_before_cut": DIRECT.sha256(args.work_cnf),
            }
        )
        payload["elapsed_seconds"] = time.monotonic() - started
        write_checkpoint(args.output, payload)
    else:
        payload["terminal_status"] = "UNKNOWN_REFINEMENT_BUDGET"

    payload["elapsed_seconds"] = time.monotonic() - started
    payload["refinement_count"] = len(payload["refinements"])
    payload["final_variable_count"] = len(cnf.names) - 1
    payload["final_clause_count"] = len(cnf.clauses)
    write_checkpoint(args.output, payload)
    print(
        json.dumps(
            {
                "opp1_card": args.opp1_card,
                "terminal_status": payload["terminal_status"],
                "refinement_count": payload["refinement_count"],
                "elapsed_seconds": payload["elapsed_seconds"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
