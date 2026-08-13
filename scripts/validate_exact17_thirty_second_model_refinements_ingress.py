"""Validate immutable PIQD ingress for the exact-17 child33 root."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

from export_exact17_thirty_third_root import PRODUCTION_PATHS, ExportPaths
from validate_exact17_thirty_second_model_refinements_export import (
    PRODUCTION_SPEC,
    ExportSpec,
    UnprovisionedError,
    sha256_file,
    strict_object,
    validate_export,
)

ROOT = Path(__file__).resolve().parents[1]
SCHEMA = "p97-exact17-thirty-second-model-refinements-piqd-ingress/v2"
RECEIPT_SCHEMA = "p97-exact17-child33-immutable-export-receipt/v1"


@dataclass(frozen=True)
class IngressPaths:
    export: ExportPaths
    parent_manifest: Path
    daemon_build_receipt: Path
    manifest: Path


@dataclass(frozen=True)
class IngressSpec:
    export: ExportSpec
    parent_manifest_sha256: str | None
    daemon_sha256: str | None = None
    daemon_source_commit: str | None = None
    daemon_build_receipt_sha256: str | None = None
    daemon_protocol_version: int | None = None
    solver_name: str | None = None
    solver_sha256: str | None = None
    solver_signature: str | None = None
    backend: str = "cadical"
    solver_profile: str = "sat"

    @property
    def provisioned(self) -> bool:
        return (
            self.export.provisioned
            and self.parent_manifest_sha256 is not None
            and self.daemon_sha256 is not None
            and self.daemon_source_commit is not None
            and self.daemon_build_receipt_sha256 is not None
            and self.daemon_protocol_version is not None
            and self.solver_name is not None
            and self.solver_sha256 is not None
            and self.solver_signature is not None
        )


PRODUCTION_INGRESS_PATHS = IngressPaths(
    export=PRODUCTION_PATHS,
    parent_manifest=ROOT
    / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-first-model-refinements-core1.json",
    daemon_build_receipt=Path(
        "/Users/adam/projects/rustprojects/piqd/build-receipts/"
        "6de2ea93b551b85839e2e610c622861461e16adb.txt"
    ),
    manifest=ROOT
    / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-second-model-refinements-core1.json",
)
PRODUCTION_INGRESS_SPEC = IngressSpec(
    export=PRODUCTION_SPEC,
    parent_manifest_sha256="3f7f043c81ffbedb34def0621a5ac84b363e6e492a7315b270678568dbd035f8",
    daemon_sha256="680764249cbeb9ca4b8478ffb26e517c7427adddb1114a2ca6c46a3a88038dec",
    daemon_source_commit="6de2ea93b551b85839e2e610c622861461e16adb",
    daemon_build_receipt_sha256="3738cf1a97e1f916c0cc7706b0454f3dd8532986b0ec15f4341248fdbd39d73b",
    daemon_protocol_version=1,
    solver_name="piqd-satworker-cadical-3.0.0",
    solver_sha256="0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
    solver_signature="cadical-3.0.0",
)


def _immutable_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("x", encoding="utf-8") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    directory_fd = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(directory_fd)
    finally:
        os.close(directory_fd)


def strict_json_read(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=strict_object)
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def _exact_path(record: dict[str, Any], expected: Path, label: str) -> None:
    if record.get("path") != str(expected.resolve()):
        raise ValueError(f"wrong {label} path")


def _check_hash_record(record: dict[str, Any], expected: Path, label: str) -> None:
    _exact_path(record, expected, label)
    if record.get("sha256") != _stable_sha256_file(expected):
        raise ValueError(f"{label} SHA-256 drifted")


def _check_daemon_build_receipt(
    paths: IngressPaths, spec: IngressSpec
) -> dict[str, str]:
    if spec.daemon_build_receipt_sha256 is None:
        raise UnprovisionedError("child33 PIQD build receipt SHA-256 is not pinned")
    actual_sha256 = _stable_sha256_file(paths.daemon_build_receipt)
    if actual_sha256 != spec.daemon_build_receipt_sha256:
        raise ValueError("child33 PIQD build receipt SHA-256 drifted")
    return {
        "path": str(paths.daemon_build_receipt.resolve()),
        "sha256": actual_sha256,
    }


def _stable_sha256_file(path: Path) -> str:
    """Hash one regular file while rejecting replacement or metadata races."""
    before_path = os.lstat(path)
    descriptor = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    try:
        before_fd = os.fstat(descriptor)
        _require_regular_same_file(before_path, before_fd, path)
        digest = hashlib.sha256()
        while True:
            block = os.read(descriptor, 1024 * 1024)
            if not block:
                break
            digest.update(block)
        after_fd = os.fstat(descriptor)
        after_path = os.lstat(path)
        _require_regular_same_file(after_path, after_fd, path)
        if _file_identity(before_fd) != _file_identity(after_fd) or _file_identity(before_fd) != _file_identity(after_path):
            raise ValueError(f"{path} changed while hashing")
        return digest.hexdigest()
    finally:
        os.close(descriptor)


def _file_identity(metadata: os.stat_result) -> tuple[int, ...]:
    return (
        metadata.st_dev,
        metadata.st_ino,
        metadata.st_mode,
        metadata.st_nlink,
        metadata.st_size,
        metadata.st_mtime_ns,
        metadata.st_ctime_ns,
    )


def _require_regular_same_file(
    path_metadata: os.stat_result, fd_metadata: os.stat_result, path: Path
) -> None:
    if not stat.S_ISREG(path_metadata.st_mode) or not stat.S_ISREG(fd_metadata.st_mode):
        raise ValueError(f"{path} is not a regular file")
    if _file_identity(path_metadata) != _file_identity(fd_metadata):
        raise ValueError(f"{path} changed during hash setup")


def _check_receipt(paths: IngressPaths, spec: IngressSpec) -> dict[str, Any]:
    receipt = strict_json_read(paths.export.receipt)
    expected_receipt_fields = {
        "schema", "status", "publication_state", "immutability", "parent", "child",
        "lean", "source_modules", "validation",
    }
    if set(receipt) != expected_receipt_fields:
        raise ValueError("child33 receipt schema drifted")
    if receipt.get("schema") != RECEIPT_SCHEMA or receipt.get("status") != "PASS":
        raise ValueError("child33 export receipt is not a PASS publication")
    if receipt.get("publication_state") != "PROVISIONED":
        raise ValueError("child33 export receipt is not provisioned")
    if receipt.get("immutability") != "exclusive-hard-link-and-exclusive-receipt/v1":
        raise ValueError("child33 receipt lacks immutable-publication policy")
    expected_parent = {
        "path": str(paths.export.parent.resolve()),
        "sha256": spec.export.parent_sha256,
    }
    if receipt.get("parent") != expected_parent:
        raise ValueError("child33 receipt parent identity drifted")
    expected_child = {
        "path": str(paths.export.child.resolve()),
        "sha256": spec.export.child_sha256,
        "bytes": spec.export.child_bytes,
        "variables": spec.export.variables,
        "clauses": spec.export.child_clauses,
    }
    if receipt.get("child") != expected_child:
        raise ValueError("child33 receipt child identity drifted")
    lean = receipt.get("lean")
    if not isinstance(lean, dict) or set(lean) != {"root", "export"}:
        raise ValueError("child33 receipt Lean identity is malformed")
    _check_hash_record(lean["root"], paths.export.lean_root, "Lean child33 root")
    _check_hash_record(lean["export"], paths.export.lean_export, "Lean child33 exporter")
    expected_sources = {
        "two_circle": {
            "path": str(Path(spec.export.two_circle_path).resolve()),
            "sha256": spec.export.two_circle_sha256,
        },
        "kalmanson": {
            "path": str(Path(spec.export.kalmanson_path).resolve()),
            "sha256": spec.export.kalmanson_sha256,
        },
    }
    if receipt["source_modules"] != expected_sources:
        raise ValueError("child33 source module structure drifted")
    for name in expected_sources:
        source_path = getattr(paths.export, name)
        if source_path is None:
            raise ValueError(f"child33 {name} source path is missing")
        _check_hash_record(receipt["source_modules"][name], source_path, f"child33 {name}")
    regenerated = validate_export(paths.export.parent, paths.export.child, spec=spec.export)
    if regenerated != receipt.get("validation"):
        raise ValueError("child33 receipt validation replay drifted")
    return receipt


def _manifest_payload(
    paths: IngressPaths,
    spec: IngressSpec,
    validation: dict[str, Any],
) -> dict[str, Any]:
    receipt = _check_receipt(paths, spec)
    daemon_build_receipt = _check_daemon_build_receipt(paths, spec)
    return {
        "schema": SCHEMA,
        "status": "PASS",
        "dimacs": {
            "path": str(paths.export.child.resolve()),
            "sha256": spec.export.child_sha256,
            "bytes": spec.export.child_bytes,
            "variables": spec.export.variables,
            "clauses": spec.export.child_clauses,
            "parent_prefix_clauses": spec.export.parent_clauses,
            "checked_new_clauses": spec.export.new_clauses,
        },
        "parent_ingress": {
            "path": str(paths.parent_manifest.resolve()),
            "sha256": spec.parent_manifest_sha256,
            "parent_dimacs_sha256": spec.export.parent_sha256,
        },
        "export_receipt": {
            "path": str(paths.export.receipt.resolve()),
            "sha256": sha256_file(paths.export.receipt),
            "schema": receipt["schema"],
        },
        "lean": receipt["lean"],
        "source_modules": receipt["source_modules"],
        "validation": validation,
        "piqd": {
            "ingress": "raw-dimacs/v1",
            "daemon_sha256": spec.daemon_sha256,
            "daemon_source_commit": spec.daemon_source_commit,
            "daemon_build_receipt": daemon_build_receipt,
            "daemon_protocol_version": spec.daemon_protocol_version,
            "solver_name": spec.solver_name,
            "solver_sha256": spec.solver_sha256,
            "solver_signature": spec.solver_signature,
            "backend": spec.backend,
            "solver_profile": spec.solver_profile,
            "immutable_root_only": True,
            "stale_job_reuse_allowed": False,
            "python_authored_successor_clause_allowed": False,
        },
    }


def validate_ingress(
    paths: IngressPaths = PRODUCTION_INGRESS_PATHS,
    *,
    spec: IngressSpec = PRODUCTION_INGRESS_SPEC,
    expected_manifest_sha256: str | None = None,
) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError(
            "child33 PIQD ingress is UNPROVISIONED: daemon identity is not accepted"
        )
    manifest = strict_json_read(paths.manifest)
    expected_fields = {
        "schema", "status", "dimacs", "parent_ingress", "export_receipt",
        "lean", "source_modules", "validation", "piqd",
    }
    if set(manifest) != expected_fields:
        raise ValueError("wrong child33 ingress fields")
    if manifest["schema"] != SCHEMA or manifest["status"] != "PASS":
        raise ValueError("child33 ingress is not a PASS publication")
    manifest_sha256 = sha256_file(paths.manifest)
    if expected_manifest_sha256 is not None and manifest_sha256 != expected_manifest_sha256:
        raise ValueError("child33 ingress manifest SHA-256 drifted")
    dimacs = manifest["dimacs"]
    if dimacs != {
        "path": str(paths.export.child.resolve()),
        "sha256": spec.export.child_sha256,
        "bytes": spec.export.child_bytes,
        "variables": spec.export.variables,
        "clauses": spec.export.child_clauses,
        "parent_prefix_clauses": spec.export.parent_clauses,
        "checked_new_clauses": spec.export.new_clauses,
    }:
        raise ValueError("child33 DIMACS identity drifted")
    _check_hash_record(manifest["parent_ingress"], paths.parent_manifest, "parent ingress")
    if manifest["parent_ingress"].get("parent_dimacs_sha256") != spec.export.parent_sha256:
        raise ValueError("child32 parent SHA-256 drifted")
    receipt = _check_receipt(paths, spec)
    receipt_record = manifest["export_receipt"]
    if receipt_record != {
        "path": str(paths.export.receipt.resolve()),
        "sha256": sha256_file(paths.export.receipt),
        "schema": receipt["schema"],
    }:
        raise ValueError("child33 receipt identity drifted in ingress")
    if (
        manifest["lean"] != receipt["lean"]
        or manifest["source_modules"] != receipt["source_modules"]
        or manifest["validation"] != receipt["validation"]
    ):
        raise ValueError("child33 receipt data drifted in ingress")
    expected_piqd = {
        "ingress": "raw-dimacs/v1",
        "daemon_sha256": spec.daemon_sha256,
        "daemon_source_commit": spec.daemon_source_commit,
        "daemon_build_receipt": _check_daemon_build_receipt(paths, spec),
        "daemon_protocol_version": spec.daemon_protocol_version,
        "solver_name": spec.solver_name,
        "solver_sha256": spec.solver_sha256,
        "solver_signature": spec.solver_signature,
        "backend": spec.backend,
        "solver_profile": spec.solver_profile,
        "immutable_root_only": True,
        "stale_job_reuse_allowed": False,
        "python_authored_successor_clause_allowed": False,
    }
    if manifest["piqd"] != expected_piqd:
        raise ValueError("child33 PIQD ingress identity or policy drifted")
    return {
        "schema": "p97-exact17-child33-piqd-ingress-validation/v1",
        "status": "PASS",
        "manifest_sha256": manifest_sha256,
        "dimacs_sha256": spec.export.child_sha256,
        "dimacs_bytes": spec.export.child_bytes,
        "variables": spec.export.variables,
        "clauses": spec.export.child_clauses,
        "new_clauses": spec.export.new_clauses,
        "parent_dimacs_sha256": spec.export.parent_sha256,
        "export_receipt_sha256": sha256_file(paths.export.receipt),
        "piqd_daemon_sha256": spec.daemon_sha256,
        "piqd_daemon_source_commit": spec.daemon_source_commit,
        "piqd_daemon_build_receipt_sha256": spec.daemon_build_receipt_sha256,
        "piqd_solver_sha256": spec.solver_sha256,
    }


def emit_ingress(
    paths: IngressPaths = PRODUCTION_INGRESS_PATHS,
    *,
    spec: IngressSpec = PRODUCTION_INGRESS_SPEC,
) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError(
            "child33 PIQD ingress is UNPROVISIONED: daemon identity is not accepted"
        )
    if not paths.parent_manifest.is_file():
        raise FileNotFoundError(paths.parent_manifest)
    if sha256_file(paths.parent_manifest) != spec.parent_manifest_sha256:
        raise ValueError("child32 parent ingress manifest hash drifted")
    validation = validate_export(paths.export.parent, paths.export.child, spec=spec.export)
    payload = _manifest_payload(paths, spec, validation)
    _immutable_json(paths.manifest, payload)
    return payload


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("emit", "validate"))
    parser.add_argument("--manifest", type=Path, default=PRODUCTION_INGRESS_PATHS.manifest)
    parser.add_argument("--expected-manifest-sha256")
    args = parser.parse_args()
    paths = replace(PRODUCTION_INGRESS_PATHS, manifest=args.manifest.resolve())
    payload = (
        emit_ingress(paths)
        if args.command == "emit"
        else validate_ingress(paths, expected_manifest_sha256=args.expected_manifest_sha256)
    )
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
