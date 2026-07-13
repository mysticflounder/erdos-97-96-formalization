#!/usr/bin/env python3
"""Mine every candidate at one genuine frontier without touching the bank.

The authoritative frontier loop deliberately stops its heuristic deadness scan
after finding enough candidates to keep the certification stage moving.  This
tool uses otherwise-idle mine-only workers to finish a specified point-support
level and writes a generation-bound inventory for later shrinking and exact
certification.  It never falls back to local mining, certifies nothing, and
writes neither ``bank.jsonl`` nor a driver checkpoint.

Request schema::

    {
      "iteration": 690,
      "k": 7,
      "cube": {"0": [...], ..., "10": [...]},
      "bank_rows": 5897,
      "bank_sha256": "..."
    }

The cube must be copied from an actual ``FRONTIER cube`` record.  Consumers
must recheck every returned pattern against the then-current bank generation;
this is a heuristic selection cache, never a soundness artifact.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import sys
import time
from datetime import datetime, timezone
from itertools import combinations
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import census554_lib as L  # noqa: E402
import miner  # noqa: E402
import queue_client as qc  # noqa: E402
from census.census_554.io_protocol import atomic_write_json  # noqa: E402

SCHEMA = "census554_frontier_mine_prefetch.v1"
DEFAULT_CHUNK = 16
DEFAULT_TIMEOUT = 20


def _canonical_json(value) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("utf-8")


def _sha256(value) -> str:
    return hashlib.sha256(_canonical_json(value)).hexdigest()


def _pattern_json(pattern) -> dict[str, list[int]]:
    return {
        str(center): sorted(members)
        for center, members in sorted(pattern.items())
    }


def candidate_patterns(cube: dict[int, list[int]], k: int):
    """Reproduce ``miner._dead_supports_min_k`` candidate construction."""

    if not 4 <= k <= L.N:
        raise ValueError(f"k must lie in [4,{L.N}], got {k}")
    candidates = []
    for support in combinations(range(L.N), k):
        pattern = miner.induced_pattern(cube, support)
        if miner.n_gens(pattern) >= max(3, 2 * k - 5):
            candidates.append(pattern)
    candidates.sort(key=lambda pattern: (
        miner.n_gens(pattern), len(pattern)
    ))
    return candidates


def _load_request(path: Path):
    raw = path.read_bytes()
    value = json.loads(raw)
    cube_raw = value.get("cube")
    if not isinstance(cube_raw, dict):
        raise ValueError("request cube must be an object")
    cube = {
        int(center): sorted(int(member) for member in members)
        for center, members in cube_raw.items()
    }
    if set(cube) != set(range(L.N)) or not L.cube_ok(cube):
        raise ValueError("request cube is not a complete valid Census-554 cube")
    iteration = int(value["iteration"])
    k = int(value["k"])
    bank_rows = int(value["bank_rows"])
    bank_sha256 = str(value["bank_sha256"])
    if len(bank_sha256) != 64:
        raise ValueError("request bank_sha256 is not a SHA-256 digest")
    return raw, value, cube, iteration, k, bank_rows, bank_sha256


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--request", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--chunk-size", type=int, default=DEFAULT_CHUNK)
    parser.add_argument("--timeout", type=int, default=DEFAULT_TIMEOUT)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args(argv)
    if args.chunk_size <= 0 or args.timeout <= 0:
        parser.error("chunk size and timeout must be positive")
    if args.output.exists():
        parser.error(f"refusing to overwrite {args.output}")

    (request_raw, request_value, cube, iteration, k, bank_rows,
     bank_sha256) = _load_request(args.request)
    candidates = candidate_patterns(cube, k)
    serialized = [_pattern_json(pattern) for pattern in candidates]
    candidate_sha256 = _sha256(serialized)
    request_sha256 = hashlib.sha256(request_raw).hexdigest()
    print(
        f"iteration={iteration} k={k} candidates={len(candidates)} "
        f"candidate_sha256={candidate_sha256}",
        flush=True,
    )
    if args.dry_run:
        return 0

    capacity = qc.live_capacity("mine")
    if capacity <= 0:
        print("no fresh mine-capable worker heartbeat", file=sys.stderr)
        return 2
    qc.gc_stale_results(prefixes=("mine-prefetch-",))

    stem_indices: dict[str, list[int]] = {}
    submitted_utc = datetime.now(timezone.utc).isoformat()
    for lo in range(0, len(candidates), args.chunk_size):
        indices = list(range(lo, min(lo + args.chunk_size, len(candidates))))
        stem = qc.new_stem(f"mine-prefetch-i{iteration:04d}")
        qc.submit(stem, {
            "type": "mine_batch",
            "patterns": [serialized[index] for index in indices],
            "timeout": args.timeout,
        })
        stem_indices[stem] = indices
    print(
        f"submitted {len(candidates)} candidates in {len(stem_indices)} "
        f"chunks to {capacity} live mine slots",
        flush=True,
    )

    flags: list[bool | None] = [None] * len(candidates)
    worker_errors = []
    workers = set()

    def on_result(stem, data):
        indices = stem_indices[stem]
        result_flags = data.get("flags") if isinstance(data, dict) else None
        if not isinstance(result_flags, list) or len(result_flags) != len(indices):
            worker_errors.append({
                "stem": stem,
                "error": "missing or wrong-length flags",
            })
            return
        for index, flag in zip(indices, result_flags):
            flags[index] = bool(flag)
        worker = data.get("worker")
        if worker:
            workers.add(str(worker))
        for error in data.get("errors", []):
            worker_errors.append({"stem": stem, "worker_error": error})

    deadline = (
        time.time() + qc.MARGIN_S
        + args.timeout * math.ceil(len(candidates) / max(1, capacity))
    )
    completed, missing = qc.poll(stem_indices, deadline, on_result)
    cancelled = qc.cancel(missing)
    dead_patterns = [
        serialized[index] for index, flag in enumerate(flags) if flag is True
    ]
    checked = sum(flag is not None for flag in flags)
    status = "complete" if not missing and checked == len(candidates) else "partial"
    artifact = {
        "schema": SCHEMA,
        "status": status,
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "submitted_utc": submitted_utc,
        "request": request_value,
        "request_sha256": request_sha256,
        "bank_rows": bank_rows,
        "bank_sha256": bank_sha256,
        "iteration": iteration,
        "k": k,
        "candidate_count": len(candidates),
        "candidate_sha256": candidate_sha256,
        "checked_candidates": checked,
        "dead_count": len(dead_patterns),
        "dead_patterns": dead_patterns,
        "dead_patterns_sha256": _sha256(dead_patterns),
        "chunks_submitted": len(stem_indices),
        "chunks_completed": len(completed),
        "missing_stems": sorted(missing),
        "cancelled_unclaimed": cancelled,
        "workers": sorted(workers),
        "worker_errors": worker_errors,
        "trust": (
            "heuristic mine-only prefetch; every candidate used later must "
            "be generation-rechecked, exactly certified, and published only "
            "by the authoritative driver"
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    atomic_write_json(args.output, artifact)
    print(
        f"{status}: checked={checked}/{len(candidates)} dead={len(dead_patterns)} "
        f"workers={','.join(sorted(workers)) or '-'} output={args.output}",
        flush=True,
    )
    return 0 if status == "complete" else 1


if __name__ == "__main__":
    raise SystemExit(main())
