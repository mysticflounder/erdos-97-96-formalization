"""Publish the Lean-owned exact-17 Child37 root with immutable pins."""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from validate_exact17_thirty_sixth_model_refinements_export import (
    CHILD_CLAUSES,
    MODEL_PATH,
    PARENT_PATH,
    PRODUCTION_SPEC,
    RECEIPT_PATH,
    ExportSpec,
    sha256_file,
    validate_export,
    validate_sources,
)

ROOT = Path(__file__).resolve().parents[1]


@dataclass(frozen=True)
class ExportPaths:
    parent: Path
    model: Path
    lean_root: Path
    lean_export: Path
    child: Path
    receipt: Path


PRODUCTION_PATHS = ExportPaths(
    parent=Path(PARENT_PATH),
    model=Path(MODEL_PATH),
    lean_root=Path(PRODUCTION_SPEC.lean_root_path),
    lean_export=Path(PRODUCTION_SPEC.lean_export_path),
    child=ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-seventh-root-thirty-sixth-model-refinements.cnf",
    receipt=Path(RECEIPT_PATH),
)


def _fsync_dir(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _run_lean(source: Path, output: Path) -> None:
    relative = source.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(["lake", "env", "lean", "--run", str(relative), str(output)], cwd=ROOT / "lean", check=True)


def export_child37(paths: ExportPaths = PRODUCTION_PATHS, *, spec: ExportSpec = PRODUCTION_SPEC) -> dict[str, Any]:
    validate_sources(spec)
    if paths.child.exists() or paths.receipt.exists():
        raise FileExistsError("refusing to replace existing Child37 or receipt")
    expected = {paths.parent: spec.parent_sha256, paths.model: spec.model_sha256, paths.lean_root: spec.lean_root_sha256, paths.lean_export: spec.lean_export_sha256}
    for path, digest in expected.items():
        if digest is None or sha256_file(path) != digest:
            raise ValueError(f"authenticated input drifted: {path}")
    paths.child.parent.mkdir(parents=True, exist_ok=True)
    fd, name = tempfile.mkstemp(prefix=f".{paths.child.name}.", suffix=".candidate", dir=paths.child.parent)
    os.close(fd)
    candidate = Path(name)
    try:
        candidate.unlink()
        _run_lean(paths.lean_export, candidate)
        if not candidate.is_file() or candidate.is_symlink():
            raise RuntimeError("Lean exporter produced no regular candidate")
        child_sha = sha256_file(candidate)
        child_bytes = candidate.stat().st_size
        provisioned = ExportSpec(child_sha256=child_sha, child_bytes=child_bytes, publication_state="PROVISIONED")
        validation = validate_export(paths.parent, candidate, paths.model, spec=provisioned)
        os.link(candidate, paths.child, follow_symlinks=False)
        _fsync_dir(paths.child.parent)
        if sha256_file(paths.child) != child_sha or paths.child.stat().st_size != child_bytes:
            raise RuntimeError("published Child37 identity drifted")
        receipt = {
            "schema": "p97-exact17-child37-immutable-export-receipt/v1",
            "status": "PASS",
            "publication_state": "PROVISIONED",
            "parent": {"path": str(paths.parent.resolve()), "sha256": spec.parent_sha256},
            "model": {"path": str(paths.model.resolve()), "sha256": spec.model_sha256},
            "lean": {"root": {"path": str(paths.lean_root.resolve()), "sha256": spec.lean_root_sha256}, "export": {"path": str(paths.lean_export.resolve()), "sha256": spec.lean_export_sha256}},
            "child": {"path": str(paths.child.resolve()), "sha256": child_sha, "bytes": child_bytes, "variables": provisioned.variables, "clauses": CHILD_CLAUSES},
            "validation": validation,
            "immutability": "exclusive-hard-link-and-exclusive-receipt/v1",
        }
        with paths.receipt.open("x", encoding="utf-8") as handle:
            json.dump(receipt, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        _fsync_dir(paths.receipt.parent)
        return receipt
    except BaseException:
        if paths.child.exists() and not paths.receipt.exists():
            paths.child.unlink()
        raise
    finally:
        candidate.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--child", type=Path, default=PRODUCTION_PATHS.child)
    parser.add_argument("--receipt", type=Path, default=PRODUCTION_PATHS.receipt)
    args = parser.parse_args()
    print(json.dumps(export_child37(ExportPaths(PRODUCTION_PATHS.parent, PRODUCTION_PATHS.model, PRODUCTION_PATHS.lean_root, PRODUCTION_PATHS.lean_export, args.child.resolve(), args.receipt.resolve())), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
