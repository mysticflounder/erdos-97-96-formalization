#!/usr/bin/env python3
"""Resumable census runner for role-coverage gate schemas.

Input: a JSON file containing a list of schema dicts (see gate_encoder.py
for the schema format).  Output: a JSONL ledger, one verdict per line,
appended as schemas complete.  Re-running with the same ledger skips
schema ids already present, so the census is resumable and can be split
across machines by sharding the schema list.

Usage:
    python census_runner.py SCHEMAS.json LEDGER.jsonl [--shard K/N]

--shard K/N runs only schemas whose index is congruent to K modulo N
(0-based), for parallel workers writing distinct ledgers.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from gate_encoder import check_schema  # noqa: E402


def load_done(ledger: Path) -> set[str]:
    done: set[str] = set()
    if ledger.exists():
        for line in ledger.read_text().splitlines():
            if line.strip():
                done.add(json.loads(line)["schema_id"])
    return done


def main() -> None:
    args = sys.argv[1:]
    shard_index, shard_count = 0, 1
    if "--shard" in args:
        at = args.index("--shard")
        shard_index, shard_count = map(int, args[at + 1].split("/"))
        del args[at : at + 2]
    schemas_path, ledger_path = Path(args[0]), Path(args[1])

    schemas = json.loads(schemas_path.read_text())
    done = load_done(ledger_path)
    todo = [
        schema
        for index, schema in enumerate(schemas)
        if index % shard_count == shard_index and schema["id"] not in done
    ]
    print(f"schemas={len(schemas)} shard={shard_index}/{shard_count} "
          f"done={len(done)} todo={len(todo)}", flush=True)

    with ledger_path.open("a") as ledger:
        for position, schema in enumerate(todo):
            verdict = check_schema(schema)
            ledger.write(json.dumps(verdict) + "\n")
            ledger.flush()
            print(
                f"[{position + 1}/{len(todo)}] {schema['id']}: "
                f"{verdict['verdict']}"
                + (
                    f" core_size={verdict['core_size']}"
                    f" families={verdict['families']}"
                    if verdict["verdict"] == "unsat"
                    else ""
                ),
                flush=True,
            )
    print("census shard complete", flush=True)


if __name__ == "__main__":
    main()
