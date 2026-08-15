"""Authenticate the published exact-17 current-root-two-kalmanson PIQD ingress.

The v2 export receipt itself is the raw-DIMACS producer manifest.  No derived
manifest is emitted: PIQD therefore binds its job identity directly to the
published receipt bytes that authenticate the CNF, Lean sources, publisher,
independent validator, audit report, and coverage ledger.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO

import validate_exact17_current_root_two_kalmanson_export as export_validator

ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = ROOT / "scratch/exact17-current-root-two-kalmanson-package-v2"
RECEIPT_PATH = PACKAGE_ROOT / "export-receipt.json"
AUDIT_REPORT_PATH = PACKAGE_ROOT / "independent-audit-report.json"
COVERAGE_LEDGER_PATH = PACKAGE_ROOT / "coverage-ledger.json"
PUBLISHER_PATH = ROOT / "scripts/publish_exact17_current_root_two_kalmanson_root.py"
VALIDATOR_PATH = ROOT / "scripts/validate_exact17_current_root_two_kalmanson_export.py"
VARIABLE_MAP_PATH = ROOT / "census/p97_search/waves/exact17/child40/variable-map.json"
DAEMON_BUILD_RECEIPT_PATH = (
    ROOT / "scratch/exact17-lean-to-sat/piqd-child35-daemon-build-receipt.txt"
)

INGRESS_SCHEMA = "p97-exact17-current-root-two-kalmanson-piqd-ingress/v1"
RECEIPT_SCHEMA = "p97-exact17-current-root-two-kalmanson-immutable-export-receipt/v2"
RECEIPT_SHA256 = "313f09c11b04aa8d316f4e927f5f5d9d8b4c2f56e8372446e3bf0e9bbc944def"
RECEIPT_BYTES = 4_607
PUBLISHER_SOURCE_COMMIT = "1d68f7b17f683bd4d995c3b0f455155cb8fa0e64"
VALIDATOR_SOURCE_COMMIT = "04fff55637c4a90449470a422249572ba8fa2e07"
PUBLISHER_SHA256 = "6a2364c157fd4d948e645802cd1164a0ad372c666665171f3cb548d9dff2f147"
PUBLISHER_BYTES = 30_191
VALIDATOR_SHA256 = "eeb8396d165b2dae875aead6db51e02bfd7dd209919de58f15e7d9f27f7eb321"
VALIDATOR_BYTES = 21_705
AUDIT_REPORT_SHA256 = "c58ffebb5d25a39cb8277a850fad32ed5130297966f7e2d96331eee88038daf9"
AUDIT_REPORT_BYTES = 1_707
COVERAGE_LEDGER_SHA256 = (
    "2a0360e0f71cd8979de6d4285bcbcef58335406b1c12d8afeebb82ec5fe2bebb"
)
COVERAGE_LEDGER_BYTES = 1_920
COVERAGE_LEDGER_SCHEMA = "p97-exact17-current-root-two-kalmanson-coverage-ledger/v2"
VARIABLE_MAP_SHA256 = "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
VARIABLE_MAP_BYTES = 23_341
DAEMON_SHA256 = "f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089"
DAEMON_SOURCE_COMMIT = "acefb4aba14765d45e38ac4193373f0aa210f22d"
DAEMON_BUILD_RECEIPT_SHA256 = (
    "6e9c1d5c203d59ac2b29f800d73f4dbb0395b97865433f412ff4aa44c8e1b0a9"
)
DAEMON_BUILD_RECEIPT_BYTES = 6_895
DAEMON_PROTOCOL_VERSION = 1
SOLVER_NAME = "piqd-satworker-cadical-3.0.0"
SOLVER_SHA256 = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
SOLVER_SIGNATURE = "cadical-3.0.0"
BACKEND = "cadical"
SOLVER_PROFILE = "sat"
REQUESTED_CORE_LIMIT = 1
MAX_REQUESTED_CORE_LIMIT = 12
TIMEOUT_S = 3_600


class IngressValidationError(ValueError):
    """The published PIQD ingress failed an identity or custody check."""


@dataclass(frozen=True)
class FileBinding:
    sha256: str
    bytes: int


@dataclass(frozen=True)
class ExportSpec:
    child_sha256: str = export_validator.CHILD_SHA256
    child_bytes: int = export_validator.CHILD_BYTES
    variables: int = export_validator.VARIABLES
    child_clauses: int = export_validator.CHILD_CLAUSES
    source_commit: str = export_validator.SOURCE_COMMIT
    source_baseline_sha256: str = export_validator.SOURCE_BASELINE_SHA256

    @property
    def provisioned(self) -> bool:
        return self == PRODUCTION_EXPORT_SPEC


@dataclass(frozen=True)
class ExportPaths:
    child: Path


@dataclass(frozen=True)
class IngressPaths:
    parent: Path = export_validator.PARENT_PATH
    child: Path = export_validator.CHILD_PATH
    export_receipt: Path = RECEIPT_PATH
    manifest: Path = RECEIPT_PATH
    publisher: Path = PUBLISHER_PATH
    validator: Path = VALIDATOR_PATH
    lean_root: Path = export_validator.LEAN_ROOT_PATH
    lean_export: Path = export_validator.LEAN_EXPORT_PATH
    parent_lean_root: Path = export_validator.PARENT_LEAN_ROOT_PATH
    parent_lean_export: Path = export_validator.PARENT_LEAN_EXPORT_PATH
    audit_report: Path = AUDIT_REPORT_PATH
    coverage_ledger: Path = COVERAGE_LEDGER_PATH
    variable_map: Path = VARIABLE_MAP_PATH
    daemon_build_receipt: Path = DAEMON_BUILD_RECEIPT_PATH

    @property
    def export(self) -> ExportPaths:
        return ExportPaths(child=self.child)


@dataclass(frozen=True)
class IngressSpec:
    export: ExportSpec
    manifest_sha256: str = RECEIPT_SHA256
    daemon_sha256: str = DAEMON_SHA256
    daemon_source_commit: str = DAEMON_SOURCE_COMMIT
    daemon_build_receipt_sha256: str = DAEMON_BUILD_RECEIPT_SHA256
    daemon_protocol_version: int = DAEMON_PROTOCOL_VERSION
    solver_name: str = SOLVER_NAME
    solver_sha256: str = SOLVER_SHA256
    solver_signature: str = SOLVER_SIGNATURE
    backend: str = BACKEND
    solver_profile: str = SOLVER_PROFILE

    @property
    def provisioned(self) -> bool:
        return self == PRODUCTION_INGRESS_SPEC


PRODUCTION_EXPORT_SPEC = ExportSpec()
PRODUCTION_INGRESS_PATHS = IngressPaths()
PRODUCTION_INGRESS_SPEC = IngressSpec(export=PRODUCTION_EXPORT_SPEC)


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise IngressValidationError(message)


def _is_sha256(value: object) -> bool:
    return (
        type(value) is str
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _open_regular_nofollow(
    path: Path, *, require_single_link: bool = True
) -> tuple[BinaryIO, os.stat_result]:
    absolute = Path(os.path.abspath(path))
    parts = absolute.parts
    _require(bool(parts) and parts[0] == os.path.sep and len(parts) > 1, "unsafe path")
    directory_flags = (
        os.O_RDONLY
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_CLOEXEC", 0)
    )
    file_flags = (
        os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0) | getattr(os, "O_CLOEXEC", 0)
    )
    directories: list[int] = []
    descriptor: int | None = None
    try:
        parent = os.open(os.path.sep, directory_flags)
        directories.append(parent)
        for component in parts[1:-1]:
            child = os.open(component, directory_flags, dir_fd=parent)
            named = os.stat(component, dir_fd=parent, follow_symlinks=False)
            opened = os.fstat(child)
            _require(
                (named.st_dev, named.st_ino) == (opened.st_dev, opened.st_ino),
                f"path component changed while opening {path}",
            )
            directories.append(child)
            parent = child
        descriptor = os.open(parts[-1], file_flags, dir_fd=parent)
        before = os.fstat(descriptor)
        named_file = os.stat(parts[-1], dir_fd=parent, follow_symlinks=False)
        _require(stat.S_ISREG(before.st_mode), f"not a regular file: {path}")
        if require_single_link:
            _require(before.st_nlink == 1, f"file is not singly linked: {path}")
        _require(
            (named_file.st_dev, named_file.st_ino) == (before.st_dev, before.st_ino),
            f"file changed while opening: {path}",
        )
        stream = os.fdopen(descriptor, "rb", closefd=True)
        descriptor = None
        return stream, before
    except OSError as exc:
        raise IngressValidationError(
            f"cannot open without following links: {path}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        for directory in reversed(directories):
            os.close(directory)


def _attest(
    path: Path,
    expected: FileBinding,
    label: str,
    *,
    require_single_link: bool = True,
) -> dict[str, object]:
    digest = hashlib.sha256()
    count = 0
    with _open_regular_nofollow(path, require_single_link=require_single_link)[
        0
    ] as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
            count += len(block)
    _require(count == expected.bytes, f"{label} byte count drifted")
    _require(digest.hexdigest() == expected.sha256, f"{label} SHA-256 drifted")
    return {
        "path": str(path.resolve()),
        "sha256": expected.sha256,
        "bytes": expected.bytes,
    }


def _strict_json(raw: bytes, label: str) -> dict[str, Any]:
    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                raise IngressValidationError(f"{label} has duplicate JSON key {key!r}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            object_pairs_hook=pairs,
            parse_constant=lambda value: (_ for _ in ()).throw(
                IngressValidationError(f"{label} has invalid constant {value}")
            ),
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise IngressValidationError(f"{label} is not strict JSON") from exc
    _require(type(value) is dict, f"{label} must be a JSON object")
    return value


def _read_bound(
    path: Path, expected: FileBinding, label: str
) -> tuple[bytes, dict[str, object]]:
    with _open_regular_nofollow(path)[0] as stream:
        raw = stream.read(expected.bytes + 1)
    _require(len(raw) == expected.bytes, f"{label} byte count drifted")
    _require(
        hashlib.sha256(raw).hexdigest() == expected.sha256, f"{label} SHA-256 drifted"
    )
    return raw, {
        "path": str(path.resolve()),
        "sha256": expected.sha256,
        "bytes": expected.bytes,
    }


def _expected_receipt(
    paths: IngressPaths, validation: dict[str, Any]
) -> tuple[dict[str, Any], dict[str, dict[str, object]]]:
    parent_artifact = {
        key: validation["parent"][key] for key in ("path", "sha256", "bytes")
    }
    child_artifact = {
        key: validation["child"][key] for key in ("path", "sha256", "bytes")
    }
    artifacts = {
        "parent_cnf": parent_artifact,
        "child_cnf": child_artifact,
        "lean_root": _attest(
            paths.lean_root,
            FileBinding(export_validator.LEAN_ROOT_SHA256, 113_317),
            "Lean root",
        ),
        "lean_export": _attest(
            paths.lean_export,
            FileBinding(export_validator.LEAN_EXPORT_SHA256, 1_452),
            "Lean exporter",
        ),
        "publisher_script": _attest(
            paths.publisher, FileBinding(PUBLISHER_SHA256, PUBLISHER_BYTES), "publisher"
        ),
        "independent_audit_script": _attest(
            paths.validator,
            FileBinding(VALIDATOR_SHA256, VALIDATOR_BYTES),
            "independent validator",
        ),
        "independent_audit_report": _attest(
            paths.audit_report,
            FileBinding(AUDIT_REPORT_SHA256, AUDIT_REPORT_BYTES),
            "independent audit report",
        ),
        "coverage_ledger": _attest(
            paths.coverage_ledger,
            FileBinding(COVERAGE_LEDGER_SHA256, COVERAGE_LEDGER_BYTES),
            "coverage ledger",
        ),
    }
    source_imports = {
        "parent_lean_root": _attest(
            paths.parent_lean_root,
            FileBinding(export_validator.PARENT_LEAN_ROOT_SHA256, 8_330),
            "parent Lean root",
        ),
        "parent_lean_export": _attest(
            paths.parent_lean_export,
            FileBinding(export_validator.PARENT_LEAN_EXPORT_SHA256, 1_273),
            "parent Lean exporter",
        ),
    }
    expected = {
        "schema": RECEIPT_SCHEMA,
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "profile_id": "exact17-current-root-two-kalmanson",
        "source_commit": export_validator.SOURCE_COMMIT,
        "source_baseline_sha256": export_validator.SOURCE_BASELINE_SHA256,
        "parent_source_commit": export_validator.PARENT_SOURCE_COMMIT,
        "publisher_source_commit": PUBLISHER_SOURCE_COMMIT,
        "validator_source_commit": VALIDATOR_SOURCE_COMMIT,
        "parent": validation["parent"],
        "child": validation["child"],
        "ordered_suffix": validation["suffix"],
        "artifacts": artifacts,
        "source_imports": source_imports,
        "coverage_ledger": {
            "schema": COVERAGE_LEDGER_SCHEMA,
            "sha256": COVERAGE_LEDGER_SHA256,
        },
        "policy": {
            "candidate_fsynced_after_validation": True,
            "candidate_private_workspace": True,
            "candidate_reserved_inode": True,
            "component_wise_nofollow": True,
            "create_once": True,
            "direct_lean_export": True,
            "exact_parent_body_prefix": True,
            "final_child_revalidated": True,
            "independent_suffix_replay": True,
            "publisher_committed_baseline": True,
            "receipt_written_last": True,
            "solver_result_claimed": False,
        },
    }
    return expected, artifacts


def validate_ingress(
    paths: IngressPaths = PRODUCTION_INGRESS_PATHS,
    *,
    spec: IngressSpec = PRODUCTION_INGRESS_SPEC,
    expected_manifest_sha256: str | None = None,
) -> dict[str, Any]:
    """Replay the export and authenticate every identity used at launch."""

    _require(
        spec.provisioned, "current-root-two-kalmanson PIQD ingress is unprovisioned"
    )
    _require(_is_sha256(spec.manifest_sha256), "receipt SHA-256 pin is malformed")
    if expected_manifest_sha256 is not None:
        _require(
            _is_sha256(expected_manifest_sha256), "explicit manifest pin is malformed"
        )
        _require(
            expected_manifest_sha256 == spec.manifest_sha256,
            "manifest pin arguments disagree",
        )
    _require(
        paths.manifest == paths.export_receipt,
        "PIQD producer manifest must be the v2 export receipt itself",
    )
    validation = export_validator.validate_export(paths.parent, paths.child)
    receipt_raw, receipt_binding = _read_bound(
        paths.export_receipt,
        FileBinding(RECEIPT_SHA256, RECEIPT_BYTES),
        "v2 export receipt",
    )
    receipt = _strict_json(receipt_raw, "v2 export receipt")
    expected_receipt, artifacts = _expected_receipt(paths, validation)
    _require(receipt == expected_receipt, "v2 export receipt content drifted")
    variable_map = _attest(
        paths.variable_map,
        FileBinding(VARIABLE_MAP_SHA256, VARIABLE_MAP_BYTES),
        "exact17 variable map",
    )
    daemon_receipt = _attest(
        paths.daemon_build_receipt,
        FileBinding(DAEMON_BUILD_RECEIPT_SHA256, DAEMON_BUILD_RECEIPT_BYTES),
        "PIQD daemon build receipt",
        require_single_link=False,
    )
    return {
        "schema": INGRESS_SCHEMA,
        "status": "PASS",
        "dimacs": {
            "path": str(paths.child.resolve()),
            "sha256": spec.export.child_sha256,
            "bytes": spec.export.child_bytes,
            "variables": spec.export.variables,
            "clauses": spec.export.child_clauses,
        },
        "export_receipt": {**receipt_binding, "schema": RECEIPT_SCHEMA},
        "source": {
            "commit": spec.export.source_commit,
            "baseline_sha256": spec.export.source_baseline_sha256,
            "theorem": "Problem97.ATailBlockerVExactSeventeenCurrentRootTwoKalmansonRefinements.sourceAssign_extendedCurrentRootTwoKalmansonCnf",
        },
        "publisher": artifacts["publisher_script"],
        "validator": artifacts["independent_audit_script"],
        "lean": {
            "root": artifacts["lean_root"],
            "export": artifacts["lean_export"],
        },
        "variable_map": variable_map,
        "piqd": {
            "ingress": "raw-dimacs/v1",
            "daemon_sha256": spec.daemon_sha256,
            "daemon_source_commit": spec.daemon_source_commit,
            "daemon_build_receipt": daemon_receipt,
            "daemon_protocol_version": spec.daemon_protocol_version,
            "solver_name": spec.solver_name,
            "solver_sha256": spec.solver_sha256,
            "solver_signature": spec.solver_signature,
            "backend": spec.backend,
            "solver_profile": spec.solver_profile,
            "timeout_s": TIMEOUT_S,
            "requested_core_limit": REQUESTED_CORE_LIMIT,
            "maximum_requested_core_limit": MAX_REQUESTED_CORE_LIMIT,
            "prepare_attempts": 1,
            "confirm_attempts": 1,
            "sat_requires_independent_model_replay": True,
            "unsat_certified_without_proof_replay": False,
        },
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.parse_args(argv)
    print(json.dumps(validate_ingress(), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
