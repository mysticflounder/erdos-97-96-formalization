#!/usr/bin/env python3
"""Preservation-first migration of a speculative producer v2 state to v3."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import speculative_cube_producer as producer  # noqa: E402
from census.census_554.io_protocol import atomic_write_json  # noqa: E402


SOURCE_SCHEMA = "census554_speculative_cube_state.v2"


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _fsync_copy(source: Path, target: Path) -> None:
    shutil.copy2(source, target)
    with target.open("rb") as handle:
        os.fsync(handle.fileno())
    fd = os.open(target.parent, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--run-dir", type=Path, required=True)
    args = parser.parse_args(argv)
    state_path = args.run_dir / "state.json"
    state = json.loads(state_path.read_text(encoding="utf-8"))
    if state.get("schema") != SOURCE_SCHEMA:
        parser.error("state is not schema v2")
    values = state.get("learned_exclusions")
    if not isinstance(values, list):
        parser.error("v2 state has no learned exclusion inventory")
    last_attempt = max(
        (int(record["attempt"]) for record in state.get("attempts", [])),
        default=0,
    )

    backup = args.run_dir / "state-v2-pre-batch-migration.json"
    source_sha256 = _sha256(state_path)
    if backup.exists():
        if _sha256(backup) != source_sha256:
            parser.error("existing v2 backup differs from live source state")
    else:
        _fsync_copy(state_path, backup)

    relative = (
        Path("learned_batches")
        / f"bootstrap-through-{last_attempt:06d}.json"
    )
    batch_path = args.run_dir / relative
    payload = producer._learned_batch_payload(
        values,
        manifest_sha256=state["manifest_sha256"],
        attempt_first=1,
        attempt_last=last_attempt,
    )
    if batch_path.exists():
        if json.loads(batch_path.read_text(encoding="utf-8")) != payload:
            parser.error("existing bootstrap learned batch differs")
    else:
        atomic_write_json(batch_path, payload)

    migrated = dict(state)
    migrated.pop("learned_exclusions")
    migrated["schema"] = producer.SCHEMA
    migrated["learned_batches"] = [str(relative)]
    migrated["learned_exclusion_count"] = len(values)
    migrated["v2_migration"] = {
        "source_backup": backup.name,
        "source_sha256": source_sha256,
        "bootstrap_batch": str(relative),
        "bootstrap_batch_sha256": _sha256(batch_path),
        "learned_exclusion_count": len(values),
    }
    atomic_write_json(state_path, migrated)
    print(json.dumps(migrated["v2_migration"], sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
