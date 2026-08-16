"""Authenticate the published exact-17 small-role-cycle PIQD ingress.

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
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO

import validate_exact17_small_role_cycle_export as export_validator
import validate_exact17_small_role_cycle_ingress as package_ingress_gate

ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = ROOT / "scratch/exact17-small-role-cycle-package-v2"
RECEIPT_PATH = PACKAGE_ROOT / "export-receipt.json"
AUDIT_REPORT_PATH = PACKAGE_ROOT / "independent-audit-report.json"
COVERAGE_LEDGER_PATH = PACKAGE_ROOT / "coverage-ledger.json"
PUBLISHER_PATH = ROOT / "scripts/publish_exact17_small_role_cycle_root.py"
VALIDATOR_PATH = ROOT / "scripts/validate_exact17_small_role_cycle_export.py"
PACKAGE_INGRESS_PATH = ROOT / "scripts/validate_exact17_small_role_cycle_ingress.py"
VARIABLE_MAP_PATH = ROOT / "census/p97_search/waves/exact17/child40/variable-map.json"
DAEMON_BUILD_RECEIPT_PATH = (
    ROOT / "scratch/exact17-lean-to-sat/piqd-child35-daemon-build-receipt.txt"
)

INGRESS_SCHEMA = "p97-exact17-small-role-cycle-piqd-ingress/v1"
RECEIPT_SCHEMA = "p97-exact17-small-role-cycle-immutable-export-receipt/v2"
RECEIPT_SHA256 = "40fd89e9f15cd3785d6b4ba32e3ff34d71cb1d2d0f431e9ff8d6e0eacd154bea"
RECEIPT_BYTES = 7_907
PACKAGE_INGRESS_SOURCE_COMMIT = "068fb1ad48ba39e77da5484394e513dbc77b644f"
PACKAGE_INGRESS_SHA256 = (
    "a88c7689d507947019b7706c45ce6074f6b21ca0f0a61bfd2345f0622cd75c12"
)
PACKAGE_INGRESS_BYTES = 41_471
PUBLISHER_SOURCE_COMMIT = "b08ffa990154be39546350683eda2c38ec567706"
VALIDATOR_SOURCE_COMMIT = "fef0b6d8e62ff78466e18f93069fef102bb6efc1"
PUBLISHER_SHA256 = "eca9bf297387e2feb258b6ef7c85a032cb00875fc02f4f2777ce93cb691cad11"
PUBLISHER_BYTES = 53_805
VALIDATOR_SHA256 = "d30660888cb713f2a0744039146197da5c38639c5cdcdfafa0bda772b82ed836"
VALIDATOR_BYTES = 36_158
AUDIT_REPORT_SHA256 = "aa4dee01befb776f62ed76340050bf51c02bdb449718cd27cd425bee64fcde21"
AUDIT_REPORT_BYTES = 3_658
COVERAGE_LEDGER_SHA256 = (
    "1680474cbf526d55f7d2a7e191450dd9db72c599dc0f08148034e917cc77cd91"
)
COVERAGE_LEDGER_BYTES = 3_182
COVERAGE_LEDGER_SCHEMA = "p97-exact17-small-role-cycle-coverage-ledger/v2"
VARIABLE_MAP_SHA256 = "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
VARIABLE_MAP_BYTES = 23_341
DAEMON_SHA256 = "f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089"
DAEMON_SOURCE_COMMIT = "acefb4aba14765d45e38ac4193373f0aa210f22d"
DAEMON_BUILD_RECEIPT_SHA256 = (
    "6e9c1d5c203d59ac2b29f800d73f4dbb0395b97865433f412ff4aa44c8e1b0a9"
)
DAEMON_BUILD_RECEIPT_BYTES = 6_895
DAEMON_BUILD_RECEIPT_LINKS = 3
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
    child: Path = PACKAGE_ROOT / "exact17-small-role-cycle.cnf"
    export_receipt: Path = RECEIPT_PATH
    manifest: Path = RECEIPT_PATH
    publisher: Path = PUBLISHER_PATH
    validator: Path = VALIDATOR_PATH
    package_ingress: Path = PACKAGE_INGRESS_PATH
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


def _required_open_flag(
    name: str, *, error_type: type[Exception] = IngressValidationError
) -> int:
    """Return one security-critical open flag or fail before any filesystem call."""

    value = getattr(os, name, None)
    if type(value) is not int or value == 0:
        raise error_type(f"required open flag {name} is unavailable")
    return value


def _close_fds_best_effort(
    descriptors: list[int],
    *,
    error_type: type[Exception] = IngressValidationError,
) -> None:
    """Attempt every close and preserve an exception already being propagated."""

    active_error = sys.exc_info()[1]
    first_error: OSError | None = None
    for descriptor in descriptors:
        try:
            os.close(descriptor)
        except OSError as exc:
            if first_error is None:
                first_error = exc
    if first_error is not None and active_error is None:
        raise error_type("failed to close every custody descriptor") from first_error


def _open_regular_nofollow(
    path: Path, *, expected_links: int = 1
) -> tuple[BinaryIO, os.stat_result]:
    absolute = Path(os.path.abspath(path))
    parts = absolute.parts
    _require(bool(parts) and parts[0] == os.path.sep and len(parts) > 1, "unsafe path")
    directory_flag = _required_open_flag("O_DIRECTORY")
    nofollow_flag = _required_open_flag("O_NOFOLLOW")
    cloexec_flag = _required_open_flag("O_CLOEXEC")
    directory_flags = os.O_RDONLY | directory_flag | nofollow_flag | cloexec_flag
    file_flags = os.O_RDONLY | nofollow_flag | cloexec_flag
    directories: list[int] = []
    descriptor: int | None = None
    try:
        named_root = os.stat(os.path.sep, follow_symlinks=False)
        parent = os.open(os.path.sep, directory_flags)
        directories.append(parent)
        opened_root = os.fstat(parent)
        named_root_after = os.stat(os.path.sep, follow_symlinks=False)
        _require(
            stat.S_ISDIR(named_root.st_mode)
            and stat.S_ISDIR(opened_root.st_mode)
            and stat.S_ISDIR(named_root_after.st_mode)
            and named_root.st_nlink >= 1
            and named_root.st_nlink == opened_root.st_nlink == named_root_after.st_nlink
            and (named_root.st_dev, named_root.st_ino)
            == (opened_root.st_dev, opened_root.st_ino)
            == (named_root_after.st_dev, named_root_after.st_ino),
            f"root directory changed while opening {path}",
        )
        for component in parts[1:-1]:
            named = os.stat(component, dir_fd=parent, follow_symlinks=False)
            _require(
                stat.S_ISDIR(named.st_mode) and named.st_nlink >= 1,
                f"not a directory component: {path}",
            )
            child: int | None = None
            try:
                child = os.open(component, directory_flags, dir_fd=parent)
                opened = os.fstat(child)
                named_after = os.stat(component, dir_fd=parent, follow_symlinks=False)
                _require(
                    stat.S_ISDIR(opened.st_mode)
                    and stat.S_ISDIR(named_after.st_mode)
                    and opened.st_nlink >= 1
                    and named.st_nlink == opened.st_nlink == named_after.st_nlink
                    and (named.st_dev, named.st_ino)
                    == (opened.st_dev, opened.st_ino)
                    == (named_after.st_dev, named_after.st_ino),
                    f"path component changed while opening {path}",
                )
                directories.append(child)
                parent = child
                child = None
            finally:
                if child is not None:
                    os.close(child)
        named_file = os.stat(parts[-1], dir_fd=parent, follow_symlinks=False)
        _require(stat.S_ISREG(named_file.st_mode), f"not a regular file: {path}")
        _require(
            type(expected_links) is int
            and expected_links >= 1
            and named_file.st_nlink == expected_links,
            f"file link count drifted: {path}",
        )
        descriptor = os.open(parts[-1], file_flags, dir_fd=parent)
        before = os.fstat(descriptor)
        named_file_after = os.stat(parts[-1], dir_fd=parent, follow_symlinks=False)
        _require(
            stat.S_ISREG(before.st_mode)
            and stat.S_ISREG(named_file_after.st_mode)
            and named_file.st_nlink == before.st_nlink == named_file_after.st_nlink
            and (named_file.st_dev, named_file.st_ino)
            == (before.st_dev, before.st_ino)
            == (named_file_after.st_dev, named_file_after.st_ino),
            f"file changed while opening: {path}",
        )
        try:
            _close_fds_best_effort(list(reversed(directories)))
        finally:
            directories.clear()
        stream = os.fdopen(descriptor, "rb", closefd=True)
        descriptor = None
        return stream, before
    except OSError as exc:
        raise IngressValidationError(
            f"cannot open without following links: {path}"
        ) from exc
    finally:
        owned = ([descriptor] if descriptor is not None else []) + list(
            reversed(directories)
        )
        _close_fds_best_effort(owned)


def _attest(
    path: Path,
    expected: FileBinding,
    label: str,
    *,
    expected_links: int = 1,
) -> dict[str, object]:
    digest = hashlib.sha256()
    count = 0
    with _open_regular_nofollow(path, expected_links=expected_links)[0] as stream:
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


def _type_exact_equal(left: object, right: object) -> bool:
    if type(left) is not type(right):
        return False
    if isinstance(left, dict):
        return left.keys() == right.keys() and all(
            _type_exact_equal(left[key], right[key]) for key in left
        )
    if isinstance(left, list):
        return len(left) == len(right) and all(
            _type_exact_equal(a, b) for a, b in zip(left, right, strict=True)
        )
    return left == right


def _expected_package_ingress(paths: IngressPaths, spec: IngressSpec) -> dict[str, Any]:
    """The sole PASS object authorized to cross into the PIQD wrapper."""

    return {
        "schema": package_ingress_gate.INGRESS_SCHEMA,
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "profile_id": "exact17-small-role-cycle",
        "package_root": str(PACKAGE_ROOT),
        "required_package_entries": [
            "coverage-ledger.json",
            "exact17-small-role-cycle.cnf",
            "export-receipt.json",
            "independent-audit-report.json",
        ],
        "child": {
            "path": str(paths.child),
            "sha256": spec.export.child_sha256,
            "bytes": spec.export.child_bytes,
            "variables": spec.export.variables,
            "clauses": spec.export.child_clauses,
        },
        "audit_report": {
            "path": str(paths.audit_report),
            "sha256": AUDIT_REPORT_SHA256,
            "bytes": AUDIT_REPORT_BYTES,
        },
        "coverage_ledger": {
            "path": str(paths.coverage_ledger),
            "sha256": COVERAGE_LEDGER_SHA256,
            "bytes": COVERAGE_LEDGER_BYTES,
        },
        "export_receipt": {
            "path": str(paths.export_receipt),
            "sha256": RECEIPT_SHA256,
            "bytes": RECEIPT_BYTES,
            "schema": RECEIPT_SCHEMA,
        },
        "validation": {
            "committed_validator_full_replay": True,
            "check_support": True,
            "exact_redundancy_census": True,
            "parent_model_cut_indices": [
                87_731,
                94_189,
                106_818,
                109_198,
                149_786,
                154_928,
                156_728,
            ],
        },
    }


def validate_ingress(
    paths: IngressPaths = PRODUCTION_INGRESS_PATHS,
    *,
    spec: IngressSpec = PRODUCTION_INGRESS_SPEC,
    expected_manifest_sha256: str | None = None,
) -> dict[str, Any]:
    """Replay the export and authenticate every identity used at launch."""

    _require(
        spec.provisioned,
        "small-role-cycle PIQD ingress is unprovisioned",
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
    package_ingress_script = _attest(
        paths.package_ingress,
        FileBinding(PACKAGE_INGRESS_SHA256, PACKAGE_INGRESS_BYTES),
        "independent package-ingress gate",
    )
    try:
        package_ingress = package_ingress_gate.validate_ingress()
    except package_ingress_gate.IngressValidationError as exc:
        raise IngressValidationError(
            "independent package-ingress gate rejected the package"
        ) from exc
    _require(
        _type_exact_equal(package_ingress, _expected_package_ingress(paths, spec)),
        "independent package-ingress gate did not return the exact authorized PASS object",
    )
    receipt_raw, receipt_binding = _read_bound(
        paths.export_receipt,
        FileBinding(RECEIPT_SHA256, RECEIPT_BYTES),
        "v2 export receipt",
    )
    _strict_json(receipt_raw, "v2 export receipt")
    publisher = _attest(
        paths.publisher, FileBinding(PUBLISHER_SHA256, PUBLISHER_BYTES), "publisher"
    )
    validator = _attest(
        paths.validator,
        FileBinding(VALIDATOR_SHA256, VALIDATOR_BYTES),
        "independent validator",
    )
    lean_root = _attest(
        paths.lean_root,
        FileBinding(export_validator.LEAN_ROOT_SHA256, 20_762),
        "Lean root",
    )
    lean_export = _attest(
        paths.lean_export,
        FileBinding(export_validator.LEAN_EXPORT_SHA256, 1_262),
        "Lean exporter",
    )
    variable_map = _attest(
        paths.variable_map,
        FileBinding(VARIABLE_MAP_SHA256, VARIABLE_MAP_BYTES),
        "exact17 variable map",
    )
    daemon_receipt = _attest(
        paths.daemon_build_receipt,
        FileBinding(DAEMON_BUILD_RECEIPT_SHA256, DAEMON_BUILD_RECEIPT_BYTES),
        "PIQD daemon build receipt",
        expected_links=DAEMON_BUILD_RECEIPT_LINKS,
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
        "package_ingress": {
            **package_ingress_script,
            "source_commit": PACKAGE_INGRESS_SOURCE_COMMIT,
            "result": package_ingress,
        },
        "source": {
            "commit": spec.export.source_commit,
            "baseline_sha256": spec.export.source_baseline_sha256,
            "theorem": "Problem97.ATailBlockerVExactSeventeenSmallRoleCycleRefinements.sourceAssign_extendedSmallRoleCycleCnf",
        },
        "publisher": {**publisher, "source_commit": PUBLISHER_SOURCE_COMMIT},
        "validator": {**validator, "source_commit": VALIDATOR_SOURCE_COMMIT},
        "lean": {
            "root": lean_root,
            "export": lean_export,
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
