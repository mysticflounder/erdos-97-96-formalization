# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Prepare Lean-checked exact-17 four-row-bisector physical-slice cells.

This command is preparation-only.  It never contacts PIQD and never invokes a
SAT solver.  Lean exports the cumulative root authoritatively; every retained
cell appends the exact next-center unit and all five physical-multiplicity units,
and a nontrivial sentinel set is independently exported by Lean and byte-checked.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import sys
from collections.abc import Callable, Sequence
from pathlib import Path
from typing import Any

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

import prepare_exact17_sparse_six_physical_slice_cells as hardened

from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)

ROOT = Path(__file__).resolve().parents[1]
LANE_ID = "exact17-sparse-six-four-row-bisector-20260820"
RUN_ID = "physical-slice-cell-campaign-v1"
BASE_HEAD = "163a870619ac2bae591c33095987d3e64904960c"

SOURCE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorPhysicalSliceCoverage.lean"
)
ROOT_SOURCE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector.lean"
)
EXPORTER_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorPhysicalSliceCellExport.lean"
)
VARIABLE_MAP_PATH = ROOT / "census/p97_search/waves/exact17/child40/variable-map.json"
CHECKPOINT_PATH = ROOT / f".codex/worktree-checkpoints/{LANE_ID}.json"

EXPECTED_SOURCE_SHA256 = (
    "e18c03f78eac4839650e9786043fe94e486486146a7b45873058ed3be8ebbf87"
)
EXPECTED_ROOT_SOURCE_SHA256 = (
    "444dd4a3f7dded12cfcd6efe2a89f27ae820785d865d25e769189ce42eeb958a"
)
EXPECTED_EXPORTER_SHA256 = (
    "2846ef4ee73017ff65a0aaf610dd99ab41385c3789059babddc76edb304e56d9"
)
EXPECTED_VARIABLE_MAP_SHA256 = (
    "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
)
EXPECTED_CHECKPOINT_SHA256 = (
    "90c7149c45d924cbb0e84e4a473f0d880c0cf6d6baa465d47a6b5d6d070630b3"
)

LEGAL_CENTERS = hardened.LEGAL_CENTERS
PHYSICAL_POINTS = hardened.PHYSICAL_POINTS
PARENT_VARIABLES = 308
PARENT_CLAUSES = 7_409_257
CELL_CLAUSES = 7_409_263
CELL_COUNT = 76
DIRECT_SENTINELS = (
    (0, "none"),
    (0, "unique-06"),
    (6, "none"),
    (16, "unique-10"),
)
SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorPhysicalSliceCoverage."
    "sourceAssign_sparseSixPointFourRowTwoCircleBisectorPhysicalSliceCell"
)
ORDER_SHA256 = sha256_bytes(
    b"exact17-sparse-six-four-row-bisector-physical-slice-order-v1"
)
SCHEMA = "p97-exact17-sparse-six-four-row-bisector-physical-slice-preparation/v1"
CAMPAIGN_SCHEMA = "p97-exact17-sparse-six-four-row-bisector-physical-slice-campaign/v1"
PRODUCER_SCHEMA = "p97-piqd-static-producer/v1"
SOURCE_SCHEMA = "p97-piqd-static-source/v1"
WAVE_SCHEMA = "p97-cegar-wave/v1"

PreparationError = hardened.PreparationError


def _sha256_file(path: Path) -> str:
    return hardened._sha256_file(path)


def _require_regular(path: Path, label: str) -> None:
    hardened._require_regular(path, label)
    if os.lstat(path).st_nlink != 1:
        raise PreparationError(f"{label} must have exactly one hard link")


def _require_dir(path: Path, label: str) -> None:
    hardened._require_dir(path, label)


def _mkdir_once(path: Path) -> None:
    hardened._mkdir_once(path)


def _write_once(path: Path, payload: bytes) -> None:
    hardened._write_once(path, payload)
    _require_regular(path, "new write-once artifact")


def _repo_relative(root: Path, path: Path) -> str:
    return hardened._repo_relative(root, path)


def _physical_categories(center: int) -> tuple[str, ...]:
    return hardened._physical_categories(center)


def category_id(center: int, category: str) -> str:
    hardened.category_id(center, category)
    return f"four-row-bisector-next-center-{center:02d}-physical-{category}"


def atom_variable(center: int, point: int) -> int:
    if type(center) is not int or center not in LEGAL_CENTERS:
        raise PreparationError(f"illegal next-center label: {center!r}")
    if type(point) is not int or not 0 <= point < 17:
        raise PreparationError(f"illegal point label: {point!r}")
    variable = 1 + 17 * center + point
    if not 1 <= variable <= PARENT_VARIABLES:
        raise PreparationError("atom variable exceeds the authenticated variable map")
    return variable


def category_units(center: int, category: str) -> tuple[int, ...]:
    """The exact next-center unit followed by all five multiplicity units."""
    physical = hardened.category_units(center, category)
    return (atom_variable(center, center),) + physical


def cell_cnf_bytes(parent: bytes, center: int, category: str) -> bytes:
    first, separator, body = parent.partition(b"\n")
    if not separator:
        raise PreparationError("parent DIMACS header is missing")
    variables, clauses = hardened._parent_header(first + separator)
    if (variables, clauses) != (PARENT_VARIABLES, PARENT_CLAUSES):
        raise PreparationError("cumulative-root dimensions drifted")
    units = category_units(center, category)
    suffix = b"".join(f"{unit} 0\n".encode("ascii") for unit in units)
    return f"p cnf {variables} {clauses + len(units)}\n".encode() + body + suffix


def _require_pin(value: str | int, label: str) -> None:
    if value in ("", 0):
        raise PreparationError(f"{label} is not pinned")


def _read_json(path: Path, label: str) -> dict[str, Any]:
    return hardened._read_json(path, label)


def _validate_checkpoint(
    checkpoint: dict[str, Any], required_paths: set[str], generated_root: str
) -> None:
    if checkpoint.get("schema") != "worktree-lane-checkpoint/v1":
        raise PreparationError("checkpoint schema drifted")
    if checkpoint.get("lane_id") != LANE_ID or checkpoint.get("base_head") != BASE_HEAD:
        raise PreparationError("checkpoint lane or base-head drifted")
    owned = checkpoint.get("owned_paths")
    if not isinstance(owned, list) or not required_paths <= set(owned):
        raise PreparationError("checkpoint ownership does not cover the package")
    generated = checkpoint.get("generated_roots")
    if not isinstance(generated, list) or generated_root not in generated:
        raise PreparationError("checkpoint does not register the output root")


def _validate_support(
    *,
    repo_root: Path,
    source_path: Path,
    root_source_path: Path,
    exporter_path: Path,
    variable_map_path: Path,
    checkpoint_path: Path,
    output_root: Path,
) -> dict[str, str]:
    pins: tuple[tuple[str | int, str], ...] = (
        (EXPECTED_SOURCE_SHA256, "Lean source SHA-256"),
        (EXPECTED_ROOT_SOURCE_SHA256, "Lean root source SHA-256"),
        (EXPECTED_EXPORTER_SHA256, "Lean exporter SHA-256"),
        (EXPECTED_VARIABLE_MAP_SHA256, "variable-map SHA-256"),
        (EXPECTED_CHECKPOINT_SHA256, "checkpoint SHA-256"),
    )
    for value, label in pins:
        _require_pin(value, label)
    files = {
        "source": (source_path, EXPECTED_SOURCE_SHA256),
        "root_source": (root_source_path, EXPECTED_ROOT_SOURCE_SHA256),
        "exporter": (exporter_path, EXPECTED_EXPORTER_SHA256),
        "variable_map": (variable_map_path, EXPECTED_VARIABLE_MAP_SHA256),
        "checkpoint": (checkpoint_path, EXPECTED_CHECKPOINT_SHA256),
    }
    digests: dict[str, str] = {}
    for label, (path, expected) in files.items():
        _require_regular(path, label)
        digest = _sha256_file(path)
        if digest != expected:
            raise PreparationError(f"{label} digest drifted")
        digests[label] = digest
    preparer_path = Path(__file__).resolve()
    if preparer_path.is_relative_to(repo_root):
        _require_regular(preparer_path, "preparer source")
        digests["preparer"] = _sha256_file(preparer_path)
    _validate_checkpoint(
        _read_json(checkpoint_path, "lane checkpoint"),
        {
            _repo_relative(repo_root, source_path),
            _repo_relative(repo_root, root_source_path),
            _repo_relative(repo_root, exporter_path),
            _repo_relative(repo_root, Path(__file__).resolve())
            if Path(__file__).resolve().is_relative_to(repo_root)
            else "scripts/prepare_exact17_sparse_six_four_row_bisector_physical_slice_cells.py",
            "scripts/test_prepare_exact17_sparse_six_four_row_bisector_physical_slice_cells.py",
        },
        _repo_relative(repo_root, output_root),
    )
    return digests


def _export_category_text(category: str) -> str:
    if category == "none":
        return category
    if not category.startswith("unique-"):
        raise PreparationError(f"invalid physical category: {category!r}")
    return str(int(category.removeprefix("unique-")))


def verify_committed_support(
    repo_root: Path, source_commit: str, paths: Sequence[Path]
) -> None:
    """Require the exact support bytes to exist at the declared Git commit."""
    if len(source_commit) != 40 or any(
        c not in "0123456789abcdef" for c in source_commit
    ):
        raise PreparationError("source commit must be a full lowercase SHA-1")
    try:
        kind = subprocess.run(
            ["git", "cat-file", "-t", source_commit],
            cwd=repo_root,
            check=True,
            capture_output=True,
        )
    except (OSError, subprocess.CalledProcessError) as error:
        raise PreparationError("source commit object is unavailable") from error
    if kind.stdout != b"commit\n":
        raise PreparationError("source commit object is not a commit")
    for path in paths:
        relative = _repo_relative(repo_root, path)
        try:
            completed = subprocess.run(
                ["git", "show", f"{source_commit}:{relative}"],
                cwd=repo_root,
                check=True,
                capture_output=True,
            )
        except (OSError, subprocess.CalledProcessError) as error:
            raise PreparationError(
                f"support path is not committed at {source_commit}: {relative}"
            ) from error
        if sha256_bytes(completed.stdout) != _sha256_file(path):
            raise PreparationError(
                f"working support differs from source commit: {relative}"
            )


def run_lean_root_export(
    repo_root: Path, exporter_path: Path, output_path: Path
) -> None:
    """Invoke the exporter's cumulative-root mode."""
    _require_dir(output_path.parent, "Lean export directory")
    lean_root = repo_root / "lean"
    relative = exporter_path.resolve().relative_to(lean_root.resolve())
    try:
        subprocess.run(
            ["lake", "env", "lean", "--run", str(relative), "root", str(output_path)],
            cwd=lean_root,
            check=True,
        )
    except (OSError, subprocess.CalledProcessError) as error:
        raise PreparationError("Lean cumulative-root export failed") from error


def run_lean_export(
    repo_root: Path,
    exporter_path: Path,
    center: int,
    category: str,
    output_path: Path,
) -> None:
    """Run the pinned Lean exporter.  The caller validates the output bytes."""
    _require_dir(output_path.parent, "Lean export directory")
    lean_root = repo_root / "lean"
    relative = exporter_path.resolve().relative_to(lean_root.resolve())
    try:
        subprocess.run(
            [
                "lake",
                "env",
                "lean",
                "--run",
                str(relative),
                str(center),
                _export_category_text(category),
                str(output_path),
            ],
            cwd=lean_root,
            check=True,
        )
    except (OSError, subprocess.CalledProcessError) as error:
        raise PreparationError("Lean cell export failed") from error


LeanExporter = Callable[[Path, Path, int, str, Path], None]
LeanRootExporter = Callable[[Path, Path, Path], None]
CommitVerifier = Callable[[Path, str, Sequence[Path]], None]


def _cell_from_parent(
    parent_path: Path,
    output_path: Path,
    center: int,
    category: str,
    parent: dict[str, Any],
) -> dict[str, Any]:
    """Stream the pinned root and exact six units into a write-once cell."""
    _require_regular(parent_path, "cumulative root")
    _require_dir(output_path.parent, "cell directory")
    expected_payload: bytes | None = None
    if output_path.exists() or output_path.is_symlink():
        _require_regular(output_path, "existing cell")
        expected_payload = cell_cnf_bytes(parent_path.read_bytes(), center, category)
        if output_path.read_bytes() != expected_payload:
            raise PreparationError("existing cell differs")
        return {
            "path": output_path,
            "sha256": sha256_bytes(expected_payload),
            "bytes": len(expected_payload),
        }
    candidate = output_path.with_name(f".{output_path.name}.candidate")
    if candidate.exists() or candidate.is_symlink():
        raise PreparationError(f"unexpected stale cell candidate: {candidate}")
    digest = hashlib.sha256()
    parent_digest = hashlib.sha256()
    size = 0
    with parent_path.open("rb") as source, candidate.open("xb") as target:
        header = source.readline()
        parent_digest.update(header)
        variables, clauses = hardened._parent_header(header)
        if (variables, clauses) != (parent["variables"], parent["clauses"]):
            raise PreparationError("cumulative-root header changed")
        units = category_units(center, category)
        replacement = f"p cnf {variables} {clauses + len(units)}\n".encode()
        target.write(replacement)
        digest.update(replacement)
        size += len(replacement)
        for block in iter(lambda: source.read(1024 * 1024), b""):
            parent_digest.update(block)
            target.write(block)
            digest.update(block)
            size += len(block)
        suffix = b"".join(f"{unit} 0\n".encode() for unit in units)
        target.write(suffix)
        digest.update(suffix)
        size += len(suffix)
        target.flush()
        os.fsync(target.fileno())
    if (parent_digest.hexdigest(), parent_path.stat().st_size) != (
        parent["sha256"],
        parent["bytes"],
    ):
        candidate.unlink(missing_ok=True)
        raise PreparationError("cumulative root changed during cell creation")
    os.link(candidate, output_path)
    candidate.unlink()
    return {"path": output_path, "sha256": digest.hexdigest(), "bytes": size}


def _files_equal(left: Path, right: Path) -> bool:
    if left.stat().st_size != right.stat().st_size:
        return False
    with left.open("rb") as first, right.open("rb") as second:
        while True:
            a = first.read(1024 * 1024)
            b = second.read(1024 * 1024)
            if a != b:
                return False
            if not a:
                return True


def _claims() -> dict[str, bool]:
    return hardened._claims()


def _source_claims() -> dict[str, bool]:
    return hardened._source_claims()


def build_producer(
    center: int,
    category: str,
    source_path: str,
    source_sha256: str,
    root_source_path: str,
    root_source_sha256: str,
    exporter_path: str,
    exporter_sha256: str,
    variable_map_sha256: str,
    parent_root_sha256: str,
    parent_producer_sha256: str,
) -> bytes:
    source = {
        "cardinality_scope": f"exactly 17 models in {category_id(center, category)}",
        "claims": _source_claims(),
        "finite_schema": "p97-exact17-sparse-six-four-row-bisector-physical-slice/v1",
        "schema": SOURCE_SCHEMA,
        "source_id": category_id(center, category),
        "source_path": source_path,
        "source_sha256": source_sha256,
        "root_source_path": root_source_path,
        "root_source_sha256": root_source_sha256,
        "source_theorem": SOURCE_THEOREM,
    }
    return canonical_json_bytes(
        {
            "backend": "cadical",
            "claims": _claims(),
            "exporter_path": exporter_path,
            "exporter_sha256": exporter_sha256,
            "parent_producer_sha256": parent_producer_sha256,
            "parent_root_sha256": parent_root_sha256,
            "producer_id": f"{category_id(center, category)}-v1",
            "producer_kind": "lean-exported-static-dimacs",
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
            "schema": PRODUCER_SCHEMA,
            "solver_profile": "unsat",
            "source_manifest": source,
            "source_manifest_sha256": sha256_bytes(canonical_json_bytes(source)),
            "variable_map_sha256": variable_map_sha256,
        }
    )


def build_root_producer(
    *,
    root_sha256: str,
    root_bytes: int,
    source_path: str,
    source_sha256: str,
    root_source_path: str,
    root_source_sha256: str,
    exporter_path: str,
    exporter_sha256: str,
    checkpoint_path: str,
    checkpoint_sha256: str,
    variable_map_sha256: str,
    source_commit: str,
) -> bytes:
    """Bind a generated cumulative root to committed Lean exporter custody."""
    return canonical_json_bytes(
        {
            "schema": "p97-exact17-sparse-six-four-row-bisector-root-producer/v1",
            "producer_kind": "lean-exported-static-dimacs-root",
            "claims": {
                "exact17_closed": False,
                "proof_verified": False,
                "source_entitlement": False,
                "theorem_coverage": False,
                "lean_closure": False,
            },
            "root": {
                "sha256": root_sha256,
                "bytes": root_bytes,
                "variables": PARENT_VARIABLES,
                "clauses": PARENT_CLAUSES,
            },
            "source_path": source_path,
            "source_sha256": source_sha256,
            "root_source_path": root_source_path,
            "root_source_sha256": root_source_sha256,
            "exporter_path": exporter_path,
            "exporter_sha256": exporter_sha256,
            "checkpoint_path": checkpoint_path,
            "checkpoint_sha256": checkpoint_sha256,
            "variable_map_sha256": variable_map_sha256,
            "source_commit": source_commit,
        }
    )


def build_wave(
    center: int,
    category: str,
    cnf_sha256: str,
    producer_sha256: str,
    shard: int,
    source_sha256: str,
    variable_map_sha256: str,
) -> bytes:
    wave = {
        "schema": WAVE_SCHEMA,
        "wave_id": f"{category_id(center, category)}-v1",
        "iteration": 0,
        "parent_checkpoint_sha256": EXPECTED_CHECKPOINT_SHA256,
        "source": {
            "live_leaf": "Problem97.ATailFrontierLiveClosure.card_eq_seventeen_secondCapNine",
            "ingress_hypotheses_sha256": source_sha256,
            "finite_schema": "p97-exact17-sparse-six-four-row-bisector-physical-slice/v1",
            "cardinality_scope": f"exactly 17 models in {category_id(center, category)}",
            "source_theorem": SOURCE_THEOREM,
        },
        "encoding": {
            "cnf_sha256": cnf_sha256,
            "variable_map_sha256": variable_map_sha256,
            "producer_manifest_sha256": producer_sha256,
            "num_variables": PARENT_VARIABLES,
            "num_clauses": CELL_CLAUSES,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "unsat",
            "shard_id": shard,
            "shard_count": CELL_COUNT,
            "order_sha256": ORDER_SHA256,
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    validate_wave_manifest(wave)
    return canonical_json_bytes(wave)


def _ref(root: Path, path: Path, payload: bytes) -> dict[str, Any]:
    return hardened._ref(root, path, payload)


def _file_ref(root: Path, path: Path, digest: str, size: int) -> dict[str, Any]:
    return hardened._file_ref(root, path, digest, size)


def build_run_manifest(
    repo_root: Path,
    output_root: Path,
    digests: dict[str, str],
    *,
    source_path: Path,
    root_source_path: Path,
    exporter_path: Path,
    variable_map_path: Path,
    checkpoint_path: Path,
) -> bytes:
    """Build the immutable manifest for the empty governed run skeleton."""
    source_digests = {
        _repo_relative(repo_root, source_path): digests["source"],
        _repo_relative(repo_root, root_source_path): digests["root_source"],
        _repo_relative(repo_root, exporter_path): digests["exporter"],
        _repo_relative(repo_root, checkpoint_path): digests["checkpoint"],
    }
    preparer_path = Path(__file__).resolve()
    if "preparer" in digests and preparer_path.is_relative_to(repo_root):
        source_digests[_repo_relative(repo_root, preparer_path)] = digests["preparer"]
    run = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": _repo_relative(repo_root, output_root),
        "owner": "root",
        "base_head": BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": source_digests,
        "input_digests": {
            _repo_relative(repo_root, variable_map_path): digests["variable_map"],
        },
        "created_utc": "2026-08-21T00:00:00Z",
    }
    run["manifest_sha256"] = sha256_bytes(canonical_json_bytes(run))
    return canonical_json_bytes(run)


def _validate_empty_governed_skeleton(output: Path, manifest: bytes) -> None:
    """Require exactly run_manifest.json plus three empty governed directories."""
    _require_dir(output, "governed run root")
    expected_names = {"artifacts", "events", "tmp", "run_manifest.json"}
    actual_names = {entry.name for entry in os.scandir(output)}
    if actual_names != expected_names:
        raise PreparationError("governed run skeleton is not exact and empty")
    for name in ("artifacts", "events", "tmp"):
        directory = output / name
        _require_dir(directory, f"governed {name} directory")
        if any(os.scandir(directory)):
            raise PreparationError(f"governed {name} directory is not empty")
    manifest_path = output / "run_manifest.json"
    _require_regular(manifest_path, "governed run manifest")
    if manifest_path.read_bytes() != manifest:
        raise PreparationError("governed run manifest differs")


def initialize_run_root(
    *,
    output_root: Path,
    repo_root: Path = ROOT,
    source_path: Path = SOURCE_PATH,
    root_source_path: Path = ROOT_SOURCE_PATH,
    exporter_path: Path = EXPORTER_PATH,
    variable_map_path: Path = VARIABLE_MAP_PATH,
    checkpoint_path: Path = CHECKPOINT_PATH,
) -> dict[str, Any]:
    """Create or exactly replay the empty governed run skeleton only."""
    root = repo_root.resolve(strict=True)
    output = output_root.resolve(strict=False)
    try:
        output.relative_to(root)
    except ValueError as error:
        raise PreparationError("output root must be inside repository") from error
    digests = _validate_support(
        repo_root=root,
        source_path=source_path,
        root_source_path=root_source_path,
        exporter_path=exporter_path,
        variable_map_path=variable_map_path,
        checkpoint_path=checkpoint_path,
        output_root=output,
    )
    manifest = build_run_manifest(
        root,
        output,
        digests,
        source_path=source_path,
        root_source_path=root_source_path,
        exporter_path=exporter_path,
        variable_map_path=variable_map_path,
        checkpoint_path=checkpoint_path,
    )
    if output.exists() or output.is_symlink():
        _validate_empty_governed_skeleton(output, manifest)
        return {
            "status": "RUN_ROOT_ALREADY_INITIALIZED",
            "run_manifest": json.loads(manifest),
        }
    _require_dir(output.parent, "governed run parent")
    candidate = output.with_name(f".{output.name}.initialize-candidate")
    if candidate.exists() or candidate.is_symlink():
        raise PreparationError(f"stale initialization candidate: {candidate}")
    candidate.mkdir()
    for name in ("artifacts", "events", "tmp"):
        (candidate / name).mkdir()
    _write_once(candidate / "run_manifest.json", manifest)
    try:
        os.rename(candidate, output)
    except OSError as error:
        raise PreparationError("atomic governed run initialization failed") from error
    _validate_empty_governed_skeleton(output, manifest)
    return {"status": "RUN_ROOT_INITIALIZED", "run_manifest": json.loads(manifest)}


def prepare_campaign(
    *,
    output_root: Path,
    source_commit: str,
    repo_root: Path = ROOT,
    source_path: Path = SOURCE_PATH,
    root_source_path: Path = ROOT_SOURCE_PATH,
    exporter_path: Path = EXPORTER_PATH,
    variable_map_path: Path = VARIABLE_MAP_PATH,
    checkpoint_path: Path = CHECKPOINT_PATH,
    lean_root_exporter: LeanRootExporter = run_lean_root_export,
    lean_exporter: LeanExporter = run_lean_export,
    commit_verifier: CommitVerifier = verify_committed_support,
) -> dict[str, Any]:
    """Prepare all 76 source-total cells and directly Lean-check the sentinels."""
    root = repo_root.resolve(strict=True)
    output = output_root.resolve(strict=False)
    try:
        output.relative_to(root)
    except ValueError as error:
        raise PreparationError("output root must be inside repository") from error
    digests = _validate_support(
        repo_root=root,
        source_path=source_path,
        root_source_path=root_source_path,
        exporter_path=exporter_path,
        variable_map_path=variable_map_path,
        checkpoint_path=checkpoint_path,
        output_root=output,
    )
    run_manifest = build_run_manifest(
        root,
        output,
        digests,
        source_path=source_path,
        root_source_path=root_source_path,
        exporter_path=exporter_path,
        variable_map_path=variable_map_path,
        checkpoint_path=checkpoint_path,
    )
    _validate_empty_governed_skeleton(output, run_manifest)
    committed_support = [source_path, root_source_path, exporter_path]
    preparer_path = Path(__file__).resolve()
    if preparer_path.is_relative_to(root):
        committed_support.append(preparer_path)
    commit_verifier(root, source_commit, tuple(committed_support))
    parent_root_path = output / "artifacts" / "cumulative-root.cnf"
    root_candidate = output / "tmp" / "cumulative-root.lean.cnf"
    if root_candidate.exists() or root_candidate.is_symlink():
        raise PreparationError(f"stale cumulative-root export: {root_candidate}")
    lean_root_exporter(root, exporter_path, root_candidate)
    try:
        _require_regular(root_candidate, "Lean cumulative-root export")
        root_sha256 = _sha256_file(root_candidate)
        root_bytes = root_candidate.stat().st_size
        parent = hardened.inspect_parent(
            root_candidate,
            expected_sha256=root_sha256,
            expected_bytes=root_bytes,
            expected_variables=PARENT_VARIABLES,
            expected_clauses=PARENT_CLAUSES,
        )
        if parent_root_path.exists() or parent_root_path.is_symlink():
            _require_regular(parent_root_path, "existing cumulative root")
            if not _files_equal(root_candidate, parent_root_path):
                raise PreparationError("existing cumulative root differs")
        else:
            os.link(root_candidate, parent_root_path)
    finally:
        if root_candidate.exists() and not root_candidate.is_symlink():
            root_candidate.unlink()
    root_producer = build_root_producer(
        root_sha256=parent["sha256"],
        root_bytes=parent["bytes"],
        source_path=_repo_relative(root, source_path),
        source_sha256=digests["source"],
        root_source_path=_repo_relative(root, root_source_path),
        root_source_sha256=digests["root_source"],
        exporter_path=_repo_relative(root, exporter_path),
        exporter_sha256=digests["exporter"],
        checkpoint_path=_repo_relative(root, checkpoint_path),
        checkpoint_sha256=digests["checkpoint"],
        variable_map_sha256=digests["variable_map"],
        source_commit=source_commit,
    )
    root_producer_path = output / "artifacts" / "root-producer-manifest.json"
    _write_once(root_producer_path, root_producer)
    root_producer_sha256 = sha256_bytes(root_producer)
    cells: list[dict[str, Any]] = []
    direct_validated: list[str] = []
    shard = 0
    for center in LEGAL_CENTERS:
        for category in _physical_categories(center):
            identifier = category_id(center, category)
            directory = output / "artifacts" / "cells" / identifier
            _mkdir_once(directory)
            cnf_path = directory / f"{identifier}.cnf"
            cnf = _cell_from_parent(
                parent_root_path, cnf_path, center, category, parent
            )
            is_direct_sentinel = (center, category) in DIRECT_SENTINELS
            if is_direct_sentinel:
                direct_path = output / "tmp" / f"{identifier}.lean.cnf"
                if direct_path.exists() or direct_path.is_symlink():
                    raise PreparationError(f"stale direct Lean export: {direct_path}")
                lean_exporter(root, exporter_path, center, category, direct_path)
                try:
                    _require_regular(direct_path, "direct Lean cell export")
                    hardened.inspect_parent(
                        direct_path,
                        expected_sha256=cnf["sha256"],
                        expected_bytes=cnf["bytes"],
                        expected_variables=PARENT_VARIABLES,
                        expected_clauses=CELL_CLAUSES,
                    )
                    if not _files_equal(direct_path, cnf_path):
                        raise PreparationError("direct Lean cell bytes differ")
                    direct_validated.append(identifier)
                finally:
                    if direct_path.exists() and not direct_path.is_symlink():
                        direct_path.unlink()
            producer = build_producer(
                center,
                category,
                _repo_relative(root, source_path),
                digests["source"],
                _repo_relative(root, root_source_path),
                digests["root_source"],
                _repo_relative(root, exporter_path),
                digests["exporter"],
                digests["variable_map"],
                parent["sha256"],
                root_producer_sha256,
            )
            producer_path = directory / "producer-manifest.json"
            _write_once(producer_path, producer)
            wave = build_wave(
                center,
                category,
                cnf["sha256"],
                sha256_bytes(producer),
                shard,
                digests["source"],
                digests["variable_map"],
            )
            wave_path = directory / "wave-manifest.json"
            _write_once(wave_path, wave)
            cells.append(
                {
                    "cell_id": identifier,
                    "center": center,
                    "category": category,
                    "ordinal": shard,
                    "cnf": _file_ref(root, cnf_path, cnf["sha256"], cnf["bytes"]),
                    "producer_manifest": _ref(root, producer_path, producer),
                    "wave_manifest": _ref(root, wave_path, wave),
                    "direct_lean_bytes_validated": is_direct_sentinel,
                    "claims": _claims(),
                }
            )
            shard += 1
    if shard != CELL_COUNT:
        raise PreparationError("source-total physical category count drifted")
    if tuple(direct_validated) != tuple(
        category_id(center, category) for center, category in DIRECT_SENTINELS
    ):
        raise PreparationError("direct Lean sentinel coverage drifted")
    campaign = {
        "schema": CAMPAIGN_SCHEMA,
        "project": "erdos-97-96-formalization",
        "status": "PREPARED_LOCAL_ONLY",
        "claims": {
            "exact17_closed": False,
            "proof_verified": False,
            "source_entitlement": False,
            "theorem_coverage": False,
            "universal_lift": False,
        },
        "source": {
            "path": _repo_relative(root, source_path),
            "sha256": digests["source"],
            "root_source_path": _repo_relative(root, root_source_path),
            "root_source_sha256": digests["root_source"],
            "exporter_path": _repo_relative(root, exporter_path),
            "exporter_sha256": digests["exporter"],
            "variable_map_path": _repo_relative(root, variable_map_path),
            "variable_map_sha256": digests["variable_map"],
            "checkpoint_path": _repo_relative(root, checkpoint_path),
            "checkpoint_sha256": digests["checkpoint"],
            "source_commit": source_commit,
            "parent_root_sha256": parent["sha256"],
            "parent_producer_sha256": root_producer_sha256,
        },
        "cell_count": len(cells),
        "cells": cells,
    }
    campaign_bytes = canonical_json_bytes(campaign)
    campaign_path = output / "artifacts" / "campaign-manifest.json"
    _write_once(campaign_path, campaign_bytes)
    report = {
        "schema": SCHEMA,
        "status": "PREPARED_LOCAL_ONLY",
        "production_run": False,
        "cell_count": len(cells),
        "direct_lean_cells_validated": len(direct_validated),
        "direct_lean_sentinels": direct_validated,
        "campaign_manifest": _ref(root, campaign_path, campaign_bytes),
        "claims": campaign["claims"],
    }
    report_bytes = canonical_json_bytes(report)
    report_path = output / "artifacts" / "preparation-report.json"
    _write_once(report_path, report_bytes)
    if (output / "run_manifest.json").read_bytes() != run_manifest:
        raise PreparationError("governed run manifest changed during preparation")
    return report


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--root-source", type=Path, required=True)
    parser.add_argument("--exporter", type=Path, required=True)
    parser.add_argument("--checkpoint", type=Path, required=True)
    parser.add_argument("--source-commit")
    parser.add_argument("--initialize-run-root", action="store_true")
    parser.add_argument("--output-root", type=Path, required=True)
    args = parser.parse_args(argv)
    if args.initialize_run_root:
        initialized = initialize_run_root(
            source_path=args.source,
            root_source_path=args.root_source,
            exporter_path=args.exporter,
            checkpoint_path=args.checkpoint,
            output_root=args.output_root,
        )
        print(json.dumps({"status": initialized["status"]}, sort_keys=True))
        return 0
    if args.source_commit is None:
        parser.error("--source-commit is required for preparation")
    report = prepare_campaign(
        source_path=args.source,
        root_source_path=args.root_source,
        exporter_path=args.exporter,
        checkpoint_path=args.checkpoint,
        source_commit=args.source_commit,
        output_root=args.output_root,
    )
    print(
        json.dumps(
            {"status": report["status"], "cell_count": report["cell_count"]},
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
