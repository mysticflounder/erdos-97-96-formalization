#!/usr/bin/env python3
"""Mine and certify one frozen Census-554 separation-probe frontier.

This is deliberately a one-shot, non-publishing driver.  It reads a completed
``frozen_separation_probe.py`` result, independently validates its cube and
selected direct-row separation orders, snapshots the exact bank generation to
a unique run directory, and only then starts bounded mining and certification.

The live ``bank.jsonl`` and ``certs/`` directory are never written.  Mined
candidates are durably published before certification begins.  A certificate
is listed as publication-ready only after ``verify_certs.verify_cert`` has
reconstructed its generators from the pattern and rechecked its
Nullstellensatz identity in exact ``Fraction`` arithmetic.

Normal usage (from the repository root)::

    .venv/bin/python scratch/census-554/mine_frozen_frontier.py \
      --probe-result scratch/census-554/separation_probe_runs/.../result.json

The private ``_mine-worker`` and ``_cert-worker`` modes exist only so the
parent can enforce hard wall-clock limits on the full process group, including
Singular/msolve children.  They must not be invoked as production entrypoints.
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import json
import os
import secrets
import signal
import subprocess
import sys
import time
import uuid
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable, Mapping


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import census554_lib as profile  # noqa: E402
import cover_probe  # noqa: E402
import intracap  # noqa: E402
import miner  # noqa: E402
import verify_certs  # noqa: E402
from census.census_554 import combinatorics, separation_encoding  # noqa: E402
from census.census_554.io_protocol import atomic_write_bytes, atomic_write_json  # noqa: E402


RUN_SCHEMA = "census554_frozen_frontier_mining_run.v1"
CANDIDATE_SCHEMA = "census554_frozen_frontier_candidates.v1"
CERTIFIED_SCHEMA = "census554_frozen_frontier_certified.v1"
WORKER_MINE_SCHEMA = "census554_frozen_frontier_mine_worker.v1"
WORKER_CERT_SCHEMA = "census554_frozen_frontier_cert_worker.v1"
EXPECTED_PROBE_SCHEMA = "census554_frozen_separation_probe.v1"
EXPECTED_PROBE_STATUS = "combined-frontier"
_STOP_SIGNAL: int | None = None


class MiningRunError(RuntimeError):
    """A trust, provenance, or bounded-execution gate failed."""


@dataclass(frozen=True)
class ChildResult:
    returncode: int | None
    timed_out: bool
    elapsed_s: float


@dataclass
class LocalCertJob:
    index: int
    candidate_id: str
    pattern: dict[str, list[int]]
    request_path: Path
    output_path: Path
    stdout_path: Path
    stderr_path: Path
    process: subprocess.Popen[Any]
    started: float


def _signal_handler(signum, _frame) -> None:
    global _STOP_SIGNAL
    _STOP_SIGNAL = signum


def _check_stop() -> None:
    if _STOP_SIGNAL is not None:
        raise KeyboardInterrupt(f"received signal {_STOP_SIGNAL}")


def _sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _read_json(path: Path) -> Any:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise MiningRunError(f"cannot read valid JSON from {path}: {exc}") from exc


def _json_pattern(pattern: Mapping[int | str, Iterable[int]]) -> dict[str, list[int]]:
    native = {
        int(center): sorted(int(member) for member in members)
        for center, members in pattern.items()
    }
    return {str(center): native[center] for center in sorted(native)}


def _native_pattern(pattern: Mapping[int | str, Iterable[int]]):
    return {
        int(center): frozenset(int(member) for member in members)
        for center, members in pattern.items()
    }


def _new_workdir(root: Path) -> Path:
    root.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    for _ in range(100):
        candidate = root / f"run-{stamp}-{os.getpid()}-{secrets.token_hex(4)}"
        try:
            candidate.mkdir()
            descriptor = os.open(root, os.O_RDONLY)
            try:
                os.fsync(descriptor)
            finally:
                os.close(descriptor)
            return candidate
        except FileExistsError:
            continue
    raise MiningRunError("could not allocate a unique frontier-mining run directory")


def _read_complete_file(path: Path) -> bytes:
    """Read one already-open inode; atomic source replacement cannot tear it."""

    try:
        with open(path, "rb") as handle:
            return handle.read()
    except OSError as exc:
        raise MiningRunError(f"cannot snapshot {path}: {exc}") from exc


def _parse_bank(raw: bytes, source: Path) -> list[dict[str, Any]]:
    if raw and not raw.endswith(b"\n"):
        raise MiningRunError(f"bank has a torn final row: {source}")
    rows = []
    for line_number, line in enumerate(raw.splitlines(), 1):
        if not line.strip():
            raise MiningRunError(f"blank bank row at {source}:{line_number}")
        try:
            row = json.loads(line)
        except json.JSONDecodeError as exc:
            raise MiningRunError(
                f"invalid bank row at {source}:{line_number}: {exc}"
            ) from exc
        if not isinstance(row, dict) or not isinstance(row.get("pattern"), dict):
            raise MiningRunError(f"malformed bank row at {source}:{line_number}")
        rows.append(row)
    return rows


def _order_from_record(record: Mapping[str, Any]):
    required = {
        "orientation", "python_internal_index", "labels", "row_scope"
    }
    if set(record) != required:
        raise MiningRunError("selected separation order has an unexpected schema")
    if record["row_scope"] != separation_encoding.DIRECT_ROW_SCOPE:
        raise MiningRunError("selected order does not use the direct-row scope")
    matches = [
        order for order in separation_encoding.all_orders()
        if order.orientation == record["orientation"]
        and order.internal_index == record["python_internal_index"]
    ]
    if len(matches) != 1:
        raise MiningRunError("selected separation order identity is invalid")
    order = matches[0]
    if list(order.labels) != record["labels"]:
        raise MiningRunError("selected separation order labels do not match its identity")
    return order


def validate_probe_result(
    result: Mapping[str, Any], *, bank_sha256: str, bank_rows: int
) -> tuple[dict[int, list[int]], tuple[Any, ...]]:
    """Validate the frontier without trusting probe booleans in ``result``."""

    if result.get("schema") != EXPECTED_PROBE_SCHEMA:
        raise MiningRunError("probe result has the wrong schema")
    if result.get("status") != EXPECTED_PROBE_STATUS:
        raise MiningRunError("probe result is not a completed combined frontier")
    if result.get("bank_sha256") != bank_sha256:
        raise MiningRunError("probe result and current bank have different hashes")
    if result.get("bank_rows") != bank_rows:
        raise MiningRunError("probe result and current bank have different row counts")
    raw_cube = result.get("cube")
    if not isinstance(raw_cube, dict):
        raise MiningRunError("probe result has no cube object")
    try:
        cube = {
            int(center): [int(member) for member in members]
            for center, members in raw_cube.items()
        }
    except (TypeError, ValueError) as exc:
        raise MiningRunError("probe cube is not integer-valued") from exc
    if set(cube) != set(range(profile.N)):
        raise MiningRunError("probe cube does not contain exactly centers 0 through 10")
    if any(len(members) != len(set(members)) for members in cube.values()):
        raise MiningRunError("probe cube contains a repeated class member")
    cube = {center: sorted(cube[center]) for center in sorted(cube)}
    if not profile.cube_ok(cube):
        raise MiningRunError("probe cube fails independent cube_ok validation")

    raw_orders = result.get("selected_orders")
    if not isinstance(raw_orders, list) or not raw_orders:
        raise MiningRunError("probe result has no selected separation orders")
    orders = tuple(_order_from_record(record) for record in raw_orders)
    if len(set(orders)) != len(orders):
        raise MiningRunError("probe result repeats a selected separation order")
    for order in orders:
        if not separation_encoding.validate_cube_order(
            cube, order, scope=separation_encoding.DIRECT_ROW_SCOPE
        ):
            raise MiningRunError("probe cube fails a selected separation order")
    return cube, orders


def _runtime_fingerprint() -> dict[str, str]:
    paths = {
        "driver": Path(__file__).resolve(),
        "profile": Path(profile.__file__).resolve(),
        "cover_probe": Path(cover_probe.__file__).resolve(),
        "intracap": Path(intracap.__file__).resolve(),
        "miner": Path(miner.__file__).resolve(),
        "verify_certs": Path(verify_certs.__file__).resolve(),
        "combinatorics": Path(combinatorics.__file__).resolve(),
        "separation_encoding": Path(separation_encoding.__file__).resolve(),
    }
    return {name: _sha256_file(path) for name, path in paths.items()}


def _mine_environment(args) -> tuple[dict[str, str], dict[str, Any]]:
    env = dict(os.environ)
    if args.remote_mine == "on":
        env["CENSUS554_REMOTE_MINE"] = "1"
    elif args.remote_mine == "off":
        env["CENSUS554_REMOTE_MINE"] = "0"
    defaults = {
        "CENSUS_MINE_WORKERS": "12",
        "CENSUS_MINE_BATCH": "48",
        "CENSUS_MINE_TARGET_DEAD": "12",
        "CENSUS_MINE_TARGET_MIN_K": "6",
        "CENSUS_CERT_SHRINK_TIMEOUT": "10",
        "CENSUS_CERT_ALL_PAIRS_FALLBACK": "0",
        "CENSUS554_REMOTE_MINE": "0",
    }
    policy = {name: env.get(name, default) for name, default in defaults.items()}
    policy["remote_mine_cli"] = args.remote_mine
    policy["oracle_timeout_s"] = args.oracle_timeout
    return env, policy


def _tool_version(command: list[str]) -> str:
    try:
        result = subprocess.run(
            command, capture_output=True, text=True, timeout=15
        )
    except (OSError, subprocess.TimeoutExpired):
        return "unavailable"
    lines = (result.stdout or result.stderr).strip().splitlines()
    return lines[0] if lines else f"exit {result.returncode}"


def _terminate_group(process: subprocess.Popen[Any]) -> None:
    if process.poll() is not None:
        return
    try:
        os.killpg(process.pid, signal.SIGTERM)
    except ProcessLookupError:
        return
    try:
        process.wait(timeout=3)
    except subprocess.TimeoutExpired:
        try:
            os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        process.wait()


def _run_bounded(
    command: list[str], *, stdout_path: Path, stderr_path: Path, timeout: float,
    env: Mapping[str, str] | None = None,
) -> ChildResult:
    """Run a complete process group under one hard wall-clock deadline."""

    started = time.monotonic()
    with open(stdout_path, "w", encoding="utf-8") as stdout, open(
        stderr_path, "w", encoding="utf-8"
    ) as stderr:
        try:
            process = subprocess.Popen(
                command,
                stdout=stdout,
                stderr=stderr,
                text=True,
                start_new_session=True,
                env=dict(env) if env is not None else None,
            )
        except OSError as exc:
            raise MiningRunError(f"could not start {command[0]}: {exc}") from exc
        timed_out = False
        try:
            deadline = started + max(0.0, timeout)
            while process.poll() is None:
                if _STOP_SIGNAL is not None:
                    _terminate_group(process)
                    raise KeyboardInterrupt(f"received signal {_STOP_SIGNAL}")
                if time.monotonic() >= deadline:
                    timed_out = True
                    _terminate_group(process)
                    break
                time.sleep(0.2)
        except BaseException:
            _terminate_group(process)
            raise
    return ChildResult(
        process.returncode, timed_out, time.monotonic() - started
    )


def _validate_pattern(pattern: Mapping[int | str, Iterable[int]], cube):
    try:
        native = _native_pattern(pattern)
    except (TypeError, ValueError) as exc:
        raise MiningRunError("mined pattern is not integer-valued") from exc
    if not native:
        raise MiningRunError("mined pattern is empty")
    for center, members in native.items():
        if not 0 <= center < profile.N:
            raise MiningRunError("mined pattern center is out of range")
        if len(members) < 2 or center in members:
            raise MiningRunError("mined pattern has an invalid center mask")
        if any(not 0 <= member < profile.N for member in members):
            raise MiningRunError("mined pattern member is out of range")
    if not miner.contains(cube, native):
        raise MiningRunError("mined pattern is not contained in the frontier cube")
    return native


def _candidate_key_json(pattern) -> list[list[Any]]:
    return [[center, list(members)] for center, members in miner.canon_key(pattern)]


def _unlabeled_key_json(pattern) -> list[list[Any]]:
    return [
        [center, list(members)]
        for center, members in cover_probe.unlabeled_key(pattern)
    ]


def _prepare_candidates(
    worker_payload: Mapping[str, Any], *, cube, bank_rows: list[dict[str, Any]],
    probe_result_sha256: str, bank_sha256: str,
) -> dict[str, Any]:
    if worker_payload.get("schema") != WORKER_MINE_SCHEMA:
        raise MiningRunError("mine worker emitted the wrong schema")
    if worker_payload.get("probe_result_sha256") != probe_result_sha256:
        raise MiningRunError("mine worker used a different probe result")
    if worker_payload.get("bank_sha256") != bank_sha256:
        raise MiningRunError("mine worker used a different bank boundary")
    if worker_payload.get("cube") != _json_pattern(cube):
        raise MiningRunError("mine worker used a different frontier cube")
    patterns = worker_payload.get("patterns")
    if not isinstance(patterns, list):
        raise MiningRunError("mine worker did not emit a pattern list")

    # The input is a generalized motif-plus-separation frontier: it survived
    # arbitrary candidate-feasible embeddings of every banked *unlabeled*
    # motif.  Novelty must therefore use the same unlabeled equivalence, not
    # merely the 72 role-preserving profile automorphisms used at bank append.
    known = {
        cover_probe.unlabeled_key(_native_pattern(row["pattern"]))
        for row in bank_rows
    }
    seen = set()
    candidates = []
    for index, pattern_json in enumerate(patterns):
        if not isinstance(pattern_json, dict):
            raise MiningRunError("mine worker emitted a non-object pattern")
        pattern = _validate_pattern(pattern_json, cube)
        normalized = _json_pattern(pattern)
        if normalized != pattern_json:
            raise MiningRunError("mine worker pattern is not canonical JSON")
        unlabeled_key = cover_probe.unlabeled_key(pattern)
        if unlabeled_key in seen:
            raise MiningRunError("mine worker emitted duplicate unlabeled motifs")
        seen.add(unlabeled_key)
        candidates.append({
            "candidate_id": f"candidate_{index:05d}",
            "pattern": normalized,
            "canonical_profile_key": _candidate_key_json(pattern),
            "unlabeled_motif_key": _unlabeled_key_json(pattern),
            "novel_against_snapshot": unlabeled_key not in known,
            "support_size": len(miner.pattern_points(pattern)),
            "generator_count": miner.n_gens(pattern),
            "orbit_size": len(miner.orbit(pattern)),
        })
    return {
        "schema": CANDIDATE_SCHEMA,
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "probe_result_sha256": probe_result_sha256,
        "bank_sha256": bank_sha256,
        "frontier_cube": _json_pattern(cube),
        "min_support_k": worker_payload.get("min_support_k"),
        "minimality_scope": (
            "mine_all_patterns minimum support plus greedy single-member/center "
            "deletion; exact iterated-saturation timeouts are conservative"
        ),
        "candidate_count": len(candidates),
        "novel_count": sum(item["novel_against_snapshot"] for item in candidates),
        "worker_miner_policy": worker_payload.get("miner_policy"),
        "candidates": candidates,
    }


def _verify_certificate(candidate: Mapping[str, Any], certificate: Any):
    """Attach a provisional local id and run the exact bank certificate checker."""

    if not __debug__:
        raise MiningRunError("exact certificate verifier requires assertions enabled")
    if not isinstance(certificate, dict):
        raise MiningRunError("certificate worker returned no certificate object")
    cert = copy.deepcopy(certificate)
    candidate_id = str(candidate["candidate_id"])
    if cert.get("pattern") != candidate["pattern"]:
        raise MiningRunError(f"{candidate_id}: certificate pattern drift")
    cert["pid"] = candidate_id
    row = {
        "pid": candidate_id,
        "pattern": candidate["pattern"],
        "n_orbit": candidate["orbit_size"],
    }
    try:
        generator_count = verify_certs.verify_cert(row, cert)
    except (AssertionError, KeyError, TypeError, ValueError) as exc:
        raise MiningRunError(
            f"{candidate_id}: exact certificate verification failed: {exc}"
        ) from exc
    if cert.get("python_exact_identity") is not True:
        raise MiningRunError(f"{candidate_id}: certificate lacks exact identity flag")
    return cert, generator_count


def _mine_worker(request_path: Path, output_path: Path) -> int:
    request = _read_json(request_path)
    cube = _native_pattern(request["cube"])
    oracle_timeout = int(request["oracle_timeout"])

    def exact_dead(pattern, timeout=30):
        verdict = intracap.pattern_dead3(
            pattern, max(int(timeout), oracle_timeout)
        )
        return verdict is True

    # Selection may still use the existing optional remote msolve scan.  All
    # local decisions and greedy shrinking use the exact Singular saturation
    # oracle, and every surviving candidate later needs an exact certificate.
    miner.pattern_dead_fast = exact_dead
    started = time.monotonic()
    patterns, min_support_k = miner.mine_all_patterns(
        cube, log=lambda message: print(message, flush=True)
    )
    payload = {
        "schema": WORKER_MINE_SCHEMA,
        "probe_result_sha256": request["probe_result_sha256"],
        "bank_sha256": request["bank_sha256"],
        "cube": _json_pattern(cube),
        "min_support_k": min_support_k,
        "patterns": [_json_pattern(pattern) for pattern in patterns],
        "elapsed_s": time.monotonic() - started,
        "miner_policy": {
            "CENSUS_MINE_WORKERS": miner.MINE_WORKERS,
            "CENSUS_MINE_BATCH": miner.MINE_BATCH,
            "CENSUS_MINE_TARGET_DEAD": miner.MINE_TARGET_DEAD,
            "CENSUS_MINE_TARGET_MIN_K": miner.MINE_TARGET_MIN_K,
            "CENSUS_CERT_SHRINK_TIMEOUT": miner.CERT_SHRINK_TIMEOUT,
            "CENSUS_CERT_ALL_PAIRS_FALLBACK": miner.CERT_ALL_PAIRS_FALLBACK,
            "CENSUS554_REMOTE_MINE": os.environ.get(
                "CENSUS554_REMOTE_MINE", "0"
            ) == "1",
            "oracle_timeout_s": oracle_timeout,
        },
    }
    atomic_write_json(output_path, payload)
    return 0


def _cert_worker(request_path: Path, output_path: Path) -> int:
    request = _read_json(request_path)
    pattern = _native_pattern(request["pattern"])
    started = time.monotonic()
    certificate = miner.certify_pattern(
        pattern, timeout=int(request["singular_timeout"])
    )
    atomic_write_json(output_path, {
        "schema": WORKER_CERT_SCHEMA,
        "candidate_id": request["candidate_id"],
        "pattern": _json_pattern(pattern),
        "certificate": certificate,
        "elapsed_s": time.monotonic() - started,
        "worker": "local",
    })
    return 0


def _start_local_job(candidate, workdir: Path, args) -> LocalCertJob:
    index = int(str(candidate["candidate_id"]).split("_")[-1])
    stem = str(candidate["candidate_id"])
    request_path = workdir / "cert_requests" / f"{stem}.json"
    output_path = workdir / "cert_worker_outputs" / f"{stem}.json"
    stdout_path = workdir / "cert_logs" / f"{stem}.stdout"
    stderr_path = workdir / "cert_logs" / f"{stem}.stderr"
    for directory in (request_path.parent, output_path.parent, stdout_path.parent):
        directory.mkdir(parents=True, exist_ok=True)
    atomic_write_json(request_path, {
        "candidate_id": stem,
        "pattern": candidate["pattern"],
        "singular_timeout": args.singular_timeout,
    })
    stdout = open(stdout_path, "w", encoding="utf-8")
    stderr = open(stderr_path, "w", encoding="utf-8")
    try:
        process = subprocess.Popen(
            [sys.executable, str(Path(__file__).resolve()), "_cert-worker",
             str(request_path), str(output_path)],
            stdout=stdout,
            stderr=stderr,
            text=True,
            start_new_session=True,
        )
    except BaseException:
        stdout.close()
        stderr.close()
        raise
    # Popen owns duplicated descriptors; the parent need not retain them.
    stdout.close()
    stderr.close()
    return LocalCertJob(
        index, stem, candidate["pattern"], request_path, output_path,
        stdout_path, stderr_path, process, time.monotonic()
    )


def _remote_enabled(args) -> bool:
    if args.remote_cert == "on":
        return True
    if args.remote_cert == "off":
        return False
    return os.environ.get("CENSUS554_REMOTE_CERT", "0") == "1"


def _submit_remote(candidate, workdir: Path, args, run_token: str):
    stem = f"frontier-{run_token}-{candidate['candidate_id']}-{uuid.uuid4().hex[:8]}"
    jobs_dir = Path(args.remote_jobs_dir)
    results_dir = Path(args.remote_results_dir)
    atomic_write_json(jobs_dir / f"{stem}.json", candidate["pattern"])
    return {
        "stem": stem,
        "candidate": candidate,
        "result_path": results_dir / f"{stem}.json",
        "submitted": time.monotonic(),
        "deadline": time.monotonic() + args.cert_hard_timeout + args.remote_margin,
    }


def _consume_verified(
    candidate, worker_payload, *, source: str, workdir: Path,
) -> tuple[dict[str, Any] | None, dict[str, Any] | None]:
    candidate_id = candidate["candidate_id"]
    if not isinstance(worker_payload, dict):
        return None, {"candidate_id": candidate_id, "reason": "invalid worker payload"}
    if worker_payload.get("pattern") != candidate["pattern"]:
        return None, {"candidate_id": candidate_id, "reason": "worker pattern mismatch"}
    certificate = worker_payload.get("certificate")
    if certificate is None:
        return None, {"candidate_id": candidate_id, "reason": "certifier returned None"}
    try:
        verified, generator_count = _verify_certificate(candidate, certificate)
    except MiningRunError as exc:
        return None, {"candidate_id": candidate_id, "reason": str(exc)}
    cert_dir = workdir / "verified_certificates"
    cert_dir.mkdir(parents=True, exist_ok=True)
    cert_path = cert_dir / f"{candidate_id}.json"
    atomic_write_json(cert_path, verified, compact=True)
    return {
        "candidate_id": candidate_id,
        "pattern": candidate["pattern"],
        "kill": verified["kill"],
        "orbit_size": candidate["orbit_size"],
        "generator_count": generator_count,
        "certificate": str(cert_path.relative_to(workdir)),
        "certificate_sha256": _sha256_file(cert_path),
        "exact_verifier": "verify_certs.verify_cert",
        "worker": source,
        "worker_elapsed_s": worker_payload.get("elapsed_s", worker_payload.get("elapsed")),
    }, None


def _certify_candidates(candidates, workdir: Path, args):
    novel = [item for item in candidates if item["novel_against_snapshot"]]
    if not novel:
        return [], [], []
    remote = _remote_enabled(args) and len(novel) > args.cert_workers
    local_queue = list(novel if not remote else novel[:args.cert_workers])
    remote_queue = list([] if not remote else novel[args.cert_workers:])
    run_token = workdir.name.replace("run-", "")
    remote_jobs = []
    orphaned = []
    for candidate in remote_queue:
        remote_jobs.append(_submit_remote(candidate, workdir, args, run_token))

    active: dict[int, LocalCertJob] = {}
    verified = []
    failures = []
    finished_ids = set()
    overall_deadline = time.monotonic() + args.cert_wall

    def launch_available() -> None:
        while local_queue and len(active) < args.cert_workers:
            candidate = local_queue.pop(0)
            job = _start_local_job(candidate, workdir, args)
            active[job.index] = job

    try:
        while local_queue or active or remote_jobs:
            _check_stop()
            now = time.monotonic()
            if now >= overall_deadline:
                break
            launch_available()

            for index, job in list(active.items()):
                candidate = next(
                    item for item in novel if item["candidate_id"] == job.candidate_id
                )
                returncode = job.process.poll()
                if now - job.started >= args.cert_hard_timeout:
                    if returncode is None:
                        _terminate_group(job.process)
                    failures.append({
                        "candidate_id": job.candidate_id,
                        "reason": "local hard timeout",
                        "hard_timeout_s": args.cert_hard_timeout,
                    })
                    finished_ids.add(job.candidate_id)
                    del active[index]
                    continue
                if returncode is None:
                    continue
                if returncode != 0 or not job.output_path.is_file():
                    failures.append({
                        "candidate_id": job.candidate_id,
                        "reason": f"local worker exit {returncode}",
                    })
                else:
                    try:
                        payload = _read_json(job.output_path)
                        if payload.get("schema") != WORKER_CERT_SCHEMA:
                            raise MiningRunError("local cert worker schema mismatch")
                        item, failure = _consume_verified(
                            candidate, payload, source="local", workdir=workdir
                        )
                        if item:
                            verified.append(item)
                        if failure:
                            failures.append(failure)
                    except MiningRunError as exc:
                        failures.append({
                            "candidate_id": job.candidate_id, "reason": str(exc)
                        })
                finished_ids.add(job.candidate_id)
                del active[index]

            if remote_jobs:
                try:
                    names = set(os.listdir(args.remote_results_dir))
                except OSError:
                    names = set()
                for remote_job in list(remote_jobs):
                    candidate = remote_job["candidate"]
                    result_path = remote_job["result_path"]
                    if result_path.name in names:
                        try:
                            payload = _read_json(result_path)
                        except MiningRunError:
                            continue
                        try:
                            result_path.unlink()
                        except FileNotFoundError:
                            pass
                        item, failure = _consume_verified(
                            candidate, payload, source="flux", workdir=workdir
                        )
                        if item:
                            verified.append(item)
                            finished_ids.add(candidate["candidate_id"])
                        elif now + args.cert_hard_timeout < overall_deadline:
                            local_queue.append(candidate)
                        elif failure:
                            failures.append(failure)
                            finished_ids.add(candidate["candidate_id"])
                        remote_jobs.remove(remote_job)
                    elif now >= remote_job["deadline"]:
                        orphaned.append(remote_job["stem"])
                        remote_jobs.remove(remote_job)
                        if now + args.cert_hard_timeout < overall_deadline:
                            local_queue.append(candidate)
                        else:
                            failures.append({
                                "candidate_id": candidate["candidate_id"],
                                "reason": "remote timeout; no time for local fallback",
                            })
                            finished_ids.add(candidate["candidate_id"])
            time.sleep(0.2)
    finally:
        for job in active.values():
            _terminate_group(job.process)

    pending_ids = {
        item["candidate_id"] for item in local_queue
    } | {job.candidate_id for job in active.values()} | {
        item["candidate"]["candidate_id"] for item in remote_jobs
    }
    for candidate_id in sorted(pending_ids - finished_ids):
        failures.append({
            "candidate_id": candidate_id,
            "reason": "overall certification wall cap reached",
        })
    orphaned.extend(item["stem"] for item in remote_jobs)
    verified.sort(key=lambda item: item["candidate_id"])
    failures.sort(key=lambda item: item["candidate_id"])
    return verified, failures, sorted(set(orphaned))


def _manifest_base(workdir: Path, metadata: Mapping[str, Any], status: str, **extra):
    payload = {
        "schema": RUN_SCHEMA,
        "status": status,
        "workdir": str(workdir),
        "updated_utc": datetime.now(timezone.utc).isoformat(),
        "probe_result_sha256": metadata["probe_result_sha256"],
        "bank_sha256": metadata["bank_sha256"],
        "bank_rows": metadata["bank_rows"],
        "bank_publication_performed": False,
        "live_bank_and_certificates_untouched_by_design": True,
    }
    payload.update(extra)
    return payload


def _write_progress(workdir: Path, payload: Mapping[str, Any]) -> None:
    atomic_write_json(workdir / "progress.json", payload)


def _completion_status(
    *, candidate_count: int, novel_count: int, verified_count: int,
    failure_count: int,
) -> str:
    """Keep an empty mine distinct from a fully duplicate candidate batch."""

    if candidate_count == 0:
        return "no-mined-candidates-inconclusive"
    if verified_count and not failure_count:
        return "certified"
    if verified_count:
        return "partially-certified"
    if novel_count == 0:
        return "no-novel-candidates"
    return "no-certified-candidates"


def _run(args) -> int:
    started = time.monotonic()
    probe_path = args.probe_result.resolve()
    bank_path = args.bank.resolve()
    probe_raw = _read_complete_file(probe_path)
    bank_raw = _read_complete_file(bank_path)
    bank_rows = _parse_bank(bank_raw, bank_path)
    probe_sha = _sha256_bytes(probe_raw)
    bank_sha = _sha256_bytes(bank_raw)
    try:
        probe_result = json.loads(probe_raw)
    except json.JSONDecodeError as exc:
        raise MiningRunError(f"invalid probe result JSON: {exc}") from exc
    cube, orders = validate_probe_result(
        probe_result, bank_sha256=bank_sha, bank_rows=len(bank_rows)
    )
    mine_env, mine_policy = _mine_environment(args)

    workdir = _new_workdir(args.output_root.resolve())
    atomic_write_bytes(workdir / "probe_result.json", probe_raw)
    atomic_write_bytes(workdir / "bank_snapshot.jsonl", bank_raw)
    if _sha256_file(workdir / "probe_result.json") != probe_sha:
        raise MiningRunError("probe-result snapshot hash mismatch")
    if _sha256_file(workdir / "bank_snapshot.jsonl") != bank_sha:
        raise MiningRunError("bank snapshot hash mismatch")
    # Reparse the copied bytes: all later provenance refers to this artifact.
    frozen_rows = _parse_bank(
        (workdir / "bank_snapshot.jsonl").read_bytes(),
        workdir / "bank_snapshot.jsonl",
    )

    metadata = {
        "schema": RUN_SCHEMA,
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "command": sys.argv,
        "probe_result_source": str(probe_path),
        "probe_result_sha256": probe_sha,
        "bank_source": str(bank_path),
        "bank_sha256": bank_sha,
        "bank_rows": len(frozen_rows),
        "validated_selected_orders": [
            {
                "orientation": order.orientation,
                "python_internal_index": order.internal_index,
                "labels": list(order.labels),
                "scope": separation_encoding.DIRECT_ROW_SCOPE,
            }
            for order in orders
        ],
        "caps": {
            "mining_wall_s": args.mining_wall,
            "mining_oracle_timeout_s": args.oracle_timeout,
            "cert_workers": args.cert_workers,
            "cert_wall_s": args.cert_wall,
            "cert_hard_timeout_s": args.cert_hard_timeout,
            "singular_attempt_timeout_s": args.singular_timeout,
        },
        "policy": {
            "mine_environment": mine_policy,
            "remote_cert": args.remote_cert,
            "effective_remote_cert": _remote_enabled(args),
        },
        "runtime_fingerprint": _runtime_fingerprint(),
        "tools": {
            "Singular": _tool_version(["Singular", "--version"]),
            "msolve": _tool_version(["msolve", "--version"]),
        },
    }
    atomic_write_json(workdir / "run_metadata.json", metadata)
    _write_progress(workdir, _manifest_base(
        workdir, metadata, "snapshot-validated",
        phase="mining pending",
        independent_cube_ok=True,
        independent_selected_orders_valid=True,
    ))

    mine_request = {
        "cube": _json_pattern(cube),
        "probe_result_sha256": probe_sha,
        "bank_sha256": bank_sha,
        "oracle_timeout": args.oracle_timeout,
    }
    atomic_write_json(workdir / "mine_request.json", mine_request)
    mine_output = workdir / "mine_worker_output.json"
    _write_progress(workdir, _manifest_base(
        workdir, metadata, "mining", phase="bounded mine worker running"
    ))
    mined = _run_bounded(
        [sys.executable, str(Path(__file__).resolve()), "_mine-worker",
         str(workdir / "mine_request.json"), str(mine_output)],
        stdout_path=workdir / "mine.stdout",
        stderr_path=workdir / "mine.stderr",
        timeout=args.mining_wall,
        env=mine_env,
    )
    if mined.timed_out:
        result = _manifest_base(
            workdir, metadata, "mining-timeout",
            elapsed_s=time.monotonic() - started,
            mining_elapsed_s=mined.elapsed_s,
            reason="hard mining process-group wall cap reached",
        )
        atomic_write_json(workdir / "result.json", result)
        _write_progress(workdir, result)
        print(json.dumps(result, sort_keys=True), flush=True)
        return 2
    if mined.returncode != 0 or not mine_output.is_file():
        raise MiningRunError(f"mine worker failed with exit {mined.returncode}")

    candidates_payload = _prepare_candidates(
        _read_json(mine_output),
        cube=cube,
        bank_rows=frozen_rows,
        probe_result_sha256=probe_sha,
        bank_sha256=bank_sha,
    )
    candidates_path = workdir / "mined_candidates.json"
    # This fsync+rename is the phase boundary: certification cannot begin
    # until the complete candidate inventory exists durably on disk.
    atomic_write_json(candidates_path, candidates_payload)
    candidates_sha = _sha256_file(candidates_path)
    _write_progress(workdir, _manifest_base(
        workdir, metadata, "candidates-persisted",
        candidate_artifact=str(candidates_path.relative_to(workdir)),
        candidate_artifact_sha256=candidates_sha,
        candidate_count=candidates_payload["candidate_count"],
        novel_count=candidates_payload["novel_count"],
        phase="certification pending",
    ))

    verified, failures, orphaned = _certify_candidates(
        candidates_payload["candidates"], workdir, args
    )
    certified_payload = {
        "schema": CERTIFIED_SCHEMA,
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "probe_result_sha256": probe_sha,
        "bank_sha256": bank_sha,
        "candidate_artifact_sha256": candidates_sha,
        "verified_count": len(verified),
        "failure_count": len(failures),
        "verified": verified,
        "failures": failures,
        "orphaned_remote_job_stems": orphaned,
        "publication_note": (
            "This driver did not publish. Only entries in verified passed the "
            "exact generator-fidelity and Fraction identity checker."
        ),
    }
    certified_path = workdir / "certified_candidates.json"
    atomic_write_json(certified_path, certified_payload)
    certified_sha = _sha256_file(certified_path)
    status = _completion_status(
        candidate_count=candidates_payload["candidate_count"],
        novel_count=candidates_payload["novel_count"],
        verified_count=len(verified),
        failure_count=len(failures),
    )
    try:
        live_bank_finish_sha = _sha256_bytes(_read_complete_file(bank_path))
    except MiningRunError:
        live_bank_finish_sha = "unavailable"
    live_bank_unchanged = live_bank_finish_sha == bank_sha
    result = _manifest_base(
        workdir, metadata, status,
        elapsed_s=time.monotonic() - started,
        independent_cube_ok=True,
        independent_selected_orders_valid=True,
        candidate_artifact=str(candidates_path.relative_to(workdir)),
        candidate_artifact_sha256=candidates_sha,
        certified_artifact=str(certified_path.relative_to(workdir)),
        certified_artifact_sha256=certified_sha,
        candidate_count=candidates_payload["candidate_count"],
        novel_count=candidates_payload["novel_count"],
        verified_count=len(verified),
        failure_count=len(failures),
        publication_ready_candidate_ids=[item["candidate_id"] for item in verified],
        live_bank_sha256_at_finish=live_bank_finish_sha,
        live_bank_unchanged_since_snapshot=live_bank_unchanged,
        publication_requires_bank_novelty_recheck=not live_bank_unchanged,
        exact_certificate_gate=(
            "verify_certs.verify_cert: structure, generator fidelity, exact "
            "Fraction Nullstellensatz identity"
        ),
        orphaned_remote_job_stems=orphaned,
    )
    atomic_write_json(workdir / "result.json", result)
    _write_progress(workdir, result)
    print(json.dumps(result, sort_keys=True), flush=True)
    return 0 if verified or status == "no-novel-candidates" else 2


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--probe-result", type=Path, required=True)
    parser.add_argument("--bank", type=Path, default=HERE / "bank.jsonl")
    parser.add_argument(
        "--output-root", type=Path, default=HERE / "frontier_mining_runs"
    )
    parser.add_argument("--mining-wall", type=float, default=7200.0)
    parser.add_argument("--oracle-timeout", type=int, default=60)
    parser.add_argument("--cert-workers", type=int, default=8)
    parser.add_argument("--cert-wall", type=float, default=7200.0)
    parser.add_argument("--cert-hard-timeout", type=float, default=1800.0)
    parser.add_argument("--singular-timeout", type=int, default=900)
    parser.add_argument(
        "--remote-mine", choices=("inherit", "on", "off"), default="off",
        help="default off keeps the one-shot run isolated from the NFS queue",
    )
    parser.add_argument(
        "--remote-cert", choices=("inherit", "on", "off"), default="inherit"
    )
    parser.add_argument(
        "--remote-jobs-dir",
        default=os.environ.get(
            "CENSUS554_REMOTE_JOBS_DIR", "/opt/nfs/erdos9796-flux-bridge/jobs"
        ),
    )
    parser.add_argument(
        "--remote-results-dir",
        default=os.environ.get(
            "CENSUS554_REMOTE_RESULTS_DIR", "/opt/nfs/erdos9796-flux-bridge/results"
        ),
    )
    parser.add_argument(
        "--remote-margin", type=float,
        default=float(os.environ.get("CENSUS554_REMOTE_MARGIN_S", "120")),
    )
    return parser


def main(argv: list[str] | None = None) -> int:
    raw = list(sys.argv[1:] if argv is None else argv)
    if raw and raw[0] == "_mine-worker":
        if len(raw) != 3:
            return 2
        return _mine_worker(Path(raw[1]), Path(raw[2]))
    if raw and raw[0] == "_cert-worker":
        if len(raw) != 3:
            return 2
        return _cert_worker(Path(raw[1]), Path(raw[2]))
    args = _parser().parse_args(raw)
    if args.mining_wall <= 0 or args.cert_wall <= 0:
        raise MiningRunError("wall-clock caps must be positive")
    if args.oracle_timeout <= 0 or args.singular_timeout <= 0:
        raise MiningRunError("per-engine timeouts must be positive")
    if args.cert_workers <= 0 or args.cert_hard_timeout <= 0:
        raise MiningRunError("certification bounds must be positive")
    for signum in (signal.SIGINT, signal.SIGTERM):
        signal.signal(signum, _signal_handler)
    try:
        return _run(args)
    except KeyboardInterrupt as exc:
        print(f"INTERRUPTED: {exc}", file=sys.stderr, flush=True)
        return 130
    except MiningRunError as exc:
        print(f"FAILED: {exc}", file=sys.stderr, flush=True)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
