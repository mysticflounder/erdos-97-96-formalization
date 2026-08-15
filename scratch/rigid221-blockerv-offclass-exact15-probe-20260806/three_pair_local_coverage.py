"""Cover three-row cores by local three-pair Kalmanson contradictions.

For each minimized core, choose one forced equal-distance pair from each of its
three center blocks.  Test the resulting pattern using only the involved
vertices, strict triangle inequalities, and strict Kalmanson inequalities.
Thus every accepted motif is independent of the ambient cardinality and of
anonymous vertices between the named ones.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from itertools import combinations, product
from pathlib import Path

import z3


def canonical_key(
    triples: tuple[tuple[int, tuple[int, int]], ...], order: list[int]
) -> str:
    involved = {center for center, _ in triples}
    involved.update(point for _, pair in triples for point in pair)
    cyclic = [point for point in order if point in involved]
    rank = {point: index for index, point in enumerate(cyclic)}
    size = len(cyclic)
    candidates = []
    for reflected in (False, True):
        for shift in range(size):
            def transform(
                point: int, *, reflected: bool = reflected, shift: int = shift
            ) -> int:
                value = rank[point]
                if reflected:
                    value = -value
                return (value - shift) % size

            candidate = sorted(
                (
                    transform(center),
                    tuple(sorted(transform(point) for point in pair)),
                )
                for center, pair in triples
            )
            candidates.append(candidate)
    return json.dumps(min(candidates), separators=(",", ":"))


def local_verdict(key: str) -> str:
    triples = json.loads(key)
    vertex_count = 1 + max(
        value
        for center, pair in triples
        for value in (center, *pair)
    )
    ds = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left, right in combinations(range(vertex_count), 2)
    }

    def dist(left: int, right: int):
        if left == right:
            return z3.RealVal(0)
        return ds[tuple(sorted((left, right)))]

    solver = z3.Solver()
    solver.add(*(value > 0 for value in ds.values()))
    for a, b, c in combinations(range(vertex_count), 3):
        solver.add(dist(a, c) < dist(a, b) + dist(b, c))
        solver.add(dist(a, b) < dist(a, c) + dist(b, c))
        solver.add(dist(b, c) < dist(a, b) + dist(a, c))
    for a, b, c, d in combinations(range(vertex_count), 4):
        diagonal = dist(a, c) + dist(b, d)
        solver.add(dist(a, b) + dist(c, d) < diagonal)
        solver.add(dist(a, d) + dist(b, c) < diagonal)
    for center, pair in triples:
        solver.add(dist(center, pair[0]) == dist(center, pair[1]))
    result = solver.check()
    if result == z3.unsat:
        return "UNSAT"
    if result == z3.sat:
        return "SAT"
    return "UNKNOWN"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int, choices=range(2))
    parser.add_argument("order_variant", type=int, choices=range(12))
    args = parser.parse_args()
    directory = Path(__file__).parent
    stem = f"metric-cegar-o{args.long_order_index}-v{args.order_variant}"
    source = json.loads((directory / f"{stem}-batch-motifs.json").read_text())
    journal = json.loads((directory / f"{stem}.json").read_text())
    order = journal["complete_order"]
    verdicts: dict[str, str] = {}
    examples: dict[str, int] = {}
    motif_counts: Counter[str] = Counter()
    covered = []
    uncovered = []
    for case in source["cases"]:
        options = []
        for center, block in case["equality_blocks"]:
            options.append(
                [(int(center), pair) for pair in combinations(block, 2)]
            )
        witnesses = []
        for selection in product(*options):
            triples = tuple(selection)
            key = canonical_key(triples, order)
            verdict = verdicts.setdefault(key, local_verdict(key))
            if verdict == "UNSAT":
                witnesses.append(key)
        if witnesses:
            key = min(
                witnesses,
                key=lambda candidate: (
                    1
                    + max(
                        value
                        for center, pair in json.loads(candidate)
                        for value in (center, *pair)
                    ),
                    candidate,
                ),
            )
            motif_counts[key] += 1
            examples.setdefault(key, case["round"])
            covered.append({"round": case["round"], "motif_key": key})
        else:
            uncovered.append(case["round"])
    ranking = [
        {"motif_key": key, "count": count, "example_round": examples[key]}
        for key, count in motif_counts.most_common()
    ]
    output = {
        "source": f"{stem}-batch-motifs.json",
        "status": "COMPLETE",
        "case_count": len(source["cases"]),
        "covered_count": len(covered),
        "uncovered_count": len(uncovered),
        "tested_motif_count": len(verdicts),
        "unsat_motif_count": sum(value == "UNSAT" for value in verdicts.values()),
        "motif_count": len(motif_counts),
        "motifs": ranking,
        "covered": covered,
        "uncovered_rounds": uncovered,
    }
    target = directory / f"{stem}-three-pair-local-coverage.json"
    target.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                key: output[key]
                for key in (
                    "covered_count",
                    "uncovered_count",
                    "tested_motif_count",
                    "unsat_motif_count",
                    "motif_count",
                )
            }
            | {"target": str(target), "top_motifs": ranking[:10]},
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
