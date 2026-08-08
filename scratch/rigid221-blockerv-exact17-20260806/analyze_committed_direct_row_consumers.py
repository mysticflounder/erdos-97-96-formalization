"""Measure committed direct selected-row consumers on exact-17 artifacts."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from analyze_two_row_kalmanson_motifs import candidate_row_systems
from exact17_committed_direct_row_consumers import (
    INSTANCE_GENERATORS,
    violated_witnesses,
)
from exact17_two_rows_shared_late_pair import violated_cores as shared_late_cores

Order = tuple[int, ...]
Supports = dict[int, frozenset[int]]
Witness = tuple[object, ...]


def normalized(order, rows) -> tuple[Order, Supports, dict[int, int]]:
    boundary = tuple(int(point) for point in order)
    row_supports = {
        int(row["center"]): frozenset(int(point) for point in row["support"])
        for row in rows
    }
    supports = {
        point: row_supports.get(point, frozenset()) for point in boundary
    }
    return boundary, supports, {point: index for index, point in enumerate(boundary)}


MATCHERS = tuple(INSTANCE_GENERATORS)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("files", type=Path, nargs="*")
    parser.add_argument("--file-list", type=Path)
    parser.add_argument("--sample-limit", type=int, default=0)
    args = parser.parse_args()
    files = list(args.files)
    if args.file_list is not None:
        files.extend(
            Path(line)
            for line in args.file_list.read_text().splitlines()
            if line.strip()
        )
    if not files:
        parser.error("provide files or --file-list")

    seen = set()
    hits_by_matcher = {name: set() for name in (*MATCHERS, "shared_late_pair")}
    witnesses_by_matcher = {name: set() for name in (*MATCHERS, "shared_late_pair")}
    any_hits = set()
    errors = []
    for path in files:
        try:
            payload = json.loads(path.read_text())
        except (OSError, json.JSONDecodeError) as error:
            errors.append((str(path), str(error)))
            continue
        for order, rows in candidate_row_systems(payload):
            key = (
                tuple(int(point) for point in order),
                tuple(
                    sorted(
                        (
                            int(row["center"]),
                            tuple(sorted(int(point) for point in row["support"])),
                        )
                        for row in rows
                    )
                ),
            )
            digest = hashlib.sha256(repr(key).encode()).digest()
            if digest in seen:
                continue
            seen.add(digest)
            boundary, supports, _ = normalized(order, rows)
            matches = {
                name: violated_witnesses(name, boundary, supports)
                for name in MATCHERS
            }
            matches["shared_late_pair"] = shared_late_cores(boundary, supports)
            for name, witnesses in matches.items():
                if witnesses:
                    hits_by_matcher[name].add(digest)
                    witnesses_by_matcher[name].update(witnesses)
                    any_hits.add(digest)

    print(
        json.dumps(
            {
                "files": len(files),
                "parse_errors": len(errors),
                "distinct_row_systems": len(seen),
                "systems_with_any_match": len(any_hits),
                "matchers": {
                    name: {
                        "systems": len(hits_by_matcher[name]),
                        "distinct_witnesses": len(witnesses_by_matcher[name]),
                        "sample_witnesses": sorted(witnesses_by_matcher[name])[
                            : args.sample_limit
                        ],
                    }
                    for name in (*MATCHERS, "shared_late_pair")
                },
                "systems_new_over_shared_late_pair": len(
                    set().union(*(hits_by_matcher[name] for name in MATCHERS))
                    - hits_by_matcher["shared_late_pair"]
                ),
                "systems_with_new_consumer_match": len(
                    set().union(*(hits_by_matcher[name] for name in MATCHERS))
                ),
                "systems_overlapping_shared_late_pair": len(
                    set().union(*(hits_by_matcher[name] for name in MATCHERS))
                    & hits_by_matcher["shared_late_pair"]
                ),
                "errors": errors[:5],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
