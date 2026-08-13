"""Publish the Lean-owned exact-17 child35 root, fail closed."""

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

from validate_exact17_thirty_fourth_model_refinements_export import (
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
    lean_root: Path
    lean_export: Path
    kalmanson: Path
    perpendicular_bisector: Path
    child: Path
    receipt: Path


PRODUCTION_PATHS = ExportPaths(
    parent=SCRATCH / "exact17-thirty-fourth-root-thirty-third-model-refinements.cnf",
    lean_root=ATail / "BlockerVExactSeventeenThirtyFourthModelRefinements.lean",
    lean_export=ATail / "BlockerVExactSeventeenThirtyFourthModelRefinementsExport.lean",
    kalmanson=ATail / "BlockerVExactSeventeenThirtyThirdKalmansonRefinement.lean",
    perpendicular_bisector=ATail / "BlockerVExactSeventeenThirtyFourthPerpendicularBisectorRefinement.lean",
    child=SCRATCH / "exact17-thirty-fifth-root-thirty-fourth-model-refinements.cnf",
    receipt=SCRATCH / "child35-export-receipt.json",
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


def _snapshot(path: Path) -> FileSnapshot:
    fd = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    try:
        before = os.fstat(fd)
        if not stat.S_ISREG(before.st_mode):
            raise ValueError(f"not a regular file: {path}")
        digest = hashlib.sha256()
        while block := os.read(fd, 1024 * 1024):
            digest.update(block)
        after = os.fstat(fd)
        key = lambda x: (x.st_dev, x.st_ino, x.st_mode, x.st_nlink, x.st_size, x.st_mtime_ns, x.st_ctime_ns)
        if key(before) != key(after):
            raise RuntimeError(f"file changed while hashing: {path}")
        return FileSnapshot(path, after.st_dev, after.st_ino, after.st_mode, after.st_nlink, after.st_size, after.st_mtime_ns, after.st_ctime_ns, digest.hexdigest())
    finally:
        os.close(fd)


def _inputs(paths: ExportPaths) -> dict[str, FileSnapshot]:
    return {name: _snapshot(value) for name, value in {"parent": paths.parent, "lean_root": paths.lean_root, "lean_export": paths.lean_export, "kalmanson": paths.kalmanson, "perpendicular_bisector": paths.perpendicular_bisector}.items()}


def _unchanged(before: dict[str, FileSnapshot], paths: ExportPaths) -> dict[str, FileSnapshot]:
    after = _inputs(paths)
    if any(after[name] != snapshot for name, snapshot in before.items()):
        raise RuntimeError("authenticated input changed during child35 publication")
    return after


def _same_snapshot(left: FileSnapshot, right: FileSnapshot) -> bool:
    return (left.dev, left.ino, left.mode, left.nlink, left.size, left.mtime_ns, left.ctime_ns, left.sha256) == (right.dev, right.ino, right.mode, right.nlink, right.size, right.mtime_ns, right.ctime_ns, right.sha256)


def _absolute(path: Path) -> Path:
    return Path(os.path.abspath(os.fspath(path)))


def _validate_paths(paths: ExportPaths, spec: ExportSpec) -> None:
    expected = {"parent": spec.parent_path, "lean_root": spec.lean_root_path, "lean_export": spec.lean_export_path, "kalmanson": spec.kalmanson_path, "perpendicular_bisector": spec.perpendicular_bisector_path, "child": spec.child_path, "receipt": spec.receipt_path}
    actual = {name: getattr(paths, name) for name in expected}
    for name, value in actual.items():
        if _absolute(value) != Path(expected[name]):
            raise ValueError(f"{name} path is not the authenticated child35 path")
    _inputs(paths)


def _remove_publication(paths: ExportPaths, *, child_identity: tuple[int, int] | None = None) -> None:
    if os.path.lexists(paths.receipt):
        # A receipt is the ledger-last commit marker.  It may belong to a
        # publisher that won a race, so never remove the published child once
        # any receipt is visible.
        return
    changed = False
    if os.path.lexists(paths.child) and child_identity is not None:
        metadata = os.lstat(paths.child)
        if (metadata.st_dev, metadata.st_ino) == child_identity:
            paths.child.unlink()
            changed = True
    if changed:
        fd = os.open(paths.child.parent, os.O_RDONLY)
        try:
            os.fsync(fd)
        finally:
            os.close(fd)


def _remove_receipt(
    path: Path, *, receipt_identity: tuple[int, int] | None = None
) -> None:
    if not os.path.lexists(path) or receipt_identity is None:
        return
    metadata = os.lstat(path)
    if (metadata.st_dev, metadata.st_ino) != receipt_identity:
        return
    path.unlink()
    fd = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)


def _run_lean(source: Path, candidate: Path) -> None:
    relative = source.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(["lake", "env", "lean", "--run", str(relative), str(candidate)], cwd=ROOT / "lean", check=True)


def _immutable_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    receipt_identity: tuple[int, int] | None = None
    try:
        with path.open("x", encoding="utf-8") as handle:
            metadata = os.fstat(handle.fileno())
            receipt_identity = (metadata.st_dev, metadata.st_ino)
            json.dump(payload, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        fd = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(fd)
        finally:
            os.close(fd)
    except BaseException:
        _remove_receipt(path, receipt_identity=receipt_identity)
        raise


def export_child35(paths: ExportPaths = PRODUCTION_PATHS, *, spec: ExportSpec = PRODUCTION_SPEC, lean_runner: LeanRunner = _run_lean, before_receipt: Callable[[], None] | None = None) -> dict[str, Any]:
    validate_spec(spec, require_source_pins=True)
    if not spec.provisioned:
        raise UnprovisionedError("child35 Lean export is UNPROVISIONED; no live artifact pins exist")
    _validate_paths(paths, spec)
    if os.path.lexists(paths.child) or os.path.lexists(paths.receipt):
        raise FileExistsError("refusing to replace existing child35 or receipt")
    before = _inputs(paths)
    for name, expected in (("lean_root", spec.lean_root_sha256), ("lean_export", spec.lean_export_sha256), ("kalmanson", spec.kalmanson_sha256), ("perpendicular_bisector", spec.perpendicular_bisector_sha256)):
        if before[name].sha256 != expected:
            raise ValueError(f"{name} SHA-256 does not match authenticated source pin")
    if before["parent"].sha256 != spec.parent_sha256:
        raise ValueError("parent SHA-256 does not match authenticated child34 pin")
    paths.child.parent.mkdir(parents=True, exist_ok=True)
    fd, candidate_name = tempfile.mkstemp(prefix=f".{paths.child.name}.", suffix=".candidate", dir=paths.child.parent)
    os.close(fd)
    candidate = Path(candidate_name)
    published_identity: tuple[int, int] | None = None
    try:
        candidate.unlink()
        lean_runner(paths.lean_export, candidate)
        if not candidate.is_file() or candidate.is_symlink():
            raise RuntimeError("Lean exporter produced no regular DIMACS candidate")
        _unchanged(before, paths)
        validation = validate_export(paths.parent, candidate, spec=spec)
        if validation["status"] != "PASS":
            raise RuntimeError("unvalidated child35 candidate cannot be published")
        os.link(candidate, paths.child, follow_symlinks=False)
        linked = validate_export(paths.parent, paths.child, spec=spec)
        expected_linked = dict(validation)
        expected_linked["child"] = dict(validation["child"], path=str(paths.child.resolve()))
        if linked != expected_linked:
            raise RuntimeError("child35 changed after immutable link")
        candidate_stat = os.lstat(candidate)
        child_stat = os.lstat(paths.child)
        if not stat.S_ISREG(candidate_stat.st_mode) or not stat.S_ISREG(child_stat.st_mode):
            raise RuntimeError("child35 hard-link names are not regular files")
        if (candidate_stat.st_dev, candidate_stat.st_ino) != (child_stat.st_dev, child_stat.st_ino):
            raise RuntimeError("child35 candidate and child are not the same inode")
        published_identity = (child_stat.st_dev, child_stat.st_ino)
        if candidate_stat.st_nlink != 2 or child_stat.st_nlink != 2:
            raise RuntimeError("child35 candidate link count is not exactly two")
        if not _same_snapshot(_snapshot(candidate), _snapshot(paths.child)):
            raise RuntimeError("child35 candidate and child snapshots diverged")
        _unchanged(before, paths)
        fd = os.open(paths.child.parent, os.O_RDONLY)
        try:
            os.fsync(fd)
        finally:
            os.close(fd)
    except BaseException:
        _remove_publication(paths, child_identity=published_identity)
        raise
    finally:
        candidate.unlink(missing_ok=True)
    try:
        if before_receipt is not None:
            before_receipt()
        final = _unchanged(before, paths)
        child = _snapshot(paths.child)
        if child.nlink != 1 or child.sha256 != linked["child"]["sha256"] or child.size != linked["child"]["bytes"]:
            raise RuntimeError("child35 did not survive as a sole immutable file")
        receipt = {
            "schema": "p97-exact17-child35-immutable-export-receipt/v1",
            "status": "PASS",
            "publication_state": spec.publication_state,
            "parent": {"path": str(paths.parent.resolve()), "sha256": final["parent"].sha256},
            "lean": {"root": {"path": str(paths.lean_root.resolve()), "sha256": final["lean_root"].sha256}, "export": {"path": str(paths.lean_export.resolve()), "sha256": final["lean_export"].sha256}},
            "source_modules": {
                "kalmanson": {"path": str(paths.kalmanson.resolve()), "sha256": final["kalmanson"].sha256},
                "perpendicular_bisector": {"path": str(paths.perpendicular_bisector.resolve()), "sha256": final["perpendicular_bisector"].sha256},
            },
            "child": {"path": str(paths.child.resolve()), "sha256": child.sha256, "bytes": child.size, "variables": spec.variables, "clauses": spec.child_clauses},
            "validation": linked,
            "immutability": "exclusive-hard-link-and-exclusive-receipt/v1",
        }
        _immutable_json(paths.receipt, receipt)
    except BaseException:
        _remove_publication(paths, child_identity=published_identity)
        raise
    return receipt


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, default=PRODUCTION_PATHS.parent)
    parser.add_argument("--lean-root", type=Path, default=PRODUCTION_PATHS.lean_root)
    parser.add_argument("--lean-export", type=Path, default=PRODUCTION_PATHS.lean_export)
    parser.add_argument("--kalmanson", type=Path, default=PRODUCTION_PATHS.kalmanson)
    parser.add_argument("--perpendicular-bisector", type=Path, default=PRODUCTION_PATHS.perpendicular_bisector)
    parser.add_argument("--child", type=Path, default=PRODUCTION_PATHS.child)
    parser.add_argument("--receipt", type=Path, default=PRODUCTION_PATHS.receipt)
    args = parser.parse_args()
    result = export_child35(ExportPaths(args.parent.resolve(), args.lean_root.resolve(), args.lean_export.resolve(), args.kalmanson.resolve(), args.perpendicular_bisector.resolve(), args.child.resolve(), args.receipt.resolve()))
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
