#!/usr/bin/env python3
"""Queue-backed drain of frontier_loop CERTIFY FAILED patterns.

Same scan/dedupe/deadness-recheck discipline as retry_certify_queue.py
(the serial predecessor), but certification dispatches through the shared
NFS work queue as typed jobs ({"type": "certify", "pattern": ..,
"timeout": ..}) so the whole worker fleet races the backlog in parallel.
A sliding submission window (--max-inflight, default 20) leaves queue
capacity for the live frontier loop's own 900s certify bursts and mining
chunks.

Successful rows are stored atomically, one file per canonical pattern, under
retry_certified_pending.d/.  A compact key index makes restart deduplication
independent of certificate size.  Legacy JSON/JSONL pending files are migrated
and indexed once in a short-lived helper, so their multi-gigabyte decode heap
is returned to the OS instead of being retained by this long-lived process.
Queue results are converted by the same disposable-helper pattern.

This script NEVER banks — merge pending records manually at a safe moment,
exactly like the serial script.

Run OUTSIDE the Claude sandbox (NFS access) with live worker heartbeats:
    uv run python retry_certify_drain.py [--max-inflight N] [--timeout S]
"""
import argparse
import json
import os
import sys
import time
import uuid
from pathlib import Path

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
# queue_client.submit imports census.census_554.io_protocol -> repo root
sys.path.insert(0, os.path.dirname(os.path.dirname(HERE)))
import cover_probe as cp  # noqa: E402
import pending_cert_store as pcs  # noqa: E402
import queue_client as qc  # noqa: E402
import retry_certify_queue as rq  # noqa: E402
from concurrent.futures import ThreadPoolExecutor  # noqa: E402

PENDING_STORE = Path(HERE) / "retry_certified_pending.d"
LEGACY_INDEX = PENDING_STORE / "legacy-index.json"
LEGACY_SOURCES = (
    Path(HERE) / "retry_certified_pending.json",
    Path(HERE) / "retry_certified_pending.jsonl",
    Path(HERE) / "retry_iter585_certified.json",
)
DEADCHECK_TIMEOUT = 300
DEADCHECK_WORKERS = 12
CLAIM_MARGIN_S = 3600  # queue wait + NFS latency headroom past the timeout


def load_done_all():
    store = pcs.PendingCertificateStore(PENDING_STORE)
    done = store.done_digests()
    try:
        legacy = pcs.load_legacy_index(
            LEGACY_INDEX, LEGACY_SOURCES, store_root=PENDING_STORE
        )
    except (FileNotFoundError, pcs.PendingStoreError,
            json.JSONDecodeError):
        print("legacy pending migration/index missing or stale; rebuilding "
              "in disposable helper (one-time)", flush=True)
        legacy = pcs.ensure_legacy_index(
            LEGACY_INDEX, LEGACY_SOURCES, store_root=PENDING_STORE
        )
        print(f"legacy pending migration/index ready: {len(legacy)} "
              "canonical records", flush=True)
    done.update(legacy)
    return done


def gc_own_stale_results():
    qc.gc_stale_results(prefixes=("retrycert-",))


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--max-inflight", type=int, default=20,
                    help="sliding window size; keep below fleet capacity "
                         "so the hot loop retains slots")
    ap.add_argument("--timeout", type=int, default=rq.RETRY_TIMEOUT,
                    help="per-job certify timeout (worker-side)")
    args = ap.parse_args()

    capacity = qc.live_capacity()
    if capacity <= 0:
        print("no live worker heartbeats; start workers first", flush=True)
        return 1
    gc_own_stale_results()

    fails = rq.scan_failures()
    bank_motifs = {pcs.pattern_digest(p) for p in cp.load_bank()}
    done = load_done_all()
    todo, seen = [], set()
    for pj, cube in fails:
        pat = {int(c): frozenset(M) for c, M in pj.items()}
        key = pcs.pattern_digest(pat)
        if key in bank_motifs or key in done or key in seen:
            continue
        seen.add(key)
        todo.append((pj, pat, cube))
    print(f"{len(fails)} failures in log, {len(todo)} to retry "
          f"(fleet capacity {capacity}, window {args.max_inflight}, "
          f"timeout {args.timeout}s)", flush=True)
    if not todo:
        return 0

    # Exact deadness recheck, parallel + local (same oracle and timeout as
    # the serial script; protects fleet cycles, not soundness).
    with ThreadPoolExecutor(max_workers=DEADCHECK_WORKERS) as ex:
        dead_flags = list(ex.map(
            lambda t: rq._exact_dead(t[1], DEADCHECK_TIMEOUT), todo))
    confirmed = [t for t, d in zip(todo, dead_flags) if d is True]
    for (pj, _pat, _cube), d in zip(todo, dead_flags):
        if d is not True:
            print(f"SKIP (not confirmed dead): {json.dumps(pj)}", flush=True)
    print(f"{len(confirmed)}/{len(todo)} confirmed dead; dispatching",
          flush=True)

    window = {}  # stem -> (pj, cube, submitted_ts)
    queue = list(reversed(confirmed))  # pop() consumes in original order
    certified = failed = orphaned = 0
    while window or queue:
        while queue and len(window) < args.max_inflight:
            pj, _pat, cube = queue.pop()
            stem = f"retrycert-{uuid.uuid4().hex[:12]}"
            qc.submit(stem, {"type": "certify", "pattern": pj,
                             "timeout": args.timeout})
            window[stem] = (pj, cube, time.time())
        # readdir-based polling only (macOS NFS negative-dentry rule).
        try:
            names = set(os.listdir(qc.RESULTS_DIR))
        except OSError:
            names = set()
        now = time.time()
        for stem in sorted(window):
            pj, cube, submitted = window[stem]
            if f"{stem}.json" in names:
                path = qc.RESULTS_DIR / f"{stem}.json"
                try:
                    status = pcs.consume_queue_result_isolated(
                        path, pj, cube, PENDING_STORE
                    )
                except (OSError, pcs.PendingStoreError) as exc:
                    # Leave the result and window entry intact. A torn NFS
                    # read or failed helper is retryable and must not discard
                    # a successfully computed certificate.
                    print(f"RESULT RETAINED for retry ({stem}): {exc}",
                          flush=True)
                    continue
                try:
                    path.unlink()
                except (FileNotFoundError, OSError):
                    pass
                del window[stem]
                dt = status.get("elapsed", 0.0)
                who = status.get("worker", "?")
                if status["outcome"] == "certified":
                    certified += 1
                    disposition = "stored" if status["stored"] else "existing"
                    print(f"CERTIFIED kill={status['kill']} {disposition} "
                          f"({dt:.0f}s, {who}) {json.dumps(pj)}", flush=True)
                else:
                    failed += 1
                    err = status.get("error")
                    print(f"FAILED again ({dt:.0f}s, {who}"
                          f"{', ' + err if err else ''}) {json.dumps(pj)}",
                          flush=True)
            elif now - submitted > args.timeout + CLAIM_MARGIN_S:
                del window[stem]
                orphaned += 1
                qc.cancel([stem])
                print(f"NO RESULT by deadline (orphaned {stem}) "
                      f"{json.dumps(pj)}", flush=True)
        if window or queue:
            time.sleep(qc.POLL_INTERVAL)
    print(f"done: {certified} certified -> {PENDING_STORE}, "
          f"{failed} failed again, {orphaned} orphaned", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
