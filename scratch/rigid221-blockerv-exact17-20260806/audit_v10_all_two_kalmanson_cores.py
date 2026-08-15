#!/usr/bin/env python3
"""Count exact two-Kalmanson cores and endpoint clauses in v10 models."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from census.atail_force import producer_bank


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def endpoint_clause(record: dict[str, object]) -> tuple[tuple[tuple[int, int], tuple[int, int]], ...]:
    core = record["core"]
    assert isinstance(core, dict)
    boundary = core["boundary_labels"]
    paths = core["paths"]
    assert isinstance(boundary, list)
    assert isinstance(paths, list)
    comparisons = set()
    for path in paths:
        assert isinstance(path, dict)
        first_positions = path["first"]
        last_positions = path["last"]
        assert isinstance(first_positions, list)
        assert isinstance(last_positions, list)
        first = edge(*(boundary[position] for position in first_positions))
        last = edge(*(boundary[position] for position in last_positions))
        if first != last:
            comparisons.add(tuple(sorted((first, last))))
    return tuple(sorted(comparisons))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("portfolio", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    arguments = parser.parse_args()

    summaries = []
    global_clauses = set()
    global_cores = set()
    for path in sorted(arguments.portfolio.glob("seed-*.analysis.json")):
        payload = json.loads(path.read_text())
        rows = tuple(
            producer_bank.MetricRow(
                int(row["center"]),
                tuple(int(point) for point in row["support"]),
                exact=bool(row["exact"]),
            )
            for row in payload["rows"]
        )
        order = tuple(int(point) for point in payload["order"])
        records = producer_bank.enumerate_two_kalmanson_cancellations(
            rows, 17, order
        )
        clauses = {endpoint_clause(record) for record in records}
        first_record = payload["bank_hits"][0]
        first_clause = (
            endpoint_clause(first_record)
            if first_record["stage"]
            == "equality-convex-two-kalmanson-cancellation"
            else None
        )
        core_fingerprints = {
            json.dumps(record, sort_keys=True, separators=(",", ":"))
            for record in records
        }
        global_cores.update(core_fingerprints)
        global_clauses.update(clauses)
        summaries.append(
            {
                "analysis": str(path),
                "core_count": len(records),
                "endpoint_clause_count": len(clauses),
                "first_hit_is_two_kalmanson": first_clause is not None,
                "first_clause_present": first_clause in clauses
                if first_clause is not None
                else None,
            }
        )

    output = {
        "schema": "rigid221-exact17-v10-all-two-kalmanson-core-audit-v1",
        "analysis_count": len(summaries),
        "total_model_core_count": sum(item["core_count"] for item in summaries),
        "total_model_endpoint_clause_count": sum(
            item["endpoint_clause_count"] for item in summaries
        ),
        "distinct_serialized_core_count": len(global_cores),
        "distinct_endpoint_clause_count": len(global_clauses),
        "models": summaries,
    }
    arguments.output.parent.mkdir(parents=True, exist_ok=True)
    arguments.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps({key: value for key, value in output.items() if key != "models"}))


if __name__ == "__main__":
    main()
