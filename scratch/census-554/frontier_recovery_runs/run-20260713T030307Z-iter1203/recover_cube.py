#!/usr/bin/env python3
"""Resumable, non-publishing recovery of the logged frontier-1203 motif."""

from __future__ import annotations

import json
import os
import sys
import time
from pathlib import Path


WORKDIR = Path(__file__).resolve().parent
REPO_ROOT = WORKDIR.parents[3]
SCRATCH = REPO_ROOT / "scratch" / "census-554"
sys.path.insert(0, str(SCRATCH))
sys.path.insert(0, str(REPO_ROOT))

import intracap  # noqa: E402
import miner  # noqa: E402
from census.census_554.io_protocol import atomic_write_json  # noqa: E402


DEAD_SCHEMA = "census554_frontier_recovery_dead_supports.v1"
SHRINK_SCHEMA = "census554_frontier_recovery_shrink_progress.v1"
WORKER_SCHEMA = "census554_frozen_frontier_mine_worker.v1"


def read_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def native(pattern):
    return {
        int(center): frozenset(int(member) for member in members)
        for center, members in pattern.items()
    }


def json_pattern(pattern):
    return {
        str(center): sorted(int(member) for member in members)
        for center, members in sorted(pattern.items())
    }


def exact_dead(pattern, timeout=60):
    return intracap.pattern_dead3(pattern, max(int(timeout), 60)) is True


def scan_or_resume(request, cube):
    path = WORKDIR / "dead_supports.json"
    if path.is_file():
        payload = read_json(path)
        if payload.get("schema") != DEAD_SCHEMA:
            raise RuntimeError("dead-support checkpoint schema mismatch")
        print(
            f"[resume] {len(payload['patterns'])} dead support(s) at "
            f"k={payload['min_support_k']}",
            flush=True,
        )
        return [native(pattern) for pattern in payload["patterns"]], payload["min_support_k"]

    started = time.monotonic()
    dead, min_support_k = miner._dead_supports_min_k(
        cube, log=lambda message: print(message, flush=True)
    )
    payload = {
        "schema": DEAD_SCHEMA,
        "created_utc_epoch": time.time(),
        "probe_result_sha256": request["probe_result_sha256"],
        "bank_sha256": request["bank_sha256"],
        "cube": json_pattern(cube),
        "min_support_k": min_support_k,
        "patterns": [json_pattern(pattern) for pattern in dead],
        "elapsed_s": time.monotonic() - started,
    }
    atomic_write_json(path, payload)
    print(f"[checkpoint] wrote {path.name}", flush=True)
    return dead, min_support_k


def shrink_or_resume(dead):
    path = WORKDIR / "shrink_progress.json"
    if path.is_file():
        progress = read_json(path)
        if progress.get("schema") != SHRINK_SCHEMA:
            raise RuntimeError("shrink checkpoint schema mismatch")
        completed = [native(pattern) for pattern in progress["completed"]]
        index = int(progress["next_index"])
        current = native(progress["current"]) if progress.get("current") else None
        print(
            f"[resume] shrink index={index}, completed={len(completed)}",
            flush=True,
        )
    else:
        completed = []
        index = 0
        current = dict(dead[0]) if dead else None

    def checkpoint():
        atomic_write_json(path, {
            "schema": SHRINK_SCHEMA,
            "next_index": index,
            "current": json_pattern(current) if current is not None else None,
            "completed": [json_pattern(pattern) for pattern in completed],
        })

    checkpoint()
    while index < len(dead):
        if current is None:
            current = dict(dead[index])
            checkpoint()
        improved = True
        while improved:
            improved = False
            for center in sorted(current, key=lambda item: -len(current[item])):
                for member in sorted(current[center]):
                    trial = dict(current)
                    members = current[center] - {member}
                    if len(members) >= 2:
                        trial[center] = members
                    else:
                        del trial[center]
                    if trial and exact_dead(trial):
                        current = trial
                        checkpoint()
                        print(
                            f"[shrink] support={len(miner.pattern_points(current))} "
                            f"generators={miner.n_gens(current)}",
                            flush=True,
                        )
                        improved = True
                        break
                if improved:
                    break
        completed.append(current)
        index += 1
        current = dict(dead[index]) if index < len(dead) else None
        checkpoint()

    seen = set()
    candidates = []
    for pattern in sorted(completed, key=lambda item: (miner.n_gens(item), len(item))):
        key = miner.canon_key(pattern)
        if key not in seen:
            seen.add(key)
            candidates.append(pattern)
    return candidates


def main() -> int:
    os.environ["CENSUS554_QUEUE"] = "0"
    request = read_json(WORKDIR / "mine_request.json")
    cube = native(request["cube"])
    miner.pattern_dead_fast = exact_dead
    started = time.monotonic()
    dead, min_support_k = scan_or_resume(request, cube)
    patterns = shrink_or_resume(dead)
    output = {
        "schema": WORKER_SCHEMA,
        "probe_result_sha256": request["probe_result_sha256"],
        "bank_sha256": request["bank_sha256"],
        "cube": json_pattern(cube),
        "min_support_k": min_support_k,
        "patterns": [json_pattern(pattern) for pattern in patterns],
        "elapsed_s": time.monotonic() - started,
        "miner_policy": {
            "recovery": "resumable-exact-local-v1",
            "CENSUS_MINE_WORKERS": miner.MINE_WORKERS,
            "CENSUS_MINE_BATCH": miner.MINE_BATCH,
            "CENSUS_MINE_TARGET_DEAD": miner.MINE_TARGET_DEAD,
            "CENSUS_MINE_TARGET_MIN_K": miner.MINE_TARGET_MIN_K,
            "oracle": "intracap.pattern_dead3",
            "oracle_timeout_s": 60,
            "remote_queue_used": False,
        },
    }
    atomic_write_json(WORKDIR / "mine_worker_output.json", output)
    print(
        f"[done] persisted {len(patterns)} minimal candidate(s) at "
        f"k={min_support_k}",
        flush=True,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
