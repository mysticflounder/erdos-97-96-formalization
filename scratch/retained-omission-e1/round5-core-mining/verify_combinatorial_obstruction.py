#!/usr/bin/env python3
"""Exhaustively check the 31-clause set-system obstruction without Z3."""

from __future__ import annotations

import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
U = set(range(15))
INTERIORS = (set(range(4)), set(range(4, 8)), set(range(8, 12)))
APICES = (12, 13, 14)

# Point domains in the nine source-indexed cyclic_alternation_cut clauses.
DOMAINS = {
    1332: U - {7, 12},
    1334: {0, 1, 2, 3, 4, 5, 6, 14},
    1335: {0, 1, 2, 3, 8, 9, 10, 11, 12, 13},
    1381: U - {8, 12},
    1383: {0, 1, 2, 3, 4, 5, 6, 7, 12, 14},
    1384: {0, 1, 2, 3, 9, 10, 11, 13},
    1569: {0, 1, 2, 3, 4, 5, 6, 7, 14},
    1570: {0, 1, 2, 3, 8, 9, 10, 11, 13},
    1613: {4, 5, 6, 7, 8, 9, 10, 11, 12},
}


def cut(left: set[int], right: set[int], source_index: int) -> bool:
    return len(left & right & DOMAINS[source_index]) <= 1


def main() -> int:
    rich_options = []
    for interior, apex in zip(INTERIORS, APICES, strict=True):
        optional = sorted(U - interior - {apex})
        rich_options.append(
            [interior | set(extra) for extra in itertools.combinations(optional, 2)]
        )

    rich_triples = []
    for r0 in rich_options[0]:
        for r1 in rich_options[1]:
            if not cut(r0, r1, 1569):
                continue
            for r2 in rich_options[2]:
                if cut(r0, r2, 1570) and cut(r1, r2, 1613):
                    rich_triples.append((r0, r1, r2))

    k_options = {
        center: [set(xs) for xs in itertools.combinations(sorted(U - {center}), 4)]
        for center in (7, 8)
    }

    def candidates(center: int, rich: tuple[set[int], ...], indices: tuple[int, ...]):
        return [
            k
            for k in k_options[center]
            if all(cut(k, rich[i], source_index) for i, source_index in enumerate(indices))
        ]

    apex_cover_failures = {
        "12_in_R1_union_R2": 0,
        "13_in_R0_union_R2": 0,
        "14_in_R0_union_R1": 0,
    }
    branch_counts = {"R2_has_12": 0, "R1_has_12": 0}
    branch_arc_cover_failures = {"K7": 0, "K8": 0}
    candidate_pair_witnesses = 0
    k7_feasible = 0
    k8_feasible = 0

    for rich in rich_triples:
        r0, r1, r2 = rich
        apex_cover_failures["12_in_R1_union_R2"] += 12 not in r1 | r2
        apex_cover_failures["13_in_R0_union_R2"] += 13 not in r0 | r2
        apex_cover_failures["14_in_R0_union_R1"] += 14 not in r0 | r1

        c7 = candidates(7, rich, (1332, 1334, 1335))
        c8 = candidates(8, rich, (1381, 1383, 1384))
        k7_feasible += bool(c7)
        k8_feasible += bool(c8)
        candidate_pair_witnesses += bool(c7 and c8)

        if 12 in r2:
            branch_counts["R2_has_12"] += 1
            cover = (r0 & DOMAINS[1332]) | (r1 & DOMAINS[1334]) | (r2 & DOMAINS[1335])
            branch_arc_cover_failures["K7"] += cover != U - {7}
        if 12 in r1:
            branch_counts["R1_has_12"] += 1
            cover = (r0 & DOMAINS[1381]) | (r1 & DOMAINS[1383]) | (r2 & DOMAINS[1384])
            branch_arc_cover_failures["K8"] += cover != U - {8}

    payload = {
        "rich_options_per_apex": [len(x) for x in rich_options],
        "rich_triples_after_pair_cuts": len(rich_triples),
        "apex_cover_failures": apex_cover_failures,
        "branch_counts": branch_counts,
        "branch_arc_cover_failures": branch_arc_cover_failures,
        "k7_feasible_rich_triples": k7_feasible,
        "k8_feasible_rich_triples": k8_feasible,
        "full_set_system_witnesses": candidate_pair_witnesses,
    }
    assert not any(apex_cover_failures.values())
    assert not any(branch_arc_cover_failures.values())
    assert candidate_pair_witnesses == 0
    (HERE / "v3-combinatorial-enumeration.json").write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(payload, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
