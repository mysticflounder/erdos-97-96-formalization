#!/usr/bin/env python3
"""Fail-closed portfolio replay of completed schema-v7 matrix artifacts.

This is an external solver experiment, not a certificate and not a Lean proof.
It never edits a parent run.  The archived SMT2 is replayed only after replacing
its sole final ``(check-sat)`` command with one ``(check-sat-assuming (...))``
that activates every declared ``track_*`` Boolean.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
from collections import Counter
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Sequence


SCHEMA_VERSION = 7
HERE = Path(__file__).resolve().parent
LANE_ROOT = HERE.parent
PROJECT_ROOT = LANE_ROOT.parents[2]
DEFAULT_OUTPUT = LANE_ROOT / "portfolio-replays-v7"
DEFAULT_Z3 = LANE_ROOT / ".venv/bin/z3"
STATUS_RE = re.compile(rb"^(sat|unsat|unknown)\r?$", re.MULTILINE)
TRACK_DECL_RE = re.compile(
    rb"(?m)^\(declare-fun (track_[A-Za-z0-9_]+) \(\) Bool\)[ \t]*\r?$"
)
HEX256_RE = re.compile(r"^[0-9a-f]{64}$")


class ReplayError(RuntimeError):
    """A validation failure that must stop replay."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ReplayError(message)


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def sha256_file(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def read_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise ReplayError(f"cannot read JSON {path}: {exc}") from exc
    require(isinstance(value, dict), f"expected a JSON object: {path}")
    return value


def timestamp_slug() -> str:
    return datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ")


def provenance_fields(value: dict[str, Any]) -> dict[str, Any]:
    names = (
        "target",
        "schema_version",
        "script_sha256",
        "schema_sha256",
        "uv_lock_sha256",
        "source_contract",
    )
    return {name: value.get(name) for name in names}


def validate_digest(value: object, label: str) -> str:
    require(isinstance(value, str) and HEX256_RE.fullmatch(value) is not None,
            f"{label} is not a lowercase SHA-256 digest")
    return value


@dataclass(frozen=True)
class ParentCase:
    case_id: str
    status: str
    case_dir: Path
    result_path: Path
    encoding_path: Path
    compact_result: dict[str, Any]
    result: dict[str, Any]
    result_sha256: str


@dataclass(frozen=True)
class ParentRun:
    summary_path: Path
    summary: dict[str, Any]
    summary_sha256: str
    invocation_path: Path
    invocation: dict[str, Any]
    invocation_sha256: str
    cases: tuple[ParentCase, ...]


def validate_live_provenance(summary: dict[str, Any]) -> dict[str, str]:
    expected = {
        "script_sha256": LANE_ROOT / "round5_cegar_v7.py",
        "schema_sha256": LANE_ROOT / "schema_v7.json",
        "uv_lock_sha256": LANE_ROOT / "uv.lock",
    }
    checked: dict[str, str] = {}
    for field, path in expected.items():
        require(path.is_file(), f"provenance file is missing: {path}")
        actual = sha256_file(path)
        require(actual == validate_digest(summary.get(field), f"summary.{field}"),
                f"live provenance mismatch for {path}: {actual} != {summary.get(field)}")
        checked[str(path)] = actual

    contract = summary.get("source_contract")
    require(isinstance(contract, dict), "summary.source_contract is not an object")
    files = contract.get("files")
    require(isinstance(files, dict) and files, "source_contract.files is empty or invalid")
    for role, item in sorted(files.items()):
        require(isinstance(item, dict), f"source_contract.files[{role!r}] is invalid")
        relative = item.get("path")
        require(isinstance(relative, str) and relative, f"source path for {role!r} is invalid")
        path = PROJECT_ROOT / relative
        require(path.is_file(), f"source provenance file is missing: {path}")
        actual = sha256_file(path)
        expected_hash = validate_digest(item.get("sha256"), f"source hash for {role!r}")
        require(actual == expected_hash,
                f"live source provenance mismatch for {path}: {actual} != {expected_hash}")
        checked[str(path)] = actual
    return checked


def validate_parent(summary_path: Path, statuses: set[str]) -> ParentRun:
    summary_path = summary_path.resolve()
    require(summary_path.name == "matrix_summary.json",
            "parent must be a matrix_summary.json artifact")
    summary = read_json(summary_path)
    require(summary.get("schema_version") == SCHEMA_VERSION,
            f"parent schema_version must be exactly {SCHEMA_VERSION}")
    require(isinstance(summary.get("target"), str) and summary["target"],
            "parent target is missing")
    require(isinstance(summary.get("complete"), bool),
            "parent summary lacks its final complete marker")
    results = summary.get("results")
    case_count = summary.get("case_count")
    require(isinstance(results, list), "parent summary.results is not a list")
    require(isinstance(case_count, int) and case_count > 0,
            "parent summary.case_count is invalid")
    require(len(results) == case_count,
            f"parent summary is incomplete: {len(results)} results != case_count {case_count}")
    require(all(isinstance(item, dict) for item in results),
            "parent summary contains a non-object result")
    case_ids = [item.get("case_id") for item in results]
    require(all(isinstance(case_id, str) and case_id for case_id in case_ids),
            "parent summary contains an invalid case_id")
    require(all(re.fullmatch(r"[A-Za-z0-9_-]+", str(case_id)) is not None
                for case_id in case_ids),
            "parent summary contains an unsafe case_id")
    require(len(set(case_ids)) == len(case_ids), "parent summary contains duplicate case_ids")

    status_counter = Counter(item.get("status") for item in results)
    require(all(key in {"sat", "unsat", "unknown", "error"} for key in status_counter),
            "parent summary contains an invalid status")
    declared_statuses = summary.get("statuses")
    require(isinstance(declared_statuses, dict), "parent summary.statuses is invalid")
    require(dict(status_counter) == declared_statuses,
            f"parent status histogram mismatch: {dict(status_counter)} != {declared_statuses}")
    expected_complete = status_counter["unknown"] == 0 and status_counter["error"] == 0
    require(summary["complete"] == expected_complete,
            "parent complete marker is inconsistent with its final status histogram")

    invocation_path = summary_path.parent / "invocation.json"
    require(invocation_path.is_file(), f"parent invocation is missing: {invocation_path}")
    invocation = read_json(invocation_path)
    require(provenance_fields(invocation) == provenance_fields(summary),
            "parent invocation and summary provenance differ")
    require(invocation.get("case_count") == case_count,
            "parent invocation and summary case_count differ")
    require(isinstance(invocation.get("argv"), list), "parent invocation.argv is invalid")
    validate_live_provenance(summary)

    selected: list[ParentCase] = []
    parent_provenance = provenance_fields(summary)
    for compact in sorted(results, key=lambda item: str(item["case_id"])):
        case_id = str(compact["case_id"])
        status = str(compact["status"])
        require(compact.get("schema_version") == SCHEMA_VERSION,
                f"compact result {case_id} has wrong schema")
        require(compact.get("script_sha256") == summary.get("script_sha256"),
                f"compact result {case_id} has wrong script hash")
        case_dir = summary_path.parent / case_id
        result_path = case_dir / "result.json"
        encoding_path = case_dir / "encoding.smt2.gz"
        require(result_path.is_file(), f"parent result is missing: {result_path}")
        result = read_json(result_path)
        require(provenance_fields(result) == parent_provenance,
                f"parent result {case_id} provenance differs from summary")
        require(result.get("case_id") == case_id, f"result case_id mismatch for {case_id}")
        require(result.get("status") == status, f"result status mismatch for {case_id}")
        solver = result.get("solver")
        require(isinstance(solver, dict) and solver.get("name") == "z3"
                and isinstance(solver.get("version"), str)
                and isinstance(solver.get("seed"), int),
                f"result solver provenance is invalid for {case_id}")
        compact_encoding = compact.get("encoding_sha256")
        result_encoding = result.get("encoding_sha256")
        require(result_encoding == compact_encoding,
                f"result encoding hash mismatch for {case_id}")
        if compact_encoding is None:
            require(status == "error",
                    f"non-error result {case_id} has no encoding hash")
            require(not encoding_path.exists(),
                    f"unhashed encoding artifact exists for error result {case_id}")
        else:
            compact_encoding_hash = validate_digest(
                compact_encoding, f"compact result {case_id} encoding_sha256"
            )
            require(encoding_path.is_file(), f"parent encoding is missing: {encoding_path}")
            try:
                compressed = encoding_path.read_bytes()
                decompressed = gzip.decompress(compressed)
            except (OSError, EOFError, gzip.BadGzipFile) as exc:
                raise ReplayError(f"cannot decompress {encoding_path}: {exc}") from exc
            require(sha256_bytes(decompressed) == compact_encoding_hash,
                    f"decompressed encoding hash mismatch for {case_id}")
        if status not in statuses:
            continue
        require(compact_encoding is not None,
                f"selected result {case_id} has no replayable encoding")
        selected.append(ParentCase(
            case_id=case_id,
            status=status,
            case_dir=case_dir,
            result_path=result_path,
            encoding_path=encoding_path,
            compact_result=compact,
            result=result,
            result_sha256=sha256_file(result_path),
        ))
    require(selected, f"parent has no results with statuses {sorted(statuses)}")
    return ParentRun(
        summary_path=summary_path,
        summary=summary,
        summary_sha256=sha256_file(summary_path),
        invocation_path=invocation_path,
        invocation=invocation,
        invocation_sha256=sha256_file(invocation_path),
        cases=tuple(selected),
    )


def top_level_commands(data: bytes) -> list[tuple[int, int, bytes]]:
    """Return (start, end, head) for top-level SMT-LIB commands."""
    commands: list[tuple[int, int, bytes]] = []
    depth = 0
    start: int | None = None
    in_string = False
    in_quoted_symbol = False
    in_comment = False
    i = 0
    while i < len(data):
        byte = data[i]
        if in_comment:
            if byte in (10, 13):
                in_comment = False
            i += 1
            continue
        if in_string:
            if byte == 34:
                if i + 1 < len(data) and data[i + 1] == 34:
                    i += 2
                    continue
                in_string = False
            i += 1
            continue
        if in_quoted_symbol:
            if byte == 92 and i + 1 < len(data):
                i += 2
                continue
            if byte == 124:
                in_quoted_symbol = False
            i += 1
            continue
        if byte == 59:
            in_comment = True
        elif byte == 34:
            in_string = True
        elif byte == 124:
            in_quoted_symbol = True
        elif byte == 40:
            if depth == 0:
                start = i
            depth += 1
        elif byte == 41:
            require(depth > 0, f"unbalanced ')' at byte {i}")
            depth -= 1
            if depth == 0:
                require(start is not None, "internal command scanner error")
                body = data[start + 1:i].lstrip()
                head = re.match(rb"[^\s()]+", body)
                require(head is not None, f"empty top-level command at byte {start}")
                commands.append((start, i + 1, head.group(0)))
                start = None
        i += 1
    require(depth == 0 and not in_string and not in_quoted_symbol,
            "unterminated SMT-LIB expression, string, or quoted symbol")
    return commands


def activate_tracks(original: bytes) -> tuple[bytes, list[str]]:
    commands = top_level_commands(original)
    query_commands = [item for item in commands if item[2] in {b"check-sat", b"check-sat-assuming"}]
    require(len(query_commands) == 1,
            f"encoding must contain exactly one solver query, found {len(query_commands)}")
    start, end, head = query_commands[0]
    require(head == b"check-sat", "archived query is not plain (check-sat)")
    require(original[start:end].strip() == b"(check-sat)",
            "archived query is not exactly plain (check-sat)")
    require(all(byte in b" \t\r\n" for byte in original[end:]),
            "archived (check-sat) is not the final command")

    track_bytes = TRACK_DECL_RE.findall(original)
    require(track_bytes, "encoding declares no track_* Boolean literals")
    require(len(set(track_bytes)) == len(track_bytes), "encoding has duplicate track declarations")
    for track in track_bytes:
        guarded = re.compile(rb"\(=>\s+" + re.escape(track) + rb"(?:\s|\()")
        require(guarded.search(original) is not None,
                f"declared track is not used as an implication guard: {track.decode()}")
    tracks = sorted(track.decode("ascii") for track in track_bytes)
    replacement = ("(check-sat-assuming (" + " ".join(tracks) + "))").encode("ascii")
    transformed = original[:start] + replacement + original[end:]
    transformed_queries = [item for item in top_level_commands(transformed)
                           if item[2] in {b"check-sat", b"check-sat-assuming"}]
    require(len(transformed_queries) == 1
            and transformed_queries[0][2] == b"check-sat-assuming",
            "internal error: transformed encoding does not have exactly one assumption query")
    require(transformed.count(replacement) == 1,
            "internal error: assumption query was not inserted exactly once")
    return transformed, tracks


def parse_status(stdout: bytes) -> tuple[str | None, list[str]]:
    matches = [match.group(1).decode("ascii") for match in STATUS_RE.finditer(stdout)]
    return (matches[0] if len(matches) == 1 else None), matches


def raw_process(argv: Sequence[str], *, timeout_seconds: float | None = None) -> dict[str, Any]:
    started = time.monotonic()
    timed_out = False
    try:
        completed = subprocess.run(
            list(argv), capture_output=True, check=False,
            timeout=timeout_seconds, env={**os.environ, "OMP_NUM_THREADS": "1",
                                          "OPENBLAS_NUM_THREADS": "1", "MKL_NUM_THREADS": "1"},
        )
        stdout, stderr, exit_code = completed.stdout, completed.stderr, completed.returncode
    except subprocess.TimeoutExpired as exc:
        timed_out = True
        stdout = exc.stdout or b""
        stderr = exc.stderr or b""
        exit_code = None
    except OSError as exc:
        stdout = b""
        stderr = f"{type(exc).__name__}: {exc}".encode("utf-8", errors="replace")
        exit_code = None
    elapsed = time.monotonic() - started
    return {
        "argv": list(argv),
        "exit_code": exit_code,
        "elapsed_seconds": elapsed,
        "host_timeout": timed_out,
        "stdout": stdout,
        "stderr": stderr,
        "stdout_sha256": sha256_bytes(stdout),
        "stderr_sha256": sha256_bytes(stderr),
    }


def save_process(prefix: Path, record: dict[str, Any]) -> dict[str, Any]:
    stdout_path = prefix.with_suffix(".stdout")
    stderr_path = prefix.with_suffix(".stderr")
    stdout_path.write_bytes(record.pop("stdout"))
    stderr_path.write_bytes(record.pop("stderr"))
    return {
        **record,
        "stdout_file": stdout_path.name,
        "stderr_file": stderr_path.name,
    }


def resolve_binary(value: Path | None, fallback: str | None, label: str) -> Path:
    candidate = value if value is not None else (Path(fallback) if fallback else None)
    require(candidate is not None, f"{label} binary was not provided or found")
    candidate = candidate.expanduser().resolve()
    require(candidate.is_file() and os.access(candidate, os.X_OK),
            f"{label} binary is not an executable file: {candidate}")
    return candidate


def binary_probe(binary: Path, kind: str) -> tuple[dict[str, Any], str | None]:
    argv = [str(binary), "-version"] if kind == "z3" else [str(binary), "--version"]
    raw = raw_process(argv, timeout_seconds=15.0)
    text = (raw["stdout"] + b"\n" + raw["stderr"]).decode("utf-8", errors="replace")
    if kind == "z3":
        match = re.search(r"Z3 version ([^\s]+)", text)
    else:
        match = re.search(r"(?:cvc5 version |This is cvc5 version )([^\s]+)", text, re.I)
    return raw, (match.group(1) if match else None)


@dataclass(frozen=True)
class Attempt:
    name: str
    engine: str
    seed: int
    tactic: str | None = None


def attempts_from_args(args: argparse.Namespace, parent_seed: int) -> list[Attempt]:
    attempts = [Attempt("z3-baseline", "z3", parent_seed)]
    for seed in args.z3_seed:
        attempts.append(Attempt(f"z3-seed-{seed}", "z3", seed))
    for tactic in args.z3_tactic:
        safe = re.sub(r"[^A-Za-z0-9_.-]+", "_", tactic)
        attempts.append(Attempt(f"z3-tactic-{safe}-seed-{args.tactic_seed}",
                                "z3", args.tactic_seed, tactic))
    if args.cvc5:
        attempts.append(Attempt(f"cvc5-nl-cov-seed-{args.cvc5_seed}",
                                "cvc5", args.cvc5_seed))
    names = [attempt.name for attempt in attempts]
    require(len(set(names)) == len(names), "duplicate portfolio attempt names")
    return attempts


def command_for(attempt: Attempt, binary: Path, transformed_path: Path,
                timeout_seconds: float) -> list[str]:
    timeout_ms = max(1, int(timeout_seconds * 1000))
    if attempt.engine == "z3":
        argv = [str(binary), "-smt2", f"-T:{max(1, int(timeout_seconds))}",
                f"smt.random_seed={attempt.seed}", "smt.threads=1"]
        if attempt.tactic is not None:
            argv.append(f"tactic.default_tactic={attempt.tactic}")
        return [*argv, str(transformed_path)]
    return [str(binary), "--lang=smt2", "--nl-cov", f"--seed={attempt.seed}",
            f"--tlimit={timeout_ms}", str(transformed_path)]


def replay_case(parent: ParentRun, case: ParentCase, run_dir: Path,
                attempts: list[Attempt], binaries: dict[str, Path],
                binary_metadata: dict[str, Any], timeout_seconds: float) -> dict[str, Any]:
    case_dir = run_dir / case.case_id
    case_dir.mkdir(parents=False, exist_ok=False)
    compressed = case.encoding_path.read_bytes()
    original = gzip.decompress(compressed)
    transformed, tracks = activate_tracks(original)
    transformed_gzip = gzip.compress(transformed, compresslevel=9, mtime=0)
    transformed_path = case_dir / "activated.smt2"
    transformed_path.write_bytes(transformed)
    (case_dir / "activated.smt2.gz").write_bytes(transformed_gzip)
    artifact_hashes = {
        "archived_encoding_compressed_sha256": sha256_bytes(compressed),
        "archived_encoding_decompressed_sha256": sha256_bytes(original),
        "original_encoding_sha256": sha256_bytes(original),
        "parent_encoding_sha256": case.result["encoding_sha256"],
        "transformed_encoding_sha256": sha256_bytes(transformed),
        "transformed_encoding_gzip_sha256": sha256_bytes(transformed_gzip),
        "parent_result_sha256": case.result_sha256,
        "parent_summary_sha256": parent.summary_sha256,
        "parent_invocation_sha256": parent.invocation_sha256,
    }
    records: list[dict[str, Any]] = []
    for attempt in attempts:
        attempt_dir = case_dir / attempt.name
        attempt_dir.mkdir(parents=False, exist_ok=False)
        binary = binaries[attempt.engine]
        preflight = None
        preflight_ok = True
        if attempt.engine == "cvc5":
            preflight_argv = [str(binary), "--lang=smt2", "--parse-only", str(transformed_path)]
            preflight_raw = raw_process(preflight_argv, timeout_seconds=min(timeout_seconds, 60.0))
            preflight_status, preflight_lines = parse_status(preflight_raw["stdout"])
            preflight_ok = (preflight_raw["exit_code"] == 0
                            and not preflight_raw["host_timeout"]
                            and preflight_status is None and not preflight_lines)
            preflight = save_process(attempt_dir / "preflight", preflight_raw)
            preflight["passed"] = preflight_ok
            preflight["status_lines"] = preflight_lines
        argv = command_for(attempt, binary, transformed_path, timeout_seconds)
        if preflight_ok:
            raw = raw_process(argv, timeout_seconds=timeout_seconds + 5.0)
            parsed_status, status_lines = parse_status(raw["stdout"])
            status = parsed_status if (parsed_status is not None and raw["exit_code"] == 0
                                       and not raw["host_timeout"]) else "error"
            saved = save_process(attempt_dir / "solve", raw)
        else:
            status_lines = []
            status = "error"
            saved = {
                "argv": argv,
                "exit_code": None,
                "elapsed_seconds": 0.0,
                "host_timeout": False,
                "stdout_file": None,
                "stderr_file": None,
                "stdout_sha256": None,
                "stderr_sha256": None,
                "not_run_reason": "cvc5 parse-only preflight failed",
            }
        records.append({
            "name": attempt.name,
            "engine": attempt.engine,
            "seed": attempt.seed,
            "tactic": attempt.tactic,
            "binary": str(binary),
            "binary_sha256": binary_metadata[attempt.engine]["binary_sha256"],
            "binary_version": binary_metadata[attempt.engine]["parsed_version"],
            "preflight": preflight,
            "status": status,
            "standalone_status_lines": status_lines,
            "process": saved,
            "evidence_scope": "external portfolio result only; not a certificate or Lean proof",
        })
    case_record = {
        "schema_version": 1,
        "case_id": case.case_id,
        "parent_status": case.status,
        "parent_summary": str(parent.summary_path),
        "parent_result": str(case.result_path),
        "parent_encoding": str(case.encoding_path),
        "transformed_encoding": str(transformed_path),
        "transformed_encoding_gzip": str(case_dir / "activated.smt2.gz"),
        "artifact_hashes": artifact_hashes,
        "activation_literals": tracks,
        "activation_count": len(tracks),
        "query_semantics": "one final check-sat replaced by exactly one check-sat-assuming",
        "attempts": records,
        "certification_claim": None,
    }
    (case_dir / "replay_result.json").write_text(
        json.dumps(case_record, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return case_record


def dry_run_plan(parent: ParentRun, args: argparse.Namespace) -> dict[str, Any]:
    cases = []
    versions = sorted({str(case.result["solver"]["version"]) for case in parent.cases})
    seeds = sorted({int(case.result["solver"]["seed"]) for case in parent.cases})
    for case in parent.cases:
        compressed = case.encoding_path.read_bytes()
        original = gzip.decompress(compressed)
        transformed, tracks = activate_tracks(original)
        cases.append({
            "case_id": case.case_id,
            "status": case.status,
            "compressed_sha256": sha256_bytes(compressed),
            "decompressed_sha256": sha256_bytes(original),
            "transformed_sha256": sha256_bytes(transformed),
            "activation_count": len(tracks),
            "activation_literals": tracks,
        })
    return {
        "dry_run": True,
        "solver_processes_launched": 0,
        "parent_summary": str(parent.summary_path),
        "parent_summary_sha256": parent.summary_sha256,
        "parent_invocation_sha256": parent.invocation_sha256,
        "selected_statuses": sorted(args.status),
        "case_count": len(cases),
        "archived_z3_versions": versions,
        "archived_z3_seeds": seeds,
        "cases": cases,
        "certification_claim": None,
    }


def run_replay(parent: ParentRun, args: argparse.Namespace) -> Path:
    versions = {str(case.result["solver"]["version"]) for case in parent.cases}
    require(len(versions) == 1, f"selected parent cases have mixed Z3 versions: {sorted(versions)}")
    z3_binary = resolve_binary(args.z3_binary,
                               str(DEFAULT_Z3) if DEFAULT_Z3.is_file() else shutil.which("z3"), "Z3")
    binaries = {"z3": z3_binary}
    if args.cvc5:
        binaries["cvc5"] = resolve_binary(args.cvc5_binary, shutil.which("cvc5"), "cvc5")

    binary_metadata: dict[str, Any] = {}
    for engine, binary in binaries.items():
        probe, parsed_version = binary_probe(binary, engine)
        require(probe["exit_code"] == 0 and not probe["host_timeout"] and parsed_version is not None,
                f"could not obtain exact {engine} binary version from {binary}")
        binary_metadata[engine] = {
            "binary": str(binary),
            "binary_sha256": sha256_file(binary),
            "parsed_version": parsed_version,
            "version_probe": probe,
        }
    archived_version = next(iter(versions))
    require(binary_metadata["z3"]["parsed_version"] == archived_version,
            "baseline Z3 version differs from archived parent version: "
            f"{binary_metadata['z3']['parsed_version']} != {archived_version}")

    output_root = args.output.resolve()
    parent_root = parent.summary_path.parent
    require(not output_root.is_relative_to(parent_root)
            and not parent_root.is_relative_to(output_root),
            "portfolio output root must not overlap the parent artifact run")
    output_root.mkdir(parents=True, exist_ok=True)
    run_dir = output_root / f"{timestamp_slug()}-portfolio-pid{os.getpid()}"
    run_dir.mkdir(parents=False, exist_ok=False)
    for engine, metadata in binary_metadata.items():
        probe = metadata["version_probe"]
        metadata["version_probe"] = save_process(run_dir / f"{engine}-version", probe)
    invocation = {
        "schema_version": 1,
        "argv": sys.argv,
        "started_utc": datetime.now(timezone.utc).isoformat(),
        "parent_summary": str(parent.summary_path),
        "parent_summary_sha256": parent.summary_sha256,
        "parent_invocation": str(parent.invocation_path),
        "parent_invocation_sha256": parent.invocation_sha256,
        "parent_provenance": provenance_fields(parent.summary),
        "selected_statuses": sorted(args.status),
        "selected_case_ids": [case.case_id for case in parent.cases],
        "timeout_seconds": args.timeout_seconds,
        "binary_metadata": binary_metadata,
        "attempt_templates": {
            "baseline": "archived per-case Z3 seed",
            "alternate_z3_seeds": args.z3_seed,
            "z3_default_tactics": args.z3_tactic,
            "tactic_seed": args.tactic_seed,
            "cvc5_nl_cov": args.cvc5,
            "cvc5_seed": args.cvc5_seed,
        },
        "evidence_scope": "external portfolio replay; not certification and not a Lean proof",
    }
    (run_dir / "invocation.json").write_text(
        json.dumps(invocation, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    started = time.monotonic()
    case_records = [replay_case(
                        parent, case, run_dir,
                        attempts_from_args(args, int(case.result["solver"]["seed"])),
                        binaries, binary_metadata, args.timeout_seconds,
                    )
                    for case in parent.cases]
    histogram = Counter(
        attempt["status"] for record in case_records for attempt in record["attempts"]
    )
    summary = {
        "schema_version": 1,
        "parent_summary": str(parent.summary_path),
        "parent_summary_sha256": parent.summary_sha256,
        "case_count": len(case_records),
        "attempt_count": sum(len(record["attempts"]) for record in case_records),
        "statuses": dict(sorted(histogram.items())),
        "elapsed_seconds": time.monotonic() - started,
        "results": [{"case_id": record["case_id"],
                     "result_file": f"{record['case_id']}/replay_result.json"}
                    for record in case_records],
        "certification_claim": None,
    }
    (run_dir / "portfolio_summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return run_dir


def self_test() -> None:
    base = (b"(set-logic QF_NRA)\n"
            b"(declare-fun track_b () Bool)\n"
            b"(declare-fun track_a () Bool)\n"
            b"(assert (=> track_a true))\n"
            b"(assert (=> track_b true))\n"
            b"(check-sat)\n")
    transformed, tracks = activate_tracks(base)
    require(tracks == ["track_a", "track_b"], "self-test track ordering failed")
    require(transformed.endswith(b"(check-sat-assuming (track_a track_b))\n"),
            "self-test query replacement failed")
    require(transformed.count(b"check-sat") == 1, "self-test produced multiple queries")
    require(parse_status(b"warning\nunknown\n")[0] == "unknown", "status parse failed")
    require(parse_status(b"sat\nunsat\n")[0] is None, "ambiguous status was accepted")
    require(parse_status(b"result: sat\n")[0] is None, "non-standalone status was accepted")
    for bad in (
        base + b"(check-sat)\n",
        base.replace(b"(check-sat)", b"(check-sat-assuming (track_a))"),
        base.replace(b"(assert (=> track_b true))\n", b""),
    ):
        try:
            activate_tracks(bad)
        except ReplayError:
            pass
        else:
            raise ReplayError("self-test accepted malformed replay input")

    # A final summary with UNKNOWN is deliberately complete:false in v7.  It is
    # nevertheless eligible once every listed per-case record and hash exists.
    with tempfile.TemporaryDirectory(prefix="replay-final-unknowns-") as temp:
        run_dir = Path(temp)
        encoding_hash = sha256_bytes(base)
        source_path = LANE_ROOT / "schema_v7.json"
        provenance = {
            "target": "self-test-target",
            "schema_version": SCHEMA_VERSION,
            "script_sha256": sha256_file(LANE_ROOT / "round5_cegar_v7.py"),
            "schema_sha256": sha256_file(LANE_ROOT / "schema_v7.json"),
            "uv_lock_sha256": sha256_file(LANE_ROOT / "uv.lock"),
            "source_contract": {
                "files": {
                    "self_test": {
                        "path": str(source_path.relative_to(PROJECT_ROOT)),
                        "sha256": sha256_file(source_path),
                    }
                }
            },
        }
        compact = {
            "case_id": "self_test_case",
            "status": "unknown",
            "schema_version": SCHEMA_VERSION,
            "script_sha256": provenance["script_sha256"],
            "encoding_sha256": encoding_hash,
        }
        summary = {
            **provenance,
            "case_count": 1,
            "statuses": {"unknown": 1},
            "complete": False,
            "results": [compact],
        }
        invocation = {**provenance, "case_count": 1, "argv": ["self-test"]}
        result = {
            **provenance,
            "case_id": "self_test_case",
            "status": "unknown",
            "encoding_sha256": encoding_hash,
            "solver": {"name": "z3", "version": "self-test", "seed": 97},
        }
        case_dir = run_dir / "self_test_case"
        case_dir.mkdir()
        (run_dir / "matrix_summary.json").write_text(json.dumps(summary), encoding="utf-8")
        (run_dir / "invocation.json").write_text(json.dumps(invocation), encoding="utf-8")
        (case_dir / "result.json").write_text(json.dumps(result), encoding="utf-8")
        (case_dir / "encoding.smt2.gz").write_bytes(gzip.compress(base, mtime=0))
        validated = validate_parent(run_dir / "matrix_summary.json", {"unknown"})
        require(len(validated.cases) == 1, "complete:false parent validation failed")


def parser() -> argparse.ArgumentParser:
    top = argparse.ArgumentParser(description=__doc__)
    top.add_argument("--self-test", action="store_true",
                     help="run internal transformation/parser tests; invokes no solver")
    top.add_argument("--summary", type=Path, help="completed v7 matrix_summary.json")
    top.add_argument("--status", action="append", choices=("sat", "unsat", "unknown", "error"),
                     help="parent status to replay (repeatable; default: unknown)")
    top.add_argument("--dry-run", action="store_true",
                     help="validate and print transformations without invoking any solver")
    top.add_argument("--output", type=Path, default=DEFAULT_OUTPUT,
                     help="separate portfolio artifact root")
    top.add_argument("--timeout-seconds", type=float, default=300.0)
    top.add_argument("--z3-binary", type=Path,
                     help="baseline Z3 executable; version must match archived results")
    top.add_argument("--z3-seed", type=int, action="append", default=[],
                     help="add a deterministic alternate Z3 seed attempt")
    top.add_argument("--z3-tactic", action="append", default=[],
                     help="add a Z3 tactic.default_tactic attempt (for example qfnra-nlsat)")
    top.add_argument("--tactic-seed", type=int, default=97)
    top.add_argument("--cvc5", action="store_true",
                     help="add cvc5 parse-only preflight followed by --nl-cov")
    top.add_argument("--cvc5-binary", type=Path)
    top.add_argument("--cvc5-seed", type=int, default=97)
    return top


def main() -> int:
    args = parser().parse_args()
    try:
        if args.self_test:
            require(args.summary is None, "--self-test cannot be combined with --summary")
            self_test()
            print(json.dumps({"self_test": "passed", "solver_processes_launched": 0}, sort_keys=True))
            return 0
        require(args.summary is not None, "--summary is required unless --self-test is used")
        require(args.timeout_seconds > 0, "--timeout-seconds must be positive")
        args.status = args.status or ["unknown"]
        require(len(set(args.status)) == len(args.status), "duplicate --status values")
        parent = validate_parent(args.summary, set(args.status))
        if args.dry_run:
            print(json.dumps(dry_run_plan(parent, args), indent=2, sort_keys=True))
            return 0
        run_dir = run_replay(parent, args)
        print(json.dumps({"portfolio_run_dir": str(run_dir),
                          "summary": str(run_dir / "portfolio_summary.json"),
                          "certification_claim": None}, sort_keys=True))
        return 0
    except ReplayError as exc:
        print(f"replay validation failed: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
