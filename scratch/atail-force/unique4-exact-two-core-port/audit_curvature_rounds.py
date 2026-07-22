#!/usr/bin/env python3
"""Replay the shell-curvature ledger over every exact-two CEGAR survivor."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from check_curvature_ledger import check


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("run_directory", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    records = []
    for source in sorted(args.run_directory.glob("round_*/opp1_*.result.json")):
        result = check(json.loads(source.read_text()))
        witnesses = result["four_separated_quarter_turn_arc_witnesses"]
        turn_disjoint = result["four_turn_disjoint_quarter_turn_arc_witnesses"]
        exact_separated = [
            witness for witness in witnesses
            if witness["all_centers_in_blocker_image"]
        ]
        exact_turn_disjoint = [
            witness for witness in turn_disjoint
            if witness["all_centers_in_blocker_image"]
        ]
        records.append(
            {
                "source": str(source),
                "solver_status": result["solver_status"],
                "strict_hit_checks": result["strict_hit_checks"],
                "five_role_consumer_embedding_count": len(
                    result["five_role_consumer_embeddings"]
                ),
                "four_separated_arc_witness_count": len(witnesses),
                "first_four_separated_arc_witness": witnesses[0] if witnesses else None,
                "four_turn_disjoint_arc_witness_count": len(turn_disjoint),
                "first_four_turn_disjoint_arc_witness": (
                    turn_disjoint[0] if turn_disjoint else None
                ),
                "exact_shell_four_separated_arc_witness_count": len(exact_separated),
                "exact_shell_four_turn_disjoint_arc_witness_count": len(
                    exact_turn_disjoint
                ),
                "deletion_minimal_unsat_core": result.get(
                    "deletion_minimal_unsat_core"
                ),
            }
        )

    summary = {
        "schema": "p97-exact-two-shell-curvature-round-audit-v1",
        "source_scope": (
            "Exact finite incidence and rational scalar-turn replay; neither a "
            "Euclidean realization nor arbitrary-cardinality source coverage"
        ),
        "record_count": len(records),
        "all_scalar_ledgers_unsat": all(
            record["solver_status"] == "UNSAT" for record in records
        ),
        "all_have_four_separated_arc_witness": all(
            record["four_separated_arc_witness_count"] > 0 for record in records
        ),
        "all_have_four_turn_disjoint_arc_witness": all(
            record["four_turn_disjoint_arc_witness_count"] > 0
            for record in records
        ),
        "all_have_exact_shell_four_turn_disjoint_arc_witness": all(
            record["exact_shell_four_turn_disjoint_arc_witness_count"] > 0
            for record in records
        ),
        "records": records,
    }
    args.output.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(json.dumps(summary, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
