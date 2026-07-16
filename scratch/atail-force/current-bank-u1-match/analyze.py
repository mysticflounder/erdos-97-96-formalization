#!/usr/bin/env python3
"""Match the banked U1 two-large-cap obstruction in the live 23-shard stream.

This is theorem-discovery analysis only.  It checks the complete equality
closure of every saved row shadow; it does not prove that the fixed-placement
stream covers the live K-A-PAIR hypotheses.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path

from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _closure_circle_index,
    _row_equality_closure,
)


ROOT = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
SOURCE = (
    ROOT
    / "scratch/atail-force/second_center_query/"
    "formalized_core_shards_after_current_bank_checkpoint.json"
)
PINNED_SOURCE_SHA256 = (
    "5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a"
)


def rows_of(survivor: dict[str, object]) -> tuple[MetricRow, ...]:
    return tuple(
        MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            bool(row["exact"]),
        )
        for row in survivor["distinct_metric_rows"]
    )


def match(rows: tuple[MetricRow, ...], n: int) -> dict[str, object]:
    roots, _circle_masks = _closure_circle_index(
        _row_equality_closure(n, rows), n
    )

    def same(center: int, left: int, right: int) -> bool:
        return roots[center][left] == roots[center][right]

    # Hypothesis order is the source theorem's h1,...,h7 order.
    def fields(a: int, c: int, d: int, e: int, f: int) -> tuple[bool, ...]:
        return (
            same(c, a, d),
            same(c, a, f),
            same(d, c, e),
            same(d, c, f),
            same(f, a, d),
            same(f, a, e),
            same(e, a, c),
        )

    best: tuple[int, tuple[int, ...], tuple[int, ...]] | None = None
    minimum_size = 8
    minimum_count = 0
    minimum_missing_counts: dict[tuple[int, ...], int] = {}
    first_assignment_by_minimum_missing: dict[tuple[int, ...], tuple[int, ...]] = {}
    witness_count = 0
    first_witness: tuple[int, ...] | None = None
    for assignment in itertools.permutations(range(n), 5):
        a, c, d, e, f = assignment
        present = fields(a, c, d, e, f)
        missing = tuple(index + 1 for index, value in enumerate(present) if not value)
        candidate = (len(missing), missing, assignment)
        if best is None or candidate < best:
            best = candidate
        if len(missing) < minimum_size:
            minimum_size = len(missing)
            minimum_count = 0
            minimum_missing_counts = {}
            first_assignment_by_minimum_missing = {}
        if len(missing) == minimum_size:
            minimum_count += 1
            minimum_missing_counts[missing] = minimum_missing_counts.get(missing, 0) + 1
            first_assignment_by_minimum_missing.setdefault(missing, assignment)
        if not missing:
            witness_count += 1
            if first_witness is None:
                first_witness = assignment
    assert best is not None
    return {
        "matched": first_witness is not None,
        "first_witness_a_c_d_e_f": first_witness,
        "injective_witness_count": witness_count,
        "minimum_missing_hypothesis_count": best[0],
        "lexicographically_first_missing_hypotheses": best[1],
        "best_assignment_a_c_d_e_f": best[2],
        "minimum_assignment_count": minimum_count,
        "minimum_missing_set_counts": [
            {"missing_hypotheses": list(missing), "count": count,
             "first_assignment_a_c_d_e_f": list(
                 first_assignment_by_minimum_missing[missing]
             )}
            for missing, count in sorted(minimum_missing_counts.items())
        ],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=HERE / "checkpoint.json")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    raw = SOURCE.read_bytes()
    digest = hashlib.sha256(raw).hexdigest()
    if digest != PINNED_SOURCE_SHA256:
        raise SystemExit(
            f"source drift: expected {PINNED_SOURCE_SHA256}, found {digest}"
        )
    checkpoint = json.loads(raw)
    cases = []
    for case in checkpoint["cases"]:
        survivor = case.get("survivor")
        if survivor is None:
            continue
        cases.append(
            {
                "shard_index": int(case["partition"]["shard_index"]),
                **match(rows_of(survivor), int(survivor["frame"]["n"])),
            }
        )
    cases.sort(key=lambda case: case["shard_index"])
    result = {
        "schema": "p97-atail-current-bank-u1-two-large-cap-match-v1",
        "source": str(SOURCE.relative_to(ROOT)),
        "source_sha256": digest,
        "scope": {
            "fixed_placement_only": True,
            "finite_shadow_only": True,
            "live_producer_proved": False,
            "lean_consumer_present_in_current_import_closure": False,
        },
        "case_count": len(cases),
        "matched_case_count": sum(bool(case["matched"]) for case in cases),
        "minimum_missing_histogram": {
            str(value): sum(
                case["minimum_missing_hypothesis_count"] == value for case in cases
            )
            for value in sorted(
                {case["minimum_missing_hypothesis_count"] for case in cases}
            )
        },
        "cases": cases,
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
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
