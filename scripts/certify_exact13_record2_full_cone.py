# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Produce and replay the exact two-center closure of exact-13 record 2."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import check_exact13_global_obstructions as obstruction
import solve_exact13_quotient_cones as cone

SCHEMA = "exact13-record2-two-center-closure/v1"
ROOT = Path("scratch/runs/cardge13-exact13-record2-full-cone-20260906/run-0001")
OUTPUT = ROOT / "record-002-two-center-closure.json"
RECORD_INDEX = 2
CENTERS = (2, 7)
EXPECTED_SURVIVORS = {
    2: ((1, 3, 5, 9), (1, 4, 5, 9)),
    7: ((1, 2, 3, 5), (1, 2, 4, 5), (1, 3, 5, 9), (1, 4, 5, 9)),
}
EXPECTED_PAIR_FORMS = (378, 392, 168, 168, 392, 386, 168, 168)


def _digest(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def _sha256_path(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _record_and_group() -> tuple[dict[str, object], list[int]]:
    records, groups = obstruction._records_and_groups()
    group = next(indices for indices in groups if RECORD_INDEX in indices)
    obstruction.require(group == [2, 205], "record 2 group changed")
    return records[RECORD_INDEX], group


def vectors_for(rows: tuple[tuple[str, int, tuple[int, ...]], ...]):
    record, _group = _record_and_group()
    active = obstruction.completion.active_centers(record)
    for _name, center, support in rows:
        obstruction.require(center in active, "inactive center")
        obstruction.require(
            support in obstruction.supports(center), "noncanonical support"
        )
    return cone.projected((*cone.rows_of(record), *rows))


def single_center_table(center: int) -> tuple[list[dict[str, object]], list[tuple[int, ...]]]:
    entries: list[dict[str, object]] = []
    survivors: list[tuple[int, ...]] = []
    for support in obstruction.supports(center):
        vectors = vectors_for(((f"G{center}", center, support),))
        certificate = obstruction._certificate(vectors)
        if certificate is None:
            survivors.append(support)
            entries.append({"support": list(support), "status": "SURVIVES"})
        else:
            entries.append(
                {
                    "support": list(support),
                    "status": "REJECTED",
                    "certificate": certificate,
                }
            )
    obstruction.require(
        tuple(survivors) == EXPECTED_SURVIVORS[center],
        f"center {center} survivor set changed",
    )
    return entries, survivors


def pair_table(
    left: list[tuple[int, ...]], right: list[tuple[int, ...]]
) -> list[dict[str, object]]:
    entries: list[dict[str, object]] = []
    forms: list[int] = []
    for support2 in left:
        for support7 in right:
            vectors = vectors_for((("G2", 2, support2), ("G7", 7, support7)))
            certificate = obstruction._certificate(vectors)
            obstruction.require(
                certificate is not None and len(certificate["forms"]) == 1,
                "survivor pair lacks a one-form cancellation",
            )
            form = certificate["forms"][0]
            obstruction.require(isinstance(form, int), "pair form is not an index")
            forms.append(form)
            entries.append(
                {
                    "support2": list(support2),
                    "support7": list(support7),
                    "certificate": certificate,
                }
            )
    obstruction.require(
        tuple(forms) == EXPECTED_PAIR_FORMS, "pair certificate table changed"
    )
    return entries


def produce() -> dict[str, object]:
    tables: dict[str, object] = {}
    survivors: dict[int, list[tuple[int, ...]]] = {}
    for center in CENTERS:
        entries, surviving = single_center_table(center)
        tables[str(center)] = {
            "supports": entries,
            "rejected": len(entries) - len(surviving),
            "survivors": [list(support) for support in surviving],
        }
        survivors[center] = surviving
    pairs = pair_table(survivors[2], survivors[7])
    _record, group = _record_and_group()
    report: dict[str, object] = {
        "schema": SCHEMA,
        "claim_boundary": (
            "All 495 supports at centers 2 and 7 are covered by exact projected "
            "one/two-form cancellations or one of eight exact pair cancellations."
        ),
        "record_index": RECORD_INDEX,
        "indices": group,
        "form_count": obstruction.FORM_COUNT,
        "support_count_per_center": obstruction.SUPPORTS,
        "centers": tables,
        "survivor_pairs": pairs,
        "producer_sha256": _sha256_path(Path(__file__)),
        "source_pins": obstruction.source_pins(),
    }
    report["self_sha256"] = _digest(report)
    OUTPUT.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    return report


def verify(path: Path) -> dict[str, object]:
    report = json.loads(path.read_text())
    obstruction.require(report.get("schema") == SCHEMA, "schema mismatch")
    claimed_hash = report.pop("self_sha256")
    obstruction.require(claimed_hash == _digest(report), "self hash mismatch")
    obstruction.require(
        report.get("record_index") == RECORD_INDEX
        and report.get("indices") == [2, 205]
        and report.get("form_count") == obstruction.FORM_COUNT
        and report.get("support_count_per_center") == obstruction.SUPPORTS,
        "header mismatch",
    )
    obstruction.require(
        report.get("producer_sha256") == _sha256_path(Path(__file__)),
        "producer pin mismatch",
    )
    obstruction.require(
        report.get("source_pins") == obstruction.source_pins(), "source pin mismatch"
    )
    rebuilt_tables: dict[str, object] = {}
    rebuilt_survivors: dict[int, list[tuple[int, ...]]] = {}
    for center in CENTERS:
        entries, surviving = single_center_table(center)
        rebuilt_tables[str(center)] = {
            "supports": entries,
            "rejected": len(entries) - len(surviving),
            "survivors": [list(support) for support in surviving],
        }
        rebuilt_survivors[center] = surviving
    obstruction.require(report.get("centers") == rebuilt_tables, "center table mismatch")
    obstruction.require(
        report.get("survivor_pairs")
        == pair_table(rebuilt_survivors[2], rebuilt_survivors[7]),
        "pair table mismatch",
    )
    report["self_sha256"] = claimed_hash
    return report


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--verify", type=Path)
    args = parser.parse_args()
    report = verify(args.verify) if args.verify is not None else produce()
    print(
        json.dumps(
            {
                "verified": args.verify is not None,
                "record_index": RECORD_INDEX,
                "center2_rejected": report["centers"]["2"]["rejected"],
                "center7_rejected": report["centers"]["7"]["rejected"],
                "survivor_pairs": len(report["survivor_pairs"]),
                "self_sha256": report["self_sha256"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
