#!/usr/bin/env python3
"""Run the existing exact full-LRA metric oracle on one fixed CNF survivor."""

from __future__ import annotations

import argparse
import itertools
import json
import sys
import time
from fractions import Fraction
from pathlib import Path

import z3


SEARCH_DIR = Path(__file__).resolve().parent.parent / "generic-biapex-kalmanson-search"
sys.path.insert(0, str(SEARCH_DIR))

import cegar  # noqa: E402
import global_equality_quotient_cegar as quotient  # noqa: E402
from payload_verifier import verify_payload  # noqa: E402


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("outer_result", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--wall-seconds", type=float, default=300.0)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    if args.timeout_ms <= 0 or args.wall_seconds <= 0:
        parser.error("timeouts must be positive")

    outer = json.loads(args.outer_result.read_text(encoding="utf-8"))
    if outer.get("solver_status") != "SAT" or outer.get("cnf_model_checked") is not True:
        raise ValueError("outer payload is not a substitution-checked SAT model")
    n = int(outer["n"])
    rows = {
        int(center): tuple(int(point) for point in support)
        for center, support in outer["rows"].items()
    }
    blockers = {int(source): int(center) for source, center in outer["blockers"].items()}
    started = time.monotonic()
    status, dependency_centers, metric_core, payload = cegar.metric_check(
        rows,
        n,
        args.timeout_ms,
        started + args.wall_seconds,
        args.random_seed,
    )
    result: dict[str, object] = {
        "schema": "p97-fixed-row-full-lra-check-v1",
        "epistemic_status": "EXACT_RATIONAL_LRA_SOLVER_EVIDENCE_PENDING_INDEPENDENT_REPLAY",
        "n": n,
        "omitted_apices": outer["omitted_apices"],
        "source_outer_result": str(args.outer_result),
        "rows": outer["rows"],
        "blockers": outer["blockers"],
        "random_seed": args.random_seed,
        "elapsed_seconds": time.monotonic() - started,
        "refinements": [],
    }
    if status == z3.unsat:
        core_vertices = tuple(int(vertex) for vertex in payload["core_vertices"])
        required = tuple(tuple(int(x) for x in item) for item in payload["required_memberships"])
        schema, reflected, schema_key = quotient.schema_of_memberships(core_vertices, required)
        embedding_count = sum(
            len({schema, reflected})
            for _targets in itertools.combinations(range(n), len(core_vertices))
        )
        refinement = {
            "attempt": 1,
            "kind": "FULL_LRA",
            "complete_core_vertices": list(core_vertices),
            "dependency_centers": list(dependency_centers),
            "required_memberships": [list(item) for item in required],
            "metric_core": list(metric_core),
            "constraint_kinds": list(payload["constraint_kinds"]),
            "order_schema": [list(item) for item in schema_key[1]],
            "order_embedding_cut_count": embedding_count,
        }
        result.update(
            {
                "status": "UNSAT_FULL_LRA_FIXED_ROWS",
                "metric_core_constraint_count": len(metric_core),
                "metric_core": list(metric_core),
                "metric_core_deletion_minimized_by_source_oracle": True,
                "refinements": [refinement],
            }
        )
    elif status == z3.sat:
        verification = verify_payload(
            n=n,
            second_apex=int(outer["omitted_apices"][1]),
            rows=rows,
            blockers=blockers,
            distances=payload,
            distance_lower_bound=Fraction(1),
        )
        result.update(
            {
                "status": "SAT_VERIFIED_FULL_KALMANSON_METRIC",
                "distances": payload,
                "payload_verification": verification,
                "epistemic_status": "EXACT_RATIONAL_MODEL_SUBSTITUTION_VERIFIED",
            }
        )
    else:
        result.update({"status": "UNKNOWN", "reason": payload})

    args.output.parent.mkdir(parents=True, exist_ok=True)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
