#!/usr/bin/env python3
"""Generate bank-generation-bound Census-554 cubes while certification runs.

This is a read-only speculative producer.  It solves an immutable DIMACS
snapshot, validates each SAT assignment and decoded cube, and filters
candidates through the frozen bank's motif-embedding surface.  When a model is
covered, it learns direct one-hot clauses for every matched bank-pattern orbit,
so later attempts skip the whole known-covered region instead of only the exact
cube.  It never acquires the driver lease, mutates ``bank.jsonl``, certifies a
pattern, or publishes a terminal result.

Every result is bound to the CNF and bank SHA-256 values in ``manifest.json``.
After any authoritative bank commit, consumers must recheck a candidate before
mining or certification.  An UNSAT observed after speculative blocking is not
an authoritative coverage result and is never published as one.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import signal
import shutil
import subprocess
import sys
import time
from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import census554_lib as L  # noqa: E402
import cover_probe as cp  # noqa: E402
import frontier_loop  # noqa: E402
import sat_cover  # noqa: E402
from census.census_554.io_protocol import atomic_write_json  # noqa: E402

SCHEMA = "census554_speculative_cube_state.v4"
READABLE_STATE_SCHEMAS = {SCHEMA, "census554_speculative_cube_state.v3"}
MANIFEST_SCHEMA = "census554_speculative_cube_manifest.v1"
BATCH_SCHEMA = "census554_speculative_learned_batch.v1"

_MATCHING_REPRESENTATIVES = None


class ProducerError(RuntimeError):
    pass


def _file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _cube_json(cube) -> dict[str, list[int]]:
    return {
        str(center): sorted(int(member) for member in members)
        for center, members in sorted(cube.items())
    }


def _cube_key(cube) -> str:
    raw = json.dumps(
        _cube_json(cube), sort_keys=True, separators=(",", ":")
    ).encode("ascii")
    return hashlib.sha256(raw).hexdigest()


def _load_manifest(run_dir: Path):
    path = run_dir / "manifest.json"
    value = json.loads(path.read_text(encoding="utf-8"))
    if value.get("schema") != MANIFEST_SCHEMA:
        raise ProducerError("wrong or missing speculative manifest schema")
    cnf_path = run_dir / value["cnf_snapshot"]
    bank_path = run_dir / value["bank_snapshot"]
    if _file_sha256(cnf_path) != value["cnf_sha256"]:
        raise ProducerError("CNF snapshot hash drift")
    if _file_sha256(bank_path) != value["bank_sha256"]:
        raise ProducerError("bank snapshot hash drift")
    with bank_path.open(encoding="utf-8") as handle:
        rows = sum(1 for line in handle if line.strip())
    if rows != int(value["bank_rows"]):
        raise ProducerError(f"bank row drift: expected {value['bank_rows']}, got {rows}")
    source_cube = {
        int(center): sorted(int(member) for member in members)
        for center, members in value["source_frontier_cube"].items()
    }
    if set(source_cube) != set(range(L.N)) or not L.cube_ok(source_cube):
        raise ProducerError("source frontier cube is invalid")
    return path, value, cnf_path, bank_path, source_cube


def _audit_dimacs(path: Path, expected_vars: int, expected_clauses: int):
    clauses = 0
    maximum = 0
    with path.open(encoding="ascii") as handle:
        header = handle.readline().split()
        if len(header) != 4 or header[:2] != ["p", "cnf"]:
            raise ProducerError("invalid DIMACS header")
        nvars, nclauses = int(header[2]), int(header[3])
        if (nvars, nclauses) != (expected_vars, expected_clauses):
            raise ProducerError(
                f"DIMACS manifest mismatch: {(nvars, nclauses)} != "
                f"{(expected_vars, expected_clauses)}"
            )
        for line_number, line in enumerate(handle, 2):
            if not line.strip() or line.startswith("c"):
                continue
            literals = [int(token) for token in line.split()]
            if not literals or literals[-1] != 0:
                raise ProducerError(f"unterminated clause at line {line_number}")
            if literals[:-1]:
                maximum = max(maximum, max(abs(lit) for lit in literals[:-1]))
            clauses += 1
    if clauses != expected_clauses or maximum > expected_vars:
        raise ProducerError(
            f"DIMACS body mismatch: clauses={clauses}, maxvar={maximum}"
        )
    return expected_vars, expected_clauses


def _load_representatives(bank_path: Path):
    rows = []
    with bank_path.open(encoding="utf-8") as handle:
        for line in handle:
            if line.strip():
                rows.append(json.loads(line))
    sources = [frontier_loop._item_from_row(row) for row in rows]
    return frontier_loop._motif_representatives(sources)


def _block_clause(decoder: sat_cover.CoverInstance, cube) -> list[int]:
    clause = []
    for center in range(L.N):
        members = cube.get(center)
        if members is None:
            members = cube[str(center)]
        wanted = frozenset(members)
        matches = [
            idx for idx, candidate in enumerate(decoder.cand[center])
            if candidate == wanted
        ]
        if len(matches) != 1:
            raise ProducerError(
                f"cube center {center} has {len(matches)} candidate matches"
            )
        clause.append(-decoder.x[(center, matches[0])])
    return clause


def _direct_pattern_clause(
    decoder: sat_cover.CoverInstance, pattern
) -> list[int]:
    """Exclude every cube containing ``pattern`` using only one-hot x vars.

    For each pattern center, the satisfying literals are precisely the class
    choices that do *not* contain that center's required member set.  Because
    each center chooses exactly one class, the disjunction is false exactly
    when every required member set is contained.  This is equivalent to the
    y-layer exclusion used by ``sat_cover.CoverInstance`` but introduces no
    variables and remains valid against an immutable DIMACS snapshot.
    """

    clause = []
    for center, members in sorted(pattern.items()):
        required = frozenset(members)
        clause.extend(
            decoder.x[(center, index)]
            for index, candidate in enumerate(decoder.cand[center])
            if not required <= candidate
        )
    return clause


def _auxiliary_pattern_clause(
    decoder: sat_cover.CoverInstance,
    pattern,
    *,
    source_nvars: int,
    y_vars: dict,
    definitions: list[list[int]],
) -> list[int]:
    """Return the compact y-layer equivalent of a direct exclusion clause.

    Variables are allocated strictly above the immutable snapshot header.
    The one-way ``x -> y`` definitions and negative-y exclusion have exactly
    the same semantics as ``CoverInstance.y_var``/``add_pattern_instance``.
    Reusing one auxiliary variable per ``(center, required-members)`` keeps a
    large learned surface compact without relying on undocumented variable
    identities inside the frozen source CNF.
    """

    clause = []
    for center, members in sorted(pattern.items()):
        key = (center, frozenset(members))
        variable = y_vars.get(key)
        if variable is None:
            variable = source_nvars + len(y_vars) + 1
            y_vars[key] = variable
            antecedents = [
                decoder.x[(center, index)]
                for index, candidate in enumerate(decoder.cand[center])
                if key[1] <= candidate
            ]
            if not antecedents:
                raise ProducerError(
                    f"pattern component {key} has no candidate class"
                )
            definitions.extend([[-x_var, variable] for x_var in antecedents])
        clause.append(-variable)
    return clause


def _pattern_json(pattern) -> dict[str, list[int]]:
    return {
        str(center): sorted(int(member) for member in members)
        for center, members in sorted(pattern.items())
    }


def _native_pattern(value):
    return {
        int(center): frozenset(int(member) for member in members)
        for center, members in value.items()
    }


def _pattern_inventory_sha256(values) -> str:
    raw = json.dumps(
        values, sort_keys=True, separators=(",", ":")
    ).encode("ascii")
    return hashlib.sha256(raw).hexdigest()


def _learned_batch_payload(
    values, *, manifest_sha256: str, attempt_first: int, attempt_last: int
):
    return {
        "schema": BATCH_SCHEMA,
        "manifest_sha256": manifest_sha256,
        "attempt_first": attempt_first,
        "attempt_last": attempt_last,
        "count": len(values),
        "patterns_sha256": _pattern_inventory_sha256(values),
        "patterns": values,
    }


def _learned_entry(relative, current_manifest_sha256: str):
    if isinstance(relative, str):
        return relative, current_manifest_sha256
    if not isinstance(relative, dict):
        raise ProducerError("invalid learned batch index entry")
    path = relative.get("path")
    manifest_sha256 = relative.get("source_manifest_sha256")
    if not isinstance(path, str) or not isinstance(manifest_sha256, str):
        raise ProducerError("invalid carried learned batch index entry")
    return path, manifest_sha256


def _load_learned_batch(path: Path, expected_manifest_sha256: str) -> dict:
    batch = json.loads(path.read_text(encoding="utf-8"))
    if (
        batch.get("schema") != BATCH_SCHEMA
        or batch.get("manifest_sha256") != expected_manifest_sha256
        or int(batch.get("count", -1)) != len(batch.get("patterns", []))
        or batch.get("patterns_sha256")
        != _pattern_inventory_sha256(batch.get("patterns", []))
    ):
        raise ProducerError(f"invalid learned batch: {path}")
    return batch


def _load_learned_values(run_dir: Path, state) -> list[dict]:
    values = []
    for entry in state.get("learned_batches", []):
        relative, expected_manifest = _learned_entry(
            entry, state["manifest_sha256"]
        )
        path = run_dir / relative
        batch = _load_learned_batch(path, expected_manifest)
        values.extend(batch["patterns"])
    if len(values) != int(state.get("learned_exclusion_count", -1)):
        raise ProducerError(
            "learned batch count disagrees with compact state index"
        )
    return values


def _file_is_prefix(prefix_path: Path, full_path: Path) -> bool:
    if prefix_path.stat().st_size > full_path.stat().st_size:
        return False
    with prefix_path.open("rb") as prefix, full_path.open("rb") as full:
        while True:
            left = prefix.read(1024 * 1024)
            if not left:
                return True
            if full.read(len(left)) != left:
                return False


def _link_or_copy(source: Path, target: Path) -> str:
    target.parent.mkdir(parents=True, exist_ok=True)
    if target.exists():
        if _file_sha256(target) != _file_sha256(source):
            raise ProducerError(f"conflicting carried learned batch: {target}")
        return "existing"
    try:
        os.link(source, target)
        return "hardlink"
    except OSError:
        shutil.copy2(source, target)
        return "copy"


def _carry_learned_batches(
    source_run_dir: Path,
    target_run_dir: Path,
    state: dict,
    current_manifest: dict,
    current_bank_path: Path,
) -> dict:
    (source_manifest_path, source_manifest, _source_cnf_path,
     source_bank_path, _source_cube) = _load_manifest(source_run_dir)
    source_manifest_sha = _file_sha256(source_manifest_path)
    if source_manifest["cnf_sha256"] != current_manifest["cnf_sha256"]:
        raise ProducerError("cannot carry learned exclusions across CNF drift")
    if not _file_is_prefix(source_bank_path, current_bank_path):
        raise ProducerError(
            "cannot carry learned exclusions: source bank is not a byte prefix"
        )
    source_state_path = source_run_dir / "state.json"
    source_state = json.loads(source_state_path.read_text(encoding="utf-8"))
    if (
        source_state.get("schema") not in READABLE_STATE_SCHEMAS
        or source_state.get("generation") != source_manifest
        or source_state.get("manifest_sha256") != source_manifest_sha
    ):
        raise ProducerError("carry source state disagrees with its manifest")
    prior = state.setdefault("carry_forward", [])
    if any(item.get("source_manifest_sha256") == source_manifest_sha
           for item in prior):
        return next(
            item for item in prior
            if item.get("source_manifest_sha256") == source_manifest_sha
        )
    if state.get("attempts") or state.get("learned_batches"):
        raise ProducerError(
            "learned carry-forward is allowed only before the first attempt"
        )

    carried_count = 0
    methods = {}
    for index, source_entry in enumerate(source_state.get("learned_batches", [])):
        relative, expected_manifest = _learned_entry(
            source_entry, source_state["manifest_sha256"]
        )
        source_path = source_run_dir / relative
        batch = _load_learned_batch(source_path, expected_manifest)
        target_relative = (
            Path("learned_batches")
            / f"carried-{source_manifest_sha[:12]}-{index:06d}.json"
        )
        method = _link_or_copy(source_path, target_run_dir / target_relative)
        methods[method] = methods.get(method, 0) + 1
        state["learned_batches"].append({
            "path": str(target_relative),
            "source_manifest_sha256": expected_manifest,
            "count": int(batch["count"]),
            "patterns_sha256": batch["patterns_sha256"],
        })
        carried_count += int(batch["count"])
    if carried_count != int(source_state.get("learned_exclusion_count", -1)):
        raise ProducerError("carry source learned count disagrees with batches")
    state["learned_exclusion_count"] += carried_count
    record = {
        "source_run_dir": str(source_run_dir.resolve()),
        "source_manifest_sha256": source_manifest_sha,
        "source_cnf_sha256": source_manifest["cnf_sha256"],
        "source_bank_sha256": source_manifest["bank_sha256"],
        "source_bank_rows": int(source_manifest["bank_rows"]),
        "target_bank_sha256": current_manifest["bank_sha256"],
        "target_bank_rows": int(current_manifest["bank_rows"]),
        "bank_prefix_validated": True,
        "learned_exclusion_count": carried_count,
        "materialization": methods,
    }
    prior.append(record)
    return record


def _publish_learned_batch(
    run_dir: Path,
    state,
    values,
    *,
    attempt_first: int,
    attempt_last: int,
) -> None:
    if not values:
        return
    relative = (
        Path("learned_batches")
        / f"learned-{attempt_first:06d}-{attempt_last:06d}.json"
    )
    path = run_dir / relative
    payload = _learned_batch_payload(
        values,
        manifest_sha256=state["manifest_sha256"],
        attempt_first=attempt_first,
        attempt_last=attempt_last,
    )
    if path.exists():
        existing = json.loads(path.read_text(encoding="utf-8"))
        if existing != payload:
            raise ProducerError(f"conflicting learned batch: {path}")
    else:
        atomic_write_json(path, payload)
    relative_string = str(relative)
    if relative_string not in state["learned_batches"]:
        state["learned_batches"].append(relative_string)
        state["learned_exclusion_count"] += len(values)


def _partition_choices(decoder: sat_cover.CoverInstance):
    """Interleave centers before advancing each center's candidate index."""

    return [
        (center, index)
        for index in range(max(len(decoder.cand[c]) for c in range(L.N)))
        for center in range(L.N)
        if index < len(decoder.cand[center])
    ]


def _diversifier(decoder, partition_choices, attempt: int, batch_first: int):
    """Keep one unrestricted CEGAR solve and diversify the other lanes."""

    if attempt == batch_first:
        return {"clause": None, "label": {"kind": "global"}}
    center, index = partition_choices[(attempt - 1) % len(partition_choices)]
    return {
        "clause": [decoder.x[(center, index)]],
        "label": {
            "kind": "partition",
            "center": center,
            "candidate_index": index,
        },
    }


DIMACS_HEADER_BYTES = 96


def _dimacs_header(nvars: int, nclauses: int) -> bytes:
    raw = f"p cnf {nvars} {nclauses}".encode("ascii")
    if len(raw) + 1 > DIMACS_HEADER_BYTES:
        raise ProducerError("DIMACS header exceeds reserved width")
    return raw + b" " * (DIMACS_HEADER_BYTES - len(raw) - 1) + b"\n"


def _write_shared_cnf(
    source: Path,
    target: Path,
    source_nvars: int,
    source_nclauses: int,
    auxiliary_nvars: int,
    auxiliary_definitions,
    blocks,
):
    """Materialize the immutable formula shared by every lane in a batch."""

    target.parent.mkdir(parents=True, exist_ok=True)
    with source.open("rb") as src, target.open("wb") as dst:
        src.readline()  # replace the frozen header with the augmented count
        dst.write(_dimacs_header(
            source_nvars + auxiliary_nvars,
            source_nclauses + len(auxiliary_definitions) + len(blocks),
        ))
        shutil.copyfileobj(src, dst, length=1024 * 1024)
        for clause in list(auxiliary_definitions) + list(blocks):
            dst.write((" ".join(map(str, clause)) + " 0\n").encode("ascii"))
        dst.flush()
        os.fsync(dst.fileno())


def _clone_shared_with_clause(
    shared: Path,
    target: Path,
    *,
    nvars: int,
    nclauses: int,
    clause,
) -> str:
    """Clone the shared batch formula and append one lane unit clause."""

    try:
        target.unlink()
    except FileNotFoundError:
        pass
    target.parent.mkdir(parents=True, exist_ok=True)
    method = "copy"
    commands = []
    if sys.platform == "darwin":
        commands.append(["cp", "-c", str(shared), str(target)])
    elif sys.platform.startswith("linux"):
        commands.append([
            "cp", "--reflink=auto", "--sparse=always", str(shared), str(target)
        ])
    for command in commands:
        result = subprocess.run(command, capture_output=True, text=True)
        if result.returncode == 0:
            method = "copy-on-write"
            break
    else:
        shutil.copyfile(shared, target)
    with target.open("r+b") as handle:
        handle.write(_dimacs_header(nvars, nclauses + 1))
        handle.seek(0, os.SEEK_END)
        handle.write((" ".join(map(str, clause)) + " 0\n").encode("ascii"))
        handle.flush()
        os.fsync(handle.fileno())
    return method


def _assignment(stdout: str, nvars: int) -> bytearray:
    values = bytearray(nvars + 1)  # 0 unknown, 1 true, 2 false
    for line in stdout.splitlines():
        if not line.startswith("v "):
            continue
        for token in line[2:].split():
            literal = int(token)
            if literal == 0:
                continue
            variable = abs(literal)
            if variable > nvars:
                raise ProducerError(f"model variable {variable} exceeds header")
            value = 1 if literal > 0 else 2
            if values[variable] not in (0, value):
                raise ProducerError(f"model assigns variable {variable} twice")
            values[variable] = value
    return values


def _check_model(path: Path, values: bytearray):
    with path.open(encoding="ascii") as handle:
        handle.readline()
        for line_number, line in enumerate(handle, 2):
            if not line.strip() or line.startswith("c"):
                continue
            literals = [int(token) for token in line.split()[:-1]]
            if not any(
                (literal > 0 and values[abs(literal)] == 1)
                or (literal < 0 and values[abs(literal)] == 2)
                for literal in literals
            ):
                raise ProducerError(f"SAT model fails DIMACS clause line {line_number}")


def _decode_cube(decoder: sat_cover.CoverInstance, values: bytearray):
    cube = {}
    for center in range(L.N):
        chosen = [
            idx for idx in range(len(decoder.cand[center]))
            if values[decoder.x[(center, idx)]] == 1
        ]
        if len(chosen) != 1:
            raise ProducerError(
                f"model chooses {len(chosen)} classes at center {center}"
            )
        cube[center] = sorted(decoder.cand[center][chosen[0]])
    if not L.cube_ok(cube):
        raise ProducerError("decoded SAT cube fails the source constraints")
    return cube


def _solve_one(
    *, run_dir: Path, shared_cnf_path: Path, decoder, shared_nvars: int,
    shared_nclauses: int, diversifier, attempt: int, seed: int, timeout: int,
):
    work = run_dir / "solver_tmp" / f"attempt-{attempt:06d}.cnf"
    cleanup_work = diversifier["clause"] is not None
    if cleanup_work:
        materialization = _clone_shared_with_clause(
            shared_cnf_path,
            work,
            nvars=shared_nvars,
            nclauses=shared_nclauses,
            clause=diversifier["clause"],
        )
        solve_path = work
    else:
        materialization = "shared"
        solve_path = shared_cnf_path
    started = time.time()
    try:
        result = subprocess.run(
            [
                "cadical", "-q", "-t", str(timeout),
                f"--seed={seed}", "--shuffle=1", "--randec=1", str(solve_path),
            ],
            capture_output=True,
            text=True,
            timeout=timeout + 30,
        )
        elapsed = time.time() - started
        if result.returncode == 20:
            return {"attempt": attempt, "seed": seed, "verdict": "UNSAT",
                    "elapsed": elapsed, "diversifier": diversifier["label"],
                    "cnf_materialization": materialization}
        if result.returncode != 10:
            return {"attempt": attempt, "seed": seed, "verdict": "UNKNOWN",
                    "returncode": result.returncode, "elapsed": elapsed,
                    "stderr_tail": result.stderr[-1000:],
                    "diversifier": diversifier["label"],
                    "cnf_materialization": materialization}
        values = _assignment(result.stdout, shared_nvars)
        _check_model(solve_path, values)
        cube = _decode_cube(decoder, values)
        return {"attempt": attempt, "seed": seed, "verdict": "SAT",
                "elapsed": elapsed, "cube": _cube_json(cube),
                "cube_sha256": _cube_key(cube), "model_checked": True,
                "diversifier": diversifier["label"],
                "cnf_materialization": materialization}
    except subprocess.TimeoutExpired:
        return {"attempt": attempt, "seed": seed, "verdict": "TIMEOUT",
                "elapsed": time.time() - started,
                "diversifier": diversifier["label"],
                "cnf_materialization": materialization}
    except Exception as exc:  # surface a failed guardrail in durable state
        return {"attempt": attempt, "seed": seed, "verdict": "ERROR",
                "elapsed": time.time() - started, "error": repr(exc),
                "diversifier": diversifier["label"],
                "cnf_materialization": materialization}
    finally:
        if cleanup_work:
            try:
                work.unlink()
            except FileNotFoundError:
                pass
def _matching_exclusions(representatives, cube, max_nodes: int):
    frozen = {center: frozenset(members) for center, members in cube.items()}
    skipped = 0
    found = {}
    covering = None
    for key in sorted(representatives):
        try:
            embeddings = cp.embed_into_cube_with_maps(
                key, frozen, max_nodes=max_nodes
            )
        except cp.EmbedBudgetExceeded:
            skipped += 1
            continue
        if embeddings:
            if covering is None:
                covering = frontier_loop._motif_json(key)
            for serialized in embeddings:
                embedded = {
                    center: frozenset(members)
                    for center, members in serialized
                }
                for image in frontier_loop.miner.orbit(embedded):
                    found.setdefault(cp.ser(image), image)
    if found:
        return (
            "covered-by-frozen-bank",
            skipped,
            covering,
            [found[key] for key in sorted(found)],
        )
    if skipped:
        return "frontier-candidate-budget-skips", skipped, None, []
    return "frontier-candidate", 0, None, []


def _init_matching_worker(representatives):
    global _MATCHING_REPRESENTATIVES
    _MATCHING_REPRESENTATIVES = representatives


def _matching_worker(payload):
    cube, max_nodes = payload
    if _MATCHING_REPRESENTATIVES is None:
        raise ProducerError("matching worker has no frozen representatives")
    return _matching_exclusions(
        _MATCHING_REPRESENTATIVES, cube, max_nodes
    )


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--run-dir", type=Path, required=True)
    parser.add_argument("--cores", type=int, default=8)
    parser.add_argument("--max-attempts", type=int, default=64)
    parser.add_argument("--max-frontiers", type=int, default=8)
    parser.add_argument("--wall-seconds", type=int, default=3600)
    parser.add_argument("--solver-timeout", type=int, default=120)
    parser.add_argument(
        "--embed-max-nodes", type=int, default=frontier_loop.EMBED_MAX_NODES
    )
    parser.add_argument(
        "--carry-learned-from",
        type=Path,
        help="prior run whose hash-checked learned batches may be reused when "
             "its source CNF is identical and its bank is a byte prefix",
    )
    args = parser.parse_args(argv)
    if min(args.cores, args.max_attempts, args.max_frontiers,
           args.wall_seconds, args.solver_timeout, args.embed_max_nodes) <= 0:
        parser.error("all numeric limits must be positive")

    stop_requested = False

    def request_stop(_signum, _frame):
        nonlocal stop_requested
        stop_requested = True

    signal.signal(signal.SIGTERM, request_stop)
    signal.signal(signal.SIGINT, request_stop)

    (manifest_path, manifest, cnf_path, bank_path,
     source_cube) = _load_manifest(args.run_dir)
    source_nvars, source_nclauses = _audit_dimacs(
        cnf_path, int(manifest["cnf_variables"]),
        int(manifest["cnf_clauses"]),
    )
    decoder = sat_cover.CoverInstance()
    representatives = _load_representatives(bank_path)
    state_path = args.run_dir / "state.json"
    if state_path.exists():
        state = json.loads(state_path.read_text(encoding="utf-8"))
        if (
            state.get("schema") not in READABLE_STATE_SCHEMAS
            or state.get("generation") != manifest
        ):
            raise ProducerError("state generation disagrees with manifest")
        state["schema"] = SCHEMA
    else:
        state = {
            "schema": SCHEMA,
            "status": "running",
            "generation": manifest,
            "manifest_sha256": _file_sha256(manifest_path),
            "attempts": [],
            "seen_cubes": [{
                "cube": _cube_json(source_cube),
                "cube_sha256": _cube_key(source_cube),
                "disposition": "source-frontier",
            }],
            "learned_batches": [],
            "learned_exclusion_count": 0,
            "frontier_candidates": [],
        }
    if args.carry_learned_from is not None:
        carry = _carry_learned_batches(
            args.carry_learned_from,
            args.run_dir,
            state,
            manifest,
            bank_path,
        )
        print(
            f"carried {carry['learned_exclusion_count']} learned exclusions "
            f"from {carry['source_manifest_sha256'][:12]} after CNF/prefix gates",
            flush=True,
        )
    atomic_write_json(state_path, state)

    exact_blocks = [
        _block_clause(decoder, record["cube"])
        for record in state["seen_cubes"]
    ]
    learned_values = _load_learned_values(args.run_dir, state)
    learned_patterns = [_native_pattern(value) for value in learned_values]
    learned_keys = {cp.ser(pattern) for pattern in learned_patterns}
    if len(learned_keys) != len(learned_patterns):
        raise ProducerError("learned batch inventory contains duplicates")
    auxiliary_y_vars = {}
    auxiliary_definitions = []
    learned_blocks = [
        _auxiliary_pattern_clause(
            decoder,
            pattern,
            source_nvars=source_nvars,
            y_vars=auxiliary_y_vars,
            definitions=auxiliary_definitions,
        )
        for pattern in learned_patterns
    ]
    blocks = exact_blocks + learned_blocks
    seen = {record["cube_sha256"] for record in state["seen_cubes"]}
    started = time.time()
    global_unsat_observed = False
    next_attempt = 1 + max(
        (int(record["attempt"]) for record in state["attempts"]), default=0
    )
    print(
        f"generation bank={manifest['bank_rows']}:{manifest['bank_sha256']} "
        f"cnf={source_nvars}v/{source_nclauses}c:{manifest['cnf_sha256']} "
        f"motifs={len(representatives)} cores={args.cores}",
        flush=True,
    )
    matching_executor = ProcessPoolExecutor(
        max_workers=args.cores,
        initializer=_init_matching_worker,
        initargs=(representatives,),
    )

    while (
        next_attempt <= args.max_attempts
        and len(state["frontier_candidates"]) < args.max_frontiers
        and time.time() - started < args.wall_seconds
        and not stop_requested
    ):
        batch = list(range(
            next_attempt,
            min(args.max_attempts + 1, next_attempt + args.cores),
        ))
        frozen_blocks = list(blocks)
        frozen_auxiliary_definitions = list(auxiliary_definitions)
        frozen_auxiliary_nvars = len(auxiliary_y_vars)
        shared_nvars = source_nvars + frozen_auxiliary_nvars
        shared_nclauses = (
            source_nclauses
            + len(frozen_auxiliary_definitions)
            + len(frozen_blocks)
        )
        shared_cnf_path = (
            args.run_dir / "solver_tmp"
            / f"shared-{batch[0]:06d}-{batch[-1]:06d}.cnf"
        )
        _write_shared_cnf(
            cnf_path,
            shared_cnf_path,
            source_nvars,
            source_nclauses,
            frozen_auxiliary_nvars,
            frozen_auxiliary_definitions,
            frozen_blocks,
        )
        partition_choices = _partition_choices(decoder)

        def solve_attempt(attempt):
            return _solve_one(
                run_dir=args.run_dir,
                shared_cnf_path=shared_cnf_path,
                decoder=decoder,
                shared_nvars=shared_nvars,
                shared_nclauses=shared_nclauses,
                diversifier=_diversifier(
                    decoder, partition_choices, attempt, batch[0]
                ),
                attempt=attempt,
                seed=1618033988 + attempt,
                timeout=args.solver_timeout,
            )

        with ThreadPoolExecutor(max_workers=args.cores) as executor:
            results = list(executor.map(solve_attempt, batch))
        matching_inputs = []
        matching_hashes = []
        batch_unique = set()
        for result in sorted(results, key=lambda item: item["attempt"]):
            if result["verdict"] != "SAT":
                continue
            cube_sha256 = result["cube_sha256"]
            if cube_sha256 in seen or cube_sha256 in batch_unique:
                continue
            batch_unique.add(cube_sha256)
            matching_hashes.append(cube_sha256)
            matching_inputs.append((
                {
                    int(center): members
                    for center, members in result["cube"].items()
                },
                args.embed_max_nodes,
            ))
        matching_outputs = matching_executor.map(
            _matching_worker, matching_inputs
        )
        matching_by_hash = dict(zip(matching_hashes, matching_outputs))
        new_learned_values = []
        for result in sorted(results, key=lambda item: item["attempt"]):
            if result["verdict"] == "SAT":
                cube_sha256 = result["cube_sha256"]
                if cube_sha256 in seen:
                    result["disposition"] = "duplicate-model"
                else:
                    cube = {
                        int(center): members
                        for center, members in result["cube"].items()
                    }
                    (disposition, skipped, covering,
                     matched_patterns) = matching_by_hash[cube_sha256]
                    result["disposition"] = disposition
                    result["embedding_budget_skips"] = skipped
                    if covering is not None:
                        result["covering_motif"] = covering
                    record = {
                        "attempt": result["attempt"],
                        "cube": result["cube"],
                        "cube_sha256": cube_sha256,
                        "disposition": disposition,
                        "embedding_budget_skips": skipped,
                    }
                    state["seen_cubes"].append(record)
                    seen.add(cube_sha256)
                    blocks.append(_block_clause(decoder, cube))
                    learned_added = 0
                    for pattern in matched_patterns:
                        pattern_key = cp.ser(pattern)
                        if pattern_key in learned_keys:
                            continue
                        learned_keys.add(pattern_key)
                        value = _pattern_json(pattern)
                        new_learned_values.append(value)
                        blocks.append(_auxiliary_pattern_clause(
                            decoder,
                            pattern,
                            source_nvars=source_nvars,
                            y_vars=auxiliary_y_vars,
                            definitions=auxiliary_definitions,
                        ))
                        learned_added += 1
                    result["learned_exclusions_added"] = learned_added
                    record["learned_exclusions_added"] = learned_added
                    if disposition.startswith("frontier-candidate"):
                        state["frontier_candidates"].append(record)
                        print(
                            f"frontier candidate {len(state['frontier_candidates'])} "
                            f"attempt={result['attempt']} cube={cube_sha256} "
                            f"budget_skips={skipped}",
                            flush=True,
                        )
            state["attempts"].append(result)
        _publish_learned_batch(
            args.run_dir,
            state,
            new_learned_values,
            attempt_first=batch[0],
            attempt_last=batch[-1],
        )
        state["updated_utc"] = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        state["elapsed_seconds"] = time.time() - started
        state["status"] = "running"
        atomic_write_json(state_path, state)
        counts = {}
        for result in results:
            key = result.get("disposition", result["verdict"])
            counts[key] = counts.get(key, 0) + 1
        print(
            f"attempts {batch[0]}..{batch[-1]}: "
            f"{json.dumps(counts, sort_keys=True)} "
            f"learned={len(learned_keys)}",
            flush=True,
        )
        try:
            shared_cnf_path.unlink()
        except FileNotFoundError:
            pass
        next_attempt = batch[-1] + 1
        global_result = next(
            result for result in results
            if result["diversifier"].get("kind") == "global"
        )
        if global_result["verdict"] == "UNSAT":
            # This is useful as a producer stop condition, but it has no proof
            # artifact and includes speculative learned clauses.  It is never
            # an authoritative terminal result.
            global_unsat_observed = True
            break

    matching_executor.shutdown(wait=True)

    if stop_requested:
        status = "operator-stop"
    elif global_unsat_observed:
        status = "speculative-global-unsat"
    elif len(state["frontier_candidates"]) >= args.max_frontiers:
        status = "frontier-limit"
    elif next_attempt > args.max_attempts:
        status = "attempt-limit"
    elif time.time() - started >= args.wall_seconds:
        status = "wall-limit"
    else:
        status = "speculative-unsat"
    state["status"] = status
    state["updated_utc"] = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
    state["elapsed_seconds"] = time.time() - started
    atomic_write_json(state_path, state)
    print(
        f"done status={status} attempts={len(state['attempts'])} "
        f"frontiers={len(state['frontier_candidates'])}",
        flush=True,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
