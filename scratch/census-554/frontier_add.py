#!/usr/bin/env python3
"""Validate and atomically publish certified frontier patterns.

Direct CLI use takes the lifetime driver lease. ``frontier_loop.py`` imports
``append_rows`` while it already holds that lease. Every publication then takes
the shorter bank transaction lock, canonical-deduplicates under that lock,
validates the exact certificate, writes recoverable certificate files, and
atomically replaces ``bank.jsonl``.

Usage:
  uv run python frontier_add.py <patterns.json>
  uv run python frontier_add.py <retry_certified_pending.d>

``patterns.json`` is an array of
{"pattern": {c: [...]}, "cert": {...}, "cube": {...}} rows.  A pending-store
directory is consumed one atomic record at a time, in filename order, so the
banking process never retains every multi-gigabyte certificate simultaneously.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import miner  # noqa: E402
import verify_certs  # noqa: E402
from census.census_554.io_protocol import (  # noqa: E402
    BankEntry,
    LockBusy,
    commit_bank_records,
    driver_lease,
    read_jsonl_strict,
)


def append_rows(rows):
    """Publish a batch while the caller holds, or exclusively owns, the driver."""

    entries = []
    for row in rows:
        pat = {int(c): frozenset(M) for c, M in row["pattern"].items()}
        cert = dict(row["cert"])
        if "kill" not in cert:
            print(f"SKIP: cert has no kill (uncertified): {row['pattern']}",
                  flush=True)
            continue
        cert["source_cube"] = {
            str(c): sorted(values) for c, values in row.get("cube", {}).items()
        }
        images = miner.orbit(pat)
        entries.append(BankEntry(
            pattern=pat,
            certificate=cert,
            fields={
                "n_orbit": len(images),
                "k": len(miner.pattern_points(pat)),
                "iter": -1,
            },
        ))

    result = commit_bank_records(
        HERE,
        entries,
        canonical_key=miner.canon_key,
        validate=verify_certs.verify_cert,
    )
    for record in result.records:
        print(
            f"ADDED {record['pid']}: kill={record['kill']} "
            f"orbit={record['n_orbit']} k={record['k']}",
            flush=True,
        )
    bank_rows, _ = read_jsonl_strict(HERE / "bank.jsonl")
    print(
        f"DONE: published {len(result.records)} row(s), skipped "
        f"{result.skipped_duplicates} canonical duplicate(s); "
        f"bank now {len(bank_rows)} rows",
        flush=True,
    )
    return result


def append_pending_store(store_root: Path):
    """Publish an atomic pending store incrementally under one driver lease."""

    records_dir = store_root / "records"
    if not records_dir.is_dir():
        raise ValueError(f"pending store has no records directory: {store_root}")
    record_paths = sorted(records_dir.glob("*.json"))
    published = skipped = 0
    for record_path in record_paths:
        with open(record_path, encoding="utf-8") as handle:
            row = json.load(handle)
        result = append_rows([row])
        published += len(result.records)
        skipped += result.skipped_duplicates
        # Do not retain the previous giant certificate while opening the next.
        del row
    print(
        f"STORE DONE: considered {len(record_paths)} record(s), published "
        f"{published}, skipped {skipped} canonical duplicate(s)",
        flush=True,
    )


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: frontier_add.py <patterns.json-or-pending-store>",
              file=sys.stderr)
        return 2
    source = Path(sys.argv[1])
    try:
        with driver_lease(HERE):
            if source.is_dir():
                append_pending_store(source)
            else:
                rows = json.loads(source.read_text(encoding="utf-8"))
                append_rows(rows)
    except LockBusy as exc:
        print(f"REFUSING: {exc}", file=sys.stderr, flush=True)
        return 2
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        print(f"REFUSING: invalid pending input: {exc}",
              file=sys.stderr, flush=True)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
