#!/usr/bin/env python3
"""Pull-based census-554 work-queue client. Launch one on any system.

Successor to flux_worker/remote_certify_worker.py: instead of one dedicated
remote host, ANY number of these clients — on the driver's own machine, on
flux, on anything with the NFS bridge mounted — pull jobs from a shared
queue directory and race to claim them (atomic same-directory rename; the
loser of a claim race just moves on). The frontier-loop driver is the only
producer and the only consumer of results; clients never touch bank.jsonl,
driver.lock, or any other live-loop state.

Queue layout under --queue-root (env CENSUS554_QUEUE_ROOT):
    jobs/        job files, <stem>.json; claimed by rename to .claimed
    results/     result files, <stem>.json, atomic write-then-rename
    done/        consumed job files (archive)
    heartbeats/  <hostname>.json, refreshed every poll cycle:
                 {"worker": <host>, "workers": N, "ts": <unix>,
                  "inflight": M}
                 The driver reads these to decide whether any live capacity
                 exists (skip the queue entirely when none) and to size
                 result deadlines.

Job file formats:

1. Certify (bare pattern, keys are all numeric center strings):
    {"3": [5, 9], "5": [3, 8, 9], "8": [3, 5, 9]}
   Result: {"pattern": <job pattern>, "certificate": <dict or null>,
            "elapsed": <s>, "worker": <host>}

2. Mining batch:
    {"type": "mine_batch", "patterns": [<pattern>, ...], "timeout": 20}
   Each pattern is checked with miner.pattern_dead_fast (msolve oracle,
   heuristic-only: the driver exactly re-proves every banked motif with
   certify_pattern, so a wrong flag costs cycles, never soundness).
   Result: {"type": "mine_batch", "flags": [<bool>, ...], "elapsed": <s>,
            "worker": <host>, "errors": [{"index": i, "error": "..."}]?}

3. Typed certify (per-job timeout, used by the retry-backlog drainer):
    {"type": "certify", "pattern": <pattern>, "timeout": 7200}
   Same result shape as format 1; the job's timeout overrides the
   worker's --cert-timeout for this job only.

Requirements on the host: python3.10+, msolve and Singular on PATH, the
queue root mounted. Stdlib only. See run_worker.sh / README.md.
"""

from __future__ import annotations

import argparse
import json
import os
import signal
import socket
import sys
import time
import uuid
from concurrent.futures import ProcessPoolExecutor, Future
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import miner  # noqa: E402  (standalone copy in this directory)

DEFAULT_QUEUE_ROOT = os.environ.get(
    "CENSUS554_QUEUE_ROOT", "/opt/nfs/erdos9796-flux-bridge")
DEFAULT_CERT_TIMEOUT = 900
DEFAULT_POLL_INTERVAL = 1.0
HEARTBEAT_EVERY = 5.0

CLAIM_SUFFIX = ".claimed"


# ---------------- atomic write (mirrors io_protocol.atomic_write_json) ------

def atomic_write_json(path: Path, value) -> None:
    """Write JSON through a same-directory temp file, fsync, and rename,
    so a concurrent reader never observes a torn file."""
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(f".{path.name}.tmp-{os.getpid()}-{uuid.uuid4().hex}")
    try:
        with open(tmp, "x", encoding="utf-8", newline="") as handle:
            json.dump(value, handle, sort_keys=True, indent=2)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(tmp, path)
        fd = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(fd)
        finally:
            os.close(fd)
    finally:
        try:
            tmp.unlink()
        except FileNotFoundError:
            pass


# ---------------- jobs (run in ProcessPoolExecutor children) ----------------

def certify_job(claimed_path_str: str, cert_timeout: int):
    """Certify one bare-pattern job file. Returns everything the parent
    needs to publish the result and retire the job file."""
    claimed_path = Path(claimed_path_str)
    started = time.time()
    try:
        pattern_json = json.loads(claimed_path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        return claimed_path_str, None, None, time.time() - started, repr(exc)
    if isinstance(pattern_json, dict) and pattern_json.get("type") == "certify":
        cert_timeout = int(pattern_json.get("timeout", cert_timeout))
        pattern_json = pattern_json.get("pattern") or {}
    try:
        pattern = {int(c): frozenset(members)
                   for c, members in pattern_json.items()}
        certificate = miner.certify_pattern(pattern, timeout=cert_timeout)
        error = None
    except Exception as exc:  # noqa: BLE001 -- surface any failure to the job
        certificate = None
        error = repr(exc)
    return (claimed_path_str, pattern_json, certificate,
            time.time() - started, error)


def mine_flag_job(pattern_json_item, timeout: int):
    """msolve deadness oracle on one mine_batch member. Heuristic-only."""
    started = time.time()
    try:
        pattern = {int(c): frozenset(members)
                   for c, members in pattern_json_item.items()}
        flag = bool(miner.pattern_dead_fast(pattern, timeout))
        error = None
    except Exception as exc:  # noqa: BLE001
        flag = False
        error = repr(exc)
    return flag, time.time() - started, error


# ---------------- daemon loop ----------------

class Worker:
    def __init__(self, queue_root: Path, workers: int, poll_interval: float,
                 cert_timeout: int, mine_only: bool = False):
        self.jobs_dir = queue_root / "jobs"
        self.results_dir = queue_root / "results"
        self.done_dir = queue_root / "done"
        self.heartbeat_path = (queue_root / "heartbeats"
                               / f"{socket.gethostname()}.json")
        self.hostname = socket.gethostname()
        self.workers = workers
        self.poll_interval = poll_interval
        self.cert_timeout = cert_timeout
        self.mine_only = mine_only
        for d in (self.jobs_dir, self.results_dir, self.done_dir,
                  self.heartbeat_path.parent):
            try:
                d.mkdir(parents=True, exist_ok=True)
            except OSError:
                # Some NFS uid mappings deny mkdir at the bridge root even
                # for dirs that already exist (EPERM instead of EEXIST).
                # Only fail if the directory is genuinely absent.
                if not d.is_dir():
                    raise
        self.executor = ProcessPoolExecutor(max_workers=workers)
        self.inflight: dict[Future, str] = {}
        self.mine_inflight: dict[Future, tuple[str, int]] = {}
        self.mine_groups: dict[str, dict] = {}
        self._stop = False
        self._last_heartbeat = 0.0

    def request_stop(self, *_args):
        self._stop = True

    # -- heartbeat --

    def _heartbeat(self):
        now = time.time()
        if now - self._last_heartbeat < HEARTBEAT_EVERY:
            return
        self._last_heartbeat = now
        try:
            atomic_write_json(self.heartbeat_path, {
                "worker": self.hostname,
                "workers": self.workers,
                "ts": now,
                "inflight": len(self.inflight) + len(self.mine_inflight),
            })
        except OSError:
            pass  # heartbeat is advisory; never let it kill the worker

    # -- claiming --

    def _slots_free(self) -> int:
        return self.workers - len(self.inflight) - len(self.mine_inflight)

    def _claim_new_jobs(self):
        # Claim only up to free slots so jobs left in the queue stay
        # claimable by other clients (load balancing across hosts).
        if self._slots_free() <= 0:
            return
        try:
            entries = sorted(self.jobs_dir.iterdir())
        except FileNotFoundError:
            return
        for entry in entries:
            if self._slots_free() <= 0:
                return
            name = entry.name
            if not name.endswith(".json") or name.startswith("."):
                continue
            if name.endswith(CLAIM_SUFFIX):
                continue
            if self.mine_only and not name.startswith("mine-"):
                continue
            claimed = entry.with_name(name + CLAIM_SUFFIX)
            try:
                os.rename(entry, claimed)
            except (FileNotFoundError, OSError):
                continue  # another client won the claim race
            payload = None
            try:
                payload = json.loads(claimed.read_text(encoding="utf-8"))
            except (OSError, json.JSONDecodeError):
                pass  # certify_job re-reads and reports the error itself
            if isinstance(payload, dict) and payload.get("type") == "mine_batch":
                self._start_mine_group(claimed, payload)
                continue
            fut = self.executor.submit(certify_job, str(claimed),
                                       self.cert_timeout)
            self.inflight[fut] = claimed.name
            print(f"[claimed] {name}", flush=True)

    def _start_mine_group(self, claimed: Path, payload: dict):
        stem = claimed.name[:-len(".json" + CLAIM_SUFFIX)]
        patterns = payload.get("patterns") or []
        timeout = int(payload.get("timeout", 20))
        group = {
            "stem": stem,
            "claimed_name": claimed.name,
            "flags": [False] * len(patterns),
            "errors": [],
            "pending": len(patterns),
            "started": time.time(),
        }
        if not patterns:
            self._finish_mine_group(group)
            return
        self.mine_groups[claimed.name] = group
        for idx, pattern_json_item in enumerate(patterns):
            fut = self.executor.submit(mine_flag_job, pattern_json_item,
                                       timeout)
            self.mine_inflight[fut] = (claimed.name, idx)
        print(f"[claimed] {claimed.name[:-len(CLAIM_SUFFIX)]} "
              f"(mine_batch, {len(patterns)} patterns, timeout {timeout}s)",
              flush=True)

    # -- publishing --

    def _retire_job(self, claimed_name: str, stem: str):
        claimed_path = self.jobs_dir / claimed_name
        try:
            os.replace(claimed_path, self.done_dir / f"{stem}.json")
        except (FileNotFoundError, OSError):
            try:
                claimed_path.unlink()
            except (FileNotFoundError, OSError):
                pass

    def _finish_mine_group(self, group: dict):
        result = {
            "type": "mine_batch",
            "flags": group["flags"],
            "elapsed": time.time() - group["started"],
            "worker": self.hostname,
        }
        if group["errors"]:
            result["errors"] = group["errors"]
        atomic_write_json(self.results_dir / f"{group['stem']}.json", result)
        self._retire_job(group["claimed_name"], group["stem"])
        print(f"[done] {group['stem']} mine_batch "
              f"{sum(group['flags'])}/{len(group['flags'])} dead "
              f"errors={len(group['errors'])} "
              f"elapsed={time.time() - group['started']:.1f}s", flush=True)

    def _drain_completed(self):
        # mine groups
        for fut in [f for f in list(self.mine_inflight) if f.done()]:
            group_key, idx = self.mine_inflight.pop(fut)
            group = self.mine_groups[group_key]
            try:
                flag, _elapsed, error = fut.result()
            except Exception as exc:  # noqa: BLE001
                flag, error = False, repr(exc)
            group["flags"][idx] = bool(flag)
            if error is not None:
                group["errors"].append({"index": idx, "error": error})
            group["pending"] -= 1
            if group["pending"] == 0:
                self._finish_mine_group(self.mine_groups.pop(group_key))
        # certify jobs
        for fut in [f for f in list(self.inflight) if f.done()]:
            claimed_name = self.inflight.pop(fut)
            stem = claimed_name[:-len(".json" + CLAIM_SUFFIX)]
            try:
                (_claimed_path_str, pattern_json, certificate, elapsed,
                 error) = fut.result()
            except Exception as exc:  # noqa: BLE001
                pattern_json, certificate, elapsed, error = (None, None, 0.0,
                                                             repr(exc))
            result = {
                "pattern": pattern_json,
                "certificate": certificate,
                "elapsed": elapsed,
                "worker": self.hostname,
            }
            if error is not None:
                result["error"] = error
            atomic_write_json(self.results_dir / f"{stem}.json", result)
            self._retire_job(claimed_name, stem)
            kill = certificate.get("kill") if certificate else None
            print(f"[done] {stem} kill={kill} error={error} "
                  f"elapsed={elapsed:.1f}s", flush=True)

    def run_forever(self):
        signal.signal(signal.SIGTERM, self.request_stop)
        signal.signal(signal.SIGINT, self.request_stop)
        print(f"[worker] host={self.hostname} queue={self.jobs_dir.parent} "
              f"workers={self.workers} cert_timeout={self.cert_timeout}",
              flush=True)
        try:
            while not self._stop:
                self._heartbeat()
                self._claim_new_jobs()
                self._drain_completed()
                time.sleep(self.poll_interval)
        finally:
            print("[worker] stopping: waiting for in-flight jobs", flush=True)
            self.executor.shutdown(wait=True)
            self._drain_completed()
            try:
                self.heartbeat_path.unlink()
            except (FileNotFoundError, OSError):
                pass
            print("[worker] stopped", flush=True)


def parse_args(argv=None):
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument("--queue-root", default=DEFAULT_QUEUE_ROOT,
                   help="NFS queue root (jobs/, results/, done/, heartbeats/)")
    p.add_argument("--workers", type=int, default=max(1, os.cpu_count() - 2))
    p.add_argument("--poll-interval", type=float, default=DEFAULT_POLL_INTERVAL)
    p.add_argument("--cert-timeout", type=int, default=DEFAULT_CERT_TIMEOUT)
    p.add_argument("--mine-only", action="store_true",
                   help="claim only mine-* jobs; skip certify/retrycert "
                        "(for low-RAM hosts — cert Singular runs 20-42G)")
    return p.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    worker = Worker(
        queue_root=Path(args.queue_root),
        workers=args.workers,
        poll_interval=args.poll_interval,
        cert_timeout=args.cert_timeout,
        mine_only=args.mine_only,
    )
    worker.run_forever()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
