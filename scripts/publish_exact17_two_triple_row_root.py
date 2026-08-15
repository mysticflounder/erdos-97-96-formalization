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
PACKAGE_ROOT = ROOT / "scratch/exact17-two-triple-row-package-v2"
CHILD_PATH = validator.CHILD_PATH
RECEIPT_PATH = PACKAGE_ROOT / "export-receipt.json"
AUDIT_REPORT_PATH = PACKAGE_ROOT / "independent-audit-report.json"
COVERAGE_LEDGER_PATH = PACKAGE_ROOT / "coverage-ledger.json"
VALIDATOR_PATH = Path(validator.__file__).resolve()
PUBLISHER_PATH = Path(__file__).resolve()
VALIDATOR_SOURCE_COMMIT = "1ddf7f3e5074bac0619b00644e4d94dd2181fe4e"
VALIDATOR_SHA256 = "a149334e8377de3d1d92e90a0ba9d1d99c2f6a1d11ef6cf0a14c72ee6269f171"
RECEIPT_SCHEMA = "p97-exact17-two-triple-row-immutable-export-receipt/v2"
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
    validator_relative = str(paths.validator_script.relative_to(ROOT))
    validator_commit = subprocess.run(
        ["git", "log", "-1", "--format=%H", "--", validator_relative],
        cwd=ROOT, check=True, capture_output=True, text=True,
    )
    if validator_commit.stdout.strip() != VALIDATOR_SOURCE_COMMIT:
        raise ValueError("independent validator commit binding drifted")
    if validator.sha256_file(paths.validator_script) != VALIDATOR_SHA256:
        raise ValueError("independent validator hash drifted")


def _run_lean(output: Path, paths: PublicationPaths) -> None:
    subprocess.run(
        ["lake", "env", "lean", "--run", str(paths.lean_export.relative_to(ROOT / "lean")), str(output.resolve())],
        cwd=ROOT / "lean", check=True,
    )


def _open_directory_nofollow(path: Path, *, create: bool) -> int:
    absolute = Path(os.path.abspath(path))
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    descriptor = os.open(absolute.anchor, flags)
    try:
        for component in absolute.parts[1:]:
            try:
                child = os.open(component, flags, dir_fd=descriptor)
            except FileNotFoundError:
                if not create:
                    raise
                os.mkdir(component, 0o755, dir_fd=descriptor)
                child = os.open(component, flags, dir_fd=descriptor)
            except OSError as error:
                raise ValueError(f"publication path traverses a non-directory or symlink: {path}") from error
            os.close(descriptor)
            descriptor = child
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _ensure_real_directory(path: Path) -> None:
    descriptor = _open_directory_nofollow(path, create=True)
    os.close(descriptor)


def _fsync_directory(path: Path) -> None:
    descriptor = _open_directory_nofollow(path, create=False)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _write_exclusive_readonly(path: Path, data: bytes) -> None:
    parent = _open_directory_nofollow(path.parent, create=True)
    descriptor = os.open(
        path.name,
        os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
        0o444,
        dir_fd=parent,
    )
    try:
        offset = 0
        while offset < len(data):
            offset += os.write(descriptor, data[offset:])
        os.fsync(descriptor)
    except BaseException:
        os.close(descriptor)
        os.unlink(path.name, dir_fd=parent)
        os.close(parent)
        raise
    else:
        os.close(descriptor)
        os.fsync(parent)
        os.close(parent)


def _publish_candidate(candidate: Path, child: Path) -> None:
    source_parent = _open_directory_nofollow(candidate.parent, create=False)
    target_parent = _open_directory_nofollow(child.parent, create=False)
    try:
        info = os.stat(candidate.name, dir_fd=source_parent, follow_symlinks=False)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise ValueError("Lean export candidate is not an exclusive regular file")
        os.chmod(candidate.name, 0o444, dir_fd=source_parent, follow_symlinks=False)
        os.link(
            candidate.name,
            child.name,
            src_dir_fd=source_parent,
            dst_dir_fd=target_parent,
            follow_symlinks=False,
        )
        os.unlink(candidate.name, dir_fd=source_parent)
        os.fsync(source_parent)
        if target_parent != source_parent:
            os.fsync(target_parent)
    finally:
        os.close(source_parent)
        os.close(target_parent)


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
    for directory in {
        paths.child.parent, paths.receipt.parent, paths.audit_report.parent, paths.coverage_ledger.parent,
    }:
        _ensure_real_directory(directory)
    candidate = paths.child.parent / f".two-triple-row-{secrets.token_hex(16)}.cnf"
    published: list[Path] = []
    try:
        _run_lean(candidate, paths)
        candidate_validation = validator.validate_export(paths.parent, candidate)
        ledger = coverage_ledger()
        _publish_candidate(candidate, paths.child)
        published.append(paths.child)
        validation = validator.validate_export(paths.parent, paths.child)
        published_child = validation["child"]
        candidate_child = candidate_validation["child"]
        if not isinstance(published_child, dict) or not isinstance(candidate_child, dict) or any(
            published_child[key] != candidate_child[key] for key in ("sha256", "bytes", "clauses")
        ):
            raise ValueError("published child identity differs from validated candidate")
        audit = {
            "schema": AUDIT_SCHEMA,
            "status": "PASS",
            "validator": _artifact(paths.validator_script),
            "validation": validation,
        }
        _write_exclusive_readonly(paths.audit_report, canonical_json_bytes(audit))
        published.append(paths.audit_report)
        _write_exclusive_readonly(paths.coverage_ledger, canonical_json_bytes(ledger))
        published.append(paths.coverage_ledger)
        receipt = {
            "schema": RECEIPT_SCHEMA, "status": "PASS", "publication_state": "PROVISIONED",
            "profile_id": "exact17-two-triple-row", "source_commit": validator.SOURCE_COMMIT,
            "source_baseline_sha256": validator.SOURCE_BASELINE_SHA256,
            "parent_source_commit": validator.PARENT_SOURCE_COMMIT, "parent": validation["parent"],
            "child": published_child, "ordered_suffix": validation["suffix"],
            "artifacts": {
                "parent_cnf": _artifact(paths.parent), "child_cnf": _artifact(paths.child),
                "lean_root": _artifact(paths.lean_root), "lean_export": _artifact(paths.lean_export),
                "publisher_script": _artifact(PUBLISHER_PATH),
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
            _fsync_directory(path.parent)
        raise


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.parse_args(argv)
    print(json.dumps(publish(), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
