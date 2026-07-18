#!/usr/bin/env python3
"""Replay an interrupted CEGAR structural sequence and persist its next leaf.

This deliberately adds the recorded local cuts one at a time, with a structural
``check`` before each addition.  Loading the whole local bank at initialization
does not preserve Z3's incremental search state and can select a different leaf.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
sys.path.insert(0, str(LANE))

import exact_cegar as cegar  # noqa: E402
import integrated_milp as integrated  # noqa: E402
from verify_results import QuietLog  # noqa: E402


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", required=True)
    parser.add_argument("--local-bank", required=True, type=Path)
    parser.add_argument("--global-bank", required=True, type=Path)
    parser.add_argument("--seed", action="append", default=[], type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--progress-every", type=int, default=100)
    parser.add_argument("--recompute-metric-each", action="store_true")
    parser.add_argument("--cut-prefix", type=int)
    args = parser.parse_args()

    module = integrated.load_encoder()
    encoder = integrated.build_structural_outer(module, args.orbit, QuietLog())
    variables = [z3.Bool(f"b_{index}") for index in range(1, encoder.v.count + 1)]
    structural = z3.Solver()
    for clause in encoder.cnf.clauses:
        cegar.add_clause_to_z3(structural, variables, clause)

    for path in args.seed:
        artifact = json.loads(path.read_text(encoding="utf-8"))
        clause = cegar.seed_clause(encoder, artifact)
        cegar.add_clause_to_z3(structural, variables, clause)

    global_cuts = cegar.load_cuts(args.global_bank)
    for cut in global_cuts:
        cegar.add_clause_to_z3(structural, variables, cegar.cut_clause(encoder, cut))

    complete_local_cuts = cegar.load_cuts(args.local_bank)
    local_cuts = (
        complete_local_cuts[: args.cut_prefix]
        if args.cut_prefix is not None
        else complete_local_cuts
    )
    recomputed_clause_matches = 0
    recomputed_clause_mismatches = 0
    for index, cut in enumerate(local_cuts, start=1):
        status = structural.check()
        if status != z3.sat:
            raise SystemExit(f"structural replay stopped before cut {index}: {status}")
        if args.recompute_metric_each:
            decoded = cegar.decode_assignment(module, encoder, structural.model(), variables)
            replayed = cegar.exact_metric_check(
                module,
                decoded,
                f"{args.orbit}-replay-{index:05d}",
                distance_lower_bound=0,
            )
            if replayed["status"] != "UNSAT":
                raise SystemExit(
                    f"recorded cut {index} follows replay status {replayed['status']}"
                )
            if set(cegar.cut_clause(encoder, replayed["cut"])) == set(
                cegar.cut_clause(encoder, cut)
            ):
                recomputed_clause_matches += 1
            else:
                recomputed_clause_mismatches += 1
        cegar.add_clause_to_z3(structural, variables, cegar.cut_clause(encoder, cut))
        if index % args.progress_every == 0:
            print(json.dumps({"phase": "replay", "cuts": index}), flush=True)

    status = structural.check()
    if status != z3.sat:
        raise SystemExit(f"next structural leaf unavailable: {status}")
    decoded = cegar.decode_assignment(module, encoder, structural.model(), variables)
    metric = cegar.exact_metric_check(
        module,
        decoded,
        f"{args.orbit}-recovered-next",
        distance_lower_bound=0,
    )

    payload: dict[str, object] = {
        "schema": "p97-exact6-integrated-interrupted-sequence-recovery-v1",
        "orbit": args.orbit,
        "encoder_sha256": integrated.file_sha256(integrated.ENCODER_PATH),
        "global_bank": {
            "path": str(args.global_bank),
            "sha256": sha256(args.global_bank),
            "cut_count": len(global_cuts),
        },
        "local_bank": {
            "path": str(args.local_bank),
            "sha256": sha256(args.local_bank),
            "cut_count": len(local_cuts),
            "complete_cut_count_at_replay": len(complete_local_cuts),
        },
        "seeds": [
            {"path": str(path), "sha256": sha256(path)} for path in args.seed
        ],
        "recomputed_metric_each": args.recompute_metric_each,
        "recomputed_clause_matches": recomputed_clause_matches,
        "recomputed_clause_mismatches": recomputed_clause_mismatches,
        "next_leaf": {
            "rows": {str(center): list(support) for center, support in decoded["rows"].items()},
            "shell": list(decoded["shell"]),
            "roles": decoded["roles"],
            "blockers": {
                str(source): center for source, center in decoded["blockers"].items()
            },
        },
        "metric": metric,
    }
    if metric["status"] == "SAT":
        payload.update(
            {
                "epistemic_status": (
                    "EXACT_NONNEGATIVE_KALMANSON_BOUNDARY_SHADOW_ALIVE_"
                    "NOT_EUCLIDEAN_NOT_LIVE_LEAN_CLOSURE"
                ),
                "rows": payload["next_leaf"]["rows"],  # type: ignore[index]
                "shell": payload["next_leaf"]["shell"],  # type: ignore[index]
                "roles": payload["next_leaf"]["roles"],  # type: ignore[index]
                "blockers": payload["next_leaf"]["blockers"],  # type: ignore[index]
                **metric["witness"],
            }
        )
    else:
        payload["epistemic_status"] = "NEXT_REPLAYED_LEAF_EXACTLY_KALMANSON_UNSAT"

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"status": metric["status"], "output": str(args.output)}), flush=True)


if __name__ == "__main__":
    main()
