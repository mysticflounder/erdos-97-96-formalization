#!/usr/bin/env python3
"""Greedy-shrink prefetched dead patterns on mine-only queue workers.

Each greedy round evaluates all one-member removals in parallel, then selects
the first dead trial in the same deterministic order as ``miner.greedy_shrink``.
The queue verdict is heuristic only.  The output remains generation-bound and
must pass exact certification before the authoritative driver may publish it.
This tool never writes the bank and never falls back to local algebra work.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import miner  # noqa: E402
import queue_client as qc  # noqa: E402
from census.census_554.io_protocol import atomic_write_json  # noqa: E402

INPUT_SCHEMA = "census554_frontier_mine_prefetch.v1"
STATE_SCHEMA = "census554_prefetch_greedy_shrink_state.v1"
OUTPUT_SCHEMA = "census554_prefetch_greedy_shrink.v1"


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _pattern_native(value):
    return {
        int(center): frozenset(int(member) for member in members)
        for center, members in value.items()
    }


def _pattern_json(pattern):
    return {
        str(center): sorted(members)
        for center, members in sorted(pattern.items())
    }


def _pattern_sha(patterns) -> str:
    raw = json.dumps(
        [_pattern_json(pattern) for pattern in patterns],
        sort_keys=True,
        separators=(",", ":"),
    ).encode("ascii")
    return hashlib.sha256(raw).hexdigest()


def _ordered_trials(pattern):
    trials = []
    for center in sorted(pattern, key=lambda c: (-len(pattern[c]), c)):
        for member in sorted(pattern[center]):
            trial = dict(pattern)
            remaining = pattern[center] - {member}
            if len(remaining) >= 2:
                trial[center] = remaining
            else:
                del trial[center]
            if trial:
                trials.append(trial)
    return trials


def _dedupe_canonical(patterns):
    result = []
    seen = set()
    for pattern in patterns:
        key = miner.canon_key(pattern)
        if key in seen:
            continue
        seen.add(key)
        result.append(pattern)
    return result


def _dispatch_round(patterns, round_number, timeout, chunk_size, iteration):
    capacity = qc.live_capacity("mine")
    if capacity <= 0:
        raise RuntimeError("no fresh mine-capable worker heartbeat")
    owner_trials = {}
    flat = []
    for owner, pattern in enumerate(patterns):
        trials = _ordered_trials(pattern)
        owner_trials[owner] = []
        for order, trial in enumerate(trials):
            index = len(flat)
            flat.append(trial)
            owner_trials[owner].append((order, index))

    stem_indices = {}
    for lo in range(0, len(flat), chunk_size):
        indices = list(range(lo, min(lo + chunk_size, len(flat))))
        stem = qc.new_stem(
            f"mine-shrink-i{iteration:04d}-r{round_number:02d}"
        )
        qc.submit(stem, {
            "type": "mine_batch",
            "patterns": [_pattern_json(flat[index]) for index in indices],
            "timeout": timeout,
        })
        stem_indices[stem] = indices
    print(
        f"round {round_number}: {len(flat)} trials in {len(stem_indices)} "
        f"chunks to {capacity} mine slots",
        flush=True,
    )

    flags = [None] * len(flat)
    workers = set()
    errors = []

    def on_result(stem, data):
        indices = stem_indices[stem]
        result_flags = data.get("flags") if isinstance(data, dict) else None
        if not isinstance(result_flags, list) or len(result_flags) != len(indices):
            errors.append({"stem": stem, "error": "wrong-length flags"})
            return
        for index, flag in zip(indices, result_flags):
            flags[index] = bool(flag)
        if data.get("worker"):
            workers.add(str(data["worker"]))
        for error in data.get("errors", []):
            errors.append({"stem": stem, "worker_error": error})

    deadline = (
        time.time() + qc.MARGIN_S
        + timeout * math.ceil(max(1, len(flat)) / max(1, capacity))
    )
    completed, missing = qc.poll(stem_indices, deadline, on_result)
    cancelled = qc.cancel(missing)
    checked = sum(flag is not None for flag in flags)
    if missing or checked != len(flat):
        return None, {
            "status": "partial",
            "round": round_number,
            "trials": len(flat),
            "checked": checked,
            "chunks_completed": len(completed),
            "missing_stems": sorted(missing),
            "cancelled_unclaimed": cancelled,
            "workers": sorted(workers),
            "errors": errors,
        }

    updated = []
    improved = 0
    for owner, pattern in enumerate(patterns):
        chosen = None
        for _order, index in owner_trials[owner]:
            if flags[index] is True:
                chosen = flat[index]
                break
        if chosen is None:
            updated.append(pattern)
        else:
            updated.append(chosen)
            improved += 1
    return updated, {
        "status": "complete",
        "round": round_number,
        "trials": len(flat),
        "checked": checked,
        "improved_patterns": improved,
        "chunks_completed": len(completed),
        "workers": sorted(workers),
        "errors": errors,
    }


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--max-rounds", type=int, default=20)
    parser.add_argument("--timeout", type=int, default=20)
    parser.add_argument("--chunk-size", type=int, default=16)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args(argv)
    if min(args.max_rounds, args.timeout, args.chunk_size) <= 0:
        parser.error("all numeric limits must be positive")
    if args.output.exists():
        parser.error(f"refusing to overwrite {args.output}")

    source = json.loads(args.input.read_text(encoding="utf-8"))
    if source.get("schema") != INPUT_SCHEMA or source.get("status") != "complete":
        parser.error("input is not a complete frontier-mine prefetch artifact")
    source_sha256 = _sha256_file(args.input)
    raw_patterns = [_pattern_native(value) for value in source["dead_patterns"]]
    patterns = _dedupe_canonical(raw_patterns)
    print(
        f"input dead={len(raw_patterns)} canonical={len(patterns)} "
        f"sha256={source_sha256}",
        flush=True,
    )
    if args.dry_run:
        return 0

    state_path = args.output.with_suffix(args.output.suffix + ".state.json")
    if state_path.exists():
        state = json.loads(state_path.read_text(encoding="utf-8"))
        if (
            state.get("schema") != STATE_SCHEMA
            or state.get("source_sha256") != source_sha256
        ):
            raise RuntimeError("shrink state disagrees with input generation")
        patterns = [_pattern_native(value) for value in state["patterns"]]
    else:
        state = {
            "schema": STATE_SCHEMA,
            "status": "running",
            "source": str(args.input),
            "source_sha256": source_sha256,
            "bank_rows": source["bank_rows"],
            "bank_sha256": source["bank_sha256"],
            "iteration": source["iteration"],
            "k": source["k"],
            "input_dead_count": len(raw_patterns),
            "canonical_input_count": len(patterns),
            "patterns": [_pattern_json(pattern) for pattern in patterns],
            "rounds": [],
        }
        atomic_write_json(state_path, state)

    start_round = 1 + len(state["rounds"])
    converged = False
    for round_number in range(start_round, args.max_rounds + 1):
        updated, report = _dispatch_round(
            patterns, round_number, args.timeout, args.chunk_size,
            int(source["iteration"]),
        )
        if updated is None:
            state["status"] = "partial"
            state["last_partial_round"] = report
            atomic_write_json(state_path, state)
            print(
                f"round {round_number} partial; state preserved for retry",
                flush=True,
            )
            return 1
        state.pop("last_partial_round", None)
        state["rounds"].append(report)
        patterns = updated
        state["patterns"] = [_pattern_json(pattern) for pattern in patterns]
        state["status"] = "running"
        atomic_write_json(state_path, state)
        print(
            f"round {round_number}: improved={report['improved_patterns']} "
            f"workers={','.join(report['workers']) or '-'}",
            flush=True,
        )
        if report["improved_patterns"] == 0:
            converged = True
            break

    if not converged:
        state["status"] = "round-limit"
        atomic_write_json(state_path, state)
        print(
            f"round limit reached with further shrink possible; "
            f"state preserved at {state_path}",
            flush=True,
        )
        return 1

    shrunk = _dedupe_canonical(patterns)
    output = {
        "schema": OUTPUT_SCHEMA,
        "status": "complete",
        "source": str(args.input),
        "source_sha256": source_sha256,
        "bank_rows": source["bank_rows"],
        "bank_sha256": source["bank_sha256"],
        "iteration": source["iteration"],
        "k": source["k"],
        "input_dead_count": len(raw_patterns),
        "canonical_input_count": state["canonical_input_count"],
        "shrunk_canonical_count": len(shrunk),
        "shrunk_patterns": [_pattern_json(pattern) for pattern in shrunk],
        "shrunk_patterns_sha256": _pattern_sha(shrunk),
        "rounds": state["rounds"],
        "trust": (
            "heuristic remote greedy shrink; exact local certification and "
            "authoritative generation recheck remain mandatory"
        ),
    }
    atomic_write_json(args.output, output)
    state["status"] = "complete"
    atomic_write_json(state_path, state)
    print(
        f"complete: {len(raw_patterns)} dead -> {len(shrunk)} canonical "
        f"shrunk patterns output={args.output}",
        flush=True,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
