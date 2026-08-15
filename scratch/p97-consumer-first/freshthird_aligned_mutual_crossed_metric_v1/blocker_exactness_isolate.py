"""Localize the refined assignment's cvc5 blocker-exactness rejection."""

from __future__ import annotations

import argparse
import json
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from typing import Any

import refined_metric
import unified_metric as metric

HERE = Path(__file__).resolve().parent
RESULTS = HERE / "blocker_exactness_isolation_results.json"


def run(timeout_ms: int) -> dict[str, Any]:
    assignment = json.loads(refined_metric.ASSIGNMENT.read_text())
    errors = metric.validate_incidence_proposal(
        assignment
    ) + metric.validate_retained_first_apex_rich(assignment)
    if errors:
        raise RuntimeError("invalid refined proposal: " + "; ".join(errors))
    encoding = metric.UnifiedEncoding(assignment)
    groups = encoding.groups
    row = groups["k4_witness_equalities"] + groups["selected_support_equalities"]
    blocker = groups["blocker_exactness"]
    geometry = groups["geometry_core"]
    cap = groups["cap_classification"]
    rich = groups["rich_radius_pattern"] + groups["full_rich_classes"]
    cases = {
        "isolate_rows_blocker_exactness": row + blocker,
        "isolate_geometry_rows_blocker_exactness": geometry + row + blocker,
        "isolate_geometry_cap_rows_blocker_exactness": geometry + cap + row + blocker,
        "isolate_geometry_cap_rows_rich_blocker_exactness": geometry
        + cap
        + row
        + rich
        + blocker,
    }

    def solve(item: tuple[str, list[metric.Clause]]) -> dict[str, Any]:
        name, clauses = item
        return metric.run_query(name, encoding, clauses, timeout_ms, timeout_ms)

    with ThreadPoolExecutor(max_workers=len(cases)) as pool:
        queries = list(pool.map(solve, cases.items()))
    results = {
        "scope": "refined exact-17 assignment interaction localization only",
        "closure_claim": "NONE",
        "queries": queries,
    }
    RESULTS.write_text(json.dumps(results, indent=2, sort_keys=True) + "\n")
    return results


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    args = parser.parse_args()
    results = run(args.timeout_ms)
    for query in results["queries"]:
        print(
            f"{query['query']}: z3={query['z3']['status']} "
            f"cvc5={query['cvc5']['status']}"
        )


if __name__ == "__main__":
    main()
