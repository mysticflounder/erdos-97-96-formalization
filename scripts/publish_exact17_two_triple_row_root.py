"""Create-once publication of the Lean-owned two-triple-row exact-17 root."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import secrets
import stat
import subprocess
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import validate_exact17_two_triple_row_export as validator

ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = ROOT / "scratch/exact17-two-triple-row-package"
CHILD_PATH = validator.CHILD_PATH
RECEIPT_PATH = PACKAGE_ROOT / "export-receipt.json"
AUDIT_REPORT_PATH = PACKAGE_ROOT / "independent-audit-report.json"
COVERAGE_LEDGER_PATH = PACKAGE_ROOT / "coverage-ledger.json"
VALIDATOR_PATH = Path(validator.__file__).resolve()
RECEIPT_SCHEMA = "p97-exact17-two-triple-row-immutable-export-receipt/v1"
COVERAGE_SCHEMA = "p97-exact17-two-triple-row-coverage-ledger/v1"
AUDIT_SCHEMA = "p97-exact17-two-triple-row-independent-audit/v1"


@dataclass(frozen=True)
class PublicationPaths:
    parent: Path = validator.PARENT_PATH
    child: Path = CHILD_PATH
    receipt: Path = RECEIPT_PATH
    audit_report: Path = AUDIT_REPORT_PATH
    coverage_ledger: Path = COVERAGE_LEDGER_PATH
    validator_script: Path = VALIDATOR_PATH
    lean_root: Path = validator.LEAN_ROOT_PATH
    lean_export: Path = validator.LEAN_EXPORT_PATH
    parent_lean_root: Path = validator.PARENT_LEAN_ROOT_PATH
    parent_lean_export: Path = validator.PARENT_LEAN_EXPORT_PATH


PRODUCTION_PATHS = PublicationPaths()


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode() + b"\n"


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _artifact(path: Path) -> dict[str, object]:
    digest = hashlib.sha256()
    byte_count = 0
    with validator._open_regular_nofollow(path) as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
            byte_count += len(block)
    return {"path": str(path.resolve()), "sha256": digest.hexdigest(), "bytes": byte_count}


def _require_source_commit(paths: PublicationPaths) -> None:
    for expected_commit, files, label in (
        (validator.SOURCE_COMMIT, (paths.lean_root, paths.lean_export), "Lean source"),
        (validator.PARENT_SOURCE_COMMIT, (paths.parent_lean_root, paths.parent_lean_export), "parent Lean source"),
    ):
        relative = [str(path.relative_to(ROOT)) for path in files]
        result = subprocess.run(
            ["git", "log", "-1", "--format=%H", "--", *relative],
            cwd=ROOT, check=True, capture_output=True, text=True,
        )
        if result.stdout.strip() != expected_commit:
            raise ValueError(f"{label} commit binding drifted")
    expected = {
        paths.lean_root: validator.LEAN_ROOT_SHA256,
        paths.lean_export: validator.LEAN_EXPORT_SHA256,
        paths.parent_lean_root: validator.PARENT_LEAN_ROOT_SHA256,
        paths.parent_lean_export: validator.PARENT_LEAN_EXPORT_SHA256,
    }
    for path, digest in expected.items():
        if validator.sha256_file(path) != digest:
            raise ValueError(f"source/import hash drifted: {path}")


def _run_lean(output: Path, paths: PublicationPaths) -> None:
    subprocess.run(
        ["lake", "env", "lean", "--run", str(paths.lean_export.relative_to(ROOT / "lean")), str(output.resolve())],
        cwd=ROOT / "lean", check=True,
    )


def _write_exclusive_readonly(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0), 0o444)
    try:
        offset = 0
        while offset < len(data):
            offset += os.write(descriptor, data[offset:])
        os.fsync(descriptor)
    except BaseException:
        os.close(descriptor)
        path.unlink(missing_ok=True)
        raise
    else:
        os.close(descriptor)


def _publish_candidate(candidate: Path, child: Path) -> None:
    info = candidate.stat(follow_symlinks=False)
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        raise ValueError("Lean export candidate is not an exclusive regular file")
    os.chmod(candidate, 0o444, follow_symlinks=False)
    os.link(candidate, child, follow_symlinks=False)
    candidate.unlink()


def coverage_ledger() -> dict[str, Any]:
    return {
        "schema": COVERAGE_SCHEMA,
        "status": "PASS",
        "profile_id": "exact17-two-triple-row",
        "source_baseline_sha256": validator.SOURCE_BASELINE_SHA256,
        "source_commit": validator.SOURCE_COMMIT,
        "parent_source_commit": validator.PARENT_SOURCE_COMMIT,
        "source_theorem": "Problem97.ATailBlockerVExactSeventeenTwoTripleRowRefinements.sourceAssign_extendedTwoTripleRowCnf",
        "terminal_adapter": "Problem97.ATailBlockerVExactSeventeenTwoTripleRowRefinements.false_of_sourceRealization_of_extendedTwoTripleRowCnf_unsat",
        "coverage_scope": "B:{A,C,D}, F:{A,D,E} over both named orders, both directions, all 17 cuts, and all increasing five-offset choices",
        "enumeration": {
            "families": 1, "named_orders": 2, "directions": 2, "cuts": 17,
            "five_offset_choices": 4368, "clauses_per_family": validator.CLAUSES_PER_FAMILY,
            "clauses": validator.SUFFIX_CLAUSES, "ordered_suffix_sha256": validator.SUFFIX_SHA256,
        },
        "claims": {"exact17_closure": False, "lean_closure": False, "source_entitlement": True, "theorem_coverage": False, "universal_lift": False},
    }


def publish(paths: PublicationPaths = PRODUCTION_PATHS) -> dict[str, Any]:
    """Run the official exporter, independently replay it, then publish once."""

    _require_source_commit(paths)
    for path in (paths.child, paths.receipt, paths.audit_report, paths.coverage_ledger):
        if path.exists() or path.is_symlink():
            raise FileExistsError(f"refusing to replace existing artifact: {path}")
    paths.child.parent.mkdir(parents=True, exist_ok=True)
    candidate = paths.child.parent / f".two-triple-row-{secrets.token_hex(16)}.cnf"
    published: list[Path] = []
    try:
        _run_lean(candidate, paths)
        validation = validator.validate_export(paths.parent, candidate)
        audit = {"schema": AUDIT_SCHEMA, "status": "PASS", "validator": _artifact(paths.validator_script), "validation": validation}
        ledger = coverage_ledger()
        _publish_candidate(candidate, paths.child)
        published.append(paths.child)
        _write_exclusive_readonly(paths.audit_report, canonical_json_bytes(audit))
        published.append(paths.audit_report)
        _write_exclusive_readonly(paths.coverage_ledger, canonical_json_bytes(ledger))
        published.append(paths.coverage_ledger)
        receipt = {
            "schema": RECEIPT_SCHEMA, "status": "PASS", "publication_state": "PROVISIONED",
            "profile_id": "exact17-two-triple-row", "source_commit": validator.SOURCE_COMMIT,
            "source_baseline_sha256": validator.SOURCE_BASELINE_SHA256,
            "parent_source_commit": validator.PARENT_SOURCE_COMMIT, "parent": validation["parent"],
            "child": validation["child"], "ordered_suffix": validation["suffix"],
            "artifacts": {
                "parent_cnf": _artifact(paths.parent), "child_cnf": _artifact(paths.child),
                "lean_root": _artifact(paths.lean_root), "lean_export": _artifact(paths.lean_export),
                "independent_audit_script": _artifact(paths.validator_script),
                "independent_audit_report": _artifact(paths.audit_report), "coverage_ledger": _artifact(paths.coverage_ledger),
            },
            "source_imports": {
                "parent_lean_root": _artifact(paths.parent_lean_root),
                "parent_lean_export": _artifact(paths.parent_lean_export),
            },
            "immutability": "exclusive-create-readonly-receipt-last/v1",
        }
        _write_exclusive_readonly(paths.receipt, canonical_json_bytes(receipt))
        return receipt
    except BaseException:
        candidate.unlink(missing_ok=True)
        for path in reversed(published):
            path.chmod(0o644, follow_symlinks=False)
            path.unlink(missing_ok=True)
        raise


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.parse_args(argv)
    print(json.dumps(publish(), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
