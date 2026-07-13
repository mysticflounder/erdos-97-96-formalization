#!/usr/bin/env python3
"""Crash-safe exact certification of one audited prefetched candidate.

The job is generation-checked before first submission, uses a deterministic
queue stem, and converts a successful result in a disposable helper into the
same one-record-per-certificate pending-store format consumed by
``frontier_add.py``.  It never acquires the driver lease or writes the bank.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import miner  # noqa: E402
import pending_cert_store as pcs  # noqa: E402
import queue_client as qc  # noqa: E402
from census.census_554.io_protocol import atomic_write_json  # noqa: E402


SCHEMA = "census554_prefetch_certify_one.v1"
AUDIT_SCHEMA = "census554_prefetch_candidate_audit.v1"
CLAIM_MARGIN_S = 3600


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _native(value):
    return {
        int(center): frozenset(int(member) for member in members)
        for center, members in value.items()
    }


def _stem_exists(queue_root: Path, stem: str) -> bool:
    candidates = (
        queue_root / "jobs" / f"{stem}.json",
        queue_root / "jobs" / f"{stem}.json.claimed",
        queue_root / "done" / f"{stem}.json",
        queue_root / "results" / f"{stem}.json",
    )
    return any(path.exists() for path in candidates)


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--audit", type=Path, required=True)
    parser.add_argument("--request", type=Path, required=True)
    parser.add_argument("--bank", type=Path, required=True)
    parser.add_argument("--queue-root", type=Path, required=True)
    parser.add_argument("--rank", type=int, required=True)
    parser.add_argument("--timeout", type=int, default=7200)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--store", type=Path, required=True)
    args = parser.parse_args(argv)
    if min(args.rank, args.timeout) <= 0:
        parser.error("rank and timeout must be positive")
    qc.QUEUE_ROOT = args.queue_root
    qc.JOBS_DIR = args.queue_root / "jobs"
    qc.RESULTS_DIR = args.queue_root / "results"
    qc.HEARTBEATS_DIR = args.queue_root / "heartbeats"

    audit = json.loads(args.audit.read_text(encoding="utf-8"))
    if audit.get("schema") != AUDIT_SCHEMA or audit.get("status") != "complete":
        parser.error("candidate audit is not complete")
    candidates = {
        int(record["rank"]): record for record in audit["ranked_candidates"]
    }
    if args.rank not in candidates:
        parser.error(f"rank {args.rank} is absent from candidate audit")
    candidate = candidates[args.rank]
    if candidate.get("exact_bank_duplicate"):
        parser.error("selected candidate is already in the audited bank")
    pattern_json = candidate["pattern"]
    pattern = _native(pattern_json)

    request = json.loads(args.request.read_text(encoding="utf-8"))
    cube_json = request["cube"]
    cube = {int(center): members for center, members in cube_json.items()}
    if not miner.contains(cube, pattern):
        parser.error("selected candidate is not contained in source cube")

    store = pcs.PendingCertificateStore(args.store)
    pattern_digest = pcs.pattern_digest(pattern_json)
    stem = (
        f"prefetchcert-i{int(audit['iteration']):04d}-r{args.rank:03d}-"
        f"{candidate['canonical_sha256'][:12]}"
    )
    expected = {
        "schema": SCHEMA,
        "audit": str(args.audit),
        "audit_sha256": _sha256(args.audit),
        "request": str(args.request),
        "request_sha256": _sha256(args.request),
        "generation": audit["generation"],
        "rank": args.rank,
        "canonical_sha256": candidate["canonical_sha256"],
        "pattern_digest": pattern_digest,
        "pattern": pattern_json,
        "cube": cube_json,
        "stem": stem,
        "timeout": args.timeout,
        "store": str(args.store),
    }
    if args.state.exists():
        state = json.loads(args.state.read_text(encoding="utf-8"))
        for key, value in expected.items():
            if state.get(key) != value:
                raise RuntimeError(f"state disagrees on {key}")
    else:
        if (
            _sha256(args.bank) != audit["generation"]["bank_sha256"]
            or sum(1 for line in args.bank.open() if line.strip())
            != int(audit["generation"]["bank_rows"])
        ):
            parser.error("live bank generation changed before submission")
        state = dict(expected)
        state.update({
            "status": "prepared",
            "prepared_utc": time.strftime(
                "%Y-%m-%dT%H:%M:%SZ", time.gmtime()
            ),
        })
        atomic_write_json(args.state, state)

    if pattern_digest in store.done_digests():
        state["status"] = "certified-pending"
        atomic_write_json(args.state, state)
        print("certificate already present in pending store", flush=True)
        return 0

    result_path = args.queue_root / "results" / f"{stem}.json"
    if not _stem_exists(args.queue_root, stem):
        qc.submit(stem, {
            "type": "certify",
            "pattern": pattern_json,
            "timeout": args.timeout,
            "provenance": {
                "schema": SCHEMA,
                "audit_sha256": expected["audit_sha256"],
                "rank": args.rank,
                "generation": audit["generation"],
            },
        })
        state["submitted_utc"] = time.strftime(
            "%Y-%m-%dT%H:%M:%SZ", time.gmtime()
        )
        state["submitted_ts"] = time.time()
        state["status"] = "submitted"
        atomic_write_json(args.state, state)
        print(f"submitted {stem}", flush=True)

    submitted_ts = float(state.get("submitted_ts", time.time()))
    deadline = submitted_ts + args.timeout + CLAIM_MARGIN_S
    while time.time() < deadline:
        try:
            names = set(os.listdir(args.queue_root / "results"))
        except OSError:
            names = set()
        if result_path.name in names:
            try:
                status = pcs.consume_queue_result_isolated(
                    result_path, pattern_json, cube_json, args.store
                )
            except (OSError, pcs.PendingStoreError) as exc:
                print(f"result retained for retry: {exc}", flush=True)
                time.sleep(qc.POLL_INTERVAL)
                continue
            try:
                result_path.unlink()
            except (FileNotFoundError, OSError):
                pass
            state["result"] = status
            state["status"] = (
                "certified-pending"
                if status["outcome"] == "certified"
                else "certify-failed"
            )
            state["completed_utc"] = time.strftime(
                "%Y-%m-%dT%H:%M:%SZ", time.gmtime()
            )
            atomic_write_json(args.state, state)
            print(json.dumps(status, sort_keys=True), flush=True)
            return 0 if status["outcome"] == "certified" else 1
        time.sleep(qc.POLL_INTERVAL)

    cancelled = qc.cancel([stem])
    state["status"] = "deadline-without-result"
    state["cancelled_unclaimed"] = cancelled
    atomic_write_json(args.state, state)
    print(f"deadline without result; cancelled_unclaimed={cancelled}", flush=True)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
