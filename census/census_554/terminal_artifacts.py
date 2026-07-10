"""Proof-gated terminal artifact publication for the Census554 cover."""

from __future__ import annotations

import gzip
import hashlib
import json
import os
import shutil
import subprocess
import uuid
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Callable, Iterable, Mapping

from .io_protocol import (
    atomic_write_bytes,
    atomic_write_json,
    atomic_write_text,
    resolve_under,
    row_sha256,
    snapshot_bank,
)


class TerminalArtifactError(RuntimeError):
    """Raised when an UNSAT generation cannot pass every publication gate."""


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _fsync_file(path: Path) -> None:
    with open(path, "rb") as handle:
        os.fsync(handle.fileno())


def _fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _write_manifest(path: Path, rows: Iterable[Mapping[str, Any]]) -> None:
    """Stream deterministic gzip JSONL in CNF-clause insertion order."""

    with open(path, "xb") as raw:
        with gzip.GzipFile(filename="", mode="wb", fileobj=raw, mtime=0) as zipped:
            for row in rows:
                encoded = json.dumps(
                    row, sort_keys=True, separators=(",", ":")
                ).encode("utf-8")
                zipped.write(encoded + b"\n")
        raw.flush()
        os.fsync(raw.fileno())


def _dimacs_clauses(path: Path):
    pending = []
    with open(path, encoding="ascii") as handle:
        for line in handle:
            stripped = line.strip()
            if not stripped or stripped.startswith(("c", "p")):
                continue
            for token in stripped.split():
                literal = int(token)
                if literal == 0:
                    yield tuple(pending)
                    pending = []
                else:
                    pending.append(literal)
    if pending:
        raise TerminalArtifactError(f"unterminated DIMACS clause in {path}")


def _validate_instance(row: Mapping[str, Any]) -> None:
    required = {
        "source_pid",
        "source_row_sha256",
        "canonical_motif",
        "support_injection",
        "pattern",
        "clause",
    }
    missing = required - set(row)
    if missing:
        raise TerminalArtifactError(f"manifest row missing fields: {sorted(missing)}")
    injection = row["support_injection"]
    if not isinstance(injection, list) or any(
        not isinstance(pair, list) or len(pair) != 2 for pair in injection
    ):
        raise TerminalArtifactError("support_injection must be a list of pairs")
    sources = [pair[0] for pair in injection]
    targets = [pair[1] for pair in injection]
    if len(set(sources)) != len(sources) or len(set(targets)) != len(targets):
        raise TerminalArtifactError("support_injection is not injective")
    clause = row["clause"]
    if not clause or any(not isinstance(lit, int) or lit == 0 for lit in clause):
        raise TerminalArtifactError("manifest clause is empty or malformed")


def publish_unsat_artifacts(
    root: str | os.PathLike[str],
    *,
    dimacs: str,
    instances: Iterable[Mapping[str, Any]],
    run_metadata: Mapping[str, Any],
    certificate_validator: Callable[[dict[str, Any], dict[str, Any]], Any] | None = None,
    hash_certificates: bool = False,
    solver: str = "cadical",
    checker: str = "drat-trim",
    timeout: int = 14_400,
    command_runner: Callable[..., subprocess.CompletedProcess[str]] = subprocess.run,
) -> dict[str, Any]:
    """Publish a terminal generation only after independent DRAT checking.

    The returned marker is also atomically written to COVERAGE_COMPLETE.json.
    Solver stdout alone can never create that marker.
    """

    if not dimacs.startswith("p cnf "):
        raise TerminalArtifactError("final CNF is not DIMACS")
    rows = [row if isinstance(row, dict) else dict(row) for row in instances]
    for row in rows:
        _validate_instance(row)

    root_path = Path(root)
    terminal_root = root_path / "coverage_terminal"
    generations = terminal_root / "generations"
    generations.mkdir(parents=True, exist_ok=True)
    generation = (
        datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
        + "-"
        + uuid.uuid4().hex[:12]
    )
    staging = terminal_root / f".staging-{generation}"
    final_dir = generations / generation
    staging.mkdir()
    try:
        cnf_path = staging / "coverage_final.cnf"
        drat_path = staging / "coverage_final.drat"
        core_path = staging / "coverage_core.cnf"
        lrat_path = staging / "coverage_core.lrat"
        atomic_write_text(cnf_path, dimacs)

        solved = command_runner(
            [solver, "-q", str(cnf_path), str(drat_path)],
            capture_output=True,
            text=True,
            timeout=timeout,
        )
        if solved.returncode != 20 or "s UNSATISFIABLE" not in solved.stdout:
            raise TerminalArtifactError(
                f"persisted CNF did not re-solve UNSAT (exit {solved.returncode})"
            )
        if not drat_path.is_file() or drat_path.stat().st_size == 0:
            raise TerminalArtifactError("solver produced no DRAT proof")
        _fsync_file(drat_path)

        checked = command_runner(
            [
                checker,
                str(cnf_path),
                str(drat_path),
                "-c",
                str(core_path),
                "-L",
                str(lrat_path),
            ],
            capture_output=True,
            text=True,
            timeout=timeout,
        )
        checker_output = checked.stdout + "\n" + checked.stderr
        if checked.returncode != 0 or "s VERIFIED" not in checker_output:
            raise TerminalArtifactError(
                f"DRAT checker did not verify the proof (exit {checked.returncode})"
            )
        if not core_path.is_file() or not lrat_path.is_file():
            raise TerminalArtifactError("DRAT checker emitted no core/LRAT artifacts")
        _fsync_file(core_path)
        _fsync_file(lrat_path)

        core_clauses = Counter(
            tuple(sorted(clause)) for clause in _dimacs_clauses(core_path)
        )
        core_rows = []
        for row in rows:
            key = tuple(sorted(row["clause"]))
            in_core = core_clauses[key] > 0
            if in_core:
                core_clauses[key] -= 1
                core_rows.append(row)
            row["in_unsat_core"] = in_core

        bank_rows, bank_raw = snapshot_bank(root_path)
        by_digest = {row_sha256(row): row for row in bank_rows}
        source_digests = {str(row["source_row_sha256"]) for row in core_rows}
        referenced: dict[str, dict[str, Any]] = {}
        for digest in source_digests:
            bank_row = by_digest.get(digest)
            if bank_row is None:
                raise TerminalArtifactError(f"manifest source row is absent: {digest}")
            matching = [row for row in rows if row["source_row_sha256"] == digest]
            if any(row["source_pid"] != bank_row.get("pid") for row in matching):
                raise TerminalArtifactError(f"manifest PID mismatch for row {digest}")
            try:
                cert_path = resolve_under(root_path, bank_row["cert"])
            except (KeyError, TypeError, ValueError) as exc:
                raise TerminalArtifactError("invalid source cert path") from exc
            if not cert_path.is_file():
                raise TerminalArtifactError(f"missing source cert: {cert_path}")
            exact_validated = False
            if certificate_validator is not None:
                try:
                    cert = json.loads(cert_path.read_text(encoding="utf-8"))
                except json.JSONDecodeError as exc:
                    raise TerminalArtifactError(
                        f"invalid source cert: {cert_path}"
                    ) from exc
                certificate_validator(bank_row, cert)
                exact_validated = True
            referenced[digest] = {
                "pid": bank_row["pid"],
                "bank_row_sha256": digest,
                "path": bank_row["cert"],
                "bytes": cert_path.stat().st_size,
                "sha256": _sha256(cert_path) if hash_certificates else None,
                "exact_validated": exact_validated,
            }

        bank_path = staging / "coverage_bank_snapshot.jsonl"
        manifest_path = staging / "coverage_instances.jsonl.gz"
        cert_index_path = staging / "coverage_certificates.json"
        atomic_write_bytes(bank_path, bank_raw)
        _write_manifest(manifest_path, rows)
        atomic_write_json(cert_index_path, sorted(referenced.values(), key=lambda x: (x["pid"], x["bank_row_sha256"])))

        metadata = {
            "schema": "census554_coverage_generation.v1",
            "verdict": "UNSAT",
            "trust": (
                "DRAT proof checked; exact source-certificate replay and "
                "geometric motif transfer remain separate obligations"
            ),
            "generation": generation,
            "run": dict(run_metadata),
            "proof_check": {
                "solver": solver,
                "solver_exit": solved.returncode,
                "checker": checker,
                "checker_exit": checked.returncode,
                "checker_verified": True,
            },
            "artifacts": {
                "cnf": {"path": cnf_path.name, "sha256": _sha256(cnf_path)},
                "drat": {"path": drat_path.name, "sha256": _sha256(drat_path)},
                "core": {
                    "path": core_path.name,
                    "sha256": _sha256(core_path),
                    "exclusion_rows": len(core_rows),
                },
                "lrat": {"path": lrat_path.name, "sha256": _sha256(lrat_path)},
                "instances": {
                    "path": manifest_path.name,
                    "sha256": _sha256(manifest_path),
                    "rows": len(rows),
                    "core_rows": len(core_rows),
                },
                "bank": {
                    "path": bank_path.name,
                    "sha256": _sha256(bank_path),
                    "rows": len(bank_rows),
                },
                "certificates": {
                    "path": cert_index_path.name,
                    "sha256": _sha256(cert_index_path),
                    "rows": len(referenced),
                    "hashes_computed": hash_certificates,
                    "exact_validation_run": certificate_validator is not None,
                },
            },
        }
        metadata_path = staging / "metadata.json"
        atomic_write_json(metadata_path, metadata)

        os.replace(staging, final_dir)
        _fsync_directory(generations)
        marker = {
            "schema": "census554_coverage_pointer.v1",
            "generation": generation,
            "metadata": str(final_dir.relative_to(root_path) / "metadata.json"),
            "metadata_sha256": _sha256(final_dir / "metadata.json"),
        }
        atomic_write_json(root_path / "COVERAGE_COMPLETE.json", marker)
        return marker
    except BaseException:
        if staging.exists():
            shutil.rmtree(staging)
        raise
