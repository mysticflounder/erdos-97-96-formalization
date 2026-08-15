"""Authenticated one-shot runner for the FirstNonHit all-large-caps v4 CNF.

Dry-run is the default.  Production requires both ``--launch`` and an exact
run root already registered in the lane checkpoint.  The runner performs one
``n = 17`` discovery wave only: hand-known SAT/UNSAT smoke checks, then one
CaDiCaL call.  It has no CEGAR successor and no theorem-bank search.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import re
import shutil
import stat
import subprocess
import sys
import time
import types
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath

RUN_SCHEMA = "p97-freshthird-firstnonhit-all-large-caps-v4/run/v1"
RECEIPT_SCHEMA = f"{RUN_SCHEMA}/terminal-receipt/v1"
PROCESS_SCHEMA = f"{RUN_SCHEMA}/process-receipt/v1"
LANE_ID = "firstnonhit-all-large-caps-v4"
CHECKPOINT_RELATIVE = ".codex/worktree-checkpoints/firstnonhit-all-large-caps-v4.json"
RUN_PREFIX = f"scratch/runs/{LANE_ID}/"
PREDECESSOR_MODEL_RELATIVE = (
    "scratch/runs/firstnonhit-cap-endpoint-v3/"
    "n17-one-shot-audit-approved/production-cadical.stdout"
)
PRODUCTION_N = 17
SMOKE_TIMEOUT_SECONDS = 5
TIMEOUT_CUSHION_SECONDS = 30
RUN_ID = re.compile(r"[a-z0-9][a-z0-9._-]{2,79}")
INDEPENDENT_AUDIT = {
    "status": "APPROVED",
    "communicated_utc_date": "2026-08-15",
    "scope": "exact emitted CNF and source map",
    "counts_reproduced": {"variables": 93075, "clauses": 463822},
    "cnf_sha256_reproduced": (
        "387c98b39dc7c6cb81f350b7b506c730ec2a9574d0fde0a46b8ed18251008b2e"
    ),
    "no_unsound_clause_found": True,
}

_V2_RELATIVE = "census/p97_search/freshthird_firstnonhit_complete_finite_v2.py"
_V3_RELATIVE = "census/p97_search/freshthird_firstnonhit_cap_endpoint_v3.py"
_V4_RELATIVE = "census/p97_search/freshthird_firstnonhit_all_large_caps_v4.py"
AUTHENTICATED_ENCODER_SPECS = {
    "encoder_v2": (
        _V2_RELATIVE,
        "31273114c0b7d16505da257ce33e98eed25185b4aad1135b575e88421d47fa61",
    ),
    "encoder_v3": (
        _V3_RELATIVE,
        "e7ef7ff2e5827f8d8dd1312a1a357dd66abf3dc5efb967cd5bd168cc34f4c034",
    ),
    "encoder_v4": (
        _V4_RELATIVE,
        "8b528a3fd0269c235775ebc9595866c5ca9c7c99d992237eb17817047eb19e39",
    ),
}
AUTHENTICATED_MODULE_NAMES = {
    "encoder_v2": "census.p97_search.freshthird_firstnonhit_complete_finite_v2",
    "encoder_v3": "census.p97_search.freshthird_firstnonhit_cap_endpoint_v3",
    "encoder_v4": "census.p97_search.freshthird_firstnonhit_all_large_caps_v4",
}

emitter = None
predecessor_emitter = None


class RunnerError(RuntimeError):
    """Fail-closed custody, process, or readback failure."""


@dataclass(frozen=True)
class ProcessResult:
    name: str
    command: tuple[str, ...]
    status: str
    returncode: int | None
    elapsed_ms: int
    stdout: bytes
    stderr: bytes


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
        )
        + "\n"
    ).encode()


def _self_hashed(value: Mapping[str, object], field: str) -> dict[str, object]:
    result = dict(value)
    if field in result:
        raise RunnerError(f"self-hash field already present: {field}")
    result[field] = hashlib.sha256(_canonical_json(result)).hexdigest()
    return result


def _validate_self_hash(value: Mapping[str, object], field: str) -> None:
    unsigned = dict(value)
    digest = unsigned.pop(field, None)
    if (
        type(digest) is not str
        or digest != hashlib.sha256(_canonical_json(unsigned)).hexdigest()
    ):
        raise RunnerError(f"invalid self hash: {field}")


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _reject_symlink_ancestors(path: Path) -> None:
    candidate = path
    while True:
        if candidate.is_symlink():
            raise RunnerError(f"path has a symlinked ancestor: {candidate}")
        if candidate == candidate.parent:
            return
        candidate = candidate.parent


def _read_regular(path: Path, description: str) -> bytes:
    _reject_symlink_ancestors(path)
    flags = os.O_RDONLY
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise RunnerError(f"cannot open {description}: {path}") from exc
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise RunnerError(f"{description} must be a single-link regular file")
        chunks: list[bytes] = []
        while chunk := os.read(descriptor, 1024 * 1024):
            chunks.append(chunk)
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _authenticated_encoder_rows() -> dict[str, dict[str, object]]:
    """Read and authenticate the complete v2→v3→v4 dependency chain."""
    root = _repo_root()
    rows: dict[str, dict[str, object]] = {}
    for label, (relative, expected) in AUTHENTICATED_ENCODER_SPECS.items():
        path = root / relative
        data = _read_regular(path, f"authenticated {label} source")
        actual = _sha256(data)
        if actual != expected:
            raise RunnerError(f"{label} source hash mismatch: {actual} != {expected}")
        rows[label] = {"path": relative, "sha256": actual, "size": len(data)}
    return rows


def _load_authenticated_encoders() -> tuple[
    object, object, object, dict[str, dict[str, object]]
]:
    """Load only already-authenticated files under synthetic package parents."""
    rows = _authenticated_encoder_rows()
    names = (
        "census",
        "census.p97_search",
        *AUTHENTICATED_MODULE_NAMES.values(),
    )
    saved = {name: sys.modules.get(name) for name in names}
    package_names = names[:2]
    try:
        census = types.ModuleType("census")
        census.__path__ = []
        census.__package__ = "census"
        search = types.ModuleType("census.p97_search")
        search.__path__ = []
        search.__package__ = "census.p97_search"
        sys.modules["census"] = census
        sys.modules["census.p97_search"] = search
        modules: dict[str, object] = {}
        for label in ("encoder_v2", "encoder_v3", "encoder_v4"):
            module_name = AUTHENTICATED_MODULE_NAMES[label]
            path = _repo_root() / rows[label]["path"]
            spec = importlib.util.spec_from_file_location(module_name, path)
            if spec is None or spec.loader is None:
                raise RunnerError(f"cannot construct authenticated loader: {label}")
            module = importlib.util.module_from_spec(spec)
            sys.modules[module_name] = module
            spec.loader.exec_module(module)
            modules[label] = module
        return modules["encoder_v4"], modules["encoder_v3"], modules["encoder_v2"], rows
    except Exception:
        for name, prior in saved.items():
            if prior is None:
                sys.modules.pop(name, None)
            else:
                sys.modules[name] = prior
        raise
    finally:
        # Synthetic parents are never retained; target modules retain their
        # authenticated objects and do not consult package search paths.
        for name in package_names:
            prior = saved[name]
            if prior is None:
                sys.modules.pop(name, None)
            else:
                sys.modules[name] = prior


def _ensure_authenticated_encoders() -> dict[str, dict[str, object]]:
    global emitter, predecessor_emitter
    if emitter is None or predecessor_emitter is None:
        loaded_v4, loaded_v3, _loaded_v2, rows = _load_authenticated_encoders()
        emitter = loaded_v4
        predecessor_emitter = loaded_v3
        return rows
    return _authenticated_encoder_rows()


def _strict_json(
    data: bytes, description: str, *, require_canonical: bool = True
) -> dict[str, object]:
    class DuplicateKey(ValueError):
        pass

    def pairs(rows: list[tuple[str, object]]) -> dict[str, object]:
        result: dict[str, object] = {}
        for key, value in rows:
            if key in result:
                raise DuplicateKey(key)
            result[key] = value
        return result

    try:
        value = json.loads(
            data,
            object_pairs_hook=pairs,
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, DuplicateKey, ValueError) as exc:
        raise RunnerError(f"malformed {description}: {exc}") from exc
    if type(value) is not dict:
        raise RunnerError(f"{description} is not a JSON object")
    if require_canonical and _canonical_json(value) != data:
        raise RunnerError(f"{description} is not canonical JSON")
    return value


def _fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY | getattr(os, "O_DIRECTORY", 0))
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _write_new(path: Path, data: bytes) -> None:
    if path.exists() or path.is_symlink():
        raise RunnerError(f"refusing to overwrite artifact: {path}")
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    descriptor = os.open(path, flags, 0o644)
    try:
        remaining = memoryview(data)
        while remaining:
            written = os.write(descriptor, remaining)
            if written <= 0:
                raise RunnerError(f"short write: {path}")
            remaining = remaining[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)
    _fsync_directory(path.parent)


def _read_checkpoint() -> dict[str, object]:
    path = _repo_root() / CHECKPOINT_RELATIVE
    value = _strict_json(
        _read_regular(path, "lane checkpoint"),
        "lane checkpoint",
        require_canonical=False,
    )
    if value.get("schema") != "worktree-lane-checkpoint/v1":
        raise RunnerError("checkpoint schema mismatch")
    if value.get("lane_id") != LANE_ID:
        raise RunnerError("checkpoint lane mismatch")
    unsigned = dict(value)
    digest = unsigned.pop("manifest_sha256", None)
    canonical = json.dumps(
        unsigned, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode()
    if digest != hashlib.sha256(canonical).hexdigest():
        raise RunnerError("checkpoint self-hash mismatch")
    return value


def _normalize_run_root(run_root: Path) -> tuple[Path, str]:
    root = _repo_root()
    absolute = run_root if run_root.is_absolute() else root / run_root
    absolute = Path(os.path.abspath(absolute))
    try:
        relative = absolute.relative_to(root).as_posix()
    except ValueError as exc:
        raise RunnerError("run root must be inside this repository") from exc
    parts = PurePosixPath(relative).parts
    if (
        len(parts) != 4
        or "/".join(parts[:3]) != RUN_PREFIX.rstrip("/")
        or RUN_ID.fullmatch(parts[3]) is None
    ):
        raise RunnerError(f"run root must be exactly {RUN_PREFIX}<stable-run-id>")
    _reject_symlink_ancestors(absolute)
    return absolute, relative


def _registration_status(relative: str) -> bool:
    roots = _read_checkpoint().get("generated_roots")
    if type(roots) is not list or any(type(row) is not str for row in roots):
        raise RunnerError("checkpoint generated_roots is malformed")
    return relative in roots


def _binary_identity(name: str, *, required: bool) -> dict[str, object] | None:
    found = shutil.which(name)
    if found is None:
        if required:
            raise RunnerError(f"required binary is unavailable: {name}")
        return None
    path = Path(found).resolve()
    data = _read_regular(path, f"{name} binary")
    return {
        "name": name,
        "path": str(path),
        "sha256": _sha256(data),
        "size": len(data),
        "version_identity": f"sha256:{_sha256(data)}",
    }


def _classify_cadical(returncode: int | None) -> str:
    if returncode == 10:
        return "SAT"
    if returncode == 20:
        return "UNSAT"
    if returncode == 0 or returncode is None:
        return "UNKNOWN"
    return "ERROR"


def _run_process(
    name: str, command: Sequence[str], timeout_seconds: int
) -> ProcessResult:
    """Run once with an outer hard timeout; CaDiCaL 10/20 are not errors."""

    started = time.monotonic()
    try:
        completed = subprocess.run(
            list(command),
            capture_output=True,
            check=False,
            timeout=timeout_seconds,
        )
        return ProcessResult(
            name,
            tuple(command),
            "COMPLETED",
            completed.returncode,
            round((time.monotonic() - started) * 1000),
            completed.stdout,
            completed.stderr,
        )
    except subprocess.TimeoutExpired as exc:
        stdout = exc.stdout if isinstance(exc.stdout, bytes) else b""
        stderr = exc.stderr if isinstance(exc.stderr, bytes) else b""
        return ProcessResult(
            name,
            tuple(command),
            "TIMEOUT",
            None,
            round((time.monotonic() - started) * 1000),
            stdout,
            stderr,
        )


def _record_process(root: Path, result: ProcessResult) -> dict[str, object]:
    stdout_name = f"{result.name}.stdout"
    stderr_name = f"{result.name}.stderr"
    receipt_name = f"{result.name}.process.json"
    written: list[Path] = []
    try:
        for name, data in ((stdout_name, result.stdout), (stderr_name, result.stderr)):
            path = root / name
            written.append(path)
            _write_new(path, data)
        receipt = _self_hashed(
            {
                "schema": PROCESS_SCHEMA,
                "name": result.name,
                "command": list(result.command),
                "status": result.status,
                "returncode": result.returncode,
                "elapsed_ms": result.elapsed_ms,
                "stdout": {
                    "path": stdout_name,
                    "sha256": _sha256(result.stdout),
                    "size": len(result.stdout),
                },
                "stderr": {
                    "path": stderr_name,
                    "sha256": _sha256(result.stderr),
                    "size": len(result.stderr),
                },
            },
            "process_receipt_sha256",
        )
        payload = _canonical_json(receipt)
        receipt_path = root / receipt_name
        written.append(receipt_path)
        _write_new(receipt_path, payload)
    except Exception:
        for path in written:
            if path.is_file() and not path.is_symlink():
                quarantine = root / f"partial-unreceipted-{path.name}"
                if quarantine.exists() or quarantine.is_symlink():
                    raise RunnerError("unreceipted process quarantine path exists")
                os.replace(path, quarantine)
        _fsync_directory(root)
        raise
    return {
        "name": result.name,
        "receipt": receipt_name,
        "receipt_sha256": _sha256(payload),
        "status": result.status,
        "returncode": result.returncode,
    }


def _recorded_process_summaries(root: Path) -> list[dict[str, object]]:
    """Reconstruct every durable process summary after a partial helper failure."""

    summaries: list[dict[str, object]] = []
    for path in sorted(root.glob("*.process.json"), key=lambda item: item.name):
        data = _read_regular(path, f"recorded process receipt {path.name}")
        receipt = _strict_json(data, f"recorded process receipt {path.name}")
        _validate_self_hash(receipt, "process_receipt_sha256")
        name = receipt.get("name")
        if (
            receipt.get("schema") != PROCESS_SCHEMA
            or type(name) is not str
            or path.name != f"{name}.process.json"
        ):
            raise RunnerError("recorded process receipt identity drifted")
        for stream in ("stdout", "stderr"):
            row = receipt.get(stream)
            expected_path = f"{name}.{stream}"
            if type(row) is not dict or row.get("path") != expected_path:
                raise RunnerError("recorded process stream path drifted")
            stream_data = _read_regular(
                root / expected_path, f"recorded process {name} {stream}"
            )
            if row.get("sha256") != _sha256(stream_data) or row.get("size") != len(
                stream_data
            ):
                raise RunnerError("recorded process stream digest mismatch")
        summaries.append(
            {
                "name": name,
                "receipt": path.name,
                "receipt_sha256": _sha256(data),
                "status": receipt.get("status"),
                "returncode": receipt.get("returncode"),
            }
        )
    expected_streams = {
        f"{summary['name']}.{stream}"
        for summary in summaries
        for stream in ("stdout", "stderr")
    }
    ordinary_streams = {
        path.name
        for pattern in ("*.stdout", "*.stderr")
        for path in root.glob(pattern)
        if not path.name.startswith("partial-")
    }
    if ordinary_streams != expected_streams:
        raise RunnerError("recorded process streams are not receipt-paired")
    return summaries


def parse_complete_model(stdout: bytes, variable_count: int) -> dict[int, bool]:
    """Parse a complete DIMACS model from ``v`` lines, rejecting ambiguity."""

    assignment: dict[int, bool] = {}
    for raw in stdout.decode("utf-8", errors="strict").splitlines():
        fields = raw.split()
        if not fields or fields[0] != "v":
            continue
        for token in fields[1:]:
            try:
                literal = int(token)
            except ValueError as exc:
                raise RunnerError(f"malformed model token: {token}") from exc
            if literal == 0:
                continue
            identifier = abs(literal)
            if not 1 <= identifier <= variable_count:
                raise RunnerError("model literal is out of range")
            value = literal > 0
            if identifier in assignment and assignment[identifier] != value:
                raise RunnerError("model contains conflicting literals")
            assignment[identifier] = value
    missing = set(range(1, variable_count + 1)) - set(assignment)
    if missing:
        first = min(missing)
        raise RunnerError(f"model is incomplete; first missing variable is {first}")
    return assignment


def _literal_true(literal: int, assignment: Mapping[int, bool]) -> bool:
    value = assignment[abs(literal)]
    return value if literal > 0 else not value


def validate_model(bundle: emitter.Bundle, stdout: bytes) -> dict[str, object]:
    """Validate every clause, then independently summarize semantic fields."""

    manifest = emitter.validate_bundle(bundle)
    mapping = json.loads(bundle.variable_map)
    variable_count = manifest["variables"]
    if type(variable_count) is not int:
        raise RunnerError("encoding variable count is malformed")
    assignment = parse_complete_model(stdout, variable_count)
    clauses = mapping.get("clauses")
    variables = mapping.get("variables")
    if type(clauses) is not list or type(variables) is not list:
        raise RunnerError("encoding map is malformed")
    for clause in clauses:
        if type(clause) is not dict or type(clause.get("literals")) is not list:
            raise RunnerError("clause map row is malformed")
        if not any(
            _literal_true(literal, assignment) for literal in clause["literals"]
        ):
            raise RunnerError(f"SAT model falsifies clause {clause.get('id')}")
    role_to_id = {row["role"]: row["id"] for row in variables}

    def enabled(role: str) -> bool:
        identifier = role_to_id.get(role)
        if type(identifier) is not int:
            raise RunnerError(f"semantic variable is missing: {role}")
        return assignment[identifier]

    n = manifest["n"]
    if type(n) is not int:
        raise RunnerError("encoding cardinality is malformed")
    blocker_centers: dict[str, int] = {}
    for source in range(n):
        selected = [
            center for center in range(n) if enabled(f"blocker/{source}/{center}")
        ]
        if len(selected) != 1 or selected[0] == source:
            raise RunnerError("blocker readback violates total/no-fixed semantics")
        blocker_centers[str(source)] = selected[0]
    selected_roles: dict[str, int] = {}
    for role in emitter.ROLES:
        selected = [index for index in range(n) if enabled(f"role/{role}/{index}")]
        if len(selected) != 1:
            raise RunnerError("named-role readback is not exact")
        selected_roles[role] = selected[0]
    row_cards = [
        sum(enabled(f"row/{source}/{x}") for x in range(n)) for source in range(n)
    ]
    if set(row_cards) != {4}:
        raise RunnerError("selected-row readback is not exact-four")
    cap_cards = [sum(enabled(f"cap/{x}/{cap}") for x in range(n)) for cap in range(3)]
    if sum(cap_cards) != n + 3:
        raise RunnerError("cap-sum readback failed")
    escape_support = [x for x in range(n) if enabled(f"escape/support/{x}")]
    escape_witness = [x for x in range(n) if enabled(f"escape/witness/{x}")]
    if len(escape_support) != 4 or len(escape_witness) != 1:
        raise RunnerError("escape readback has malformed cardinality")
    q_overlap = sum(
        enabled(f"escape/support/{x}") and enabled(f"named_row/{emitter.Q1}/{x}")
        for x in range(n)
    )
    if q_overlap > 2:
        raise RunnerError("escape readback violates Q-overlap bound")
    return {
        "all_emitted_clauses_satisfied": True,
        "variable_count": variable_count,
        "clause_count": len(clauses),
        "blocker_centers": blocker_centers,
        "selected_roles": selected_roles,
        "row_cards": row_cards,
        "cap_cards": cap_cards,
        "cap_sum": sum(cap_cards),
        "first_interaction_arms": {
            arm: enabled(f"first_interaction/{arm}") for arm in ("same", "omission")
        },
        "second_interaction_arms": {
            arm: enabled(f"second_interaction/{arm}")
            for arm in ("same", "omission", "different_cap", "same_cap")
        },
        "hingress_arms": {
            "retained": enabled("hingress/retained"),
            "common_payload_free": enabled("hingress/common_payload_free"),
        },
        "escape_support": escape_support,
        "escape_witness": escape_witness[0],
        "escape_q_overlap": q_overlap,
        "source_total": False,
        "semantic_scope": "sound finite relaxation at exact n; no cardinality lift",
    }


def _check_drat(
    root: Path,
    drat_trim: Mapping[str, object],
    cnf_path: Path,
    temporary_proof: Path,
    final_proof: Path,
    name: str,
    timeout_seconds: int,
) -> tuple[dict[str, object], dict[str, object]]:
    if not temporary_proof.is_file() or temporary_proof.stat().st_size == 0:
        raise RunnerError("UNSAT result did not produce a nonempty DRAT proof")
    command = [str(drat_trim["path"]), str(cnf_path), str(temporary_proof)]
    result = _run_process(name, command, timeout_seconds)
    process = _record_process(root, result)
    if result.status != "COMPLETED" or result.returncode != 0:
        raise RunnerError("drat-trim did not complete successfully")
    if b"s VERIFIED" not in result.stdout:
        raise RunnerError("drat-trim did not report s VERIFIED")
    if final_proof.exists() or final_proof.is_symlink():
        raise RunnerError("final DRAT path already exists")
    os.replace(temporary_proof, final_proof)
    _fsync_directory(root)
    proof = _read_regular(final_proof, "checked DRAT proof")
    return process, {
        "path": final_proof.name,
        "sha256": _sha256(proof),
        "size": len(proof),
        "drat_trim_verified": True,
    }


def _artifact_inventory(root: Path) -> list[dict[str, object]]:
    rows = []
    for path in sorted(root.iterdir(), key=lambda item: item.name):
        if path.name == "terminal-receipt.json":
            continue
        data = _read_regular(path, f"run artifact {path.name}")
        rows.append({"path": path.name, "sha256": _sha256(data), "size": len(data)})
    return rows


def _terminal_receipt(
    root: Path,
    run_manifest_sha256: str,
    status: str,
    result: Mapping[str, object],
    processes: Sequence[Mapping[str, object]],
) -> dict[str, object]:
    run_manifest = _strict_json(
        _read_regular(root / "run-manifest.json", "run manifest"),
        "run manifest",
    )
    cross_check_requested = run_manifest.get("cross_check_requested")
    cross_check_effective = run_manifest.get("cross_check_effective")
    if (
        type(cross_check_requested) is not bool
        or type(cross_check_effective) is not bool
    ):
        raise RunnerError("run manifest cross-check metadata is malformed")
    receipt = _self_hashed(
        {
            "schema": RECEIPT_SCHEMA,
            "status": status,
            "source_total": False,
            "all_emitted_hard_clauses_source_mapped": True,
            "independent_audit": INDEPENDENT_AUDIT,
            "run_manifest_sha256": run_manifest_sha256,
            "cross_check_requested": cross_check_requested,
            "cross_check_effective": cross_check_effective,
            "result": dict(result),
            "processes": [dict(row) for row in processes],
            "artifact_inventory": _artifact_inventory(root),
            "no_cegar_successor": True,
            "theorem_bank_search_run": False,
        },
        "terminal_receipt_sha256",
    )
    _write_new(root / "terminal-receipt.json", _canonical_json(receipt))
    return receipt


def _validate_terminal_evidence(
    root: Path,
    receipt: Mapping[str, object],
    bundle: emitter.Bundle,
    cross_check_effective: bool,
) -> None:
    if (
        receipt.get("independent_audit") != INDEPENDENT_AUDIT
        or receipt.get("all_emitted_hard_clauses_source_mapped") is not True
        or receipt.get("no_cegar_successor") is not True
        or receipt.get("theorem_bank_search_run") is not False
    ):
        raise RunnerError("terminal receipt boundary mismatch")
    status = receipt.get("status")
    result = receipt.get("result")
    summaries = receipt.get("processes")
    if (
        status not in {"SAT", "UNSAT", "FAILED", "UNKNOWN", "ERROR"}
        or type(result) is not dict
    ):
        raise RunnerError("terminal receipt status/result is malformed")
    if type(summaries) is not list or any(type(row) is not dict for row in summaries):
        raise RunnerError("terminal receipt process list is malformed")
    names: list[str] = []
    process_receipts: dict[str, dict[str, object]] = {}
    for summary in summaries:
        if set(summary) != {
            "name",
            "receipt",
            "receipt_sha256",
            "status",
            "returncode",
        }:
            raise RunnerError("terminal process summary keys drifted")
        name = summary["name"]
        if type(name) is not str or name in names:
            raise RunnerError("terminal process names are malformed")
        names.append(name)
        receipt_name = f"{name}.process.json"
        if summary["receipt"] != receipt_name:
            raise RunnerError("terminal process receipt path drifted")
        process_data = _read_regular(root / receipt_name, f"terminal {name} process")
        if summary["receipt_sha256"] != _sha256(process_data):
            raise RunnerError("terminal process receipt digest mismatch")
        process = _strict_json(process_data, f"terminal {name} process")
        _validate_self_hash(process, "process_receipt_sha256")
        if (
            process.get("schema") != PROCESS_SCHEMA
            or process.get("name") != name
            or process.get("status") != summary["status"]
            or process.get("returncode") != summary["returncode"]
        ):
            raise RunnerError("terminal process receipt summary mismatch")
        for stream in ("stdout", "stderr"):
            row = process.get(stream)
            expected_path = f"{name}.{stream}"
            if type(row) is not dict or row.get("path") != expected_path:
                raise RunnerError("terminal process stream path drifted")
            data = _read_regular(root / expected_path, f"terminal {name} {stream}")
            if row.get("sha256") != _sha256(data) or row.get("size") != len(data):
                raise RunnerError("terminal process stream digest mismatch")
        process_receipts[name] = process
    allowed = {
        "cadical-version",
        "smoke-sat",
        "smoke-unsat",
        "smoke-unsat-drat-trim",
        "production-cadical",
        "production-drat-trim",
        "kissat-version",
        "production-kissat-cross-check",
    }
    if any(name not in allowed for name in names):
        raise RunnerError("terminal process inventory contains an unknown process")
    disk_receipts = {path.name for path in root.glob("*.process.json")}
    if disk_receipts != {f"{name}.process.json" for name in names}:
        raise RunnerError("terminal process inventory does not replay")
    disk_streams = {
        path.name
        for pattern in ("*.stdout", "*.stderr")
        for path in root.glob(pattern)
        if not path.name.startswith("partial-")
    }
    expected_streams = {
        f"{name}.{stream}" for name in names for stream in ("stdout", "stderr")
    }
    if disk_streams != expected_streams:
        raise RunnerError("terminal process streams are not receipt-paired")

    _validate_process_phase_set(names, process_receipts, status, cross_check_effective)

    if status == "FAILED":
        if result.get("verdict") is not None or type(result.get("reason")) is not str:
            raise RunnerError("FAILED terminal result is malformed")
        return
    if status in {"UNKNOWN", "ERROR"}:
        production = process_receipts.get("production-cadical")
        if (
            result.get("verdict") != status
            or type(result.get("reason")) is not str
            or names.count("production-cadical") != 1
            or production is None
            or _classify_cadical(production.get("returncode")) != status
        ):
            raise RunnerError("nonterminal solver receipt evidence is malformed")
        return
    if result.get("verdict") != status:
        raise RunnerError("terminal success process/result evidence is incomplete")
    production = process_receipts["production-cadical"]
    expected_returncode = 10 if status == "SAT" else 20
    if (
        production.get("status") != "COMPLETED"
        or production.get("returncode") != expected_returncode
    ):
        raise RunnerError("terminal production verdict does not replay")
    if status == "SAT":
        model = _read_regular(root / "production-cadical.stdout", "terminal SAT model")
        if result.get("model_readback") != validate_model(bundle, model):
            raise RunnerError("terminal SAT model readback does not replay")
        return
    if "production-drat-trim" not in process_receipts:
        raise RunnerError("terminal UNSAT lacks a drat-trim process")
    trim = process_receipts["production-drat-trim"]
    trim_stdout = _read_regular(
        root / "production-drat-trim.stdout", "terminal drat-trim stdout"
    )
    if (
        trim.get("status") != "COMPLETED"
        or trim.get("returncode") != 0
        or b"s VERIFIED" not in trim_stdout
    ):
        raise RunnerError("terminal drat-trim verification does not replay")
    proof_row = result.get("proof")
    if type(proof_row) is not dict or proof_row.get("path") != "production.drat":
        raise RunnerError("terminal UNSAT proof metadata is malformed")
    proof = _read_regular(root / "production.drat", "terminal checked DRAT proof")
    if (
        proof_row.get("sha256") != _sha256(proof)
        or proof_row.get("size") != len(proof)
        or proof_row.get("drat_trim_verified") is not True
    ):
        raise RunnerError("terminal UNSAT proof custody does not replay")


def _validate_process_phase_set(
    names: Sequence[str],
    process_receipts: Mapping[str, Mapping[str, object]],
    status: str,
    cross_check_effective: bool,
) -> None:
    """Require process receipts to be an exact terminal phase prefix/set."""
    phases = ["cadical-version"]
    if cross_check_effective:
        phases.append("kissat-version")
    phases.extend(
        ("smoke-sat", "smoke-unsat", "smoke-unsat-drat-trim", "production-cadical")
    )
    if status == "UNSAT":
        phases.append("production-drat-trim")
    if status in {"SAT", "UNSAT"} and cross_check_effective:
        phases.append("production-kissat-cross-check")
    if status == "FAILED":
        production = process_receipts.get("production-cadical")
        production_verdict = (
            None
            if production is None
            else _classify_cadical(production.get("returncode"))
        )
        if production_verdict == "UNSAT":
            phases.append("production-drat-trim")
        if production_verdict in {"SAT", "UNSAT"} and cross_check_effective:
            phases.append("production-kissat-cross-check")
    observed = list(names)
    if len(set(observed)) != len(observed) or observed != phases[: len(observed)]:
        raise RunnerError("terminal process phase set is not an exact prefix")
    if status in {"SAT", "UNSAT", "UNKNOWN", "ERROR"} and observed != phases:
        raise RunnerError("terminal process phase set is incomplete")
    if status == "FAILED" and not observed:
        raise RunnerError("FAILED terminal process phase set is empty")
    noncompleted = [
        index
        for index, name in enumerate(observed)
        if process_receipts[name].get("status") != "COMPLETED"
    ]
    if noncompleted and noncompleted != [len(observed) - 1]:
        raise RunnerError("terminal failed process is not the final phase")


def terminal_reentry(root: Path) -> dict[str, object]:
    """Authenticate a terminal root and return without any subprocess call."""

    _ensure_authenticated_encoders()
    _reject_symlink_ancestors(root)
    if root.is_symlink() or not root.is_dir():
        raise RunnerError("terminal root is not a regular directory")
    manifest_data = _read_regular(root / "run-manifest.json", "run manifest")
    manifest = _strict_json(manifest_data, "run manifest")
    _validate_self_hash(manifest, "run_manifest_sha256")
    if (
        manifest.get("schema") != RUN_SCHEMA
        or manifest.get("status") != "RUNNING"
        or manifest.get("source_total") is not False
        or manifest.get("all_emitted_hard_clauses_source_mapped") is not True
        or manifest.get("independent_audit") != INDEPENDENT_AUDIT
        or manifest.get("n") != PRODUCTION_N
        or manifest.get("query_is_separate_assumption") is not True
        or manifest.get("exactly_one_production_wave") is not True
        or manifest.get("no_cegar_successor") is not True
        or manifest.get("theorem_bank_search_planned") is not False
        or type(manifest.get("cross_check_requested")) is not bool
        or type(manifest.get("cross_check_effective")) is not bool
        or type(manifest.get("binaries")) is not dict
        or manifest.get("cross_check_effective")
        != (
            manifest.get("cross_check_requested")
            and manifest.get("binaries").get("kissat") is not None
        )
    ):
        raise RunnerError("terminal run manifest boundary mismatch")
    source_hashes = manifest.get("source_hashes")
    if type(source_hashes) is not dict or set(source_hashes) != {
        "encoder_v2",
        "encoder_v3",
        "encoder_v4",
        "runner",
        "checkpoint",
    }:
        raise RunnerError("terminal source hash inventory is malformed")
    canonical_source_paths = {
        label: relative
        for label, (relative, _expected) in AUTHENTICATED_ENCODER_SPECS.items()
    }
    canonical_source_paths.update(
        {
            "runner": Path(__file__).resolve().relative_to(_repo_root()).as_posix(),
            "checkpoint": CHECKPOINT_RELATIVE,
        }
    )
    for name, row in source_hashes.items():
        if type(row) is not dict or type(row.get("path")) is not str:
            raise RunnerError("terminal source hash row is malformed")
        if row["path"] != canonical_source_paths[name]:
            raise RunnerError(f"terminal {name} source path is not canonical")
        relative = PurePosixPath(row["path"])
        if relative.is_absolute() or ".." in relative.parts:
            raise RunnerError("terminal source path is unsafe")
        data = _read_regular(_repo_root() / relative, f"terminal {name} source")
        if row.get("sha256") != _sha256(data) or row.get("size") != len(data):
            raise RunnerError(f"current {name} source differs from terminal run")
    bundle = emitter.Bundle(
        _read_regular(root / "problem.cnf", "terminal problem CNF"),
        _read_regular(root / "problem.map.json", "terminal problem map"),
        _read_regular(root / "problem.sources.json", "terminal problem sources"),
        _read_regular(root / "problem.manifest.json", "terminal problem manifest"),
    )
    encoding_manifest = emitter.validate_bundle(bundle)
    if manifest.get("encoding") != _encoding_summary(encoding_manifest):
        raise RunnerError("terminal encoding metadata does not replay")
    if manifest.get("predecessor_model_control") != _predecessor_model_control():
        raise RunnerError("terminal predecessor-model control does not replay")
    binaries = manifest.get("binaries")
    if type(binaries) is not dict or set(binaries) != {
        "cadical",
        "drat_trim",
        "kissat",
    }:
        raise RunnerError("terminal binary inventory is malformed")
    binary_names = {
        "cadical": "cadical",
        "drat_trim": "drat-trim",
        "kissat": "kissat",
    }
    for name, row in binaries.items():
        if row is None:
            if name != "kissat":
                raise RunnerError(f"terminal required binary is absent: {name}")
            continue
        if type(row) is not dict or type(row.get("path")) is not str:
            raise RunnerError("terminal binary row is malformed")
        binary_name = binary_names[name]
        found = shutil.which(binary_name)
        if (
            found is None
            or row.get("name") != binary_name
            or row["path"] != str(Path(found).resolve())
        ):
            raise RunnerError(f"terminal {name} binary path is not canonical")
        data = _read_regular(Path(row["path"]), f"terminal {name} binary")
        if row.get("sha256") != _sha256(data) or row.get("size") != len(data):
            raise RunnerError(f"current {name} binary differs from terminal run")
    receipt = _strict_json(
        _read_regular(root / "terminal-receipt.json", "terminal receipt"),
        "terminal receipt",
    )
    _validate_self_hash(receipt, "terminal_receipt_sha256")
    if receipt.get("schema") != RECEIPT_SCHEMA:
        raise RunnerError("terminal receipt schema mismatch")
    if receipt.get("cross_check_requested") != manifest.get(
        "cross_check_requested"
    ) or receipt.get("cross_check_effective") != manifest.get("cross_check_effective"):
        raise RunnerError("terminal cross-check metadata does not replay")
    if receipt.get("run_manifest_sha256") != _sha256(manifest_data):
        raise RunnerError("terminal receipt is not bound to the run manifest")
    expected = receipt.get("artifact_inventory")
    if expected != _artifact_inventory(root):
        raise RunnerError("terminal artifact inventory does not replay")
    if receipt.get("source_total") is not False:
        raise RunnerError("terminal receipt changed the sound-relaxation boundary")
    _validate_terminal_evidence(
        root, receipt, bundle, manifest.get("cross_check_effective") is True
    )
    return {
        "status": receipt.get("status"),
        "terminal_reentry": True,
        "solver_calls": 0,
        "run_root": str(root),
        "terminal_receipt_sha256": receipt.get("terminal_receipt_sha256"),
    }


def _initial_manifest(
    relative_root: str,
    bundle: emitter.Bundle,
    timeout_seconds: int,
    cross_check: bool,
    binaries: Mapping[str, object],
) -> dict[str, object]:
    encoding_manifest = emitter.validate_bundle(bundle)
    absolute_root = _repo_root() / relative_root
    source_files = {
        label: _repo_root() / relative
        for label, (relative, _expected) in AUTHENTICATED_ENCODER_SPECS.items()
    }
    source_files.update(
        {
            "runner": Path(__file__).resolve(),
            "checkpoint": _repo_root() / CHECKPOINT_RELATIVE,
        }
    )
    source_hashes = {}
    for name, path in source_files.items():
        data = _read_regular(path, f"{name} source")
        source_hashes[name] = {
            "path": str(path.relative_to(_repo_root())),
            "sha256": _sha256(data),
            "size": len(data),
        }
    commands = {
        "cadical_version": [binaries["cadical"]["path"], "--version"],
        "smoke_sat": [
            binaries["cadical"]["path"],
            "-t",
            str(SMOKE_TIMEOUT_SECONDS),
            str(absolute_root / "smoke-sat.cnf"),
        ],
        "smoke_unsat": [
            binaries["cadical"]["path"],
            "-t",
            str(SMOKE_TIMEOUT_SECONDS),
            str(absolute_root / "smoke-unsat.cnf"),
            str(absolute_root / ".smoke-unsat.drat.inprogress"),
        ],
        "smoke_unsat_drat_trim": [
            binaries["drat_trim"]["path"],
            str(absolute_root / "smoke-unsat.cnf"),
            str(absolute_root / ".smoke-unsat.drat.inprogress"),
        ],
        "production": [
            binaries["cadical"]["path"],
            "-t",
            str(timeout_seconds),
            str(absolute_root / "problem.cnf"),
            str(absolute_root / ".production.drat.inprogress"),
        ],
        "production_drat_trim": [
            binaries["drat_trim"]["path"],
            str(absolute_root / "problem.cnf"),
            str(absolute_root / ".production.drat.inprogress"),
        ],
        "kissat_cross_check": None
        if binaries["kissat"] is None
        else [binaries["kissat"]["path"], str(absolute_root / "problem.cnf")],
    }
    return _self_hashed(
        {
            "schema": RUN_SCHEMA,
            "status": "RUNNING",
            "run_root": relative_root,
            "n": PRODUCTION_N,
            "source_total": False,
            "scope_label": "sound finite relaxation; not a finite-to-universal reduction",
            "all_emitted_hard_clauses_source_mapped": True,
            "independent_audit": INDEPENDENT_AUDIT,
            "encoding": _encoding_summary(encoding_manifest),
            "predecessor_model_control": _predecessor_model_control(),
            "source_hashes": source_hashes,
            "binaries": dict(binaries),
            "commands": commands,
            "timeout_seconds": timeout_seconds,
            "cross_check_requested": cross_check,
            "cross_check_effective": binaries["kissat"] is not None,
            "query_is_separate_assumption": True,
            "exactly_one_production_wave": True,
            "no_cegar_successor": True,
            "theorem_bank_search_planned": False,
        },
        "run_manifest_sha256",
    )


def _encoding_summary(encoding_manifest: Mapping[str, object]) -> dict[str, object]:
    return {
        "variables": encoding_manifest["variables"],
        "clauses": encoding_manifest["clauses"],
        "cnf_sha256": encoding_manifest["cnf_sha256"],
        "manifest_sha256": encoding_manifest["manifest_sha256"],
        "source_total": encoding_manifest["source_total"],
        "predecessor": encoding_manifest["predecessor"],
        "clause_delta": encoding_manifest["clause_delta"],
    }


def _create_root(root: Path) -> None:
    if root.exists() or root.is_symlink():
        raise RunnerError("fresh run root already exists")
    root.parent.mkdir(parents=True, exist_ok=True)
    _reject_symlink_ancestors(root.parent)
    root.mkdir()
    _fsync_directory(root.parent)


def _predecessor_model_control() -> dict[str, object]:
    path = _repo_root() / PREDECESSOR_MODEL_RELATIVE
    return emitter.validate_predecessor_sat_model_control(
        _read_regular(path, "audited predecessor SAT model")
    )


def _write_bundle(root: Path, bundle: emitter.Bundle) -> None:
    _write_new(root / "problem.cnf", bundle.cnf)
    _write_new(root / "problem.map.json", bundle.variable_map)
    _write_new(root / "problem.sources.json", bundle.sources)
    _write_new(root / "problem.manifest.json", bundle.manifest)


def _record_binary_versions(
    root: Path,
    cadical: Mapping[str, object],
    drat_trim: Mapping[str, object],
    kissat: Mapping[str, object] | None,
) -> tuple[list[dict[str, object]], dict[str, object]]:
    processes: list[dict[str, object]] = []
    cadical_result = _run_process(
        "cadical-version", [str(cadical["path"]), "--version"], 10
    )
    processes.append(_record_process(root, cadical_result))
    if (
        cadical_result.status != "COMPLETED"
        or cadical_result.returncode != 0
        or not cadical_result.stdout.strip()
    ):
        raise RunnerError("CaDiCaL version probe failed")
    versions: dict[str, object] = {
        "cadical": cadical_result.stdout.decode("utf-8", errors="strict").strip(),
        "drat_trim": drat_trim["version_identity"],
    }
    if kissat is not None:
        kissat_result = _run_process(
            "kissat-version", [str(kissat["path"]), "--version"], 10
        )
        processes.append(_record_process(root, kissat_result))
        if (
            kissat_result.status != "COMPLETED"
            or kissat_result.returncode != 0
            or not kissat_result.stdout.strip()
        ):
            raise RunnerError("Kissat version probe failed")
        versions["kissat"] = kissat_result.stdout.decode(
            "utf-8", errors="strict"
        ).strip()
    else:
        versions["kissat"] = None
    document = _self_hashed(
        {
            "schema": f"{RUN_SCHEMA}/binary-versions/v1",
            "versions": versions,
            "content_identities": {
                "cadical": cadical["version_identity"],
                "drat_trim": drat_trim["version_identity"],
                "kissat": None if kissat is None else kissat["version_identity"],
            },
        },
        "binary_versions_sha256",
    )
    _write_new(root / "binary-versions.json", _canonical_json(document))
    return processes, document


def _run_smokes(
    root: Path,
    cadical: Mapping[str, object],
    drat_trim: Mapping[str, object],
) -> list[dict[str, object]]:
    sat_cnf = b"p cnf 1 1\n1 0\n"
    unsat_cnf = b"p cnf 1 2\n1 0\n-1 0\n"
    sat_path = root / "smoke-sat.cnf"
    unsat_path = root / "smoke-unsat.cnf"
    unsat_temp = root / ".smoke-unsat.drat.inprogress"
    _write_new(sat_path, sat_cnf)
    _write_new(unsat_path, unsat_cnf)
    sat = _run_process(
        "smoke-sat",
        [str(cadical["path"]), "-t", str(SMOKE_TIMEOUT_SECONDS), str(sat_path)],
        SMOKE_TIMEOUT_SECONDS + TIMEOUT_CUSHION_SECONDS,
    )
    processes = [_record_process(root, sat)]
    if sat.status != "COMPLETED" or _classify_cadical(sat.returncode) != "SAT":
        raise RunnerError("hand-known SAT smoke did not return SAT")
    model = parse_complete_model(sat.stdout, 1)
    if model != {1: True}:
        raise RunnerError("hand-known SAT smoke model is wrong")
    unsat = _run_process(
        "smoke-unsat",
        [
            str(cadical["path"]),
            "-t",
            str(SMOKE_TIMEOUT_SECONDS),
            str(unsat_path),
            str(unsat_temp),
        ],
        SMOKE_TIMEOUT_SECONDS + TIMEOUT_CUSHION_SECONDS,
    )
    processes.append(_record_process(root, unsat))
    if unsat.status != "COMPLETED" or _classify_cadical(unsat.returncode) != "UNSAT":
        raise RunnerError("hand-known UNSAT smoke did not return UNSAT")
    trim_process, _ = _check_drat(
        root,
        drat_trim,
        unsat_path,
        unsat_temp,
        root / "smoke-unsat.drat",
        "smoke-unsat-drat-trim",
        SMOKE_TIMEOUT_SECONDS + TIMEOUT_CUSHION_SECONDS,
    )
    processes.append(trim_process)
    return processes


def _cross_check(
    root: Path,
    kissat: Mapping[str, object] | None,
    primary: str,
    bundle: emitter.Bundle,
    timeout_seconds: int,
) -> tuple[dict[str, object], dict[str, object] | None]:
    if kissat is None:
        return {"status": "SKIPPED_UNAVAILABLE", "binary": "kissat"}, None
    result = _run_process(
        "production-kissat-cross-check",
        [str(kissat["path"]), str(root / "problem.cnf")],
        timeout_seconds + TIMEOUT_CUSHION_SECONDS,
    )
    process = _record_process(root, result)
    verdict = _classify_cadical(result.returncode)
    if result.status != "COMPLETED" or verdict not in {"SAT", "UNSAT"}:
        raise RunnerError("independent cross-check was not decisive")
    if verdict != primary:
        raise RunnerError(f"solver disagreement: CaDiCaL={primary}, Kissat={verdict}")
    readback = validate_model(bundle, result.stdout) if verdict == "SAT" else None
    return {"status": "AGREED", "verdict": verdict, "binary": "kissat"}, {
        **process,
        "model_validated": readback is not None,
    }


def run_once(
    run_root: Path,
    *,
    timeout_seconds: int,
    cross_check: bool,
) -> dict[str, object]:
    """Run the authenticated smoke gates and exactly one production solve."""

    if type(timeout_seconds) is not int or timeout_seconds <= 0:
        raise RunnerError("timeout_seconds must be a positive integer")
    _ensure_authenticated_encoders()
    root, relative = _normalize_run_root(run_root)
    if not _registration_status(relative):
        raise RunnerError(
            "exact run root is not registered in checkpoint generated_roots"
        )
    if root.exists() or root.is_symlink():
        if (root / "terminal-receipt.json").is_file():
            return terminal_reentry(root)
        raise RunnerError(
            "run root exists but is not terminal; one-shot resume is forbidden"
        )

    bundle = emitter.emit_bundle(PRODUCTION_N)
    encoding_manifest = emitter.validate_bundle(bundle)
    if (
        encoding_manifest["source_total"] is not False
        or encoding_manifest["cnf_sha256"] != INDEPENDENT_AUDIT["cnf_sha256_reproduced"]
    ):
        raise RunnerError("encoding no longer matches the approved sound relaxation")
    cadical = _binary_identity("cadical", required=True)
    drat_trim = _binary_identity("drat-trim", required=True)
    kissat = _binary_identity("kissat", required=False) if cross_check else None
    if cadical is None or drat_trim is None:
        raise RunnerError("required binary identity is absent")
    binaries = {"cadical": cadical, "drat_trim": drat_trim, "kissat": kissat}
    manifest = _initial_manifest(
        relative, bundle, timeout_seconds, cross_check, binaries
    )
    manifest_data = _canonical_json(manifest)
    _create_root(root)
    _write_new(root / "run-manifest.json", manifest_data)
    _write_bundle(root, bundle)
    processes: list[dict[str, object]] = []
    try:
        version_processes, versions = _record_binary_versions(
            root, cadical, drat_trim, kissat
        )
        processes.extend(version_processes)
        processes.extend(_run_smokes(root, cadical, drat_trim))
        proof_temp = root / ".production.drat.inprogress"
        production = _run_process(
            "production-cadical",
            [
                str(cadical["path"]),
                "-t",
                str(timeout_seconds),
                str(root / "problem.cnf"),
                str(proof_temp),
            ],
            timeout_seconds + TIMEOUT_CUSHION_SECONDS,
        )
        processes.append(_record_process(root, production))
        verdict = _classify_cadical(production.returncode)
        if production.status != "COMPLETED" or verdict in {"UNKNOWN", "ERROR"}:
            if proof_temp.exists():
                os.replace(proof_temp, root / "partial-production.drat")
            return _terminal_receipt(
                root,
                _sha256(manifest_data),
                verdict,
                {
                    "verdict": verdict,
                    "reason": "production solver was nonterminal or errored",
                },
                processes,
            )
        result: dict[str, object] = {"verdict": verdict, "binary_versions": versions}
        if verdict == "SAT":
            result["model_readback"] = validate_model(bundle, production.stdout)
            if proof_temp.exists():
                os.replace(proof_temp, root / "sat-unused-proof-output")
        else:
            trim_process, proof = _check_drat(
                root,
                drat_trim,
                root / "problem.cnf",
                proof_temp,
                root / "production.drat",
                "production-drat-trim",
                timeout_seconds + TIMEOUT_CUSHION_SECONDS,
            )
            processes.append(trim_process)
            result["proof"] = proof
        if cross_check:
            cross_result, cross_process = _cross_check(
                root, kissat, verdict, bundle, timeout_seconds
            )
            result["cross_check"] = cross_result
            if cross_process is not None:
                processes.append(cross_process)
        return _terminal_receipt(
            root, _sha256(manifest_data), verdict, result, processes
        )
    except Exception as exc:
        for temporary in root.glob(".*.inprogress"):
            os.replace(temporary, root / f"partial-{temporary.name[1:-11]}")
        if not (root / "terminal-receipt.json").exists():
            processes = _recorded_process_summaries(root)
            _terminal_receipt(
                root,
                _sha256(manifest_data),
                "FAILED",
                {"verdict": None, "reason": str(exc)},
                processes,
            )
        if isinstance(exc, RunnerError):
            raise
        raise RunnerError(f"runner failed closed: {exc}") from exc


def dry_run(
    run_root: Path | None, timeout_seconds: int, cross_check: bool
) -> dict[str, object]:
    _ensure_authenticated_encoders()
    bundle = emitter.emit_bundle(PRODUCTION_N)
    manifest = emitter.validate_bundle(bundle)
    root_status: dict[str, object] | None = None
    if run_root is not None:
        _, relative = _normalize_run_root(run_root)
        root_status = {
            "path": relative,
            "registered": _registration_status(relative),
        }
    return {
        "mode": "DRY_RUN",
        "launch": False,
        "n": PRODUCTION_N,
        "variables": manifest["variables"],
        "clauses": manifest["clauses"],
        "cnf_sha256": manifest["cnf_sha256"],
        "source_total": False,
        "scope_label": "sound finite relaxation; not a universal closure",
        "all_emitted_hard_clauses_source_mapped": True,
        "independent_audit": INDEPENDENT_AUDIT,
        "predecessor": manifest["predecessor"],
        "clause_delta": manifest["clause_delta"],
        "predecessor_model_control": _predecessor_model_control(),
        "timeout_seconds": timeout_seconds,
        "cross_check_requested": cross_check,
        "cross_check_effective": cross_check and shutil.which("kissat") is not None,
        "run_root": root_status,
        "solver_calls": 0,
        "exactly_one_production_wave": True,
        "no_cegar_successor": True,
        "theorem_bank_search": False,
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--launch", action="store_true")
    parser.add_argument("--run-root", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=3600)
    parser.add_argument("--cross-check", action="store_true")
    args = parser.parse_args(argv)
    exit_code = 0
    if args.launch:
        if args.run_root is None:
            parser.error("--launch requires --run-root")
        result = run_once(
            args.run_root,
            timeout_seconds=args.timeout_seconds,
            cross_check=args.cross_check,
        )
        if result.get("status") not in {"SAT", "UNSAT"}:
            exit_code = 2
    else:
        result = dry_run(args.run_root, args.timeout_seconds, args.cross_check)
    print(json.dumps(result, allow_nan=False, sort_keys=True, separators=(",", ":")))
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
