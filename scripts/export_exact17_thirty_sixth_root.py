"""Publish the Lean-owned exact-17 child36 root, fail closed."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import subprocess
import tempfile
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from validate_exact17_thirty_fifth_model_refinements_export import (
    PRODUCTION_SPEC,
    ExportSpec,
    UnprovisionedError,
    validate_export,
    validate_spec,
)

ROOT = Path(__file__).resolve().parents[1]
ATail = ROOT / "lean/Erdos9796Proof/P97/ATail"
SCRATCH = ROOT / "scratch/exact17-lean-to-sat"


@dataclass(frozen=True)
class ExportPaths:
    parent: Path
    model: Path
    lean_root: Path
    lean_export: Path
    refinement: Path
    child: Path
    receipt: Path


PRODUCTION_PATHS = ExportPaths(
    parent=SCRATCH / "exact17-thirty-fifth-root-thirty-fourth-model-refinements.cnf",
    model=SCRATCH / "piqd-child35-core1-custody-model.json",
    lean_root=ATail / "BlockerVExactSeventeenThirtyFifthModelRefinements.lean",
    lean_export=ATail / "BlockerVExactSeventeenThirtyFifthModelRefinementsExport.lean",
    refinement=ATail
    / "BlockerVExactSeventeenThirtyFifthCanonicalizedPerpendicularBisectorRefinement.lean",
    child=SCRATCH / "exact17-thirty-sixth-root-thirty-fifth-model-refinements.cnf",
    receipt=SCRATCH / "child36-export-receipt.json",
)
LeanRunner = Callable[[Path, Path], None]


@dataclass(frozen=True)
class FileSnapshot:
    path: Path
    dev: int
    ino: int
    mode: int
    nlink: int
    size: int
    mtime_ns: int
    ctime_ns: int
    sha256: str


def snapshot(path: Path) -> FileSnapshot:
    descriptor = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            raise ValueError(f"not a regular file: {path}")
        digest = hashlib.sha256()
        while block := os.read(descriptor, 1024 * 1024):
            digest.update(block)
        after = os.fstat(descriptor)
        identity = lambda item: (
            item.st_dev,
            item.st_ino,
            item.st_mode,
            item.st_nlink,
            item.st_size,
            item.st_mtime_ns,
            item.st_ctime_ns,
        )
        if identity(before) != identity(after):
            raise RuntimeError(f"file changed while hashing: {path}")
        return FileSnapshot(
            path,
            after.st_dev,
            after.st_ino,
            after.st_mode,
            after.st_nlink,
            after.st_size,
            after.st_mtime_ns,
            after.st_ctime_ns,
            digest.hexdigest(),
        )
    finally:
        os.close(descriptor)


def input_snapshots(paths: ExportPaths) -> dict[str, FileSnapshot]:
    return {
        name: snapshot(path)
        for name, path in {
            "parent": paths.parent,
            "model": paths.model,
            "lean_root": paths.lean_root,
            "lean_export": paths.lean_export,
            "refinement": paths.refinement,
        }.items()
    }


def unchanged(
    before: dict[str, FileSnapshot], paths: ExportPaths
) -> dict[str, FileSnapshot]:
    after = input_snapshots(paths)
    if after != before:
        raise RuntimeError("authenticated input changed during child36 publication")
    return after


def same_snapshot(left: FileSnapshot, right: FileSnapshot) -> bool:
    return (
        left.dev,
        left.ino,
        left.mode,
        left.nlink,
        left.size,
        left.mtime_ns,
        left.ctime_ns,
        left.sha256,
    ) == (
        right.dev,
        right.ino,
        right.mode,
        right.nlink,
        right.size,
        right.mtime_ns,
        right.ctime_ns,
        right.sha256,
    )


def absolute(path: Path) -> Path:
    return Path(os.path.abspath(os.fspath(path)))


def validate_paths(paths: ExportPaths, spec: ExportSpec) -> None:
    expected = {
        "parent": spec.parent_path,
        "model": spec.model_path,
        "lean_root": spec.lean_root_path,
        "lean_export": spec.lean_export_path,
        "refinement": spec.refinement_path,
        "child": spec.child_path,
        "receipt": spec.receipt_path,
    }
    for name, expected_path in expected.items():
        if absolute(getattr(paths, name)) != Path(expected_path):
            raise ValueError(f"{name} path is not the authenticated child36 path")
    input_snapshots(paths)


def fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def remove_owned_child(
    paths: ExportPaths, child_identity: tuple[int, int] | None
) -> None:
    if child_identity is None or os.path.lexists(paths.receipt):
        return
    if os.path.lexists(paths.child):
        metadata = os.lstat(paths.child)
        if (metadata.st_dev, metadata.st_ino) == child_identity:
            paths.child.unlink()
            fsync_directory(paths.child.parent)


def run_lean(source: Path, candidate: Path) -> None:
    relative = source.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(
        ["lake", "env", "lean", "--run", str(relative), str(candidate)],
        cwd=ROOT / "lean",
        check=True,
    )


def immutable_json(path: Path, payload: dict[str, Any]) -> None:
    receipt_identity: tuple[int, int] | None = None
    try:
        with path.open("x", encoding="utf-8") as handle:
            metadata = os.fstat(handle.fileno())
            receipt_identity = (metadata.st_dev, metadata.st_ino)
            json.dump(payload, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        fsync_directory(path.parent)
    except BaseException:
        if receipt_identity is not None and os.path.lexists(path):
            metadata = os.lstat(path)
            if (metadata.st_dev, metadata.st_ino) == receipt_identity:
                path.unlink()
                fsync_directory(path.parent)
        raise


def export_child36(
    paths: ExportPaths = PRODUCTION_PATHS,
    *,
    spec: ExportSpec = PRODUCTION_SPEC,
    lean_runner: LeanRunner = run_lean,
    before_receipt: Callable[[], None] | None = None,
) -> dict[str, Any]:
    validate_spec(spec, require_source_pins=True)
    if not spec.provisioned:
        raise UnprovisionedError("child36 export is UNPROVISIONED")
    validate_paths(paths, spec)
    if os.path.lexists(paths.child) or os.path.lexists(paths.receipt):
        raise FileExistsError("refusing to replace existing child36 or receipt")
    before = input_snapshots(paths)
    expected_hashes = {
        "parent": spec.parent_sha256,
        "model": spec.model_sha256,
        "lean_root": spec.lean_root_sha256,
        "lean_export": spec.lean_export_sha256,
        "refinement": spec.refinement_sha256,
    }
    for name, expected in expected_hashes.items():
        if expected is None or before[name].sha256 != expected:
            raise ValueError(f"{name} SHA-256 does not match authenticated pin")
    paths.child.parent.mkdir(parents=True, exist_ok=True)
    descriptor, candidate_name = tempfile.mkstemp(
        prefix=f".{paths.child.name}.",
        suffix=".candidate",
        dir=paths.child.parent,
    )
    os.close(descriptor)
    candidate = Path(candidate_name)
    published_identity: tuple[int, int] | None = None
    try:
        candidate.unlink()
        lean_runner(paths.lean_export, candidate)
        if not candidate.is_file() or candidate.is_symlink():
            raise RuntimeError("Lean exporter produced no regular DIMACS candidate")
        unchanged(before, paths)
        validation = validate_export(paths.parent, candidate, paths.model, spec=spec)
        if validation["status"] != "PASS":
            raise RuntimeError("unvalidated child36 candidate cannot be published")
        os.link(candidate, paths.child, follow_symlinks=False)
        linked = validate_export(paths.parent, paths.child, paths.model, spec=spec)
        if linked != validation:
            raise RuntimeError("child36 changed after immutable link")
        candidate_snapshot = snapshot(candidate)
        child_snapshot = snapshot(paths.child)
        if (candidate_snapshot.dev, candidate_snapshot.ino) != (
            child_snapshot.dev,
            child_snapshot.ino,
        ):
            raise RuntimeError("child36 candidate and child are not the same inode")
        published_identity = (child_snapshot.dev, child_snapshot.ino)
        if candidate_snapshot.nlink != 2 or child_snapshot.nlink != 2:
            raise RuntimeError("child36 candidate link count is not exactly two")
        if not same_snapshot(candidate_snapshot, child_snapshot):
            raise RuntimeError("child36 candidate and child snapshots diverged")
        unchanged(before, paths)
        fsync_directory(paths.child.parent)
    except BaseException:
        remove_owned_child(paths, published_identity)
        raise
    finally:
        candidate.unlink(missing_ok=True)
    try:
        if before_receipt is not None:
            before_receipt()
        final = unchanged(before, paths)
        child = snapshot(paths.child)
        if (
            child.nlink != 1
            or child.sha256 != validation["child"]["sha256"]
            or child.size != validation["child"]["bytes"]
        ):
            raise RuntimeError("child36 did not survive as a sole immutable file")
        receipt = {
            "schema": "p97-exact17-child36-immutable-export-receipt/v1",
            "status": "PASS",
            "publication_state": spec.publication_state,
            "parent": {
                "path": str(paths.parent.resolve()),
                "sha256": final["parent"].sha256,
            },
            "model": {
                "path": str(paths.model.resolve()),
                "sha256": final["model"].sha256,
            },
            "lean": {
                "root": {
                    "path": str(paths.lean_root.resolve()),
                    "sha256": final["lean_root"].sha256,
                },
                "export": {
                    "path": str(paths.lean_export.resolve()),
                    "sha256": final["lean_export"].sha256,
                },
                "refinement": {
                    "path": str(paths.refinement.resolve()),
                    "sha256": final["refinement"].sha256,
                },
            },
            "child": {
                "path": str(paths.child.resolve()),
                "sha256": child.sha256,
                "bytes": child.size,
                "variables": spec.variables,
                "clauses": spec.child_clauses,
            },
            "validation": validation,
            "immutability": "exclusive-hard-link-and-exclusive-receipt/v1",
        }
        immutable_json(paths.receipt, receipt)
    except BaseException:
        remove_owned_child(paths, published_identity)
        raise
    return receipt


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parent", type=Path, default=PRODUCTION_PATHS.parent)
    parser.add_argument("--model", type=Path, default=PRODUCTION_PATHS.model)
    parser.add_argument("--lean-root", type=Path, default=PRODUCTION_PATHS.lean_root)
    parser.add_argument(
        "--lean-export", type=Path, default=PRODUCTION_PATHS.lean_export
    )
    parser.add_argument("--refinement", type=Path, default=PRODUCTION_PATHS.refinement)
    parser.add_argument("--child", type=Path, default=PRODUCTION_PATHS.child)
    parser.add_argument("--receipt", type=Path, default=PRODUCTION_PATHS.receipt)
    arguments = parser.parse_args()
    result = export_child36(
        ExportPaths(
            arguments.parent.resolve(),
            arguments.model.resolve(),
            arguments.lean_root.resolve(),
            arguments.lean_export.resolve(),
            arguments.refinement.resolve(),
            arguments.child.resolve(),
            arguments.receipt.resolve(),
        )
    )
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
