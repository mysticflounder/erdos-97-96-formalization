#!/usr/bin/env python3
"""Measure canonical equality schemas in the exact-five all-one core bank."""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from pathlib import Path


def literals_of(core):
    answer = set()
    for item in core["constraints"]:
        if item["kind"] == "rowEquality":
            family = item["family"]
            center = int(item["center"])
            answer.add((family, center, int(item["left"])))
            answer.add((family, center, int(item["right"])))
        elif item["kind"] == "frontierFirstEquality":
            answer.add(("m", 4, int(item["q"])))
            answer.add(("m", 4, int(item["w"])))
        else:
            return None
    return tuple(sorted(answer))


def canonical_cyclic(literals):
    roles = sorted({x for _, c, p in literals for x in (c, p)})
    candidates = []
    for rotation in range(len(roles)):
        cycle = roles[rotation:] + roles[:rotation]
        rename = {value: index for index, value in enumerate(cycle)}
        candidates.append(tuple(sorted(
            (family, rename[center], rename[point])
            for family, center, point in literals
        )))
    return min(candidates)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--classification", type=Path, required=True)
    parser.add_argument("--checkpoint", type=Path, action="append", required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    classification = json.loads(args.classification.read_text())
    checkpoints = {}
    for path in args.checkpoint:
        payload = json.loads(path.read_text())
        checkpoints[str(payload["orbit"])] = payload

    counts = Counter()
    by_scope = defaultdict(Counter)
    examples = {}
    for record in classification["records"]:
        if record["force"] != "quotientOrdinalCycle":
            continue
        orbit = record["orbit"]
        core = checkpoints[orbit]["concrete_core_blocks"][record["core_index"]]
        literals = literals_of(core)
        if literals is None:
            continue
        schema = canonical_cyclic(literals)
        counts[schema] += 1
        by_scope[record["scope"]][schema] += 1
        examples.setdefault(schema, {
            "orbit": orbit,
            "core_index": record["core_index"],
            "scope": record["scope"],
            "literals": literals,
        })
    ordered = sorted(counts, key=lambda schema: (-counts[schema], schema))
    cumulative = 0
    top = []
    for rank, schema in enumerate(ordered, 1):
        cumulative += counts[schema]
        top.append({
            "rank": rank,
            "count": counts[schema],
            "cumulative": cumulative,
            "role_count": 1 + max(x for _, c, p in schema for x in (c, p)),
            "literal_count": len(schema),
            "schema": [list(item) for item in schema],
            "example": examples[schema],
        })
    result = {
        "ordinal_core_count": sum(counts.values()),
        "unique_cyclic_gap_erased_schema_count": len(counts),
        "unique_by_scope": {
            scope: len(counter) for scope, counter in sorted(by_scope.items())
        },
        "core_count_by_scope": {
            scope: sum(counter.values()) for scope, counter in sorted(by_scope.items())
        },
        "top_schemas": top,
    }
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps({
        key: result[key] for key in (
            "ordinal_core_count", "unique_cyclic_gap_erased_schema_count",
            "unique_by_scope", "core_count_by_scope",
        )
    }, indent=2, sort_keys=True))
    print("top coverage", [(item["count"], item["cumulative"],
                            item["role_count"], item["literal_count"])
                           for item in top[:30]])


if __name__ == "__main__":
    main()
