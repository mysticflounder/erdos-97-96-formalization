#!/usr/bin/env python3
"""Mine small relabeling-invariant motifs in the current exact UNIT cores.

This is theorem-discovery only.  An equality is represented by the colored
triple ``center : left = right``; left/right are symmetric.  Canonicalization
enumerates equality order and endpoint flips, then relabels points by first
occurrence.  For the requested motif sizes this is an exact isomorphism key.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Iterable


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
QUERY = ROOT / "scratch/atail-force/second_center_query"
INPUTS = (
    QUERY / "formalized_core_shards_after_seven_point_six_circle_equality_checkpoint.json",
    QUERY / "formalized_core_shards_after_seven_point_six_circle_equality_rows7_checkpoint.json",
    QUERY / "formalized_core_shards_after_seven_point_six_circle_equality_rows8_checkpoint.json",
)

Edge = tuple[int, int, int]
Key = tuple[Edge, ...]


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def edges_of(case: dict) -> tuple[Edge, ...]:
    return tuple(
        (int(row["center"]), int(row["left"]), int(row["right"]))
        for row in case["minimization"]["retained_equalities"]
    )


def connected(edges: Iterable[Edge]) -> bool:
    rows = tuple(edges)
    if not rows:
        return False
    seen = {0}
    changed = True
    while changed:
        changed = False
        points = set().union(*(set(rows[index]) for index in seen))
        for index, row in enumerate(rows):
            if index not in seen and points.intersection(row):
                seen.add(index)
                changed = True
    return len(seen) == len(rows)


def canonical(edges: tuple[Edge, ...]) -> Key:
    best: Key | None = None
    size = len(edges)
    for order in itertools.permutations(range(size)):
        for flips in range(1 << size):
            labels: dict[int, int] = {}
            encoded: list[Edge] = []
            for position, index in enumerate(order):
                center, left, right = edges[index]
                if flips & (1 << position):
                    left, right = right, left
                triple = []
                for point in (center, left, right):
                    if point not in labels:
                        labels[point] = len(labels)
                    triple.append(labels[point])
                encoded.append(tuple(triple))
            candidate = tuple(encoded)
            if best is None or candidate < best:
                best = candidate
    assert best is not None
    return best


def signature(key: Key) -> dict[str, object]:
    points = sorted(set(itertools.chain.from_iterable(key)))
    center_degree = Counter(center for center, _left, _right in key)
    endpoint_degree = Counter(
        point for _center, left, right in key for point in (left, right)
    )
    return {
        "equality_count": len(key),
        "point_count": len(points),
        "center_count": len(center_degree),
        "center_degrees": sorted(center_degree.values(), reverse=True),
        "endpoint_degrees": sorted(endpoint_degree.values(), reverse=True),
        "canonical_equalities": [
            {"center": c, "left": left, "right": right}
            for c, left, right in key
        ],
    }


def analyze(max_size: int) -> dict[str, object]:
    cases: list[tuple[int, tuple[Edge, ...]]] = []
    input_meta = []
    for path in INPUTS:
        payload = json.loads(path.read_text(encoding="utf-8"))
        input_meta.append({"path": str(path.relative_to(ROOT)), "sha256": sha256(path)})
        for case in payload["cases"]:
            cases.append((int(case["shard_index"]), edges_of(case)))
    shard_counts = Counter(shard for shard, _edges in cases)
    if any(count != 1 for count in shard_counts.values()):
        raise RuntimeError(f"duplicate shard categories: {shard_counts}")

    by_size: dict[str, object] = {}
    for size in range(2, max_size + 1):
        motif_cases: dict[Key, set[int]] = defaultdict(set)
        motif_occurrences: Counter[Key] = Counter()
        for shard, edges in cases:
            seen_here: set[Key] = set()
            for subset in itertools.combinations(edges, size):
                if not connected(subset):
                    continue
                if len({center for center, _left, _right in subset}) < 2:
                    continue
                key = canonical(subset)
                motif_occurrences[key] += 1
                seen_here.add(key)
            for key in seen_here:
                motif_cases[key].add(shard)
        ranked = sorted(
            motif_cases,
            key=lambda key: (
                -len(motif_cases[key]),
                -motif_occurrences[key],
                key,
            ),
        )
        by_size[str(size)] = {
            "distinct_motif_count": len(ranked),
            "motifs_present_in_all_cases": sum(
                len(motif_cases[key]) == len(cases) for key in ranked
            ),
            "top_motifs": [
                {
                    "case_count": len(motif_cases[key]),
                    "shards": sorted(motif_cases[key]),
                    "occurrence_count": motif_occurrences[key],
                    **signature(key),
                }
                for key in ranked[:25]
            ],
        }

    return {
        "schema": "p97-atail-current-unit-core-small-motif-audit-v1",
        "scope": {
            "exact_isomorphism_for_listed_small_motifs": True,
            "connected_only": True,
            "at_least_two_distinct_centers": True,
            "theorem_discovery_only": True,
            "producer_proved": False,
        },
        "inputs": input_meta,
        "case_count": len(cases),
        "shard_indices": sorted(shard_counts),
        "motifs": by_size,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--max-size", type=int, default=4, choices=(2, 3, 4))
    parser.add_argument("--output", type=Path, default=HERE / "checkpoint.json")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    payload = analyze(args.max_size)
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print(f"PASS: {args.output}")
        return 0
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
