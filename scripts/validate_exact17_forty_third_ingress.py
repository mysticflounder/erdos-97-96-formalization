"""Fail-closed immutable PIQD ingress for exact-17 Child43."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

from export_exact17_forty_third_root import PRODUCTION_PATHS, ExportPaths
from validate_exact17_forty_third_wave_export import (
    PRODUCTION_SPEC,
    ExportSpec,
    UnprovisionedError,
    read_stable_bytes,
    sha256_file,
    strict_object,
    validate_export,
)

ROOT = Path(__file__).resolve().parents[1]
SCHEMA = "p97-exact17-forty-third-model-refinements-piqd-ingress/v1"
RECEIPT_SCHEMA = "p97-exact17-child43-immutable-export-receipt/v1"
PARENT_MANIFEST = ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-forty-second-model-refinements-core1.json"
MANIFEST = ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-forty-third-model-refinements-core1.json"
MANIFEST_SHA256: str | None = "6805434e1cf96526d93d4fc2eb291e1cab9ac6b7cc9417b5010c8f8a1b038171"
DAEMON_RECEIPT = ROOT / "scratch/exact17-lean-to-sat/piqd-child35-daemon-build-receipt.txt"


@dataclass(frozen=True)
class IngressPaths:
    export: ExportPaths
    parent_manifest: Path = PARENT_MANIFEST
    daemon_build_receipt: Path = DAEMON_RECEIPT
    manifest: Path = MANIFEST


@dataclass(frozen=True)
class IngressSpec:
    export: ExportSpec
    parent_manifest_sha256: str | None
    daemon_sha256: str | None = "f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089"
    daemon_source_commit: str | None = "acefb4aba14765d45e38ac4193373f0aa210f22d"
    daemon_build_receipt_sha256: str | None = "6e9c1d5c203d59ac2b29f800d73f4dbb0395b97865433f412ff4aa44c8e1b0a9"
    daemon_protocol_version: int | None = 1
    solver_name: str | None = "piqd-satworker-cadical-3.0.0"
    solver_sha256: str | None = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
    solver_signature: str | None = "cadical-3.0.0"
    backend: str = "cadical"
    solver_profile: str = "sat"

    @property
    def provisioned(self) -> bool:
        return self.export.provisioned and self.parent_manifest_sha256 is not None and all(
            value is not None
            for value in (
                self.daemon_sha256,
                self.daemon_source_commit,
                self.daemon_build_receipt_sha256,
                self.daemon_protocol_version,
                self.solver_name,
                self.solver_sha256,
                self.solver_signature,
            )
        )


PRODUCTION_INGRESS_PATHS = IngressPaths(PRODUCTION_PATHS)
PRODUCTION_INGRESS_SPEC = IngressSpec(
    PRODUCTION_SPEC,
    "8df92c533959f8717b2d897756d5c668e95f6adf9bb7bdca6eb5d8ee7ef758e4",
)


def _read_snapshot(path: Path) -> tuple[dict[str, Any], str]:
    raw = read_stable_bytes(path)
    value = json.loads(raw, object_pairs_hook=strict_object)
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value, hashlib.sha256(raw).hexdigest()


def _read(path: Path) -> dict[str, Any]:
    return _read_snapshot(path)[0]


def _file(path: Path) -> dict[str, str]:
    return {"path": str(path.resolve()), "sha256": sha256_file(path)}


def _check_file(record: object, path: Path, label: str, expected_sha256: str | None = None) -> None:
    actual = sha256_file(path)
    if (
        not isinstance(record, dict)
        or set(record) != {"path", "sha256"}
        or record["path"] != str(path.resolve())
        or record["sha256"] != actual
        or (expected_sha256 is not None and actual != expected_sha256)
    ):
        raise ValueError(f"{label} identity drifted")


def _check_receipt(
    paths: IngressPaths, spec: IngressSpec, validation: dict[str, Any]
) -> tuple[dict[str, Any], str]:
    receipt, digest = _read_snapshot(paths.export.receipt)
    if (
        set(receipt)
        != {"schema", "status", "publication_state", "parent", "model", "lean", "child", "validation", "immutability"}
        or receipt.get("schema") != RECEIPT_SCHEMA
        or receipt.get("status") != "PASS"
        or receipt.get("publication_state") != "PROVISIONED"
    ):
        raise ValueError("child43 receipt schema/status drifted")
    _check_file(receipt.get("parent"), paths.export.parent, "parent", spec.export.parent_sha256)
    _check_file(receipt.get("model"), paths.export.model, "model", spec.export.model_sha256)
    lean = receipt.get("lean")
    if not isinstance(lean, dict) or set(lean) != {"root", "export"}:
        raise ValueError("child43 Lean receipt shape drifted")
    _check_file(lean["root"], paths.export.lean_root, "Lean root", spec.export.lean_root_sha256)
    _check_file(lean["export"], paths.export.lean_export, "Lean export", spec.export.lean_export_sha256)
    if receipt.get("child") != {
        "path": str(paths.export.child.resolve()),
        "sha256": spec.export.child_sha256,
        "bytes": spec.export.child_bytes,
        "variables": spec.export.variables,
        "clauses": spec.export.child_clauses,
    }:
        raise ValueError("child43 receipt child identity drifted")
    if receipt.get("validation") != validation:
        raise ValueError("child43 receipt validation drifted")
    if receipt.get("immutability") != "exclusive-hard-link-and-ledger-last-receipt/v2":
        raise ValueError("child43 receipt immutability policy drifted")
    return receipt, digest


def _daemon_record(paths: IngressPaths, spec: IngressSpec) -> dict[str, str]:
    if spec.daemon_build_receipt_sha256 is None:
        raise UnprovisionedError("child43 daemon receipt is unpinned")
    record = _file(paths.daemon_build_receipt)
    if record["sha256"] != spec.daemon_build_receipt_sha256:
        raise ValueError("daemon build receipt hash drifted")
    return record


def _immutable_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, name = tempfile.mkstemp(prefix=f".{path.name}.", suffix=".candidate", dir=path.parent)
    candidate = Path(name)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            json.dump(payload, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.link(candidate, path, follow_symlinks=False)
        descriptor = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
    finally:
        candidate.unlink(missing_ok=True)


def _is_sha256(value: object) -> bool:
    return (
        type(value) is str
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def validate_ingress(paths: IngressPaths = PRODUCTION_INGRESS_PATHS, *, spec: IngressSpec = PRODUCTION_INGRESS_SPEC, expected_manifest_sha256: str | None = None) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("child43 PIQD ingress is UNPROVISIONED")
    if (
        not paths.export.child.is_file()
        or not paths.export.receipt.is_file()
        or not paths.manifest.is_file()
    ):
        raise UnprovisionedError("child43 PIQD ingress is UNPROVISIONED")
    if expected_manifest_sha256 is not None and not _is_sha256(expected_manifest_sha256):
        raise ValueError("child43 explicit manifest SHA-256 pin is malformed")
    if MANIFEST_SHA256 is not None and not _is_sha256(MANIFEST_SHA256):
        raise ValueError("child43 configured manifest SHA-256 pin is malformed")
    pinned_manifest_sha256 = (
        expected_manifest_sha256
        if expected_manifest_sha256 is not None
        else MANIFEST_SHA256
    )
    if pinned_manifest_sha256 is None:
        raise UnprovisionedError("child43 manifest SHA-256 is unpinned")
    if (
        expected_manifest_sha256 is not None
        and MANIFEST_SHA256 is not None
        and expected_manifest_sha256 != MANIFEST_SHA256
    ):
        raise ValueError("child43 manifest pin arguments disagree")
    if sha256_file(paths.parent_manifest) != spec.parent_manifest_sha256:
        raise ValueError("child42 parent ingress hash drifted")
    validation = validate_export(paths.export.parent, paths.export.child, paths.export.model, spec=spec.export)
    manifest, digest = _read_snapshot(paths.manifest)
    if digest != pinned_manifest_sha256:
        raise ValueError("child43 manifest SHA-256 drifted")
    if manifest != emit_payload(paths, spec, validation):
        raise ValueError("child43 ingress content drifted")
    return {"schema": SCHEMA, "status": "PASS", "manifest_sha256": digest, "dimacs_sha256": spec.export.child_sha256, "dimacs_bytes": spec.export.child_bytes, "variables": spec.export.variables, "clauses": spec.export.child_clauses, "new_clauses": spec.export.new_clauses, "parent_dimacs_sha256": spec.export.parent_sha256, "validation": validation}


def emit_payload(paths: IngressPaths, spec: IngressSpec, validation: dict[str, Any]) -> dict[str, Any]:
    receipt, receipt_sha256 = _check_receipt(paths, spec, validation)
    return {
        "schema": SCHEMA,
        "status": "PASS",
        "dimacs": {"path": str(paths.export.child.resolve()), "sha256": spec.export.child_sha256, "bytes": spec.export.child_bytes, "variables": spec.export.variables, "clauses": spec.export.child_clauses, "parent_prefix_clauses": spec.export.parent_clauses, "checked_new_clauses": spec.export.new_clauses},
        "parent_ingress": {"path": str(paths.parent_manifest.resolve()), "sha256": spec.parent_manifest_sha256, "parent_dimacs_sha256": spec.export.parent_sha256},
        "export_receipt": {"path": str(paths.export.receipt.resolve()), "sha256": receipt_sha256, "schema": receipt["schema"]},
        "lean": receipt["lean"],
        "model": receipt["model"],
        "validation": validation,
        "piqd": {"ingress": "raw-dimacs/v1", "daemon_sha256": spec.daemon_sha256, "daemon_source_commit": spec.daemon_source_commit, "daemon_build_receipt": _daemon_record(paths, spec), "daemon_protocol_version": spec.daemon_protocol_version, "solver_name": spec.solver_name, "solver_sha256": spec.solver_sha256, "solver_signature": spec.solver_signature, "backend": spec.backend, "solver_profile": spec.solver_profile, "immutable_root_only": True, "stale_job_reuse_allowed": False, "python_authored_successor_clause_allowed": False},
    }


def emit_ingress(paths: IngressPaths = PRODUCTION_INGRESS_PATHS, *, spec: IngressSpec = PRODUCTION_INGRESS_SPEC) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("child43 PIQD ingress is UNPROVISIONED")
    if sha256_file(paths.parent_manifest) != spec.parent_manifest_sha256:
        raise ValueError("child42 parent ingress hash drifted")
    validation = validate_export(paths.export.parent, paths.export.child, paths.export.model, spec=spec.export)
    payload = emit_payload(paths, spec, validation)
    _immutable_json(paths.manifest, payload)
    return payload


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("emit", "validate"))
    parser.add_argument("--manifest", type=Path, default=MANIFEST)
    args = parser.parse_args()
    paths = replace(PRODUCTION_INGRESS_PATHS, manifest=args.manifest.resolve())
    payload = emit_ingress(paths) if args.command == "emit" else validate_ingress(paths)
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
