"""Fresh, source-custodied static wave for the FreshThird source-total CNF.

This Class-C runner is deliberately not a CEGAR loop.  It materialises one
source-total CNF for each boundary cell and makes exactly one CaDiCaL call per
cell.  SAT assignments are complete-model checked against the CNF and replayed
through the independent source semantics.  UNSAT remains a statement about the
encoded source-total relaxation, never a universal or Lean closure claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import subprocess
import uuid
from collections.abc import Callable, Mapping, Sequence
from pathlib import Path
from typing import Any

from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfError,
    _canonical_json,
)
from census.p97_search.freshthird_qfiber_three_carrier_provenance_v2 import (
    DEFAULT_SOURCE,
    archive_nonclean_snapshot_rows,
    build_snapshot,
    verify_snapshot,
)
from census.p97_search.freshthird_qfiber_three_carrier_provenance_v2 import (
    SCHEMA as SOURCE_SNAPSHOT_SCHEMA,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    SCHEMA as ENCODING_SCHEMA,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    SOURCE_THEOREM,
    FreshThirdCarrierSourceTotalCnfEncoding,
)

SCHEMA = "p97-freshthird-qfiber-three-carrier-source-total-static/v3"
PLAN_SCHEMA = f"{SCHEMA}/plan/v1"
RESULT_SCHEMA = f"{SCHEMA}/cell-result/v1"
PHASE_INGRESS_RECEIPT_SCHEMA = (
    "p97-freshthird-qfiber-three-carrier-phase-ingress-receipt/v1"
)
CELL_COUNT = 4
SOLVER_TIMEOUT_SECONDS = 30
PROCESS_TIMEOUT_GRACE_SECONDS = 5
REPLAY_TIMEOUT_MS = 60_000
STATUSES = frozenset(
    {
        "SAT_ABSTRACTION",
        "SAT_REPLAY_REJECTED",
        "UNSAT_SOURCE_TOTAL_RELAXATION",
        "UNKNOWN",
    }
)
CLAIM = "source-total finite discovery only; no universal or Lean closure"
LANE_ID = "freshthird-source-total-static-v3"
ROOT_MANIFEST_NAME = "run_manifest.json"

QUERY_PATH = "census/p97_search/freshthird_qfiber_three_carrier_query_v1.py"
SOURCE_THEOREM_MODULE = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "FreshThirdQFiberThreeCarrierFiniteQuery"
)
SOURCE_THEOREM_FULL_NAME = (
    "Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal."
    "FreshThirdQFiberThreeCarrierFiniteAssignment.noAlternatingCap_ofView"
)
PREDECESSOR_CNF_PATH = "census/p97_search/freshthird_qfiber_three_carrier_cnf_v1.py"
SOURCE_TOTAL_PATH = (
    "census/p97_search/freshthird_qfiber_three_carrier_source_total_v3.py"
)
PROVENANCE_PATH = "census/p97_search/freshthird_qfiber_three_carrier_provenance_v2.py"
RUNNER_PATH = (
    "census/p97_search/freshthird_qfiber_three_carrier_source_total_static_v3.py"
)
PHASE_INGRESS_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "FreshThirdQFiberThreeCarrierFiniteNoAlternatingCapPhaseIngress.lean"
)
PHASE_INGRESS_MODULE = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "FreshThirdQFiberThreeCarrierFiniteNoAlternatingCapPhaseIngress"
)
PHASE_INGRESS_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal."
    "FreshThirdQFiberThreeCarrierFiniteAssignment."
    "nonempty_threePhaseCapRepresentation_iff_noAlternatingCap"
)
PHASE_INGRESS_BUILD_COMMAND = (
    "lake-build",
    "-Kjobs=4",
    PHASE_INGRESS_MODULE,
)
PHASE_INGRESS_AXIOMS = ("propext", "Classical.choice", "Quot.sound")

SolverRunner = Callable[[Sequence[str], int, Path], subprocess.CompletedProcess[bytes]]


class SourceTotalStaticError(RuntimeError):
    """A static-wave custody, encoding, solver, or replay invariant failed."""


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _atomic_write_bytes(path: Path, data: bytes) -> str:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp-{uuid.uuid4().hex}")
    try:
        with temporary.open("xb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    finally:
        if temporary.exists():
            temporary.unlink()
    return _sha256(data)


def _atomic_write_json(path: Path, value: object) -> str:
    return _atomic_write_bytes(path, _canonical_json(value))


def _read_canonical_json(path: Path, description: str) -> dict[str, object]:
    try:
        raw = path.read_bytes()
        value = json.loads(raw)
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise SourceTotalStaticError(f"{description} is unreadable") from exc
    if type(value) is not dict:
        raise SourceTotalStaticError(f"{description} is not a JSON object")
    if raw != _canonical_json(value):
        raise SourceTotalStaticError(f"{description} is not canonical JSON")
    return value


def build_source_snapshot(repo_root: str | Path) -> dict[str, Any]:
    """Build the exact source, encoder, runner, and phase-ingress custody set."""

    return build_snapshot(
        repo_root,
        DEFAULT_SOURCE,
        query_path=QUERY_PATH,
        cnf_adapter_path=SOURCE_TOTAL_PATH,
        cegar_runner_path=RUNNER_PATH,
        python_paths=(PREDECESSOR_CNF_PATH, PROVENANCE_PATH),
        support_paths=(PHASE_INGRESS_PATH,),
    )


def _authenticate_source_snapshot(
    repo_root: Path, source_snapshot: Mapping[str, object]
) -> dict[str, Any]:
    if type(source_snapshot) is not dict:
        raise SourceTotalStaticError("source_snapshot must be a JSON object")
    try:
        actual = verify_snapshot(repo_root, source_snapshot)
    except Exception as exc:
        raise SourceTotalStaticError(
            f"source snapshot verification failed: {exc}"
        ) from exc
    inputs = actual.get("inputs")
    expected_inputs = {
        "source_path": DEFAULT_SOURCE,
        "query_path": QUERY_PATH,
        "cnf_adapter_path": SOURCE_TOTAL_PATH,
        "cegar_runner_path": RUNNER_PATH,
        "python_paths": sorted((PREDECESSOR_CNF_PATH, PROVENANCE_PATH)),
        "support_paths": [PHASE_INGRESS_PATH],
    }
    if inputs != expected_inputs:
        raise SourceTotalStaticError(
            "source snapshot does not bind the exact static-runner input set"
        )
    rows = actual.get("rows")
    if not (
        type(rows) is list
        and any(
            type(row) is dict
            and row.get("path") == PHASE_INGRESS_PATH
            and row.get("kind") == "source_support"
            for row in rows
        )
    ):
        raise SourceTotalStaticError("source snapshot omits the Lean phase ingress")
    return actual


def _encoding_artifacts(
    boundary_index: int,
) -> tuple[
    FreshThirdCarrierSourceTotalCnfEncoding,
    bytes,
    bytes,
    bytes,
    dict[str, object],
]:
    encoding = FreshThirdCarrierSourceTotalCnfEncoding(boundary_index)
    cnf = encoding.cnf_bytes()
    variable_map = encoding.variable_map()
    variable_map_bytes = _canonical_json(variable_map)
    encoding_manifest = encoding.encoding_manifest()
    encoding_manifest_bytes = _canonical_json(encoding_manifest)
    if encoding_manifest.get("schema") != ENCODING_SCHEMA:
        raise SourceTotalStaticError(f"cell {boundary_index} encoding schema drifted")
    if encoding_manifest.get("boundary_index") != boundary_index:
        raise SourceTotalStaticError(f"cell {boundary_index} manifest index drifted")
    if encoding_manifest.get("source_theorem") != SOURCE_THEOREM:
        raise SourceTotalStaticError(f"cell {boundary_index} source theorem drifted")
    if encoding_manifest.get("cnf_sha256") != _sha256(cnf):
        raise SourceTotalStaticError(f"cell {boundary_index} CNF digest drifted")
    if encoding_manifest.get("variable_map_sha256") != _sha256(variable_map_bytes):
        raise SourceTotalStaticError(
            f"cell {boundary_index} variable-map digest drifted"
        )
    return (
        encoding,
        cnf,
        variable_map_bytes,
        encoding_manifest_bytes,
        encoding_manifest,
    )


def plan_wave(
    *, repo_root: str | Path, source_snapshot: Mapping[str, object]
) -> dict[str, object]:
    """Authenticate the source and all four static encodings without solving."""

    repo = Path(repo_root).resolve()
    authenticated = _authenticate_source_snapshot(repo, source_snapshot)
    cells: list[dict[str, object]] = []
    for boundary_index in range(CELL_COUNT):
        _, cnf, variable_map, manifest_bytes, manifest = _encoding_artifacts(
            boundary_index
        )
        cells.append(
            {
                "boundary_index": boundary_index,
                "cnf": {"bytes": len(cnf), "sha256": _sha256(cnf)},
                "variable_map": {
                    "bytes": len(variable_map),
                    "sha256": _sha256(variable_map),
                },
                "encoding_manifest": {
                    "bytes": len(manifest_bytes),
                    "sha256": _sha256(manifest_bytes),
                    "content": manifest,
                },
            }
        )
    try:
        postflight = verify_snapshot(repo, source_snapshot)
    except Exception as exc:
        raise SourceTotalStaticError(
            f"plan postflight source snapshot verification failed: {exc}"
        ) from exc
    if postflight != authenticated:
        raise SourceTotalStaticError("plan source snapshot changed during generation")
    return {
        "schema": PLAN_SCHEMA,
        "runner_class": "C",
        "claim": CLAIM,
        "source_snapshot": {
            "schema": authenticated.get("schema"),
            "repo_head": authenticated.get("repo_head"),
            "aggregate_sha256": authenticated.get("aggregate_sha256"),
            "content_aggregate_sha256": authenticated.get("content_aggregate_sha256"),
        },
        "source_theory": DEFAULT_SOURCE,
        "source_theorem": SOURCE_THEOREM,
        "source_theorem_source": {
            "module_path": QUERY_PATH,
            "module_name": SOURCE_THEOREM_MODULE,
            "theorem": SOURCE_THEOREM_FULL_NAME,
        },
        "phase_ingress": {
            "module_path": PHASE_INGRESS_PATH,
            "module_name": PHASE_INGRESS_MODULE,
            "theorem": PHASE_INGRESS_THEOREM,
            "receipt_schema": PHASE_INGRESS_RECEIPT_SCHEMA,
            "receipt_required_for_launch": True,
        },
        "boundary_cells": list(range(CELL_COUNT)),
        "cells": cells,
        "solver_calls": 0,
        "launch_eligible": False,
        "source_snapshot_preflight_verified": True,
        "source_snapshot_postflight_verified": True,
    }


dry_run = plan_wave


def validate_phase_ingress_receipt(
    *,
    repo_root: str | Path,
    source_snapshot: Mapping[str, object],
    receipt: Mapping[str, object],
) -> dict[str, object]:
    """Validate an explicit build-and-axiom-audit launch receipt."""

    if type(receipt) is not dict:
        raise SourceTotalStaticError("phase-ingress receipt must be a JSON object")
    required_top = {
        "schema",
        "repo_head",
        "source_aggregate_sha256",
        "lean_toolchain_sha256",
        "module_path",
        "module_name",
        "module_sha256",
        "theorem",
        "build",
        "axiom_audit",
    }
    if set(receipt) != required_top:
        raise SourceTotalStaticError("phase-ingress receipt fields are malformed")
    authenticated = _authenticate_source_snapshot(
        Path(repo_root).resolve(), source_snapshot
    )
    module_path = Path(repo_root).resolve() / PHASE_INGRESS_PATH
    try:
        module_sha256 = _sha256(module_path.read_bytes())
    except OSError as exc:
        raise SourceTotalStaticError("phase-ingress module is unreadable") from exc
    rows = authenticated.get("rows")
    snapshot_module_sha256 = (
        next(
            (
                row.get("sha256")
                for row in rows
                if type(row) is dict and row.get("path") == PHASE_INGRESS_PATH
            ),
            None,
        )
        if type(rows) is list
        else None
    )
    if snapshot_module_sha256 != module_sha256:
        raise SourceTotalStaticError("phase-ingress module escaped source custody")
    expected = {
        "schema": PHASE_INGRESS_RECEIPT_SCHEMA,
        "repo_head": authenticated.get("repo_head"),
        "source_aggregate_sha256": authenticated.get("aggregate_sha256"),
        "lean_toolchain_sha256": authenticated.get("lean_toolchain_sha256"),
        "module_path": PHASE_INGRESS_PATH,
        "module_name": PHASE_INGRESS_MODULE,
        "module_sha256": module_sha256,
        "theorem": PHASE_INGRESS_THEOREM,
    }
    for key, value in expected.items():
        if receipt.get(key) != value:
            raise SourceTotalStaticError(f"phase-ingress receipt mismatch: {key}")
    build = receipt.get("build")
    if not (
        type(build) is dict
        and set(build)
        == {
            "status",
            "exit_code",
            "command",
            "module_sha256",
            "lean_toolchain_sha256",
        }
        and build.get("status") == "PASSED"
        and type(build.get("exit_code")) is int
        and build.get("exit_code") == 0
        and build.get("module_sha256") == module_sha256
        and build.get("lean_toolchain_sha256")
        == authenticated.get("lean_toolchain_sha256")
        and build.get("command") == list(PHASE_INGRESS_BUILD_COMMAND)
    ):
        raise SourceTotalStaticError("phase-ingress build receipt is not passing")
    audit = receipt.get("axiom_audit")
    if not (
        type(audit) is dict
        and set(audit) == {"status", "theorem", "axioms", "unexpected_axioms"}
        and audit.get("status") == "PASSED"
        and audit.get("theorem") == PHASE_INGRESS_THEOREM
        and audit.get("axioms") == list(PHASE_INGRESS_AXIOMS)
        and audit.get("unexpected_axioms") == []
    ):
        raise SourceTotalStaticError("phase-ingress axiom audit is not passing")
    return dict(receipt)


def _parse_cadical_model(stdout: bytes | str, num_vars: int) -> dict[int, bool]:
    try:
        text = (
            stdout.decode("utf-8", errors="strict")
            if isinstance(stdout, bytes)
            else stdout
        )
    except UnicodeDecodeError as exc:
        raise SourceTotalStaticError("CaDiCaL SAT output is not UTF-8") from exc
    assignment: dict[int, bool] = {}
    for line in text.splitlines():
        if not line.startswith("v ") and line != "v":
            continue
        for token in line.split()[1:]:
            try:
                literal = int(token)
            except ValueError as exc:
                raise SourceTotalStaticError(
                    f"malformed CaDiCaL model token: {token!r}"
                ) from exc
            if literal == 0:
                continue
            variable = abs(literal)
            if variable < 1 or variable > num_vars:
                raise SourceTotalStaticError(
                    f"CaDiCaL model literal out of range: {literal}"
                )
            value = literal > 0
            if variable in assignment and assignment[variable] != value:
                raise SourceTotalStaticError(
                    f"conflicting CaDiCaL model literal: {variable}"
                )
            assignment[variable] = value
    if len(assignment) != num_vars:
        raise SourceTotalStaticError(
            f"CaDiCaL SAT model is incomplete: {len(assignment)}/{num_vars} variables"
        )
    return assignment


def _run_solver(
    command: Sequence[str], timeout_seconds: int, repo_root: Path
) -> subprocess.CompletedProcess[bytes]:
    try:
        return subprocess.run(
            list(command),
            cwd=repo_root,
            capture_output=True,
            timeout=timeout_seconds + PROCESS_TIMEOUT_GRACE_SECONDS,
            check=False,
        )
    except subprocess.TimeoutExpired as exc:
        stdout = exc.stdout if isinstance(exc.stdout, bytes) else (exc.stdout or b"")
        stderr = exc.stderr if isinstance(exc.stderr, bytes) else (exc.stderr or b"")
        return subprocess.CompletedProcess(list(command), -1, stdout, stderr)
    except OSError as exc:
        return subprocess.CompletedProcess(list(command), -1, b"", str(exc).encode())


def _cadical_identity(binary: str) -> dict[str, object]:
    resolved = shutil.which(binary)
    if resolved is None:
        raise SourceTotalStaticError(f"CaDiCaL binary not found: {binary}")
    executable = Path(resolved).resolve()
    try:
        data = executable.read_bytes()
        version = subprocess.run(
            [str(executable), "--version"],
            check=True,
            capture_output=True,
            text=True,
            timeout=5,
        ).stdout.strip()
    except (OSError, subprocess.SubprocessError) as exc:
        raise SourceTotalStaticError(
            f"cannot authenticate CaDiCaL: {executable}"
        ) from exc
    if not version:
        raise SourceTotalStaticError("CaDiCaL returned an empty version")
    return {
        "binary": binary,
        "resolved_path": str(executable),
        "sha256": _sha256(data),
        "version": version,
        "return_codes": {"sat": 10, "unsat": 20},
        "repo_root_custody_required": True,
    }


def _solver_identity(binary: str, injected: bool) -> dict[str, object]:
    if not injected:
        return _cadical_identity(binary)
    return {
        "binary": binary,
        "injected_test_runner": True,
        "return_codes": {"sat": 10, "unsat": 20},
        "repo_root_custody_required": True,
    }


def _solver_status(returncode: int) -> str:
    if returncode == 10:
        return "SAT"
    if returncode == 20:
        return "UNSAT"
    return "UNKNOWN"


def _cell_result(
    *,
    boundary_index: int,
    encoding: FreshThirdCarrierSourceTotalCnfEncoding,
    command: Sequence[str],
    completed: subprocess.CompletedProcess[bytes],
    cnf_sha256: str,
    variable_map_sha256: str,
    encoding_manifest_sha256: str,
) -> dict[str, object]:
    solver_status = _solver_status(completed.returncode)
    common: dict[str, object] = {
        "schema": RESULT_SCHEMA,
        "boundary_index": boundary_index,
        "claim": CLAIM,
        "command": list(command),
        "solver_returncode": completed.returncode,
        "solver_status": solver_status,
        "stdout_sha256": _sha256(completed.stdout),
        "stderr_sha256": _sha256(completed.stderr),
        "cnf_sha256": cnf_sha256,
        "variable_map_sha256": variable_map_sha256,
        "encoding_manifest_sha256": encoding_manifest_sha256,
        "promotion_ready": False,
    }
    if solver_status == "SAT":
        assignment = _parse_cadical_model(completed.stdout, encoding.num_vars)
        try:
            encoding.validate_source_total_assignment(assignment)
            model_result = encoding.result_from_assignment(assignment)
            replay = encoding.replay_result(model_result, timeout_ms=REPLAY_TIMEOUT_MS)
        except (FreshThirdCarrierCnfError, ValueError) as exc:
            raise SourceTotalStaticError(
                f"cell {boundary_index} SAT validation failed: {exc}"
            ) from exc
        common["complete_model_verified"] = True
        common["source_total_assignment_verified"] = True
        common["model_result"] = model_result
        common["semantic_replay"] = {
            "accepted": replay.accepted,
            "detail": replay.detail,
        }
        common["status"] = (
            "SAT_ABSTRACTION" if replay.accepted else "SAT_REPLAY_REJECTED"
        )
    elif solver_status == "UNSAT":
        common["status"] = "UNSAT_SOURCE_TOTAL_RELAXATION"
        common["certificate_checked"] = False
    else:
        common["status"] = "UNKNOWN"
    return common


def _aggregate_status(statuses: Sequence[object]) -> str:
    values = tuple(statuses)
    if values and all(value == "UNSAT_SOURCE_TOTAL_RELAXATION" for value in values):
        return "UNSAT_SOURCE_TOTAL_RELAXATION"
    if "SAT_REPLAY_REJECTED" in values:
        return "SAT_REPLAY_REJECTED"
    if "SAT_ABSTRACTION" in values:
        return "SAT_ABSTRACTION"
    return "UNKNOWN"


def _artifact_inventory(out_dir: Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for path in sorted(out_dir.rglob("*")):
        if path.is_symlink():
            raise SourceTotalStaticError(f"unsupported output artifact: {path}")
        if path == out_dir / ROOT_MANIFEST_NAME or path.is_dir():
            continue
        if not path.is_file():
            raise SourceTotalStaticError(f"unsupported output artifact: {path}")
        data = path.read_bytes()
        rows.append(
            {
                "path": path.relative_to(out_dir).as_posix(),
                "bytes": len(data),
                "sha256": _sha256(data),
            }
        )
    return rows


def _validate_output_root(repo_root: Path, out_dir: Path) -> Path:
    resolved = out_dir.resolve()
    registered_parent = (repo_root / "scratch" / "runs" / LANE_ID).resolve()
    try:
        relative = resolved.relative_to(registered_parent)
    except ValueError as exc:
        raise SourceTotalStaticError(
            f"output root must be below scratch/runs/{LANE_ID}/"
        ) from exc
    if len(relative.parts) != 1 or not relative.parts[0]:
        raise SourceTotalStaticError("output root must name exactly one run id")
    return resolved


def _validate_source_archive(
    out_dir: Path,
    manifest: Mapping[str, object],
    source_snapshot: Mapping[str, object],
) -> None:
    archive = manifest.get("source_archive")
    if type(archive) is not dict:
        raise SourceTotalStaticError("terminal manifest omits source archive")
    archive_path = out_dir / "source-nonclean" / "manifest.json"
    if not archive_path.is_file() or archive_path.read_bytes() != _canonical_json(
        archive
    ):
        raise SourceTotalStaticError("source archive manifest drifted")
    if archive.get("schema") != f"{SOURCE_SNAPSHOT_SCHEMA}/nonclean-archive/v1":
        raise SourceTotalStaticError("source archive schema mismatch")
    if archive.get("source_aggregate_sha256") != source_snapshot.get(
        "aggregate_sha256"
    ):
        raise SourceTotalStaticError("source archive aggregate mismatch")
    archived = archive.get("archived")
    rows = source_snapshot.get("rows")
    if not (type(archived) is list and type(rows) is list):
        raise SourceTotalStaticError("source archive rows are malformed")
    expected = {
        row.get("path"): row
        for row in rows
        if type(row) is dict and bool(row.get("porcelain_status"))
    }
    if {row.get("path") for row in archived if type(row) is dict} != set(expected):
        raise SourceTotalStaticError("source archive coverage mismatch")
    for record in archived:
        if type(record) is not dict or type(record.get("path")) is not str:
            raise SourceTotalStaticError("source archive record is malformed")
        source_row = expected[record["path"]]
        if record != {
            "path": source_row.get("path"),
            "sha256": source_row.get("sha256"),
            "porcelain_status": source_row.get("porcelain_status"),
        }:
            raise SourceTotalStaticError("source archive record drifted")
        archived_path = out_dir / "source-nonclean" / record["path"]
        if not archived_path.is_file() or _sha256(
            archived_path.read_bytes()
        ) != record.get("sha256"):
            raise SourceTotalStaticError("source archive bytes drifted")


def _validate_terminal_cell(
    *,
    cell_dir: Path,
    boundary_index: int,
    plan_cell: Mapping[str, object],
    expected_status: object,
    expected_command: Sequence[str],
) -> None:
    encoding, cnf, variable_map, encoding_manifest_bytes, _ = _encoding_artifacts(
        boundary_index
    )
    expected_files = {
        "input.cnf": cnf,
        "variable-map.json": variable_map,
        "encoding-manifest.json": encoding_manifest_bytes,
    }
    for name, expected in expected_files.items():
        path = cell_dir / name
        if not path.is_file() or path.read_bytes() != expected:
            raise SourceTotalStaticError(f"cell {boundary_index} {name} drifted")
    if plan_cell.get("cnf") != {"bytes": len(cnf), "sha256": _sha256(cnf)}:
        raise SourceTotalStaticError(f"cell {boundary_index} plan CNF drifted")
    if plan_cell.get("variable_map") != {
        "bytes": len(variable_map),
        "sha256": _sha256(variable_map),
    }:
        raise SourceTotalStaticError(f"cell {boundary_index} plan map drifted")
    stdout_path = cell_dir / "solver.stdout"
    stderr_path = cell_dir / "solver.stderr"
    if not stdout_path.is_file() or not stderr_path.is_file():
        raise SourceTotalStaticError(f"cell {boundary_index} solver streams missing")
    stored = _read_canonical_json(cell_dir / "result.json", "cell result")
    command = stored.get("command")
    returncode = stored.get("solver_returncode")
    if not (
        type(command) is list
        and all(type(part) is str for part in command)
        and type(returncode) is int
    ):
        raise SourceTotalStaticError(f"cell {boundary_index} result identity malformed")
    if command != list(expected_command):
        raise SourceTotalStaticError(f"cell {boundary_index} solver command drifted")
    completed = subprocess.CompletedProcess(
        command,
        returncode,
        stdout_path.read_bytes(),
        stderr_path.read_bytes(),
    )
    regenerated = _cell_result(
        boundary_index=boundary_index,
        encoding=encoding,
        command=command,
        completed=completed,
        cnf_sha256=_sha256(cnf),
        variable_map_sha256=_sha256(variable_map),
        encoding_manifest_sha256=_sha256(encoding_manifest_bytes),
    )
    if stored != regenerated:
        raise SourceTotalStaticError(f"cell {boundary_index} result replay drifted")
    if stored.get("status") != expected_status or expected_status not in STATUSES:
        raise SourceTotalStaticError(f"cell {boundary_index} status drifted")


def _validate_terminal_manifest(
    *,
    out_dir: Path,
    manifest: Mapping[str, object],
    source_snapshot: Mapping[str, object],
    plan: Mapping[str, object],
    receipt: Mapping[str, object],
    timeout_seconds: int,
    solver_identity: Mapping[str, object],
) -> None:
    manifest_path = out_dir / ROOT_MANIFEST_NAME
    if not manifest_path.is_file() or manifest_path.read_bytes() != _canonical_json(
        manifest
    ):
        raise SourceTotalStaticError("terminal manifest is not canonical")
    producer = Path(__file__).resolve()
    required = {
        "schema": SCHEMA,
        "runner_class": "C",
        "run_state": "TERMINAL",
        "terminal": True,
        "claim": CLAIM,
        "source_snapshot": dict(source_snapshot),
        "plan": dict(plan),
        "phase_ingress_receipt": dict(receipt),
        "phase_ingress_receipt_sha256": _sha256(_canonical_json(receipt)),
        "boundary_cells": list(range(CELL_COUNT)),
        "worker_count": 1,
        "solver_calls": CELL_COUNT,
        "timeout_seconds": timeout_seconds,
        "process_timeout_seconds": timeout_seconds
        + PROCESS_TIMEOUT_GRACE_SECONDS,
        "solver": dict(solver_identity),
        "producer": str(producer),
        "producer_sha256": _sha256(producer.read_bytes()),
        "source_snapshot_preflight_verified": True,
        "source_snapshot_postflight_verified": True,
        "source_snapshot_postflight": {
            "repo_head": source_snapshot.get("repo_head"),
            "aggregate_sha256": source_snapshot.get("aggregate_sha256"),
            "content_aggregate_sha256": source_snapshot.get("content_aggregate_sha256"),
        },
    }
    for key, value in required.items():
        if manifest.get(key) != value:
            raise SourceTotalStaticError(f"terminal manifest mismatch: {key}")
    statuses = manifest.get("statuses")
    if not (
        type(statuses) is dict
        and set(statuses) == {str(index) for index in range(CELL_COUNT)}
        and all(status in STATUSES for status in statuses.values())
    ):
        raise SourceTotalStaticError("terminal statuses are malformed")
    if manifest.get("status") != _aggregate_status(tuple(statuses.values())):
        raise SourceTotalStaticError("terminal aggregate status mismatch")
    if manifest.get("artifact_inventory") != _artifact_inventory(out_dir):
        raise SourceTotalStaticError("terminal artifact inventory mismatch")
    _validate_source_archive(out_dir, manifest, source_snapshot)
    plan_cells = plan.get("cells")
    if not (type(plan_cells) is list and len(plan_cells) == CELL_COUNT):
        raise SourceTotalStaticError("terminal plan cells are malformed")
    for boundary_index, plan_cell in enumerate(plan_cells):
        if (
            type(plan_cell) is not dict
            or plan_cell.get("boundary_index") != boundary_index
        ):
            raise SourceTotalStaticError("terminal plan cell order drifted")
        _validate_terminal_cell(
            cell_dir=out_dir / f"cell-{boundary_index}",
            boundary_index=boundary_index,
            plan_cell=plan_cell,
            expected_status=statuses[str(boundary_index)],
            expected_command=(
                str(
                    solver_identity.get("resolved_path", solver_identity.get("binary"))
                ),
                "-q",
                "-t",
                str(timeout_seconds),
                str(out_dir / f"cell-{boundary_index}" / "input.cnf"),
            ),
        )


def run_wave(
    out_dir: Path,
    *,
    source_snapshot: Mapping[str, object],
    phase_ingress_receipt: Mapping[str, object] | None = None,
    cadical: str = "cadical",
    timeout_seconds: int = SOLVER_TIMEOUT_SECONDS,
    solver_runner: SolverRunner | None = None,
    repo_root: Path | None = None,
) -> dict[str, object]:
    """Run four source-total cells once, or revalidate a terminal run."""

    if repo_root is None:
        raise SourceTotalStaticError("all runs require repo_root source custody")
    repo = repo_root.resolve()
    if timeout_seconds != SOLVER_TIMEOUT_SECONDS:
        raise SourceTotalStaticError("timeout_seconds is fixed at 30")
    plan = plan_wave(repo_root=repo, source_snapshot=source_snapshot)
    if phase_ingress_receipt is None:
        raise SourceTotalStaticError(
            "production launch requires an explicit built/axiom-audited "
            "Lean phase-ingress receipt"
        )
    receipt = validate_phase_ingress_receipt(
        repo_root=repo,
        source_snapshot=source_snapshot,
        receipt=phase_ingress_receipt,
    )
    output = _validate_output_root(repo, out_dir)
    injected = solver_runner is not None
    solver_identity = _solver_identity(cadical, injected)
    solver_binary = str(solver_identity.get("resolved_path", cadical))

    if output.exists():
        if not output.is_dir():
            raise SourceTotalStaticError("output root exists and is not a directory")
        manifest_path = output / ROOT_MANIFEST_NAME
        if not manifest_path.is_file():
            raise SourceTotalStaticError("refusing any pre-existing nonterminal root")
        existing = _read_canonical_json(manifest_path, "existing manifest")
        if existing.get("run_state") != "TERMINAL":
            raise SourceTotalStaticError("refusing to revive a RUNNING or stale wave")
        _validate_terminal_manifest(
            out_dir=output,
            manifest=existing,
            source_snapshot=source_snapshot,
            plan=plan,
            receipt=receipt,
            timeout_seconds=timeout_seconds,
            solver_identity=solver_identity,
        )
        return existing

    output.mkdir(parents=True, exist_ok=False)
    producer = Path(__file__).resolve()
    manifest: dict[str, object] = {
        "schema": SCHEMA,
        "runner_class": "C",
        "run_state": "RUNNING",
        "terminal": False,
        "claim": CLAIM,
        "source_snapshot": dict(source_snapshot),
        "plan": plan,
        "phase_ingress_receipt": receipt,
        "phase_ingress_receipt_sha256": _sha256(_canonical_json(receipt)),
        "boundary_cells": list(range(CELL_COUNT)),
        "worker_count": 1,
        "solver_calls": 0,
        "timeout_seconds": timeout_seconds,
        "process_timeout_seconds": timeout_seconds
        + PROCESS_TIMEOUT_GRACE_SECONDS,
        "solver": solver_identity,
        "producer": str(producer),
        "producer_sha256": _sha256(producer.read_bytes()),
        "source_snapshot_preflight_verified": True,
        "statuses": {},
    }
    try:
        manifest["source_archive"] = archive_nonclean_snapshot_rows(
            repo, source_snapshot, output / "source-nonclean"
        )
    except Exception as exc:
        raise SourceTotalStaticError(f"source archive failed: {exc}") from exc
    _atomic_write_json(output / ROOT_MANIFEST_NAME, manifest)

    runner = _run_solver if solver_runner is None else solver_runner
    results: dict[str, dict[str, object]] = {}
    for boundary_index in range(CELL_COUNT):
        encoding, cnf, variable_map, encoding_manifest_bytes, _ = _encoding_artifacts(
            boundary_index
        )
        cell_dir = output / f"cell-{boundary_index}"
        cell_dir.mkdir(parents=True, exist_ok=False)
        cnf_path = cell_dir / "input.cnf"
        _atomic_write_bytes(cnf_path, cnf)
        _atomic_write_bytes(cell_dir / "variable-map.json", variable_map)
        _atomic_write_bytes(
            cell_dir / "encoding-manifest.json", encoding_manifest_bytes
        )
        command = (solver_binary, "-q", "-t", str(timeout_seconds), str(cnf_path))
        completed = runner(command, timeout_seconds, repo)
        if not isinstance(completed, subprocess.CompletedProcess):
            raise SourceTotalStaticError("solver callback returned a malformed result")
        if type(completed.returncode) is not int:
            raise SourceTotalStaticError("solver callback return code must be an integer")
        if not isinstance(completed.stdout, bytes) or not isinstance(
            completed.stderr, bytes
        ):
            raise SourceTotalStaticError("solver callback streams must be bytes")
        expected_inputs = {
            "input.cnf": cnf,
            "variable-map.json": variable_map,
            "encoding-manifest.json": encoding_manifest_bytes,
        }
        for name, expected in expected_inputs.items():
            path = cell_dir / name
            if not path.is_file() or path.read_bytes() != expected:
                raise SourceTotalStaticError(
                    f"cell {boundary_index} {name} drifted during solver callback"
                )
        _atomic_write_bytes(cell_dir / "solver.stdout", completed.stdout)
        _atomic_write_bytes(cell_dir / "solver.stderr", completed.stderr)
        result = _cell_result(
            boundary_index=boundary_index,
            encoding=encoding,
            command=command,
            completed=completed,
            cnf_sha256=_sha256(cnf),
            variable_map_sha256=_sha256(variable_map),
            encoding_manifest_sha256=_sha256(encoding_manifest_bytes),
        )
        _atomic_write_json(cell_dir / "result.json", result)
        results[str(boundary_index)] = result
        manifest["solver_calls"] = boundary_index + 1
        manifest["statuses"] = {key: value["status"] for key, value in results.items()}
        _atomic_write_json(output / ROOT_MANIFEST_NAME, manifest)

    try:
        postflight = verify_snapshot(repo, source_snapshot)
    except Exception as exc:
        raise SourceTotalStaticError(
            f"postflight source snapshot verification failed: {exc}"
        ) from exc
    manifest["source_snapshot_postflight_verified"] = True
    manifest["source_snapshot_postflight"] = {
        "repo_head": postflight.get("repo_head"),
        "aggregate_sha256": postflight.get("aggregate_sha256"),
        "content_aggregate_sha256": postflight.get("content_aggregate_sha256"),
    }
    manifest["run_state"] = "TERMINAL"
    manifest["terminal"] = True
    manifest["statuses"] = {key: value["status"] for key, value in results.items()}
    manifest["status"] = _aggregate_status(tuple(manifest["statuses"].values()))
    manifest["artifact_inventory"] = _artifact_inventory(output)
    _atomic_write_json(output / ROOT_MANIFEST_NAME, manifest)
    return manifest


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-snapshot", type=Path, required=True)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--out-dir", type=Path)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--launch", action="store_true")
    parser.add_argument("--phase-ingress-receipt", type=Path)
    args = parser.parse_args(argv)
    snapshot = _read_canonical_json(args.source_snapshot, "source snapshot")
    if not args.launch:
        print(
            json.dumps(
                plan_wave(repo_root=args.repo_root, source_snapshot=snapshot),
                sort_keys=True,
            )
        )
        return 0
    if args.out_dir is None or args.phase_ingress_receipt is None:
        parser.error(
            "--launch requires --out-dir and --phase-ingress-receipt; "
            "the default command is dry-run only"
        )
    receipt = _read_canonical_json(
        args.phase_ingress_receipt, "phase-ingress receipt"
    )
    run_wave(
        args.out_dir,
        source_snapshot=snapshot,
        phase_ingress_receipt=receipt,
        cadical=args.cadical,
        repo_root=args.repo_root,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
