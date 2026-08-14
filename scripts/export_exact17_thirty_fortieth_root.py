"""Immutable Lean exporter for the fail-closed exact-17 Child40 boundary."""

from __future__ import annotations

import json
import os
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from validate_exact17_thirty_ninth_model_refinements_export import (
    CHILD_PATH,
    LEAN_EXPORT_PATH,
    LEAN_ROOT_PATH,
    MODEL_PATH,
    PARENT_PATH,
    PARENT_SHA256,
    PRODUCTION_SPEC,
    RECEIPT_PATH,
    ExportSpec,
    UnprovisionedError,
    sha256_file,
    validate_export,
    validate_spec,
)

ROOT = Path(__file__).resolve().parents[1]


@dataclass(frozen=True)
class ExportPaths:
    parent: Path = Path(PARENT_PATH)
    model: Path = Path(MODEL_PATH)
    lean_root: Path = Path(LEAN_ROOT_PATH)
    lean_export: Path = Path(LEAN_EXPORT_PATH)
    child: Path = Path(CHILD_PATH)
    receipt: Path = Path(RECEIPT_PATH)


PRODUCTION_PATHS = ExportPaths()


def _fsync_dir(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _publish_json_ledger_last(path: Path, payload: dict[str, Any]) -> None:
    fd, name = tempfile.mkstemp(prefix=f".{path.name}.", suffix=".candidate", dir=path.parent)
    candidate = Path(name)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            json.dump(payload, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.link(candidate, path, follow_symlinks=False)
        _fsync_dir(path.parent)
    finally:
        candidate.unlink(missing_ok=True)


def _run_lean(source: Path, output: Path) -> None:
    relative = source.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(["lake", "env", "lean", "--run", str(relative), str(output)], cwd=ROOT / "lean", check=True)


def export_child40(paths: ExportPaths = PRODUCTION_PATHS, *, spec: ExportSpec = PRODUCTION_SPEC) -> dict[str, Any]:
    validate_spec(spec, require_source_pins=True)
    if not spec.provisioned:
        raise UnprovisionedError("child40 export is UNPROVISIONED")
    if paths.child.exists() or paths.receipt.exists():
        raise FileExistsError("refusing to replace existing Child40 or receipt")
    expected = {paths.parent: PARENT_SHA256, paths.model: spec.model_sha256, paths.lean_root: spec.lean_root_sha256, paths.lean_export: spec.lean_export_sha256}
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
        child_sha256 = sha256_file(candidate)
        child_bytes = candidate.stat().st_size
        published = ExportSpec(child_sha256=child_sha256, child_bytes=child_bytes, publication_state="PROVISIONED", lean_root_sha256=spec.lean_root_sha256, lean_export_sha256=spec.lean_export_sha256)
        validation = validate_export(paths.parent, candidate, paths.model, spec=published)
        os.link(candidate, paths.child, follow_symlinks=False)
        _fsync_dir(paths.child.parent)
        receipt = {"schema": "p97-exact17-child40-immutable-export-receipt/v1", "status": "PASS", "publication_state": "PROVISIONED", "parent": {"path": str(paths.parent.resolve()), "sha256": PARENT_SHA256}, "model": {"path": str(paths.model.resolve()), "sha256": published.model_sha256}, "lean": {"root": {"path": str(paths.lean_root.resolve()), "sha256": published.lean_root_sha256}, "export": {"path": str(paths.lean_export.resolve()), "sha256": published.lean_export_sha256}}, "child": {"path": str(paths.child.resolve()), "sha256": child_sha256, "bytes": child_bytes, "variables": published.variables, "clauses": published.child_clauses}, "validation": validation, "immutability": "exclusive-hard-link-and-ledger-last-receipt/v2"}
        _publish_json_ledger_last(paths.receipt, receipt)
        return receipt
    except BaseException:
        if paths.child.exists() and not paths.receipt.exists():
            paths.child.unlink()
        raise
    finally:
        candidate.unlink(missing_ok=True)


if __name__ == "__main__":
    print(json.dumps(export_child40(), indent=2, sort_keys=True))
