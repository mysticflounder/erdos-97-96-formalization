"""Fail-closed immutable ingress manifest for the exact-17 Child44 root."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import secrets
import stat
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from export_exact17_forty_fourth_root import ExportPaths
from validate_exact17_forty_fourth_model_refinements_export import (
    ANALYSIS_PATH,
    CHILD_PATH,
    FINAL_PATH,
    LEAN_EXPORT_PATH,
    LEAN_ROOT_PATH,
    MODEL_PATH,
    PARENT_PATH,
    PRODUCTION_SPEC,
    RECEIPT_PATH,
    ExportSpec,
    UnprovisionedError,
    open_directory_nofollow,
    read_regular_nofollow,
    require_regular_nonsymlink,
    strict_json_loads,
    validate_export,
)
from validate_exact17_forty_fourth_model_refinements_export import (
    sha256_file as secure_sha256_file,
)

ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-forty-fourth-model-refinements-core1.json"
PARENT_MANIFEST = ROOT / "scratch/exact17-lean-to-sat/piqd-ingress-manifest-forty-third-model-refinements-core1.json"
PARENT_MANIFEST_SHA256 = "6805434e1cf96526d93d4fc2eb291e1cab9ac6b7cc9417b5010c8f8a1b038171"
DAEMON_BUILD_RECEIPT = ROOT / "scratch/exact17-lean-to-sat/piqd-child35-daemon-build-receipt.txt"
SCHEMA = "p97-exact17-child44-piqd-ingress/v1"


@dataclass(frozen=True)
class IngressPaths:
    export_parent: Path = PARENT_PATH
    export_child: Path = CHILD_PATH
    export_model: Path = MODEL_PATH
    export_receipt: Path = RECEIPT_PATH
    parent_manifest: Path = PARENT_MANIFEST
    daemon_build_receipt: Path = DAEMON_BUILD_RECEIPT
    manifest: Path = MANIFEST
    final: Path = FINAL_PATH

    @property
    def export(self) -> ExportPaths:
        """Expose the path view required by the shared PIQD lifecycle."""
        return ExportPaths(
            parent=self.export_parent,
            model=self.export_model,
            final=self.final,
            lean_export=LEAN_EXPORT_PATH,
            child=self.export_child,
            receipt=self.export_receipt,
        )


@dataclass(frozen=True)
class IngressSpec:
    export: ExportSpec = PRODUCTION_SPEC
    manifest_sha256: str | None = "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048"
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
    def identity_provisioned(self) -> bool:
        return self.export.provisioned and all(
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

    @property
    def provisioned(self) -> bool:
        return self.identity_provisioned and self.manifest_sha256 is not None


PRODUCTION_INGRESS_PATHS = IngressPaths()
PRODUCTION_INGRESS_SPEC = IngressSpec()


def sha256_file(path: Path) -> str:
    return secure_sha256_file(path)


def _immutable_json(path: Path, payload: dict[str, Any]) -> None:
    try:
        directory_fd = open_directory_nofollow(path.parent)
    except (OSError, ValueError) as error:
        raise ValueError(f"Child44 manifest parent contains a symlink: {path.parent}") from error
    candidate = f".{path.name}.{secrets.token_hex(12)}.candidate"
    try:
        if not stat.S_ISDIR(os.fstat(directory_fd).st_mode):
            raise NotADirectoryError(path.parent)
        fd = os.open(
            candidate,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
            0o600,
            dir_fd=directory_fd,
        )
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            json.dump(payload, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.link(
            candidate,
            path.name,
            src_dir_fd=directory_fd,
            dst_dir_fd=directory_fd,
            follow_symlinks=False,
        )
        os.fsync(directory_fd)
    finally:
        try:
            os.unlink(candidate, dir_fd=directory_fd)
        except FileNotFoundError:
            pass
        os.close(directory_fd)


def _is_sha256(value: object) -> bool:
    return isinstance(value, str) and len(value) == 64 and all(char in "0123456789abcdef" for char in value)


def _daemon_record(paths: IngressPaths, spec: IngressSpec) -> dict[str, str]:
    require_regular_nonsymlink(paths.daemon_build_receipt, "Child44 daemon build receipt")
    digest = sha256_file(paths.daemon_build_receipt)
    if digest != spec.daemon_build_receipt_sha256:
        raise ValueError("Child44 daemon build receipt drifted")
    return {
        "path": str(paths.daemon_build_receipt.resolve()),
        "sha256": digest,
    }


def _receipt(paths: IngressPaths, spec: IngressSpec, validation: dict[str, Any]) -> tuple[dict[str, Any], str]:
    raw = read_regular_nofollow(paths.export_receipt, "Child44 export receipt")
    receipt = strict_json_loads(raw)
    expected = {
        "schema": "p97-exact17-child44-immutable-export-receipt/v1",
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "parent": {"path": str(paths.export_parent.resolve()), "sha256": spec.export.parent_sha256},
        "lean": {
            "root": {"path": str(LEAN_ROOT_PATH.resolve()), "sha256": spec.export.lean_root_sha256},
            "export": {"path": str(LEAN_EXPORT_PATH.resolve()), "sha256": spec.export.lean_export_sha256},
        },
        "source": {"analysis": {"path": str(ANALYSIS_PATH.resolve()), "sha256": spec.export.analysis_sha256}},
        "model": {"path": str(paths.export_model.resolve()), "sha256": spec.export.model_sha256},
        "final": validation["final"],
        "child": {"path": str(paths.export_child.resolve()), "sha256": spec.export.child_sha256, "bytes": spec.export.child_bytes, "variables": 308, "clauses": 5_848_820},
        "validation": validation,
        "immutability": "exclusive-hard-link-and-ledger-last-receipt/v2",
    }
    if receipt != expected:
        raise ValueError("Child44 receipt content drifted")
    return receipt, hashlib.sha256(raw).hexdigest()


def _payload(paths: IngressPaths, spec: IngressSpec, validation: dict[str, Any]) -> dict[str, Any]:
    receipt, receipt_sha = _receipt(paths, spec, validation)
    return {
        "schema": SCHEMA,
        "status": "PASS",
        "dimacs": {"path": str(paths.export_child.resolve()), "sha256": spec.export.child_sha256, "bytes": spec.export.child_bytes, "variables": 308, "clauses": 5_848_820, "parent_prefix_clauses": 5_848_592, "checked_new_clauses": 228},
        "parent_ingress": {"path": str(paths.parent_manifest.resolve()), "sha256": PARENT_MANIFEST_SHA256, "parent_dimacs_sha256": spec.export.parent_sha256},
        "export_receipt": {"path": str(paths.export_receipt.resolve()), "sha256": receipt_sha, "schema": receipt["schema"]},
        "lean": receipt["lean"],
        "model": receipt["model"],
        "validation": validation,
        "piqd": {"ingress": "raw-dimacs/v1", "daemon_sha256": spec.daemon_sha256, "daemon_source_commit": spec.daemon_source_commit, "daemon_build_receipt": _daemon_record(paths, spec), "daemon_protocol_version": spec.daemon_protocol_version, "solver_name": spec.solver_name, "solver_sha256": spec.solver_sha256, "solver_signature": spec.solver_signature, "backend": spec.backend, "solver_profile": spec.solver_profile, "immutable_root_only": True, "stale_job_reuse_allowed": False, "python_authored_successor_clause_allowed": False, "unsat_requires_proof_replay": True},
    }


def validate_ingress(
    paths: IngressPaths = PRODUCTION_INGRESS_PATHS,
    *,
    spec: IngressSpec = PRODUCTION_INGRESS_SPEC,
    expected_manifest_sha256: str | None = None,
) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("Child44 PIQD ingress is UNPROVISIONED")
    if expected_manifest_sha256 is not None and not _is_sha256(expected_manifest_sha256):
        raise ValueError("Child44 explicit manifest SHA-256 pin is malformed")
    if spec.manifest_sha256 is None or not _is_sha256(spec.manifest_sha256):
        raise UnprovisionedError("Child44 ingress manifest hash is unpinned")
    if expected_manifest_sha256 is not None and expected_manifest_sha256 != spec.manifest_sha256:
        raise ValueError("Child44 manifest pin arguments disagree")
    require_regular_nonsymlink(paths.parent_manifest, "Child43 parent ingress manifest")
    if sha256_file(paths.parent_manifest) != PARENT_MANIFEST_SHA256:
        raise ValueError("Child43 parent ingress provenance drifted")
    validation = validate_export(paths.export_parent, paths.export_child, paths.export_model, final_path=paths.final, spec=spec.export)
    require_regular_nonsymlink(paths.manifest, "Child44 ingress manifest")
    payload = strict_json_loads(read_regular_nofollow(paths.manifest, "Child44 ingress manifest"))
    if payload != _payload(paths, spec, validation):
        raise ValueError("Child44 ingress manifest content drifted")
    if sha256_file(paths.manifest) != spec.manifest_sha256:
        raise ValueError("Child44 ingress manifest hash drifted")
    return payload


def emit_ingress(paths: IngressPaths = PRODUCTION_INGRESS_PATHS, *, spec: IngressSpec = PRODUCTION_INGRESS_SPEC) -> dict[str, Any]:
    if not spec.identity_provisioned:
        raise UnprovisionedError("Child44 PIQD ingress identity is UNPROVISIONED")
    validation = validate_export(paths.export_parent, paths.export_child, paths.export_model, final_path=paths.final, spec=spec.export)
    payload = _payload(paths, spec, validation)
    _immutable_json(paths.manifest, payload)
    return payload


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("emit", "validate"))
    args = parser.parse_args(argv)
    payload = emit_ingress() if args.command == "emit" else validate_ingress()
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
