"""Hybrid local+flux dispatch for the census-554 mining oracle.

Extends the flux NFS-bridge offload (see frontier_loop.py's certify
dispatch and flux_worker/remote_certify_worker.py) to the mining stage:
`miner._dead_supports_min_k`'s per-k-level `pattern_dead_fast` scans.
Gated by CENSUS554_REMOTE_MINE=1 (default off; miner.py behavior is
byte-identical when disabled or when a k-level is below MIN_CANDS).

Dispatch is at k-level granularity, not per-round: the remote share of a
level's candidates goes out as ONE `mine_batch` job file, so the measured
~17s NFS negative-lookup-cache latency is paid once per level instead of
once per 20s round (where it would erase the gain). The flux daemon fans
the batch out to its own process pool and writes back a single flags
array.

Soundness: pattern_dead_fast is a heuristic *selection* oracle only —
every banked motif is exactly re-proved by miner.certify_pattern (Singular
lift + Fraction re-check). A wrong remote flag (e.g. from the msolve
version skew: 0.7.5 on flux vs 0.10.0 locally) costs cycles, never
correctness: a false positive dies in certify, a false negative just
leaves a candidate unmined this iteration.

Early stop: when the local share hits the k-level's dead target first,
the remote job is orphaned (the daemon still computes and writes its
result; nobody reads it). Orphaned result files are garbage-collected
opportunistically on the next submit (mine-* results older than an hour).
"""

from __future__ import annotations

import json
import math
import os
import time
import uuid
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

ENABLED = os.environ.get("CENSUS554_REMOTE_MINE", "0") == "1"
REMOTE_WORKERS = int(os.environ.get("CENSUS554_REMOTE_MINE_WORKERS", "16"))
MIN_CANDS = int(os.environ.get("CENSUS554_REMOTE_MINE_MIN_CANDS", "64"))
MINE_CHUNK = int(os.environ.get("CENSUS554_MINE_CHUNK", "16"))
JOBS_DIR = Path(os.environ.get(
    "CENSUS554_REMOTE_JOBS_DIR", "/opt/nfs/erdos9796-flux-bridge/jobs"))
RESULTS_DIR = Path(os.environ.get(
    "CENSUS554_REMOTE_RESULTS_DIR", "/opt/nfs/erdos9796-flux-bridge/results"))
POLL_INTERVAL = float(os.environ.get("CENSUS554_REMOTE_POLL_S", "2.0"))
MARGIN_S = int(os.environ.get("CENSUS554_REMOTE_MARGIN_S", "120"))
STALE_RESULT_S = 3600


def enabled():
    """True when any remote mining mode is on: the shared work queue
    (CENSUS554_QUEUE=1, see queue_client.py) or the legacy single-host
    flux split (CENSUS554_REMOTE_MINE=1)."""
    import queue_client
    return queue_client.enabled() or ENABLED


def dead_scan(cands, target, local_workers, timeout, check, log):
    """Mode dispatcher for miner._dead_supports_min_k. Returns
    (dead, checked, early_stop), or None when no remote mode applies —
    the caller then runs its plain local batch loop."""
    import queue_client
    if queue_client.enabled():
        result = queue_dead_scan(cands, target, local_workers, timeout,
                                 check, log)
        if result is not None:
            return result
    if ENABLED:
        return hybrid_dead_scan(cands, target, local_workers, timeout,
                                check, log)
    return None


def queue_dead_scan(cands, target, local_workers, timeout, check, log):
    """Scan `cands` through the shared work queue: ALL candidates are
    enqueued as mine_batch chunks and any live worker (local host, flux,
    anything else with the bridge mounted) races to claim them. Returns
    None when no worker heartbeat is fresh — the caller falls back to
    fully local scanning, so the census never stalls on absent workers.
    Chunks missing at the deadline are scanned locally; early stop
    cancels still-unclaimed chunks and orphans claimed ones."""
    import queue_client as qc
    capacity = qc.live_capacity()
    if capacity <= 0:
        log("    [queue-mine] no live worker heartbeats; local scan")
        return None
    qc.gc_stale_results()

    n = len(cands)
    chunk_size = max(1, MINE_CHUNK)
    stem_indices = {}
    for lo in range(0, n, chunk_size):
        indices = list(range(lo, min(lo + chunk_size, n)))
        stem = qc.new_stem("mine")
        stem_indices[stem] = indices
        qc.submit(stem, {
            "type": "mine_batch",
            "patterns": [_pattern_json(cands[i]) for i in indices],
            "timeout": timeout,
        })
    log(f"    [queue-mine] {n} candidates -> {len(stem_indices)} chunks "
        f"(live capacity {capacity})")

    dead, checked = [], 0
    bad_stems = []

    def on_result(stem, data):
        nonlocal checked
        indices = stem_indices[stem]
        flags = data.get("flags") if isinstance(data, dict) else None
        if flags is None or len(flags) != len(indices):
            bad_stems.append(stem)
            return None
        checked += len(indices)
        dead.extend(cands[i] for i, f in zip(indices, flags) if f)
        if data.get("errors"):
            log(f"    [queue-mine] {len(data['errors'])} worker-side "
                f"errors in {stem} (flagged not-dead)")
        if target > 0 and len(dead) >= target:
            return False
        return None

    deadline = (time.time() + MARGIN_S +
                timeout * math.ceil(n / max(1, capacity)))
    _completed, missing = qc.poll(stem_indices, deadline, on_result)
    missing = list(missing) + bad_stems

    if target > 0 and len(dead) >= target:
        cancelled = qc.cancel(missing)
        log(f"    [queue-mine] early stop at {len(dead)} dead; "
            f"cancelled {cancelled} unclaimed chunks, orphaned "
            f"{len(missing) - cancelled}")
        return dead, checked, True

    if missing:
        leftover = [i for stem in missing for i in stem_indices[stem]]
        qc.cancel(missing)
        log(f"    [queue-mine] {len(leftover)} candidates unreturned by "
            f"deadline; local fallback")
        round_size = max(1, local_workers)
        with ThreadPoolExecutor(max_workers=local_workers) as ex:
            for lo in range(0, len(leftover), round_size):
                chunk = [cands[i] for i in leftover[lo:lo + round_size]]
                flags = list(ex.map(lambda p: check(p, timeout), chunk))
                checked += len(chunk)
                dead.extend(p for p, f in zip(chunk, flags) if f)
                if target > 0 and len(dead) >= target:
                    return dead, checked, True

    return dead, checked, (target > 0 and len(dead) >= target)


def _atomic_write_json(path, value):
    from census.census_554.io_protocol import atomic_write_json
    atomic_write_json(path, value)


def _gc_stale_results(now):
    """Best-effort removal of orphaned mine-* result files (early-stop
    leaves the remote job's result unread)."""
    try:
        entries = list(RESULTS_DIR.iterdir())
    except OSError:
        return
    for entry in entries:
        if not (entry.name.startswith("mine-") and entry.suffix == ".json"):
            continue
        try:
            if now - entry.stat().st_mtime > STALE_RESULT_S:
                entry.unlink()
        except OSError:
            pass


def _pattern_json(pat):
    return {str(c): sorted(pat[c]) for c in sorted(pat)}


def hybrid_dead_scan(cands, target, local_workers, timeout, check, log):
    """Scan `cands` (list of pattern dicts) for deadness using the local
    `check(pat, timeout)` oracle on a local share and one flux mine_batch
    job for the rest. Returns (dead, checked, early_stop) matching the
    semantics of miner._dead_supports_min_k's local batch loop: dead in
    candidate order, early_stop True when `target` > 0 dead were found
    before scanning everything (remaining candidates unchecked)."""
    n = len(cands)
    total = local_workers + max(1, REMOTE_WORKERS)
    local_idx = [i for i in range(n) if i % total < local_workers]
    remote_idx = [i for i in range(n) if i % total >= local_workers]

    stem = f"mine-{uuid.uuid4().hex}"
    payload = {
        "type": "mine_batch",
        "patterns": [_pattern_json(cands[i]) for i in remote_idx],
        "timeout": timeout,
    }
    _gc_stale_results(time.time())
    _atomic_write_json(JOBS_DIR / f"{stem}.json", payload)
    submitted = time.time()
    log(f"    [remote-mine] {len(remote_idx)}/{n} candidates -> flux "
        f"({stem}), {len(local_idx)} local ({local_workers} workers)")

    dead, checked = [], 0
    round_size = max(1, local_workers)
    with ThreadPoolExecutor(max_workers=local_workers) as ex:
        for lo in range(0, len(local_idx), round_size):
            chunk = [cands[i] for i in local_idx[lo:lo + round_size]]
            flags = list(ex.map(lambda p: check(p, timeout), chunk))
            checked += len(chunk)
            dead.extend(p for p, f in zip(chunk, flags) if f)
            if target > 0 and len(dead) >= target:
                log(f"    [remote-mine] local early stop at {len(dead)} "
                    f"dead; orphaning {stem}")
                return dead, checked, True

    # Poll by directory listing, never by per-name lookup: a lookup that
    # races the remote write plants a macOS NFS negative dentry that
    # repeated polling keeps warm — the file then reads as absent for
    # minutes after it exists (observed on the first live batch: flux
    # finished in 41s, the client's 200s window saw nothing). readdir is
    # not subject to per-name negative caching. Deadline is anchored at
    # poll start — the remote job has already been running for the whole
    # local-share scan, so this only adds slack.
    deadline = (time.time() + MARGIN_S +
                timeout * math.ceil(len(remote_idx) / max(1, REMOTE_WORKERS)))
    result_path = RESULTS_DIR / f"{stem}.json"
    data = None
    while time.time() < deadline:
        try:
            names = os.listdir(RESULTS_DIR)
        except OSError:
            names = []
        if result_path.name in names:
            try:
                with open(result_path, encoding="utf-8") as handle:
                    data = json.load(handle)
            except (OSError, json.JSONDecodeError):
                time.sleep(POLL_INTERVAL)  # torn read raced the rename
                continue
            try:
                result_path.unlink()
            except FileNotFoundError:
                pass
            break
        time.sleep(POLL_INTERVAL)

    flags = data.get("flags") if isinstance(data, dict) else None
    if flags is not None and len(flags) == len(remote_idx):
        checked += len(remote_idx)
        dead.extend(cands[i] for i, f in zip(remote_idx, flags) if f)
        errors = data.get("errors") or []
        if errors:
            log(f"    [remote-mine] {len(errors)} worker-side errors "
                f"(flagged not-dead)")
        log(f"    [remote-mine] flux returned {sum(map(bool, flags))}/"
            f"{len(flags)} dead in {data.get('elapsed', 0.0):.0f}s")
    else:
        log(f"    [remote-mine] no result for {stem} within "
            f"{deadline - submitted:.0f}s; local fallback for "
            f"{len(remote_idx)} candidates")
        with ThreadPoolExecutor(max_workers=local_workers) as ex:
            for lo in range(0, len(remote_idx), round_size):
                chunk = [cands[i] for i in remote_idx[lo:lo + round_size]]
                flags = list(ex.map(lambda p: check(p, timeout), chunk))
                checked += len(chunk)
                dead.extend(p for p, f in zip(chunk, flags) if f)
                if target > 0 and len(dead) >= target:
                    return dead, checked, True

    return dead, checked, False
