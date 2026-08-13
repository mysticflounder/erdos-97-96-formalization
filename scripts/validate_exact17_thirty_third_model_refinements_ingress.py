"""Validate exact-17 child34 ingress after a fresh PIQD daemon is pinned.

The immutable child34 export is provisioned independently.  Production PIQD
ingress remains deliberately unprovisioned until the post-fix daemon build and
solver identities are supplied below.
"""

from __future__ import annotations

import argparse
import json
import os
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

from export_exact17_thirty_fourth_root import PRODUCTION_PATHS, ExportPaths
from validate_exact17_thirty_third_model_refinements_export import (
    PRODUCTION_SPEC,
    ExportSpec,
    UnprovisionedError,
    sha256_file,
    strict_object,
    validate_export,
)

ROOT = Path(__file__).resolve().parents[1]
SCHEMA = "p97-exact17-thirty-third-model-refinements-piqd-ingress/v1"
RECEIPT_SCHEMA = "p97-exact17-child34-immutable-export-receipt/v1"


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
        return self.export.fully_authenticated and all(x is not None for x in (self.parent_manifest_sha256, self.daemon_sha256, self.daemon_source_commit, self.daemon_build_receipt_sha256, self.daemon_protocol_version, self.solver_name, self.solver_sha256, self.solver_signature))


PRODUCTION_INGRESS_PATHS = IngressPaths(
    export=PRODUCTION_PATHS,
    parent_manifest=ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-second-model-refinements-core1.json",
    daemon_build_receipt=ROOT / "scratch/exact17-lean-to-sat/piqd-child34-daemon-build-receipt.txt",
    manifest=ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-third-model-refinements-core1.json",
)
PRODUCTION_INGRESS_SPEC = IngressSpec(
    export=PRODUCTION_SPEC,
    parent_manifest_sha256="1f802e69fc382ba262cb54a9b21bee3b62b4c53cf6cbfaff837181cd9444fcfd",
    daemon_sha256=None,
    daemon_source_commit=None,
    daemon_build_receipt_sha256=None,
    daemon_protocol_version=None,
    solver_name=None,
    solver_sha256=None,
    solver_signature=None,
)


def strict_json_read(path: Path) -> dict[str, Any]:
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
    fd = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)


def _check_file(record: object, path: Path, label: str, expected_sha256: str | None = None) -> None:
    actual = sha256_file(path)
    if not isinstance(record, dict) or set(record) != {"path", "sha256"} or record["path"] != str(path.resolve()) or record["sha256"] != actual or (expected_sha256 is not None and actual != expected_sha256):
        raise ValueError(f"{label} identity drifted")


def _check_receipt(paths: IngressPaths, spec: IngressSpec) -> dict[str, Any]:
    receipt = strict_json_read(paths.export.receipt)
    expected = {"schema", "status", "publication_state", "parent", "lean", "source_modules", "child", "validation", "immutability"}
    if set(receipt) != expected or receipt.get("schema") != RECEIPT_SCHEMA or receipt.get("status") != "PASS" or receipt.get("publication_state") != "PROVISIONED":
        raise ValueError("child34 receipt schema/status drifted")
    _check_file(receipt.get("parent"), paths.export.parent, "parent", spec.export.parent_sha256)
    _check_file(receipt.get("lean", {}).get("root"), paths.export.lean_root, "Lean root", spec.export.lean_root_sha256)
    _check_file(receipt.get("lean", {}).get("export"), paths.export.lean_export, "Lean export", spec.export.lean_export_sha256)
    _check_file(receipt.get("source_modules", {}).get("kalmanson"), paths.export.kalmanson, "Kalmanson source", spec.export.kalmanson_sha256)
    _check_file(receipt.get("source_modules", {}).get("perpendicular_bisector"), paths.export.perpendicular_bisector, "perpendicular-bisector source", spec.export.perpendicular_bisector_sha256)
    child = receipt.get("child")
    if child != {"path": str(paths.export.child.resolve()), "sha256": spec.export.child_sha256, "bytes": spec.export.child_bytes, "variables": spec.export.variables, "clauses": spec.export.child_clauses}:
        raise ValueError("child34 receipt child identity drifted")
    if receipt.get("immutability") != "exclusive-hard-link-and-exclusive-receipt/v1":
        raise ValueError("child34 receipt immutability policy drifted")
    validation = validate_export(paths.export.parent, paths.export.child, spec=spec.export)
    if receipt.get("validation") != validation:
        raise ValueError("child34 receipt validation drifted")
    return receipt


def _daemon_receipt(paths: IngressPaths, spec: IngressSpec) -> dict[str, str]:
    if spec.daemon_build_receipt_sha256 is None:
        raise UnprovisionedError("child34 daemon receipt is unpinned")
    actual = sha256_file(paths.daemon_build_receipt)
    if actual != spec.daemon_build_receipt_sha256:
        raise ValueError("daemon build receipt hash drifted")
    return {"path": str(paths.daemon_build_receipt.resolve()), "sha256": actual}


def _payload(paths: IngressPaths, spec: IngressSpec, validation: dict[str, Any]) -> dict[str, Any]:
    receipt = _check_receipt(paths, spec)
    daemon = _daemon_receipt(paths, spec)
    return {
        "schema": SCHEMA, "status": "PASS",
        "dimacs": {"path": str(paths.export.child.resolve()), "sha256": spec.export.child_sha256, "bytes": spec.export.child_bytes, "variables": spec.export.variables, "clauses": spec.export.child_clauses, "parent_prefix_clauses": spec.export.parent_clauses, "checked_new_clauses": spec.export.new_clauses},
        "parent_ingress": {"path": str(paths.parent_manifest.resolve()), "sha256": spec.parent_manifest_sha256, "parent_dimacs_sha256": spec.export.parent_sha256},
        "export_receipt": {"path": str(paths.export.receipt.resolve()), "sha256": sha256_file(paths.export.receipt), "schema": receipt["schema"]},
        "lean": receipt["lean"], "source_modules": receipt["source_modules"], "validation": validation,
        "piqd": {"ingress": "raw-dimacs/v1", "daemon_sha256": spec.daemon_sha256, "daemon_source_commit": spec.daemon_source_commit, "daemon_build_receipt": daemon, "daemon_protocol_version": spec.daemon_protocol_version, "solver_name": spec.solver_name, "solver_sha256": spec.solver_sha256, "solver_signature": spec.solver_signature, "backend": spec.backend, "solver_profile": spec.solver_profile, "immutable_root_only": True, "stale_job_reuse_allowed": False, "python_authored_successor_clause_allowed": False},
    }


def validate_ingress(paths: IngressPaths = PRODUCTION_INGRESS_PATHS, *, spec: IngressSpec = PRODUCTION_INGRESS_SPEC, expected_manifest_sha256: str | None = None) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("child34 PIQD ingress is UNPROVISIONED")
    manifest = strict_json_read(paths.manifest)
    if set(manifest) != {"schema", "status", "dimacs", "parent_ingress", "export_receipt", "lean", "source_modules", "validation", "piqd"} or manifest.get("schema") != SCHEMA or manifest.get("status") != "PASS":
        raise ValueError("child34 ingress schema/status drifted")
    manifest_hash = sha256_file(paths.manifest)
    if expected_manifest_sha256 is not None and manifest_hash != expected_manifest_sha256:
        raise ValueError("child34 manifest hash drifted")
    if not paths.parent_manifest.is_file() or sha256_file(paths.parent_manifest) != spec.parent_manifest_sha256:
        raise ValueError("child33 parent ingress hash drifted")
    validation = validate_export(paths.export.parent, paths.export.child, spec=spec.export)
    expected = _payload(paths, spec, validation)
    if manifest != expected:
        raise ValueError("child34 ingress content drifted")
    return {"schema": "p97-exact17-child34-piqd-ingress-validation/v1", "status": "PASS", "manifest_sha256": manifest_hash, "dimacs_sha256": spec.export.child_sha256, "dimacs_bytes": spec.export.child_bytes, "variables": spec.export.variables, "clauses": spec.export.child_clauses, "new_clauses": spec.export.new_clauses, "parent_dimacs_sha256": spec.export.parent_sha256, "export_receipt_sha256": sha256_file(paths.export.receipt), "piqd_daemon_sha256": spec.daemon_sha256, "piqd_solver_sha256": spec.solver_sha256}


def emit_ingress(paths: IngressPaths = PRODUCTION_INGRESS_PATHS, *, spec: IngressSpec = PRODUCTION_INGRESS_SPEC) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("child34 PIQD ingress is UNPROVISIONED")
    if sha256_file(paths.parent_manifest) != spec.parent_manifest_sha256:
        raise ValueError("child33 parent ingress hash drifted")
    validation = validate_export(paths.export.parent, paths.export.child, spec=spec.export)
    payload = _payload(paths, spec, validation)
    _immutable_json(paths.manifest, payload)
    return payload


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("emit", "validate"))
    parser.add_argument("--manifest", type=Path, default=PRODUCTION_INGRESS_PATHS.manifest)
    args = parser.parse_args()
    paths = replace(PRODUCTION_INGRESS_PATHS, manifest=args.manifest.resolve())
    result = emit_ingress(paths) if args.command == "emit" else validate_ingress(paths)
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
