#!/usr/bin/env python3
"""Independent JSON/JSONL verifier.  This module intentionally imports no Z3."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from domain import ModelError, canonical_key, validate_orbit_model


def verify_path(path: Path) -> int:
    records = []
    if path.suffix == ".jsonl":
        for line_number, line in enumerate(path.read_text().splitlines(), start=1):
            if not line.strip():
                continue
            try:
                records.append((line_number, json.loads(line)))
            except json.JSONDecodeError as error:
                raise ModelError(f"line {line_number}: malformed JSON: {error}") from error
    else:
        records.append((1, json.loads(path.read_text())))

    seen: set[tuple] = set()
    for line_number, model in records:
        try:
            validate_orbit_model(model)
            key = canonical_key(model)
        except (KeyError, TypeError, ValueError, ModelError) as error:
            raise ModelError(f"record {line_number}: {error}") from error
        if key in seen:
            raise ModelError(f"record {line_number}: duplicate canonical model")
        seen.add(key)
    return len(records)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("path", type=Path)
    args = parser.parse_args()
    try:
        count = verify_path(args.path)
    except (OSError, json.JSONDecodeError, ModelError) as error:
        print(f"FAIL: {error}")
        return 1
    print(f"PASS: independently verified {count} orbit model(s)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
