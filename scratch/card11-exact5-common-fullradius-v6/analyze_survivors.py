#!/usr/bin/env python3
"""Read-only structural audit of the four persisted v6 SAT survivors."""

from __future__ import annotations

import hashlib
import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
LABELS = tuple(range(11))


def edge(a: int, b: int) -> tuple[int, int]:
    return min(a, b), max(a, b)


def gkey(
    first: tuple[int, int], second: tuple[int, int]
) -> tuple[tuple[int, int], tuple[int, int]]:
    return tuple(sorted((edge(*first), edge(*second))))


def read_json(path: Path) -> object:
    return json.loads(path.read_text(encoding="utf-8"))


def assignment(path: Path) -> dict[int, bool]:
    payload = read_json(path)
    return {abs(x): x > 0 for x in payload["signed_literals"]}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def nonalternating(
    order: tuple[int, ...], a: int, b: int, p: int, q: int
) -> bool:
    pos = {label: index for index, label in enumerate(order)}
    low, high = sorted((pos[p], pos[q]))
    return ((low < pos[a] < high) == (low < pos[b] < high))


def classes(
    center: int,
    local: dict[tuple[int, int, int], int],
    values: dict[int, bool],
) -> list[tuple[int, ...]]:
    unseen = set(LABELS) - {center}
    result = []
    while unseen:
        seed = min(unseen)
        block = {
            point for point in unseen
            if point == seed
            or values[local[(center, *edge(seed, point))]]
        }
        result.append(tuple(sorted(block)))
        unseen -= block
    return sorted(result)


def audit_case(case_dir: Path) -> dict:
    manifest = read_json(case_dir / "manifest.json")
    values = assignment(case_dir / "model.json")
    local = {
        (int(x["center"]), int(x["left"]), int(x["right"])): int(x["variable"])
        for x in manifest["equality_variables"]
    }
    global_eq = {
        gkey(tuple(x["first_edge"]), tuple(x["second_edge"])): int(x["variable"])
        for x in manifest["global_edge_equality_variables"]
    }
    selected_rows = sorted(
        (
            int(row["center"]),
            tuple(sorted(map(int, row["support"]))),
        )
        for row in manifest["selected_rows"]
        if values[int(row["variable"])]
    )
    row_support = {
        (int(row["center"]), int(row["row_index"])): tuple(
            sorted(map(int, row["support"]))
        )
        for row in manifest["selected_rows"]
    }
    selected_orders = [
        tuple(map(int, order["labels"]))
        for order in manifest["order_selectors"]
        if values[int(order["variable"])]
    ]

    violations = []
    for order_index, order in enumerate(selected_orders):
        for a, b, p, q in itertools.combinations(LABELS, 4):
            four = (a, b, p, q)
            # The designation matters: swapping endpoints and centers changes
            # the two equidistance literals, so all six endpoint choices are
            # audited.
            for endpoints in itertools.combinations(four, 2):
                centers = tuple(x for x in four if x not in endpoints)
                x, y = endpoints
                c, d = centers
                if not nonalternating(order, x, y, c, d):
                    continue
                first = global_eq[gkey(edge(c, x), edge(c, y))]
                second = global_eq[gkey(edge(d, x), edge(d, y))]
                if values[first] and values[second]:
                    violations.append(
                        {
                            "selected_order_index": order_index,
                            "endpoints": [x, y],
                            "centers": [c, d],
                        }
                    )

    local_blocks = {center: classes(center, local, values) for center in LABELS}
    source_profile = []
    for choice in manifest["source_choices"]:
        if values[int(choice["variable"])]:
            source_profile.append(
                (
                    int(choice["source"]),
                    int(choice["center"]),
                    row_support[
                        (int(choice["center"]), int(choice["row_index"]))
                    ],
                )
            )
    # Relabeling-insensitive compact fingerprints.  These do not claim graph
    # isomorphism; the explicit labelled witnesses remain in the artifact.
    row_intersections = sorted(
        len(set(left[1]) & set(right[1]))
        for left, right in itertools.combinations(selected_rows, 2)
    )
    class_size_profile = sorted(
        tuple(sorted(map(len, blocks), reverse=True))
        for blocks in local_blocks.values()
    )
    normalized = {
        "selected_order_count": len(selected_orders),
        "selected_row_intersection_histogram": {
            str(value): row_intersections.count(value)
            for value in sorted(set(row_intersections))
        },
        "local_class_size_profiles": [list(x) for x in class_size_profile],
        "source_center_fiber_sizes": sorted(
            [
                sum(center == other_center for _, other_center, _ in source_profile)
                for center in LABELS
            ],
            reverse=True,
        ),
        "two_center_parity_violation_count": len(violations),
    }
    return {
        "case": case_dir.name,
        "model_sha256": sha256(case_dir / "model.json"),
        "selected_rows": [[c, list(s)] for c, s in selected_rows],
        "selected_orders": [list(order) for order in selected_orders],
        "source_choices": [[q, c, list(s)] for q, c, s in source_profile],
        "local_classes": {
            str(center): [list(block) for block in blocks]
            for center, blocks in local_blocks.items()
        },
        "normalized_signature": normalized,
        "two_center_bisector_parity": {
            "violates_complete_family": bool(violations),
            "violation_count": len(violations),
            "first_20_witnesses": violations[:20],
        },
    }


def main() -> None:
    cases = [audit_case(path) for path in sorted((HERE / "runs").iterdir())]
    # Four of the six endpoint/center designations per four-set are
    # non-alternating in a fixed cyclic order.
    clauses_per_order = 4 * len(tuple(itertools.combinations(LABELS, 4)))
    output = {
        "schema": "card11_exact5_common_fullradius.v6.survivor_audit.v1",
        "two_center_bisector_parity_complete_family": {
            "order_selectors": 144,
            "clauses_per_order": clauses_per_order,
            "clause_count": 144 * clauses_per_order,
            "new_variables": 0,
            "clause_shape": [
                "-order_selector",
                "-eq({p,a},{p,b})",
                "-eq({q,a},{q,b})",
            ],
        },
        "cases": cases,
    }
    path = HERE / "survivor-motifs.json"
    path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(path)
    for case in cases:
        parity = case["two_center_bisector_parity"]
        print(case["case"], parity["violation_count"])


if __name__ == "__main__":
    main()
