"""Independent Lean replay for compact LRAT artifacts returned by piqd.

piqd compacts CaDiCaL proofs against a de-tautologized, duplicate-free CNF.
This module reproduces only that semantics-preserving CNF normalization, emits
its own ``verifyCert_correct`` checker source, and asks the project's pinned
Lean toolchain to check the downloaded LRAT.  It does not trust piqd's
``/lean`` emitter or a daemon-side replay verdict.
"""

from __future__ import annotations

import base64
import json
import os
import shutil
import subprocess
import uuid
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_oracle import (
    PiqdOracleError,
    PreparedJob,
    parse_dimacs,
)

REPLAY_SCHEMA = "p97-piqd-lean-lrat-replay/v1"
NORMALIZATION_SCHEMA = "piqd-lrat-detautologize/v1"
_PINNED_REPLAY_COMMAND = ("lake", "env", "lean")


class LratReplayError(RuntimeError):
    """The independent replay could not be prepared or executed."""


@dataclass(frozen=True)
class LratReplayResult:
    """Self-contained replay evidence, successful or failed."""

    verified: bool
    checker_source: bytes
    receipt: bytes


def _reject_json_constant(value: str) -> None:
    raise ValueError(f"nonstandard JSON constant: {value}")


def validate_replay_result(
    *,
    result: LratReplayResult,
    job: PreparedJob,
    wave_manifest: Mapping[str, Any],
    cnf: bytes,
    proof: bytes,
    proof_sha256: str,
) -> None:
    """Validate every binding used to promote replay to certified UNSAT."""

    if not isinstance(result.verified, bool):
        raise LratReplayError("replay result verified must be a boolean")
    if not isinstance(result.checker_source, bytes) or not result.checker_source:
        raise LratReplayError("replay checker source must be nonempty bytes")
    if not isinstance(result.receipt, bytes):
        raise LratReplayError("replay receipt must be bytes")
    try:
        receipt = json.loads(
            result.receipt.decode("utf-8"), parse_constant=_reject_json_constant
        )
        if not isinstance(receipt, Mapping):
            raise TypeError("receipt root is not an object")
        if canonical_json_bytes(receipt) != result.receipt:
            raise ValueError("receipt is not canonical JSON")
        normalization = receipt["normalization"]
        receipt_job = receipt["job"]
        execution = receipt["execution"]
        if not all(
            isinstance(value, Mapping)
            for value in (normalization, receipt_job, execution)
        ):
            raise TypeError("receipt binding sections must be objects")
    except (KeyError, TypeError, UnicodeDecodeError, ValueError) as exc:
        raise LratReplayError(f"invalid replay receipt: {exc}") from exc

    submitted_cnf_hash = sha256_bytes(cnf)
    if sha256_bytes(proof) != proof_sha256:
        raise LratReplayError("replay proof hash does not match proof bytes")
    kept_cnf = canonical_kept_dimacs(cnf)
    expected_checker_source = lean_checker_source(kept_cnf=kept_cnf, proof=proof)
    if result.checker_source != expected_checker_source:
        raise LratReplayError("replay checker source does not match CNF and proof")
    expected = {
        "schema": (receipt.get("schema"), REPLAY_SCHEMA),
        "verified": (receipt.get("verified"), result.verified),
        "normalization.schema": (
            normalization.get("schema"),
            NORMALIZATION_SCHEMA,
        ),
        "normalization.submitted_cnf_sha256": (
            normalization.get("submitted_cnf_sha256"),
            submitted_cnf_hash,
        ),
        "normalization.canonical_kept_cnf_sha256": (
            normalization.get("canonical_kept_cnf_sha256"),
            sha256_bytes(kept_cnf),
        ),
        "normalization.submitted_bytes_equal_kept_bytes": (
            normalization.get("submitted_bytes_equal_kept_bytes"),
            cnf == kept_cnf,
        ),
        "job.id": (receipt_job.get("id"), job.job_id),
        "job.backend": (receipt_job.get("backend"), job.backend),
        "job.solver_profile": (
            receipt_job.get("solver_profile"),
            job.solver_profile,
        ),
        "job.identity_hash": (receipt_job.get("identity_hash"), job.identity_hash),
        "job.cnf_blob_hash": (receipt_job.get("cnf_blob_hash"), job.cnf_blob_hash),
        "wave_manifest_sha256": (
            receipt.get("wave_manifest_sha256"),
            wave_manifest_sha256(wave_manifest),
        ),
        "proof_sha256": (receipt.get("proof_sha256"), proof_sha256),
        "checker_source_sha256": (
            receipt.get("checker_source_sha256"),
            sha256_bytes(result.checker_source),
        ),
    }
    for field, (actual, wanted) in expected.items():
        if actual != wanted:
            raise LratReplayError(f"replay receipt {field} mismatch")
    if not isinstance(receipt.get("verified"), bool):
        raise LratReplayError("replay receipt verified must be a boolean")
    returncode = execution.get("returncode")
    error = execution.get("error")
    if result.verified and (returncode != 0 or error is not None):
        raise LratReplayError("verified replay receipt lacks a clean execution")
    if not result.verified and returncode == 0 and error is None:
        raise LratReplayError("rejected replay receipt records a clean execution")


def canonical_kept_dimacs(cnf: bytes) -> bytes:
    """Match piqd-lrat's order-preserving de-tautologization exactly.

    Tautological input clauses are dropped.  Repeated literals in every kept
    clause are removed while preserving their first-occurrence order.  The
    output has piqd-lrat's canonical DIMACS whitespace and trailing newline.
    """

    try:
        num_vars, clauses = parse_dimacs(cnf)
    except PiqdOracleError as exc:
        raise LratReplayError(str(exc)) from exc

    kept: list[tuple[int, ...]] = []
    for clause in clauses:
        seen: set[int] = set()
        deduplicated: list[int] = []
        tautological = False
        for literal in clause:
            if -literal in seen:
                tautological = True
                break
            if literal not in seen:
                seen.add(literal)
                deduplicated.append(literal)
        if not tautological:
            kept.append(tuple(deduplicated))

    lines = [f"p cnf {num_vars} {len(kept)}"]
    lines.extend(
        (" ".join(str(literal) for literal in clause) + " 0").lstrip()
        for clause in kept
    )
    return ("\n".join(lines) + "\n").encode("ascii")


def _lean_string(payload: bytes, *, source: str) -> str:
    try:
        text = payload.decode("ascii")
    except UnicodeDecodeError as exc:
        raise LratReplayError(f"{source} must be ASCII") from exc
    for character in text:
        if ord(character) < 32 and character not in "\n\r\t":
            raise LratReplayError(f"{source} contains an unsupported control byte")
    return (
        text.replace("\\", "\\\\")
        .replace('"', '\\"')
        .replace("\r", "\\r")
        .replace("\n", "\\n")
        .replace("\t", "\\t")
    )


def lean_checker_source(*, kept_cnf: bytes, proof: bytes) -> bytes:
    """Emit a standalone Lean checker for one canonical CNF/LRAT pair."""

    cnf_text = _lean_string(kept_cnf, source="canonical kept CNF")
    proof_text = _lean_string(proof, source="LRAT proof")
    source = f'''import Std.Tactic.BVDecide

set_option linter.unusedVariables false

open Std.Sat
open Std.Tactic.BVDecide.Reflect

def parseDimacsClause (line : String) : List (Nat × Bool) :=
  (line.splitOn " ").filterMap fun tok =>
    match tok.trimAscii.toInt? with
    | some 0 => none
    | some n => some (n.natAbs - 1, decide (n > 0))
    | none => none

def parseDimacs (s : String) : CNF Nat :=
  let body := (s.splitOn "\\n").filter fun line =>
    let trimmed := line.trimAscii
    !trimmed.isEmpty && !trimmed.startsWith "c" && !trimmed.startsWith "p"
  body.map parseDimacsClause

def cnfText : String :=
  "{cnf_text}"

def lratText : String :=
  "{proof_text}"

def replayCnf : CNF Nat := parseDimacs cnfText

theorem p97_piqd_replay_unsat : replayCnf.Unsat :=
  verifyCert_correct replayCnf lratText (by native_decide)
'''
    return source.encode("utf-8")


def _atomic_write(path: Path, payload: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists():
        if path.read_bytes() != payload:
            raise LratReplayError(f"replay work-file collision at {path}")
        return
    temporary = path.with_name(f".{path.name}.{uuid.uuid4().hex}.tmp")
    descriptor = os.open(temporary, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    try:
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            if written <= 0:
                raise OSError("write made no progress")
            offset += written
        os.fsync(descriptor)
    finally:
        os.close(descriptor)
    os.replace(temporary, path)


def _executable(path_or_name: str) -> Path:
    resolved = shutil.which(path_or_name)
    if resolved is None:
        raise LratReplayError(f"required executable is unavailable: {path_or_name}")
    path = Path(resolved).resolve()
    if not path.is_file():
        raise LratReplayError(f"resolved executable is not a file: {path}")
    return path


class LeanLratReplayer:
    """Replay compact LRAT with the repository's pinned Lean toolchain."""

    def __init__(
        self,
        *,
        lean_root: Path,
        work_dir: Path,
        timeout_s: int = 300,
    ) -> None:
        if isinstance(timeout_s, bool) or not isinstance(timeout_s, int) or timeout_s <= 0:
            raise LratReplayError("replay timeout must be a positive integer")
        self.lean_root = lean_root.resolve()
        self.work_dir = work_dir.resolve()
        self.timeout_s = timeout_s

    def _checker_identity(self) -> tuple[dict[str, Any], Path]:
        launcher = _executable(_PINNED_REPLAY_COMMAND[0])
        version = subprocess.run(
            [str(launcher), *_PINNED_REPLAY_COMMAND[1:], "--version"],
            cwd=self.lean_root,
            capture_output=True,
            check=False,
            timeout=30,
        )
        if version.returncode != 0:
            raise LratReplayError("Lean version probe failed")

        effective_lean = _executable("lean")
        which = subprocess.run(
            [str(launcher), "env", "which", "lean"],
            cwd=self.lean_root,
            capture_output=True,
            check=False,
            timeout=30,
            text=True,
        )
        candidate = which.stdout.strip()
        if which.returncode == 0 and candidate:
            candidate_path = Path(candidate).resolve()
            if not candidate_path.is_file():
                raise LratReplayError(
                    f"lake resolved Lean to a non-file path: {candidate_path}"
                )
            effective_lean = candidate_path
        identity = {
            "kind": "Lean verifyCert_correct plus native_decide",
            "launcher_path": str(launcher),
            "launcher_sha256": sha256_bytes(launcher.read_bytes()),
            "lean_path": str(effective_lean),
            "lean_sha256": sha256_bytes(effective_lean.read_bytes()),
            "version_returncode": version.returncode,
            "version_stdout_base64": base64.b64encode(version.stdout).decode("ascii"),
            "version_stderr_base64": base64.b64encode(version.stderr).decode("ascii"),
        }
        return identity, launcher

    def replay(
        self,
        *,
        job: PreparedJob,
        wave_manifest: Mapping[str, Any],
        cnf: bytes,
        proof: bytes,
        proof_sha256: str,
    ) -> LratReplayResult:
        actual_proof_hash = sha256_bytes(proof)
        if actual_proof_hash != proof_sha256:
            raise LratReplayError("LRAT proof hash does not match downloaded bytes")
        if not proof:
            raise LratReplayError("LRAT proof is empty")

        submitted_cnf_hash = sha256_bytes(cnf)
        if submitted_cnf_hash != job.cnf_blob_hash:
            raise LratReplayError("submitted CNF hash does not match piqd job")
        manifest_hash = wave_manifest_sha256(wave_manifest)
        encoding = wave_manifest["encoding"]
        execution = wave_manifest["execution"]
        if encoding["cnf_sha256"] != submitted_cnf_hash:
            raise LratReplayError("submitted CNF hash does not match wave manifest")
        if execution["backend"] != job.backend:
            raise LratReplayError("piqd job backend does not match wave manifest")
        if execution["solver_profile"] != job.solver_profile:
            raise LratReplayError("piqd solver profile does not match wave manifest")

        kept_cnf = canonical_kept_dimacs(cnf)
        checker_source = lean_checker_source(kept_cnf=kept_cnf, proof=proof)
        checker_source_hash = sha256_bytes(checker_source)
        source_path = self.work_dir / f"{checker_source_hash}.lean"
        _atomic_write(source_path, checker_source)
        checker_identity, launcher = self._checker_identity()
        argv = [str(launcher), *_PINNED_REPLAY_COMMAND[1:], str(source_path)]

        execution_error: str | None = None
        try:
            completed = subprocess.run(
                argv,
                cwd=self.lean_root,
                capture_output=True,
                check=False,
                timeout=self.timeout_s,
            )
            returncode: int | None = completed.returncode
            stdout = completed.stdout
            stderr = completed.stderr
        except (OSError, subprocess.TimeoutExpired) as exc:
            returncode = None
            if isinstance(exc, subprocess.TimeoutExpired):
                stdout = exc.stdout or b""
                stderr = exc.stderr or b""
            else:
                stdout = b""
                stderr = b""
            execution_error = f"{type(exc).__name__}: {exc}"

        verified = returncode == 0 and execution_error is None
        receipt = canonical_json_bytes(
            {
                "schema": REPLAY_SCHEMA,
                "normalization": {
                    "schema": NORMALIZATION_SCHEMA,
                    "submitted_cnf_sha256": submitted_cnf_hash,
                    "canonical_kept_cnf_sha256": sha256_bytes(kept_cnf),
                    "submitted_bytes_equal_kept_bytes": cnf == kept_cnf,
                },
                "job": {
                    "id": job.job_id,
                    "backend": job.backend,
                    "solver_profile": job.solver_profile,
                    "identity_hash": job.identity_hash,
                    "cnf_blob_hash": job.cnf_blob_hash,
                },
                "wave_manifest_sha256": manifest_hash,
                "proof_sha256": proof_sha256,
                "checker_source_sha256": checker_source_hash,
                "checker": checker_identity,
                "execution": {
                    "argv": argv,
                    "cwd": str(self.lean_root),
                    "timeout_s": self.timeout_s,
                    "returncode": returncode,
                    "stdout_base64": base64.b64encode(stdout).decode("ascii"),
                    "stderr_base64": base64.b64encode(stderr).decode("ascii"),
                    "error": execution_error,
                },
                "verified": verified,
            }
        )
        return LratReplayResult(
            verified=verified,
            checker_source=checker_source,
            receipt=receipt,
        )
