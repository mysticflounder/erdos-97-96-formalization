"""Export the Lean-owned exact-17 child33 root without overwriting artifacts.

Child33 is the direct DIMACS rendering of
``extendedThirtySecondModelRefinementsCnf``: the authenticated child32 root is
the byte-identical prefix and the Lean source contributes exactly eight
source-valid clauses.  Publication is fail-closed against the independently
replayed child hash and byte count pinned by the validator.
"""

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

from validate_exact17_thirty_second_model_refinements_export import (
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
    child: Path
    receipt: Path
    two_circle: Path | None = None
    kalmanson: Path | None = None


PRODUCTION_PATHS = ExportPaths(
    parent=SCRATCH / "exact17-thirty-second-root-thirty-first-model-refinements.cnf",
    lean_root=ATail / "BlockerVExactSeventeenThirtySecondModelRefinements.lean",
    lean_export=ATail / "BlockerVExactSeventeenThirtySecondModelRefinementsExport.lean",
    child=SCRATCH / "exact17-thirty-third-root-thirty-second-model-refinements.cnf",
    receipt=SCRATCH / "child33-export-receipt.json",
    two_circle=ATail / "BlockerVExactSeventeenThirtySecondTwoCircleRefinement.lean",
    kalmanson=ATail / "BlockerVExactSeventeenThirtySecondKalmansonRefinement.lean",
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
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
    descriptor = os.open(path, flags)
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            raise RuntimeError(f"not a regular file: {path}")
        digest = hashlib.sha256()
        with os.fdopen(os.dup(descriptor), "rb") as handle:
            for block in iter(lambda: handle.read(1024 * 1024), b""):
                digest.update(block)
        after = os.fstat(descriptor)
        before_key = (before.st_dev, before.st_ino, before.st_mode, before.st_nlink, before.st_size, before.st_mtime_ns, before.st_ctime_ns)
        after_key = (after.st_dev, after.st_ino, after.st_mode, after.st_nlink, after.st_size, after.st_mtime_ns, after.st_ctime_ns)
        if before_key != after_key:
            raise RuntimeError(f"file changed while hashing: {path}")
        return FileSnapshot(path, after.st_dev, after.st_ino, after.st_mode, after.st_nlink, after.st_size, after.st_mtime_ns, after.st_ctime_ns, digest.hexdigest())
    finally:
        os.close(descriptor)


def _same_snapshot(left: FileSnapshot, right: FileSnapshot) -> bool:
    return left == right


def _same_file_state(left: FileSnapshot, right: FileSnapshot) -> bool:
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


def _snapshot_inputs(paths: ExportPaths) -> dict[str, FileSnapshot]:
    required = {
        "parent": paths.parent,
        "lean_root": paths.lean_root,
        "lean_export": paths.lean_export,
        "two_circle": paths.two_circle,
        "kalmanson": paths.kalmanson,
    }
    if any(path is None for path in required.values()):
        raise ValueError("authenticated source module paths are required")
    return {name: _snapshot(path) for name, path in required.items() if path is not None}


def _assert_inputs_unchanged(before: dict[str, FileSnapshot], paths: ExportPaths) -> dict[str, FileSnapshot]:
    after = _snapshot_inputs(paths)
    for name, snapshot in before.items():
        if not _same_snapshot(snapshot, after[name]):
            raise RuntimeError(f"authenticated input changed during publication: {name}")
    return after


def _absolute(path: Path) -> Path:
    return Path(os.path.abspath(os.fspath(path)))


def _validate_paths(paths: ExportPaths, spec: ExportSpec) -> None:
    expected = {
        "parent": spec.parent_path,
        "lean_root": spec.lean_root_path,
        "lean_export": spec.lean_export_path,
        "two_circle": spec.two_circle_path,
        "kalmanson": spec.kalmanson_path,
        "child": spec.child_path,
        "receipt": spec.receipt_path,
    }
    actual = {
        "parent": paths.parent,
        "lean_root": paths.lean_root,
        "lean_export": paths.lean_export,
        "two_circle": paths.two_circle,
        "kalmanson": paths.kalmanson,
        "child": paths.child,
        "receipt": paths.receipt,
    }
    for name, value in actual.items():
        if value is None or _absolute(value) != Path(expected[name]):
            raise ValueError(f"{name} path is not the authenticated expected path")
    for name, value in (("parent", paths.parent), ("lean_root", paths.lean_root), ("lean_export", paths.lean_export), ("two_circle", paths.two_circle), ("kalmanson", paths.kalmanson)):
        _snapshot(value)


def _remove_publication(paths: ExportPaths) -> None:
    changed = False
    for path in (paths.child, paths.receipt):
        try:
            os.lstat(path)
        except FileNotFoundError:
            continue
        path.unlink()
        changed = True
    if changed:
        directory_fd = os.open(paths.child.parent, os.O_RDONLY)
        try:
            os.fsync(directory_fd)
        finally:
            os.close(directory_fd)


def _run_lean(export_source: Path, candidate: Path) -> None:
    relative = export_source.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(
        ["lake", "env", "lean", "--run", str(relative), str(candidate)],
        cwd=ROOT / "lean",
        check=True,
    )


def _immutable_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("x", encoding="utf-8") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    directory_fd = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(directory_fd)
    finally:
        os.close(directory_fd)


def _verify_linked_child(candidate: Path, child: Path, expected: dict[str, Any]) -> None:
    candidate_stat = os.lstat(candidate)
    child_stat = os.lstat(child)
    if not stat.S_ISREG(candidate_stat.st_mode) or not stat.S_ISREG(child_stat.st_mode):
        raise RuntimeError("published child33 is not a regular file")
    if (candidate_stat.st_dev, candidate_stat.st_ino) != (child_stat.st_dev, child_stat.st_ino):
        raise RuntimeError("child33 is not the exclusive hard link of the candidate")
    if candidate_stat.st_nlink != 2 or child_stat.st_nlink != 2:
        raise RuntimeError("child33 hard link has unexpected link count")
    if child_stat.st_size != expected["child"]["bytes"]:
        raise RuntimeError("child33 bytes changed after immutable link")
    candidate_snapshot = _snapshot(candidate)
    child_snapshot = _snapshot(child)
    if candidate_snapshot.sha256 != expected["child"]["sha256"] or child_snapshot.sha256 != expected["child"]["sha256"]:
        raise RuntimeError("child33 SHA-256 changed after immutable link")
    if not _same_file_state(candidate_snapshot, child_snapshot):
        raise RuntimeError("candidate and child snapshots diverged after linking")


def _verify_surviving_child(child: Path, expected: dict[str, Any]) -> None:
    snapshot = _snapshot(child)
    if snapshot.nlink != 1 or snapshot.size != expected["child"]["bytes"] or snapshot.sha256 != expected["child"]["sha256"]:
        raise RuntimeError("published child33 is not the sole immutable file")


def export_child33(
    paths: ExportPaths = PRODUCTION_PATHS,
    *,
    spec: ExportSpec = PRODUCTION_SPEC,
    lean_runner: LeanRunner = _run_lean,
    before_receipt: Callable[[], None] | None = None,
) -> dict[str, Any]:
    """Run Lean once, strictly revalidate, then publish exclusive artifacts."""
    validate_spec(spec, require_source_pins=True)
    if not spec.provisioned:
        raise UnprovisionedError(
            "child33 Lean export is UNPROVISIONED; no live artifact pins exist"
        )
    _validate_paths(paths, spec)
    if any(os.path.lexists(path) for path in (paths.child, paths.receipt)):
        raise FileExistsError("refusing to replace an existing child33 or receipt")
    inputs_before = _snapshot_inputs(paths)
    expected_hashes = {
        "lean_root": spec.lean_root_sha256,
        "lean_export": spec.lean_export_sha256,
        "two_circle": spec.two_circle_sha256,
        "kalmanson": spec.kalmanson_sha256,
    }
    for name, expected_hash in expected_hashes.items():
        if inputs_before[name].sha256 != expected_hash:
            raise ValueError(f"{name} SHA-256 does not match authenticated source pin")
    if inputs_before["parent"].sha256 != spec.parent_sha256:
        raise ValueError("parent SHA-256 does not match the authenticated child32 pin")

    paths.child.parent.mkdir(parents=True, exist_ok=True)
    temp_fd, temp_name = tempfile.mkstemp(
        prefix=f".{paths.child.name}.", suffix=".candidate", dir=paths.child.parent
    )
    os.close(temp_fd)
    candidate = Path(temp_name)
    try:
        candidate.unlink()
        lean_runner(paths.lean_export, candidate)
        if not candidate.is_file() or candidate.is_symlink():
            raise RuntimeError("Lean exporter produced no DIMACS candidate")
        _assert_inputs_unchanged(inputs_before, paths)
        validation = validate_export(paths.parent, candidate, spec=spec)
        if validation["status"] != "PASS":
            raise RuntimeError("unvalidated child33 candidate cannot be published")
        os.link(candidate, paths.child, follow_symlinks=False)
        linked_validation = validate_export(paths.parent, paths.child, spec=spec)
        candidate_validation = dict(validation)
        candidate_child = dict(candidate_validation["child"])
        candidate_child["path"] = str(paths.child.resolve())
        candidate_validation["child"] = candidate_child
        if linked_validation != candidate_validation:
            raise RuntimeError("strict child33 re-render validation changed after linking")
        _verify_linked_child(candidate, paths.child, linked_validation)
        _assert_inputs_unchanged(inputs_before, paths)
        directory_fd = os.open(paths.child.parent, os.O_RDONLY)
        try:
            os.fsync(directory_fd)
        finally:
            os.close(directory_fd)
    except BaseException:
        _remove_publication(paths)
        raise
    finally:
        candidate.unlink(missing_ok=True)

    if before_receipt is not None:
        before_receipt()
    final_inputs = _assert_inputs_unchanged(inputs_before, paths)
    _verify_surviving_child(paths.child, linked_validation)
    receipt = {
        "schema": "p97-exact17-child33-immutable-export-receipt/v1",
        "status": "PASS",
        "publication_state": spec.publication_state,
        "parent": {"path": str(_absolute(paths.parent)), "sha256": final_inputs["parent"].sha256},
        "lean": {
            "root": {"path": str(_absolute(paths.lean_root)), "sha256": final_inputs["lean_root"].sha256},
            "export": {"path": str(_absolute(paths.lean_export)), "sha256": final_inputs["lean_export"].sha256},
        },
        "source_modules": {
            "two_circle": {"path": str(_absolute(paths.two_circle)), "sha256": final_inputs["two_circle"].sha256},
            "kalmanson": {"path": str(_absolute(paths.kalmanson)), "sha256": final_inputs["kalmanson"].sha256},
        },
        "child": {
            "path": str(paths.child.resolve()),
            "sha256": linked_validation["child"]["sha256"],
            "bytes": linked_validation["child"]["bytes"],
            "variables": spec.variables,
            "clauses": spec.child_clauses,
        },
        "validation": linked_validation,
        "immutability": "exclusive-hard-link-and-exclusive-receipt/v1",
    }
    try:
        _immutable_json(paths.receipt, receipt)
    except BaseException:
        _remove_publication(paths)
        raise
    return receipt


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parent", type=Path, default=PRODUCTION_PATHS.parent)
    parser.add_argument("--lean-root", type=Path, default=PRODUCTION_PATHS.lean_root)
    parser.add_argument("--lean-export", type=Path, default=PRODUCTION_PATHS.lean_export)
    parser.add_argument("--child", type=Path, default=PRODUCTION_PATHS.child)
    parser.add_argument("--receipt", type=Path, default=PRODUCTION_PATHS.receipt)
    args = parser.parse_args()
    result = export_child33(
        ExportPaths(
            parent=args.parent.resolve(),
            lean_root=args.lean_root.resolve(),
            lean_export=args.lean_export.resolve(),
            child=args.child.resolve(),
            receipt=_absolute(args.receipt),
            two_circle=PRODUCTION_PATHS.two_circle,
            kalmanson=PRODUCTION_PATHS.kalmanson,
        )
    )
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
