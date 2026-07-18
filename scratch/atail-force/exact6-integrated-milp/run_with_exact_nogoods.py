#!/usr/bin/env python3
"""Run the K-only integrated MILP with independently replayed exact nogoods."""

from __future__ import annotations

import argparse
import json
import time
from pathlib import Path

from scipy.optimize import milp

import integrated_milp as integrated


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", required=True)
    parser.add_argument("--cut", action="append", required=True, type=Path)
    parser.add_argument("--time-limit", type=float, default=300.0)
    parser.add_argument("--node-limit", type=int, default=1_000_000)
    parser.add_argument("--threads", type=int, default=12)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--log-file", type=Path)
    parser.add_argument("--log-every", type=int, default=25_000)
    parser.add_argument("--mip-rel-gap", type=float, default=0.0)
    parser.add_argument("--positive-tolerance", type=float, default=1e-8)
    parser.add_argument("--replay-tolerance", type=float, default=1e-7)
    parser.add_argument("--max-denominator", type=int, default=1_000_000_000)
    args = parser.parse_args()
    args.metric_profile = "kalmanson-only"
    args.relax = False
    args.fixed_epsilon = None

    log = integrated.Logger(args.log_file)
    module = integrated.load_encoder()
    encoder = integrated.build_structural_outer(module, args.orbit, log)
    accepted_cuts = []
    for path in args.cut:
        artifact = json.loads(path.read_text(encoding="utf-8"))
        if not artifact.get("exact_replay_valid"):
            raise ValueError(f"cut lacks exact replay: {path}")
        certificate = artifact["certificate"]
        if certificate["upper_bound_marginals"] or certificate["equality_marginals"]:
            raise ValueError(f"cut is not a pure true-membership nogood: {path}")
        antecedent = artifact["decoded_dual_support"]["antecedent_true_literals"]
        if not artifact["decoded_dual_support"]["antecedent_is_true_boolean_support"]:
            raise ValueError(f"cut antecedent replay failed: {path}")
        names = [item["name"] for item in antecedent]
        if any(not name.startswith("member_") for name in names):
            raise ValueError(f"non-membership antecedent in {path}")
        encoder.cnf.add(
            "exact_rational_dual_nogood",
            (-encoder.v.by_name[name] for name in names),
        )
        accepted_cuts.append({
            "path": str(path.resolve().relative_to(integrated.REPO)),
            "source_orbit": artifact["orbit"],
            "antecedent": names,
        })
    log("exact_nogoods_added", count=len(accepted_cuts))

    model = integrated.IntegratedModel(module, encoder, log, args.log_every)
    model.add_structural_clauses()
    model.add_normalization_and_strict_metric("kalmanson-only")
    model.add_guarded_equalities()
    objective, integrality, bounds, constraints = model.arrays()
    options = {
        "disp": True,
        "presolve": True,
        "time_limit": args.time_limit,
        "node_limit": args.node_limit,
        "mip_rel_gap": args.mip_rel_gap,
        "threads": args.threads,
    }
    start = time.monotonic()
    result = milp(
        objective,
        integrality=integrality,
        bounds=bounds,
        constraints=constraints,
        options=options,
    )
    elapsed = time.monotonic() - start
    payload = integrated.result_payload(args, model, result, elapsed)
    payload["exact_rational_dual_nogoods"] = accepted_cuts
    payload["literal_metric_cut_banks"] = "OMITTED; ONLY LISTED EXACT DUAL NOGOODS ADDED"
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    log(
        "result_written",
        output=args.output,
        status=payload["epistemic_status"],
        nodes=payload["solver"]["mip_node_count"],
    )


if __name__ == "__main__":
    main()
