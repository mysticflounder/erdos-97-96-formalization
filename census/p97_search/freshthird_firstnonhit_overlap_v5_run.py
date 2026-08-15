# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Authenticated one-shot runner for the FirstNonHit overlap v5 CNF.

The default dry run authenticates the complete v2→v5 encoder chain, replays
the bundle and the audited v4 SAT witness, and reports exact counts and hashes.
Production requires an independently approved exact source/CNF audit and a
stable run root registered in the lane checkpoint.  The production machinery
is the byte-authenticated, previously audited v4 one-shot runner, rebound to
the v5 emitter and strengthened with explicit sameBlocker semantic readback.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import re
import stat
import sys
import types
from collections.abc import Sequence
from pathlib import Path, PurePosixPath

RUN_SCHEMA = "p97-freshthird-firstnonhit-overlap-v5/run/v1"
RECEIPT_SCHEMA = f"{RUN_SCHEMA}/terminal-receipt/v1"
PROCESS_SCHEMA = f"{RUN_SCHEMA}/process-receipt/v1"
LANE_ID = "firstnonhit-overlap-v5"
CHECKPOINT_RELATIVE = ".codex/worktree-checkpoints/firstnonhit-overlap-v5.json"
RUN_PREFIX = f"scratch/runs/{LANE_ID}/"
PROPOSED_RUN_ID = "n17-one-shot-audit-approved"
PROPOSED_RUN_ROOT = f"{RUN_PREFIX}{PROPOSED_RUN_ID}"
PRODUCTION_N = 17
RUN_ID = re.compile(r"[a-z0-9][a-z0-9._-]{2,79}")
INDEPENDENT_AUDIT = {
    "status": "APPROVED",
    "scope": "exact emitted CNF, source map, runner, and v4 survivor readback",
    "counts_expected": {"variables": 93_211, "clauses": 560_926},
    "cnf_sha256_expected": (
        "d863b87e923c8df36c88ecd7d6fa3e5db820fd1f231526f9c7845353dac75ce9"
    ),
    "counts_reproduced": {"variables": 93_211, "clauses": 560_926},
    "cnf_sha256_reproduced": (
        "d863b87e923c8df36c88ecd7d6fa3e5db820fd1f231526f9c7845353dac75ce9"
    ),
    "known_v4_model_violations_reproduced": [[7, 15], [8, 15]],
    "no_unsound_clause_found": True,
    "launch_authorized": True,
}

_V2_RELATIVE = "census/p97_search/freshthird_firstnonhit_complete_finite_v2.py"
_V3_RELATIVE = "census/p97_search/freshthird_firstnonhit_cap_endpoint_v3.py"
_V4_RELATIVE = "census/p97_search/freshthird_firstnonhit_all_large_caps_v4.py"
_V5_RELATIVE = "census/p97_search/freshthird_firstnonhit_overlap_v5.py"
_RUNNER_BASE_RELATIVE = (
    "census/p97_search/freshthird_firstnonhit_all_large_caps_v4_run.py"
)
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
    "encoder_v5": (
        _V5_RELATIVE,
        "6bf562662f826a51eba2b56d555476faeb84a234603c06ecefac8874501c74c3",
    ),
    "runner_base": (
        _RUNNER_BASE_RELATIVE,
        "8e4ad80ebb4cc9e2e110d59998483e2531bfa2f7a949602f2678d8b85b72abc6",
    ),
}
AUTHENTICATED_MODULE_NAMES = {
    "encoder_v2": "census.p97_search.freshthird_firstnonhit_complete_finite_v2",
    "encoder_v3": "census.p97_search.freshthird_firstnonhit_cap_endpoint_v3",
    "encoder_v4": "census.p97_search.freshthird_firstnonhit_all_large_caps_v4",
    "encoder_v5": "census.p97_search.freshthird_firstnonhit_overlap_v5",
}

LEAN_COMMIT = "989edc9c7d03eea819b8bb3d40e3bcfc05fcee82"
LEAN_INGRESS_RELATIVE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "FirstNonHitFiniteOverlapTerminal.lean"
)
LEAN_INGRESS_SHA256 = "d5a562c33a49e92561f314bb477b1bbe11a489cac29ea9484b771c18d90a5642"
LEAN_INGRESS_DECLARATION = (
    "FirstNonHitSourceTotalFiniteAssignment.false_of_row_overlap_card_ge_three"
)

emitter = None
predecessor_emitter = None
runner_base = None


class RunnerError(RuntimeError):
    """Fail-closed custody or launch-gate failure."""


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
    """Authenticate the complete encoder and delegated-runner source chain."""

    root = _repo_root()
    rows: dict[str, dict[str, object]] = {}
    for label, (relative, expected) in AUTHENTICATED_ENCODER_SPECS.items():
        data = _read_regular(root / relative, f"authenticated {label} source")
        actual = _sha256(data)
        if actual != expected:
            raise RunnerError(f"{label} source hash mismatch: {actual} != {expected}")
        rows[label] = {"path": relative, "sha256": actual, "size": len(data)}
    return rows


def _authenticate_lean_ingress() -> dict[str, object]:
    """Authenticate the exact new Lean theorem source before Python imports."""

    data = _read_regular(
        _repo_root() / LEAN_INGRESS_RELATIVE, "FirstNonHit overlap Lean ingress"
    )
    actual = _sha256(data)
    if actual != LEAN_INGRESS_SHA256:
        raise RunnerError(
            f"Lean ingress source hash mismatch: {actual} != {LEAN_INGRESS_SHA256}"
        )
    return {
        "path": LEAN_INGRESS_RELATIVE,
        "sha256": actual,
        "size": len(data),
        "commit": LEAN_COMMIT,
        "declaration": LEAN_INGRESS_DECLARATION,
    }


def _load_authenticated_encoders() -> tuple[
    object, object, object, object, dict[str, dict[str, object]]
]:
    """Load only already-authenticated files under synthetic package parents."""

    rows = _authenticated_encoder_rows()
    _authenticate_lean_ingress()
    names = (
        "census",
        "census.p97_search",
        *AUTHENTICATED_MODULE_NAMES.values(),
    )
    saved = {name: sys.modules.get(name) for name in names}
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
        for label in ("encoder_v2", "encoder_v3", "encoder_v4", "encoder_v5"):
            module_name = AUTHENTICATED_MODULE_NAMES[label]
            path = _repo_root() / rows[label]["path"]
            spec = importlib.util.spec_from_file_location(module_name, path)
            if spec is None or spec.loader is None:
                raise RunnerError(f"cannot construct authenticated loader: {label}")
            module = importlib.util.module_from_spec(spec)
            sys.modules[module_name] = module
            spec.loader.exec_module(module)
            modules[label] = module
        return (
            modules["encoder_v5"],
            modules["encoder_v4"],
            modules["encoder_v3"],
            modules["encoder_v2"],
            rows,
        )
    except Exception:
        for name, prior in saved.items():
            if prior is None:
                sys.modules.pop(name, None)
            else:
                sys.modules[name] = prior
        raise
    finally:
        for name in ("census", "census.p97_search"):
            prior = saved[name]
            if prior is None:
                sys.modules.pop(name, None)
            else:
                sys.modules[name] = prior


def _ensure_authenticated_encoders() -> dict[str, dict[str, object]]:
    global emitter, predecessor_emitter
    if emitter is None or predecessor_emitter is None:
        loaded_v5, loaded_v4, _loaded_v3, _loaded_v2, rows = (
            _load_authenticated_encoders()
        )
        emitter = loaded_v5
        predecessor_emitter = loaded_v4
        return rows
    rows = _authenticated_encoder_rows()
    _authenticate_lean_ingress()
    return rows


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
        raise RunnerError(f"{description} must be a JSON object")
    if require_canonical and _canonical_json(value) != data:
        raise RunnerError(f"{description} is not canonical JSON")
    return value


def _read_checkpoint() -> dict[str, object]:
    value = _strict_json(
        _read_regular(_repo_root() / CHECKPOINT_RELATIVE, "lane checkpoint"),
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


def _predecessor_model_control() -> dict[str, object]:
    path = _repo_root() / emitter.PREDECESSOR_MODEL_RELATIVE
    return emitter.validate_predecessor_sat_model_control(
        _read_regular(path, "authenticated v4 SAT model")
    )


def _validate_v5_auxiliaries(
    bundle: object,
    stdout: bytes,
    base_summary: dict[str, object],
    runtime: object,
) -> dict[str, object]:
    """Independently read back every sameBlocker value and overlap bound."""

    manifest = emitter.validate_bundle(bundle)
    n = manifest.get("n")
    variable_count = manifest.get("variables")
    if type(n) is not int or type(variable_count) is not int:
        raise RunnerError("v5 model manifest cardinalities are malformed")
    mapping = json.loads(bundle.variable_map)
    variables = mapping.get("variables")
    if type(variables) is not list:
        raise RunnerError("v5 model variable map is malformed")
    role_to_id = {
        row["role"]: row["id"]
        for row in variables
        if type(row) is dict
        and type(row.get("role")) is str
        and type(row.get("id")) is int
    }
    if len(role_to_id) != variable_count:
        raise RunnerError("v5 model variable roles do not replay uniquely")
    assignment = runtime.parse_complete_model(stdout, variable_count)

    def enabled(role: str) -> bool:
        identifier = role_to_id.get(role)
        if type(identifier) is not int:
            raise RunnerError(f"v5 semantic variable is missing: {role}")
        return assignment[identifier]

    blocker_values: dict[int, int] = {}
    selected_rows: dict[int, tuple[int, ...]] = {}
    for source in range(n):
        blockers = tuple(
            center for center in range(n) if enabled(f"blocker/{source}/{center}")
        )
        if len(blockers) != 1:
            raise RunnerError("v5 blocker readback is not one-hot")
        blocker_values[source] = blockers[0]
        selected_rows[source] = tuple(
            point for point in range(n) if enabled(f"row/{source}/{point}")
        )

    same_count = 0
    distinct_count = 0
    for source in range(n):
        for target in range(source + 1, n):
            actual_same = enabled(f"same_blocker/{source}/{target}")
            expected_same = blocker_values[source] == blocker_values[target]
            if actual_same != expected_same:
                raise RunnerError(
                    f"sameBlocker readback mismatch for sources {source},{target}"
                )
            overlap = set(selected_rows[source]) & set(selected_rows[target])
            if not actual_same and len(overlap) > 2:
                raise RunnerError(
                    f"distinct-blocker overlap exceeds two for {source},{target}"
                )
            same_count += int(actual_same)
            distinct_count += int(not actual_same)

    result = dict(base_summary)
    result.update(
        {
            "same_blocker_auxiliaries_validated": n * (n - 1) // 2,
            "same_blocker_equal_pairs": same_count,
            "same_blocker_distinct_pairs": distinct_count,
            "distinct_blocker_overlap_max": 2,
            "v5_semantic_validation": True,
        }
    )
    return result


def _validate_terminal_binaries(manifest: dict[str, object], runtime: object) -> None:
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
        found = runtime.shutil.which(binary_name)
        if (
            found is None
            or row.get("name") != binary_name
            or row["path"] != str(Path(found).resolve())
        ):
            raise RunnerError(f"terminal {name} binary path is not canonical")
        data = runtime._read_regular(Path(row["path"]), f"terminal {name} binary")
        if row.get("sha256") != _sha256(data) or row.get("size") != len(data):
            raise RunnerError(f"current {name} binary differs from terminal run")


def _validate_failed_receipt(
    root: Path, receipt: dict[str, object], runtime: object
) -> None:
    """Replay a fail-closed receipt, including pre-process initialization."""

    if (
        receipt.get("independent_audit") != INDEPENDENT_AUDIT
        or receipt.get("all_emitted_hard_clauses_source_mapped") is not True
        or receipt.get("no_cegar_successor") is not True
        or receipt.get("theorem_bank_search_run") is not False
    ):
        raise RunnerError("FAILED terminal receipt boundary mismatch")
    result = receipt.get("result")
    if (
        type(result) is not dict
        or set(result) != {"verdict", "reason", "failure_phase"}
        or result.get("verdict") is not None
        or type(result.get("reason")) is not str
        or result.get("failure_phase") not in {"initialization", "execution"}
    ):
        raise RunnerError("FAILED terminal result is malformed")
    summaries = receipt.get("processes")
    if type(summaries) is not list or any(type(row) is not dict for row in summaries):
        raise RunnerError("FAILED terminal process list is malformed")
    replayed = runtime._recorded_process_summaries(root)
    if summaries != replayed:
        raise RunnerError("FAILED terminal process inventory does not replay")
    if result["failure_phase"] == "initialization":
        if summaries:
            raise RunnerError("initialization failure unexpectedly ran a process")
        return
    if summaries:
        names = [row["name"] for row in summaries]
        runtime._validate_process_phase_set(
            names,
            {row["name"]: row for row in summaries},
            "FAILED",
            receipt.get("cross_check_effective") is True,
        )


def _terminal_reentry_v5(root: Path, runtime: object) -> dict[str, object]:
    """Authenticate a registered v5 terminal root without any process call."""

    _ensure_authenticated_encoders()
    absolute, relative_root = runtime._normalize_run_root(root)
    if not _registration_status(relative_root):
        raise RunnerError("terminal root is not registered in the lane checkpoint")
    runtime._reject_symlink_ancestors(absolute)
    if absolute.is_symlink() or not absolute.is_dir():
        raise RunnerError("terminal root is not a regular directory")

    manifest_data = runtime._read_regular(
        absolute / "run-manifest.json", "run manifest"
    )
    manifest = runtime._strict_json(manifest_data, "run manifest")
    runtime._validate_self_hash(manifest, "run_manifest_sha256")
    if (
        manifest.get("schema") != RUN_SCHEMA
        or manifest.get("status") != "RUNNING"
        or manifest.get("run_root") != relative_root
        or manifest.get("source_total") is not False
        or manifest.get("all_emitted_hard_clauses_source_mapped") is not True
        or manifest.get("independent_audit") != INDEPENDENT_AUDIT
        or manifest.get("n") != PRODUCTION_N
        or manifest.get("query_is_separate_assumption") is not True
        or manifest.get("exactly_one_production_wave") is not True
        or manifest.get("no_cegar_successor") is not True
        or manifest.get("theorem_bank_search_planned") is not False
        or manifest.get("lean_ingress") != _authenticate_lean_ingress()
        or manifest.get("production_path")
        != {
            "runner_base": AUTHENTICATED_ENCODER_SPECS["runner_base"][0],
            "runner_base_sha256": AUTHENTICATED_ENCODER_SPECS["runner_base"][1],
            "v5_semantic_readback": True,
        }
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
    expected_source_names = set(AUTHENTICATED_ENCODER_SPECS) | {
        "runner",
        "checkpoint",
    }
    if type(source_hashes) is not dict or set(source_hashes) != expected_source_names:
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
        data = runtime._read_regular(_repo_root() / relative, f"terminal {name} source")
        if row.get("sha256") != _sha256(data) or row.get("size") != len(data):
            raise RunnerError(f"current {name} source differs from terminal run")

    _validate_terminal_binaries(manifest, runtime)

    receipt = runtime._strict_json(
        runtime._read_regular(absolute / "terminal-receipt.json", "terminal receipt"),
        "terminal receipt",
    )
    runtime._validate_self_hash(receipt, "terminal_receipt_sha256")
    if receipt.get("schema") != RECEIPT_SCHEMA:
        raise RunnerError("terminal receipt schema mismatch")
    if receipt.get("cross_check_requested") != manifest.get(
        "cross_check_requested"
    ) or receipt.get("cross_check_effective") != manifest.get("cross_check_effective"):
        raise RunnerError("terminal cross-check metadata does not replay")
    if receipt.get("run_manifest_sha256") != _sha256(manifest_data):
        raise RunnerError("terminal receipt is not bound to the run manifest")
    if receipt.get("artifact_inventory") != runtime._artifact_inventory(absolute):
        raise RunnerError("terminal artifact inventory does not replay")
    if receipt.get("source_total") is not False:
        raise RunnerError("terminal receipt changed the sound-relaxation boundary")
    result = receipt.get("result")
    initialization_failed = (
        receipt.get("status") == "FAILED"
        and type(result) is dict
        and result.get("failure_phase") == "initialization"
    )
    bundle = None
    if not initialization_failed:
        bundle = emitter.Bundle(
            runtime._read_regular(absolute / "problem.cnf", "terminal problem CNF"),
            runtime._read_regular(
                absolute / "problem.map.json", "terminal problem map"
            ),
            runtime._read_regular(
                absolute / "problem.sources.json", "terminal problem sources"
            ),
            runtime._read_regular(
                absolute / "problem.manifest.json", "terminal problem manifest"
            ),
        )
        encoding_manifest = emitter.validate_bundle(bundle)
        if manifest.get("encoding") != runtime._encoding_summary(encoding_manifest):
            raise RunnerError("terminal encoding metadata does not replay")
        if manifest.get("predecessor_model_control") != _predecessor_model_control():
            raise RunnerError("terminal predecessor-model control does not replay")
    if receipt.get("status") == "FAILED":
        _validate_failed_receipt(absolute, receipt, runtime)
    else:
        if bundle is None:
            raise RunnerError("terminal success is missing its encoding bundle")
        runtime._validate_terminal_evidence(
            absolute,
            receipt,
            bundle,
            manifest.get("cross_check_effective") is True,
        )
    return {
        "status": receipt.get("status"),
        "terminal_reentry": True,
        "solver_calls": 0,
        "run_root": str(absolute),
        "terminal_receipt_sha256": receipt.get("terminal_receipt_sha256"),
    }


def _recover_manifest(root: Path, manifest_data: bytes, runtime: object) -> None:
    """Ensure recovery can bind a FAILED receipt to the canonical manifest."""

    path = root / "run-manifest.json"
    manifest_matches = False
    if path.exists() and not path.is_symlink():
        try:
            manifest_matches = (
                runtime._read_regular(path, "recovery run manifest") == manifest_data
            )
        except RunnerError:
            manifest_matches = False
    if manifest_matches:
        return
    if path.exists() or path.is_symlink():
        quarantine = root / "partial-run-manifest.json"
        if quarantine.exists() or quarantine.is_symlink():
            raise RunnerError("run-manifest recovery quarantine already exists")
        os.replace(path, quarantine)
        runtime._fsync_directory(root)
    runtime._write_new(path, manifest_data)


def _quarantine_inprogress(root: Path, runtime: object) -> None:
    for temporary in root.glob(".*.inprogress"):
        stem = temporary.name.removeprefix(".").removesuffix(".inprogress")
        quarantine = root / f"partial-{stem}"
        if quarantine.exists() or quarantine.is_symlink():
            raise RunnerError(f"partial-artifact quarantine exists: {quarantine}")
        os.replace(temporary, quarantine)
    runtime._fsync_directory(root)


def _recover_terminal_receipt(
    root: Path,
    manifest_data: bytes,
    failure_phase: str,
    reason: str,
    runtime: object,
) -> None:
    """Keep a complete receipt or replace a partial write with FAILED custody."""

    receipt_path = root / "terminal-receipt.json"

    def keep_or_quarantine(quarantine_name: str) -> bool:
        receipt_valid = False
        if receipt_path.exists() and not receipt_path.is_symlink():
            try:
                receipt_data = runtime._read_regular(
                    receipt_path, "recovery terminal receipt"
                )
                receipt = runtime._strict_json(
                    receipt_data, "recovery terminal receipt"
                )
                runtime._validate_self_hash(receipt, "terminal_receipt_sha256")
                if (
                    receipt.get("schema") != RECEIPT_SCHEMA
                    or receipt.get("run_manifest_sha256") != _sha256(manifest_data)
                    or receipt.get("artifact_inventory")
                    != runtime._artifact_inventory(root)
                ):
                    raise RunnerError("recovery terminal receipt boundary mismatch")
                receipt_valid = True
            except RunnerError:
                receipt_valid = False
        if receipt_valid:
            return True
        if receipt_path.exists() or receipt_path.is_symlink():
            quarantine = root / quarantine_name
            if quarantine.exists() or quarantine.is_symlink():
                raise RunnerError("terminal-receipt recovery quarantine already exists")
            os.replace(receipt_path, quarantine)
            runtime._fsync_directory(root)
        return False

    if keep_or_quarantine("partial-terminal-receipt.json"):
        return

    def write_failed() -> None:
        runtime._terminal_receipt(
            root,
            _sha256(manifest_data),
            "FAILED",
            {
                "verdict": None,
                "reason": reason,
                "failure_phase": failure_phase,
            },
            runtime._recorded_process_summaries(root),
        )

    try:
        write_failed()
    except Exception:  # noqa: BLE001 - one retry after partial receipt custody
        if keep_or_quarantine("partial-terminal-receipt-retry.json"):
            return
        write_failed()


def _run_once_v5(
    run_root: Path,
    *,
    timeout_seconds: int,
    cross_check: bool,
    runtime: object,
) -> dict[str, object]:
    """Run v5 with terminal recovery covering every post-root operation."""

    if type(timeout_seconds) is not int or timeout_seconds <= 0:
        raise RunnerError("timeout_seconds must be a positive integer")
    _ensure_authenticated_encoders()
    root, relative = runtime._normalize_run_root(run_root)
    if not _registration_status(relative):
        raise RunnerError(
            "exact run root is not registered in checkpoint generated_roots"
        )
    if root.exists() or root.is_symlink():
        if (root / "terminal-receipt.json").is_file():
            return _terminal_reentry_v5(root, runtime)
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
    cadical = runtime._binary_identity("cadical", required=True)
    drat_trim = runtime._binary_identity("drat-trim", required=True)
    kissat = runtime._binary_identity("kissat", required=False) if cross_check else None
    if cadical is None or drat_trim is None:
        raise RunnerError("required binary identity is absent")
    binaries = {"cadical": cadical, "drat_trim": drat_trim, "kissat": kissat}
    manifest = runtime._initial_manifest(
        relative, bundle, timeout_seconds, cross_check, binaries
    )
    manifest_data = runtime._canonical_json(manifest)
    processes: list[dict[str, object]] = []
    root_created = False
    failure_phase = "initialization"
    try:
        if root.exists() or root.is_symlink():
            raise RunnerError("fresh run root already exists")
        root.parent.mkdir(parents=True, exist_ok=True)
        runtime._reject_symlink_ancestors(root.parent)
        root.mkdir()
        root_created = True
        runtime._fsync_directory(root.parent)
        runtime._write_new(root / "run-manifest.json", manifest_data)
        runtime._write_bundle(root, bundle)
        failure_phase = "execution"
        version_processes, versions = runtime._record_binary_versions(
            root, cadical, drat_trim, kissat
        )
        processes.extend(version_processes)
        processes.extend(runtime._run_smokes(root, cadical, drat_trim))
        proof_temp = root / ".production.drat.inprogress"
        production = runtime._run_process(
            "production-cadical",
            [
                str(cadical["path"]),
                "-t",
                str(timeout_seconds),
                str(root / "problem.cnf"),
                str(proof_temp),
            ],
            timeout_seconds + runtime.TIMEOUT_CUSHION_SECONDS,
        )
        processes.append(runtime._record_process(root, production))
        verdict = runtime._classify_cadical(production.returncode)
        if production.status != "COMPLETED" or verdict in {"UNKNOWN", "ERROR"}:
            if proof_temp.exists():
                os.replace(proof_temp, root / "partial-production.drat")
            return runtime._terminal_receipt(
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
            result["model_readback"] = runtime.validate_model(bundle, production.stdout)
            if proof_temp.exists():
                os.replace(proof_temp, root / "sat-unused-proof-output")
        else:
            trim_process, proof = runtime._check_drat(
                root,
                drat_trim,
                root / "problem.cnf",
                proof_temp,
                root / "production.drat",
                "production-drat-trim",
                timeout_seconds + runtime.TIMEOUT_CUSHION_SECONDS,
            )
            processes.append(trim_process)
            result["proof"] = proof
        if cross_check:
            cross_result, cross_process = runtime._cross_check(
                root, kissat, verdict, bundle, timeout_seconds
            )
            result["cross_check"] = cross_result
            if cross_process is not None:
                processes.append(cross_process)
        return runtime._terminal_receipt(
            root, _sha256(manifest_data), verdict, result, processes
        )
    except Exception as exc:
        if root_created:
            try:
                runtime._fsync_directory(root.parent)
                _quarantine_inprogress(root, runtime)
                _recover_manifest(root, manifest_data, runtime)
                _recover_terminal_receipt(
                    root, manifest_data, failure_phase, str(exc), runtime
                )
            except Exception as recovery_exc:  # noqa: BLE001 - custody recovery
                raise RunnerError(
                    f"runner failed closed and terminal recovery failed: {recovery_exc}"
                ) from exc
        if isinstance(exc, RunnerError):
            raise
        raise RunnerError(f"runner failed closed: {exc}") from exc


def _load_authenticated_runner_base() -> object:
    """Load and configure the authenticated v4 runner as the v5 runtime."""

    global runner_base
    if runner_base is not None:
        _authenticated_encoder_rows()
        _authenticate_lean_ingress()
        return runner_base

    _ensure_authenticated_encoders()
    relative, expected = AUTHENTICATED_ENCODER_SPECS["runner_base"]
    path = _repo_root() / relative
    data = _read_regular(path, "authenticated one-shot runner base")
    if _sha256(data) != expected:
        raise RunnerError("one-shot runner base changed after authentication")
    module_name = "census.p97_search._firstnonhit_overlap_v5_runner_base"
    spec = importlib.util.spec_from_file_location(module_name, path)
    if spec is None or spec.loader is None:
        raise RunnerError("cannot construct authenticated runner-base loader")
    module = importlib.util.module_from_spec(spec)
    prior = sys.modules.get(module_name)
    try:
        sys.modules[module_name] = module
        spec.loader.exec_module(module)
    except Exception:
        if prior is None:
            sys.modules.pop(module_name, None)
        else:
            sys.modules[module_name] = prior
        raise

    module.__file__ = __file__
    module.RunnerError = RunnerError
    module.RUN_SCHEMA = RUN_SCHEMA
    module.RECEIPT_SCHEMA = RECEIPT_SCHEMA
    module.PROCESS_SCHEMA = PROCESS_SCHEMA
    module.LANE_ID = LANE_ID
    module.CHECKPOINT_RELATIVE = CHECKPOINT_RELATIVE
    module.RUN_PREFIX = RUN_PREFIX
    module.PRODUCTION_N = PRODUCTION_N
    module.INDEPENDENT_AUDIT = INDEPENDENT_AUDIT
    module.PREDECESSOR_MODEL_RELATIVE = emitter.PREDECESSOR_MODEL_RELATIVE
    module.AUTHENTICATED_ENCODER_SPECS = AUTHENTICATED_ENCODER_SPECS
    module.AUTHENTICATED_MODULE_NAMES = AUTHENTICATED_MODULE_NAMES
    module.emitter = emitter
    module.predecessor_emitter = predecessor_emitter
    module._repo_root = _repo_root
    module._ensure_authenticated_encoders = _ensure_authenticated_encoders
    module._predecessor_model_control = _predecessor_model_control
    emitter.ROLES = predecessor_emitter.ROLES
    emitter.Q1 = predecessor_emitter.Q1

    base_validate_model = module.validate_model
    base_initial_manifest = module._initial_manifest

    def validate_v5_model(bundle: object, stdout: bytes) -> dict[str, object]:
        summary = base_validate_model(bundle, stdout)
        return _validate_v5_auxiliaries(bundle, stdout, summary, module)

    def initial_v5_manifest(*args: object, **kwargs: object) -> dict[str, object]:
        manifest = base_initial_manifest(*args, **kwargs)
        unsigned = dict(manifest)
        unsigned.pop("run_manifest_sha256", None)
        unsigned["lean_ingress"] = _authenticate_lean_ingress()
        unsigned["production_path"] = {
            "runner_base": AUTHENTICATED_ENCODER_SPECS["runner_base"][0],
            "runner_base_sha256": AUTHENTICATED_ENCODER_SPECS["runner_base"][1],
            "v5_semantic_readback": True,
        }
        return module._self_hashed(unsigned, "run_manifest_sha256")

    module.validate_model = validate_v5_model
    module._initial_manifest = initial_v5_manifest

    def terminal_v5(root: Path) -> dict[str, object]:
        return _terminal_reentry_v5(root, module)

    def run_v5(
        root: Path, *, timeout_seconds: int, cross_check: bool
    ) -> dict[str, object]:
        return _run_once_v5(
            root,
            timeout_seconds=timeout_seconds,
            cross_check=cross_check,
            runtime=module,
        )

    module.terminal_reentry = terminal_v5
    module.run_once = run_v5
    runner_base = module
    return module


def _require_launch_audit() -> None:
    counts = INDEPENDENT_AUDIT.get("counts_reproduced")
    digest = INDEPENDENT_AUDIT.get("cnf_sha256_reproduced")
    if (
        INDEPENDENT_AUDIT.get("status") != "APPROVED"
        or counts != INDEPENDENT_AUDIT["counts_expected"]
        or digest != INDEPENDENT_AUDIT["cnf_sha256_expected"]
        or INDEPENDENT_AUDIT.get("known_v4_model_violations_reproduced")
        != [[7, 15], [8, 15]]
        or INDEPENDENT_AUDIT.get("no_unsound_clause_found") is not True
        or INDEPENDENT_AUDIT.get("launch_authorized") is not True
    ):
        raise RunnerError("production launch is disabled pending independent audit")


def run_once(
    run_root: Path, *, timeout_seconds: int, cross_check: bool
) -> dict[str, object]:
    """Run the guarded smokes and exactly one v5 production solve."""

    runtime = _load_authenticated_runner_base()
    _absolute, relative = runtime._normalize_run_root(run_root)
    if not _registration_status(relative):
        raise RunnerError(
            "exact run root is not registered in checkpoint generated_roots"
        )
    _require_launch_audit()
    return runtime.run_once(
        run_root, timeout_seconds=timeout_seconds, cross_check=cross_check
    )


def dry_run(
    run_root: Path | None, timeout_seconds: int, cross_check: bool
) -> dict[str, object]:
    if type(timeout_seconds) is not int or timeout_seconds <= 0:
        raise RunnerError("timeout must be a positive integer")
    runtime = _load_authenticated_runner_base()
    result = runtime.dry_run(run_root, timeout_seconds, cross_check)
    result.update(
        {
            "schema": RUN_SCHEMA,
            "run_root_created": False,
            "proposed_run_root": PROPOSED_RUN_ROOT,
            "lean_ingress": _authenticate_lean_ingress(),
            "authenticated_source_chain": _authenticated_encoder_rows(),
            "runner_base_authenticated": True,
            "production_path_installed": True,
        }
    )
    return result


def validate_model(bundle: object, stdout: bytes) -> dict[str, object]:
    return _load_authenticated_runner_base().validate_model(bundle, stdout)


def parse_complete_model(stdout: bytes, variable_count: int) -> dict[int, bool]:
    return _load_authenticated_runner_base().parse_complete_model(
        stdout, variable_count
    )


def _validate_process_phase_set(
    names: Sequence[str],
    process_receipts: dict[str, dict[str, object]],
    status: str,
    cross_check_effective: bool,
) -> None:
    _load_authenticated_runner_base()._validate_process_phase_set(
        names, process_receipts, status, cross_check_effective
    )


def terminal_reentry(root: Path) -> dict[str, object]:
    """Validate immutable terminal custody without executing a subprocess."""

    return _load_authenticated_runner_base().terminal_reentry(root)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--launch", action="store_true")
    parser.add_argument("--run-root", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=3600)
    parser.add_argument("--cross-check", action="store_true")
    args = parser.parse_args(argv)
    if args.launch:
        if args.run_root is None:
            parser.error("--launch requires --run-root")
        result = run_once(
            args.run_root,
            timeout_seconds=args.timeout_seconds,
            cross_check=args.cross_check,
        )
    else:
        result = dry_run(args.run_root, args.timeout_seconds, args.cross_check)
    print(json.dumps(result, allow_nan=False, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
