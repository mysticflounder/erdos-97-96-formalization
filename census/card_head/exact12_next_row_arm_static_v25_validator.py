"""Independent, fail-closed validator for the exact-12 v25 arm-static canary.

This is deliberately not a wrapper around the frozen v24 validator.  It checks
the v13 descriptor/receipt/custody envelope, live source bytes, and either a
total SAT replay or a fresh, byte-identical UNSAT proof check.  All results are
finite discovery evidence only.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import shutil
import stat
import subprocess
from collections.abc import Callable
from pathlib import Path
from typing import Any

RUN_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_run.v13"
JOB_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_canary_job.v13"
DESCRIPTOR_SCHEMA = "p97_rigid221_exact12_next_row_arm_static_piqd_descriptor.v2"
SOURCE_SCHEMA = "p97-piqd-static-source/v1"
PRODUCER_SCHEMA = "p97-piqd-static-producer/v1"
RECEIPT_SCHEMA = "p97-piqd-static-solver-receipt/v1"
CUSTODY_SCHEMA = "p97-piqd-static-attempt-custody-seal/v1"
JOURNAL_SCHEMA = "p97-cegar-wave-journal-seal/v1"
ATTEMPT_SCHEMA = "p97-cegar-wave-attempt/v1"
PROJECT = "p97-exact12-next-row-arm-static-cell6-v13-r1"
CERTIFICATE_BLOCKER = "CERT-001"
TERMINAL_STATUS = "UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE"
LEAN_INGRESS_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FullMembershipPrefixTerminalConsumer."
    "false_of_terminalFullMembershipNamedDeletionArmBank"
)

EXPECTED_ARM_CELL = 6
EXPECTED_PLACEMENT = 1
EXPECTED_PREFIX_VARS = 47174
EXPECTED_PREFIX_CLAUSES = 679351
EXPECTED_PREFIX_SHA256 = "ef94a6d4624b242a77195455d312a8e7f880e3fe547882b23c67d0359ce4d759"
EXPECTED_POST_ARM_CLAUSES = 680218
EXPECTED_POST_ARM_SHA256 = "4f15259e8d8494e4ebb741b52328cef4049049fe027159cd6ba0b19c4e50702d"
EXPECTED_SOURCE_ORDER_CLAUSES = 81
EXPECTED_SOURCE_ORDER_SHA256 = "cedf416274a28e0aaee1fe148986610fe7e0f81ca510cae5a69b43af3aa4348c"
EXPECTED_FINAL_VARS = 47174
EXPECTED_FINAL_CLAUSES = 680299
EXPECTED_FINAL_SHA256 = "81b4e2e2fb6b39340253d0407a891d2d6b925cb444c56964e8dafdfb4597ae11"

MAX_FILE_BYTES = 256 * 1024 * 1024
MAX_JSON_BYTES = 64 * 1024 * 1024
MAX_JSON_DEPTH = 96
MAX_JSON_NODES = 4_000_000

_BANK_KEYS = (
    "positive_membership_bank", "surplus_apex_pair_family_bank",
    "adjacent_apex_cross_block_family_bank", "second_cap_apex_surplus_family_bank",
    "surplus_three_triad_family_bank", "zero_center_cross_block_family_bank",
    "apex_zero_cross_block_family_bank", "apex_pair_cross_block_family_bank",
    "apex_shared_pair_cross_block_family_bank", "apex_internal_shared_pair_common_five_family_bank",
    "apex_first_opposite_shared_pair_common_five_family_bank",
    "apex_first_opposite_shared_pair_second_opposite_common_five_family_bank",
    "apex_first_opposite_shared_pair_surplus_common_five_family_bank",
    "reciprocal_first_opposite_surplus_second_opposite_common_five_family_bank",
    "first_opposite_pair_surplus_second_opposite_common_five_family_bank",
    "second_opposite_triple_surplus_first_opposite_three_triad_family_bank",
    "all_order_common_five_family_bank",
    "center_exchange_all_order_common_five_family_bank",
    "apex_triple_surplus_second_opposite_common_five_family_bank",
    "surplus_pair_second_opposite_apex_pair_common_five_family_bank",
    "apex_first_surplus_second_common_five_family_bank",
    "second_apex_surplus_second_first_common_five_family_bank",
)
_ARTIFACT_KEYS = frozenset({"job", "arm_suffix", *_BANK_KEYS, "source_order_bank",
                            "source_order_installation", "discovery_cnf", "survivor",
                            "terminal_cnf", "proof"})
_SUMMARY_KEYS = frozenset({"schema", "scope", "job_id", "job_sha256", "arm_cell_index",
                           "status", "classification", "discovery_verdict", "terminal_verdict",
                           "terminal_proof_verified", "terminal_proof_authenticated",
                           "lean_terminal_ingress_ready", "lean_ingress_theorem",
                           "terminal_promotion_status", "replay", "timeout_seconds", "nice",
                           "artifacts", "error", "discovery_stdout_tail", "terminal_stdout_tail"})
_RECEIPT_KEYS = frozenset({"schema", "attempt", "attempt_directory", "journal", "receipt_path",
                           "custody_seal_path", "job_id", "job_identity", "prepare_freshness_claimed",
                           "outcome", "adapter_verdict", "adapter_returncode", "cnf_sha256",
                           "num_variables", "num_clauses", "source_manifest_sha256",
                           "producer_manifest_sha256", "terminal_record_sha256", "journal_record_count",
                           "seal_sha256", "status_classification", "status_detail", "terminal_status",
                           "terminal_status_canonical_sha256", "terminal_status_raw_sha256",
                           "terminal_status_raw_size", "terminal_status_raw_artifact_sha256",
                           "terminal_status_identity_scope", "terminal_status_exposed_identity_fields",
                           "model_response_sha256", "endpoint_trace", "failure_detail",
                           "custody_retry_policy", "legacy_drat_proof_path_written", "proof_endpoint_called",
                           "certificate_blocker", "claims", "receipt_sha256"})
_CUSTODY_KEYS = frozenset({
    "schema", "attempt_directory_device", "attempt_directory_inode",
    "receipt_sha256", "receipt_file_sha256", "receipt_file_size",
    "receipt_device", "receipt_inode", "inventory", "retry_policy",
    "custody_seal_sha256",
})
_ATTEMPT_KEYS = frozenset({"schema", "attempt_id", "attempt_index", "wave_manifest_sha256",
                           "previous_attempt_sha256", "backend", "solver_profile", "outcome",
                           "artifacts", "detail", "record_sha256"})
_FALSE_CLAIMS = ("source_entitlement", "theorem_coverage", "universal_lift",
                 "lean_closure", "one_process", "one_core")
_DESCRIPTOR_FALSE_CLAIMS = ("source_entitlement", "theorem_coverage", "universal_lift",
                            "lean_closure")
_SURVIVOR_CLASSIFICATIONS = frozenset({
    "STRUCTURALLY_UNRESOLVED",
    "STATIC_CONVEX_INVARIANT_FAILED",
    "UNADMITTED_STRUCTURAL_SURVIVOR",
})


class V25ValidationError(ValueError):
    """Raised for every missing, substituted, ambiguous, or unsafe field."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":"),
                      ensure_ascii=False, allow_nan=False).encode("utf-8")


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def sha256_json(value: Any) -> str:
    return sha256_bytes(canonical_json_bytes(value))


def _pretty_json_bytes(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, indent=2, allow_nan=False) + "\n").encode()


def _producer_pretty_json_sha256(value: Any) -> str:
    """Hash the producer's root-job JSON representation (pretty JSON + LF)."""
    return sha256_bytes(_pretty_json_bytes(value))


def _descriptor_file_sha256(raw: bytes) -> str:
    """Hash the producer's exact descriptor file bytes, including its LF."""
    return sha256_bytes(raw)


def _fail(message: str) -> None:
    raise V25ValidationError(message)


def _pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _shape(value: Any, path: Path, depth: int = 0, count: list[int] | None = None) -> None:
    count = [0] if count is None else count
    count[0] += 1
    if count[0] > MAX_JSON_NODES or depth > MAX_JSON_DEPTH:
        _fail(f"{path}: JSON shape exceeds bound")
    if isinstance(value, float) and not math.isfinite(value):
        _fail(f"{path}: non-finite JSON number")
    if isinstance(value, dict):
        for key, item in value.items():
            if type(key) is not str:
                _fail(f"{path}: non-string JSON key")
            _shape(item, path, depth + 1, count)
    elif isinstance(value, list):
        for item in value:
            _shape(item, path, depth + 1, count)


def _json(raw: bytes, path: Path) -> Any:
    if len(raw) > MAX_JSON_BYTES:
        _fail(f"{path}: JSON exceeds bounded size")
    try:
        value = json.loads(raw.decode("utf-8"), object_pairs_hook=_pairs)
    except (UnicodeDecodeError, json.JSONDecodeError, RecursionError, V25ValidationError) as exc:
        _fail(f"{path}: invalid JSON: {exc}")
    _shape(value, path)
    return value


def _canonical_file(raw: bytes, path: Path) -> Any:
    if not raw.endswith(b"\n"):
        _fail(f"{path}: canonical JSON is not newline terminated")
    value = _json(raw[:-1], path)
    if canonical_json_bytes(value) + b"\n" != raw:
        _fail(f"{path}: canonical JSON bytes changed")
    return value


def _open_regular(path: Path, maximum: int = MAX_FILE_BYTES) -> tuple[int, os.stat_result]:
    native = Path(os.path.abspath(os.fspath(path)))
    if not native.parts or native.parts[0] != os.sep:
        _fail(f"not absolute: {path}")
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    directory_flags = flags | getattr(os, "O_DIRECTORY", 0)
    root = os.open(os.sep, directory_flags)
    current = root
    try:
        for component in native.parts[1:-1]:
            if component in {"", ".", ".."}:
                _fail(f"unsafe path: {path}")
            nxt = os.open(component, directory_flags, dir_fd=current)
            info = os.fstat(nxt)
            if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
                os.close(nxt)
                _fail(f"symlinked/non-directory ancestor: {path}")
            if current != root:
                os.close(current)
            current = nxt
        try:
            fd = os.open(native.parts[-1], flags, dir_fd=current)
        except OSError as exc:
            _fail(f"cannot open regular file without following links: {path}: {exc}")
        info = os.fstat(fd)
        if not stat.S_ISREG(info.st_mode) or stat.S_ISLNK(info.st_mode):
            os.close(fd); _fail(f"not a regular file: {path}")
        if info.st_nlink != 1:
            os.close(fd); _fail(f"hard-linked file rejected: {path}")
        if info.st_size > maximum:
            os.close(fd); _fail(f"file exceeds bound: {path}")
        return fd, info
    finally:
        if current != root:
            os.close(current)
        os.close(root)


def _read(path: Path, maximum: int = MAX_FILE_BYTES) -> bytes:
    fd, before = _open_regular(path, maximum)
    try:
        chunks: list[bytes] = []
        while True:
            chunk = os.read(fd, min(1024 * 1024, maximum + 1 - sum(map(len, chunks))))
            if not chunk:
                break
            chunks.append(chunk)
        after = os.fstat(fd)
    finally:
        os.close(fd)
    if before.st_size != after.st_size or before.st_mtime_ns != after.st_mtime_ns or before.st_ino != after.st_ino:
        _fail(f"file changed while reading: {path}")
    raw = b"".join(chunks)
    if len(raw) > maximum:
        _fail(f"file exceeds bound: {path}")
    return raw


def _directory(path: Path) -> None:
    native = Path(os.path.abspath(os.fspath(path)))
    if not native.parts or native.parts[0] != os.sep:
        _fail(f"not absolute directory: {path}")
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    root = os.open(os.sep, flags); current = root
    try:
        for component in native.parts[1:]:
            if component in {"", ".", ".."}:
                _fail(f"unsafe directory: {path}")
            nxt = os.open(component, flags, dir_fd=current)
            if not stat.S_ISDIR(os.fstat(nxt).st_mode):
                os.close(nxt); _fail(f"not a directory: {path}")
            if current != root: os.close(current)
            current = nxt
    finally:
        if current != root: os.close(current)
        os.close(root)


def _obj(value: Any, name: str) -> dict[str, Any]:
    if type(value) is not dict:
        _fail(f"{name} must be an object")
    return value


def _str(value: Any, name: str) -> str:
    if type(value) is not str or not value:
        _fail(f"{name} must be a non-empty string")
    return value


def _int(value: Any, name: str) -> int:
    if type(value) is not int or value < 0:
        _fail(f"{name} must be a non-negative integer")
    return value


def _false_claims(value: Any, name: str, expected: tuple[str, ...] = _FALSE_CLAIMS) -> None:
    claims = _obj(value, name)
    if set(claims) != set(expected):
        _fail(f"{name} has missing or extra claim fields")
    if any(type(claims[key]) is not bool or claims[key] is not False for key in expected):
        _fail(f"{name} contains an affirmative/ambiguous claim")


def _safe_relative(value: Any, name: str) -> str:
    path = _str(value, name)
    candidate = Path(path)
    if candidate.is_absolute() or ".." in candidate.parts or "" in candidate.parts:
        _fail(f"{name} is unsafe")
    return path


def _check_artifacts(workdir: Path, summary: dict[str, Any]) -> dict[str, bytes]:
    artifacts = _obj(summary.get("artifacts"), "summary.artifacts")
    if set(artifacts) != _ARTIFACT_KEYS:
        _fail("summary.artifacts inventory mismatch")
    raw: dict[str, bytes] = {}
    for name, record in artifacts.items():
        if record is None:
            continue
        record = _obj(record, f"artifact {name}")
        if set(record) != {"path", "bytes", "sha256"}:
            _fail(f"artifact {name} record mismatch")
        rel = _safe_relative(record["path"], f"artifact {name}.path")
        if "/" in rel:
            _fail(f"artifact {name} must be a direct workdir file")
        payload = _read(workdir / rel)
        if len(payload) != _int(record["bytes"], f"artifact {name}.bytes") or sha256_bytes(payload) != _str(record["sha256"], f"artifact {name}.sha256"):
            _fail(f"artifact {name} hash/size mismatch")
        raw[name] = payload
    return raw


def _dimacs(raw: bytes, name: str) -> tuple[int, int, list[list[int]]]:
    try:
        lines = raw.decode("ascii").splitlines()
    except UnicodeDecodeError as exc:
        _fail(f"{name}: non-ASCII DIMACS: {exc}")
    header = [line.split() for line in lines if line and not line.startswith("c") and line.startswith("p ")]
    if len(header) != 1 or len(header[0]) != 4 or header[0][1] != "cnf":
        _fail(f"{name}: malformed DIMACS header")
    variables, clauses = int(header[0][2]), int(header[0][3])
    parsed: list[list[int]] = []
    for line in lines:
        if not line or line.startswith(("c", "p ")):
            continue
        values = [int(token) for token in line.split()]
        if not values or values[-1] != 0:
            _fail(f"{name}: unterminated clause")
        clause = values[:-1]
        if any(abs(lit) > variables or lit == 0 for lit in clause):
            _fail(f"{name}: literal outside variable range")
        parsed.append(clause)
    if len(parsed) != clauses:
        _fail(f"{name}: clause count mismatch")
    return variables, clauses, parsed


def _assignment(value: Any, variables: int) -> set[int]:
    if type(value) is not list or len(value) != variables:
        _fail("SAT survivor assignment is not complete")
    positive: set[int] = set()
    for item in value:
        if type(item) is not int or item == 0 or abs(item) > variables:
            _fail("SAT survivor has an invalid signed literal")
        if abs(item) in positive or -item in positive:
            _fail("SAT survivor assignment has duplicate variable")
        positive.add(item if item > 0 else -item)
    if {abs(item) for item in value} != set(range(1, variables + 1)):
        _fail("SAT survivor assignment does not cover every variable")
    return {item for item in value if item > 0}


def _replay(clauses: list[list[int]], assignment: set[int]) -> None:
    if any(not any((lit > 0 and lit in assignment) or (lit < 0 and -lit not in assignment) for lit in clause) for clause in clauses):
        _fail("SAT assignment does not satisfy discovery CNF")


def _verify_drat(cnf: Path, proof: Path) -> bool:
    executable = shutil.which("drat-trim")
    if executable is None:
        return False
    try:
        result = subprocess.run(
            [executable, str(cnf), str(proof)],
            capture_output=True,
            text=True,
            check=False,
            timeout=600,
        )
    except (OSError, subprocess.TimeoutExpired):
        return False
    exact_verified_line = any(
        line.strip() == "s VERIFIED" for line in result.stdout.splitlines()
    )
    return result.returncode == 0 and exact_verified_line


def _validate_live_sources(repo_root: Path, sources: Any) -> None:
    if type(sources) is not list or not sources:
        _fail("live source manifest is absent")
    seen: set[str] = set()
    for source in sources:
        source = _obj(source, "source record")
        path = _safe_relative(source.get("path"), "source.path")
        if path in seen:
            _fail("duplicate live source path")
        seen.add(path)
        expected_bytes = _int(source.get("bytes"), "source.bytes")
        live = _read(repo_root / path)
        if len(live) != expected_bytes or sha256_bytes(live) != source.get("sha256"):
            _fail(f"live source mismatch: {path}")


def _validate_receipt_flags(receipt: dict[str, Any]) -> None:
    if (receipt.get("prepare_freshness_claimed") is not False
            or receipt.get("proof_endpoint_called") is not False
            or receipt.get("legacy_drat_proof_path_written") is not False
            or receipt.get("certificate_blocker") != CERTIFICATE_BLOCKER
            or "proof_pointer" in receipt):
        _fail("receipt contains an ambiguous freshness/proof claim")
    _false_claims(receipt.get("claims"), "receipt.claims")


def _receipt_server_job_identity(receipt: dict[str, Any]) -> dict[str, Any]:
    """Bind the receipt's PIQD server job ID to its nested identity record."""
    receipt_job_id = _str(receipt.get("job_id"), "receipt.job_id")
    identity = _obj(receipt.get("job_identity"), "receipt.job_identity")
    if identity.get("job_id") != receipt_job_id:
        _fail("receipt server job identity mismatch")
    return identity


def _validate_custody_receipt_binding(
    custody: dict[str, Any], claimed_receipt_sha: str, receipt_path: Path, receipt_raw: bytes
) -> None:
    if custody.get("receipt_sha256") != claimed_receipt_sha:
        _fail("custody seal does not bind receipt")
    receipt_fd, receipt_info = _open_regular(receipt_path)
    try:
        expected = {
            "receipt_file_sha256": sha256_bytes(receipt_raw),
            "receipt_file_size": len(receipt_raw),
            "receipt_device": receipt_info.st_dev,
            "receipt_inode": receipt_info.st_ino,
        }
    finally:
        os.close(receipt_fd)
    if any(custody.get(key) != value for key, value in expected.items()):
        _fail("custody seal does not bind receipt")


def _validate_receipt_outcome(receipt: dict[str, Any], branch: str) -> None:
    expected = ("STRUCTURAL_SAT", "SAT", 10) if branch == "SAT" else ("DISCOVERY_UNSAT", "UNSAT", 20)
    if (receipt.get("outcome"), receipt.get("adapter_verdict"), receipt.get("adapter_returncode")) != expected:
        _fail("receipt verdict/status fields are not bound to outcome branch")


def _validate_journal(attempt: Path, receipt: dict[str, Any], manifest_hashes: set[str]) -> None:
    journal_raw = _read(attempt / "attempt.jsonl")
    records = [_json(line, attempt / "attempt.jsonl") for line in journal_raw.splitlines() if line]
    if not records:
        _fail("PIQD journal is empty")
    previous = None
    for record in records:
        record = _obj(record, "PIQD event")
        if set(record) != _ATTEMPT_KEYS:
            _fail("PIQD attempt field inventory mismatch")
        if record.get("schema") != ATTEMPT_SCHEMA:
            _fail("PIQD attempt schema mismatch")
        claimed = record.get("record_sha256")
        if type(claimed) is not str:
            _fail("PIQD event lacks record hash")
        unsigned = dict(record); unsigned.pop("record_sha256", None)
        if claimed != sha256_json(unsigned):
            _fail("PIQD event hash mismatch")
        if previous is not None and record.get("previous_attempt_sha256") != previous:
            _fail("PIQD event chain mismatch")
        previous = claimed
    seal = _json(_read(attempt / "attempt.jsonl.seal.json"), attempt / "attempt.jsonl.seal.json")
    seal = _obj(seal, "journal seal")
    if set(seal) != {"schema", "wave_manifest_sha256", "record_count", "terminal_attempt_sha256", "journal_sha256", "seal_sha256"}:
        _fail("journal seal field inventory mismatch")
    if seal.get("schema") != JOURNAL_SCHEMA or seal.get("record_count") != len(records) or seal.get("terminal_attempt_sha256") != previous or seal.get("journal_sha256") != sha256_bytes(journal_raw):
        _fail("journal seal does not bind journal")
    unsigned = dict(seal); claimed = unsigned.pop("seal_sha256", None)
    if claimed != sha256_json(unsigned) or receipt.get("seal_sha256") != claimed:
        _fail("journal seal hash binding mismatch")
    artifact_directory = attempt / "attempt.jsonl.artifacts"
    _directory(artifact_directory)
    files: set[str] = set()
    for entry in artifact_directory.iterdir():
        if len(entry.name) != 64 or any(char not in "0123456789abcdef" for char in entry.name):
            _fail("PIQD artifact custody contains an unaddressed entry")
        _read(entry)
        files.add(entry.name)
    if not manifest_hashes.issubset(files):
        _fail("source/producer manifest is absent from PIQD artifact custody")


def validate_v25_workdir(workdir: Path, repo_root: Path, *, piqd_root: Path | None = None, proof_verifier: Callable[[Path, Path], bool] = _verify_drat) -> dict[str, Any]:
    workdir = Path(os.path.abspath(os.fspath(workdir)))
    repo_root = Path(os.path.abspath(os.fspath(repo_root)))
    piqd_root = Path(
        os.path.abspath(
            os.fspath(workdir / "piqd-journal" if piqd_root is None else piqd_root)
        )
    )
    _directory(workdir); _directory(repo_root); _directory(piqd_root)
    summary = _obj(_json(_read(workdir / "summary.json"), workdir / "summary.json"), "summary")
    if set(summary) != _SUMMARY_KEYS:
        _fail("summary field inventory mismatch")
    if summary.get("schema") != RUN_SCHEMA or summary.get("arm_cell_index") != EXPECTED_ARM_CELL:
        _fail("summary schema/arm identity mismatch")
    job = _obj(_json(_read(workdir / "job.json"), workdir / "job.json"), "job")
    if job.get("schema") != JOB_SCHEMA or job.get("arm_cell_index") != EXPECTED_ARM_CELL:
        _fail("v13 job identity mismatch")
    if job.get("job_id") != _producer_pretty_json_sha256({key: value for key, value in job.items() if key != "job_id"}) or summary.get("job_id") != job["job_id"] or summary.get("job_sha256") != _producer_pretty_json_sha256(job):
        _fail("job self/hash identity mismatch")
    promotion = _obj(job.get("promotion"), "job.promotion")
    if promotion.get("lean_terminal_ingress_ready") is not True:
        _fail("job promotion does not affirm the v13 Lean-ingress contract")
    if summary.get("lean_terminal_ingress_ready") is not True:
        _fail("summary does not affirm the v13 Lean-ingress contract")
    if summary.get("lean_ingress_theorem") != LEAN_INGRESS_THEOREM:
        _fail("summary Lean-ingress theorem is not the frozen v13 constant")
    if summary.get("terminal_promotion_status") != TERMINAL_STATUS:
        _fail("summary terminal promotion status is not the frozen v13 constant")
    artifacts = _check_artifacts(workdir, summary)
    if artifacts.get("job") != _pretty_json_bytes(job):
        _fail("job artifact is not byte-bound to job.json")
    descriptor_dir = piqd_root / "descriptors"
    _directory(descriptor_dir)
    descriptors = list(descriptor_dir.iterdir())
    if len(descriptors) != 1 or not descriptors[0].name.startswith("descriptor-"):
        _fail("fresh descriptor inventory is not singleton")
    descriptor_path = descriptors[0]
    descriptor_raw = _read(descriptor_path)
    descriptor = _obj(_json(descriptor_raw[:-1] if descriptor_raw.endswith(b"\n") else descriptor_raw, descriptor_path), "descriptor")
    descriptor_sha = _descriptor_file_sha256(descriptor_raw)
    if descriptor_path.name != f"descriptor-{descriptor_sha}.json" or descriptor.get("schema") != DESCRIPTOR_SCHEMA:
        _fail("descriptor filename/schema hash mismatch")
    if descriptor.get("root_job_id") != job["job_id"] or descriptor.get("job_sha256") != sha256_json(job):
        _fail("descriptor is not bound to job")
    if descriptor.get("sources") != job.get("sources") or descriptor.get("sources_sha256") != sha256_json(job.get("sources")):
        _fail("descriptor/source manifest mismatch")
    _false_claims(descriptor.get("claims"), "descriptor.claims", _DESCRIPTOR_FALSE_CLAIMS)
    source_job = _obj(job.get("source_order_bank"), "job.source_order_bank")
    if source_job.get("sha256") != EXPECTED_SOURCE_ORDER_SHA256 or source_job.get("n_clauses") != EXPECTED_SOURCE_ORDER_CLAUSES:
        _fail("job source-order identity mismatch")
    sources = job.get("sources")
    if type(sources) is not list or not sources:
        _fail("live source manifest is absent")
    _validate_live_sources(repo_root, sources)
    prefix = descriptor.get("cnf", {})
    if prefix.get("variables") != EXPECTED_FINAL_VARS or prefix.get("clauses") != EXPECTED_FINAL_CLAUSES or prefix.get("sha256") != EXPECTED_FINAL_SHA256:
        _fail("descriptor final CNF identity mismatch")
    suffix = descriptor.get("arm_suffix", {})
    if suffix.get("n_clauses") != 867 or suffix.get("post_arm_dimacs_sha256") != EXPECTED_POST_ARM_SHA256:
        _fail("post-arm identity mismatch")
    suffix_artifact = _obj(_json(artifacts["arm_suffix"], workdir / "arm_suffix.json"), "arm suffix artifact")
    if suffix_artifact.get("prefix", {}).get("variables") != EXPECTED_PREFIX_VARS or suffix_artifact.get("prefix", {}).get("clauses") != EXPECTED_PREFIX_CLAUSES or suffix_artifact.get("prefix", {}).get("dimacs_sha256") != EXPECTED_PREFIX_SHA256:
        _fail("prefix CNF identity mismatch")
    if suffix_artifact.get("post_arm", {}).get("clauses") != EXPECTED_POST_ARM_CLAUSES or suffix_artifact.get("post_arm", {}).get("dimacs_sha256") != EXPECTED_POST_ARM_SHA256:
        _fail("post-arm artifact identity mismatch")
    for artifact_name in _BANK_KEYS:
        bank = _obj(_json(artifacts[artifact_name], workdir / f"{artifact_name}.json"), f"{artifact_name} artifact")
        if type(bank.get("bank_sha256")) is not str:
            _fail(f"{artifact_name} lacks authenticated bank identity")
        if artifact_name == "positive_membership_bank":
            job_name = artifact_name
        else:
            job_name = artifact_name.replace("_family_bank", "_membership_family_bank")
        if _obj(job.get(job_name), f"job.{job_name}").get("sha256") != bank["bank_sha256"]:
            _fail(f"{artifact_name} is not bound to the live job manifest")
    source_order_artifact = _obj(_json(artifacts["source_order_bank"], workdir / "source_order_bank.json"), "source-order bank artifact")
    if source_order_artifact.get("bank_sha256") != EXPECTED_SOURCE_ORDER_SHA256:
        _fail("source-order bank artifact hash mismatch")
    installation = _obj(_json(artifacts["source_order_installation"], workdir / "source_order_installation.json"), "source-order installation")
    if installation.get("bank_sha256") != EXPECTED_SOURCE_ORDER_SHA256 or installation.get("final_n_variables") != EXPECTED_FINAL_VARS or installation.get("final_n_clauses") != EXPECTED_FINAL_CLAUSES or installation.get("final_cnf_sha256") != EXPECTED_FINAL_SHA256:
        _fail("source-order installation is not bound to final CNF")
    order = descriptor.get("source_order_bank", {})
    if order.get("sha256") != EXPECTED_SOURCE_ORDER_SHA256 or order.get("n_clauses") != EXPECTED_SOURCE_ORDER_CLAUSES:
        _fail("source-order bank identity mismatch")
    attempt_root = piqd_root / "attempts"
    _directory(attempt_root)
    attempts = [p for p in attempt_root.iterdir() if p.is_dir()]
    if len(attempts) != 1 or not attempts[0].name.endswith(EXPECTED_FINAL_SHA256[:16]):
        _fail("fresh PIQD attempt identity/inventory mismatch")
    attempt = attempts[0]
    _directory(attempt)
    expected_attempt_entries = {"attempt.jsonl", "attempt.jsonl.lock", "attempt.jsonl.artifacts",
                                "attempt.jsonl.seal.json", "solver-receipt.json", "custody-seal.json"}
    if {entry.name for entry in attempt.iterdir()} != expected_attempt_entries:
        _fail("fresh PIQD attempt has unexpected custody entries")
    receipt_raw = _read(attempt / "solver-receipt.json")
    receipt = _obj(_canonical_file(receipt_raw, attempt / "solver-receipt.json"), "receipt")
    if set(receipt) != _RECEIPT_KEYS:
        _fail("receipt field inventory mismatch")
    if receipt.get("schema") != RECEIPT_SCHEMA:
        _fail("receipt schema/job mismatch")
    if receipt.get("cnf_sha256") != EXPECTED_FINAL_SHA256 or receipt.get("num_variables") != EXPECTED_FINAL_VARS or receipt.get("num_clauses") != EXPECTED_FINAL_CLAUSES:
        _fail("receipt CNF identity mismatch")
    if receipt.get("source_manifest_sha256") is None or receipt.get("producer_manifest_sha256") is None:
        _fail("receipt lacks manifest bindings")
    _validate_receipt_flags(receipt)
    source_manifest = {
        "schema": SOURCE_SCHEMA,
        "source_id": f"{DESCRIPTOR_SCHEMA}:{descriptor_sha}",
        "source_path": f"descriptors/descriptor-{descriptor_sha}.json",
        "source_sha256": descriptor_sha,
        "finite_schema": JOB_SCHEMA,
        "cardinality_scope": "exactly 12 points; placement 1; named arm cell 6 only",
        "source_theorem": "NONE: finite PIQD discovery evidence only",
        "claims": {key: False for key in ("source_entitlement", "theorem_coverage", "universal_lift", "lean_closure")},
    }
    producer_manifest = {
        "schema": PRODUCER_SCHEMA,
        "producer_id": f"{PROJECT}:{descriptor_sha}",
        "producer_kind": "static-dimacs",
        "source_manifest": source_manifest,
        "source_manifest_sha256": sha256_bytes(canonical_json_bytes(source_manifest)),
        "variable_map_sha256": descriptor.get("compiler", {}).get("manifest_sha256"),
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "claims": {key: False for key in ("source_entitlement", "theorem_coverage", "universal_lift", "lean_closure", "one_process", "one_core")},
    }
    if receipt.get("source_manifest_sha256") != sha256_bytes(canonical_json_bytes(source_manifest)) or receipt.get("producer_manifest_sha256") != sha256_bytes(canonical_json_bytes(producer_manifest)):
        _fail("receipt source/producer manifest hash mismatch")
    identity = _receipt_server_job_identity(receipt)
    if (identity.get("backend") != "cadical"
            or identity.get("solver_profile") != "sat" or identity.get("project") != PROJECT
            or identity.get("cnf_blob_hash") != EXPECTED_FINAL_SHA256
            or identity.get("num_vars") != EXPECTED_FINAL_VARS
            or identity.get("num_clauses") != EXPECTED_FINAL_CLAUSES
            or identity.get("requested_core_limit") != 1):
        _fail("receipt job identity is not bound to the v25 contract")
    _validate_journal(attempt, receipt, {receipt["source_manifest_sha256"], receipt["producer_manifest_sha256"]})
    receipt_unsigned = dict(receipt); claimed = receipt_unsigned.pop("receipt_sha256", None)
    if claimed != sha256_json(receipt_unsigned): _fail("receipt self-hash mismatch")
    custody_raw = _read(attempt / "custody-seal.json")
    custody = _obj(_canonical_file(custody_raw, attempt / "custody-seal.json"), "custody seal")
    if set(custody) != _CUSTODY_KEYS:
        _fail("custody seal field inventory mismatch")
    if custody.get("schema") != CUSTODY_SCHEMA:
        _fail("custody seal does not bind receipt")
    _validate_custody_receipt_binding(
        custody, claimed, attempt / "solver-receipt.json", receipt_raw
    )
    custody_unsigned = dict(custody); custody_claimed = custody_unsigned.pop("custody_seal_sha256", None)
    if custody_claimed != sha256_json(custody_unsigned): _fail("custody seal self-hash mismatch")
    if custody.get("retry_policy") != "REMOVE_UNSEALED_RESERVED_ATTEMPT" or type(custody.get("inventory")) is not dict:
        _fail("custody inventory/retry policy is absent or ambiguous")
    cnf_raw = artifacts.get("discovery_cnf")
    if cnf_raw is None or sha256_bytes(cnf_raw) != EXPECTED_FINAL_SHA256: _fail("discovery CNF identity mismatch")
    variables, clauses, parsed = _dimacs(cnf_raw, "discovery.cnf")
    if (variables, clauses) != (EXPECTED_FINAL_VARS, EXPECTED_FINAL_CLAUSES): _fail("discovery CNF dimensions mismatch")
    status = summary.get("status")
    if status == "SAT_WITNESS_REPLAYED":
        _validate_receipt_outcome(receipt, "SAT")
        survivor = artifacts.get("survivor")
        if survivor is None: _fail("SAT branch lacks survivor")
        survivor_obj = _obj(_json(survivor, workdir / "survivor.json"), "survivor")
        if (survivor_obj.get("job_id") != job["job_id"]
                or survivor_obj.get("arm_cell_index") != EXPECTED_ARM_CELL
                or survivor_obj.get("classification") not in _SURVIVOR_CLASSIFICATIONS
                or summary.get("classification") != survivor_obj.get("classification")):
            _fail("SAT survivor identity/classification mismatch")
        replay = _obj(survivor_obj.get("replay"), "survivor.replay")
        if set(replay) != {"candidate", "added_constraints", "named_deletion_arm", "exact_cnf", "canonical_static_extension"} or any(type(value) is not bool or value is not True for value in replay.values()):
            _fail("SAT survivor replay contract is not affirmative and exact")
        if (type(survivor_obj.get("cube")) is not dict
                or (survivor_obj.get("structural_certificate") is not None
                    and type(survivor_obj.get("structural_certificate")) is not dict)):
            _fail("SAT survivor provenance payload is absent")
        positive = survivor_obj.get("positive_variables")
        if type(positive) is not list or any(type(item) is not int or item <= 0 or item > variables for item in positive) or len(set(positive)) != len(positive):
            _fail("SAT survivor positive-variable list is malformed")
        assignment = [item if item in positive else -item for item in range(1, variables + 1)]
        _assignment(assignment, variables); _replay(parsed, set(positive))
        if (survivor_obj.get("assignment_sha256")
                != _producer_pretty_json_sha256(sorted(positive))
                or summary.get("discovery_verdict") != "SAT"
                or summary.get("terminal_verdict") is not None):
            _fail("SAT status/assignment binding mismatch")
    elif status == TERMINAL_STATUS:
        _validate_receipt_outcome(receipt, "UNSAT")
        terminal = artifacts.get("terminal_cnf"); proof = artifacts.get("proof")
        if terminal != cnf_raw or proof is None: _fail("UNSAT branch lacks byte-identical CNF/proof")
        proof_path = workdir / "terminal.drat"
        if not proof_verifier(workdir / "terminal.cnf", proof_path): _fail("independent DRAT verification failed")
        if summary.get("discovery_verdict") != "UNSAT" or summary.get("terminal_verdict") != "UNSAT" or summary.get("terminal_proof_verified") is not True or summary.get("terminal_proof_authenticated") is not True:
            _fail("UNSAT verdict/proof status is not bound")
    else:
        _fail("unsupported or ambiguous outcome status")
    return {"valid": True, "schema": RUN_SCHEMA, "status": status,
            "finite_diagnostic_only": True, "cnf": {"variables": variables, "clauses": clauses}}


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("workdir", type=Path)
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--piqd-journal-root", type=Path)
    args = parser.parse_args(argv)
    try:
        result = validate_v25_workdir(args.workdir, args.repo_root, piqd_root=args.piqd_journal_root)
    except (OSError, V25ValidationError, subprocess.SubprocessError) as exc:
        parser.error(str(exc))
    print(json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
