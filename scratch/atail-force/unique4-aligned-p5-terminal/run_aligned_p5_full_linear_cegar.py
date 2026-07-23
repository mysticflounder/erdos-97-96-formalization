#!/usr/bin/env python3
"""Audit the card-eleven aligned-p5 unique-four surface.

This is a theorem-discovery calculation, not a Lean proof.  It starts from
the existing fixed-n=11 source projection, replaces the exact-two overlay by
the source-valid aligned branch

* all three strict first-opposite-cap points lie in the exact first-apex class;
* the retained frontier pair is the late-selected strict pair; and
* the selected second-apex double-deletion row omits that pair,

then installs the checked own-cap, shell-curvature, and seeded Kalmanson
consumers.  Every Boolean survivor is checked against the full linear
triangle/Kalmanson system and refined by its exact order schema.

MEC membership and the alternative-support-triangle content of ``noM44`` are
still outside this finite projection.  A SAT result is therefore only a
source-faithful regression for the encoded fields.  An UNSAT result is exact
only for the generated CNF until the source-to-CNF and proof-replay bridges
are formalized.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
import time
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SEEDED_PATH = (
    HERE.parent / "unique4-star-producer" / "run_seeded_full_linear_cegar.py"
)
DEFAULT_SEED_BANK = (
    HERE.parent
    / "unique4-star-producer"
    / "kalmanson_row_instance_schemas_seeded_v3.json"
)


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


SEEDED = load_module("unique4_aligned_p5_seeded_base", SEEDED_PATH)
BASE = SEEDED.BASE


def add_aligned_p5_source_surface(cnf: Any, metadata: dict[str, Any]) -> dict[str, Any]:
    strict = tuple(map(int, metadata["first_opposite_strict"]))
    if len(strict) != 3 or int(metadata["opp1_card"]) != 5:
        raise ValueError("aligned p5 requires the (5,5,4) card-eleven profile")

    for point in strict:
        cnf.add("aligned_p5_all_three_strict_in_class", [cnf.ids[f"class_{point}"]])

    for point in range(int(metadata["n"])):
        for retained, interior in (("retained_q", "interior_q"), ("retained_w", "interior_w")):
            retained_var = cnf.ids[f"{retained}_{point}"]
            interior_var = cnf.ids[f"{interior}_{point}"]
            cnf.add(
                "aligned_p5_frontier_pair_eq_strict_pair",
                [-retained_var, interior_var],
            )
            cnf.add(
                "aligned_p5_frontier_pair_eq_strict_pair",
                [-interior_var, retained_var],
            )

    return {
        "aligned_p5_overlay": True,
        "aligned_p5_strict_points": list(strict),
        "aligned_p5_source_theorem": (
            "Problem97.ATailUniqueFourCardElevenLiftScratch."
            "CardElevenUniqueFourCoverage.alignedP5"
        ),
        "aligned_p5_pair_source": (
            "Problem97.ATailUniqueFourClassCapDistributionScratch."
            "AlignedInteriorFrontier.residual"
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--seed-bank", type=Path, default=DEFAULT_SEED_BANK)
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
    cnf, metadata = BASE.DIRECT.OUTER.encode(
        n,
        5,
        BASE.DIRECT.PLANAR_BANK,
        BASE.DIRECT.KALMANSON_BANK,
        BASE.DIRECT.U5_BANK,
        strict_cap_minimality_overlay=True,
        pair_minimality_overlay=True,
        exact_two_strict_hit_overlay=False,
    )
    aligned_overlay = add_aligned_p5_source_surface(cnf, metadata)
    own_cap_counts = BASE.OWN_CAP.add_own_cap_bounds(cnf, metadata)
    direct_overlay = BASE.DIRECT.add_direct_curvature_overlay(cnf, n)
    seed_records, seed_bank = SEEDED.load_seed_bank(args.seed_bank.resolve())
    seeded_cuts = SEEDED.add_seed_cuts(cnf, n, seed_records)

    payload: dict[str, Any] = {
        "schema": "p97-unique4-card11-aligned-p5-full-linear-cegar-v1",
        "epistemic_status": "EXACT WITHIN DOCUMENTED FINITE PROJECTION",
        "claim_scope": (
            "card-eleven aligned-p5 source projection with full equality "
            "partitions, global selected K4, fixed critical system, selected-row "
            "strong connectivity, two minimal-deletion prefixes, checked local "
            "banks, and exact full-linear Kalmanson/triangle closure"
        ),
        "n": n,
        "opp1_card": 5,
        "source_hashes": {
            str(path.resolve().relative_to(ROOT)): BASE.DIRECT.sha256(path)
            for path in (
                Path(__file__).resolve(),
                SEEDED_PATH,
                args.seed_bank.resolve(),
                BASE.DIRECT.OUTER_PATH,
                BASE.DIRECT.PLANAR_BANK,
                BASE.DIRECT.KALMANSON_BANK,
                BASE.DIRECT.U5_BANK,
            )
        },
        "aligned_overlay": aligned_overlay,
        "own_cap_clause_counts": own_cap_counts,
        "direct_curvature_overlay": direct_overlay,
        "seed_bank": seed_bank,
        "seeded_cuts": seeded_cuts,
        "refinements": [],
        "terminal_status": "RUNNING",
        "omitted_source_fields": [
            "coordinates and nonlinear Euclidean realization",
            "MEC membership and nonobtuse support-triangle geometry",
            "alternative-support-triangle content of noM44",
            "minimal-deletion outcome classification beyond both encoded common prefixes",
        ],
    }
    BASE.write_checkpoint(args.output, payload)
    seen: set[tuple[int, tuple[tuple[int, int], ...]]] = {
        (
            record["core_vertex_count"],
            tuple(tuple(pair) for pair in record["canonical_order_schema"]),
        )
        for record in seed_records
    }

    for attempt in range(1, args.max_refinements + 1):
        remaining = int(deadline - time.monotonic())
        if remaining <= 0:
            payload["terminal_status"] = "UNKNOWN_WALL_BUDGET"
            break
        round_metadata = {
            **metadata,
            **aligned_overlay,
            **own_cap_counts,
            **direct_overlay,
            "seeded_full_linear_cut_count": seeded_cuts["total_unique_cut_count"],
            "full_linear_refinement_count": len(payload["refinements"]),
            "final_variable_count": len(cnf.names) - 1,
            "final_clause_count": len(cnf.clauses),
        }
        cnf.write_dimacs(args.work_cnf, round_metadata)
        status, log = BASE.DIRECT.solve(
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
            payload["terminal_cnf_sha256"] = BASE.DIRECT.sha256(args.work_cnf)
            payload["terminal_solver_log_sha256"] = BASE.DIRECT.sha256(args.work_log)
            break

        assignment = BASE.DIRECT.parse_solver_assignment(log)
        decoded = BASE.DIRECT.OUTER.decode_sat(cnf, assignment, round_metadata)
        BASE.DIRECT.assert_sat_projection_has_no_terminal(decoded, n)
        BASE.OWN_CAP.assert_own_cap_bounds(decoded, metadata)
        rows = {
            int(center): tuple(sorted(map(int, support)))
            for center, support in decoded["rows"].items()
        }
        metric_status, centers, core_names, details = (
            BASE.FULL_LINEAR.CEGAR.metric_check(
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
        canonical, cut_count = BASE.add_schema_cuts(
            cnf, n, core_vertices, required
        )
        schema_key = (len(core_vertices), canonical)
        if schema_key in seen:
            raise AssertionError(
                "full-linear oracle rediscovered a seeded or refined schema"
            )
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
                "cnf_sha256_before_cut": BASE.DIRECT.sha256(args.work_cnf),
            }
        )
        payload["elapsed_seconds"] = time.monotonic() - started
        BASE.write_checkpoint(args.output, payload)
    else:
        payload["terminal_status"] = "UNKNOWN_REFINEMENT_BUDGET"

    payload["elapsed_seconds"] = time.monotonic() - started
    payload["refinement_count"] = len(payload["refinements"])
    payload["final_variable_count"] = len(cnf.names) - 1
    payload["final_clause_count"] = len(cnf.clauses)
    BASE.write_checkpoint(args.output, payload)
    print(
        json.dumps(
            {
                "terminal_status": payload["terminal_status"],
                "seed_cut_count": seeded_cuts["total_unique_cut_count"],
                "refinement_count": payload["refinement_count"],
                "elapsed_seconds": payload["elapsed_seconds"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
