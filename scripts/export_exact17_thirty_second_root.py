"""Mint an immutable Lean-owned exact-17 child32 DIMACS and receipt.

Production is deliberately unprovisioned until the Lean export module and all
artifact pins are published.  The default invocation therefore fails before
running Lean.  Tests and the eventual provisioning transaction can supply a
fully pinned ``ExportSpec`` and an isolated command runner.
"""

from __future__ import annotations

import argparse
import json
import os
import stat
import subprocess
import tempfile
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from validate_exact17_thirty_first_model_refinements_export import (
    PRODUCTION_PUBLICATION_INPUTS,
    PRODUCTION_SPEC,
    ExportSpec,
    PublicationInputs,
    PublicationValidator,
    UnprovisionedError,
    call_publication_validator,
    load_publication_validator,
    sha256_file,
    validate_export,
)

ROOT = Path(__file__).resolve().parents[1]


@dataclass(frozen=True)
class ExportPaths:
    parent: Path
    ledger: Path
    lean_root: Path
    lean_export: Path
    child: Path
    receipt: Path


PRODUCTION_PATHS = ExportPaths(
    parent=ROOT
    / "scratch/exact17-lean-to-sat/"
    "exact17-thirty-first-root-thirtieth-model-refinements.cnf",
    ledger=ROOT
    / "scratch/exact17-lean-to-sat/"
    "piqd-thirty-first-root-all-cancellation-family.json",
    lean_root=ROOT
    / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenThirtyFirstModelRefinements.lean",
    lean_export=ROOT
    / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenThirtyFirstModelRefinementsExport.lean",
    child=ROOT
    / "scratch/exact17-lean-to-sat/"
    "exact17-thirty-second-root-thirty-first-model-refinements.cnf",
    receipt=ROOT
    / "scratch/exact17-lean-to-sat/child32-export-receipt.json",
)

LeanRunner = Callable[[Path, Path], None]


def _run_lean(export_module: Path, output: Path) -> None:
    subprocess.run(
        [
            "lake",
            "env",
            "lean",
            "--run",
            str(export_module.relative_to(ROOT / "lean")),
            str(output),
        ],
        cwd=ROOT / "lean",
        check=True,
    )


def _immutable_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    with path.open("x", encoding="utf-8") as handle:
        handle.write(rendered)
        handle.flush()
        os.fsync(handle.fileno())
    directory_fd = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(directory_fd)
    finally:
        os.close(directory_fd)


def _verify_linked_child(
    candidate: Path, child: Path, validation: dict[str, Any]
) -> tuple[str, int]:
    """Re-authenticate the hard-linked bytes before minting the receipt.

    Validation happens before publication, so a producer that mutates its
    candidate between those operations must not be able to turn that stale
    validation into a receipt.  Checking both names also proves that the
    receipt is about the inode that was actually linked.
    """
    candidate_stat = os.stat(candidate, follow_symlinks=False)
    child_stat = os.stat(child, follow_symlinks=False)
    if not stat.S_ISREG(candidate_stat.st_mode) or not stat.S_ISREG(child_stat.st_mode):
        raise RuntimeError("published child32 is not a regular file")
    if (candidate_stat.st_dev, candidate_stat.st_ino) != (
        child_stat.st_dev,
        child_stat.st_ino,
    ):
        raise RuntimeError("child32 hard-link identity changed during publication")
    if candidate_stat.st_size != validation["child_bytes"] or child_stat.st_size != validation[
        "child_bytes"
    ]:
        raise RuntimeError("child32 bytes changed after validation")
    candidate_sha256 = sha256_file(candidate)
    child_sha256 = sha256_file(child)
    if candidate_sha256 != validation["child_sha256"] or child_sha256 != candidate_sha256:
        raise RuntimeError("child32 bytes changed after immutable link")
    return child_sha256, child_stat.st_size


def export_child32(
    paths: ExportPaths = PRODUCTION_PATHS,
    *,
    spec: ExportSpec = PRODUCTION_SPEC,
    publication_validator: PublicationValidator | None = None,
    publication_inputs: PublicationInputs = PRODUCTION_PUBLICATION_INPUTS,
    lean_runner: LeanRunner = _run_lean,
) -> dict[str, Any]:
    """Run Lean once and atomically publish a validated, immutable child32."""
    if not spec.provisioned:
        raise UnprovisionedError(
            "child32 Lean export is UNPROVISIONED; no production pins exist"
        )
    if paths.child.exists() or paths.receipt.exists():
        raise FileExistsError("refusing to replace an existing child32 or receipt")
    if publication_inputs.lean_output.resolve() != paths.lean_root.resolve():
        raise ValueError("publication validator is bound to the wrong Lean root")
    if publication_inputs.parent_cnf.resolve() != paths.parent.resolve():
        raise ValueError("publication validator is bound to the wrong parent CNF")
    for required in (
        paths.parent,
        paths.ledger,
        paths.lean_root,
        paths.lean_export,
        publication_inputs.analysis,
        publication_inputs.parent_ledger,
    ):
        if not required.is_file():
            raise FileNotFoundError(required)

    validator = publication_validator or load_publication_validator()
    published = call_publication_validator(
        validator, paths.ledger, publication_inputs
    )
    if not isinstance(published, dict):
        raise TypeError("publication validator did not return a ledger object")

    paths.child.parent.mkdir(parents=True, exist_ok=True)
    temp_fd, temp_name = tempfile.mkstemp(
        prefix=f".{paths.child.name}.", suffix=".candidate", dir=paths.child.parent
    )
    os.close(temp_fd)
    candidate = Path(temp_name)
    linked = False
    verified_child_sha256: str | None = None
    verified_child_bytes: int | None = None
    try:
        candidate.unlink()
        lean_runner(paths.lean_export, candidate)
        if not candidate.is_file():
            raise RuntimeError("Lean exporter produced no DIMACS candidate")
        validation = validate_export(
            paths.parent,
            candidate,
            paths.ledger,
            spec=spec,
            publication_validator=validator,
            publication_inputs=publication_inputs,
        )
        if validation["status"] != "PASS":
            raise RuntimeError("unvalidated child32 candidate cannot be published")
        os.link(candidate, paths.child)
        linked = True
        verified_child_sha256, verified_child_bytes = _verify_linked_child(
            candidate, paths.child, validation
        )
        directory_fd = os.open(paths.child.parent, os.O_RDONLY)
        try:
            os.fsync(directory_fd)
        finally:
            os.close(directory_fd)
    except BaseException:
        if linked:
            paths.child.unlink(missing_ok=True)
        raise
    finally:
        candidate.unlink(missing_ok=True)

    if verified_child_sha256 is None or verified_child_bytes is None:
        raise RuntimeError("child32 publication was not reauthenticated")

    receipt = {
        "schema": "p97-exact17-child32-immutable-export-receipt/v1",
        "status": "PASS",
        "publication_state": spec.publication_state,
        "parent": {
            "path": str(paths.parent.resolve()),
            "sha256": sha256_file(paths.parent),
        },
        "publication_ledger": {
            "path": str(paths.ledger.resolve()),
            "sha256": sha256_file(paths.ledger),
        },
        "publication_sources": {
            "analysis": {
                "path": str(publication_inputs.analysis.resolve()),
                "sha256": sha256_file(publication_inputs.analysis),
            },
            "parent_ledger": {
                "path": str(publication_inputs.parent_ledger.resolve()),
                "sha256": sha256_file(publication_inputs.parent_ledger),
            },
        },
        "lean": {
            "root": {
                "path": str(paths.lean_root.resolve()),
                "sha256": sha256_file(paths.lean_root),
            },
            "export": {
                "path": str(paths.lean_export.resolve()),
                "sha256": sha256_file(paths.lean_export),
            },
        },
        "child": {
            "path": str(paths.child.resolve()),
            "sha256": verified_child_sha256,
            "bytes": verified_child_bytes,
            "variables": spec.variables,
            "clauses": spec.child_clauses,
        },
        "validation": validation,
        "immutability": "exclusive-hard-link-and-exclusive-receipt/v1",
    }
    _immutable_json(paths.receipt, receipt)
    return receipt


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parent", type=Path, default=PRODUCTION_PATHS.parent)
    parser.add_argument("--ledger", type=Path, default=PRODUCTION_PATHS.ledger)
    parser.add_argument("--lean-root", type=Path, default=PRODUCTION_PATHS.lean_root)
    parser.add_argument("--lean-export", type=Path, default=PRODUCTION_PATHS.lean_export)
    parser.add_argument("--child", type=Path, default=PRODUCTION_PATHS.child)
    parser.add_argument("--receipt", type=Path, default=PRODUCTION_PATHS.receipt)
    args = parser.parse_args()
    receipt = export_child32(
        ExportPaths(
            parent=args.parent.resolve(),
            ledger=args.ledger.resolve(),
            lean_root=args.lean_root.resolve(),
            lean_export=args.lean_export.resolve(),
            child=args.child.resolve(),
            receipt=args.receipt.resolve(),
        )
    )
    print(json.dumps(receipt, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
