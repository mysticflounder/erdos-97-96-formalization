"""Create-once publication of the authenticated exact-17 FortySixth root."""

from __future__ import annotations

import argparse
import json
import os
import secrets
import stat
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import validate_exact17_forty_sixth_model_refinements_export as validator

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = validator.PARENT_PATH
CHILD_PATH = (
    ROOT
    / "scratch/exact17-lean-to-sat/exact17-child46-forty-sixth-model-refinements.cnf"
)
RECEIPT_PATH = ROOT / "scratch/exact17-lean-to-sat/child46-export-receipt.json"
LEAN_ROOT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortySixthModelRefinements.lean"
)
LEAN_EXPORT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortySixthModelRefinementsExport.lean"
)
STRICT_RECEIPT_PATH = (
    ROOT / "scratch/exact17-child45-wave-mine/strict-validate-replay-production.json"
)
ENVELOPE_PATH = (
    ROOT / "scratch/cegar-wave-v2/exact17-child45-nextcenter-assumption-output.json"
)
LEDGER_PATH = (
    ROOT / "scratch/exact17-child45-wave-mine/child45-wave-occurrence-ledger.json"
)

SCHEMA = "p97-exact17-child46-immutable-export-receipt/v1"
VALIDATION_SCHEMA = "p97-exact17-forty-sixth-export-validation/v1"
STRICT_RECEIPT_SHA256 = (
    "4aad001c679627fa2797cbe4f207c3ff574dfa363f00cab223a5e73bee7f6160"
)
ENVELOPE_SHA256 = "28786f4898730b6776b0ce656eb16fbf74d25beed54e269a97fcf333dd3f2ee4"
ENVELOPE_EMBEDDED_SHA256 = (
    "bc388ef9ccc39508f4be786131f04a0139a9bdd3c494933a7d886ad97e6cc85f"
)
LEDGER_SHA256 = "93f8ea5b5e50ff43788bb556521a2d0e320178d045fed2c00868fd5a2d683006"
LEAN_ROOT_SHA256 = "b8d285ac9b85821ac7634103d9fa8fe9588747c0a57659a28e6e1dee4a9ae127"
LEAN_EXPORT_SHA256 = "d0e9b23007b7c8051eb4f46c95d0b5d28563a523d10b3d916d795310d78d8a81"
CHILD_SHA256 = validator.CHILD_SHA256
CHILD_BYTES = validator.CHILD_BYTES
CHILD_CLAUSES = validator.CHILD_CLAUSES
PARENT_SHA256 = validator.PARENT_SHA256
PARENT_BYTES = validator.PARENT_BYTES
PARENT_CLAUSES = validator.PARENT_CLAUSES
VARIABLES = validator.VARIABLES


@dataclass(frozen=True)
class PublicationPaths:
    parent: Path = PARENT_PATH
    child: Path = CHILD_PATH
    receipt: Path = RECEIPT_PATH
    lean_root: Path = LEAN_ROOT_PATH
    lean_export: Path = LEAN_EXPORT_PATH
    strict_receipt: Path = STRICT_RECEIPT_PATH
    envelope: Path = ENVELOPE_PATH
    ledger: Path = LEDGER_PATH


PRODUCTION_PATHS = PublicationPaths()


def _record_path(path: Path) -> str:
    return str(path.resolve())


def _open_directory_nofollow(path: Path) -> int:
    absolute = Path(os.path.abspath(path))
    if not absolute.is_absolute():
        raise ValueError("publication directory must be absolute")
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    descriptor = os.open(os.path.sep, flags)
    try:
        for component in absolute.parts[1:]:
            next_descriptor = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = next_descriptor
        if not stat.S_ISDIR(os.fstat(descriptor).st_mode):
            raise ValueError("publication parent is not a directory")
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _assert_absent(directory_fd: int, name: str, label: str) -> None:
    try:
        os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    except FileNotFoundError:
        return
    raise FileExistsError(f"refusing to replace existing {label}: {name}")


def _require_support(path: Path, expected_sha256: str) -> None:
    import hashlib

    if not path.is_absolute() or path != path.resolve():
        raise ValueError(
            f"support artifact path is not absolute and normalized: {path}"
        )
    directory_fd = _open_directory_nofollow(path.parent)
    try:
        descriptor = os.open(
            path.name,
            os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=directory_fd,
        )
        try:
            initial = os.fstat(descriptor)
            if (
                not stat.S_ISREG(initial.st_mode)
                or initial.st_nlink != 1
                or initial.st_uid != os.getuid()
            ):
                raise ValueError(
                    f"support artifact is not an exclusive regular file: {path}"
                )
            digest = hashlib.sha256()
            while block := os.read(descriptor, 1 << 20):
                digest.update(block)
            final = os.fstat(descriptor)
            if (
                initial.st_dev,
                initial.st_ino,
                initial.st_size,
                initial.st_mtime_ns,
            ) != (final.st_dev, final.st_ino, final.st_size, final.st_mtime_ns):
                raise ValueError(f"support artifact changed during hashing: {path}")
            current = os.stat(path.name, dir_fd=directory_fd, follow_symlinks=False)
            if (initial.st_dev, initial.st_ino, initial.st_mode, initial.st_nlink) != (
                current.st_dev,
                current.st_ino,
                current.st_mode,
                current.st_nlink,
            ):
                raise ValueError(
                    f"support artifact path changed during hashing: {path}"
                )
            if digest.hexdigest() != expected_sha256:
                raise ValueError(f"support artifact hash drifted: {path}")
        finally:
            os.close(descriptor)
    finally:
        os.close(directory_fd)


def _run_lean(output: Path) -> None:
    relative = LEAN_EXPORT_PATH.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(
        ["lake", "env", "lean", "--run", str(relative), str(output)],
        cwd=ROOT / "lean",
        check=True,
    )


def _validate_candidate(paths: PublicationPaths, candidate: Path) -> dict[str, Any]:
    return validator.validate_export(paths.parent, candidate)


def _publish_receipt(path: Path, payload: dict[str, Any], directory_fd: int) -> None:
    _assert_absent(directory_fd, path.name, "FortySixth receipt")
    temporary = f".{path.name}.{secrets.token_hex(12)}.candidate"
    fd = os.open(
        temporary,
        os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
        0o600,
        dir_fd=directory_fd,
    )
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            json.dump(payload, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.link(
            temporary,
            path.name,
            src_dir_fd=directory_fd,
            dst_dir_fd=directory_fd,
            follow_symlinks=False,
        )
        os.fsync(directory_fd)
    finally:
        try:
            os.unlink(temporary, dir_fd=directory_fd)
        except FileNotFoundError:
            pass


def _receipt(paths: PublicationPaths, validation: dict[str, Any]) -> dict[str, Any]:
    expected_keys = {
        "schema",
        "status",
        "parent_sha256",
        "child_sha256",
        "parent_bytes",
        "child_bytes",
        "variables",
        "parent_clauses",
        "new_clauses",
        "child_clauses",
        "ordered_suffix_sha256",
        "parent_subsumed_suffix_indices",
        "authenticated_model_cut_suffix_indices",
        "cell_model_rejections",
    }
    if type(validation) is not dict or set(validation) != expected_keys:
        raise ValueError("FortySixth validation schema drifted")
    if (
        validation["schema"] != VALIDATION_SCHEMA
        or validation["status"] != "PASS"
        or validation["parent_sha256"] != PARENT_SHA256
        or validation["child_sha256"] != CHILD_SHA256
        or validation["parent_bytes"] != PARENT_BYTES
        or validation["child_bytes"] != CHILD_BYTES
        or validation["variables"] != VARIABLES
        or validation["parent_clauses"] != PARENT_CLAUSES
        or validation["new_clauses"] != validator.NEW_CLAUSES
        or validation["child_clauses"] != CHILD_CLAUSES
        or validation["ordered_suffix_sha256"] != validator.ORDERED_SUFFIX_SHA256
        or validation["parent_subsumed_suffix_indices"]
        != list(validator.PARENT_SUBSUMED_SUFFIX_INDICES)
        or validation["authenticated_model_cut_suffix_indices"]
        != list(validator.AUTHENTICATED_MODEL_CUT_SUFFIX_INDICES)
        or len(validation["cell_model_rejections"]) != 13
    ):
        raise ValueError("FortySixth validation identity drifted")
    return {
        "schema": SCHEMA,
        "status": "PASS",
        "publication_state": "PROVISIONED",
        "immutability": "exclusive-hard-link-and-ledger-last-receipt/v2",
        "parent": {
            "path": _record_path(paths.parent),
            "sha256": PARENT_SHA256,
            "bytes": PARENT_BYTES,
            "clauses": PARENT_CLAUSES,
            "variables": VARIABLES,
        },
        "child": {
            "path": _record_path(paths.child),
            "sha256": CHILD_SHA256,
            "bytes": CHILD_BYTES,
            "clauses": CHILD_CLAUSES,
            "variables": VARIABLES,
        },
        "lean": {
            "root": {"path": _record_path(paths.lean_root), "sha256": LEAN_ROOT_SHA256},
            "export": {
                "path": _record_path(paths.lean_export),
                "sha256": LEAN_EXPORT_SHA256,
            },
        },
        "strict_replay_receipt": {
            "path": _record_path(paths.strict_receipt),
            "sha256": STRICT_RECEIPT_SHA256,
        },
        "terminal_envelope": {
            "path": _record_path(paths.envelope),
            "sha256": ENVELOPE_SHA256,
            "embedded_sha256": ENVELOPE_EMBEDDED_SHA256,
        },
        "occurrence_ledger": {
            "path": _record_path(paths.ledger),
            "sha256": LEDGER_SHA256,
        },
        "validation": {**validation, "schema": VALIDATION_SCHEMA, "status": "PASS"},
    }


def publish(paths: PublicationPaths = PRODUCTION_PATHS) -> dict[str, Any]:
    if (
        CHILD_SHA256 is None
        or CHILD_BYTES is None
        or PARENT_SHA256 is None
        or PARENT_BYTES is None
    ):
        raise ValueError("FortySixth publication identities are unprovisioned")
    for path, digest in (
        (paths.parent, PARENT_SHA256),
        (paths.lean_root, LEAN_ROOT_SHA256),
        (paths.lean_export, LEAN_EXPORT_SHA256),
        (paths.strict_receipt, STRICT_RECEIPT_SHA256),
        (paths.envelope, ENVELOPE_SHA256),
        (paths.ledger, LEDGER_SHA256),
    ):
        _require_support(path, digest)
    child_directory_fd = _open_directory_nofollow(paths.child.parent)
    try:
        receipt_directory_fd = _open_directory_nofollow(paths.receipt.parent)
    except BaseException:
        os.close(child_directory_fd)
        raise
    published_identity: tuple[int, int] | None = None
    try:
        _assert_absent(child_directory_fd, paths.child.name, "FortySixth root")
        _assert_absent(receipt_directory_fd, paths.receipt.name, "FortySixth receipt")
        with tempfile.TemporaryDirectory(
            prefix="exact17-child46-export-", dir=paths.child.parent
        ) as temporary:
            candidate = Path(temporary) / paths.child.name
            _run_lean(candidate)
            validation = _validate_candidate(paths, candidate)
            os.link(
                candidate,
                paths.child.name,
                dst_dir_fd=child_directory_fd,
                follow_symlinks=False,
            )
            os.fsync(child_directory_fd)
            candidate_stat = os.stat(candidate, follow_symlinks=False)
            published_identity = (candidate_stat.st_dev, candidate_stat.st_ino)
            payload = _receipt(paths, validation)
            _publish_receipt(paths.receipt, payload, receipt_directory_fd)
            return payload
    except BaseException:
        if published_identity is not None:
            try:
                current = os.stat(
                    paths.child.name, dir_fd=child_directory_fd, follow_symlinks=False
                )
                try:
                    os.stat(
                        paths.receipt.name,
                        dir_fd=receipt_directory_fd,
                        follow_symlinks=False,
                    )
                    receipt_exists = True
                except FileNotFoundError:
                    receipt_exists = False
                if (
                    not receipt_exists
                    and (current.st_dev, current.st_ino) == published_identity
                ):
                    os.unlink(paths.child.name, dir_fd=child_directory_fd)
                    os.fsync(child_directory_fd)
            except FileNotFoundError:
                pass
        raise
    finally:
        os.close(child_directory_fd)
        os.close(receipt_directory_fd)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.parse_args(argv)
    print(json.dumps(publish(), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
