#!/usr/bin/env python3
"""Merge legacy exact-17 banks while replacing family-level Kalmanson hits.

Legacy artifacts minimized two-Kalmanson records by theorem family.  The stored
rows can therefore validate a different cancellation from the serialized core.
This migration rescans those rows, stores every currently exact-checked core,
and byte-pins all parents.  The direct exporter still replays every output
record before using it.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path

from census.atail_force import producer_bank

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
SCHEMA = "p97-rigid221-exact17-cap9-source-faithful-exact-core-reauth-v1"
LEGACY_SCHEMA = "p97-rigid221-exact17-cap9-source-faithful-transitive-two-circle-v2"
TWO_KALMANSON_STAGE = "equality-convex-two-kalmanson-cancellation"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_fullcover():
    path = HERE / "exact17_fullcover_cegar.py"
    spec = importlib.util.spec_from_file_location("exact17_reauth_fullcover", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def canonical(value: object) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, nargs="+", required=True)
    parser.add_argument("--output", type=Path, required=True)
    arguments = parser.parse_args()
    fullcover = load_fullcover()

    learned: dict[str, dict[str, object]] = {}
    parents = []
    migrated_patterns = 0
    migrated_cores = 0
    order: tuple[int, ...] | None = None
    for path in sorted(arguments.parent):
        payload = json.loads(path.read_text())
        if payload.get("schema") != LEGACY_SCHEMA:
            raise ValueError(f"legacy schema mismatch: {path}")
        if payload.get("order_index") != 0:
            raise ValueError(f"legacy order mismatch: {path}")
        if tuple(payload.get("anonymous_positions", ())) != (0, 1):
            raise ValueError(f"legacy positions mismatch: {path}")
        payload_order = tuple(int(point) for point in payload.get("order", ()))
        if order is None:
            order = payload_order
        elif order != payload_order:
            raise ValueError(f"cyclic order drift: {path}")
        relative = path.resolve().relative_to(REPO.resolve())
        parents.append({"path": str(relative), "sha256": sha256(path)})
        for record in payload.get("learned", ()):
            if not isinstance(record, dict):
                raise TypeError(f"invalid learned record: {path}")
            bank_record = record.get("record")
            if (
                record.get("kind") == "formalized-bank"
                and isinstance(bank_record, dict)
                and bank_record.get("stage") == TWO_KALMANSON_STAGE
            ):
                rows = fullcover.rows_from_payload(record.get("rows", ()))
                cores = producer_bank.enumerate_two_kalmanson_cancellations(
                    rows, 17, order
                )
                if not cores:
                    raise ValueError(f"two-Kalmanson rows no longer certify: {path}")
                migrated_patterns += 1
                migrated_cores += len(cores)
                for core in cores:
                    replacement = {
                        "kind": "formalized-bank",
                        "record": core,
                        "rows": record["rows"],
                    }
                    learned.setdefault(canonical(replacement), replacement)
            else:
                learned.setdefault(canonical(record), record)

    if order is None:
        raise ValueError("no parent artifacts")
    source_hashes = {
        "runner": sha256(HERE / "exact17_source_faithful_cegar.py"),
        "fullcover": sha256(HERE / "exact17_fullcover_cegar.py"),
        "order_base": sha256(HERE / "exact17_kalmanson.py"),
        "producer_bank": sha256(REPO / "census/atail_force/producer_bank.py"),
        "migration": sha256(Path(__file__)),
    }
    output = {
        "schema": SCHEMA,
        "scope": "exact-17 cap-nine normalized order 0 positions 0,1",
        "order_index": 0,
        "anonymous_positions": [0, 1],
        "order": list(order),
        "terminal": "REAUTHENTICATED_LEARNED_BANK",
        "source_hashes": source_hashes,
        "reauthenticated_parents": parents,
        "reauthentication": {
            "method": "exact-all-two-kalmanson-core-enumeration-v1",
            "legacy_two_kalmanson_pattern_count": migrated_patterns,
            "enumerated_two_kalmanson_core_count_before_dedup": migrated_cores,
            "deduplicated_learned_count": len(learned),
        },
        "learned": [learned[key] for key in sorted(learned)],
    }
    arguments.output.parent.mkdir(parents=True, exist_ok=True)
    arguments.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps(output["reauthentication"], sort_keys=True))


if __name__ == "__main__":
    main()
