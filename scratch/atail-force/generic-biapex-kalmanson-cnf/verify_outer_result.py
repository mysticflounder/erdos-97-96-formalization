#!/usr/bin/env python3
"""Independent semantic verifier for direct-CNF SAT payloads.

This file intentionally does not import the encoder.  It checks the decoded
rows/blockers against the original combinatorial specification and expands
the transported schema bank again from JSON.
"""

from __future__ import annotations

import argparse
import itertools
import json
from collections import deque
from pathlib import Path


Membership = tuple[int, int]


def strongly_connected(rows: dict[int, tuple[int, ...]], n: int) -> bool:
    for start in range(n):
        seen = {start}
        queue = deque([start])
        while queue:
            center = queue.popleft()
            for point in rows[center]:
                if point not in seen:
                    seen.add(point)
                    queue.append(point)
        if len(seen) != n:
            return False
    return True


def verify(result: dict[str, object], bank: dict[str, object]) -> dict[str, object]:
    if result.get("encoding_schema") != "p97-biapex-structural-outer-direct-cnf-v1":
        raise AssertionError("unexpected result encoding schema")
    if result.get("solver_status") != "SAT":
        raise AssertionError("semantic verifier accepts SAT results only")
    if result.get("cnf_model_checked") is not True:
        raise AssertionError("encoder did not record generic CNF substitution check")
    n = int(result["n"])
    apices = tuple(int(item) for item in result["omitted_apices"])
    if len(apices) != 2 or apices[0] != 0 or not 0 < apices[1] < n:
        raise AssertionError("invalid omitted-apex pair")
    rows = {
        int(center): tuple(int(point) for point in support)
        for center, support in result["rows"].items()
    }
    blockers = {int(source): int(center) for source, center in result["blockers"].items()}
    if set(rows) != set(range(n)):
        raise AssertionError("row map is not total")
    if set(blockers) != set(range(n)):
        raise AssertionError("blocker map is not total")
    for center, support in rows.items():
        if len(support) != 4 or len(set(support)) != 4 or center in support:
            raise AssertionError(f"row {center} is not four distinct nonself members: {support}")

    for left, right in itertools.combinations(range(n), 2):
        if len(set(rows[left]) & set(rows[right])) > 2:
            raise AssertionError(f"row-intersection bound fails at {(left, right)}")
    for first, second in itertools.combinations(range(n), 2):
        centers = [center for center in range(n) if first in rows[center] and second in rows[center]]
        if len(centers) > 2:
            raise AssertionError(f"pair-center bound fails at {(first, second)}: {centers}")
    for center_left, center_right in itertools.combinations(range(n), 2):
        common = set(rows[center_left]) & set(rows[center_right])
        possible = common - {center_left, center_right}
        for point_left, point_right in itertools.combinations(possible, 2):
            alternates = (center_left < point_left < center_right) != (
                center_left < point_right < center_right
            )
            if not alternates:
                raise AssertionError(
                    f"cyclic alternation fails at centers {(center_left, center_right)} "
                    f"and points {(point_left, point_right)}"
                )
    if not strongly_connected(rows, n):
        raise AssertionError("selected-member digraph is not strongly connected")
    for source, center in blockers.items():
        if center == source or center in apices:
            raise AssertionError(f"blocker {source}->{center} is forbidden")
        if source not in rows[center]:
            raise AssertionError(f"source {source} is absent from blocker row {center}")

    expected_bank_schema = "p97-whole-carrier-kalmanson-transported-schema-bank-v1"
    if bank.get("schema") != expected_bank_schema:
        raise AssertionError("unexpected bank schema")
    schemas = bank.get("schemas")
    if not isinstance(schemas, list) or bank.get("schema_count") != len(schemas):
        raise AssertionError("schema bank count mismatch")
    checked_embeddings = 0
    checked_schemas = 0
    skipped_large = 0
    seen: set[tuple[int, tuple[Membership, ...]]] = set()
    for index, record in enumerate(schemas):
        k = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(int(x) for x in pair) for pair in record["order_schema"]))
        reflected = tuple(sorted((k - 1 - center, k - 1 - point) for center, point in schema))
        key = (k, min(schema, reflected))
        if key in seen:
            raise AssertionError(f"duplicate schema record {index}")
        seen.add(key)
        if schema != key[1]:
            raise AssertionError(f"noncanonical schema record {index}")
        if k > n:
            skipped_large += 1
            continue
        checked_schemas += 1
        for targets in itertools.combinations(range(n), k):
            for oriented in {schema, reflected}:
                checked_embeddings += 1
                transformed = tuple((targets[center], targets[point]) for center, point in oriented)
                if all(point in rows[center] for center, point in transformed):
                    raise AssertionError(
                        f"preloaded schema cut violated: record={index}, targets={targets}, "
                        f"orientation={oriented}"
                    )

    return {
        "status": "VERIFIED_SAT",
        "n": n,
        "omitted_apices": list(apices),
        "row_count": len(rows),
        "blocker_count": len(blockers),
        "strongly_connected": True,
        "checked_schema_count": checked_schemas,
        "skipped_schema_count_core_larger_than_n": skipped_large,
        "checked_schema_embedding_count": checked_embeddings,
        "all_preloaded_schema_cuts_satisfied": True,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("result", type=Path)
    parser.add_argument("bank", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = verify(
        json.loads(args.result.read_text(encoding="utf-8")),
        json.loads(args.bank.read_text(encoding="utf-8")),
    )
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
