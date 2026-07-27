#!/usr/bin/env python3
"""Materialize the exact 21-row P4 cap residual from the occurrence ledger.

This deliberately preserves the output, source-core, and source-terminal
occurrence keys.  It is a durable ingress artifact, not a claim that these
rows alone satisfy the complete compact formula.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
LEDGER = (
    HERE.parent
    / "unique4-exact-two-core-map/generated/p4-seed0-compact"
    / "p4-seed0-compact-occurrences.jsonl"
)
DEFAULT_OUT = HERE / "generated/right-cap-residual-21.jsonl"

EXPECTED_OUTPUTS = (
    8402, 8403, 8404, 8405, 8406, 8408, 8409, 8410, 8412, 8413, 8414,
    8416, 8417, 8418, 8419, 8420, 8421, 8422, 8423, 8424, 8425,
)

FIELDS = (
    "output_clause_index",
    "source_core_clause_index",
    "source_terminal_clause_index",
    "family",
    "dense_literals",
    "source_core_literals",
    "source_terminal_literals",
)


def select_records(ledger: Path = LEDGER) -> list[dict[str, Any]]:
    """Return the exact ordered cap-residual rows, with complete provenance."""
    records: dict[int, dict[str, Any]] = {}
    with ledger.open(encoding="utf-8") as source:
        for line in source:
            record = json.loads(line)
            output = record.get("output_clause_index")
            if output in EXPECTED_OUTPUTS:
                records[output] = {field: record[field] for field in FIELDS}
    missing = set(EXPECTED_OUTPUTS).difference(records)
    unexpected = set(records).difference(EXPECTED_OUTPUTS)
    if missing or unexpected:
        raise ValueError(f"unexpected P4 cap residual keys: missing={missing}, extra={unexpected}")
    return [records[output] for output in EXPECTED_OUTPUTS]


def write_records(records: list[dict[str, Any]], out: Path) -> None:
    out.parent.mkdir(parents=True, exist_ok=True)
    with out.open("w", encoding="utf-8") as target:
        for record in records:
            target.write(json.dumps(record, sort_keys=True, separators=(",", ":")))
            target.write("\n")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--ledger", type=Path, default=LEDGER)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    args = parser.parse_args()
    write_records(select_records(args.ledger), args.out)


if __name__ == "__main__":
    main()
