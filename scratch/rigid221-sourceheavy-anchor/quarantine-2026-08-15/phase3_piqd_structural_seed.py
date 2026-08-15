"""Admit one source-derived PIQD classifier as a replayable structural seed.

This adapter is deliberately finite and local.  It locally authenticates the
exact classifier, bound job, and base DIMACS bytes, checks the selected-positive
witness against the classifier cube, replays the tagged structural certificate,
and only then publishes a one-record v3 journal plus a binding sidecar.  An
optional all-or-none package/driver/source-receipt triple authenticates local
custody, but does not constitute PIQD daemon attestation.  The downstream
structural runner accepts only the replayed journal rather than this packet's
sidecar/commit marker.  It does not confer source entitlement, cell coverage, a
universal lift, or Lean closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import lzma
import os
import stat
import tempfile
from collections.abc import Collection, Mapping
from pathlib import Path
from typing import Any

from census.card_head.exact12_v14_bound_jobs import (
    instantiate_validated_bound_job,
)
from census.card_head.exact12_v14_cell_run import cnf_assignment_satisfies
from census.card_head.exact12_v14_schedule import build_manifest
from census.card_head.exact12_v14_structural_cegar import (
    DETECTOR_CONTRACT,
    DETECTOR_FILES,
    RECORD_SCHEMA,
    STRUCTURAL_CERTIFICATE_KIND,
    STRUCTURAL_CERTIFICATE_SCHEMA,
    detect_structural_certificate,
    learned_clause_for_certificate,
    replay_journal,
    replay_tagged_cut,
    validate_structural_certificate,
)
from census.p97_search.phase3_piqd_campaign import (
    PACKAGE_IDENTITY_SCHEMA,
    _authenticate_cell,
    _package_identity_from_snapshot,
    _package_snapshot,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_exact12_replay import (
    SOURCE_CLASSIFIER_DETECTOR_CONTRACT,
    SOURCE_CLASSIFIER_DETECTOR_FILES,
    validate_source_duplicate_center_classifier,
)

CLASSIFIER_SCHEMA = "p97-cegar-source-derived-duplicate-center/v2"
SEED_SIDECAR_SCHEMA = "p97-cegar-structural-seed-binding/v3"
SEED_COMMIT_SCHEMA = "p97-cegar-structural-seed-commit/v1"
SEED_COMMIT_SUFFIX = ".commit"
SEED_SCOPE = (
    "one locally authenticated finite exact12 source-job/CNF/classifier snapshot; "
    "no PIQD producer-receipt custody and no transitive seed-packet custody in the "
    "downstream journal-only runner; finite-local structural seed only; no source "
    "entitlement, aggregate coverage, universal lift, or Lean closure"
)
SEED_CLAIMS = {
    "finite_local": True,
    "local_package_custody": False,
    "local_driver_journal_custody": False,
    "source_receipt_custody": False,
    "piqd_producer_receipt_present": False,
    "piqd_daemon_origin_custody": False,
    "downstream_seed_packet_custody": False,
    "source_entitlement": False,
    "aggregate_coverage": False,
    "universal_lift": False,
    "lean_theorem_closure": False,
    "executed_byte_provenance": False,
}
MAX_CLASSIFIER_BYTES = 32 * 1024 * 1024
MAX_XZ_BYTES = 8 * 1024 * 1024


class StructuralSeedError(ValueError):
    """The classifier, bound inputs, or seed publication is malformed."""


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _sha256_json(value: Any) -> str:
    return _sha256(_canonical_json_bytes(value))


def _reject_constant(value: str) -> Any:
    raise ValueError(f"non-finite JSON constant: {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _strict_json(raw: bytes, *, source: str) -> Mapping[str, Any]:
    try:
        value = json.loads(
            raw,
            parse_constant=_reject_constant,
            object_pairs_hook=_reject_duplicate_keys,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, TypeError, ValueError) as exc:
        raise StructuralSeedError(f"{source} is not strict JSON") from exc
    if not isinstance(value, Mapping):
        raise StructuralSeedError(f"{source} must contain a JSON object")
    return value


def _authenticated_file_bytes(path: Path, *, limit: int, label: str) -> bytes:
    """Read a bounded regular file through one O_NOFOLLOW descriptor."""

    if limit <= 0 or not hasattr(os, "O_NOFOLLOW"):
        raise StructuralSeedError(f"{label} cannot be read securely")
    flags = os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0)
    try:
        descriptor = os.open(os.fspath(Path(path)), flags)
    except OSError as exc:
        raise StructuralSeedError(f"{label} cannot be read securely") from exc
    try:
        metadata = os.fstat(descriptor)
        if not stat.S_ISREG(metadata.st_mode):
            raise StructuralSeedError(f"{label} must be a regular file")
        if metadata.st_size > limit:
            raise StructuralSeedError(f"{label} exceeds the bounded input size")
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(1024 * 1024, limit - total + 1))
            if not chunk:
                break
            total += len(chunk)
            if total > limit:
                raise StructuralSeedError(f"{label} exceeds the bounded input size")
            chunks.append(chunk)
        final_metadata = os.fstat(descriptor)
        if final_metadata.st_size != metadata.st_size:
            raise StructuralSeedError(f"{label} changed while being read")
        return b"".join(chunks)
    except StructuralSeedError:
        raise
    except OSError as exc:
        raise StructuralSeedError(f"{label} cannot be read securely") from exc
    finally:
        try:
            os.close(descriptor)
        except OSError:
            pass


def _decompress_single_xz(raw: bytes, *, source: str) -> bytes:
    if len(raw) > MAX_XZ_BYTES:
        raise StructuralSeedError(f"{source} exceeds the bounded xz input size")
    decoder = lzma.LZMADecompressor(format=lzma.FORMAT_XZ)
    try:
        decoded = decoder.decompress(raw, max_length=MAX_CLASSIFIER_BYTES + 1)
    except lzma.LZMAError as exc:
        raise StructuralSeedError(
            f"{source} is not a valid single-stream xz file"
        ) from exc
    if not decoder.eof or decoder.unused_data:
        raise StructuralSeedError(f"{source} must contain exactly one xz stream")
    if len(decoded) > MAX_CLASSIFIER_BYTES:
        raise StructuralSeedError(f"{source} exceeds the bounded decompressed size")
    return decoded


def load_classifier(path: Path) -> dict[str, Any]:
    """Load one strict raw JSON or bounded single-stream xz classifier."""

    raw = _authenticated_file_bytes(
        Path(path), limit=MAX_CLASSIFIER_BYTES, label="classifier"
    )
    if Path(path).suffix == ".xz" or raw.startswith(b"\xfd7zXZ\x00"):
        raw = _decompress_single_xz(raw, source="classifier")
    value = dict(_strict_json(raw, source="classifier"))
    try:
        validate_source_duplicate_center_classifier(value)
    except (KeyError, TypeError, ValueError) as exc:
        raise StructuralSeedError(f"classifier validation failed: {exc}") from exc
    return value


def _canonical_cube(cube: Mapping[int | str, Collection[int]]) -> dict[str, list[int]]:
    if not isinstance(cube, Mapping) or set(cube) not in (
        set(range(12)),
        {str(index) for index in range(12)},
    ):
        raise StructuralSeedError("classifier cube must contain each exact12 center")
    result: dict[str, list[int]] = {}
    for center in range(12):
        values = cube.get(center, cube.get(str(center)))
        if not isinstance(values, list):
            raise StructuralSeedError("classifier cube support is malformed")
        result[str(center)] = list(values)
    return result


def _detector_contract_manifest(repo_root: Path) -> tuple[list[dict[str, Any]], str]:
    manifest: list[dict[str, Any]] = []
    for relative in DETECTOR_FILES:
        path = repo_root / relative
        raw = _authenticated_file_bytes(
            path, limit=64 * 1024 * 1024, label=f"detector file {relative}"
        )
        manifest.append({"path": relative, "bytes": len(raw), "sha256": _sha256(raw)})
    return manifest, _sha256_json(manifest)


def _replay_seed_journal_unchecked(
    repo_root: Path,
    journal_path: Path,
    *,
    job_sha256: str,
    detector_contract_sha256: str,
    cell_index: int,
) -> tuple[int, str, frozenset[tuple[int, ...]]]:
    """Independently replay one emitted v3 seed journal against a fresh cell."""

    manifest = build_manifest(repo_root)
    from census.card_head.exact12_v14_bound_jobs import build_bound_job

    job = build_bound_job(manifest, repo_root, cell_index)
    materialized = instantiate_validated_bound_job(job, manifest, repo_root)
    return replay_journal(
        repo_root,
        materialized.instance,
        Path(journal_path),
        job_sha256=job_sha256,
        detector_contract_sha256=detector_contract_sha256,
        cell_index=cell_index,
    )


def _path_exists(path: Path) -> bool:
    try:
        os.lstat(path)
    except FileNotFoundError:
        return False
    except OSError as exc:
        raise StructuralSeedError(f"cannot inspect output path {path}") from exc
    return True


def _commit_path(journal_path: Path) -> Path:
    return journal_path.with_name(journal_path.name + SEED_COMMIT_SUFFIX)


def _lock_path(journal_path: Path) -> Path:
    return journal_path.with_name(f".{journal_path.name}.lock")


def _validate_publication_parent(path: Path) -> None:
    """Reject missing, non-directory, or symlinked publication components."""

    absolute = Path(path).absolute()
    current = Path(absolute.anchor)
    for component in absolute.parts[1:]:
        current /= component
        try:
            metadata = os.lstat(current)
        except OSError as exc:
            raise StructuralSeedError(
                f"publication parent cannot be authenticated: {path}"
            ) from exc
        if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISDIR(metadata.st_mode):
            raise StructuralSeedError(
                f"publication parent contains a symlink or non-directory: {path}"
            )


def _fsync_directory(path: Path) -> None:
    _validate_publication_parent(path)
    try:
        descriptor = os.open(
            os.fspath(path),
            os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0),
        )
        try:
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
    except OSError as exc:
        raise StructuralSeedError(f"cannot fsync publication directory {path}") from exc


def _acquire_lock(path: Path) -> bytes:
    _validate_publication_parent(path.parent)
    payload = f"pid={os.getpid()} token={os.urandom(16).hex()}\n".encode("ascii")
    try:
        parent_descriptor = os.open(
            os.fspath(path.parent),
            os.O_RDONLY
            | getattr(os, "O_DIRECTORY", 0)
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0),
        )
        try:
            descriptor = os.open(
                path.name,
                os.O_WRONLY
                | os.O_CREAT
                | os.O_EXCL
                | getattr(os, "O_NOFOLLOW", 0)
                | getattr(os, "O_CLOEXEC", 0),
                0o600,
                dir_fd=parent_descriptor,
            )
        finally:
            os.close(parent_descriptor)
        try:
            os.write(descriptor, payload)
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
    except OSError as exc:
        raise StructuralSeedError(f"seed output is already claimed: {path}") from exc
    return payload


def _release_lock(path: Path, payload: bytes) -> None:
    try:
        _validate_publication_parent(path.parent)
        if (
            _authenticated_file_bytes(path, limit=len(payload), label="seed lock")
            != payload
        ):
            return
        path.unlink()
    except (FileNotFoundError, StructuralSeedError, OSError):
        pass


def _write_temp_payload(directory: Path, name: str, payload: bytes) -> Path:
    temporary: Path | None = None
    descriptor: int | None = None
    completed = False
    try:
        descriptor, raw_path = tempfile.mkstemp(
            dir=directory, prefix=f".{name}.", suffix=".tmp"
        )
        temporary = Path(raw_path)
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            if written <= 0:
                raise OSError("short write while staging publication payload")
            offset += written
        os.fsync(descriptor)
        os.close(descriptor)
        descriptor = None
        completed = True
        return temporary
    except OSError as exc:
        raise StructuralSeedError(f"cannot stage publication payload {name}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        if not completed and temporary is not None:
            try:
                temporary.unlink()
            except OSError:
                pass


def _install_exclusive(temporary: Path, target: Path) -> None:
    linked = False
    try:
        os.link(temporary, target, follow_symlinks=False)
        linked = True
        _fsync_directory(target.parent)
    except OSError as exc:
        raise StructuralSeedError(f"exclusive publication failed for {target}") from exc
    finally:
        # A successful hard-link is already the publication event.  Do not turn
        # a cleanup failure for the private staging name into a false rollback.
        if linked:
            try:
                temporary.unlink()
            except OSError:
                pass


def _remove_if_exact(path: Path, payload: bytes) -> None:
    try:
        if (
            _authenticated_file_bytes(path, limit=len(payload), label="cleanup")
            != payload
        ):
            return
        path.unlink()
    except (FileNotFoundError, StructuralSeedError, OSError):
        return


def _commit_payload(
    journal_path: Path,
    sidecar_path: Path,
    journal_raw: bytes,
    sidecar_raw: bytes,
) -> bytes:
    body = {
        "schema": SEED_COMMIT_SCHEMA,
        "journal_name": journal_path.name,
        "sidecar_name": sidecar_path.name,
        "journal_sha256": _sha256(journal_raw),
        "sidecar_sha256": _sha256(sidecar_raw),
    }
    return _canonical_json_bytes({**body, "commit_sha256": _sha256_json(body)}) + b"\n"


def _read_canonical_json_file(
    path: Path, *, label: str, limit: int
) -> tuple[bytes, dict[str, Any]]:
    raw = _authenticated_file_bytes(path, limit=limit, label=label)
    if not raw.endswith(b"\n"):
        raise StructuralSeedError(f"{label} is not newline terminated")
    value = dict(_strict_json(raw[:-1], source=label))
    if _canonical_json_bytes(value) + b"\n" != raw:
        raise StructuralSeedError(f"{label} is not canonical JSON")
    return raw, value


def _validate_commit(
    commit: Mapping[str, Any],
    *,
    journal_path: Path,
    sidecar_path: Path,
    journal_raw: bytes,
    sidecar_raw: bytes,
) -> None:
    expected = {
        "schema",
        "journal_name",
        "sidecar_name",
        "journal_sha256",
        "sidecar_sha256",
        "commit_sha256",
    }
    if set(commit) != expected:
        raise StructuralSeedError("seed commit marker fields differ from schema")
    body = dict(commit)
    commit_sha256 = body.pop("commit_sha256")
    if (
        commit["schema"] != SEED_COMMIT_SCHEMA
        or commit["journal_name"] != journal_path.name
        or commit["sidecar_name"] != sidecar_path.name
        or commit["journal_sha256"] != _sha256(journal_raw)
        or commit["sidecar_sha256"] != _sha256(sidecar_raw)
        or commit_sha256 != _sha256_json(body)
    ):
        raise StructuralSeedError("seed commit marker does not bind packet bytes")


def _rebuild_authenticated_inputs(
    repo_root: Path,
    source_job_path: Path,
    discovery_cnf_path: Path,
) -> tuple[dict[str, Any], Any, str, str]:
    source_raw = _authenticated_file_bytes(
        source_job_path, limit=MAX_CLASSIFIER_BYTES, label="source job"
    )
    source_job = _strict_json(source_raw, source="source job")
    if source_job.get("schema") != "p97_rigid221_exact12_full_v14_bound_job.v1":
        raise StructuralSeedError("source job is not the exact12 v14 bound-job schema")
    cell_index = source_job.get("cell_index")
    if isinstance(cell_index, bool) or not isinstance(cell_index, int):
        raise StructuralSeedError("source job cell_index is malformed")
    manifest = build_manifest(repo_root)
    from census.card_head.exact12_v14_bound_jobs import build_bound_job

    expected_job = build_bound_job(manifest, repo_root, cell_index)
    if _canonical_json_bytes(source_job) != _canonical_json_bytes(expected_job):
        raise StructuralSeedError("source job differs from the current bound compiler")
    materialized = instantiate_validated_bound_job(expected_job, manifest, repo_root)
    discovery_raw = _authenticated_file_bytes(
        discovery_cnf_path, limit=128 * 1024 * 1024, label="discovery CNF"
    )
    expected_cnf = materialized.instance.dimacs().encode("ascii")
    if discovery_raw != expected_cnf:
        raise StructuralSeedError("discovery CNF differs from the exact base DIMACS")
    return (
        expected_job,
        materialized,
        _sha256_json(expected_job),
        _sha256(discovery_raw),
    )


def _custody_claims() -> dict[str, bool]:
    claims = dict(SEED_CLAIMS)
    claims.update(
        {
            "local_package_custody": True,
            "local_driver_journal_custody": True,
            "source_receipt_custody": True,
        }
    )
    # The driver records a daemon job identifier, but this is not a daemon
    # attestation.  Keep this distinction explicit in every authenticated
    # packet.
    claims["piqd_producer_receipt_present"] = False
    claims["piqd_daemon_origin_custody"] = False
    return claims


def _validate_custody_bundle(
    repo_root: Path,
    *,
    package_dir: Path,
    piqd_journal: Path,
    source_receipt: Path,
    classifier_path: Path,
    source_job_path: Path,
    discovery_cnf_path: Path,
) -> dict[str, Any]:
    """Authenticate package, driver evidence, receipt, and fresh replay.

    The campaign authenticator is deliberately reused here: unlike
    ``process_cell`` it only reads and validates the declared artifacts.
    """

    package_dir = Path(package_dir).absolute()
    package_raw = _package_snapshot(package_dir)
    package_identity = _package_identity_from_snapshot(package_raw)
    source_job = _strict_json(
        package_raw["source-job.json"], source="package source job"
    )
    cell_index = source_job.get("cell_index")
    if isinstance(cell_index, bool) or not isinstance(cell_index, int):
        raise StructuralSeedError("package source job cell_index is malformed")
    expected_source = (package_dir / "source-job.json").absolute()
    expected_cnf = (package_dir / "discovery.cnf").absolute()
    if Path(source_job_path).absolute() != expected_source:
        raise StructuralSeedError(
            "source job is not the authenticated package artifact"
        )
    if Path(discovery_cnf_path).absolute() != expected_cnf:
        raise StructuralSeedError(
            "discovery CNF is not the authenticated package artifact"
        )

    cell = {
        "cell_index": cell_index,
        "package_dir": str(package_dir),
        "package_identity_sha256": sha256_json(package_identity),
        "wave_manifest_sha256": sha256_bytes(package_raw["wave-manifest.json"]),
        "source_bundle_sha256": sha256_bytes(package_raw["source-bundle.json"]),
    }
    # _authenticate_cell expects a canonical classifier line.  The structural
    # seed also accepts the existing bounded xz classifier, so stage only its
    # authenticated decoded value in an ephemeral file for that check.
    classifier = load_classifier(Path(classifier_path))
    with tempfile.TemporaryDirectory(
        prefix="phase3-seed-auth-", dir=package_dir.parent
    ) as temporary:
        plain_classifier = Path(temporary) / "classifier.json"
        plain_classifier.write_bytes(_canonical_json_bytes(classifier) + b"\n")
        try:
            unsigned = _authenticate_cell(
                {"cells": [cell]},
                0,
                Path(piqd_journal).absolute(),
                Path(source_receipt).absolute(),
                plain_classifier,
                repo_root,
            )
        except (OSError, KeyError, TypeError, ValueError) as exc:
            raise StructuralSeedError(
                f"authenticated custody validation failed: {exc}"
            ) from exc

    # Recheck the adapter's classifier representation and retain all identities
    # needed by downstream auditors, including producer/source-bundle bytes.
    if unsigned.get("classifier_sha256") != _sha256(
        _canonical_json_bytes(classifier) + b"\n"
    ):
        raise StructuralSeedError("authenticated classifier identity mismatch")
    journal_raw = _authenticated_file_bytes(
        Path(piqd_journal), limit=16 * 1024 * 1024, label="piqd journal"
    )
    _authenticated_file_bytes(
        Path(piqd_journal).with_name(f"{Path(piqd_journal).name}.seal.json"),
        limit=4 * 1024 * 1024,
        label="piqd journal seal",
    )
    model_sha256 = unsigned["model_sha256"]
    artifact_dir = Path(piqd_journal).with_name(f"{Path(piqd_journal).name}.artifacts")
    model_raw = _authenticated_file_bytes(
        artifact_dir / model_sha256, limit=64 * 1024 * 1024, label="terminal model"
    )
    model = _strict_json(model_raw, source="terminal model")
    piqd_job_id = model.get("job_id")
    if not isinstance(piqd_job_id, str) or not piqd_job_id:
        raise StructuralSeedError("terminal model job_id is malformed")
    receipt = _strict_json(
        _authenticated_file_bytes(
            Path(source_receipt), limit=8 * 1024 * 1024, label="source receipt"
        ).removesuffix(b"\n"),
        source="source receipt",
    )
    decoded = receipt.get("decoded")
    if not isinstance(decoded, Mapping) or not isinstance(
        decoded.get("cube_sha256"), str
    ):
        raise StructuralSeedError("source receipt decoded cube identity is missing")
    if decoded["cube_sha256"] != classifier["cube_sha256"]:
        raise StructuralSeedError(
            "source receipt cube identity differs from classifier"
        )
    return {
        "package_identity_schema": PACKAGE_IDENTITY_SCHEMA,
        "package_identity": package_identity,
        "package_identity_sha256": unsigned["package_identity_sha256"],
        "wave_manifest_sha256": unsigned["wave_manifest_sha256"],
        "producer_manifest_sha256": sha256_bytes(package_raw["producer-manifest.json"]),
        "source_bundle_sha256": sha256_bytes(package_raw["source-bundle.json"]),
        "journal_sha256": sha256_bytes(journal_raw),
        "journal_seal_sha256": unsigned["journal_seal_sha256"],
        "terminal_record_sha256": unsigned["terminal_record_sha256"],
        "model_sha256": model_sha256,
        "checkpoint_sha256": _checkpoint_digest_from_journal(piqd_journal),
        "piqd_job_id": piqd_job_id,
        "source_receipt_sha256": unsigned["receipt_sha256"],
        "classifier_sha256": _sha256(_canonical_json_bytes(classifier)),
        "source_classifier_cube_sha256": classifier["cube_sha256"],
        "source_receipt_cube_sha256": decoded["cube_sha256"],
        "claims": _custody_claims(),
    }


def _checkpoint_digest_from_journal(journal_path: Path) -> str:
    raw = _authenticated_file_bytes(
        journal_path, limit=16 * 1024 * 1024, label="piqd journal"
    )
    records = [
        dict(_strict_json(line, source="piqd journal record"))
        for line in raw.splitlines()
        if line
    ]
    if not records:
        raise StructuralSeedError("piqd journal has no terminal record")
    artifacts = records[-1].get("artifacts")
    if not isinstance(artifacts, Mapping) or not isinstance(
        artifacts.get("checkpoint_sha256"), str
    ):
        raise StructuralSeedError("piqd journal terminal checkpoint is missing")
    return artifacts["checkpoint_sha256"]


def _custody_inputs(
    package_dir: Path | None,
    piqd_journal: Path | None,
    source_receipt: Path | None,
) -> tuple[Path, Path, Path] | None:
    provided = (package_dir, piqd_journal, source_receipt)
    if any(value is not None for value in provided) and not all(
        value is not None for value in provided
    ):
        raise StructuralSeedError(
            "--package-dir, --piqd-journal, and --source-receipt must be supplied together"
        )
    if all(value is None for value in provided):
        return None
    return (Path(package_dir), Path(piqd_journal), Path(source_receipt))


def _publish_packet(
    journal_path: Path,
    sidecar_path: Path,
    journal_raw: bytes,
    sidecar_raw: bytes,
) -> bytes:
    """Publish two payloads under a lock, with a final visibility marker."""

    commit_path = _commit_path(journal_path)
    lock_path = _lock_path(journal_path)
    if journal_path.parent != sidecar_path.parent:
        raise StructuralSeedError("journal and sidecar must be sibling files")
    paths = (journal_path, sidecar_path, commit_path)
    journal_path.parent.mkdir(parents=True, exist_ok=True)
    _validate_publication_parent(journal_path.parent)
    if any(_path_exists(path) for path in (*paths, lock_path)):
        raise StructuralSeedError(
            "refusing to overwrite an existing or claimed seed packet"
        )
    lock_payload = _acquire_lock(lock_path)
    published: list[tuple[Path, bytes]] = []
    temporary: list[Path] = []
    committed = False
    try:
        if any(_path_exists(path) for path in paths):
            raise StructuralSeedError("seed packet appeared during publication")
        sidecar_raw = bytes(sidecar_raw)
        commit_raw = _commit_payload(
            journal_path, sidecar_path, journal_raw, sidecar_raw
        )
        for target, payload in (
            (journal_path, journal_raw),
            (sidecar_path, sidecar_raw),
            (commit_path, commit_raw),
        ):
            staged = _write_temp_payload(target.parent, target.name, payload)
            temporary.append(staged)
            try:
                _install_exclusive(staged, target)
            except BaseException:
                # The hard-link may have succeeded before a directory fsync or
                # injected post-link failure.  Track only our exact bytes so
                # rollback cannot touch a pre-existing or foreign artifact.
                try:
                    if (
                        _authenticated_file_bytes(
                            target, limit=len(payload), label="publication rollback"
                        )
                        == payload
                    ):
                        published.append((target, payload))
                except (StructuralSeedError, OSError):
                    pass
                raise
            temporary.remove(staged)
            published.append((target, payload))
            if target == commit_path:
                committed = True
        return commit_raw
    except BaseException:
        if not committed:
            for target, payload in reversed(published):
                _remove_if_exact(target, payload)
        raise
    finally:
        for staged in temporary:
            try:
                staged.unlink()
            except OSError:
                pass
        _release_lock(lock_path, lock_payload)


def replay_seed_packet(
    repo_root: Path,
    *,
    classifier_path: Path,
    source_job_path: Path,
    discovery_cnf_path: Path,
    journal_path: Path,
    sidecar_path: Path,
    commit_path: Path | None = None,
    package_dir: Path | None = None,
    piqd_journal: Path | None = None,
    source_receipt: Path | None = None,
) -> tuple[int, str, frozenset[tuple[int, ...]]]:
    """Validate the committed packet and replay it from authenticated inputs."""

    repo_root = Path(repo_root).resolve()
    custody_paths = _custody_inputs(package_dir, piqd_journal, source_receipt)
    journal_path = Path(journal_path).absolute()
    sidecar_path = Path(sidecar_path).absolute()
    commit_path = (
        Path(commit_path).absolute()
        if commit_path is not None
        else _commit_path(journal_path)
    )
    if (
        journal_path.parent != sidecar_path.parent
        or commit_path.parent != journal_path.parent
    ):
        raise StructuralSeedError("packet artifacts must be sibling files")
    journal_raw = _authenticated_file_bytes(
        journal_path, limit=16 * 1024 * 1024, label="seed journal"
    )
    sidecar_raw, sidecar = _read_canonical_json_file(
        sidecar_path, label="seed sidecar", limit=8 * 1024 * 1024
    )
    _, commit = _read_canonical_json_file(
        commit_path, label="seed commit marker", limit=1024 * 1024
    )
    _validate_commit(
        commit,
        journal_path=journal_path,
        sidecar_path=sidecar_path,
        journal_raw=journal_raw,
        sidecar_raw=sidecar_raw,
    )
    classifier = load_classifier(Path(classifier_path))
    expected_job, _materialized, job_sha256, discovery_sha256 = (
        _rebuild_authenticated_inputs(
            repo_root, Path(source_job_path), Path(discovery_cnf_path)
        )
    )
    detector_manifest, detector_contract_sha256 = _detector_contract_manifest(repo_root)
    classifier_contract = {
        "label": "classifier_stage_pinned_six_file_contract",
        "stage": "source_classifier",
        "contract": SOURCE_CLASSIFIER_DETECTOR_CONTRACT,
        "files": list(SOURCE_CLASSIFIER_DETECTOR_FILES),
        "sha256": classifier["detector_contract_sha256"],
        "detector_source_manifest": classifier["detector_source_manifest"],
        "executed_byte_provenance": False,
    }
    structural_contract = {
        "label": "current_structural_detector_contract",
        "stage": "current_tagged_structural",
        "contract": DETECTOR_CONTRACT,
        "files": list(DETECTOR_FILES),
        "manifest": detector_manifest,
        "sha256": detector_contract_sha256,
        "executed_byte_provenance": False,
    }
    custody = None
    if custody_paths is not None:
        custody = _validate_custody_bundle(
            repo_root,
            package_dir=custody_paths[0],
            piqd_journal=custody_paths[1],
            source_receipt=custody_paths[2],
            classifier_path=Path(classifier_path),
            source_job_path=Path(source_job_path),
            discovery_cnf_path=Path(discovery_cnf_path),
        )
    expected_sidecar = {
        "schema": SEED_SIDECAR_SCHEMA,
        "journal_schema": RECORD_SCHEMA,
        "journal_sha256": _sha256(journal_raw),
        "record_sha256": sidecar.get("record_sha256"),
        "classifier_sha256": _sha256(_canonical_json_bytes(classifier)),
        "source_model_sha256": classifier["model_sha256"],
        "source_bundle_sha256": classifier["source_bundle_sha256"],
        "source_job_sha256": job_sha256,
        "discovery_cnf_sha256": discovery_sha256,
        "job_sha256": job_sha256,
        "detector_contract_sha256": detector_contract_sha256,
        "classifier_detector_contract": classifier_contract,
        "structural_detector_contract": structural_contract,
        "certificate_sha256": sidecar.get("certificate_sha256"),
        "cell_index": expected_job["cell_index"],
        "scope": SEED_SCOPE,
        "claims": dict(SEED_CLAIMS),
    }
    if custody is not None:
        expected_sidecar["custody"] = custody
        expected_sidecar["claims"] = custody["claims"]
    if sidecar != expected_sidecar:
        raise StructuralSeedError(
            "seed sidecar does not bind authenticated packet inputs"
        )
    temporary = _write_temp_payload(journal_path.parent, journal_path.name, journal_raw)
    try:
        result = _replay_seed_journal_unchecked(
            repo_root,
            temporary,
            job_sha256=job_sha256,
            detector_contract_sha256=detector_contract_sha256,
            cell_index=expected_job["cell_index"],
        )
        count, parent, _clauses = result
        records = journal_raw.splitlines()
        if len(records) != 1:
            raise StructuralSeedError("seed journal must contain exactly one record")
        record = dict(_strict_json(records[0], source="seed journal record"))
        if (
            count != 1
            or parent != record.get("record_sha256")
            or parent != sidecar["record_sha256"]
            or record.get("certificate_sha256") != sidecar["certificate_sha256"]
        ):
            raise StructuralSeedError("seed sidecar record binding failed replay")
        return result
    finally:
        try:
            temporary.unlink()
        except OSError:
            pass


def emit_structural_seed(
    repo_root: Path,
    *,
    classifier_path: Path,
    source_job_path: Path,
    discovery_cnf_path: Path,
    journal_path: Path,
    sidecar_path: Path,
    package_dir: Path | None = None,
    piqd_journal: Path | None = None,
    source_receipt: Path | None = None,
) -> dict[str, Any]:
    """Validate and atomically publish one finite-local structural seed."""

    repo_root = Path(repo_root).resolve()
    custody_paths = _custody_inputs(package_dir, piqd_journal, source_receipt)
    journal_path = Path(journal_path).absolute()
    sidecar_path = Path(sidecar_path).absolute()
    if journal_path.resolve() == sidecar_path.resolve():
        raise StructuralSeedError("journal and sidecar must be distinct files")
    if journal_path.exists() or sidecar_path.exists():
        raise StructuralSeedError("refusing to overwrite an existing seed artifact")
    classifier = load_classifier(Path(classifier_path))
    custody = None
    if custody_paths is not None:
        custody = _validate_custody_bundle(
            repo_root,
            package_dir=custody_paths[0],
            piqd_journal=custody_paths[1],
            source_receipt=custody_paths[2],
            classifier_path=Path(classifier_path),
            source_job_path=Path(source_job_path),
            discovery_cnf_path=Path(discovery_cnf_path),
        )
    source_raw = _authenticated_file_bytes(
        Path(source_job_path), limit=MAX_CLASSIFIER_BYTES, label="source job"
    )
    source_job = _strict_json(source_raw, source="source job")
    if source_job.get("schema") != "p97_rigid221_exact12_full_v14_bound_job.v1":
        raise StructuralSeedError("source job is not the exact12 v14 bound-job schema")
    cell_index = source_job.get("cell_index")
    if isinstance(cell_index, bool) or not isinstance(cell_index, int):
        raise StructuralSeedError("source job cell_index is malformed")
    schedule_manifest = build_manifest(repo_root)
    from census.card_head.exact12_v14_bound_jobs import build_bound_job

    expected_job = build_bound_job(schedule_manifest, repo_root, cell_index)
    if _canonical_json_bytes(source_job) != _canonical_json_bytes(expected_job):
        raise StructuralSeedError("source job differs from the current bound compiler")
    job_sha256 = _sha256_json(expected_job)
    if classifier["source_job_sha256"] != job_sha256:
        raise StructuralSeedError(
            "classifier source_job_sha256 does not match canonical job"
        )

    materialized = instantiate_validated_bound_job(
        expected_job, schedule_manifest, repo_root
    )
    cnf_raw = _authenticated_file_bytes(
        Path(discovery_cnf_path),
        limit=128 * 1024 * 1024,
        label="discovery CNF",
    )
    expected_cnf = materialized.instance.dimacs().encode("ascii")
    if cnf_raw != expected_cnf:
        raise StructuralSeedError("discovery CNF differs from the exact base DIMACS")
    discovery_sha256 = _sha256(cnf_raw)
    if classifier["discovery_cnf_sha256"] != discovery_sha256:
        raise StructuralSeedError(
            "classifier discovery_cnf_sha256 does not match base DIMACS"
        )

    positive = classifier["selected_positive_variables"]
    if not cnf_assignment_satisfies(
        materialized.instance.clauses_with(),
        positive,
        n_variables=materialized.instance.cnf.n_variables,
    ):
        raise StructuralSeedError("selected positive variables do not satisfy base CNF")
    try:
        decoded = materialized.instance.decode_model(positive)
    except (KeyError, TypeError, ValueError) as exc:
        raise StructuralSeedError(
            "selected variables do not decode to a valid cube"
        ) from exc
    cube = _canonical_cube(decoded)
    if cube != classifier["cube"]:
        raise StructuralSeedError(
            "selected variables decode to a different classifier cube"
        )

    certificate = classifier["certificate"]
    if not validate_structural_certificate(certificate, n=12):
        raise StructuralSeedError(
            "classifier certificate failed tagged structural replay"
        )
    detected = detect_structural_certificate(
        {int(center): support for center, support in cube.items()}, n=12
    )
    if detected is None or _canonical_json_bytes(detected) != _canonical_json_bytes(
        certificate
    ):
        raise StructuralSeedError(
            "current structural detector disagrees with classifier certificate"
        )
    try:
        compiled_clause = learned_clause_for_certificate(
            materialized.instance, certificate
        )
        replayed_clause = replay_tagged_cut(
            repo_root,
            materialized.instance,
            cube,
            certificate_kind=STRUCTURAL_CERTIFICATE_KIND,
            certificate_schema=STRUCTURAL_CERTIFICATE_SCHEMA,
            detector_stage=classifier["stage"],
            certificate=certificate,
        )
    except (KeyError, TypeError, ValueError) as exc:
        raise StructuralSeedError("tagged structural clause replay failed") from exc
    if (
        tuple(compiled_clause) != tuple(replayed_clause)
        or list(replayed_clause) != classifier["learned_clause"]
    ):
        raise StructuralSeedError(
            "classifier learned clause differs from tagged replay"
        )

    detector_manifest, detector_contract_sha256 = _detector_contract_manifest(repo_root)
    certificate_sha256 = _sha256_json(certificate)
    cube_sha256 = _sha256_json(cube)
    positive_sha256 = _sha256_json(positive)
    body = {
        "schema": RECORD_SCHEMA,
        "index": 0,
        "parent_sha256": job_sha256,
        "job_sha256": job_sha256,
        "detector_contract_sha256": detector_contract_sha256,
        "cell_index": cell_index,
        "detector_contract": DETECTOR_CONTRACT,
        "certificate_kind": STRUCTURAL_CERTIFICATE_KIND,
        "certificate_schema": STRUCTURAL_CERTIFICATE_SCHEMA,
        "detector_stage": classifier["stage"],
        "certificate": dict(certificate),
        "certificate_sha256": certificate_sha256,
        "source_order_bank_index": None,
        "learned_clause": list(replayed_clause),
        "cube": cube,
        "cube_sha256": cube_sha256,
        "positive_variables": list(positive),
        "assignment_sha256": positive_sha256,
    }
    record = {**body, "record_sha256": _sha256_json(body)}
    journal_raw = _canonical_json_bytes(record) + b"\n"

    journal_path.parent.mkdir(parents=True, exist_ok=True)
    temporary_journal = _write_temp_payload(
        journal_path.parent, journal_path.name, journal_raw
    )
    try:
        count, parent, clauses = _replay_seed_journal_unchecked(
            repo_root,
            temporary_journal,
            job_sha256=job_sha256,
            detector_contract_sha256=detector_contract_sha256,
            cell_index=cell_index,
        )
        if (
            count != 1
            or parent != record["record_sha256"]
            or clauses != {tuple(replayed_clause)}
        ):
            raise StructuralSeedError(
                "independent seed journal replay did not reproduce the cut"
            )
        journal_sha256 = _sha256(journal_raw)
        sidecar = {
            "schema": SEED_SIDECAR_SCHEMA,
            "journal_schema": RECORD_SCHEMA,
            "journal_sha256": journal_sha256,
            "record_sha256": record["record_sha256"],
            "classifier_sha256": _sha256(_canonical_json_bytes(classifier)),
            "source_model_sha256": classifier["model_sha256"],
            "source_bundle_sha256": classifier["source_bundle_sha256"],
            "source_job_sha256": job_sha256,
            "discovery_cnf_sha256": discovery_sha256,
            "job_sha256": job_sha256,
            "detector_contract_sha256": detector_contract_sha256,
            "classifier_detector_contract": {
                "label": "classifier_stage_pinned_six_file_contract",
                "stage": "source_classifier",
                "contract": SOURCE_CLASSIFIER_DETECTOR_CONTRACT,
                "files": list(SOURCE_CLASSIFIER_DETECTOR_FILES),
                "sha256": classifier["detector_contract_sha256"],
                "detector_source_manifest": classifier["detector_source_manifest"],
                "executed_byte_provenance": False,
            },
            "structural_detector_contract": {
                "label": "current_structural_detector_contract",
                "stage": "current_tagged_structural",
                "contract": DETECTOR_CONTRACT,
                "files": list(DETECTOR_FILES),
                "manifest": detector_manifest,
                "sha256": detector_contract_sha256,
                "executed_byte_provenance": False,
            },
            "certificate_sha256": certificate_sha256,
            "cell_index": cell_index,
            "scope": SEED_SCOPE,
            "claims": dict(SEED_CLAIMS),
        }
        if custody is not None:
            sidecar["custody"] = custody
            sidecar["claims"] = custody["claims"]
        sidecar_raw = _canonical_json_bytes(sidecar) + b"\n"
        _publish_packet(journal_path, sidecar_path, journal_raw, sidecar_raw)
        return sidecar
    finally:
        try:
            temporary_journal.unlink()
        except OSError:
            pass


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--classifier", type=Path, required=True)
    parser.add_argument("--source-job", type=Path, required=True)
    parser.add_argument("--discovery-cnf", type=Path, required=True)
    parser.add_argument("--journal", type=Path, required=True)
    parser.add_argument("--sidecar", type=Path, required=True)
    parser.add_argument("--package-dir", type=Path)
    parser.add_argument("--piqd-journal", type=Path)
    parser.add_argument("--source-receipt", type=Path)
    return parser


def main(argv: list[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        sidecar = emit_structural_seed(
            args.repo_root,
            classifier_path=args.classifier,
            source_job_path=args.source_job,
            discovery_cnf_path=args.discovery_cnf,
            journal_path=args.journal,
            sidecar_path=args.sidecar,
            package_dir=args.package_dir,
            piqd_journal=args.piqd_journal,
            source_receipt=args.source_receipt,
        )
    except (OSError, StructuralSeedError, TypeError, ValueError) as exc:
        print(f"phase3_piqd_structural_seed: {exc}", file=os.sys.stderr)
        return 2
    print(_canonical_json_bytes(sidecar).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
