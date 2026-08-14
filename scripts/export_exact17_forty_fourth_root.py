"""Immutable live-Lean exporter for the exact-17 Child44 root."""

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
    sha256_file,
    validate_export,
)

ROOT = Path(__file__).resolve().parents[1]


@dataclass(frozen=True)
class ExportPaths:
    parent: Path = PARENT_PATH
    model: Path = MODEL_PATH
    final: Path = FINAL_PATH
    lean_export: Path = LEAN_EXPORT_PATH
    child: Path = CHILD_PATH
    receipt: Path = RECEIPT_PATH


PRODUCTION_PATHS = ExportPaths()


def _open_publication_dir(path: Path) -> int:
    """Open an immutable publication directory without following symlinks."""
    try:
        descriptor = open_directory_nofollow(path)
        if not stat.S_ISDIR(os.fstat(descriptor).st_mode):
            os.close(descriptor)
            raise ValueError(f"publication parent is not a directory: {path}")
        return descriptor
    except UnprovisionedError as error:
        raise UnprovisionedError(f"publication parent is absent: {path}") from error
    except (OSError, ValueError) as error:
        raise ValueError(f"publication parent contains a symlink or is not a directory: {path}") from error


def _fsync_dir_fd(descriptor: int) -> None:
    os.fsync(descriptor)


def _publish_receipt(path: Path, payload: dict[str, Any], directory_fd: int) -> None:
    candidate = f".{path.name}.{secrets.token_hex(12)}.candidate"
    fd = os.open(
        candidate,
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
        os.link(candidate, path.name, src_dir_fd=directory_fd, dst_dir_fd=directory_fd, follow_symlinks=False)
        _fsync_dir_fd(directory_fd)
    finally:
        try:
            os.unlink(candidate, dir_fd=directory_fd)
        except FileNotFoundError:
            pass


def _run_lean(output: Path) -> None:
    relative = LEAN_EXPORT_PATH.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(["lake", "env", "lean", "--run", str(relative), str(output)], cwd=ROOT / "lean", check=True)


def export_child44(paths: ExportPaths = PRODUCTION_PATHS, *, spec: ExportSpec = PRODUCTION_SPEC) -> dict[str, Any]:
    if not spec.provisioned:
        raise UnprovisionedError("Child44 export is UNPROVISIONED")
    if not paths.parent.is_file() or not paths.model.is_file() or sha256_file(paths.parent) != spec.parent_sha256:
        raise ValueError("authenticated Child43 parent drifted")
    child_directory_fd = _open_publication_dir(paths.child.parent)
    try:
        receipt_directory_fd = _open_publication_dir(paths.receipt.parent)
    except BaseException:
        os.close(child_directory_fd)
        raise
    try:
        try:
            os.stat(paths.child.name, dir_fd=child_directory_fd, follow_symlinks=False)
            raise FileExistsError("refusing to replace existing Child44 root")
        except FileNotFoundError:
            pass
        try:
            os.stat(paths.receipt.name, dir_fd=receipt_directory_fd, follow_symlinks=False)
            raise FileExistsError("refusing to replace existing Child44 receipt")
        except FileNotFoundError:
            pass
    except BaseException:
        os.close(child_directory_fd)
        os.close(receipt_directory_fd)
        raise
    temp_directory = tempfile.TemporaryDirectory(
        prefix="exact17-child44-export-",
        dir=ROOT / "scratch",
    )
    candidate = Path(temp_directory.name) / paths.child.name
    published_identity: tuple[int, int] | None = None
    try:
        _run_lean(candidate)
        validation = validate_export(paths.parent, candidate, paths.model, final_path=paths.final, spec=spec, live_export_path=candidate)
        os.link(candidate, paths.child.name, dst_dir_fd=child_directory_fd, follow_symlinks=False)
        _fsync_dir_fd(child_directory_fd)
        candidate_stat = os.stat(candidate, follow_symlinks=False)
        published_identity = (candidate_stat.st_dev, candidate_stat.st_ino)
        receipt = {
            "schema": "p97-exact17-child44-immutable-export-receipt/v1",
            "status": "PASS",
            "publication_state": "PROVISIONED",
            "parent": {"path": str(paths.parent.resolve()), "sha256": spec.parent_sha256},
            "lean": {"root": {"path": str(LEAN_ROOT_PATH.resolve()), "sha256": spec.lean_root_sha256}, "export": {"path": str(paths.lean_export.resolve()), "sha256": spec.lean_export_sha256}},
            "source": {"analysis": {"path": str(ANALYSIS_PATH.resolve()), "sha256": spec.analysis_sha256}},
            "model": {"path": str(paths.model.resolve()), "sha256": spec.model_sha256},
            "final": validation["final"],
            "child": {"path": str(paths.child.resolve()), "sha256": spec.child_sha256, "bytes": spec.child_bytes, "variables": 308, "clauses": 5_848_820},
            "validation": validation,
            "immutability": "exclusive-hard-link-and-ledger-last-receipt/v2",
        }
        _publish_receipt(paths.receipt, receipt, receipt_directory_fd)
        return receipt
    except BaseException:
        if published_identity is not None and not paths.receipt.exists():
            try:
                current = os.stat(paths.child.name, dir_fd=child_directory_fd, follow_symlinks=False)
            except FileNotFoundError:
                current = None
            if current is not None and (current.st_dev, current.st_ino) == published_identity:
                os.unlink(paths.child.name, dir_fd=child_directory_fd)
        raise
    finally:
        temp_directory.cleanup()
        os.close(child_directory_fd)
        os.close(receipt_directory_fd)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    subparsers.add_parser("export", help="publish the live Lean Child44 root")
    args = parser.parse_args(argv)
    if args.command == "export":
        print(json.dumps(export_child44(), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
