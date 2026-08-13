"""Mint and validate immutable PIQD ingress for exact-17 child32."""

from __future__ import annotations

import argparse
import json
import os
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from export_exact17_thirty_second_root import PRODUCTION_PATHS, ExportPaths
from validate_exact17_thirty_first_model_refinements_export import (
    PRODUCTION_PUBLICATION_INPUTS,
    PRODUCTION_SPEC,
    ExportSpec,
    PublicationInputs,
    PublicationValidator,
    UnprovisionedError,
    sha256_file,
    strict_json_read,
    validate_export,
)

ROOT = Path(__file__).resolve().parents[1]
SCHEMA = "p97-exact17-thirty-first-model-refinements-piqd-ingress/v2"
DAEMON_SHA256 = "6b115f2cdf37c8bae553d5962faa0f6d6ff169a55670ead500d81f42d3b9566a"
SOLVER_NAME = "piqd-satworker-cadical-3.0.0"
SOLVER_SHA256 = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
PARENT_MANIFEST_SHA256 = (
    "f0a3b6304ed59524b48e3cc7c6336d15b44b8b6eef02b1d2f95be0cc67dd0c4f"
)


@dataclass(frozen=True)
class IngressPaths:
    export: ExportPaths
    publication_inputs: PublicationInputs
    parent_manifest: Path
    manifest: Path


@dataclass(frozen=True)
class IngressSpec:
    export: ExportSpec
    parent_manifest_sha256: str
    daemon_sha256: str = DAEMON_SHA256
    daemon_protocol_version: int = 1
    solver_name: str = SOLVER_NAME
    solver_sha256: str = SOLVER_SHA256
    solver_signature: str = "cadical-3.0.0"
    backend: str = "cadical"
    solver_profile: str = "sat"


PRODUCTION_INGRESS_PATHS = IngressPaths(
    export=PRODUCTION_PATHS,
    publication_inputs=PRODUCTION_PUBLICATION_INPUTS,
    parent_manifest=ROOT
    / "scratch/exact17-lean-to-sat/"
    "piqd-ingress-manifest-thirtieth-model-refinements.json",
    manifest=ROOT
    / "scratch/exact17-lean-to-sat/"
    "piqd-ingress-manifest-thirty-first-model-refinements-core1.json",
)
PRODUCTION_INGRESS_SPEC = IngressSpec(
    export=PRODUCTION_SPEC,
    parent_manifest_sha256=PARENT_MANIFEST_SHA256,
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


def _exact_path(record: dict[str, Any], expected: Path, label: str) -> None:
    if record.get("path") != str(expected.resolve()):
        raise ValueError(f"wrong {label} path")


def _check_hash_record(record: dict[str, Any], expected: Path, label: str) -> None:
    _exact_path(record, expected, label)
    if record.get("sha256") != sha256_file(expected):
        raise ValueError(f"{label} SHA-256 drifted")


def _manifest_payload(
    paths: IngressPaths,
    spec: IngressSpec,
    validation: dict[str, Any],
) -> dict[str, Any]:
    receipt = strict_json_read(paths.export.receipt)
    return {
        "schema": SCHEMA,
        "status": "PASS",
        "dimacs": {
            "path": str(paths.export.child.resolve()),
            "sha256": sha256_file(paths.export.child),
            "bytes": paths.export.child.stat().st_size,
            "variables": spec.export.variables,
            "clauses": spec.export.child_clauses,
            "parent_prefix_clauses": spec.export.parent_clauses,
            "checked_new_clauses": spec.export.new_clauses,
        },
        "parent_ingress": {
            "path": str(paths.parent_manifest.resolve()),
            "sha256": sha256_file(paths.parent_manifest),
            "parent_dimacs_sha256": spec.export.parent_sha256,
        },
        "publication": {
            "path": str(paths.export.ledger.resolve()),
            "sha256": sha256_file(paths.export.ledger),
            "state": spec.export.publication_state,
        },
        "export_receipt": {
            "path": str(paths.export.receipt.resolve()),
            "sha256": sha256_file(paths.export.receipt),
            "schema": receipt.get("schema"),
        },
        "lean": receipt.get("lean"),
        "validation": validation,
        "piqd": {
            "ingress": "raw-dimacs/v1",
            "daemon_sha256": spec.daemon_sha256,
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
    publication_validator: PublicationValidator | None = None,
) -> dict[str, Any]:
    """Reauthenticate every byte and semantic claim reachable from ingress."""
    if not spec.export.provisioned:
        raise UnprovisionedError("child32 PIQD ingress is UNPROVISIONED")
    manifest = strict_json_read(paths.manifest)
    if set(manifest) != {
        "schema",
        "status",
        "dimacs",
        "parent_ingress",
        "publication",
        "export_receipt",
        "lean",
        "validation",
        "piqd",
    }:
        raise ValueError("wrong child32 ingress fields")
    if manifest["schema"] != SCHEMA or manifest["status"] != "PASS":
        raise ValueError("child32 ingress is not a PASS publication")
    manifest_sha256 = sha256_file(paths.manifest)
    if expected_manifest_sha256 is not None and manifest_sha256 != expected_manifest_sha256:
        raise ValueError("child32 ingress manifest SHA-256 drifted")

    dimacs = manifest["dimacs"]
    if not isinstance(dimacs, dict):
        raise TypeError("DIMACS ingress record is not an object")
    _check_hash_record(dimacs, paths.export.child, "child32 DIMACS")
    expected_dimensions = {
        "bytes": spec.export.child_bytes,
        "variables": spec.export.variables,
        "clauses": spec.export.child_clauses,
        "parent_prefix_clauses": spec.export.parent_clauses,
        "checked_new_clauses": spec.export.new_clauses,
    }
    for key, expected in expected_dimensions.items():
        if dimacs.get(key) != expected:
            raise ValueError(f"child32 DIMACS {key} drifted")

    parent_ingress = manifest["parent_ingress"]
    if not isinstance(parent_ingress, dict):
        raise TypeError("parent ingress record is not an object")
    _check_hash_record(parent_ingress, paths.parent_manifest, "parent ingress")
    if parent_ingress.get("sha256") != spec.parent_manifest_sha256:
        raise ValueError("unauthorized parent ingress manifest")
    if parent_ingress.get("parent_dimacs_sha256") != spec.export.parent_sha256:
        raise ValueError("parent ingress/root identity drifted")
    parent_manifest = strict_json_read(paths.parent_manifest)
    parent_dimacs = parent_manifest.get("dimacs")
    if not isinstance(parent_dimacs, dict) or parent_dimacs.get("sha256") != (
        spec.export.parent_sha256
    ):
        raise ValueError("parent manifest does not authenticate child31")

    publication = manifest["publication"]
    if not isinstance(publication, dict):
        raise TypeError("publication record is not an object")
    _check_hash_record(publication, paths.export.ledger, "publication ledger")
    if publication.get("sha256") != spec.export.ledger_sha256:
        raise ValueError("unauthorized publication ledger")
    if publication.get("state") != "PROVISIONED":
        raise ValueError("unprovisioned publication cannot enter PIQD")

    receipt_record = manifest["export_receipt"]
    if not isinstance(receipt_record, dict):
        raise TypeError("export receipt record is not an object")
    _check_hash_record(receipt_record, paths.export.receipt, "export receipt")
    receipt = strict_json_read(paths.export.receipt)
    if set(receipt) != {
        "schema",
        "status",
        "publication_state",
        "parent",
        "publication_ledger",
        "publication_sources",
        "lean",
        "child",
        "validation",
        "immutability",
    }:
        raise ValueError("wrong export receipt fields")
    if (
        receipt_record.get("schema") != "p97-exact17-child32-immutable-export-receipt/v1"
        or receipt.get("schema") != receipt_record.get("schema")
        or receipt.get("status") != "PASS"
        or receipt.get("publication_state") != "PROVISIONED"
    ):
        raise ValueError("export receipt is not a provisioned PASS")
    if receipt.get("immutability") != "exclusive-hard-link-and-exclusive-receipt/v1":
        raise ValueError("export receipt lacks the immutable-publication policy")
    expected_receipt_parent = {
        "path": str(paths.export.parent.resolve()),
        "sha256": spec.export.parent_sha256,
    }
    if receipt.get("parent") != expected_receipt_parent:
        raise ValueError("export receipt parent identity drifted")
    expected_receipt_publication = {
        "path": str(paths.export.ledger.resolve()),
        "sha256": spec.export.ledger_sha256,
    }
    if receipt.get("publication_ledger") != expected_receipt_publication:
        raise ValueError("export receipt publication identity drifted")
    publication_sources = receipt.get("publication_sources")
    if (
        not isinstance(publication_sources, dict)
        or set(publication_sources) != {"analysis", "parent_ledger"}
    ):
        raise ValueError("export receipt publication sources are malformed")
    _check_hash_record(
        publication_sources["analysis"],
        paths.publication_inputs.analysis,
        "publication analysis",
    )
    _check_hash_record(
        publication_sources["parent_ledger"],
        paths.publication_inputs.parent_ledger,
        "publication parent ledger",
    )
    receipt_lean = receipt.get("lean")
    if not isinstance(receipt_lean, dict) or set(receipt_lean) != {"root", "export"}:
        raise ValueError("export receipt Lean identity is malformed")
    _check_hash_record(receipt_lean["root"], paths.export.lean_root, "Lean child32 root")
    _check_hash_record(
        receipt_lean["export"], paths.export.lean_export, "Lean child32 exporter"
    )

    regenerated = validate_export(
        paths.export.parent,
        paths.export.child,
        paths.export.ledger,
        spec=spec.export,
        publication_validator=publication_validator,
        publication_inputs=paths.publication_inputs,
    )
    if regenerated != manifest["validation"] or regenerated != receipt.get("validation"):
        raise ValueError("child32 validation/receipt replay drifted")
    if receipt.get("child") != {
        "path": str(paths.export.child.resolve()),
        "sha256": spec.export.child_sha256,
        "bytes": spec.export.child_bytes,
        "variables": spec.export.variables,
        "clauses": spec.export.child_clauses,
    }:
        raise ValueError("export receipt child identity drifted")
    if receipt_lean != manifest["lean"]:
        raise ValueError("Lean source identity drifted between receipt and ingress")

    piqd = manifest["piqd"]
    expected_piqd = {
        "ingress": "raw-dimacs/v1",
        "daemon_sha256": spec.daemon_sha256,
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
    if piqd != expected_piqd:
        raise ValueError("PIQD ingress policy or identity drifted")
    return {
        "schema": "p97-exact17-child32-piqd-ingress-validation/v1",
        "status": "PASS",
        "manifest_sha256": manifest_sha256,
        "dimacs_sha256": spec.export.child_sha256,
        "dimacs_bytes": spec.export.child_bytes,
        "variables": spec.export.variables,
        "clauses": spec.export.child_clauses,
        "new_clauses": spec.export.new_clauses,
        "parent_dimacs_sha256": spec.export.parent_sha256,
        "publication_ledger_sha256": spec.export.ledger_sha256,
        "export_receipt_sha256": sha256_file(paths.export.receipt),
        "piqd_daemon_sha256": spec.daemon_sha256,
        "piqd_solver_sha256": spec.solver_sha256,
    }


def emit_ingress(
    paths: IngressPaths = PRODUCTION_INGRESS_PATHS,
    *,
    spec: IngressSpec = PRODUCTION_INGRESS_SPEC,
    publication_validator: PublicationValidator | None = None,
) -> dict[str, Any]:
    if not spec.export.provisioned:
        raise UnprovisionedError("child32 PIQD ingress is UNPROVISIONED")
    validation = validate_export(
        paths.export.parent,
        paths.export.child,
        paths.export.ledger,
        spec=spec.export,
        publication_validator=publication_validator,
        publication_inputs=paths.publication_inputs,
    )
    if validation["status"] != "PASS":
        raise RuntimeError("refusing ingress for a non-PASS export")
    if sha256_file(paths.parent_manifest) != spec.parent_manifest_sha256:
        raise ValueError("unauthorized parent ingress manifest")
    payload = _manifest_payload(paths, spec, validation)
    _immutable_json(paths.manifest, payload)
    return payload


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("emit", "validate"))
    parser.add_argument("--manifest", type=Path, default=PRODUCTION_INGRESS_PATHS.manifest)
    parser.add_argument("--expected-manifest-sha256")
    args = parser.parse_args()
    paths = IngressPaths(
        export=PRODUCTION_INGRESS_PATHS.export,
        publication_inputs=PRODUCTION_INGRESS_PATHS.publication_inputs,
        parent_manifest=PRODUCTION_INGRESS_PATHS.parent_manifest,
        manifest=args.manifest.resolve(),
    )
    if args.command == "emit":
        payload = emit_ingress(paths)
    else:
        payload = validate_ingress(
            paths, expected_manifest_sha256=args.expected_manifest_sha256
        )
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
