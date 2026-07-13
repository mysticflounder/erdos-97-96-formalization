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
import certification_backlog as cb  # noqa: E402
import exact_outcome_cache as eoc  # noqa: E402
import pending_cert_store as pcs  # noqa: E402
import queue_client as qc  # noqa: E402
import retry_certify_queue as rq  # noqa: E402
from concurrent.futures import ThreadPoolExecutor  # noqa: E402

PENDING_STORE = Path(HERE) / "retry_certified_pending.d"
BACKLOG = cb.CertificationBacklog(Path(HERE) / "certification_backlog.d")
OUTCOME_CACHE = eoc.ExactOutcomeCache(Path(HERE) / "exact_cert_outcomes.sqlite3")
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
    try:
        pcs.load_legacy_index(
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
    # Migration guarantees every legacy success has an atomic store record.
    # Use the bank's exact AUTOS key from those records; the legacy filename
    # digest is broader and can conflate bank-distinct patterns.
    return store.done_bank_digests()


def recover_orphan_results(requested_cpu_budget: int) -> tuple[int, int]:
    """Consume completed retry results left by an interrupted drainer.

    The queue result contains its exact pattern, so cube provenance may be
    absent without affecting certificate soundness or future bank novelty
    checks.  Result decoding remains isolated because certificates can be
    multiple gigabytes.
    """

    recovered = failed = 0
    try:
        bank_motifs = {
            pcs.bank_pattern_digest(pattern) for pattern in cp.load_bank()
        }
    except (OSError, ValueError, json.JSONDecodeError):
        bank_motifs = set()
    try:
        entries = sorted(qc.RESULTS_DIR.iterdir())
    except OSError:
        return recovered, failed
    for path in entries:
        if (
            not path.name.startswith(("retrycert-", "cert-i"))
            or path.suffix != ".json"
        ):
            continue
        try:
            pattern_json = pcs.read_json_pattern_tail(path)
            if pcs.bank_pattern_digest(pattern_json) in bank_motifs:
                try:
                    path.unlink()
                except (FileNotFoundError, OSError):
                    pass
                BACKLOG.complete(pattern_json, disposition="already-banked")
                print(
                    f"RECOVERED ORPHAN already banked ({path.name})",
                    flush=True,
                )
                continue
            status = pcs.consume_queue_result_isolated(
                path, pattern_json, None, PENDING_STORE
            )
        except (OSError, pcs.PendingStoreError) as exc:
            print(f"ORPHAN RESULT RETAINED ({path.name}): {exc}", flush=True)
            continue
        try:
            path.unlink()
        except (FileNotFoundError, OSError):
            pass
        result = {
            "certificate": (
                {"kill": status["kill"]}
                if status["outcome"] == "certified" else None
            ),
            "certification": status.get("certification"),
            "elapsed": status.get("elapsed", 0.0),
            "worker": status.get("worker", "?"),
        }
        OUTCOME_CACHE.record_result(
            pattern_json, result,
            requested_cpu_budget=requested_cpu_budget,
        )
        if status["outcome"] == "certified":
            BACKLOG.complete(pattern_json, disposition="certified-pending")
            recovered += 1
            print(
                f"RECOVERED ORPHAN kill={status['kill']} "
                f"{'stored' if status['stored'] else 'existing'} "
                f"({status.get('elapsed', 0.0):.0f}s, "
                f"{status.get('worker', '?')})",
                flush=True,
            )
        else:
            BACKLOG.mark_attempt(pattern_json, {
                "outcome": "failed-orphan-result",
                "elapsed": status.get("elapsed", 0.0),
                "worker": status.get("worker", "?"),
                "certification": status.get("certification"),
            })
            failed += 1
    return recovered, failed


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--max-inflight", type=int, default=20,
                    help="sliding window size; keep below fleet capacity "
                         "so the hot loop retains slots")
    ap.add_argument(
        "--timeout", type=int, default=rq.RETRY_TIMEOUT,
        help="cumulative process-plus-child CPU budget per retry job",
    )
    args = ap.parse_args()

    recovered, recovered_failures = recover_orphan_results(args.timeout)
    if recovered or recovered_failures:
        print(
            f"orphan recovery: {recovered} certified, "
            f"{recovered_failures} failed results",
            flush=True,
        )
    capacity = qc.live_capacity("certify")
    if capacity <= 0:
        print(
            "orphan recovery complete; no live certificate worker "
            "heartbeats, so no new retries were submitted",
            flush=True,
        )
        return 1

    fails = rq.scan_failures()
    for task in BACKLOG.pending():
        record = task.record
        fails.append((record["pattern"], record.get("cube")))
    bank_motifs = {pcs.bank_pattern_digest(p) for p in cp.load_bank()}
    done = load_done_all()
    todo, seen = [], set()
    cache_skipped = 0
    certifier_id = rq.miner.certifier_id()
    for pj, cube in fails:
        pat = {int(c): frozenset(M) for c, M in pj.items()}
        key = pcs.bank_pattern_digest(pat)
        if key in bank_motifs:
            BACKLOG.complete(pj, disposition="already-banked")
            continue
        if key in done:
            BACKLOG.complete(pj, disposition="already-certified-pending")
            continue
        if key in seen:
            continue
        reusable = OUTCOME_CACHE.reusable(
            pj,
            certifier_id=certifier_id,
            requested_cpu_budget=args.timeout,
        )
        if reusable is not None:
            cache_skipped += 1
            BACKLOG.mark_attempt(pj, {
                "outcome": "cache-skip",
                "cached_outcome": reusable.outcome,
                "cached_cpu_budget_seconds": reusable.cpu_budget_seconds,
                "requested_cpu_budget_seconds": args.timeout,
            })
            continue
        seen.add(key)
        todo.append((pj, pat, cube))
    print(f"{len(fails)} failures in log, {len(todo)} to retry "
          f"(fleet capacity {capacity}, window {args.max_inflight}, "
          f"CPU budget {args.timeout}s, cache skips {cache_skipped})", flush=True)
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
                    OUTCOME_CACHE.record_result(
                        pj, {
                            "certificate": {"kill": status["kill"]},
                            "certification": status.get("certification"),
                            "elapsed": dt,
                            "worker": who,
                        }, requested_cpu_budget=args.timeout,
                    )
                    BACKLOG.complete(pj, disposition="certified-pending")
                    certified += 1
                    disposition = "stored" if status["stored"] else "existing"
                    print(f"CERTIFIED kill={status['kill']} {disposition} "
                          f"({dt:.0f}s, {who}) {json.dumps(pj)}", flush=True)
                else:
                    OUTCOME_CACHE.record_result(
                        pj, {
                            "certificate": None,
                            "certification": status.get("certification"),
                            "elapsed": dt,
                            "worker": who,
                        }, requested_cpu_budget=args.timeout,
                    )
                    BACKLOG.mark_attempt(pj, {
                        "outcome": "failed",
                        "elapsed": dt,
                        "worker": who,
                        "certification": status.get("certification"),
                    })
                    failed += 1
                    err = status.get("error")
                    print(f"FAILED again ({dt:.0f}s, {who}"
                          f"{', ' + err if err else ''}) {json.dumps(pj)}",
                          flush=True)
            elif now - submitted > args.timeout + CLAIM_MARGIN_S:
                del window[stem]
                orphaned += 1
                qc.cancel([stem])
                BACKLOG.mark_attempt(pj, {
                    "outcome": "orphaned",
                    "requested_cpu_budget_seconds": args.timeout,
                })
                print(f"NO RESULT by deadline (orphaned {stem}) "
                      f"{json.dumps(pj)}", flush=True)
        if window or queue:
            time.sleep(qc.POLL_INTERVAL)
    print(f"done: {certified} certified -> {PENDING_STORE}, "
          f"{failed} failed again, {orphaned} orphaned", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
