"""Validate and emit the immutable PIQD ingress for exact-17 Child36."""

from __future__ import annotations

import argparse
import json
import os
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

from export_exact17_thirty_sixth_root import PRODUCTION_PATHS, ExportPaths
from validate_exact17_thirty_fifth_model_refinements_export import (
    PRODUCTION_SPEC,
    ExportSpec,
    UnprovisionedError,
    sha256_file,
    strict_object,
    validate_export,
)

ROOT = Path(__file__).resolve().parents[1]
SCHEMA = "p97-exact17-thirty-fifth-model-refinements-piqd-ingress/v1"
RECEIPT_SCHEMA = "p97-exact17-child36-immutable-export-receipt/v1"


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
        return self.export.provisioned and all(
            value is not None
            for value in (
                self.parent_manifest_sha256,
                self.daemon_sha256,
                self.daemon_source_commit,
                self.daemon_build_receipt_sha256,
                self.daemon_protocol_version,
                self.solver_name,
                self.solver_sha256,
                self.solver_signature,
            )
        )


PRODUCTION_INGRESS_PATHS = IngressPaths(
    export=PRODUCTION_PATHS,
    parent_manifest=ROOT
    / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-fourth-model-refinements-core1.json",
    daemon_build_receipt=ROOT
    / "scratch/exact17-lean-to-sat/piqd-child35-daemon-build-receipt.txt",
    manifest=ROOT
    / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-fifth-model-refinements-core1.json",
)
PRODUCTION_INGRESS_SPEC = IngressSpec(
    export=PRODUCTION_SPEC,
    parent_manifest_sha256="3241c3f22d0bb4a1635430ad35a395a0c46cd8b3a06423e05a682999533a72ae",
    daemon_sha256="f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089",
    daemon_source_commit="acefb4aba14765d45e38ac4193373f0aa210f22d",
    daemon_build_receipt_sha256="6e9c1d5c203d59ac2b29f800d73f4dbb0395b97865433f412ff4aa44c8e1b0a9",
    daemon_protocol_version=1,
    solver_name="piqd-satworker-cadical-3.0.0",
    solver_sha256="0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
    solver_signature="cadical-3.0.0",
)


def strict_json_read(path: Path) -> dict[str, Any]:
    value = json.loads(
        path.read_text(encoding="utf-8"), object_pairs_hook=strict_object
    )
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


def _file_record(path: Path) -> dict[str, str]:
    return {"path": str(path.resolve()), "sha256": sha256_file(path)}


def _check_file(
    record: object, path: Path, label: str, expected_sha256: str | None = None
) -> None:
    actual = sha256_file(path)
    if (
        not isinstance(record, dict)
        or set(record) != {"path", "sha256"}
        or record["path"] != str(path.resolve())
        or record["sha256"] != actual
        or (expected_sha256 is not None and actual != expected_sha256)
    ):
        raise ValueError(f"{label} identity drifted")


def _check_receipt(paths: IngressPaths, spec: IngressSpec) -> dict[str, Any]:
    receipt = strict_json_read(paths.export.receipt)
    if (
        set(receipt)
        != {
            "schema",
            "status",
            "publication_state",
            "parent",
            "model",
            "lean",
            "child",
            "validation",
            "immutability",
        }
        or receipt.get("schema") != RECEIPT_SCHEMA
        or receipt.get("status") != "PASS"
        or receipt.get("publication_state") != "PROVISIONED"
    ):
        raise ValueError("child36 receipt schema/status drifted")
    _check_file(
        receipt.get("parent"), paths.export.parent, "parent", spec.export.parent_sha256
    )
    _check_file(
        receipt.get("model"), paths.export.model, "model", spec.export.model_sha256
    )
    lean = receipt.get("lean")
    if not isinstance(lean, dict) or set(lean) != {"root", "export", "refinement"}:
        raise ValueError("child36 Lean receipt shape drifted")
    _check_file(
        lean["root"], paths.export.lean_root, "Lean root", spec.export.lean_root_sha256
    )
    _check_file(
        lean["export"],
        paths.export.lean_export,
        "Lean export",
        spec.export.lean_export_sha256,
    )
    _check_file(
        lean["refinement"],
        paths.export.refinement,
        "refinement",
        spec.export.refinement_sha256,
    )
    if receipt.get("child") != {
        "path": str(paths.export.child.resolve()),
        "sha256": spec.export.child_sha256,
        "bytes": spec.export.child_bytes,
        "variables": spec.export.variables,
        "clauses": spec.export.child_clauses,
    }:
        raise ValueError("child36 receipt child identity drifted")
    if receipt.get("immutability") != "exclusive-hard-link-and-exclusive-receipt/v1":
        raise ValueError("child36 receipt immutability policy drifted")
    validation = validate_export(
        paths.export.parent, paths.export.child, paths.export.model, spec=spec.export
    )
    if receipt.get("validation") != validation:
        raise ValueError("child36 receipt validation drifted")
    return receipt


def _daemon_record(paths: IngressPaths, spec: IngressSpec) -> dict[str, str]:
    if spec.daemon_build_receipt_sha256 is None:
        raise UnprovisionedError("child36 daemon receipt is unpinned")
    record = _file_record(paths.daemon_build_receipt)
    if record["sha256"] != spec.daemon_build_receipt_sha256:
        raise ValueError("daemon build receipt hash drifted")
    return record


def _payload(
    paths: IngressPaths, spec: IngressSpec, validation: dict[str, Any]
) -> dict[str, Any]:
    receipt = _check_receipt(paths, spec)
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
        "model": receipt["model"],
        "validation": validation,
        "piqd": {
            "ingress": "raw-dimacs/v1",
            "daemon_sha256": spec.daemon_sha256,
            "daemon_source_commit": spec.daemon_source_commit,
            "daemon_build_receipt": _daemon_record(paths, spec),
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
        raise UnprovisionedError("child36 PIQD ingress is UNPROVISIONED")
    if sha256_file(paths.parent_manifest) != spec.parent_manifest_sha256:
        raise ValueError("child35 parent ingress hash drifted")
    manifest = strict_json_read(paths.manifest)
    expected_keys = {
        "schema",
        "status",
        "dimacs",
        "parent_ingress",
        "export_receipt",
        "lean",
        "model",
        "validation",
        "piqd",
    }
    if (
        set(manifest) != expected_keys
        or manifest.get("schema") != SCHEMA
        or manifest.get("status") != "PASS"
    ):
        raise ValueError("child36 ingress schema/status drifted")
    manifest_sha256 = sha256_file(paths.manifest)
    if (
        expected_manifest_sha256 is not None
        and manifest_sha256 != expected_manifest_sha256
    ):
        raise ValueError("child36 manifest hash drifted")
    validation = validate_export(
        paths.export.parent, paths.export.child, paths.export.model, spec=spec.export
    )
    if manifest != _payload(paths, spec, validation):
        raise ValueError("child36 ingress content drifted")
    return {
        "schema": "p97-exact17-child36-piqd-ingress-validation/v1",
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
        "piqd_solver_sha256": spec.solver_sha256,
    }


def emit_ingress(
    paths: IngressPaths = PRODUCTION_INGRESS_PATHS,
    *,
    spec: IngressSpec = PRODUCTION_INGRESS_SPEC,
) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("child36 PIQD ingress is UNPROVISIONED")
    if sha256_file(paths.parent_manifest) != spec.parent_manifest_sha256:
        raise ValueError("child35 parent ingress hash drifted")
    validation = validate_export(
        paths.export.parent, paths.export.child, paths.export.model, spec=spec.export
    )
    payload = _payload(paths, spec, validation)
    _immutable_json(paths.manifest, payload)
    return payload


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("emit", "validate"))
    parser.add_argument(
        "--manifest", type=Path, default=PRODUCTION_INGRESS_PATHS.manifest
    )
    args = parser.parse_args()
    paths = replace(PRODUCTION_INGRESS_PATHS, manifest=args.manifest.resolve())
    result = emit_ingress(paths) if args.command == "emit" else validate_ingress(paths)
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
