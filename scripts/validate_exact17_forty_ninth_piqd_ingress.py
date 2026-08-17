"""Authenticate the provisioned FortyNinth raw-DIMACS PIQD ingress.

This adapter reuses the hardened weighted-successor ingress boundary while
pinning the FortyNinth child, receipt, validator, publisher, audit, and ledger.
It performs no PIQD or solver launch.
"""

from __future__ import annotations

import hashlib
import os
from itertools import combinations
from pathlib import Path
from typing import Any

import validate_exact17_forty_ninth_model_refinements_export as export_validator
import validate_exact17_weighted_successor_model_piqd_ingress as _base

ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = ROOT / "scratch/runs/exact17-forty-ninth-publication-20260816/export-v1"
PARENT_PACKAGE_ROOT = (
    ROOT
    / "scratch/runs/exact17-weighted-successor-model-publication-20260816/export-v1"
)
RECEIPT_PATH = PACKAGE_ROOT / "export-receipt.json"
AUDIT_REPORT_PATH = PACKAGE_ROOT / "independent-audit-report.json"
COVERAGE_LEDGER_PATH = PACKAGE_ROOT / "coverage-ledger.json"
PARENT_RECEIPT_PATH = PARENT_PACKAGE_ROOT / "export-receipt.json"
PARENT_AUDIT_REPORT_PATH = PARENT_PACKAGE_ROOT / "independent-audit-report.json"
PARENT_COVERAGE_LEDGER_PATH = PARENT_PACKAGE_ROOT / "coverage-ledger.json"
PUBLISHER_PATH = ROOT / "scripts/publish_exact17_forty_ninth_root.py"
VALIDATOR_PATH = (
    ROOT / "scripts/validate_exact17_forty_ninth_model_refinements_export.py"
)

INGRESS_SCHEMA = "p97-exact17-forty-ninth-piqd-ingress/v1"
RECEIPT_SCHEMA = "p97-exact17-forty-ninth-immutable-export-receipt/v1"
RECEIPT_SHA256 = "a9a54e254925354e65d5eae884a2565583030b7b43ce474b5875765abaa8e656"
RECEIPT_BYTES = 3_976
PUBLISHER_SOURCE_COMMIT = "87b6a4594791bffa3601fb431044624a2613595c"
VALIDATOR_SOURCE_COMMIT = "1a517947b5a96c926a1d7bb55fa0763ecabfd041"
PUBLISHER_SHA256 = "94e57910cd88baa7ebf393d43159f93086d5d6963e47d03841bea3e5be2bc582"
PUBLISHER_BYTES = 11_067
VALIDATOR_SHA256 = "fa251edd61234d222f89f345d770159bb1307ca2bb632a904b33051da5032c8d"
VALIDATOR_BYTES = 10_869
AUDIT_REPORT_SHA256 = "7aaff042bce5abb0811f789e6206eb63d9a7ab114809e3840634e90a66703911"
AUDIT_REPORT_BYTES = 1_904
COVERAGE_LEDGER_SHA256 = (
    "23c52a2d391938c280f8c31ed5b4a0ada152e6f265c1534d67f65b7a29cf1704"
)
COVERAGE_LEDGER_BYTES = 2_747
COVERAGE_LEDGER_SCHEMA = "p97-exact17-forty-ninth-coverage-ledger/v1"
CHILD_SHA256 = "5b95f49958ec25f6d893bc27af748d93e93073256763b81842c7d16f23d7a4c5"
CHILD_BYTES = 338_661_334
CHILD_CLAUSES = 7_198_668
VARIABLES = 308

# The parent package and PIQD daemon/variable-map pins are inherited custody
# inputs from the authenticated weighted-successor publication.
PARENT_RECEIPT_SHA256 = (
    "d664514e7bb95738e8a43245c2f20afcb3c8f051274ffb24fdd43e89c360142d"
)
PARENT_RECEIPT_BYTES = 4_983
PARENT_RECEIPT_SCHEMA = (
    "p97-exact17-weighted-successor-model-immutable-export-receipt/v1"
)
PARENT_AUDIT_REPORT_SHA256 = (
    "1e681f4765afd17425ddcc76144c273d9247edce11d0b8e4d4f781041ec961dc"
)
PARENT_AUDIT_REPORT_BYTES = 1_561
PARENT_COVERAGE_LEDGER_SHA256 = (
    "66a8e23fe866524f34810fe10952a2d04793972ad749a4c866da6f8644fa2ab0"
)
PARENT_COVERAGE_LEDGER_BYTES = 2_282
PARENT_COVERAGE_LEDGER_SCHEMA = (
    "p97-exact17-weighted-successor-model-coverage-ledger/v1"
)
VARIABLE_MAP_PATH = _base.VARIABLE_MAP_PATH
DAEMON_BUILD_RECEIPT_PATH = _base.DAEMON_BUILD_RECEIPT_PATH
VARIABLE_MAP_SHA256 = _base.VARIABLE_MAP_SHA256
VARIABLE_MAP_BYTES = _base.VARIABLE_MAP_BYTES
DAEMON_SHA256 = _base.DAEMON_SHA256
DAEMON_SOURCE_COMMIT = _base.DAEMON_SOURCE_COMMIT
DAEMON_BUILD_RECEIPT_SHA256 = _base.DAEMON_BUILD_RECEIPT_SHA256
DAEMON_BUILD_RECEIPT_BYTES = _base.DAEMON_BUILD_RECEIPT_BYTES
DAEMON_PROTOCOL_VERSION = _base.DAEMON_PROTOCOL_VERSION
SOLVER_NAME = _base.SOLVER_NAME
SOLVER_SHA256 = _base.SOLVER_SHA256
SOLVER_SIGNATURE = _base.SOLVER_SIGNATURE
BACKEND = _base.BACKEND
SOLVER_PROFILE = _base.SOLVER_PROFILE
REQUESTED_CORE_LIMIT = 1
MAX_REQUESTED_CORE_LIMIT = 12
TIMEOUT_S = 3_600

IngressValidationError = _base.IngressValidationError
FileBinding = _base.FileBinding
ExportSpec = _base.ExportSpec
ExportPaths = _base.ExportPaths
IngressPaths = _base.IngressPaths
IngressSpec = _base.IngressSpec
_open_regular_nofollow = _base._open_regular_nofollow
_strict_json = _base._strict_json
_read_bound = _base._read_bound
_attest = _base._attest


def _streaming_validate_export(
    parent_path: Path = export_validator.PARENT_PATH,
    child_path: Path = export_validator.CHILD_PATH,
    *,
    check_support: bool = True,
    spec: Any = None,
) -> dict[str, object]:
    """Validate parent/prefix/suffix identities without materializing CNF."""

    if check_support:
        for path, commit, digest, label in (
            (
                export_validator.LEAN_ROOT_PATH,
                export_validator.SOURCE_COMMIT,
                export_validator.LEAN_ROOT_SHA256,
                "FortyNinth Lean source",
            ),
            (
                export_validator.LEAN_EXPORT_PATH,
                export_validator.SOURCE_COMMIT,
                export_validator.LEAN_EXPORT_SHA256,
                "FortyNinth Lean exporter",
            ),
            (
                export_validator.PARENT_LEAN_ROOT_PATH,
                export_validator.PARENT_SOURCE_COMMIT,
                export_validator.PARENT_LEAN_ROOT_SHA256,
                "FortyEighth Lean source",
            ),
            (
                export_validator.PARENT_LEAN_EXPORT_PATH,
                export_validator.PARENT_SOURCE_COMMIT,
                export_validator.PARENT_LEAN_EXPORT_SHA256,
                "FortyEighth Lean exporter",
            ),
            (
                export_validator.SOURCE_BRIDGE_PATH,
                export_validator.SOURCE_BRIDGE_COMMIT,
                export_validator.SOURCE_BRIDGE_SHA256,
                "weighted source bridge",
            ),
        ):
            export_validator._base._require_committed_source(
                path, commit, digest, label
            )
        export_validator._mine()

    production = spec or export_validator._base.ExportSpec(
        parent_sha256=export_validator.PARENT_SHA256,
        parent_bytes=export_validator.PARENT_BYTES,
        parent_clauses=export_validator.PARENT_CLAUSES,
        child_sha256=export_validator.CHILD_SHA256,
        child_bytes=export_validator.CHILD_BYTES,
        child_clauses=export_validator.CHILD_CLAUSES,
        variables=export_validator.VARIABLES,
    )
    suffix_lines = list(export_validator.expected_suffix_lines())
    suffix_sets = [frozenset(map(int, line.split()[:-1])) for line in suffix_lines]
    witnesses = [0] * len(suffix_lines)
    subset_indices: dict[frozenset[int], list[int]] = {}
    for index, suffix in enumerate(suffix_sets):
        suffix_values = tuple(suffix)
        for size in range(1, len(suffix_values) + 1):
            for subset in combinations(suffix_values, size):
                subset_indices.setdefault(frozenset(subset), []).append(index)
    parent_digest = hashlib.sha256()
    child_digest = hashlib.sha256()
    suffix_digest = hashlib.sha256()
    parent_bytes = child_bytes = parent_body_count = child_body_count = 0
    with (
        export_validator._base._open_regular_nofollow(parent_path) as parent,
        export_validator._base._open_regular_nofollow(child_path) as child,
    ):
        parent_stat = os.fstat(parent.fileno())
        child_stat = os.fstat(child.fileno())
        parent_header = parent.readline()
        child_header = child.readline()
        if not parent_header or not child_header:
            raise ValueError("DIMACS header missing")
        parent_digest.update(parent_header)
        child_digest.update(child_header)
        parent_bytes += len(parent_header)
        child_bytes += len(child_header)
        export_validator._base._parse_header(parent_header, production.parent_clauses)
        export_validator._base._parse_header(child_header, production.child_clauses)
        while True:
            parent_line = parent.readline()
            if not parent_line:
                break
            child_line = child.readline()
            if not child_line or child_line != parent_line:
                raise ValueError("parent prefix bytes drifted")
            parent_digest.update(parent_line)
            child_digest.update(child_line)
            parent_bytes += len(parent_line)
            child_bytes += len(child_line)
            parent_body_count += 1
            fields = parent_line.split()
            if not fields or fields[-1] != b"0":
                raise ValueError("malformed parent clause")
            clause = frozenset(map(int, fields[:-1]))
            for index in subset_indices.get(clause, ()):
                witnesses[index] += 1
        for suffix_line in suffix_lines:
            child_line = child.readline()
            if child_line != suffix_line:
                raise ValueError("weighted successor suffix drifted")
            child_digest.update(child_line)
            suffix_digest.update(child_line)
            child_bytes += len(child_line)
            child_body_count += 1
        if child.readline():
            raise ValueError("clause census drifted")
        parent_after = os.fstat(parent.fileno())
        child_after = os.fstat(child.fileno())
    for before, after, label in (
        (parent_stat, parent_after, "parent"),
        (child_stat, child_after, "child"),
    ):
        if (
            before.st_dev,
            before.st_ino,
            before.st_size,
            before.st_mtime_ns,
            before.st_nlink,
        ) != (
            after.st_dev,
            after.st_ino,
            after.st_size,
            after.st_mtime_ns,
            after.st_nlink,
        ):
            raise ValueError(f"{label} changed during validation")
    if (
        parent_body_count != production.parent_clauses
        or child_body_count != export_validator.SUFFIX_CLAUSES
    ):
        raise ValueError("clause census drifted")
    if (
        parent_bytes != production.parent_bytes
        or parent_digest.hexdigest() != production.parent_sha256
    ):
        raise ValueError("parent identity drifted")
    child_hash = child_digest.hexdigest()
    if child_bytes != production.child_bytes or child_hash != production.child_sha256:
        raise ValueError("child identity drifted")
    indices = tuple(i for i, count in enumerate(witnesses) if count)
    census = {
        "complete": True,
        "parent_subsumed_suffix_clause_indices": indices,
        "parent_subsumed_suffix_clause_count": len(indices),
        "witness_counts": tuple(witnesses[i] for i in indices),
        "witness_total": sum(witnesses),
    }
    suffix = {
        "sha256": suffix_digest.hexdigest(),
        "bytes": child_bytes - parent_bytes + len(parent_header) - len(child_header),
        "clauses": export_validator.SUFFIX_CLAUSES,
        "occurrences": export_validator.OCCURRENCES,
        "clauses_per_occurrence": export_validator.CLAUSES_PER_OCCURRENCE,
    }
    if suffix["sha256"] != export_validator.EXPECTED_SUFFIX_SHA256:
        raise ValueError("ordered FortyNinth suffix digest drifted")
    if (
        tuple(indices) != export_validator.EXPECTED_PARENT_SUBSUMED_SUFFIX_INDICES
        or tuple(census["witness_counts"])
        != export_validator.EXPECTED_PARENT_SUBSUMPTION_WITNESS_COUNTS
        or census["witness_total"] != 128
    ):
        raise ValueError("parent-subsumption witness census drifted")
    return {
        "schema": export_validator.VALIDATION_SCHEMA,
        "status": "PASS",
        "parent": {
            "path": str(parent_path.resolve()),
            "sha256": production.parent_sha256,
            "bytes": parent_bytes,
            "clauses": production.parent_clauses,
        },
        "child": {
            "path": str(child_path.resolve()),
            "sha256": child_hash,
            "bytes": child_bytes,
            "clauses": production.child_clauses,
        },
        "suffix": suffix,
        "parent_subsumption_census": census,
    }


PRODUCTION_EXPORT_SPEC = ExportSpec(
    child_sha256=CHILD_SHA256,
    child_bytes=CHILD_BYTES,
    variables=VARIABLES,
    child_clauses=CHILD_CLAUSES,
    source_commit=export_validator.SOURCE_COMMIT,
    source_baseline_sha256=export_validator.SOURCE_BASELINE_SHA256,
)
PRODUCTION_INGRESS_PATHS = IngressPaths(
    parent=export_validator.PARENT_PATH,
    child=export_validator.CHILD_PATH,
    export_receipt=RECEIPT_PATH,
    manifest=RECEIPT_PATH,
    publisher=PUBLISHER_PATH,
    validator=VALIDATOR_PATH,
    lean_root=export_validator.LEAN_ROOT_PATH,
    lean_export=export_validator.LEAN_EXPORT_PATH,
    parent_lean_root=export_validator.PARENT_LEAN_ROOT_PATH,
    parent_lean_export=export_validator.PARENT_LEAN_EXPORT_PATH,
    source_bridge=export_validator.SOURCE_BRIDGE_PATH,
    audit_report=AUDIT_REPORT_PATH,
    coverage_ledger=COVERAGE_LEDGER_PATH,
    parent_export_receipt=PARENT_RECEIPT_PATH,
    parent_audit_report=PARENT_AUDIT_REPORT_PATH,
    parent_coverage_ledger=PARENT_COVERAGE_LEDGER_PATH,
    variable_map=VARIABLE_MAP_PATH,
    daemon_build_receipt=DAEMON_BUILD_RECEIPT_PATH,
)
PRODUCTION_INGRESS_SPEC = IngressSpec(
    export=PRODUCTION_EXPORT_SPEC,
    manifest_sha256=RECEIPT_SHA256,
    daemon_sha256=DAEMON_SHA256,
    daemon_source_commit=DAEMON_SOURCE_COMMIT,
    daemon_build_receipt_sha256=DAEMON_BUILD_RECEIPT_SHA256,
    daemon_protocol_version=DAEMON_PROTOCOL_VERSION,
    solver_name=SOLVER_NAME,
    solver_sha256=SOLVER_SHA256,
    solver_signature=SOLVER_SIGNATURE,
    backend=BACKEND,
    solver_profile=SOLVER_PROFILE,
)


def _configure_base() -> None:
    export_validator.validate_export = _streaming_validate_export
    _base.export_validator = export_validator
    for name in (
        "PACKAGE_ROOT",
        "PARENT_PACKAGE_ROOT",
        "RECEIPT_PATH",
        "AUDIT_REPORT_PATH",
        "COVERAGE_LEDGER_PATH",
        "PARENT_RECEIPT_PATH",
        "PARENT_AUDIT_REPORT_PATH",
        "PARENT_COVERAGE_LEDGER_PATH",
        "PUBLISHER_PATH",
        "VALIDATOR_PATH",
        "RECEIPT_SCHEMA",
        "RECEIPT_SHA256",
        "RECEIPT_BYTES",
        "PUBLISHER_SOURCE_COMMIT",
        "VALIDATOR_SOURCE_COMMIT",
        "PUBLISHER_SHA256",
        "PUBLISHER_BYTES",
        "VALIDATOR_SHA256",
        "VALIDATOR_BYTES",
        "AUDIT_REPORT_SHA256",
        "AUDIT_REPORT_BYTES",
        "COVERAGE_LEDGER_SHA256",
        "COVERAGE_LEDGER_BYTES",
        "COVERAGE_LEDGER_SCHEMA",
        "CHILD_SHA256",
        "CHILD_BYTES",
        "CHILD_CLAUSES",
        "VARIABLES",
        "REQUESTED_CORE_LIMIT",
        "MAX_REQUESTED_CORE_LIMIT",
        "TIMEOUT_S",
        "PARENT_RECEIPT_SCHEMA",
        "PARENT_RECEIPT_SHA256",
        "PARENT_RECEIPT_BYTES",
        "PARENT_AUDIT_REPORT_SHA256",
        "PARENT_AUDIT_REPORT_BYTES",
        "PARENT_COVERAGE_LEDGER_SHA256",
        "PARENT_COVERAGE_LEDGER_BYTES",
        "PARENT_COVERAGE_LEDGER_SCHEMA",
        "VARIABLE_MAP_PATH",
        "DAEMON_BUILD_RECEIPT_PATH",
        "VARIABLE_MAP_SHA256",
        "VARIABLE_MAP_BYTES",
        "DAEMON_SHA256",
        "DAEMON_SOURCE_COMMIT",
        "DAEMON_BUILD_RECEIPT_SHA256",
        "DAEMON_BUILD_RECEIPT_BYTES",
        "DAEMON_PROTOCOL_VERSION",
        "SOLVER_NAME",
        "SOLVER_SHA256",
        "SOLVER_SIGNATURE",
        "BACKEND",
        "SOLVER_PROFILE",
    ):
        setattr(_base, name, globals()[name])
    _base.PRODUCTION_EXPORT_SPEC = PRODUCTION_EXPORT_SPEC
    _base.PRODUCTION_INGRESS_PATHS = PRODUCTION_INGRESS_PATHS
    _base.PRODUCTION_INGRESS_SPEC = PRODUCTION_INGRESS_SPEC


def _expected_receipt(paths: IngressPaths, validation: dict[str, Any]):
    """Use the pinned receipt bytes as the canonical publication manifest."""
    raw, _binding = _base._read_bound(
        paths.export_receipt,
        FileBinding(RECEIPT_SHA256, RECEIPT_BYTES),
        "FortyNinth export receipt",
    )
    receipt = _base._strict_json(raw, "FortyNinth export receipt")
    _base._require(
        receipt.get("schema") == RECEIPT_SCHEMA, "FortyNinth receipt schema drifted"
    )
    _base._require(receipt.get("status") == "PASS", "FortyNinth receipt status drifted")
    _base._require(
        receipt.get("profile_id") == "exact17-forty-ninth-model2",
        "FortyNinth receipt profile drifted",
    )
    child = receipt.get("child", {})
    _base._require(
        child.get("sha256") == CHILD_SHA256
        and child.get("bytes") == CHILD_BYTES
        and child.get("clauses") == CHILD_CLAUSES,
        "FortyNinth child receipt identity drifted",
    )
    artifacts = receipt.get("artifacts", {})
    for key, digest, size in (
        ("publisher_script", PUBLISHER_SHA256, PUBLISHER_BYTES),
        ("independent_audit_script", VALIDATOR_SHA256, VALIDATOR_BYTES),
        ("independent_audit_report", AUDIT_REPORT_SHA256, AUDIT_REPORT_BYTES),
        ("coverage_ledger", COVERAGE_LEDGER_SHA256, COVERAGE_LEDGER_BYTES),
    ):
        _base._require(
            artifacts.get(key, {}).get("sha256") == digest
            and artifacts.get(key, {}).get("bytes") == size,
            f"FortyNinth {key} identity drifted",
        )
    return receipt, artifacts


def validate_ingress(
    paths: IngressPaths = PRODUCTION_INGRESS_PATHS,
    *,
    spec: IngressSpec = PRODUCTION_INGRESS_SPEC,
    expected_manifest_sha256: str | None = None,
) -> dict[str, Any]:
    _configure_base()
    _base._expected_receipt = _expected_receipt
    result = _base.validate_ingress(
        paths, spec=spec, expected_manifest_sha256=expected_manifest_sha256
    )
    result["schema"] = INGRESS_SCHEMA
    result["source"]["theorem"] = (
        "Problem97.ATailBlockerVExactSeventeenFortyNinthModelRefinements."
        "sourceAssign_extendedFortyNinthModelRefinementsCnf"
    )
    result["piqd"]["timeout_s"] = TIMEOUT_S
    result["piqd"]["requested_core_limit"] = REQUESTED_CORE_LIMIT
    result["piqd"]["maximum_requested_core_limit"] = MAX_REQUESTED_CORE_LIMIT
    return result


_configure_base()


if __name__ == "__main__":
    import json

    print(json.dumps(validate_ingress(), indent=2, sort_keys=True))
