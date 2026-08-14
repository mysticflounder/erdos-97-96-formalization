"""Publish the isolated Child45 Lean export with immutable custody gates."""

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

from validate_exact17_forty_fifth_model_refinements_export import (
    CHILD_PATH,
    FINAL_PATH,
    LEAN_EXPORT_PATH,
    LEAN_ROOT_PATH,
    MODEL_PATH,
    PARENT_PATH,
    PRODUCTION_SPEC,
    RECEIPT_PATH,
    ROOT,
    ExportSpec,
    UnprovisionedError,
    sha256_file,
    validate_export,
)


@dataclass(frozen=True)
class ExportPaths:
    parent: Path = PARENT_PATH
    model: Path = MODEL_PATH
    final: Path = FINAL_PATH
    lean_root: Path = LEAN_ROOT_PATH
    lean_export: Path = LEAN_EXPORT_PATH
    child: Path = CHILD_PATH
    receipt: Path = RECEIPT_PATH


PRODUCTION_PATHS = ExportPaths()


def _open_directory_nofollow(path: Path) -> int:
    absolute = Path(os.path.abspath(path))
    if not absolute.is_absolute():
        raise ValueError(f"publication path is not absolute: {path}")
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    descriptor = os.open(os.path.sep, flags)
    try:
        for component in absolute.parts[1:]:
            next_descriptor = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = next_descriptor
        if not stat.S_ISDIR(os.fstat(descriptor).st_mode):
            raise ValueError(f"publication parent is not a directory: {path}")
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


def _publish_receipt(path: Path, payload: dict[str, Any], directory_fd: int) -> None:
    _assert_absent(directory_fd, path.name, "Child45 receipt")
    candidate = f".{path.name}.{secrets.token_hex(12)}.candidate"
    fd = os.open(candidate, os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0), 0o600, dir_fd=directory_fd)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            json.dump(payload, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.link(candidate, path.name, src_dir_fd=directory_fd, dst_dir_fd=directory_fd, follow_symlinks=False)
        os.fsync(directory_fd)
    finally:
        try:
            os.unlink(candidate, dir_fd=directory_fd)
        except FileNotFoundError:
            pass


def _run_lean(output: Path) -> None:
    relative = LEAN_EXPORT_PATH.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(["lake", "env", "lean", "--run", str(relative), str(output)], cwd=ROOT / "lean", check=True)


def export_child45(paths: ExportPaths = PRODUCTION_PATHS, *, spec: ExportSpec = PRODUCTION_SPEC) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("Child45 export is UNPROVISIONED")
    if sha256_file(paths.parent) != spec.parent_sha256:
        raise ValueError("authenticated Child44 parent drifted")
    child_directory_fd = _open_directory_nofollow(paths.child.parent)
    try:
        receipt_directory_fd = _open_directory_nofollow(paths.receipt.parent)
    except BaseException:
        os.close(child_directory_fd)
        raise
    published_identity: tuple[int, int] | None = None
    try:
        _assert_absent(child_directory_fd, paths.child.name, "Child45 root")
        _assert_absent(receipt_directory_fd, paths.receipt.name, "Child45 receipt")
        with tempfile.TemporaryDirectory(prefix="exact17-child45-export-", dir=ROOT / "scratch/exact17-lean-to-sat") as temporary:
            candidate = Path(temporary) / paths.child.name
            _run_lean(candidate)
            validation = validate_export(paths.parent, candidate, paths.model, final_path=paths.final, spec=spec, live_export_path=candidate)
            os.link(candidate, paths.child.name, dst_dir_fd=child_directory_fd, follow_symlinks=False)
            os.fsync(child_directory_fd)
            candidate_stat = os.stat(candidate, follow_symlinks=False)
            published_identity = (candidate_stat.st_dev, candidate_stat.st_ino)
            receipt = {
                "schema": "p97-exact17-child45-immutable-export-receipt/v1",
                "status": "PASS",
                "publication_state": "PROVISIONED",
                "parent": {"path": str(paths.parent.resolve()), "sha256": spec.parent_sha256, "bytes": spec.parent_bytes, "clauses": spec.parent_clauses},
                "lean": {"root": {"path": str(paths.lean_root.resolve()), "sha256": spec.lean_root_sha256}, "export": {"path": str(paths.lean_export.resolve()), "sha256": spec.lean_export_sha256}},
                "model": {"path": str(paths.model.resolve()), "sha256": spec.model_sha256},
                "final": validation["final"],
                "child": {"path": str(paths.child.resolve()), "sha256": spec.child_sha256, "bytes": spec.child_bytes, "variables": 308, "clauses": 5_848_824},
                "validation": validation,
                "immutability": "exclusive-hard-link-and-ledger-last-receipt/v2",
            }
            _publish_receipt(paths.receipt, receipt, receipt_directory_fd)
            return receipt
    except BaseException:
        if published_identity is not None:
            try:
                current = os.stat(paths.child.name, dir_fd=child_directory_fd, follow_symlinks=False)
                receipt_exists = True
                try:
                    os.stat(paths.receipt.name, dir_fd=receipt_directory_fd, follow_symlinks=False)
                except FileNotFoundError:
                    receipt_exists = False
                if not receipt_exists and (current.st_dev, current.st_ino) == published_identity:
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
    parser.add_argument("export", nargs="?", choices=("export",), default="export")
    parser.parse_args(argv)
    print(json.dumps(export_child45(), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
