#!/usr/bin/env python3
"""Frontier-driven cover loop for the (5,5,4), ``|A| = 11`` census.

The process holds the shared lifetime driver lease. Frontier certificates are
exactly revalidated and atomically banked in one transaction. Every SAT
exclusion retains its source bank-row digest, canonical motif, support
injection, emitted pattern, and exact CNF clause.

An UNSAT solver response is only a candidate terminal state. Publication
re-solves the persisted CNF, checks the emitted DRAT proof with ``drat-trim``,
validates and hashes every referenced source certificate, snapshots the bank
under its transaction lock, and atomically writes ``COVERAGE_COMPLETE.json``
last. The checked SAT result still depends on the Lean motif-transfer theorem.

Usage: uv run python scratch/census-554/frontier_loop.py
Env: CERT_WORKERS (default 8), CERT_TIMEOUT (default 900), MAX_ITERS (5000)
"""

from __future__ import annotations

import importlib.metadata
import json
import os
import subprocess
import sys
import time
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import cover_probe as cp  # noqa: E402
import frontier_add  # noqa: E402
import intracap  # noqa: E402
import miner  # noqa: E402
import queue_client  # noqa: E402
import sat_cover  # noqa: E402
from census.census_554.io_protocol import (  # noqa: E402
    LockBusy,
    atomic_write_json,
    driver_lease,
    row_sha256,
)
from census.census_554.terminal_artifacts import (  # noqa: E402
    TerminalArtifactError,
    publish_unsat_artifacts,
)


def _exact_dead(pat, timeout=30):
    verdict = intracap.pattern_dead3(pat, max(timeout, 60))
    return bool(verdict)


miner.pattern_dead_fast = _exact_dead

WORKERS = int(os.environ.get("CERT_WORKERS", "8"))
CERT_TIMEOUT = int(os.environ.get("CERT_TIMEOUT", "900"))
MAX_ITERS = int(os.environ.get("MAX_ITERS", "5000"))
# Node budget for one motif-into-cube embedding search. A weakly-pruning
# motif can send the backtracking factorial (observed 2026-07-11: one
# motif x cube pair ground >10h and stalled the loop); exceeding motifs
# are skipped with a log line — instances only strengthen SAT pruning,
# so skips never affect bank soundness.
EMBED_MAX_NODES = int(os.environ.get("CENSUS554_EMBED_MAX_NODES", "500000"))

# Optional overflow offload to a flux.local remote_certify_worker.py daemon
# over the shared NFS bridge. Off by default -- when disabled (or when a
# batch is small enough to fit in the local pool) behavior is byte-identical
# to the pre-existing local-only path. See
# scratch/census-554/flux_worker/remote_certify_worker.py for the daemon and
# its own module docstring for the wire format this mirrors.
REMOTE_CERT_ENABLED = os.environ.get("CENSUS554_REMOTE_CERT", "0") == "1"
REMOTE_JOBS_DIR = Path(os.environ.get(
    "CENSUS554_REMOTE_JOBS_DIR", "/opt/nfs/erdos9796-flux-bridge/jobs"))
REMOTE_RESULTS_DIR = Path(os.environ.get(
    "CENSUS554_REMOTE_RESULTS_DIR", "/opt/nfs/erdos9796-flux-bridge/results"))
REMOTE_POLL_INTERVAL = float(os.environ.get("CENSUS554_REMOTE_POLL_S", "2.0"))
REMOTE_TIMEOUT_MARGIN = int(os.environ.get("CENSUS554_REMOTE_MARGIN_S", "120"))


def certify_one(pattern_json):
    pattern = {int(c): frozenset(members)
               for c, members in pattern_json.items()}
    started = time.time()
    certificate = miner.certify_pattern(pattern, timeout=CERT_TIMEOUT)
    return pattern_json, certificate, time.time() - started


def _submit_remote_job(stem, pattern_json):
    atomic_write_json(REMOTE_JOBS_DIR / f"{stem}.json", pattern_json)


def _poll_remote_results(remote_stems, deadline):
    """Poll REMOTE_RESULTS_DIR for `remote_stems` (stem -> pattern_json)
    until every job has a result file or `deadline` passes. Returns
    (completed, timed_out) where `completed` maps stem -> (pattern_json,
    certificate, elapsed) and `timed_out` is the list of pattern_json for
    stems that never produced a result file in time -- callers must
    certify those locally as a fallback."""
    pending = dict(remote_stems)
    completed = {}
    while pending and time.time() < deadline:
        # Gate on a directory listing before any per-name open: a lookup
        # that races the remote write plants a macOS NFS negative dentry
        # that repeated polling keeps warm, making an existing result file
        # read as absent for minutes (see remote_mine.py, same fix).
        try:
            names = set(os.listdir(REMOTE_RESULTS_DIR))
        except OSError:
            names = set()
        for stem in list(pending):
            if f"{stem}.json" not in names:
                continue
            result_path = REMOTE_RESULTS_DIR / f"{stem}.json"
            try:
                with open(result_path, encoding="utf-8") as handle:
                    data = json.load(handle)
            except FileNotFoundError:
                continue
            except (OSError, json.JSONDecodeError):
                continue  # torn/partial read raced the atomic rename; retry
            completed[stem] = (data["pattern"], data.get("certificate"),
                                data.get("elapsed", 0.0))
            del pending[stem]
            try:
                result_path.unlink()
            except FileNotFoundError:
                pass
        if pending:
            time.sleep(REMOTE_POLL_INTERVAL)
    timed_out = list(pending.values())
    return completed, timed_out


def _compose_maps(*maps):
    composed = dict(maps[0])
    for next_map in maps[1:]:
        composed = {source: next_map[target]
                    for source, target in composed.items()}
    return composed


def _pattern_json(pattern):
    return [[center, sorted(members)]
            for center, members in sorted(pattern.items())]


def _motif_json(key):
    return [[center, list(members)] for center, members in key]


def _item_from_row(row):
    return {
        "row": row,
        "row_sha256": row_sha256(row),
        "pattern": {
            int(c): frozenset(members)
            for c, members in row["pattern"].items()
        },
    }


def _add_instance(
    instance,
    added,
    *,
    pattern,
    source,
    canonical_key,
    source_to_target,
    embedding_kind,
):
    serialized = cp.ser(pattern)
    if serialized in added:
        return False
    clause = instance.add_pattern_instance(pattern)
    injection = [[source_point, source_to_target[source_point]]
                 for source_point in sorted(source_to_target)]
    targets = [target for _, target in injection]
    if len(set(targets)) != len(targets):
        raise AssertionError("non-injective provenance map")
    added[serialized] = {
        "source_pid": source["row"]["pid"],
        "source_row_sha256": source["row_sha256"],
        "source_cert": source["row"]["cert"],
        "canonical_motif": _motif_json(canonical_key),
        "support_injection": injection,
        "pattern": _pattern_json(pattern),
        "clause": clause,
        "embedding_kind": embedding_kind,
    }
    return True


def _seed_bank_row(instance, added, source):
    key = source.get("canonical_key")
    if key is None:
        key, source_to_key = cp.unlabeled_key_with_map(source["pattern"])
        source["canonical_key"] = key
        source["source_to_key"] = source_to_key
    count = 0
    for image, source_to_image in miner.orbit_with_maps(source["pattern"]):
        count += _add_instance(
            instance,
            added,
            pattern=image,
            source=source,
            canonical_key=key,
            source_to_target=source_to_image,
            embedding_kind="bank_autos",
        )
    return count


def _motif_representatives(sources):
    representatives = {}
    ordered = sorted(
        sources,
        key=lambda item: (str(item["row"].get("pid")), item["row_sha256"]),
    )
    for source in ordered:
        key, source_to_key = cp.unlabeled_key_with_map(source["pattern"])
        source["canonical_key"] = key
        source["source_to_key"] = source_to_key
        representatives.setdefault(key, (source, source_to_key))
    return representatives


def _tool_version(command):
    try:
        result = subprocess.run(
            command, capture_output=True, text=True, timeout=30
        )
    except (OSError, subprocess.TimeoutExpired):
        return "unavailable"
    output = (result.stdout or result.stderr).strip().splitlines()
    return output[0] if output else f"exit {result.returncode}"


def _git_commit():
    result = subprocess.run(
        ["git", "rev-parse", "HEAD"],
        cwd=REPO_ROOT,
        capture_output=True,
        text=True,
        timeout=30,
    )
    return result.stdout.strip() if result.returncode == 0 else "unknown"


def persist_unsat(instance, added, iteration, mining_cycles, elapsed):
    if [row["clause"] for row in added.values()] != instance.excl:
        raise TerminalArtifactError("manifest clauses do not match CNF exclusions")
    try:
        sympy_version = importlib.metadata.version("sympy")
    except importlib.metadata.PackageNotFoundError:
        sympy_version = "not installed"
    metadata = {
        "iteration": iteration,
        "mining_cycles": mining_cycles,
        "n_instances": len(added),
        "elapsed_s": round(elapsed, 3),
        "command": sys.argv,
        "git_commit": _git_commit(),
        "versions": {
            "python": sys.version.split()[0],
            "sympy": sympy_version,
            "cadical": _tool_version(["cadical", "--version"]),
            "drat-trim": _tool_version(["drat-trim"]),
        },
    }
    marker = publish_unsat_artifacts(
        HERE,
        dimacs=instance.dimacs(),
        instances=added.values(),
        run_metadata=metadata,
    )
    print(
        f"[terminal] proof-checked generation {marker['generation']} published; "
        "COVERAGE_COMPLETE.json written last",
        flush=True,
    )


def _run():
    started = time.time()
    sources = cp.load_bank_records()
    representatives = _motif_representatives(sources)
    motif_keys = sorted(representatives)
    print(
        f"[seed] {len(sources)} bank rows, {len(motif_keys)} motifs",
        flush=True,
    )

    instance = sat_cover.CoverInstance()
    added = {}
    for source in sources:
        _seed_bank_row(instance, added, source)
    print(
        f"[seed] {len(added)} orbit instances ({time.time() - started:.0f}s)",
        flush=True,
    )

    mining_cycles = 0
    embed_budget_skipped = set()
    for iteration in range(1, MAX_ITERS + 1):
        result, cube = instance.solve(cp.CNF_PATH, timeout=3600)
        if result == "UNSAT":
            print(
                f"[iter {iteration}] UNSAT candidate ({len(added)} instances, "
                f"{mining_cycles} mining cycles, {time.time() - started:.0f}s); "
                "running terminal proof and manifest gates",
                flush=True,
            )
            persist_unsat(
                instance,
                added,
                iteration,
                mining_cycles,
                time.time() - started,
            )
            return 0
        if result != "SAT":
            print(f"[iter {iteration}] solver returned {result}; STOP", flush=True)
            return 1

        frozen_cube = {center: frozenset(members)
                       for center, members in cube.items()}
        found = {}
        for key in motif_keys:
            try:
                embeddings = cp.embed_into_cube_with_maps(
                    key, frozen_cube, max_nodes=EMBED_MAX_NODES
                )
            except cp.EmbedBudgetExceeded:
                if key not in embed_budget_skipped:
                    embed_budget_skipped.add(key)
                    print(
                        f"[iter {iteration}] embed budget "
                        f"({EMBED_MAX_NODES} nodes) exceeded for motif "
                        f"{_motif_json(key)}; skipping its embeddings "
                        "(soundness unaffected; SAT pruning only)",
                        flush=True,
                    )
                continue
            for serialized, key_to_embedding in embeddings.items():
                if serialized not in added:
                    found.setdefault(serialized, (key, key_to_embedding))

        if found:
            new_instances = 0
            for serialized in sorted(found):
                key, key_to_embedding = found[serialized]
                source, source_to_key = representatives[key]
                embedded = {center: frozenset(members)
                            for center, members in serialized}
                for image, embedding_to_image in miner.orbit_with_maps(embedded):
                    source_to_image = _compose_maps(
                        source_to_key, key_to_embedding, embedding_to_image
                    )
                    new_instances += _add_instance(
                        instance,
                        added,
                        pattern=image,
                        source=source,
                        canonical_key=key,
                        source_to_target=source_to_image,
                        embedding_kind="motif_embedding_autos",
                    )
            print(
                f"[iter {iteration}] +{len(found)} embeddings "
                f"(+{new_instances} instances, total {len(added)}) "
                f"({time.time() - started:.0f}s)",
                flush=True,
            )
            continue

        cube_sorted = {center: sorted(cube[center]) for center in sorted(cube)}
        print(
            f"[iter {iteration}] FRONTIER cube: "
            f"{json.dumps({str(c): cube_sorted[c] for c in cube_sorted})}",
            flush=True,
        )
        mining_started = time.time()
        mined, size = miner.mine_all_patterns(
            cube_sorted,
            log=lambda message: print("   ", message, flush=True),
        )
        print(
            f"[iter {iteration}] {len(mined)} minimal pattern(s) at k={size} "
            f"({time.time() - mining_started:.0f}s)",
            flush=True,
        )
        if not mined:
            print(
                f"[iter {iteration}] frontier cube has no minimal dead pattern; "
                "STOP for ALIVE review",
                flush=True,
            )
            return 1

        new_patterns = [
            {str(c): sorted(members) for c, members in pattern.items()}
            for pattern in mined
        ]
        rows = []
        failures = 0

        def _handle_result(pattern_json, certificate, elapsed, tag=""):
            nonlocal failures
            if certificate is not None and "kill" in certificate:
                print(
                    f"[iter {iteration}] certified {json.dumps(pattern_json)} "
                    f"kill={certificate['kill']} ({elapsed:.0f}s{tag})",
                    flush=True,
                )
                rows.append({
                    "pattern": pattern_json,
                    "cert": certificate,
                    "cube": cube_sorted,
                })
            else:
                failures += 1
                print(
                    f"[iter {iteration}] CERTIFY FAILED "
                    f"{json.dumps(pattern_json)} ({elapsed:.0f}s{tag})",
                    flush=True,
                )

        def _certify_locally(patterns, tag=""):
            with ProcessPoolExecutor(max_workers=WORKERS) as executor:
                for pattern_json, certificate, elapsed in executor.map(
                    certify_one, patterns
                ):
                    _handle_result(pattern_json, certificate, elapsed, tag)

        queue_mode = False
        if queue_client.enabled():
            capacity = queue_client.live_capacity()
            if capacity > 0:
                queue_mode = True
                queue_client.gc_stale_results()
                stem_patterns = {}
                submit_failed = []
                for idx, pattern_json in enumerate(new_patterns):
                    stem = queue_client.new_stem(f"cert-i{iteration:04d}")
                    try:
                        queue_client.submit(stem, pattern_json)
                        stem_patterns[stem] = pattern_json
                    except OSError as exc:
                        print(
                            f"[iter {iteration}] queue submit failed ({exc}); "
                            "will certify that pattern locally",
                            flush=True,
                        )
                        submit_failed.append(pattern_json)
                rounds = max(1, -(-len(stem_patterns) // capacity))
                print(
                    f"[iter {iteration}] certifying {len(stem_patterns)} "
                    f"motif(s) via work queue (live capacity {capacity}, "
                    f"timeout {CERT_TIMEOUT}s)",
                    flush=True,
                )

                def _on_cert(stem, data):
                    pattern_json = (data.get("pattern")
                                    or stem_patterns[stem])
                    worker = data.get("worker", "queue")
                    _handle_result(pattern_json, data.get("certificate"),
                                   data.get("elapsed", 0.0),
                                   tag=f", {worker}")

                deadline = (time.time() + CERT_TIMEOUT * rounds
                            + REMOTE_TIMEOUT_MARGIN)
                _completed, missing = queue_client.poll(
                    stem_patterns, deadline, _on_cert
                )
                leftovers = submit_failed + [stem_patterns[s] for s in missing]
                if leftovers:
                    queue_client.cancel(missing)
                    print(
                        f"[iter {iteration}] {len(leftovers)} certify job(s) "
                        "unreturned by queue deadline; falling back to local "
                        "certification",
                        flush=True,
                    )
                    _certify_locally(leftovers)
            else:
                print(
                    f"[iter {iteration}] queue mode: no live worker "
                    "heartbeats; certifying locally",
                    flush=True,
                )

        if not queue_mode:
            local_patterns = new_patterns
            remote_patterns = []
            if REMOTE_CERT_ENABLED and len(new_patterns) > WORKERS:
                local_patterns = new_patterns[:WORKERS]
                remote_patterns = new_patterns[WORKERS:]

            remote_stems = {}
            for idx, pattern_json in enumerate(remote_patterns):
                stem = f"iter{iteration:04d}_r{idx:03d}"
                try:
                    _submit_remote_job(stem, pattern_json)
                    remote_stems[stem] = pattern_json
                except OSError as exc:
                    print(
                        f"[iter {iteration}] remote submit failed ({exc}); "
                        "certifying locally instead",
                        flush=True,
                    )
                    local_patterns = local_patterns + [pattern_json]

            print(
                f"[iter {iteration}] certifying {len(local_patterns)} motif(s) "
                f"locally ({WORKERS} workers, timeout {CERT_TIMEOUT}s)"
                + (f" + {len(remote_stems)} remote (flux)" if remote_stems else ""),
                flush=True,
            )
            _certify_locally(local_patterns)

            if remote_stems:
                deadline = time.time() + CERT_TIMEOUT + REMOTE_TIMEOUT_MARGIN
                remote_results, timed_out = _poll_remote_results(
                    remote_stems, deadline
                )
                for pattern_json, certificate, elapsed in remote_results.values():
                    _handle_result(pattern_json, certificate, elapsed, tag=", flux")
                if timed_out:
                    print(
                        f"[iter {iteration}] {len(timed_out)} remote job(s) did not "
                        f"report within {CERT_TIMEOUT + REMOTE_TIMEOUT_MARGIN}s; "
                        "falling back to local certification",
                        flush=True,
                    )
                    _certify_locally(timed_out)

        if not rows:
            print(
                f"[iter {iteration}] 0/{len(new_patterns)} certified; STOP",
                flush=True,
            )
            return 1

        atomic_write_json(HERE / f"frontier_iter_{iteration:04d}.json", rows)
        committed = frontier_add.append_rows(rows)
        if not committed.records:
            print(
                f"[iter {iteration}] no new canonical motif was committed; STOP",
                flush=True,
            )
            return 1
        mining_cycles += 1

        new_instances = 0
        for bank_row in committed.records:
            source = _item_from_row(bank_row)
            key, source_to_key = cp.unlabeled_key_with_map(source["pattern"])
            source["canonical_key"] = key
            source["source_to_key"] = source_to_key
            representatives.setdefault(key, (source, source_to_key))
            new_instances += _seed_bank_row(instance, added, source)
        motif_keys = sorted(representatives)
        print(
            f"[iter {iteration}] banked {len(committed.records)} motif(s) "
            f"({failures} certify failures, "
            f"{committed.skipped_duplicates} duplicate skips), "
            f"+{new_instances} instances",
            flush=True,
        )

    print(f"MAX_ITERS reached ({len(added)} instances); INCONCLUSIVE", flush=True)
    return 1


def main():
    try:
        with driver_lease(HERE):
            return _run()
    except LockBusy as exc:
        print(f"REFUSING: {exc}", file=sys.stderr, flush=True)
        return 2
    except TerminalArtifactError as exc:
        print(
            f"[terminal] FAILED: {exc}; no new completion marker was published",
            file=sys.stderr,
            flush=True,
        )
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
