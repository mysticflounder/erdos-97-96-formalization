"""Count checked two-row Kalmanson motifs in exact-17 JSON artifacts."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path


def increasing_shared_late_pairs(order, rows):
    """Return admitted increasing quadruples sharing the late pair."""

    supports = {
        int(row["center"]): frozenset(int(point) for point in row["support"])
        for row in rows
    }
    order = tuple(int(point) for point in order)
    return {
        (a, b, c, d)
        for a, b, c, d in itertools.combinations(order, 4)
        if a in supports
        and b in supports
        and {c, d} <= supports[a]
        and {c, d} <= supports[b]
    }


def candidate_row_systems(value):
    """Yield every boundary-order/row payload embedded in ``value``."""

    if isinstance(value, dict):
        boundary_labels = value.get("boundary_labels")
        row_choices = value.get("row_choices")
        if isinstance(boundary_labels, list) and isinstance(row_choices, list):
            order = boundary_labels
            rows = [
                {
                    "center": boundary_labels[int(row["center"])],
                    "support": [
                        boundary_labels[int(point)] for point in row["support"]
                    ],
                }
                for row in row_choices
            ]
        else:
            order = value.get("order")
            rows = value.get("rows")
        if (
            isinstance(order, list)
            and isinstance(rows, list)
            and rows
            and all(isinstance(row, dict) for row in rows)
            and all("center" in row and "support" in row for row in rows)
        ):
            yield order, rows
        for child in value.values():
            yield from candidate_row_systems(child)
    elif isinstance(value, list):
        for child in value:
            yield from candidate_row_systems(child)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("files", type=Path, nargs="*")
    parser.add_argument("--file-list", type=Path)
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

    systems = set()
    hit_systems = set()
    motifs = set()
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
            key_digest = hashlib.sha256(repr(key).encode()).digest()
            systems.add(key_digest)
            hits = increasing_shared_late_pairs(order, rows)
            if hits:
                hit_systems.add(key_digest)
                motifs.update(hits)

    print(
        json.dumps(
            {
                "files": len(files),
                "parse_errors": len(errors),
                "distinct_row_systems": len(systems),
                "systems_with_checked_motif": len(hit_systems),
                "distinct_checked_motifs": len(motifs),
                "sample_motifs": sorted(motifs)[:20],
                "errors": errors[:5],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
