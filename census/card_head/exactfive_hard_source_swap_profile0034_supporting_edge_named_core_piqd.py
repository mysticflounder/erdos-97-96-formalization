"""Governed PIQD named-assumption cores for profile 0034 supporting edges.

The lane authenticates the completed supporting-edge run, reconstructs its two
Z3-UNSAT mirror journals, guards every target assertion with a stable label,
and asks PIQD for the returned Z3 core.  All claims remain formula-local and
discovery-only.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import math
import os
import re
import stat
import subprocess
import urllib.parse
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_hard_source_swap_profile0034_supporting_edge_qfnra_piqd as source,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = (
    "exactfive-hard-source-swap-profile0034-supporting-edge-named-core-piqd-20260904"
)
RUN_ID = "run-0002"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
ABORTED_RUN_ID = "run-0001"
ABORTED_ROOT = (
    REPOSITORY_ROOT
    / "scratch/quarantine"
    / f"{LANE_ID}-{ABORTED_RUN_ID}-aborted"
)
ABORTED_MANIFEST_PATH = ABORTED_ROOT / "run_manifest.json"
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = (
    REPOSITORY_ROOT
    / "docs/specs/p97-exactfive-hard-source-swap-profile0034-supporting-edge-named-core-v1.md"
)
TEST_PATH = (
    REPOSITORY_ROOT
    / "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_supporting_edge_named_core_piqd.py"
)
RUNNER_PATH = (
    REPOSITORY_ROOT
    / "scripts/run_exactfive_hard_source_swap_profile0034_supporting_edge_named_core_piqd.py"
)

ABORTED_EXECUTION_COMMIT = "17cc137c22d02fdc6cddb781ba6be31a43a7c3a5"
ABORTED_MANIFEST_FILE_SHA256 = (
    "95cca22b16e5948f94a4361f910891cc48ad4d178be4c7ea35240fadc92e6cd0"
)
ABORTED_MANIFEST_SHA256 = (
    "c5d80b258a520ea63c171e59e82e04060e5bbec8c06cd6d75070d610ad9ddad1"
)

PARENT_ROOT = source.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PRODUCER_SHA256 = (
    "75cf96e48d7f0ceb89c965e3cec0d5315107b128540c608f350420689b641534"
)
PARENT_MANIFEST_FILE_SHA256 = (
    "c1192f3afed7e089b8fbb7e49e8c4deec2cda36717e9cec537e3bf63689b96c5"
)
PARENT_MANIFEST_SHA256 = (
    "6e469b3048aec1f26e1c94e644adf570752eaea49ee1dd91c60b3605d5ac50c4"
)
PARENT_LAUNCH_FILE_SHA256 = (
    "faedccc1afaa8050ac1b5d7a702dcadbbf0be6e7a5cceb8e0ae11bb45b16a250"
)
PARENT_LAUNCH_SHA256 = (
    "28547a2032ae396844226c89851524a24f4583b8b2824f445fe658bf1bf12997"
)
PARENT_TERMINAL_FILE_SHA256 = (
    "09c2e3d4a9839814bf7c2c5dd4fd88b10002188acbb94d10c02be01c0954823f"
)
PARENT_TERMINAL_SHA256 = (
    "db6ec92b4f2047722d3934abdac0d8bd79512768b3dc52b67cbedf71750513a5"
)
EXPECTED_PARENT_RESULTS = {
    "control-positive": "e42993df0dcecbd3cb0e77c43c89f695312f7907895eb5a8edc2a4e43fef5b42",
    "control-negative": "87ddb18b3f98d90b6349166417f3f23da223b04f2896e7b1cd52898ff683576d",
    "parent-z3-mirror-radius-lt": "be1f7d987e3da0cdfe2d3219e4b65fd45990915171fb75af942e1ca5678f7ae3",
    "parent-z3-mirror-radius-gt": "0cd5f030409ca464369af8b7123bd07fd4d75bce020bf7b8f1666e23c2dedf5c",
    "parent-cvc5-direct-radius-lt": "44cd395e4db75d0bf340710e982d003915a2f21d70703f00bad6c266562a259e",
    "parent-cvc5-direct-radius-gt": "608ac1a197610163fcf2a7bb1073e30c5d640b94469aa242f4b944778b84c683",
}

SYSTEM_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-named-core-system/v1"
)
DESCRIPTOR_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-named-core-query/v1"
)
SOLVER_PROFILE_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-named-core-solver/v1"
)
RESULT_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-named-core-result/v1"
)
LAUNCH_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-named-core-launch/v1"
)
TERMINAL_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-named-core-terminal/v1"
)
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
DEFAULT_TIMEOUT_S = 60.0
MAX_WORKERS = 4
DEFAULT_WORKERS = 4

FALSE_CLAIMS = {
    "live_source_completeness": False,
    "core_minimality": False,
    "source_realization": False,
    "all_profile_execution": False,
    "lean_ingress": False,
    "live_closure": False,
    "promotion": False,
    "theorem": False,
}
QUERY_PLAN = (
    ("z3-control-positive", "z3", "control-positive"),
    ("z3-control-negative", "z3", "control-negative"),
    ("z3-target-mirror-radius-lt", "z3", "parent-z3-mirror-radius-lt"),
    ("z3-target-mirror-radius-gt", "z3", "parent-z3-mirror-radius-gt"),
)
QUERY_KEYS = tuple(row[0] for row in QUERY_PLAN)
TARGET_KEYS = ("z3-target-mirror-radius-lt", "z3-target-mirror-radius-gt")
POSITIVE_CONTROL_KEYS = ("z3-control-positive",)
NEGATIVE_CONTROL_KEYS = ("z3-control-negative",)
_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_profile0034_supporting_edge_named_core_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_supporting_edge_named_core_piqd.py",
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-supporting-edge-named-core-v1.md",
    "scripts/run_exactfive_hard_source_swap_profile0034_supporting_edge_named_core_piqd.py",
]
_ENGINE_KEYS = frozenset(
    {
        "solver",
        "session_id",
        "solver_signature",
        "solver_sha256",
        "raw_status",
        "effective_status",
        "solve_index",
        "result_sha256",
        "response_lost",
        "reconciled_from_receipt",
        "reconciliation_attempts",
        "result_digest_advisory",
        "unsat_assumptions",
        "semantic_replay",
        "artifacts",
        "claims",
        "request_id",
        "request_sha256",
        "assumption_labels",
        "request_replay_attempted",
        "request_replayed",
        "resumed_from_receipt",
        "session_lifecycle",
    }
)
_RESULT_KEYS = frozenset(
    {
        "schema",
        "key",
        "solver",
        "source_id",
        "assumption_count",
        "source_system_sha256",
        "source_ledger_sha256",
        "assumption_label_sha256",
        "engine",
        "custody",
        "claims",
        "result_sha256",
    }
)
_TOMBSTONE = re.compile(
    r"\.piqd-smt-tombstone-[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-"
    r"[89ab][0-9a-f]{3}-[0-9a-f]{12}\Z"
)
_FULL_COMMIT = re.compile(r"^[0-9a-f]{40}$")


class Profile0034SupportingEdgeNamedCoreError(RuntimeError):
    """The governed named-core lane failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    solver: str
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery
    assumption_labels: tuple[str, ...]


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, allow_nan=False, sort_keys=True, separators=(",", ":")
    ).encode("ascii")


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _read(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            f"missing custody file: {path}"
        ) from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise Profile0034SupportingEdgeNamedCoreError(f"unsafe custody file: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile0034SupportingEdgeNamedCoreError(
            f"custody file changed while reading: {path}"
        )
    return payload


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            f"{where} is not strict JSON"
        ) from exc
    if type(value) is not dict:
        raise Profile0034SupportingEdgeNamedCoreError(f"{where} is not an object")
    return value


def _publish_once(path: Path, payload: bytes) -> None:
    try:
        source._create_once(path, payload)
    except source.Profile0034SupportingEdgeError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            f"immutable publication failed: {path}"
        ) from exc


def _repo_path(path: Path) -> str:
    return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()


def _source_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read(path)) for path in sorted(paths)}


def authenticate_aborted_run() -> dict[str, Any]:
    """Pin the pre-submission run-0001 failure without treating it as resumable."""

    if ABORTED_ROOT.is_symlink() or not ABORTED_ROOT.is_dir():
        raise Profile0034SupportingEdgeNamedCoreError("aborted run root is unsafe")
    if {entry.name for entry in ABORTED_ROOT.iterdir()} != {
        "run_manifest.json",
        "artifacts",
        "events",
        "tmp",
    }:
        raise Profile0034SupportingEdgeNamedCoreError("aborted run inventory drifted")
    for name in ("artifacts", "events", "tmp"):
        path = ABORTED_ROOT / name
        if path.is_symlink() or not path.is_dir() or tuple(path.iterdir()):
            raise Profile0034SupportingEdgeNamedCoreError(
                "aborted run contains submitted work"
            )
    payload = _read(ABORTED_MANIFEST_PATH)
    manifest = _strict(payload, "aborted run manifest")
    if (
        _sha(payload) != ABORTED_MANIFEST_FILE_SHA256
        or manifest.get("schema") != RUN_MANIFEST_SCHEMA
        or manifest.get("lane_id") != LANE_ID
        or manifest.get("run_id") != ABORTED_RUN_ID
        or manifest.get("root")
        != f"scratch/runs/{LANE_ID}/{ABORTED_RUN_ID}"
        or manifest.get("manifest_sha256") != ABORTED_MANIFEST_SHA256
        or manifest.get("manifest_sha256")
        != _self_hash(manifest, "manifest_sha256")
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "aborted run manifest custody drifted"
        )
    source_digests = manifest.get("source_digests")
    input_digests = manifest.get("input_digests")
    if type(source_digests) is not dict or type(input_digests) is not dict:
        raise Profile0034SupportingEdgeNamedCoreError(
            "aborted run digest inventory is malformed"
        )
    for relative, digest in source_digests.items():
        if type(relative) is not str or type(digest) is not str:
            raise Profile0034SupportingEdgeNamedCoreError(
                "aborted source digest is malformed"
            )
        committed = _git_read(
            ("show", f"{ABORTED_EXECUTION_COMMIT}:{relative}"), relative
        )
        if _sha(committed) != digest:
            raise Profile0034SupportingEdgeNamedCoreError(
                f"aborted execution source drifted: {relative}"
            )
    for relative, digest in input_digests.items():
        if (
            type(relative) is not str
            or type(digest) is not str
            or _sha(_read(REPOSITORY_ROOT / relative)) != digest
        ):
            raise Profile0034SupportingEdgeNamedCoreError(
                f"aborted run input drifted: {relative}"
            )
    return manifest


def _authenticate_parent_execution_commit(
    manifest: Mapping[str, Any], launch: Mapping[str, Any]
) -> str:
    execution_commit = launch.get("execution_commit")
    source_digests = manifest.get("source_digests")
    if (
        type(execution_commit) is not str
        or _FULL_COMMIT.fullmatch(execution_commit) is None
        or type(source_digests) is not dict
        or not source_digests
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "parent execution-commit custody is malformed"
        )
    for relative, digest in source_digests.items():
        if type(relative) is not str or type(digest) is not str:
            raise Profile0034SupportingEdgeNamedCoreError(
                "parent execution source is malformed"
            )
        current = _read(REPOSITORY_ROOT / relative)
        committed = _git_read(("show", f"{execution_commit}:{relative}"), relative)
        if _sha(current) != digest or committed != current:
            raise Profile0034SupportingEdgeNamedCoreError(
                f"parent execution source drifted: {relative}"
            )
    return execution_commit


def authenticate_parent_run() -> dict[str, Any]:
    """Reconstruct the immutable supporting-edge parent and all six results."""

    if _sha(_read(Path(source.__file__))) != PARENT_PRODUCER_SHA256:
        raise Profile0034SupportingEdgeNamedCoreError("parent producer bytes drifted")
    manifest_payload = _read(PARENT_MANIFEST_PATH)
    launch_payload = _read(PARENT_LAUNCH_PATH)
    terminal_payload = _read(PARENT_TERMINAL_PATH)
    if (
        _sha(manifest_payload) != PARENT_MANIFEST_FILE_SHA256
        or _sha(launch_payload) != PARENT_LAUNCH_FILE_SHA256
        or _sha(terminal_payload) != PARENT_TERMINAL_FILE_SHA256
    ):
        raise Profile0034SupportingEdgeNamedCoreError("parent record bytes drifted")
    try:
        root, manifest = source.ensure_run_root()
        launch = source._strict_json(launch_payload, "parent launch")
        terminal = source._read_terminal(PARENT_TERMINAL_PATH)
    except (source.Profile0034SupportingEdgeError, OSError, ValueError) as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "parent root validation failed"
        ) from exc
    if (
        root != PARENT_ROOT
        or manifest.get("manifest_sha256") != PARENT_MANIFEST_SHA256
        or launch.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or terminal.get("terminal_sha256") != PARENT_TERMINAL_SHA256
        or terminal.get("status") != "TARGET_INCONCLUSIVE"
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "parent identity or terminal status drifted"
        )
    timeout_ms = launch.get("timeout_ms")
    if type(timeout_ms) is not int:
        raise Profile0034SupportingEdgeNamedCoreError("parent timeout is malformed")
    try:
        predecessor = source.authenticate_predecessor_run()
    except source.Profile0034SupportingEdgeError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "parent predecessor custody failed"
        ) from exc
    systems = {
        "control-positive": source.build_control_system("positive"),
        "control-negative": source.build_control_system("negative"),
        **{
            source._target_key(order_id, branch_id): source._build_target_from_prior(
                predecessor, order_id, branch_id
            )
            for order_id in source.ORDER_IDS
            for branch_id in source.BRANCH_IDS
        },
    }
    prepared = {
        key: source._prepare_query_with_prior(
            system, predecessor, timeout_ms=timeout_ms
        )
        for key, system in systems.items()
    }
    try:
        results = {
            key: source.verify_adapter_tree(item, root / "artifacts" / key)
            for key, item in prepared.items()
        }
        source._require_control("control-positive", results["control-positive"])
        source._require_control("control-negative", results["control-negative"])
        expected = source._terminal_record(root, launch, results)
        execution_commit = _authenticate_parent_execution_commit(manifest, launch)
    except (source.Profile0034SupportingEdgeError, OSError, ValueError) as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "parent result replay failed"
        ) from exc
    result_hashes = {
        key: _sha(_read(root / "artifacts" / key / "result.json")) for key in prepared
    }
    mirror_statuses = {
        key: [
            [engine.get("solver"), engine.get("raw_status")]
            for engine in results[key].get("engines", [])
        ]
        for key in (
            "parent-z3-mirror-radius-lt",
            "parent-z3-mirror-radius-gt",
        )
    }
    if (
        terminal != expected
        or launch.get("execution_commit") != execution_commit
        or result_hashes != EXPECTED_PARENT_RESULTS
        or mirror_statuses
        != {
            "parent-z3-mirror-radius-lt": [["z3", "UNSAT"], ["cvc5", "UNKNOWN"]],
            "parent-z3-mirror-radius-gt": [["z3", "UNSAT"], ["cvc5", "UNKNOWN"]],
        }
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "parent terminal does not reconstruct"
        )
    record = {
        "schema": "p97-exactfive-profile0034-supporting-edge-parent-custody/v1",
        "producer_sha256": PARENT_PRODUCER_SHA256,
        "run_manifest_file_sha256": PARENT_MANIFEST_FILE_SHA256,
        "run_manifest_sha256": PARENT_MANIFEST_SHA256,
        "launch_file_sha256": PARENT_LAUNCH_FILE_SHA256,
        "launch_sha256": PARENT_LAUNCH_SHA256,
        "terminal_file_sha256": PARENT_TERMINAL_FILE_SHA256,
        "terminal_sha256": PARENT_TERMINAL_SHA256,
        "terminal_status": terminal["status"],
        "execution_commit": execution_commit,
        "result_file_sha256": result_hashes,
        "mirror_engine_statuses": mirror_statuses,
        "source_systems": systems,
        "claims": dict(FALSE_CLAIMS),
    }
    record["parent_custody_sha256"] = _self_hash(record, "parent_custody_sha256")
    return record


def _source_system(source_id: str) -> dict[str, Any]:
    if source_id == "control-positive":
        return source.build_control_system("positive")
    if source_id == "control-negative":
        return source.build_control_system("negative")
    targets = {
        "parent-z3-mirror-radius-lt": ("parent-z3-mirror", "lt"),
        "parent-z3-mirror-radius-gt": ("parent-z3-mirror", "gt"),
    }
    if source_id in targets:
        return source.build_target_system(*targets[source_id])
    raise Profile0034SupportingEdgeNamedCoreError(f"unknown source system: {source_id}")


def _target_ledger(system: Mapping[str, Any]) -> list[dict[str, Any]]:
    ledger: list[dict[str, Any]] = []
    for index, entry in enumerate(system["supporting_edges"]):
        body = f"(> {entry['expression']} 0)"
        ledger.append(
            {
                "family": "supporting-edge",
                "index": index,
                "source_entry": entry,
                "source_commands": [f"(assert {body})"],
                "source_body": body,
            }
        )
    for index, entry in enumerate(system["source_row_equalities"]):
        body = f"(= {entry['left']} {entry['right']})"
        ledger.append(
            {
                "family": "source-row-equality",
                "index": index,
                "source_entry": entry,
                "source_commands": [f"(assert {body})"],
                "source_body": body,
            }
        )
    radius = system["radius_branch"]
    strict = system["source_strict"]
    for family, entry, body in (
        (
            "radius-branch",
            radius,
            f"({radius['relation']} {radius['left']} {radius['right']})",
        ),
        ("source-strict", strict, f"(< {strict['left']} {strict['right']})"),
    ):
        ledger.append(
            {
                "family": family,
                "index": 0,
                "source_entry": entry,
                "source_commands": [f"(assert {body})"],
                "source_body": body,
            }
        )
    family_counts = {
        family: sum(entry["family"] == family for entry in ledger)
        for family in (
            "supporting-edge",
            "source-row-equality",
            "radius-branch",
            "source-strict",
        )
    }
    if len(ledger) != 156 or family_counts != {
        "supporting-edge": 143,
        "source-row-equality": 11,
        "radius-branch": 1,
        "source-strict": 1,
    }:
        raise Profile0034SupportingEdgeNamedCoreError(
            "target named ledger count drifted"
        )
    source_assertions = [
        command
        for command in source._build_smt_commands_current(system)
        if command.startswith("(assert ")
    ]
    expanded = [command for entry in ledger for command in entry["source_commands"]]
    if source_assertions != expanded:
        raise Profile0034SupportingEdgeNamedCoreError(
            "named target ledger does not expand to the source"
        )
    return ledger


def _control_ledger(system: Mapping[str, Any]) -> list[dict[str, Any]]:
    assertions = [
        command
        for command in source._build_smt_commands_current(system)
        if command.startswith("(assert ")
    ]
    return [
        {
            "family": f"control-{system['control']}",
            "index": index,
            "source_entry": {"command": command},
            "source_commands": [command],
            "source_body": command[len("(assert ") : -1],
        }
        for index, command in enumerate(assertions)
    ]


def _assumption_id(family: str, index: int) -> str:
    prefixes = {
        "supporting-edge": "supporting-edge",
        "source-row-equality": "source-row-equality",
        "radius-branch": "radius-branch",
        "source-strict": "source-strict",
        "control-positive": "control-positive",
        "control-negative": "control-negative",
    }
    return f"{prefixes[family]}-{index:03d}"


def _build_named_from_original(
    source_id: str, solver: str, original: Mapping[str, Any]
) -> dict[str, Any]:
    if solver != "z3":
        raise Profile0034SupportingEdgeNamedCoreError(
            "this lane admits only Z3 through PIQD"
        )
    if type(original) is not dict or original.get("schema") != source.SYSTEM_SCHEMA:
        raise Profile0034SupportingEdgeNamedCoreError("source system is malformed")
    if original.get("claims") != source.FALSE_CLAIMS:
        raise Profile0034SupportingEdgeNamedCoreError("source claims drifted")
    if source_id.startswith("control-"):
        control = source_id.removeprefix("control-")
        if original != source.build_control_system(control):
            raise Profile0034SupportingEdgeNamedCoreError("control source drifted")
    else:
        expected_cells = {
            "parent-z3-mirror-radius-lt": ("parent-z3-mirror", "lt"),
            "parent-z3-mirror-radius-gt": ("parent-z3-mirror", "gt"),
        }
        cell = expected_cells.get(source_id)
        if (
            cell is None
            or original.get("kind") != "target"
            or (original.get("order_id"), original.get("branch_id")) != cell
            or original.get("key") != source_id
            or original.get("profile_index") != source.PROFILE_INDEX
            or original.get("profile_sha256") != source.PROFILE_SHA256
        ):
            raise Profile0034SupportingEdgeNamedCoreError("target source drifted")
    ledger = (
        _target_ledger(original)
        if original["kind"] == "target"
        else _control_ledger(original)
    )
    source_system_sha256 = _sha(_canonical(original))
    source_ledger_sha256 = _sha(_canonical(ledger))
    bindings = []
    for entry in ledger:
        assumption_id = _assumption_id(entry["family"], entry["index"])
        binding = {
            "schema": "p97-profile0034-supporting-edge-named-assumption-label/v1",
            "assumption_id": assumption_id,
            "assumption_term": "assume_" + assumption_id.replace("-", "_"),
            "family": entry["family"],
            "index": entry["index"],
            "source_ledger_entry": entry["source_entry"],
            "source_commands": entry["source_commands"],
            "source_body": entry["source_body"],
            "source_system_sha256": source_system_sha256,
            "source_ledger_sha256": source_ledger_sha256,
        }
        binding["label_sha256"] = _self_hash(binding, "label_sha256")
        bindings.append(binding)
    unguarded_commands = source._build_smt_commands_current(original)
    system = {
        "schema": SYSTEM_SCHEMA,
        "solver": solver,
        "source_id": source_id,
        "source_system": original,
        "source_system_sha256": source_system_sha256,
        "source_unguarded_commands": list(unguarded_commands),
        "source_unguarded_journal_sha256": _sha(
            b"".join(command.encode("ascii") + b"\n" for command in unguarded_commands)
        ),
        "source_ledger": ledger,
        "source_ledger_sha256": source_ledger_sha256,
        "assumption_bindings": bindings,
        "claims": dict(FALSE_CLAIMS),
    }
    return system


def build_named_system(
    source_id: str,
    solver: str,
    parent: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    if parent is None:
        original = _source_system(source_id)
    else:
        source_systems = parent.get("source_systems")
        if type(source_systems) is not dict or source_id not in source_systems:
            raise Profile0034SupportingEdgeNamedCoreError(
                "parent source-system custody is absent"
            )
        original = source_systems[source_id]
    return _build_named_from_original(source_id, solver, original)


def _validate_named_system(value: object) -> dict[str, Any]:
    if type(value) is not dict or value.get("schema") != SYSTEM_SCHEMA:
        raise Profile0034SupportingEdgeNamedCoreError("named system is malformed")
    expected = _build_named_from_original(
        value.get("source_id"), value.get("solver"), value.get("source_system")
    )
    if value != expected:
        raise Profile0034SupportingEdgeNamedCoreError(
            "named system drifted from the source ledger"
        )
    return dict(value)


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    current = _validate_named_system(system)
    unguarded = tuple(current["source_unguarded_commands"])
    assertion_offset = next(
        (
            index
            for index, command in enumerate(unguarded)
            if command.startswith("(assert ")
        ),
        len(unguarded),
    )
    prefix = unguarded[:assertion_offset]
    expanded = tuple(
        command
        for binding in current["assumption_bindings"]
        for command in binding["source_commands"]
    )
    if prefix + expanded != unguarded:
        raise Profile0034SupportingEdgeNamedCoreError(
            "guarded journal does not reconstruct the parent journal"
        )
    out = list(prefix)
    out.extend(
        f"(declare-fun {binding['assumption_term']} () Bool)"
        for binding in current["assumption_bindings"]
    )
    out.extend(
        f"(assert (=> {binding['assumption_term']} {binding['source_body']}))"
        for binding in current["assumption_bindings"]
    )
    return tuple(out)


def _source_snapshots(
    parent: Mapping[str, Any], system: Mapping[str, Any]
) -> tuple[adapter.SourceSnapshot, ...]:
    unguarded = b"".join(
        command.encode("ascii") + b"\n"
        for command in system["source_unguarded_commands"]
    )
    snapshots = [
        adapter.SourceSnapshot("0000-parent-custody.json", _json(parent)),
        adapter.SourceSnapshot("0001-named-system.json", _json(system)),
        adapter.SourceSnapshot(
            "aborted-run-0001-manifest.json", _read(ABORTED_MANIFEST_PATH)
        ),
        adapter.SourceSnapshot("parent-run-manifest.json", _read(PARENT_MANIFEST_PATH)),
        adapter.SourceSnapshot("parent-launch.json", _read(PARENT_LAUNCH_PATH)),
        adapter.SourceSnapshot("parent-terminal.json", _read(PARENT_TERMINAL_PATH)),
        adapter.SourceSnapshot("source-unguarded.smt2", unguarded),
        adapter.SourceSnapshot("implementation-named-core.py", _read(Path(__file__))),
        adapter.SourceSnapshot(
            "implementation-parent.py", _read(Path(source.__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-adapter.py", _read(Path(adapter.__file__))
        ),
        adapter.SourceSnapshot("tests.py", _read(TEST_PATH)),
        adapter.SourceSnapshot("runner.py", _read(RUNNER_PATH)),
        adapter.SourceSnapshot("checkpoint.json", _read(CHECKPOINT_PATH)),
        adapter.SourceSnapshot("specification.md", _read(SPEC_PATH)),
    ]
    snapshots.extend(
        adapter.SourceSnapshot(
            f"parent-result-{key}.json",
            _read(PARENT_ROOT / "artifacts" / key / "result.json"),
        )
        for key in sorted(EXPECTED_PARENT_RESULTS)
    )
    return tuple(sorted(snapshots, key=lambda item: item.path))


def prepare_query(
    key: str,
    *,
    timeout_ms: int = 60_000,
    parent: Mapping[str, Any] | None = None,
) -> PreparedQuery:
    plan = {row[0]: row[1:] for row in QUERY_PLAN}
    if key not in plan:
        raise Profile0034SupportingEdgeNamedCoreError(f"unknown query key: {key}")
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= 3_600_000
    ):
        raise Profile0034SupportingEdgeNamedCoreError("query timeout is invalid")
    solver, source_id = plan[key]
    parent_record = dict(parent or authenticate_parent_run())
    if parent_record.get("parent_custody_sha256") != _self_hash(
        parent_record, "parent_custody_sha256"
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "parent custody record is not self-hashed"
        )
    system = build_named_system(source_id, solver, parent_record)
    commands = build_smt_commands(system)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    try:
        normalized, normalized_journal = adapter.normalize_state_journal(journal)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "named journal is not accepted by the adapter"
        ) from exc
    if normalized != commands or normalized_journal != journal:
        raise Profile0034SupportingEdgeNamedCoreError(
            "named journal normalization drifted"
        )
    variables = sorted(
        (
            {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
            for variable in system["source_system"]["variables"]
        ),
        key=lambda item: item["id"],
    )
    bindings = system["assumption_bindings"]
    named_atoms = sorted(
        (
            {
                "id": binding["assumption_id"],
                "assumption_term": binding["assumption_term"],
            }
            for binding in bindings
        ),
        key=lambda item: item["id"],
    )
    assumption_labels = tuple(binding["label_sha256"] for binding in bindings)
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "parent_custody_sha256": parent_record["parent_custody_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _source_snapshots(parent_record, system)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {
            "id": "p97-profile0034-supporting-edge-named-core-piqd",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "profile0034-supporting-edge-unguarded-exact-rational-replay",
            "version": "v1",
        },
        "stage_id": "exactfive-profile0034-supporting-edge-named-core",
        "query_id": key,
        "sources": [
            {
                "path": item.path,
                "bytes": len(item.payload),
                "sha256": _sha(item.payload),
            }
            for item in snapshots
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "query.smt2",
            "bytes": len(journal),
            "sha256": _sha(journal),
        },
        "variables": variables,
        "named_atoms": named_atoms,
        "solve": {
            "assumption_ids": [binding["assumption_id"] for binding in bindings],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": SOLVER_PROFILE_SCHEMA,
            "solvers": [solver],
            "timeout_ms": timeout_ms,
        },
    }
    query = adapter.SourceSemanticQuery(
        descriptor, _json(descriptor), journal, commands, journal, snapshots
    )
    return PreparedQuery(key, solver, system, query, assumption_labels)


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or type(values) is not str or type(model) is not str:
        raise Profile0034SupportingEdgeNamedCoreError("SAT replay payload is malformed")
    system = _validate_named_system(semantic.get("system"))
    if solver != system["solver"]:
        raise Profile0034SupportingEdgeNamedCoreError("SAT replay solver is crossed")
    timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
    source_id = system["source_id"]
    unguarded = source.prepare_query(system["source_system"], timeout_ms=timeout_ms)
    verification = source.verify_sat_model(unguarded.query, solver, model, values)
    evidence = {
        "accepted": verification.accepted,
        "unguarded_exact_replay": verification.evidence,
        "unguarded_source_system_sha256": system["source_system_sha256"],
        "unguarded_journal_sha256": system["source_unguarded_journal_sha256"],
        "guarded_assumption_count": len(system["assumption_bindings"]),
        "source_id": source_id,
    }
    return adapter.SemanticVerification(verification.accepted, evidence)


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise Profile0034SupportingEdgeNamedCoreError("artifact record is malformed")
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen:
        raise Profile0034SupportingEdgeNamedCoreError(
            "artifact path is unsafe or duplicated"
        )
    payload = _read(root / name)
    if (
        type(record["bytes"]) is not int
        or record["bytes"] != len(payload)
        or record["sha256"] != _sha(payload)
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            f"artifact digest drifted: {name}"
        )
    seen.add(name)
    return payload


def _read_fd_artifact(directory_fd: int, name: str) -> bytes:
    descriptor = os.open(
        name, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0), dir_fd=directory_fd
    )
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise Profile0034SupportingEdgeNamedCoreError("staged artifact is unsafe")
        chunks: list[bytes] = []
        while True:
            chunk = os.read(descriptor, 65536)
            if not chunk:
                break
            chunks.append(chunk)
        payload = b"".join(chunks)
        if len(payload) != info.st_size:
            raise Profile0034SupportingEdgeNamedCoreError(
                "staged artifact changed while reading"
            )
        return payload
    finally:
        os.close(descriptor)


def _query_request_id(key: str) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


def _named_label(prepared: PreparedQuery) -> tuple[str, str]:
    profile_sha256 = _sha(_canonical(prepared.query.descriptor["solver_profile"]))
    base = (
        f"p97-smt-source/{prepared.key}/{prepared.solver}/"
        f"{prepared.query.descriptor['semantic_sha256'][:12]}"
    )
    return (
        f"{base}/{_query_request_id(prepared.key)}/{profile_sha256[:12]}",
        profile_sha256,
    )


def _validate_named_artifact_payloads(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
) -> tuple[dict[str, Any], dict[str, Any] | None]:
    label, profile_sha256 = _named_label(prepared)
    request_id = _query_request_id(prepared.key)
    request_sha256 = adapter.piqd_solve_request_digest(
        prepared.query, prepared.assumption_labels
    )
    create_request = {"solver": prepared.solver, "lane": "smt", "label": label}
    expected_create = {
        "schema": "piqd-smt-session-create-request/v1",
        "request": create_request,
        "request_id": request_id,
        "session_label": label,
        "solver_profile": prepared.query.descriptor["solver_profile"],
        "solver_profile_sha256": profile_sha256,
    }
    if (
        _strict(payloads["session_create_request"], "session create request")
        != expected_create
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "named session create request drifted"
        )
    if (
        payloads["pre_append_smt2"] != b""
        or payloads["expected_post_append_smt2"] != prepared.query.journal_smt2
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "named journal frontier bytes drifted"
        )
    artifacts = engine["artifacts"]
    expected_frontiers = {
        "schema": "piqd-smt-journal-frontiers/v1",
        "append_request": {
            "commands": list(prepared.query.journal_commands),
            "expect_commands": 0,
        },
        "pre": {
            "commands": 0,
            "bytes": 0,
            "sha256": _sha(b""),
            "artifact": artifacts["pre_append_smt2"],
        },
        "post": {
            "commands": len(prepared.query.journal_commands),
            "bytes": len(prepared.query.journal_smt2),
            "sha256": _sha(prepared.query.journal_smt2),
            "artifact": artifacts["expected_post_append_smt2"],
        },
    }
    if (
        _strict(payloads["journal_frontiers"], "journal frontiers")
        != expected_frontiers
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "named journal frontier record drifted"
        )
    solve_request = {
        "assumptions": list(prepared.query.assumptions),
        "timeout_ms": prepared.query.descriptor["solver_profile"]["timeout_ms"],
        "include_model": True,
        "get_values": list(prepared.query.get_values),
        "assumption_labels": list(prepared.assumption_labels),
        "request_id": request_id,
    }
    expected_request = {
        "schema": "piqd-smt-solve-request/v1",
        "journal_frontier": {
            "base_commands": len(prepared.query.journal_commands),
            "base_bytes": len(prepared.query.journal_smt2),
            "base_sha256": _sha(prepared.query.journal_smt2),
        },
        "request": solve_request,
        "request_id": request_id,
        "request_sha256": request_sha256,
    }
    if _strict(payloads["solve_request"], "solve request") != expected_request:
        raise Profile0034SupportingEdgeNamedCoreError("named solve request drifted")
    try:
        session = adapter._validate_session(
            _strict(payloads["session"], "session"),
            solver=prepared.solver,
            label=label,
            expected_state="live",
        )
        adapter._validate_fresh_session(session)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "named session custody failed"
        ) from exc
    if payloads["smt2"] != prepared.query.journal_smt2:
        raise Profile0034SupportingEdgeNamedCoreError("exported journal does not match")
    raw = engine["raw_status"]
    solve: dict[str, Any] | None = None
    if raw is not None:
        solve_label = "reconciled_solve" if engine["response_lost"] else "solve"
        try:
            solve = adapter._validate_solve(
                _strict(payloads[solve_label], "named solve"),
                timeout_ms=prepared.query.descriptor["solver_profile"]["timeout_ms"],
                assumptions=prepared.query.assumptions,
                assumption_labels=prepared.assumption_labels,
                named_request=True,
                replay_retry=engine["request_replayed"] is True,
            )
        except adapter.SmtSourceAdapterError as exc:
            raise Profile0034SupportingEdgeNamedCoreError(
                "named solve custody failed"
            ) from exc
    try:
        _, prior = adapter._validate_receipts(
            _strict(payloads["receipts_before"], "prior receipts"),
            session=session,
            query=prepared.query,
            solve=None,
            expected_count=0,
            request_id=request_id,
            request_sha256=request_sha256,
            assumption_labels=prepared.assumption_labels,
        )
        _, receipt = adapter._validate_receipts(
            _strict(payloads["receipts"], "receipts"),
            session=session,
            query=prepared.query,
            solve=solve,
            expected_count=0 if solve is None else 1,
            request_id=request_id,
            request_sha256=request_sha256,
            assumption_labels=prepared.assumption_labels,
        )
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "named receipt custody failed"
        ) from exc
    if prior is not None:
        raise Profile0034SupportingEdgeNamedCoreError(
            "fresh named session has a prior receipt"
        )
    lifecycle_payload = _strict(payloads["session_lifecycle"], "session lifecycle")
    try:
        lifecycle = adapter._validate_session_lifecycle(lifecycle_payload)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "named lifecycle custody failed"
        ) from exc
    if (
        lifecycle != engine["session_lifecycle"]
        or lifecycle["request_id"] != request_id
        or lifecycle["session_id"] != session["id"]
        or lifecycle["session_label"] != label
        or lifecycle["solver_profile_sha256"] != profile_sha256
        or lifecycle["resume_policy"] is not None
        or lifecycle["resumed_existing_session"] is not False
        or lifecycle["resumed_from_receipt"] is not False
    ):
        raise Profile0034SupportingEdgeNamedCoreError("named lifecycle is cross-bound")
    if "closed_session" in payloads:
        try:
            closed = adapter._validate_session(
                _strict(payloads["closed_session"], "closed session"),
                solver=prepared.solver,
                label=label,
                expected_state="closed",
            )
            adapter._validate_closed_session(
                closed, created=session, query=prepared.query, solve=solve
            )
        except adapter.SmtSourceAdapterError as exc:
            raise Profile0034SupportingEdgeNamedCoreError(
                "named closed-session custody failed"
            ) from exc
    if "reconciliation_session" in payloads:
        try:
            reconciled = adapter._validate_session(
                _strict(payloads["reconciliation_session"], "reconciliation session"),
                solver=prepared.solver,
                label=label,
                expected_state="live",
            )
            adapter._validate_session_frontier(
                reconciled, created=session, query=prepared.query, solve=solve
            )
        except adapter.SmtSourceAdapterError as exc:
            raise Profile0034SupportingEdgeNamedCoreError(
                "named reconciliation custody failed"
            ) from exc
    return session, receipt


def _validate_core(prepared: PreparedQuery, engine: Mapping[str, Any]) -> None:
    provenance = engine.get("unsat_assumptions")
    if (
        engine.get("raw_status") != "UNSAT"
        or engine.get("effective_status") != "UNSAT_DISCOVERY_ONLY"
        or type(provenance) is not dict
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "UNSAT core status or provenance is absent"
        )
    terms = provenance.get("assumption_terms")
    ids = provenance.get("source_atom_ids")
    labels = provenance.get("core_labels")
    binding_rows = prepared.system["assumption_bindings"]
    bindings = {binding["assumption_term"]: binding for binding in binding_rows}
    selected = [bindings.get(term) for term in terms] if type(terms) is list else []
    if (
        not selected
        or type(ids) is not list
        or type(labels) is not list
        or len(terms) != len(ids)
        or len(ids) != len(labels)
        or len(set(terms)) != len(terms)
        or len(bindings) != len(binding_rows)
        or prepared.assumption_labels
        != tuple(binding["label_sha256"] for binding in binding_rows)
        or any(
            binding["label_sha256"] != _self_hash(binding, "label_sha256")
            for binding in binding_rows
        )
        or any(binding is None for binding in selected)
        or ids != [binding["assumption_id"] for binding in selected]
        or labels != [binding["label_sha256"] for binding in selected]
        or provenance.get("terminal_unsat") is not False
        or provenance.get("named_core_support") is not True
        or provenance.get("ordered_assumption_labels")
        != list(prepared.assumption_labels)
        or provenance.get("basis") != "get-unsat-assumptions"
        or provenance.get("daemon_field") != "core"
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "UNSAT core is empty, terminal, or cross-bound"
        )


def _expected_semantic(
    prepared: PreparedQuery, solve: Mapping[str, Any]
) -> dict[str, Any]:
    verification = verify_sat_model(
        prepared.query, prepared.solver, solve.get("model"), solve.get("values")
    )
    return {
        "accepted": verification.accepted,
        "evidence": verification.evidence,
        "verifier": prepared.query.descriptor["semantic_verifier"],
        "model_sha256": _sha(solve["model"].encode("utf-8")),
        "values_sha256": _sha(solve["values"].encode("utf-8")),
    }


def _validate_engine(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
) -> str:
    if type(engine) is not dict or set(engine) != _ENGINE_KEYS:
        raise Profile0034SupportingEdgeNamedCoreError("named engine key set drifted")
    raw = engine["raw_status"]
    if raw not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise Profile0034SupportingEdgeNamedCoreError(
            "named engine status is unsupported"
        )
    lifecycle = engine["session_lifecycle"]
    if type(lifecycle) is not dict:
        raise Profile0034SupportingEdgeNamedCoreError("named lifecycle is absent")
    expected_artifacts = {
        "session_create_request",
        "pre_append_smt2",
        "expected_post_append_smt2",
        "journal_frontiers",
        "solve_request",
        "session",
        "smt2",
        "receipts_before",
        "receipts",
        "session_lifecycle",
    }
    if lifecycle.get("close_observed_state") != "closed":
        raise Profile0034SupportingEdgeNamedCoreError(
            "named session closure was not observed"
        )
    expected_artifacts.add("closed_session")
    if raw is not None:
        expected_artifacts.add(
            "reconciled_solve" if engine["response_lost"] else "solve"
        )
    if raw == "SAT":
        expected_artifacts.add("semantic")
    if "reconciliation_session" in payloads:
        if engine["response_lost"] is not True or raw is None:
            raise Profile0034SupportingEdgeNamedCoreError(
                "unexpected reconciliation session"
            )
        expected_artifacts.add("reconciliation_session")
    if set(payloads) != expected_artifacts:
        raise Profile0034SupportingEdgeNamedCoreError(
            "named engine artifact inventory drifted"
        )
    session, receipt = _validate_named_artifact_payloads(prepared, engine, payloads)
    request_id = _query_request_id(prepared.key)
    request_sha256 = adapter.piqd_solve_request_digest(
        prepared.query, prepared.assumption_labels
    )
    if (
        engine["solver"] != prepared.solver
        or engine["session_id"] != session["id"]
        or engine["solver_signature"] != session["solver_signature"]
        or engine["solver_sha256"] != session["solver_sha256"]
        or engine["request_id"] != request_id
        or engine["request_sha256"] != request_sha256
        or engine["assumption_labels"] != list(prepared.assumption_labels)
        or engine["claims"] != adapter.FALSE_CLAIMS
        or type(engine["response_lost"]) is not bool
        or type(engine["reconciled_from_receipt"]) is not bool
        or type(engine["request_replay_attempted"]) is not bool
        or not (
            engine["request_replayed"] is None
            or type(engine["request_replayed"]) is bool
        )
        or engine["resumed_from_receipt"] is not False
        or type(engine["reconciliation_attempts"]) is not int
        or engine["reconciliation_attempts"] < 0
        or (not engine["response_lost"] and engine["reconciliation_attempts"] != 0)
        or (engine["reconciled_from_receipt"] and not engine["response_lost"])
        or (engine["request_replay_attempted"] and not engine["response_lost"])
        or (not engine["response_lost"] and engine["request_replayed"] is not False)
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "named engine identity or replay state drifted"
        )
    solve: dict[str, Any] | None = None
    if raw is not None:
        solve_label = "reconciled_solve" if engine["response_lost"] else "solve"
        solve = _strict(payloads[solve_label], "named solve")
        digest = adapter.piqd_result_digest(solve)
        advisory = engine["result_digest_advisory"]
        expected_provenance = adapter._unsat_assumption_provenance(
            prepared.query, solve, prepared.assumption_labels
        )
        if (
            receipt is None
            or solve.get("status") != raw
            or solve.get("solve_index") != engine["solve_index"]
            or solve.get("result_sha256") != digest
            or receipt.get("result_sha256") != digest
            or engine["result_sha256"] != digest
            or engine["unsat_assumptions"] != expected_provenance
            or type(advisory) is not dict
            or set(advisory) != {"algorithm", "locally_recomputed", "matches_daemon"}
            or advisory["algorithm"] != "piqd-smt-solve-result/v1"
            or advisory["locally_recomputed"] != digest
            or advisory["matches_daemon"] is not True
        ):
            raise Profile0034SupportingEdgeNamedCoreError(
                "named solve digest or receipt drifted"
            )
    elif (
        receipt is not None
        or engine["effective_status"] != "INCONCLUSIVE_TRANSPORT_LOSS"
        or engine["solve_index"] is not None
        or engine["result_sha256"] is not None
        or engine["result_digest_advisory"] is not None
        or engine["unsat_assumptions"] is not None
        or engine["semantic_replay"] is not None
        or engine["response_lost"] is not True
        or engine["reconciled_from_receipt"] is not False
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "transport-loss status custody drifted"
        )
    if prepared.key in POSITIVE_CONTROL_KEYS:
        if raw != "SAT" or engine["effective_status"] != "SAT_SEMANTICALLY_REPLAYED":
            raise Profile0034SupportingEdgeNamedCoreError(
                "positive named control failed"
            )
    elif prepared.key in NEGATIVE_CONTROL_KEYS:
        if raw != "UNSAT":
            raise Profile0034SupportingEdgeNamedCoreError(
                "negative named control failed"
            )
        _validate_core(prepared, engine)
    elif prepared.key in TARGET_KEYS:
        if raw != "UNSAT":
            raise Profile0034SupportingEdgeNamedCoreError(
                "target did not return a Z3 named core"
            )
        _validate_core(prepared, engine)
    else:
        raise Profile0034SupportingEdgeNamedCoreError(
            "query key is outside the fixed plan"
        )
    if raw == "SAT":
        if solve is None:
            raise Profile0034SupportingEdgeNamedCoreError("SAT solve is absent")
        semantic = engine["semantic_replay"]
        if (
            engine["effective_status"] != "SAT_SEMANTICALLY_REPLAYED"
            or "semantic" not in payloads
            or _strict(payloads["semantic"], "semantic replay") != semantic
            or semantic != _expected_semantic(prepared, solve)
            or semantic.get("accepted") is not True
        ):
            raise Profile0034SupportingEdgeNamedCoreError(
                "SAT exact rational replay drifted"
            )
        return "SAT_SEMANTICALLY_REPLAYED"
    if raw == "UNSAT":
        return "UNSAT_NAMED_CORE"
    raise Profile0034SupportingEdgeNamedCoreError(
        "query status is outside the fixed plan"
    )


def _result_record(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    custody: Mapping[str, Any],
) -> dict[str, Any]:
    result = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": prepared.solver,
        "source_id": prepared.system["source_id"],
        "assumption_count": len(prepared.system["assumption_bindings"]),
        "source_system_sha256": prepared.system["source_system_sha256"],
        "source_ledger_sha256": prepared.system["source_ledger_sha256"],
        "assumption_label_sha256": _sha(_canonical(list(prepared.assumption_labels))),
        "engine": dict(engine),
        "custody": dict(custody),
        "claims": dict(FALSE_CLAIMS),
    }
    result["result_sha256"] = _self_hash(result, "result_sha256")
    return result


def verify_query_tree(prepared: PreparedQuery, output: Path) -> dict[str, Any]:
    if output.is_symlink() or not output.is_dir():
        raise Profile0034SupportingEdgeNamedCoreError(
            "query output directory is unsafe"
        )
    result = _strict(_read(output / "result.json"), "query result")
    expected_identity = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": prepared.solver,
        "source_id": prepared.system["source_id"],
        "assumption_count": len(prepared.system["assumption_bindings"]),
        "source_system_sha256": prepared.system["source_system_sha256"],
        "source_ledger_sha256": prepared.system["source_ledger_sha256"],
        "assumption_label_sha256": _sha(_canonical(list(prepared.assumption_labels))),
        "claims": FALSE_CLAIMS,
    }
    if (
        set(result) != _RESULT_KEYS
        or any(result.get(key) != value for key, value in expected_identity.items())
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
    ):
        raise Profile0034SupportingEdgeNamedCoreError("query result identity drifted")
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "source_record",
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "sources",
    }:
        raise Profile0034SupportingEdgeNamedCoreError("query custody is malformed")
    seen = {"result.json"}
    expected_payloads = {
        "source_record": _json(prepared.system),
        "descriptor": prepared.query.descriptor_bytes,
        "original_smt2": prepared.query.original_smt2,
        "journal_smt2": prepared.query.journal_smt2,
    }
    for key, expected in expected_payloads.items():
        if _verify_artifact(output, custody[key], seen) != expected:
            raise Profile0034SupportingEdgeNamedCoreError(
                f"query {key} custody drifted"
            )
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(
        prepared.query.source_files
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "query source custody count drifted"
        )
    for record, snapshot in zip(
        source_records, prepared.query.source_files, strict=True
    ):
        if _verify_artifact(output, record, seen) != snapshot.payload:
            raise Profile0034SupportingEdgeNamedCoreError(
                "query source snapshot drifted"
            )
    engine = result.get("engine")
    if type(engine) is not dict or type(engine.get("artifacts")) is not dict:
        raise Profile0034SupportingEdgeNamedCoreError("query engine is malformed")
    payloads = {
        label: _verify_artifact(output, record, seen)
        for label, record in engine["artifacts"].items()
    }
    _validate_engine(prepared, engine, payloads)
    entries = tuple(output.iterdir())
    if (
        any(
            entry.is_symlink()
            or not stat.S_ISREG(entry.lstat().st_mode)
            or entry.lstat().st_nlink != 1
            for entry in entries
        )
        or {entry.name for entry in entries} != seen
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "query output contains unsafe or unbound artifacts"
        )
    return result


def run_query(
    prepared: PreparedQuery,
    output: Path,
    transport: adapter.PiqdTransport,
    used_session_ids: set[str] | None = None,
) -> dict[str, Any]:
    if output.exists() or output.is_symlink():
        return verify_query_tree(prepared, output)
    try:
        with adapter.SmtOutputTransaction(output) as transaction:
            custody: dict[str, Any] = {}
            for key, name, payload in (
                ("source_record", "source-record.json", _json(prepared.system)),
                ("descriptor", "descriptor.json", prepared.query.descriptor_bytes),
                ("original_smt2", "original.smt2", prepared.query.original_smt2),
                ("journal_smt2", "journal.smt2", prepared.query.journal_smt2),
            ):
                transaction.write_bytes(name, payload)
                custody[key] = _artifact_record(name, payload)
            source_records = []
            for index, snapshot in enumerate(prepared.query.source_files):
                name = f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin"
                transaction.write_bytes(name, snapshot.payload)
                source_records.append(_artifact_record(name, snapshot.payload))
            custody["sources"] = source_records
            session_ids = used_session_ids if used_session_ids is not None else set()
            engine = adapter.run_authenticated_single_solver_query(
                prepared.query,
                solver=prepared.solver,
                descriptor_schema=DESCRIPTOR_SCHEMA,
                solver_profile_schema=SOLVER_PROFILE_SCHEMA,
                authenticated_journal_commands=prepared.query.journal_commands,
                transport=transport,
                semantic_verifier=verify_sat_model,
                output_fd=transaction.file_descriptor,
                used_session_ids=session_ids,
                request_id=_query_request_id(prepared.key),
                assumption_labels=prepared.assumption_labels,
            )
            payloads = {
                label: _read_fd_artifact(transaction.file_descriptor, record["path"])
                for label, record in engine["artifacts"].items()
            }
            _validate_engine(prepared, engine, payloads)
            result = _result_record(prepared, engine, custody)
            transaction.write_bytes("result.json", _json(result))
            transaction.publish()
    except Profile0034SupportingEdgeNamedCoreError:
        raise
    except (OSError, adapter.SmtSourceAdapterError) as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "authenticated named-core PIQD query failed"
        ) from exc
    return verify_query_tree(prepared, output)


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict(_read(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owned_paths") != _OWNED_PATHS
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile0034SupportingEdgeNamedCoreError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    authenticate_aborted_run()
    parent = authenticate_parent_run()
    source_paths = [
        Path(__file__),
        Path(source.__file__),
        Path(adapter.__file__),
        TEST_PATH,
        RUNNER_PATH,
        SPEC_PATH,
        CHECKPOINT_PATH,
    ]
    parent_result_paths = [
        PARENT_ROOT / "artifacts" / key / "result.json"
        for key in sorted(parent["result_file_sha256"])
    ]
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_map(source_paths),
        "input_digests": _source_map(
            [
                ABORTED_MANIFEST_PATH,
                PARENT_MANIFEST_PATH,
                PARENT_LAUNCH_PATH,
                PARENT_TERMINAL_PATH,
            ]
            + parent_result_paths
        ),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _manifest_sources() -> list[Path]:
    return [
        Path(__file__),
        Path(source.__file__),
        Path(adapter.__file__),
        TEST_PATH,
        RUNNER_PATH,
        SPEC_PATH,
        CHECKPOINT_PATH,
    ]


def _git_read(arguments: Sequence[str], where: str) -> bytes:
    try:
        completed = subprocess.run(
            ["git", *arguments],
            cwd=REPOSITORY_ROOT,
            stdin=subprocess.DEVNULL,
            capture_output=True,
            check=False,
        )
    except OSError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            f"Git read failed: {where}"
        ) from exc
    if completed.returncode != 0:
        raise Profile0034SupportingEdgeNamedCoreError(f"Git object is missing: {where}")
    return completed.stdout


def _authenticate_source_commit(manifest: Mapping[str, Any], commit: object) -> str:
    if type(commit) is not str or _FULL_COMMIT.fullmatch(commit) is None:
        raise Profile0034SupportingEdgeNamedCoreError("execution commit is malformed")
    source_digests = manifest.get("source_digests")
    expected_paths = sorted(_repo_path(path) for path in _manifest_sources())
    if type(source_digests) is not dict or sorted(source_digests) != expected_paths:
        raise Profile0034SupportingEdgeNamedCoreError(
            "execution source inventory drifted"
        )
    for relative in expected_paths:
        current = _read(REPOSITORY_ROOT / relative)
        if source_digests.get(relative) != _sha(current):
            raise Profile0034SupportingEdgeNamedCoreError(
                f"current bound source drifted: {relative}"
            )
        committed = _git_read(("show", f"{commit}:{relative}"), relative)
        if committed != current:
            raise Profile0034SupportingEdgeNamedCoreError(
                f"execution commit source drifted: {relative}"
            )
    return commit


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    """Bind every execution source to identical bytes at the current commit."""

    raw_head = _git_read(("rev-parse", "--verify", "HEAD^{commit}"), "current commit")
    try:
        head = raw_head.decode("ascii").strip()
    except UnicodeDecodeError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "execution commit is malformed"
        ) from exc
    if raw_head != f"{head}\n".encode("ascii"):
        raise Profile0034SupportingEdgeNamedCoreError("execution commit is malformed")
    return _authenticate_source_commit(manifest, head)


def authenticate_recorded_execution_commit(
    manifest: Mapping[str, Any], launch: Mapping[str, Any]
) -> str:
    """Authenticate the source commit bound by an immutable launch record."""

    return _authenticate_source_commit(manifest, launch.get("execution_commit"))


def _require_safe_run_ancestors() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise Profile0034SupportingEdgeNamedCoreError(
            "run root escapes repository"
        ) from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise Profile0034SupportingEdgeNamedCoreError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise Profile0034SupportingEdgeNamedCoreError("run-root ancestor is unsafe")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_run_ancestors()
    if RUN_ROOT.is_symlink() or not RUN_ROOT.is_dir():
        raise Profile0034SupportingEdgeNamedCoreError("run root is absent or unsafe")
    names = {entry.name for entry in RUN_ROOT.iterdir()}
    if names not in (
        {"run_manifest.json"},
        {"run_manifest.json", "artifacts", "events", "tmp"},
    ):
        raise Profile0034SupportingEdgeNamedCoreError("run-root inventory drifted")
    manifest_path = RUN_ROOT / "run_manifest.json"
    observed = _strict(_read(manifest_path), "run manifest")
    created_utc = observed.get("created_utc")
    if type(created_utc) is not str or observed != _expected_run_manifest(created_utc):
        raise Profile0034SupportingEdgeNamedCoreError(
            "run manifest source or input digest drifted"
        )
    return RUN_ROOT, observed


def _initialize_runtime_dirs(root: Path) -> None:
    if {entry.name for entry in root.iterdir()} != {"run_manifest.json"}:
        raise Profile0034SupportingEdgeNamedCoreError(
            "runtime initialization requires a manifest-only root"
        )
    for name in ("artifacts", "events", "tmp"):
        child = root / name
        child.mkdir()
        if child.is_symlink() or not child.is_dir():
            raise Profile0034SupportingEdgeNamedCoreError("runtime child is unsafe")


def _flat_snapshot(path: Path, *, allow_empty: bool = False) -> list[dict[str, Any]]:
    if path.is_symlink() or not path.is_dir():
        raise Profile0034SupportingEdgeNamedCoreError(
            "runtime artifact directory is unsafe"
        )
    records = []
    for entry in sorted(path.iterdir(), key=lambda item: item.name):
        info = entry.lstat()
        if entry.is_symlink() or not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise Profile0034SupportingEdgeNamedCoreError(
                "runtime artifact directory is nested or unsafe"
            )
        payload = _read(entry)
        records.append(
            {"path": entry.name, "bytes": len(payload), "sha256": _sha(payload)}
        )
    if not records and not allow_empty:
        raise Profile0034SupportingEdgeNamedCoreError(
            "runtime artifact directory is empty"
        )
    return records


def _runtime_snapshot(root: Path) -> dict[str, Any]:
    artifacts = root / "artifacts"
    tmp = root / "tmp"
    if (
        artifacts.is_symlink()
        or not artifacts.is_dir()
        or tmp.is_symlink()
        or not tmp.is_dir()
    ):
        raise Profile0034SupportingEdgeNamedCoreError("runtime branches are unsafe")
    if tuple(tmp.iterdir()):
        raise Profile0034SupportingEdgeNamedCoreError(
            "runtime tmp directory is not empty"
        )
    records: dict[str, Any] = {}
    for entry in sorted(artifacts.iterdir(), key=lambda item: item.name):
        if entry.is_symlink() or not entry.is_dir():
            raise Profile0034SupportingEdgeNamedCoreError(
                "runtime artifact entry is unsafe"
            )
        if entry.name in QUERY_KEYS:
            files = _flat_snapshot(entry)
            if "result.json" not in {record["path"] for record in files}:
                raise Profile0034SupportingEdgeNamedCoreError(
                    "partial query output is not resumable"
                )
            records[entry.name] = {"kind": "query", "files": files}
        elif _TOMBSTONE.fullmatch(entry.name):
            files = _flat_snapshot(entry, allow_empty=True)
            records[entry.name] = {"kind": "adapter-tombstone", "files": files}
        else:
            raise Profile0034SupportingEdgeNamedCoreError(
                "undeclared runtime artifact entry"
            )
    launch = root / "events/launch.json"
    return {
        "launch_sha256": _sha(_read(launch)) if launch.exists() else None,
        "artifacts": records,
        "tmp_entries": [],
    }


def _inventory(root: Path, prepared: Mapping[str, PreparedQuery] | None = None) -> str:
    if root.is_symlink() or not root.is_dir():
        raise Profile0034SupportingEdgeNamedCoreError("runtime root is unsafe")
    names = {entry.name for entry in root.iterdir()}
    if names == {"run_manifest.json"}:
        return "INITIALIZED"
    if names != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise Profile0034SupportingEdgeNamedCoreError("runtime root inventory drifted")
    _runtime_snapshot(root)
    event_names = {entry.name for entry in (root / "events").iterdir()}
    if event_names == set():
        if tuple((root / "artifacts").iterdir()):
            raise Profile0034SupportingEdgeNamedCoreError(
                "initialized root contains artifacts"
            )
        return "RUNTIME_READY"
    if event_names == {"launch.json"}:
        return "LAUNCHED"
    if event_names == {"launch.json", "terminal.json"}:
        entries = {entry.name for entry in (root / "artifacts").iterdir()}
        if entries != set(QUERY_KEYS) or prepared is None:
            raise Profile0034SupportingEdgeNamedCoreError(
                "terminal artifact inventory is incomplete"
            )
        for key in QUERY_KEYS:
            verify_query_tree(prepared[key], root / "artifacts" / key)
        return "TERMINAL"
    raise Profile0034SupportingEdgeNamedCoreError("runtime event inventory drifted")


def _launch_record(
    manifest: Mapping[str, Any],
    execution_commit: str,
    server: str,
    timeout_ms: int,
    workers: int,
) -> dict[str, Any]:
    if _FULL_COMMIT.fullmatch(execution_commit) is None:
        raise Profile0034SupportingEdgeNamedCoreError(
            "launch execution commit is malformed"
        )
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_commit": execution_commit,
        "queries": list(QUERY_KEYS),
        "control_order": list(POSITIVE_CONTROL_KEYS + NEGATIVE_CONTROL_KEYS),
        "target_order": list(TARGET_KEYS),
        "server": server,
        "timeout_ms": timeout_ms,
        "workers": workers,
        "max_workers": MAX_WORKERS,
        "sessions": len(QUERY_KEYS),
        "solves_per_session": 1,
        "transport": "maintained PIQD HTTP SMT adapter only; fresh named sessions",
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _terminal_record(
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    results: Mapping[str, Mapping[str, Any]],
) -> dict[str, Any]:
    if set(results) != set(QUERY_KEYS):
        raise Profile0034SupportingEdgeNamedCoreError(
            "terminal result inventory is incomplete"
        )
    if any(results[key]["engine"]["raw_status"] != "UNSAT" for key in TARGET_KEYS):
        raise Profile0034SupportingEdgeNamedCoreError(
            "terminal requires both target named cores"
        )
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": "NAMED_CORES_COMPLETE",
        "core_scope": "Z3-returned cores only; later fresh-session deletion is required",
        "results": {
            key: {
                "solver": results[key]["solver"],
                "source_id": results[key]["source_id"],
                "raw_status": results[key]["engine"]["raw_status"],
                "effective_status": results[key]["engine"]["effective_status"],
                "result_sha256": results[key]["result_sha256"],
            }
            for key in QUERY_KEYS
        },
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _read_terminal(path: Path) -> dict[str, Any]:
    value = _strict(_read(path), "terminal")
    if (
        set(value)
        != {
            "schema",
            "lane_id",
            "run_id",
            "run_manifest_sha256",
            "launch_sha256",
            "status",
            "core_scope",
            "results",
            "claims",
            "terminal_sha256",
        }
        or value.get("schema") != TERMINAL_SCHEMA
        or value.get("lane_id") != LANE_ID
        or value.get("run_id") != RUN_ID
        or value.get("status") != "NAMED_CORES_COMPLETE"
        or value.get("core_scope")
        != "Z3-returned cores only; later fresh-session deletion is required"
        or value.get("claims") != FALSE_CLAIMS
        or value.get("terminal_sha256") != _self_hash(value, "terminal_sha256")
    ):
        raise Profile0034SupportingEdgeNamedCoreError("terminal record is malformed")
    return value


def _validate_server(server: str) -> str:
    parsed = urllib.parse.urlsplit(server)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.netloc
        or parsed.username is not None
        or parsed.password is not None
        or parsed.query
        or parsed.fragment
    ):
        raise Profile0034SupportingEdgeNamedCoreError("invalid PIQD server URL")
    return server.rstrip("/")


def run_campaign(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = DEFAULT_WORKERS,
    init_only: bool = False,
    transport: adapter.PiqdTransport | None = None,
) -> dict[str, Any]:
    if (
        type(workers) is not int
        or type(workers) is bool
        or not 1 <= workers <= MAX_WORKERS
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            f"workers must lie in 1..{MAX_WORKERS}"
        )
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise Profile0034SupportingEdgeNamedCoreError(
            "timeout must be exact milliseconds in (0,3600]"
        )
    root, manifest = ensure_run_root()
    parent = authenticate_parent_run()
    timeout_ms = int(timeout_s * 1000)
    prepared = {
        key: prepare_query(key, timeout_ms=timeout_ms, parent=parent)
        for key in QUERY_KEYS
    }
    phase = _inventory(root, prepared)
    if init_only:
        if phase != "INITIALIZED":
            raise Profile0034SupportingEdgeNamedCoreError(
                "init-only requires a pristine initialized root"
            )
        return {
            "status": "INITIALIZED",
            "lane_id": LANE_ID,
            "run_manifest_sha256": manifest["manifest_sha256"],
            "queries": list(QUERY_KEYS),
        }
    server = _validate_server(server)
    launch_path = root / "events/launch.json"
    terminal_path = root / "events/terminal.json"
    if phase == "TERMINAL":
        stored_launch = _strict(_read(launch_path), "launch")
        execution_commit = authenticate_recorded_execution_commit(
            manifest, stored_launch
        )
        launch = _launch_record(manifest, execution_commit, server, timeout_ms, workers)
        if stored_launch != launch:
            raise Profile0034SupportingEdgeNamedCoreError(
                "launch does not match terminal replay"
            )
        stored = _read_terminal(terminal_path)
        results = {
            key: verify_query_tree(prepared[key], root / "artifacts" / key)
            for key in QUERY_KEYS
        }
        expected = _terminal_record(manifest, launch, results)
        if stored != expected or _inventory(root, prepared) != "TERMINAL":
            raise Profile0034SupportingEdgeNamedCoreError(
                "terminal does not match artifact replay"
            )
        return stored
    if phase != "INITIALIZED":
        raise Profile0034SupportingEdgeNamedCoreError(
            "incomplete launch cannot resume; use a fresh run id"
        )
    execution_commit = authenticate_execution_commit(manifest)
    launch = _launch_record(manifest, execution_commit, server, timeout_ms, workers)
    _initialize_runtime_dirs(root)
    _publish_once(launch_path, _json(launch))
    if _inventory(root, prepared) != "LAUNCHED":
        raise Profile0034SupportingEdgeNamedCoreError("launch inventory drifted")
    active_transport = transport
    if active_transport is None:
        active_transport = adapter.UrllibPiqdTransport(
            server, http_timeout_s=timeout_s + 40
        )
    results: dict[str, dict[str, Any]] = {}
    for key in POSITIVE_CONTROL_KEYS + NEGATIVE_CONTROL_KEYS:
        results[key] = run_query(
            prepared[key], root / "artifacts" / key, active_transport
        )
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
        futures = {
            key: pool.submit(
                run_query,
                prepared[key],
                root / "artifacts" / key,
                active_transport,
            )
            for key in TARGET_KEYS
        }
        for key in TARGET_KEYS:
            results[key] = futures[key].result()
    session_ids = [result["engine"]["session_id"] for result in results.values()]
    if any(
        type(session_id) is not str or not session_id for session_id in session_ids
    ) or len(set(session_ids)) != len(QUERY_KEYS):
        raise Profile0034SupportingEdgeNamedCoreError(
            "query session identities crossed"
        )
    terminal = _terminal_record(manifest, launch, results)
    _publish_once(terminal_path, _json(terminal))
    if _inventory(root, prepared) != "TERMINAL":
        raise Profile0034SupportingEdgeNamedCoreError(
            "terminal inventory drifted after publication"
        )
    return terminal


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=DEFAULT_WORKERS)
    parser.add_argument("--init-only", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_campaign(
            server=args.server,
            timeout_s=args.timeout,
            workers=args.workers,
            init_only=args.init_only,
        )
    except Exception as exc:  # noqa: BLE001 -- ordinary failures are CLI diagnostics
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "DEFAULT_TIMEOUT_S",
    "DEFAULT_WORKERS",
    "DESCRIPTOR_SCHEMA",
    "FALSE_CLAIMS",
    "LANE_ID",
    "MAX_WORKERS",
    "QUERY_KEYS",
    "QUERY_PLAN",
    "RUN_ID",
    "RUN_ROOT",
    "SOLVER_PROFILE_SCHEMA",
    "TARGET_KEYS",
    "PreparedQuery",
    "Profile0034SupportingEdgeNamedCoreError",
    "authenticate_execution_commit",
    "authenticate_parent_run",
    "build_named_system",
    "build_smt_commands",
    "ensure_run_root",
    "main",
    "prepare_query",
    "run_campaign",
    "run_query",
    "verify_query_tree",
    "verify_sat_model",
]
