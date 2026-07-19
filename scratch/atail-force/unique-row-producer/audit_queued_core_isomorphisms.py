#!/usr/bin/env python3
"""Find when one queued exact row core embeds in another up to relabeling."""

from __future__ import annotations

import json

from census.global_confinement.metric_realizability_probe import MetricRow
from card_five_source_indexed_target_probe import (
    has_exact_qq_core_up_to_relabeling,
)


CORES: dict[str, frozenset[tuple[int, tuple[int, ...]]]] = {
    "14": frozenset({
        (0, (1, 2, 3, 4)),
        (2, (0, 1, 10, 11)),
        (3, (1, 5, 6, 9)),
        (4, (2, 3, 7, 10)),
        (5, (2, 4, 6, 11)),
        (6, (4, 5, 9, 10)),
    }),
    "15": frozenset({
        (0, (1, 3, 4, 6)),
        (1, (2, 4, 7, 10)),
        (3, (0, 1, 2, 11)),
        (4, (2, 5, 7, 8)),
        (5, (3, 4, 7, 11)),
        (11, (0, 1, 7, 9)),
    }),
    "16": frozenset({
        (0, (2, 3, 5, 9)),
        (1, (0, 4, 5, 7)),
        (4, (0, 1, 2, 3)),
        (5, (3, 7, 8, 9)),
        (6, (2, 5, 7, 10)),
        (8, (1, 4, 5, 6)),
    }),
    "17": frozenset({
        (0, (1, 3, 6, 9)),
        (1, (2, 4, 6, 10)),
        (2, (5, 8, 9, 10, 11)),
        (3, (0, 1, 2, 11)),
        (5, (0, 3, 4, 10)),
        (6, (3, 5, 7, 11)),
    }),
    "18": frozenset({
        (0, (1, 2, 5, 10)),
        (1, (2, 4, 6, 8)),
        (2, (0, 7, 8, 9, 10)),
        (3, (0, 1, 6, 11)),
        (5, (3, 4, 6, 10)),
        (6, (2, 3, 8, 11)),
    }),
    "19": frozenset({
        (0, (1, 6, 7, 11)),
        (5, (0, 1, 3, 9, 11)),
        (7, (5, 8, 10, 11)),
        (8, (3, 6, 7, 10)),
        (9, (1, 4, 8, 10)),
        (11, (0, 4, 9, 10)),
    }),
    "20": frozenset({
        (0, (2, 3, 6, 8)),
        (1, (0, 3, 5, 7)),
        (4, (0, 1, 2, 3)),
        (5, (0, 4, 6, 10)),
        (6, (1, 4, 5, 9)),
        (7, (1, 6, 8, 10)),
    }),
    "21": frozenset({
        (0, (1, 3, 5, 9)),
        (3, (0, 1, 2, 11)),
        (5, (3, 4, 8, 11)),
        (7, (1, 5, 6, 8)),
        (8, (3, 6, 9, 11)),
        (11, (1, 2, 6, 7)),
    }),
    "22": frozenset({
        (1, (0, 4, 8, 10)),
        (2, (1, 3, 5, 8)),
        (3, (1, 4, 9, 11)),
        (4, (2, 6, 7, 9)),
        (7, (1, 2, 3, 4, 10)),
        (10, (0, 1, 6, 9)),
    }),
    "23": frozenset({
        (0, (1, 2, 4, 9)),
        (1, (0, 4, 7, 10)),
        (2, (5, 8, 9, 10, 11)),
        (4, (2, 6, 7, 9)),
        (5, (1, 4, 7, 8)),
        (7, (0, 5, 6, 8)),
    }),
    "24": frozenset({
        (0, (1, 2, 4, 5)),
        (1, (4, 7, 8, 9, 10)),
        (3, (1, 5, 6, 8)),
        (4, (0, 3, 6, 9)),
        (5, (3, 4, 7, 11)),
        (7, (0, 4, 6, 8)),
    }),
    "25": frozenset({
        (1, (0, 6, 7, 8, 9)),
        (7, (3, 4, 6, 8)),
        (8, (2, 6, 9, 10)),
        (9, (0, 1, 5, 6)),
        (10, (1, 3, 8, 11)),
        (11, (1, 4, 7, 10)),
    }),
    "26": frozenset({
        (0, (1, 2, 6, 8)),
        (1, (0, 3, 6, 7)),
        (2, (0, 5, 8, 10)),
        (4, (0, 1, 2, 3)),
        (5, (1, 4, 6, 11)),
        (6, (3, 5, 8, 11)),
    }),
    "27": frozenset({
        (0, (1, 3, 6, 9)),
        (1, (4, 7, 8, 9, 10)),
        (3, (1, 5, 6, 8)),
        (4, (2, 3, 5, 10)),
        (5, (0, 4, 6, 7)),
        (9, (0, 3, 5, 7)),
    }),
    "28": frozenset({
        (0, (3, 5, 7, 10)),
        (1, (0, 6, 7, 8, 9)),
        (2, (0, 4, 10, 11)),
        (3, (4, 5, 8, 11)),
        (4, (2, 3, 5, 9)),
        (5, (1, 2, 8, 10)),
        (9, (0, 1, 5, 6)),
    }),
}


def as_rows(core: frozenset[tuple[int, tuple[int, ...]]]) -> tuple[MetricRow, ...]:
    return tuple(
        MetricRow(center=center, support=support, exact=False)
        for center, support in sorted(core)
    )


def main() -> None:
    embeddings = []
    for pattern_name, pattern in CORES.items():
        for candidate_name, candidate in CORES.items():
            if pattern_name == candidate_name:
                continue
            if has_exact_qq_core_up_to_relabeling(as_rows(candidate), pattern):
                embeddings.append({
                    "certified_pattern": pattern_name,
                    "covered_candidate": candidate_name,
                })
    print(json.dumps(embeddings, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
