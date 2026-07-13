#!/usr/bin/env python3
"""Remote NFS-queue certify worker for the census-554 CEGAR-to-UNSAT loop.

STANDALONE ADD-ON. This does NOT modify, import, or run concurrently with
scratch/census-554/frontier_loop.py, and it never touches bank.jsonl,
driver.lock, bank.jsonl.lock, or any other live-loop state. It is a separate
daemon meant to run on a second machine (e.g. flux.local) that polls a shared
NFS directory for pattern-certification jobs, certifies each with the
(copied, standalone) miner.certify_pattern, and writes results back to another
shared NFS directory using the same write-to-.tmp-then-atomic-rename discipline
as census/census_554/io_protocol.py's atomic_write_json, so a local reader on
the frontier-loop side never observes a partially written result file.

FUTURE INTEGRATION (design note, not implemented here): frontier_loop.py's
`_run` currently certifies each iteration's newly mined patterns with a local
`ProcessPoolExecutor(max_workers=WORKERS)` calling `certify_one` (see
frontier_loop.py:64-68, :336-357). A later change could replace that block
with a small hybrid dispatcher that (a) keeps a local ProcessPoolExecutor for
some fraction of the local CERT_WORKERS slots, (b) round-robins the remaining
new_patterns for an iteration into this module's jobs directory instead of a
local worker, and (c) polls the results directory (with a bounded timeout,
falling back to local certification for any job the remote side hasn't
finished in time) so the two pools drain into the same `rows` list that
`frontier_add.append_rows` already consumes. That dispatcher would live in
frontier_loop.py itself (or a thin adapter module it imports) and is a
deliberate follow-up decision -- it is not implemented by this file, which
only proves out the remote worker side in isolation.

Usage (daemon):
    python3 remote_certify_worker.py \\
        --jobs-dir /mnt/nfs/erdos9796-flux-bridge/jobs \\
        --results-dir /mnt/nfs/erdos9796-flux-bridge/results \\
        --done-dir /mnt/nfs/erdos9796-flux-bridge/done \\
        --workers 16

Job file formats (`<stem>.json` in --jobs-dir):

1. Certify (one pattern per file, the original format):
    {"3": [5, 9], "5": [3, 8, 9], "8": [3, 5, 9]}
(same shape as a bank.jsonl row's "pattern" field: str(center) -> sorted
member list.) Result file (`<stem>.json` in --results-dir):
    {"pattern": <same job pattern>, "certificate": <cert dict or null>,
     "elapsed": <seconds>, "worker": "flux"}

2. Mining batch (one flags scan per file; see scratch/census-554/
remote_mine.py for the submitting side):
    {"type": "mine_batch", "patterns": [<pattern>, ...], "timeout": 20}
Each pattern is checked with miner.pattern_dead_fast (msolve oracle,
heuristic-only: the frontier loop exactly re-proves every banked motif
with certify_pattern). Result file:
    {"type": "mine_batch", "flags": [<bool>, ...], "elapsed": <seconds>,
     "worker": "flux", "errors": [{"index": i, "error": "..."}]?}
The bare-pattern certify format never contains a "type" key (its keys are
all numeric center strings), so the two formats cannot collide.

Consumed job files are moved to --done-dir (default: deleted if --done-dir
is not given). All writes are atomic (temp file + os.rename within the same
directory) so a concurrent reader never sees a torn file. Stdlib only: this
file and its two sibling modules (miner.py, census554_lib.py, copied
verbatim except for a portable SCRATCH path in miner.py) import nothing
beyond the Python standard library -- msolve and Singular are invoked as
subprocesses, exactly as in the original census-554 driver.
"""

from __future__ import annotations

import argparse
import json
import os
import signal
import sys
import time
import uuid
from concurrent.futures import ProcessPoolExecutor, Future
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import miner  # noqa: E402  (standalone copy in this directory)

DEFAULT_JOBS_DIR = "/mnt/nfs/erdos9796-flux-bridge/jobs"
DEFAULT_RESULTS_DIR = "/mnt/nfs/erdos9796-flux-bridge/results"
DEFAULT_DONE_DIR = "/mnt/nfs/erdos9796-flux-bridge/done"
DEFAULT_CERT_TIMEOUT = 240
DEFAULT_WORKERS = 16
DEFAULT_POLL_INTERVAL = 1.0

CLAIM_SUFFIX = ".claimed"


# ---------------- atomic write (mirrors io_protocol.atomic_write_json) ------

def atomic_write_json(path: Path, value) -> None:
    """Write JSON through a same-directory temp file, fsync, and rename.

    Mirrors census/census_554/io_protocol.py's atomic_write_json exactly
    (temp file in the same directory, fsync before rename, directory fsync
    after) without importing that module, so this package has zero
    dependency on the rest of the repo and can be copied standalone to a
    machine that only has this directory.
    """
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


# ---------------- worker-side certification (runs in a child process) ------

def certify_job(claimed_path_str: str, cert_timeout: int):
    """Read a claimed job file, certify it, return everything the parent
    process needs to publish the result and retire the job file. Runs in a
    ProcessPoolExecutor worker process; must be picklable / import cleanly
    at module scope (matches frontier_loop.py's certify_one shape)."""
    claimed_path = Path(claimed_path_str)
    started = time.time()
    try:
        pattern_json = json.loads(claimed_path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        return (claimed_path_str, None, None, None,
                time.time() - started, repr(exc))
    try:
        pattern = {int(c): frozenset(members)
                   for c, members in pattern_json.items()}
        certificate, certification = miner.certify_pattern_with_stats(
            pattern, timeout=cert_timeout
        )
        error = None
    except Exception as exc:  # noqa: BLE001 -- surface any failure to the job
        certificate = None
        certification = None
        error = repr(exc)
    return (claimed_path_str, pattern_json, certificate, certification,
            time.time() - started, error)


def mine_flag_job(pattern_json_item, timeout: int):
    """Run the msolve deadness oracle on one member of a mine_batch job.
    Heuristic-only: the frontier loop exactly re-proves every banked motif
    with certify_pattern, so a wrong flag here costs cycles, never
    soundness. Runs in a ProcessPoolExecutor worker process."""
    started = time.time()
    try:
        pattern = {int(c): frozenset(members)
                   for c, members in pattern_json_item.items()}
        flag = bool(miner.pattern_dead_fast(pattern, timeout))
        error = None
    except Exception as exc:  # noqa: BLE001 -- surface any failure to the job
        flag = False
        error = repr(exc)
    return flag, time.time() - started, error


# ---------------- daemon loop ----------------

class Worker:
    def __init__(self, jobs_dir: Path, results_dir: Path, done_dir: Path | None,
                 workers: int, poll_interval: float, cert_timeout: int):
        self.jobs_dir = jobs_dir
        self.results_dir = results_dir
        self.done_dir = done_dir
        self.poll_interval = poll_interval
        self.cert_timeout = cert_timeout
        self.jobs_dir.mkdir(parents=True, exist_ok=True)
        self.results_dir.mkdir(parents=True, exist_ok=True)
        if self.done_dir is not None:
            self.done_dir.mkdir(parents=True, exist_ok=True)
        self.executor = ProcessPoolExecutor(max_workers=workers)
        self.inflight: dict[Future, str] = {}
        # mine_batch job fan-out: one claimed job file -> N per-pattern
        # futures, collected back into a single flags-array result file.
        self.mine_inflight: dict[Future, tuple[str, int]] = {}
        self.mine_groups: dict[str, dict] = {}
        self._stop = False

    def request_stop(self, *_args):
        self._stop = True

    def _claim_new_jobs(self):
        try:
            entries = sorted(self.jobs_dir.iterdir())
        except FileNotFoundError:
            return
        for entry in entries:
            name = entry.name
            if not name.endswith(".json") or name.startswith("."):
                continue
            if name.endswith(CLAIM_SUFFIX):
                continue
            claimed = entry.with_name(name + CLAIM_SUFFIX)
            try:
                os.rename(entry, claimed)
            except FileNotFoundError:
                continue  # another scan (or process) already claimed it
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

    def _finish_mine_group(self, group: dict):
        result = {
            "type": "mine_batch",
            "flags": group["flags"],
            "elapsed": time.time() - group["started"],
            "worker": "flux",
        }
        if group["errors"]:
            result["errors"] = group["errors"]
        atomic_write_json(self.results_dir / f"{group['stem']}.json", result)
        claimed_path = self.jobs_dir / group["claimed_name"]
        if self.done_dir is not None:
            try:
                os.replace(claimed_path, self.done_dir / f"{group['stem']}.json")
            except FileNotFoundError:
                pass
        else:
            try:
                claimed_path.unlink()
            except FileNotFoundError:
                pass
        print(f"[done] {group['stem']} mine_batch "
              f"{sum(group['flags'])}/{len(group['flags'])} dead "
              f"errors={len(group['errors'])} "
              f"elapsed={time.time() - group['started']:.1f}s", flush=True)

    def _drain_completed(self):
        self._drain_mine_completed()
        if not self.inflight:
            return
        done = [fut for fut in list(self.inflight) if fut.done()]
        for fut in done:
            claimed_name = self.inflight.pop(fut)
            claimed_path = self.jobs_dir / claimed_name
            stem = claimed_name[:-len(".json" + CLAIM_SUFFIX)]
            try:
                (claimed_path_str, pattern_json, certificate, certification,
                 elapsed, error) = fut.result()
            except Exception as exc:  # noqa: BLE001
                pattern_json, certificate, certification, elapsed, error = (
                    None, None, None, 0.0, repr(exc)
                )
            result = {
                "pattern": pattern_json,
                "certificate": certificate,
                "elapsed": elapsed,
                "worker": "flux",
            }
            if certification is not None:
                result["certification"] = certification
            if error is not None:
                result["error"] = error
            atomic_write_json(self.results_dir / f"{stem}.json", result)
            if self.done_dir is not None:
                os.replace(claimed_path, self.done_dir / f"{stem}.json")
            else:
                try:
                    claimed_path.unlink()
                except FileNotFoundError:
                    pass
            kill = certificate.get("kill") if certificate else None
            print(f"[done] {stem} kill={kill} error={error} "
                  f"elapsed={elapsed:.1f}s", flush=True)

    def _drain_mine_completed(self):
        if not self.mine_inflight:
            return
        done = [fut for fut in list(self.mine_inflight) if fut.done()]
        finished_groups = []
        for fut in done:
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
                finished_groups.append(group_key)
        for group_key in finished_groups:
            self._finish_mine_group(self.mine_groups.pop(group_key))

    def run_forever(self):
        signal.signal(signal.SIGTERM, self.request_stop)
        signal.signal(signal.SIGINT, self.request_stop)
        print(f"[worker] jobs_dir={self.jobs_dir} results_dir={self.results_dir} "
              f"done_dir={self.done_dir} workers={self.executor._max_workers} "
              f"cert_timeout={self.cert_timeout}", flush=True)
        try:
            while not self._stop:
                self._claim_new_jobs()
                self._drain_completed()
                time.sleep(self.poll_interval)
        finally:
            print("[worker] stopping: waiting for in-flight certifications",
                  flush=True)
            self.executor.shutdown(wait=True)
            self._drain_completed()
            print("[worker] stopped", flush=True)


def parse_args(argv=None):
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument("--jobs-dir", default=DEFAULT_JOBS_DIR)
    p.add_argument("--results-dir", default=DEFAULT_RESULTS_DIR)
    p.add_argument("--done-dir", default=DEFAULT_DONE_DIR,
                   help="Set to empty string to delete consumed jobs instead "
                        "of moving them.")
    p.add_argument("--workers", type=int, default=DEFAULT_WORKERS)
    p.add_argument("--poll-interval", type=float, default=DEFAULT_POLL_INTERVAL)
    p.add_argument("--cert-timeout", type=int, default=DEFAULT_CERT_TIMEOUT)
    return p.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    done_dir = Path(args.done_dir) if args.done_dir else None
    worker = Worker(
        jobs_dir=Path(args.jobs_dir),
        results_dir=Path(args.results_dir),
        done_dir=done_dir,
        workers=args.workers,
        poll_interval=args.poll_interval,
        cert_timeout=args.cert_timeout,
    )
    worker.run_forever()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
