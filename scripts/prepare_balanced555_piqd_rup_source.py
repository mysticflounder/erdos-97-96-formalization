#!/usr/bin/env python3
"""Prepare a strict pure-RUP source from a completed PiQD export.

This adapter is deliberately a custody boundary.  It does not contact PiQD,
run a solver, or infer UNSAT from a status string: the downloaded CNF and
compacted LRAT are checked byte-for-byte against the supplied contract, then
the LRAT is parsed and rendered canonically for
``materialize_checkpointed_rup.py``.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import sys
import tempfile
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

try:
    import materialize_checkpointed_rup as rup
except ModuleNotFoundError:  # imported as ``scripts.<adapter>`` by pytest
    from scripts import materialize_checkpointed_rup as rup

SOURCE_SCHEMA = rup.PURE_RUP_SOURCE_SCHEMA
RECEIPT_SCHEMA = "p97_balanced555_piqd_rup_source.v1"
EXPECTED_VARIABLE_COUNT = 148
EXPECTED_CLAUSE_COUNT = 50113
FIRST_ADDITION_ID = EXPECTED_CLAUSE_COUNT + 1


class Balanced555PiqdRupError(ValueError):
    """The export failed a fail-closed custody or proof-shape check."""


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise Balanced555PiqdRupError(f"duplicate JSON key: {key!r}")
        result[key] = value
    return result


def _reject_constant(value: str) -> Any:
    raise Balanced555PiqdRupError(f"non-finite JSON constant: {value}")


def _load_json(path: Path, label: str) -> dict[str, Any]:
    try:
        value = json.loads(
            path.read_text(encoding="utf-8"),
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_constant,
        )
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise Balanced555PiqdRupError(f"malformed {label} JSON: {path}") from exc
    if not isinstance(value, dict):
        raise Balanced555PiqdRupError(f"{label} JSON is not an object")
    return value


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _hash(value: Any, label: str) -> str:
    if (
        not isinstance(value, str)
        or len(value) != 64
        or any(char not in "0123456789abcdef" for char in value)
    ):
        raise Balanced555PiqdRupError(f"{label} SHA-256 is malformed")
    return value


def _positive_count(value: Any, label: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value < 1:
        raise Balanced555PiqdRupError(f"{label} byte count is malformed")
    return value


def _declared_count(
    objects: Sequence[Mapping[str, Any]], keys: Sequence[str], label: str
) -> int | None:
    value = _find_field(objects, keys)
    if value is None:
        return None
    return _positive_count(value, label)


def _artifact_declared_count(
    objects: Sequence[Mapping[str, Any]],
    artifact_keys: Sequence[str],
    direct_keys: Sequence[str],
    record_keys: Sequence[str],
    label: str,
) -> int | None:
    record = _nested_artifact(objects, artifact_keys)
    if record is not None:
        value = _find_field((record,), record_keys)
        if value is not None:
            return _positive_count(value, label)
    return _declared_count(objects, direct_keys, label)


def _record(path: Path, *, name: str) -> dict[str, Any]:
    return {"path": name, "sha256": _sha256(path), "byte_count": path.stat().st_size}


def _regular_file(path: Path, label: str) -> Path:
    path = path.resolve()
    if path.is_symlink() or not path.is_file():
        raise Balanced555PiqdRupError(f"{label} is not a regular file: {path}")
    return path


def _safe_relative_path(value: Any, *, root: Path, label: str) -> Path:
    if not isinstance(value, str) or not value or "\\" in value:
        raise Balanced555PiqdRupError(f"{label} path is not relative POSIX")
    relative = Path(value)
    if relative.is_absolute() or relative == Path(".") or ".." in relative.parts:
        raise Balanced555PiqdRupError(f"{label} path escapes export")
    candidate = root / relative
    if candidate.is_symlink():
        raise Balanced555PiqdRupError(f"{label} path is a symlink")
    resolved = candidate.resolve()
    try:
        resolved.relative_to(root.resolve())
    except ValueError as exc:
        raise Balanced555PiqdRupError(f"{label} path escapes export") from exc
    return _regular_file(resolved, label)


def _walk_values(value: Any) -> Sequence[Mapping[str, Any]]:
    """Yield object nodes, retaining only data useful for artifact contracts."""
    found: list[Mapping[str, Any]] = []
    if isinstance(value, Mapping):
        found.append(value)
        for child in value.values():
            found.extend(_walk_values(child))
    elif isinstance(value, list):
        for child in value:
            found.extend(_walk_values(child))
    return found


def _find_field(objects: Sequence[Mapping[str, Any]], keys: Sequence[str]) -> Any:
    for obj in objects:
        for key in keys:
            if key in obj:
                return obj[key]
    return None


def _artifact_contract(
    objects: Sequence[Mapping[str, Any]],
    *,
    names: Sequence[str],
    label: str,
) -> tuple[str | None, int | None, str | None]:
    """Extract hash, byte count, and an optional export-relative path."""
    digest = _find_field(objects, names)
    byte_count = _find_field(
        objects,
        tuple(name.replace("sha256", "byte_count") for name in names)
        + tuple(name.replace("sha256", "bytes") for name in names),
    )
    path = _find_field(
        objects,
        tuple(name.replace("_sha256", "_path") for name in names)
        + tuple(name.replace("_hash", "_path") for name in names)
        + tuple(name.replace("_blob_hash", "_path") for name in names),
    )
    if digest is not None:
        digest = _hash(digest, label)
    if byte_count is not None:
        byte_count = _positive_count(byte_count, label)
    if path is not None and not isinstance(path, str):
        raise Balanced555PiqdRupError(f"{label} path is malformed")
    return digest, byte_count, path


def _nested_artifact(
    objects: Sequence[Mapping[str, Any]], keys: Sequence[str]
) -> Mapping[str, Any] | None:
    """Find a conventional ``artifacts: {cnf: {...}}`` record."""
    for obj in objects:
        for container_name in ("artifacts", "artifact_records", "outputs"):
            container = obj.get(container_name)
            if not isinstance(container, Mapping):
                continue
            for key in keys:
                record = container.get(key)
                if isinstance(record, Mapping):
                    return record
    return None


def _resolve_input(
    export_dir: Path | None,
    supplied: Path | None,
    *,
    candidates: Sequence[str],
    label: str,
) -> Path:
    if supplied is not None:
        return _regular_file(supplied, label)
    if export_dir is None:
        raise Balanced555PiqdRupError(f"{label} path was not supplied")
    root = _regular_file(export_dir, "export") if export_dir.is_file() else export_dir.resolve()
    if not root.is_dir():
        raise Balanced555PiqdRupError(f"export is not a directory: {root}")
    matches = [root / name for name in candidates if (root / name).is_file()]
    if len(matches) != 1:
        raise Balanced555PiqdRupError(
            f"export must contain exactly one recognizable {label} ({len(matches)} found)"
        )
    return _regular_file(matches[0], label)


def _metadata_paths(
    objects: Sequence[Mapping[str, Any]],
    *,
    export_dir: Path | None,
    cnf_path: Path | None,
    lrat_path: Path | None,
) -> tuple[Path | None, Path | None]:
    if export_dir is None:
        return cnf_path, lrat_path
    root = export_dir.resolve()
    cnf_contract = _nested_artifact(objects, ("cnf", "raw_cnf", "input_cnf"))
    lrat_contract = _nested_artifact(
        objects, ("lrat", "proof", "compacted_lrat", "normalized_lrat")
    )
    _, _, cnf_name = _artifact_contract(
        objects,
        names=("cnf_sha256", "cnf_hash", "cnf_blob_hash", "cnf_digest"),
        label="CNF",
    )
    _, _, lrat_name = _artifact_contract(
        objects,
        names=(
            "lrat_sha256",
            "lrat_hash",
            "proof_sha256",
            "proof_hash",
            "compact_lrat_sha256",
            "proof_blob_hash",
            "proof_digest",
        ),
        label="LRAT",
    )
    if cnf_contract is not None and "path" in cnf_contract:
        cnf_name = cnf_contract["path"]
    if lrat_contract is not None and "path" in lrat_contract:
        lrat_name = lrat_contract["path"]
    if cnf_name is not None:
        metadata_path = _safe_relative_path(cnf_name, root=root, label="CNF")
        if cnf_path is not None and cnf_path.resolve() != metadata_path:
            raise Balanced555PiqdRupError("explicit CNF path disagrees with metadata")
        cnf_path = metadata_path
    if lrat_name is not None:
        metadata_path = _safe_relative_path(lrat_name, root=root, label="LRAT")
        if lrat_path is not None and lrat_path.resolve() != metadata_path:
            raise Balanced555PiqdRupError("explicit LRAT path disagrees with metadata")
        lrat_path = metadata_path
    return cnf_path, lrat_path


def _validate_contract(
    *,
    cnf_path: Path,
    lrat_path: Path,
    job: Mapping[str, Any] | None,
    status: Mapping[str, Any] | None,
    expected_cnf_sha256: str | None,
    expected_lrat_sha256: str | None,
    expected_cnf_bytes: int | None,
    expected_lrat_bytes: int | None,
) -> tuple[str, str, int, int]:
    objects: list[Mapping[str, Any]] = []
    if job is not None:
        objects.extend(_walk_values(job))
    if status is not None:
        objects.extend(_walk_values(status))
    cnf_meta, cnf_bytes_meta, _ = _artifact_contract(
        objects,
        names=("cnf_sha256", "cnf_hash", "cnf_blob_hash", "cnf_digest"),
        label="CNF",
    )
    lrat_meta, lrat_bytes_meta, _ = _artifact_contract(
        objects,
        names=(
            "lrat_sha256",
            "lrat_hash",
            "proof_sha256",
            "proof_hash",
            "compact_lrat_sha256",
            "proof_blob_hash",
            "proof_digest",
        ),
        label="LRAT",
    )
    cnf_record = _nested_artifact(objects, ("cnf", "raw_cnf", "input_cnf"))
    lrat_record = _nested_artifact(
        objects, ("lrat", "proof", "compacted_lrat", "normalized_lrat")
    )
    for record, label in ((cnf_record, "CNF"), (lrat_record, "LRAT")):
        if record is None:
            continue
        nested_digest = record.get("sha256", record.get("hash"))
        nested_bytes = record.get("byte_count", record.get("bytes"))
        if nested_digest is not None:
            nested_digest = _hash(nested_digest, label)
        if nested_bytes is not None:
            nested_bytes = _positive_count(nested_bytes, label)
        if label == "CNF":
            if cnf_meta is not None and cnf_meta != nested_digest:
                raise Balanced555PiqdRupError("CNF SHA-256 contracts disagree")
            cnf_meta = nested_digest if nested_digest is not None else cnf_meta
            if cnf_bytes_meta is not None and cnf_bytes_meta != nested_bytes:
                raise Balanced555PiqdRupError("CNF byte-count contracts disagree")
            cnf_bytes_meta = nested_bytes if nested_bytes is not None else cnf_bytes_meta
        else:
            if lrat_meta is not None and lrat_meta != nested_digest:
                raise Balanced555PiqdRupError("LRAT SHA-256 contracts disagree")
            lrat_meta = nested_digest if nested_digest is not None else lrat_meta
            if lrat_bytes_meta is not None and lrat_bytes_meta != nested_bytes:
                raise Balanced555PiqdRupError("LRAT byte-count contracts disagree")
            lrat_bytes_meta = nested_bytes if nested_bytes is not None else lrat_bytes_meta
    cnf_digest = _hash(expected_cnf_sha256, "expected CNF") if expected_cnf_sha256 else cnf_meta
    lrat_digest = _hash(expected_lrat_sha256, "expected LRAT") if expected_lrat_sha256 else lrat_meta
    if cnf_digest is None or lrat_digest is None:
        raise Balanced555PiqdRupError(
            "both CNF and LRAT SHA-256 contracts are required (JSON or explicit)"
        )
    if cnf_meta is not None and cnf_meta != cnf_digest:
        raise Balanced555PiqdRupError("CNF SHA-256 contracts disagree")
    if lrat_meta is not None and lrat_meta != lrat_digest:
        raise Balanced555PiqdRupError("LRAT SHA-256 contracts disagree")
    cnf_bytes = expected_cnf_bytes if expected_cnf_bytes is not None else cnf_bytes_meta
    lrat_bytes = expected_lrat_bytes if expected_lrat_bytes is not None else lrat_bytes_meta
    actual_cnf_bytes = cnf_path.stat().st_size
    actual_lrat_bytes = lrat_path.stat().st_size
    if cnf_bytes is not None and actual_cnf_bytes != _positive_count(cnf_bytes, "expected CNF"):
        raise Balanced555PiqdRupError("CNF byte-count mismatch")
    if lrat_bytes is not None and actual_lrat_bytes != _positive_count(lrat_bytes, "expected LRAT"):
        raise Balanced555PiqdRupError("LRAT byte-count mismatch")
    if _sha256(cnf_path) != cnf_digest:
        raise Balanced555PiqdRupError("CNF SHA-256 mismatch")
    if _sha256(lrat_path) != lrat_digest:
        raise Balanced555PiqdRupError("LRAT SHA-256 mismatch")
    if status is not None:
        state = status.get("status")
        result = status.get("result", status.get("solver_result"))
        if state not in {"completed", "COMPLETE", "complete"}:
            raise Balanced555PiqdRupError("PiQD status is not completed")
        if result is None or str(result).upper() != "UNSAT":
            raise Balanced555PiqdRupError("PiQD completed status is not UNSAT")
    proof_format = _find_field(objects, ("proof_format", "certificate_format"))
    if proof_format is not None and str(proof_format).lower() not in {
        "lrat",
        "compact_lrat",
        "compacted_lrat",
    }:
        raise Balanced555PiqdRupError("PiQD proof is not compacted LRAT")
    return cnf_digest, lrat_digest, actual_cnf_bytes, actual_lrat_bytes


def _normalize_lrat(cnf_path: Path, lrat_path: Path, output_path: Path) -> dict[str, int]:
    """Parse strict pure RUP and require dense ids starting at 50114."""
    try:
        cnf = rup.parse_dimacs(cnf_path)
    except (OSError, UnicodeError, rup.MaterializationError) as exc:
        raise Balanced555PiqdRupError("CNF failed strict DIMACS parsing") from exc
    if cnf.variable_count != EXPECTED_VARIABLE_COUNT or len(cnf.clauses) != EXPECTED_CLAUSE_COUNT:
        raise Balanced555PiqdRupError("CNF is not exactly 148 variables and 50113 clauses")
    active = set(range(1, EXPECTED_CLAUSE_COUNT + 1))
    additions = deletions = deleted_ids = hints = 0
    terminal = False
    with lrat_path.open("rb") as source, output_path.open("xb") as output:
        for line_number, raw in enumerate(source, 1):
            if terminal:
                raise Balanced555PiqdRupError("LRAT action follows final empty clause")
            if not raw.endswith(b"\n") or b"\r" in raw:
                raise Balanced555PiqdRupError(f"LRAT line {line_number} is not LF-terminated")
            try:
                fields = raw.decode("ascii").split()
            except UnicodeDecodeError as exc:
                raise Balanced555PiqdRupError(f"LRAT line {line_number} is not ASCII") from exc
            if len(fields) < 2:
                raise Balanced555PiqdRupError(f"malformed LRAT line {line_number}")
            try:
                if fields[1] == "d":
                    action_id, deleted = rup.parse_deletion(fields, line_number=line_number)
                    if action_id != 1 or len(set(deleted)) != len(deleted):
                        raise Balanced555PiqdRupError(f"noncanonical deletion on LRAT line {line_number}")
                    if any(clause_id not in active for clause_id in deleted):
                        raise Balanced555PiqdRupError(f"deletion references inactive clause on LRAT line {line_number}")
                    for clause_id in deleted:
                        active.remove(clause_id)
                    rendered = rup.format_deletion(deleted)
                    deletions += 1
                    deleted_ids += len(deleted)
                else:
                    action_id, clause, proof_hints = rup.parse_addition(
                        fields, line_number=line_number, variable_count=EXPECTED_VARIABLE_COUNT
                    )
                    expected_id = FIRST_ADDITION_ID + additions
                    if action_id != expected_id:
                        raise Balanced555PiqdRupError(
                            f"non-dense addition id on LRAT line {line_number}: expected {expected_id}, got {action_id}"
                        )
                    if any(hint >= action_id or hint not in active for hint in proof_hints):
                        raise Balanced555PiqdRupError(f"invalid RUP hint on LRAT line {line_number}")
                    active.add(action_id)
                    rendered = rup.format_addition(action_id, clause, proof_hints)
                    additions += 1
                    hints += len(proof_hints)
                    terminal = not clause
            except rup.MaterializationError as exc:
                raise Balanced555PiqdRupError(str(exc)) from exc
            output.write((rendered + "\n").encode("ascii"))
        output.flush()
        os.fsync(output.fileno())
    if additions == 0 or not terminal:
        raise Balanced555PiqdRupError("LRAT has no final empty-clause addition")
    return {
        "base_clauses": EXPECTED_CLAUSE_COUNT,
        "additions": additions,
        "deletions": deletions,
        "deleted_ids": deleted_ids,
        "hints": hints,
        "lines": additions + deletions,
    }


def prepare_balanced555_piqd_rup_source(
    output_dir: Path,
    *,
    export_dir: Path | None = None,
    cnf_path: Path | None = None,
    lrat_path: Path | None = None,
    proof_path: Path | None = None,
    job_json: Path | None = None,
    status_json: Path | None = None,
    expected_cnf_sha256: str | None = None,
    expected_lrat_sha256: str | None = None,
    expected_proof_sha256: str | None = None,
    expected_cnf_bytes: int | None = None,
    expected_lrat_bytes: int | None = None,
) -> dict[str, Any]:
    """Validate an export and atomically publish a generic source manifest."""
    if output_dir.exists() or output_dir.is_symlink():
        raise Balanced555PiqdRupError(f"refusing to overwrite output: {output_dir.resolve()}")
    if proof_path is not None:
        if lrat_path is not None and lrat_path.resolve() != proof_path.resolve():
            raise Balanced555PiqdRupError("LRAT and proof paths disagree")
        lrat_path = proof_path
    if expected_proof_sha256 is not None:
        if (
            expected_lrat_sha256 is not None
            and expected_lrat_sha256 != expected_proof_sha256
        ):
            raise Balanced555PiqdRupError("LRAT and proof hashes disagree")
        expected_lrat_sha256 = expected_proof_sha256
    root = export_dir.resolve() if export_dir is not None else None
    if root is not None and not root.is_dir():
        raise Balanced555PiqdRupError(f"export is not a directory: {root}")
    job = _load_json(job_json, "job") if job_json is not None else None
    status = _load_json(status_json, "status") if status_json is not None else None
    if root is not None:
        if job is None:
            candidate = root / "job.json"
            if candidate.is_file():
                job = _load_json(candidate, "job")
        if status is None:
            candidate = root / "status.json"
            if candidate.is_file():
                status = _load_json(candidate, "status")
    if job is None and status is None and (expected_cnf_sha256 is None or expected_lrat_sha256 is None):
        raise Balanced555PiqdRupError("job/status JSON or both explicit expected hashes are required")
    objects: list[Mapping[str, Any]] = []
    if job is not None:
        objects.extend(_walk_values(job))
    if status is not None:
        objects.extend(_walk_values(status))
    metadata_root = root
    if metadata_root is None:
        metadata_file = job_json or status_json
        if metadata_file is not None:
            metadata_root = metadata_file.resolve().parent
    cnf, lrat = _metadata_paths(
        objects,
        export_dir=metadata_root,
        cnf_path=cnf_path,
        lrat_path=lrat_path,
    )
    cnf = _resolve_input(
        root,
        cnf,
        candidates=("cnf", "input.cnf", "formula.cnf", "raw.cnf", "balanced555.cnf"),
        label="CNF",
    )
    lrat = _resolve_input(
        root,
        lrat,
        candidates=("lrat", "proof.lrat", "compact.lrat", "compacted.lrat", "solver.lrat"),
        label="LRAT",
    )
    cnf_digest, lrat_digest, cnf_bytes, lrat_bytes = _validate_contract(
        cnf_path=cnf,
        lrat_path=lrat,
        job=job,
        status=status,
        expected_cnf_sha256=expected_cnf_sha256,
        expected_lrat_sha256=expected_lrat_sha256,
        expected_cnf_bytes=expected_cnf_bytes,
        expected_lrat_bytes=expected_lrat_bytes,
    )
    output_dir = output_dir.resolve()
    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(tempfile.mkdtemp(prefix=f".{output_dir.name}.stage-", dir=output_dir.parent))
    try:
        staged_cnf = stage / "balanced555.cnf"
        staged_lrat = stage / "normalized.lrat"
        shutil.copyfile(cnf, staged_cnf)
        counts = _normalize_lrat(staged_cnf, lrat, staged_lrat)
        declared_counts = {
            "lines": _artifact_declared_count(
                objects,
                ("lrat", "proof", "compacted_lrat", "normalized_lrat"),
                ("proof_lines", "lrat_lines", "proof_line_count", "lrat_line_count"),
                ("lines", "line_count"),
                "proof lines",
            ),
            "additions": _artifact_declared_count(
                objects,
                ("lrat", "proof", "compacted_lrat", "normalized_lrat"),
                ("proof_additions", "lrat_additions", "proof_addition_count"),
                ("additions", "addition_count"),
                "proof additions",
            ),
            "deletions": _artifact_declared_count(
                objects,
                ("lrat", "proof", "compacted_lrat", "normalized_lrat"),
                ("proof_deletions", "lrat_deletions", "proof_deletion_count"),
                ("deletions", "deletion_count"),
                "proof deletions",
            ),
            "hints": _artifact_declared_count(
                objects,
                ("lrat", "proof", "compacted_lrat", "normalized_lrat"),
                ("proof_hints", "lrat_hints", "proof_hint_count"),
                ("hints", "hint_count"),
                "proof hints",
            ),
        }
        for key, declared in declared_counts.items():
            if declared is not None and counts[key] != declared:
                raise Balanced555PiqdRupError(f"proof {key} count mismatch")
        source_manifest = {
            "schema": SOURCE_SCHEMA,
            "artifacts": {
                "cnf": _record(staged_cnf, name=staged_cnf.name),
                "normalized_lrat": _record(staged_lrat, name=staged_lrat.name),
            },
        }
        manifest_path = stage / "source-manifest.json"
        manifest_path.write_text(
            json.dumps(source_manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        rup.load_source_manifest(manifest_path)
        receipt_body = {
            "schema": RECEIPT_SCHEMA,
            "status": "PREPARED_UNTRUSTED_PRECHECK_ONLY",
            "input": {
                "cnf": {"sha256": cnf_digest, "byte_count": cnf_bytes},
                "compacted_lrat": {"sha256": lrat_digest, "byte_count": lrat_bytes},
            },
            "normalization": counts,
            "source_manifest": _record(manifest_path, name=manifest_path.name),
            "artifacts": {
                "cnf": source_manifest["artifacts"]["cnf"],
                "normalized_lrat": source_manifest["artifacts"]["normalized_lrat"],
            },
        }
        (stage / "receipt.json").write_text(
            json.dumps(receipt_body, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        os.replace(stage, output_dir)
    except Exception:
        shutil.rmtree(stage, ignore_errors=True)
        raise
    return receipt_body


# Short import-friendly spelling for callers that do not need the profile name.
prepare_source = prepare_balanced555_piqd_rup_source


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--export-dir", "--input-dir", dest="export_dir", type=Path)
    parser.add_argument(
        "--cnf", "--raw-cnf", "--cnf-path", dest="cnf_path", type=Path
    )
    parser.add_argument(
        "--lrat",
        "--proof",
        "--proof-path",
        "--compacted-lrat",
        dest="lrat_path",
        type=Path,
    )
    parser.add_argument("--job-json", "--job", "--job-path", type=Path)
    parser.add_argument("--status-json", "--status", "--status-path", type=Path)
    parser.add_argument("--output-dir", "--output", type=Path, required=True)
    parser.add_argument("--expected-cnf-sha256")
    parser.add_argument(
        "--expected-lrat-sha256",
        "--expected-proof-sha256",
        "--expected-proof-hash",
        dest="expected_lrat_sha256",
    )
    parser.add_argument("--expected-cnf-bytes", type=int)
    parser.add_argument("--expected-lrat-bytes", type=int)
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        receipt = prepare_balanced555_piqd_rup_source(
            args.output_dir,
            export_dir=args.export_dir,
            cnf_path=args.cnf_path,
            lrat_path=args.lrat_path,
            job_json=args.job_json,
            status_json=args.status_json,
            expected_cnf_sha256=args.expected_cnf_sha256,
            expected_lrat_sha256=args.expected_lrat_sha256,
            expected_cnf_bytes=args.expected_cnf_bytes,
            expected_lrat_bytes=args.expected_lrat_bytes,
        )
    except (Balanced555PiqdRupError, OSError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2
    if args.verbose:
        print(json.dumps(receipt, indent=2, sort_keys=True))
    else:
        print(f"PREPARED {args.output_dir.resolve()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
