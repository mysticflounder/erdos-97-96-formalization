"""Bounded, source-authenticated Class-C CEGAR for the FreshThird CNF.

This runner is discovery infrastructure only.  It serializes one deterministic
CaDiCaL call at a time for each of the four boundary cells.  A SAT assignment
is decoded and checked by the CNF adapter, then sent through its fresh-session
semantic replay.  A rejected assignment can contribute only the adapter's
source-named cyclic-cap cut; every other rejection is terminal.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import shutil
import subprocess
import time
from collections.abc import Callable, Mapping, Sequence
from pathlib import Path

from census.p97_search.freshthird_qfiber_three_carrier_cap_alternation_replay_v1 import (
    CapAlternationCertificateError,
    build_cap_alternation_certificate,
    cap_alternation_certificate_bytes,
    load_cap_alternation_certificate,
    replay_repository_cap_alternation_certificate,
)
from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfEncoding,
    FreshThirdCarrierCnfError,
    _canonical_json,
)
from census.p97_search.freshthird_qfiber_three_carrier_provenance_v2 import (
    archive_nonclean_snapshot_rows,
    verify_snapshot,
)

SCHEMA = "p97-freshthird-qfiber-three-carrier-structural-cegar/v2"
CELL_COUNT = 4
MAX_CUTS_PER_CELL = 12
SOLVER_TIMEOUT_SECONDS = 30
STATUSES = frozenset(
    {
        "SAT_ABSTRACTION",
        "COVERAGE_UNSAT_DISCOVERY",
        "STUCK_NO_ADMISSIBLE_CUT",
        "UNKNOWN",
        "BUDGET",
    }
)
CLAIM = "bounded-discovery-only; no universal or Lean closure"


class StructuralCegarError(RuntimeError):
    """Malformed input or a fail-closed runner invariant violation."""


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _write_bytes(path: Path, data: bytes) -> str:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)
    return _sha256(data)


def _write_json(path: Path, value: object) -> str:
    return _write_bytes(path, _canonical_json(value))


def _parse_cadical_model(stdout: bytes | str, num_vars: int) -> dict[int, bool]:
    """Parse only a complete CaDiCaL SAT model; fail closed otherwise."""

    text = (
        stdout.decode("utf-8", errors="strict") if isinstance(stdout, bytes) else stdout
    )
    assignment: dict[int, bool] = {}
    for line in text.splitlines():
        if not line.startswith("v ") and line != "v":
            continue
        for token in line.split()[1:]:
            try:
                literal = int(token)
            except ValueError as exc:
                raise StructuralCegarError(
                    f"malformed CaDiCaL model token: {token!r}"
                ) from exc
            if literal == 0:
                continue
            variable = abs(literal)
            if variable < 1 or variable > num_vars:
                raise StructuralCegarError(
                    f"CaDiCaL model literal out of range: {literal}"
                )
            value = literal > 0
            if variable in assignment and assignment[variable] != value:
                raise StructuralCegarError(
                    f"conflicting CaDiCaL model literal: {variable}"
                )
            assignment[variable] = value
    if len(assignment) != num_vars:
        raise StructuralCegarError(
            f"CaDiCaL SAT model is incomplete: {len(assignment)}/{num_vars} variables"
        )
    return assignment


def _run_solver(
    command: Sequence[str], timeout_seconds: int
) -> subprocess.CompletedProcess[bytes]:
    try:
        return subprocess.run(
            list(command),
            capture_output=True,
            timeout=timeout_seconds,
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
        raise StructuralCegarError(f"CaDiCaL binary not found: {binary}")
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
        raise StructuralCegarError(
            f"cannot authenticate CaDiCaL: {executable}"
        ) from exc
    if not version:
        raise StructuralCegarError("CaDiCaL returned an empty version")
    return {
        "binary": binary,
        "resolved_path": str(executable),
        "sha256": _sha256(data),
        "version": version,
        "return_codes": {"sat": 10, "unsat": 20},
    }


def _solver_status(returncode: int) -> str:
    if returncode == 10:
        return "SAT"
    if returncode == 20:
        return "UNSAT"
    return "UNKNOWN"


def _aggregate_status(statuses: Sequence[object]) -> str:
    values = tuple(statuses)
    if values and all(value == "COVERAGE_UNSAT_DISCOVERY" for value in values):
        return "COVERAGE_UNSAT_DISCOVERY"
    if values and all(value == "SAT_ABSTRACTION" for value in values):
        return "SAT_ABSTRACTION"
    for terminal in ("BUDGET", "STUCK_NO_ADMISSIBLE_CUT", "UNKNOWN"):
        if terminal in values:
            return terminal
    return "UNKNOWN"


def _artifact_inventory(out_dir: Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for path in sorted(out_dir.rglob("*")):
        if path == out_dir / "manifest.json" or path.is_dir():
            continue
        if path.is_symlink() or not path.is_file():
            raise StructuralCegarError(f"unsupported output artifact: {path}")
        data = path.read_bytes()
        rows.append(
            {
                "path": path.relative_to(out_dir).as_posix(),
                "bytes": len(data),
                "sha256": _sha256(data),
            }
        )
    return rows


def _validate_terminal_manifest(
    out_dir: Path,
    manifest: Mapping[str, object],
    *,
    source_snapshot: Mapping[str, object],
    max_cuts: int,
    timeout_seconds: int,
    solver_identity: Mapping[str, object],
    require_source_custody: bool,
) -> None:
    producer = Path(__file__).resolve()
    required = {
        "schema": SCHEMA,
        "runner_class": "C",
        "run_state": "TERMINAL",
        "terminal": True,
        "claim": CLAIM,
        "source_snapshot": dict(source_snapshot),
        "boundary_cells": list(range(CELL_COUNT)),
        "worker_count": 1,
        "max_cuts_per_cell": max_cuts,
        "timeout_seconds": timeout_seconds,
        "solver": dict(solver_identity),
        "producer": str(producer),
        "producer_sha256": _sha256(producer.read_bytes()),
    }
    if require_source_custody:
        required["source_snapshot_preflight_verified"] = True
        required["source_snapshot_postflight_verified"] = True
    for key, value in required.items():
        if manifest.get(key) != value:
            raise StructuralCegarError(f"terminal manifest mismatch: {key}")
    statuses = manifest.get("statuses")
    if not (
        type(statuses) is dict
        and set(statuses) == {str(index) for index in range(CELL_COUNT)}
        and all(status in STATUSES for status in statuses.values())
    ):
        raise StructuralCegarError("terminal manifest statuses are malformed")
    if manifest.get("status") != _aggregate_status(tuple(statuses.values())):
        raise StructuralCegarError("terminal aggregate status mismatch")
    if manifest.get("artifact_inventory") != _artifact_inventory(out_dir):
        raise StructuralCegarError("terminal artifact inventory mismatch")
    for boundary_index in range(CELL_COUNT):
        cell = out_dir / f"cell-{boundary_index}"
        result_paths = sorted(cell.glob("step-*.result.json"))
        if not result_paths:
            raise StructuralCegarError(f"cell {boundary_index} has no result")
        try:
            payload = result_paths[-1].read_bytes()
            result = json.loads(payload)
        except (OSError, json.JSONDecodeError) as exc:
            raise StructuralCegarError(
                f"cell {boundary_index} terminal result is unreadable"
            ) from exc
        if _canonical_json(result) != payload:
            raise StructuralCegarError(
                f"cell {boundary_index} terminal result is not canonical"
            )
        if not (
            type(result) is dict
            and result.get("schema") == SCHEMA
            and result.get("boundary_index") == boundary_index
            and result.get("status") == statuses[str(boundary_index)]
        ):
            raise StructuralCegarError(
                f"cell {boundary_index} terminal result metadata mismatch"
            )
        for path_key, hash_key in (
            ("cnf_path", "cnf_sha256"),
            ("variable_map_path", "variable_map_sha256"),
            ("stdout_path", "stdout_sha256"),
            ("stderr_path", "stderr_sha256"),
        ):
            relative = result.get(path_key)
            expected_hash = result.get(hash_key)
            if type(relative) is not str or Path(relative).name != relative:
                raise StructuralCegarError(
                    f"cell {boundary_index} malformed artifact path: {path_key}"
                )
            artifact = cell / relative
            if (
                not artifact.is_file()
                or _sha256(artifact.read_bytes()) != expected_hash
            ):
                raise StructuralCegarError(
                    f"cell {boundary_index} artifact hash mismatch: {relative}"
                )


def _admit_cut(
    encoding: FreshThirdCarrierCnfEncoding,
    assignment: Mapping[int, bool],
    signature: Mapping[str, object],
    prior: Sequence[tuple[int, ...]],
    prior_records: Sequence[Mapping[str, object]],
    variable_map_bytes: bytes,
) -> tuple[tuple[int, ...], dict[str, object]] | None:
    """Admit only a theorem-backed, in-range, strictly new cut."""

    try:
        refinement = encoding.cap_alternation_refinement_from_signature(signature)
    except FreshThirdCarrierCnfError:
        return None
    if refinement is None:
        return None
    clause = tuple(refinement.clause)
    if not clause or any(lit == 0 or abs(lit) > encoding.num_vars for lit in clause):
        return None
    if any(abs(lit) not in encoding.semantic_vars for lit in clause):
        return None
    if any(assignment[abs(lit)] == (lit > 0) for lit in clause):
        return None
    if clause in prior:
        return None
    parent_record = None
    if prior_records:
        parent_record = prior_records[-1]
        if type(parent_record.get("record_sha256")) is not str:
            raise StructuralCegarError("prior cut certificate has no record hash")
    try:
        record = build_cap_alternation_certificate(
            encoding,
            refinement,
            parent_record=parent_record,
        )
        parsed_record = load_cap_alternation_certificate(
            cap_alternation_certificate_bytes(record)
        )
        replayed = replay_repository_cap_alternation_certificate(
            parsed_record,
            signature,
            variable_map_bytes,
            encoding,
            parent_record=parent_record,
        )
    except CapAlternationCertificateError as exc:
        raise StructuralCegarError(
            f"cap-alternation certificate replay rejected: {exc}"
        ) from exc
    if replayed.clause != clause:
        raise StructuralCegarError(
            "cap-alternation certificate replay changed the clause"
        )
    return clause, record


def _run_cell(
    *,
    boundary_index: int,
    cell_dir: Path,
    cadical: str,
    max_cuts: int,
    timeout_seconds: int,
    solver_runner: Callable[[Sequence[str], int], subprocess.CompletedProcess[bytes]],
) -> dict[str, object]:
    encoding = FreshThirdCarrierCnfEncoding(boundary_index)
    cuts: list[tuple[int, ...]] = []
    cut_records: list[dict[str, object]] = []
    cell_dir.mkdir(parents=True, exist_ok=True)
    for iteration in range(max_cuts + 1):
        cnf = encoding.cnf_bytes(cuts)
        var_map = encoding.variable_map()
        cnf_path = cell_dir / f"step-{iteration:03d}.cnf"
        var_map_path = cell_dir / f"step-{iteration:03d}.var-map.json"
        stdout_path = cell_dir / f"step-{iteration:03d}.stdout"
        stderr_path = cell_dir / f"step-{iteration:03d}.stderr"
        result_path = cell_dir / f"step-{iteration:03d}.result.json"
        cnf_sha = _write_bytes(cnf_path, cnf)
        var_map_sha = _write_json(var_map_path, var_map)
        command = (cadical, "-q", "-t", str(timeout_seconds), str(cnf_path))
        started = time.monotonic()
        completed = solver_runner(command, timeout_seconds)
        elapsed_ms = int((time.monotonic() - started) * 1000)
        stdout = completed.stdout or b""
        stderr = completed.stderr or b""
        stdout_sha = _write_bytes(stdout_path, stdout)
        stderr_sha = _write_bytes(stderr_path, stderr)
        solver_status = _solver_status(completed.returncode)
        base: dict[str, object] = {
            "schema": SCHEMA,
            "boundary_index": boundary_index,
            "iteration": iteration,
            "status": "UNKNOWN",
            "claim": CLAIM,
            "encoding_manifest": encoding.encoding_manifest(),
            "variable_map_path": var_map_path.name,
            "variable_map_sha256": var_map_sha,
            "cnf_path": cnf_path.name,
            "cnf_sha256": cnf_sha,
            "cuts": cut_records.copy(),
            "command": list(command),
            "solver_returncode": completed.returncode,
            "solver_status": solver_status,
            "solver_timeout_seconds": timeout_seconds,
            "stdout_path": stdout_path.name,
            "stdout_sha256": stdout_sha,
            "stderr_path": stderr_path.name,
            "stderr_sha256": stderr_sha,
            "log_summary": {
                "elapsed_ms": elapsed_ms,
                "stdout_bytes": len(stdout),
                "stderr_bytes": len(stderr),
                "one_check_or_solve": True,
            },
        }
        if solver_status == "UNSAT":
            base["status"] = "COVERAGE_UNSAT_DISCOVERY"
            _write_json(result_path, base)
            return base
        if solver_status != "SAT":
            base["status"] = "UNKNOWN"
            base["reason"] = "CaDiCaL did not return exact SAT(10) or UNSAT(20)"
            _write_json(result_path, base)
            return base
        try:
            assignment = _parse_cadical_model(stdout, encoding.num_vars)
            encoding.validate(assignment)
            for cut_index, cut in enumerate(cuts):
                if not any(assignment[abs(lit)] == (lit > 0) for lit in cut):
                    raise FreshThirdCarrierCnfError(
                        f"model falsifies learned cut {cut_index}: {cut!r}"
                    )
            signature = encoding.model_signature(assignment)
            base["model_signature_sha256"] = _sha256(_canonical_json(signature))
            base["model_signature"] = signature
            replay = encoding.semantic_replay(
                assignment, timeout_ms=timeout_seconds * 1000
            )
        except (FreshThirdCarrierCnfError, ValueError, StructuralCegarError) as exc:
            base["status"] = "STUCK_NO_ADMISSIBLE_CUT"
            base["reason"] = f"model decode/validation/replay setup rejected: {exc}"
            _write_json(result_path, base)
            return base
        if replay.accepted:
            base["status"] = "SAT_ABSTRACTION"
            base["semantic_replay"] = {"accepted": True, "detail": replay.detail}
            _write_json(result_path, base)
            return base
        try:
            admitted = _admit_cut(
                encoding,
                assignment,
                signature,
                cuts,
                cut_records,
                _canonical_json(var_map),
            )
        except StructuralCegarError as exc:
            base["status"] = "STUCK_NO_ADMISSIBLE_CUT"
            base["semantic_replay"] = {"accepted": False, "detail": replay.detail}
            base["reason"] = str(exc)
            _write_json(result_path, base)
            return base
        if admitted is None:
            base["status"] = "STUCK_NO_ADMISSIBLE_CUT"
            base["semantic_replay"] = {"accepted": False, "detail": replay.detail}
            _write_json(result_path, base)
            return base
        if len(cuts) >= max_cuts:
            base["status"] = "BUDGET"
            base["semantic_replay"] = {"accepted": False, "detail": replay.detail}
            base["reason"] = (
                "another admissible cut is required after the full cut budget"
            )
            _write_json(result_path, base)
            return base
        clause, record = admitted
        cuts.append(clause)
        cut_records.append(record)
        base["cuts"] = list(cut_records)
        base["status"] = "UNKNOWN"
        base["semantic_replay"] = {"accepted": False, "detail": replay.detail}
        base["admitted_cut"] = record
        _write_json(result_path, base)
    raise AssertionError("unreachable bounded CEGAR loop")


def run_wave(
    out_dir: Path,
    *,
    source_snapshot: Mapping[str, object],
    cadical: str = "cadical",
    max_cuts: int = MAX_CUTS_PER_CELL,
    timeout_seconds: int = SOLVER_TIMEOUT_SECONDS,
    solver_runner: Callable[[Sequence[str], int], subprocess.CompletedProcess[bytes]]
    | None = None,
    repo_root: Path | None = None,
) -> dict[str, object]:
    """Run all four cells sequentially under one bounded Class-C lease."""

    if type(source_snapshot) is not dict:
        raise StructuralCegarError("source_snapshot must be a JSON object")
    if max_cuts < 1 or max_cuts > MAX_CUTS_PER_CELL:
        raise StructuralCegarError("max_cuts must be in 1..12")
    if timeout_seconds != SOLVER_TIMEOUT_SECONDS:
        raise StructuralCegarError("timeout_seconds is fixed at 30")
    if solver_runner is None and repo_root is None:
        raise StructuralCegarError("real solver runs require repo_root source custody")
    solver_identity = (
        _cadical_identity(cadical)
        if solver_runner is None
        else {
            "binary": cadical,
            "injected_test_runner": True,
            "return_codes": {"sat": 10, "unsat": 20},
        }
    )
    solver_binary = str(solver_identity.get("resolved_path", cadical))
    if repo_root is not None:
        try:
            verify_snapshot(repo_root, source_snapshot)
        except Exception as exc:
            raise StructuralCegarError(
                f"preflight source snapshot verification failed: {exc}"
            ) from exc
    if (
        out_dir.exists()
        and any(out_dir.iterdir())
        and not (out_dir / "manifest.json").exists()
    ):
        raise StructuralCegarError(
            "refusing a nonempty output directory without a manifest"
        )
    out_dir.mkdir(parents=True, exist_ok=True)
    existing_manifest_path = out_dir / "manifest.json"
    if existing_manifest_path.exists():
        try:
            existing = json.loads(existing_manifest_path.read_text())
        except (OSError, json.JSONDecodeError) as exc:
            raise StructuralCegarError("existing manifest is unreadable") from exc
        if type(existing) is dict and existing.get("run_state") == "TERMINAL":
            _validate_terminal_manifest(
                out_dir,
                existing,
                source_snapshot=source_snapshot,
                max_cuts=max_cuts,
                timeout_seconds=timeout_seconds,
                solver_identity=solver_identity,
                require_source_custody=repo_root is not None,
            )
            return existing
        if type(existing) is dict and existing.get("run_state") == "RUNNING":
            raise StructuralCegarError("refusing to revive a RUNNING or stale wave")
        raise StructuralCegarError("existing manifest has an unknown run state")
    producer = Path(__file__).resolve()
    manifest: dict[str, object] = {
        "schema": SCHEMA,
        "runner_class": "C",
        "run_state": "RUNNING",
        "claim": CLAIM,
        "source_snapshot": dict(source_snapshot),
        "boundary_cells": list(range(CELL_COUNT)),
        "worker_count": 1,
        "max_cuts_per_cell": max_cuts,
        "timeout_seconds": timeout_seconds,
        "solver": solver_identity,
        "producer": str(producer),
        "producer_sha256": _sha256(producer.read_bytes()),
        "statuses": {},
    }
    if repo_root is not None:
        manifest["source_snapshot_preflight_verified"] = True
        try:
            manifest["source_archive"] = archive_nonclean_snapshot_rows(
                repo_root, source_snapshot, out_dir / "source-nonclean"
            )
        except Exception as exc:
            raise StructuralCegarError(f"source archive failed: {exc}") from exc
    _write_json(existing_manifest_path, manifest)
    runner = _run_solver if solver_runner is None else solver_runner
    results: dict[str, object] = {}
    for boundary_index in range(CELL_COUNT):
        result = _run_cell(
            boundary_index=boundary_index,
            cell_dir=out_dir / f"cell-{boundary_index}",
            cadical=solver_binary,
            max_cuts=max_cuts,
            timeout_seconds=timeout_seconds,
            solver_runner=runner,
        )
        results[str(boundary_index)] = result
        manifest["statuses"] = {
            key: value.get("status") if isinstance(value, dict) else None
            for key, value in results.items()
        }
        _write_json(existing_manifest_path, manifest)
    if repo_root is not None:
        try:
            postflight = verify_snapshot(repo_root, source_snapshot)
        except Exception as exc:
            raise StructuralCegarError(
                f"postflight source snapshot verification failed: {exc}"
            ) from exc
        manifest["source_snapshot_postflight_verified"] = True
        manifest["source_snapshot_postflight"] = {
            "repo_head": postflight["repo_head"],
            "aggregate_sha256": postflight["aggregate_sha256"],
            "content_aggregate_sha256": postflight["content_aggregate_sha256"],
        }
    manifest["run_state"] = "TERMINAL"
    manifest["terminal"] = True
    manifest["statuses"] = {
        key: value.get("status") if isinstance(value, dict) else None
        for key, value in results.items()
    }
    manifest["status"] = _aggregate_status(tuple(manifest["statuses"].values()))
    manifest["artifact_inventory"] = _artifact_inventory(out_dir)
    _write_json(existing_manifest_path, manifest)
    return manifest


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--source-snapshot", type=Path, required=True)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    args = parser.parse_args(argv)
    snapshot = json.loads(args.source_snapshot.read_text())
    run_wave(
        args.out_dir,
        source_snapshot=snapshot,
        cadical=args.cadical,
        repo_root=args.repo_root,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
