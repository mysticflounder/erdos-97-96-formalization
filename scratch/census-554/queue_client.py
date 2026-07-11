"""Driver-side helpers for the shared census-554 NFS work queue.

The queue model (env CENSUS554_QUEUE=1): the frontier-loop driver is the
single producer — it enqueues mining-oracle batches and certify jobs as
files under <queue-root>/jobs/ — and the single result consumer. Any
number of pull-based clients (scratch/census-554/worker/, launchable on
any host with the bridge mounted) race to claim jobs and publish results
under <queue-root>/results/. Claim-by-rename makes the race safe; the
worker package's README documents the wire formats.

Liveness: workers refresh <queue-root>/heartbeats/<host>.json every ~5s.
live_capacity() sums process slots across fresh heartbeats; the driver
skips the queue entirely (pure local compute) when it returns 0, so the
census never stalls because workers went away.

All result polling goes through directory listings, never per-name
lookups: a lookup that races the remote write plants a macOS NFS negative
dentry that repeated polling keeps warm, making an existing file read as
absent for minutes (root-caused 2026-07-10 on the first live mine batch).
"""

from __future__ import annotations

import json
import os
import time
import uuid
from pathlib import Path

QUEUE_ENABLED = os.environ.get("CENSUS554_QUEUE", "0") == "1"
QUEUE_ROOT = Path(os.environ.get(
    "CENSUS554_QUEUE_ROOT", "/opt/nfs/erdos9796-flux-bridge"))
JOBS_DIR = QUEUE_ROOT / "jobs"
RESULTS_DIR = QUEUE_ROOT / "results"
HEARTBEATS_DIR = QUEUE_ROOT / "heartbeats"
POLL_INTERVAL = float(os.environ.get("CENSUS554_REMOTE_POLL_S", "2.0"))
MARGIN_S = int(os.environ.get("CENSUS554_REMOTE_MARGIN_S", "120"))
HEARTBEAT_FRESH_S = int(os.environ.get("CENSUS554_HEARTBEAT_FRESH_S", "120"))
STALE_RESULT_S = 3600


def enabled() -> bool:
    return QUEUE_ENABLED


def _atomic_write_json(path, value):
    from census.census_554.io_protocol import atomic_write_json
    atomic_write_json(path, value)


def live_capacity() -> int:
    """Total process slots across workers with a fresh heartbeat."""
    now = time.time()
    total = 0
    try:
        entries = list(HEARTBEATS_DIR.iterdir())
    except OSError:
        return 0
    for entry in entries:
        # Skip dotfiles: macOS drops AppleDouble `._<name>.json` metadata
        # files on NFS, and they are neither UTF-8 nor JSON.
        if entry.suffix != ".json" or entry.name.startswith("."):
            continue
        try:
            data = json.loads(entry.read_text(encoding="utf-8"))
        except (OSError, UnicodeDecodeError, json.JSONDecodeError):
            continue
        if now - float(data.get("ts", 0)) <= HEARTBEAT_FRESH_S:
            total += int(data.get("workers", 0))
    return total


def new_stem(prefix: str) -> str:
    return f"{prefix}-{uuid.uuid4().hex}"


def submit(stem: str, payload) -> None:
    _atomic_write_json(JOBS_DIR / f"{stem}.json", payload)


def cancel(stems) -> int:
    """Best-effort removal of not-yet-claimed jobs (early stop). Claimed
    jobs run to completion as orphans; their results are GC'd later."""
    cancelled = 0
    for stem in stems:
        job = JOBS_DIR / f"{stem}.json"
        grabbed = job.with_name(f".{stem}.cancel-{uuid.uuid4().hex}")
        try:
            os.rename(job, grabbed)
        except (FileNotFoundError, OSError):
            continue  # already claimed by a worker
        try:
            grabbed.unlink()
        except (FileNotFoundError, OSError):
            pass
        cancelled += 1
    return cancelled


def gc_stale_results(prefixes=("mine-", "cert-")) -> None:
    """Remove orphaned result files nobody will consume (early-stopped
    mine batches, certify jobs that already fell back locally)."""
    now = time.time()
    try:
        entries = list(RESULTS_DIR.iterdir())
    except OSError:
        return
    for entry in entries:
        if entry.suffix != ".json":
            continue
        if not any(entry.name.startswith(p) for p in prefixes):
            continue
        try:
            if now - entry.stat().st_mtime > STALE_RESULT_S:
                entry.unlink()
        except OSError:
            pass


def poll(stems, deadline, on_result=None):
    """Collect results for `stems` until all arrive or `deadline` passes.
    Returns (completed: {stem: data}, missing: [stem]). Consumed result
    files are unlinked. `on_result(stem, data)` fires as each arrives, so
    callers can act on partial progress (e.g. mining early stop — return
    False from on_result to stop polling immediately)."""
    pending = set(stems)
    completed = {}
    while pending and time.time() < deadline:
        try:
            names = set(os.listdir(RESULTS_DIR))
        except OSError:
            names = set()
        for stem in sorted(pending):
            if f"{stem}.json" not in names:
                continue
            result_path = RESULTS_DIR / f"{stem}.json"
            try:
                with open(result_path, encoding="utf-8") as handle:
                    data = json.load(handle)
            except (OSError, json.JSONDecodeError):
                continue  # torn read raced the atomic rename; retry
            try:
                result_path.unlink()
            except (FileNotFoundError, OSError):
                pass
            pending.discard(stem)
            completed[stem] = data
            if on_result is not None and on_result(stem, data) is False:
                return completed, sorted(pending)
        if pending:
            time.sleep(POLL_INTERVAL)
    return completed, sorted(pending)
