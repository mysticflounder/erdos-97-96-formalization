"""Validate and emit the immutable PIQD ingress for exact-17 Child37."""

from __future__ import annotations

import argparse
import json
import os
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

from export_exact17_thirty_seventh_root import PRODUCTION_PATHS, ExportPaths
from validate_exact17_thirty_sixth_model_refinements_export import (
    PRODUCTION_SPEC,
    ExportSpec,
    UnprovisionedError,
    sha256_file,
    strict_object,
    validate_export,
)

ROOT = Path(__file__).resolve().parents[1]
SCHEMA = "p97-exact17-thirty-sixth-model-refinements-piqd-ingress/v1"
PARENT_MANIFEST = ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-fifth-model-refinements-core1.json"
MANIFEST = ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-sixth-model-refinements-core1.json"
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
        return self.export.provisioned and self.parent_manifest_sha256 is not None and all(x is not None for x in (self.daemon_sha256, self.daemon_source_commit, self.daemon_build_receipt_sha256, self.daemon_protocol_version, self.solver_name, self.solver_sha256, self.solver_signature))


PRODUCTION_INGRESS_PATHS = IngressPaths(PRODUCTION_PATHS)
PRODUCTION_INGRESS_SPEC = IngressSpec(PRODUCTION_SPEC, "65a4a829a6d17629afc72aeb51bc1acdec21e8d7c474f909ed9cbbf0ecc55dea")


def _read(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=strict_object)
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def _immutable_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("x", encoding="utf-8") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    descriptor = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _file(path: Path) -> dict[str, str]:
    return {"path": str(path.resolve()), "sha256": sha256_file(path)}


def _payload(paths: IngressPaths, spec: IngressSpec, validation: dict[str, Any]) -> dict[str, Any]:
    receipt = _read(paths.export.receipt)
    if receipt.get("schema") != "p97-exact17-child37-immutable-export-receipt/v1" or receipt.get("status") != "PASS" or receipt.get("publication_state") != "PROVISIONED":
        raise ValueError("child37 receipt schema/status drifted")
    if receipt.get("child") != {"path": str(paths.export.child.resolve()), "sha256": spec.export.child_sha256, "bytes": spec.export.child_bytes, "variables": spec.export.variables, "clauses": spec.export.child_clauses}:
        raise ValueError("child37 receipt child identity drifted")
    if receipt.get("validation") != validation:
        raise ValueError("child37 receipt validation drifted")
    return {"schema": SCHEMA, "status": "PASS", "dimacs": {"path": str(paths.export.child.resolve()), "sha256": spec.export.child_sha256, "bytes": spec.export.child_bytes, "variables": spec.export.variables, "clauses": spec.export.child_clauses, "parent_prefix_clauses": spec.export.parent_clauses, "checked_new_clauses": spec.export.new_clauses}, "parent_ingress": {"path": str(paths.parent_manifest.resolve()), "sha256": spec.parent_manifest_sha256, "parent_dimacs_sha256": spec.export.parent_sha256}, "export_receipt": _file(paths.export.receipt), "lean": {"root": _file(paths.export.lean_root), "export": _file(paths.export.lean_export)}, "source_modules": ["BlockerVExactSeventeenThirtySixthModelRefinements", "BlockerVExactSeventeenThirtySixthModelRefinementsExport"], "validation": validation, "piqd": {"ingress": "raw-dimacs/v1", "daemon_sha256": spec.daemon_sha256, "daemon_source_commit": spec.daemon_source_commit, "daemon_build_receipt": _file(paths.daemon_build_receipt), "daemon_protocol_version": spec.daemon_protocol_version, "solver_name": spec.solver_name, "solver_sha256": spec.solver_sha256, "solver_signature": spec.solver_signature, "backend": spec.backend, "solver_profile": spec.solver_profile, "immutable_root_only": True, "stale_job_reuse_allowed": False, "python_authored_successor_clause_allowed": False}}


def validate_ingress(paths: IngressPaths = PRODUCTION_INGRESS_PATHS, *, spec: IngressSpec = PRODUCTION_INGRESS_SPEC, expected_manifest_sha256: str | None = None) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("child37 PIQD ingress is UNPROVISIONED")
    if sha256_file(paths.parent_manifest) != spec.parent_manifest_sha256:
        raise ValueError("child36 parent ingress hash drifted")
    validation = validate_export(paths.export.parent, paths.export.child, paths.export.model, spec=spec.export)
    manifest = _read(paths.manifest)
    if manifest != _payload(paths, spec, validation):
        raise ValueError("child37 ingress content drifted")
    digest = sha256_file(paths.manifest)
    if expected_manifest_sha256 is not None and digest != expected_manifest_sha256:
        raise ValueError("child37 manifest SHA-256 drifted")
    return {"schema": "p97-exact17-child37-piqd-ingress-validation/v1", "status": "PASS", "manifest_sha256": digest, "dimacs_sha256": spec.export.child_sha256, "dimacs_bytes": spec.export.child_bytes, "variables": spec.export.variables, "clauses": spec.export.child_clauses, "new_clauses": spec.export.new_clauses, "parent_dimacs_sha256": spec.export.parent_sha256, "export_receipt_sha256": sha256_file(paths.export.receipt), "piqd_daemon_sha256": spec.daemon_sha256, "piqd_solver_sha256": spec.solver_sha256}


def emit_ingress(paths: IngressPaths = PRODUCTION_INGRESS_PATHS, *, spec: IngressSpec = PRODUCTION_INGRESS_SPEC) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("child37 PIQD ingress is UNPROVISIONED")
    validation = validate_export(paths.export.parent, paths.export.child, paths.export.model, spec=spec.export)
    payload = _payload(paths, spec, validation)
    _immutable_json(paths.manifest, payload)
    return payload


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("emit", "validate"))
    parser.add_argument("--manifest", type=Path, default=MANIFEST)
    args = parser.parse_args()
    paths = replace(PRODUCTION_INGRESS_PATHS, manifest=args.manifest.resolve())
    print(json.dumps(emit_ingress(paths) if args.command == "emit" else validate_ingress(paths), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
