"""PIQD-only physical deletion probes for profile-0034 supporting edges.

Every solver cell owns a fresh named PIQD session and one Z3 solve.  Target
assertions are removed from the submitted journal itself; this lane never uses
Boolean guards or assumptions.  Results remain formula-local discovery data.
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
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_hard_source_swap_profile0034_supporting_edge_qfnra_piqd as source,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = (
    "exactfive-hard-source-swap-profile0034-supporting-edge-"
    "unguarded-deletion-piqd-20260904"
)
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-"
    "supporting-edge-unguarded-deletion-v1.md"
)
TEST_PATH = REPOSITORY_ROOT / (
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_"
    "supporting_edge_unguarded_deletion_piqd.py"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_hard_source_swap_profile0034_"
    "supporting_edge_unguarded_deletion_piqd.py"
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
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-"
    "unguarded-deletion-system/v1"
)
DESCRIPTOR_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-"
    "unguarded-deletion-query/v1"
)
SOLVER_PROFILE_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-"
    "unguarded-deletion-solver/v1"
)
RESULT_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-"
    "unguarded-deletion-result/v1"
)
LAUNCH_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-"
    "unguarded-deletion-launch/v1"
)
TERMINAL_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-supporting-edge-"
    "unguarded-deletion-terminal/v1"
)
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
SOLVER = "z3"
TIMEOUT_MS = 60_000
DEFAULT_TIMEOUT_S = 60.0
MAX_WORKERS = 20
DEFAULT_WORKERS = 20
CHECKPOINT_OWNER = "profile0034-supporting-edge-unguarded-deletion-impl"
CHECKPOINT_BASE_HEAD = "d07392f52c05c1d2d68abc37c058ffe296e751cd"

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
CONTROL_KEYS = ("z3-control-positive", "z3-control-negative")
BRANCH_IDS = ("lt", "gt")
EDGE_GROUP_IDS = tuple(f"edge-index-{index:02d}" for index in range(13))
ROW_GROUP_IDS = tuple(f"source-row-equality-{index:02d}" for index in range(11))
RADIUS_GROUP_ID = "radius-branch"
STRICT_GROUP_ID = "source-strict"
TARGET_GROUP_IDS = EDGE_GROUP_IDS + ROW_GROUP_IDS + (RADIUS_GROUP_ID, STRICT_GROUP_ID)
BRANCH_PROBE_GROUP_IDS = EDGE_GROUP_IDS + ROW_GROUP_IDS + (STRICT_GROUP_ID,)


def _branch_probe_key(branch_id: str, group_id: str) -> str:
    return f"probe-{branch_id}-{group_id}"


BRANCH_PROBE_KEYS = tuple(
    _branch_probe_key(branch_id, group_id)
    for branch_id in BRANCH_IDS
    for group_id in BRANCH_PROBE_GROUP_IDS
)
RADIUS_PROBE_KEY = "probe-shared-radius-free"
PROBE_KEYS = BRANCH_PROBE_KEYS + (RADIUS_PROBE_KEY,)
CANDIDATE_KEYS = tuple(f"candidate-{branch_id}-reduced" for branch_id in BRANCH_IDS)
QUERY_KEYS = CONTROL_KEYS + PROBE_KEYS + CANDIDATE_KEYS

_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd.py",
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-supporting-edge-unguarded-deletion-v1.md",
    "scripts/run_exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd.py",
]
_FULL_COMMIT = re.compile(r"^[0-9a-f]{40}$")
_TOMBSTONE = re.compile(
    r"\.piqd-smt-tombstone-[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-"
    r"[89ab][0-9a-f]{3}-[0-9a-f]{12}\Z"
)
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


class Profile0034SupportingEdgeUnguardedDeletionError(RuntimeError):
    """The physical-deletion lane failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery
    decision_sources: tuple[adapter.SourceSnapshot, ...] = ()

    @property
    def solver(self) -> str:
        return SOLVER

    @property
    def assumption_labels(self) -> tuple[str, ...]:
        return ()


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
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            f"missing custody file: {path}"
        ) from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            f"unsafe custody file: {path}"
        )
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            f"custody file changed while reading: {path}"
        )
    return payload


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            f"{where} is not strict JSON"
        ) from exc
    if type(value) is not dict:
        raise Profile0034SupportingEdgeUnguardedDeletionError(f"{where} is not an object")
    return value


def _publish_once(path: Path, payload: bytes) -> None:
    try:
        source._create_once(path, payload)
    except source.Profile0034SupportingEdgeError as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            f"immutable publication failed: {path}"
        ) from exc


def _repo_path(path: Path) -> str:
    return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()


def _source_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read(path)) for path in sorted(paths)}


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
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            f"Git read failed: {where}"
        ) from exc
    if completed.returncode != 0:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            f"Git object is missing: {where}"
        )
    return completed.stdout


def _authenticate_parent_execution_commit(
    manifest: Mapping[str, Any], launch: Mapping[str, Any]
) -> str:
    commit = launch.get("execution_commit")
    source_digests = manifest.get("source_digests")
    if (
        type(commit) is not str
        or _FULL_COMMIT.fullmatch(commit) is None
        or type(source_digests) is not dict
        or not source_digests
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "parent execution-commit custody is malformed"
        )
    for relative, digest in source_digests.items():
        if type(relative) is not str or type(digest) is not str:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "parent execution source is malformed"
            )
        current = _read(REPOSITORY_ROOT / relative)
        committed = _git_read(("show", f"{commit}:{relative}"), relative)
        if _sha(current) != digest or committed != current:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                f"parent execution source drifted: {relative}"
            )
    return commit


def authenticate_parent_run() -> dict[str, Any]:
    """Authenticate and reconstruct the completed supporting-edge parent."""

    if _sha(_read(Path(source.__file__))) != PARENT_PRODUCER_SHA256:
        raise Profile0034SupportingEdgeUnguardedDeletionError("parent producer bytes drifted")
    manifest_payload = _read(PARENT_MANIFEST_PATH)
    launch_payload = _read(PARENT_LAUNCH_PATH)
    terminal_payload = _read(PARENT_TERMINAL_PATH)
    if (
        _sha(manifest_payload) != PARENT_MANIFEST_FILE_SHA256
        or _sha(launch_payload) != PARENT_LAUNCH_FILE_SHA256
        or _sha(terminal_payload) != PARENT_TERMINAL_FILE_SHA256
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError("parent record bytes drifted")
    try:
        root, manifest = source.ensure_run_root()
        launch = source._strict_json(launch_payload, "parent launch")
        terminal = source._read_terminal(PARENT_TERMINAL_PATH)
        predecessor = source.authenticate_predecessor_run()
    except (source.Profile0034SupportingEdgeError, OSError, ValueError) as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "parent root validation failed"
        ) from exc
    if (
        root != PARENT_ROOT
        or manifest.get("manifest_sha256") != PARENT_MANIFEST_SHA256
        or launch.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or terminal.get("terminal_sha256") != PARENT_TERMINAL_SHA256
        or terminal.get("status") != "TARGET_INCONCLUSIVE"
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "parent identity or status drifted"
        )
    timeout_ms = launch.get("timeout_ms")
    if type(timeout_ms) is not int:
        raise Profile0034SupportingEdgeUnguardedDeletionError("parent timeout is malformed")
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
        key: source._prepare_query_with_prior(system, predecessor, timeout_ms=timeout_ms)
        for key, system in systems.items()
    }
    try:
        results = {
            key: source.verify_adapter_tree(item, root / "artifacts" / key)
            for key, item in prepared.items()
        }
        source._require_control("control-positive", results["control-positive"])
        source._require_control("control-negative", results["control-negative"])
        expected_terminal = source._terminal_record(root, launch, results)
        execution_commit = _authenticate_parent_execution_commit(manifest, launch)
    except (source.Profile0034SupportingEdgeError, OSError, ValueError) as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
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
        for key in ("parent-z3-mirror-radius-lt", "parent-z3-mirror-radius-gt")
    }
    if (
        terminal != expected_terminal
        or result_hashes != EXPECTED_PARENT_RESULTS
        or mirror_statuses
        != {
            "parent-z3-mirror-radius-lt": [["z3", "UNSAT"], ["cvc5", "UNKNOWN"]],
            "parent-z3-mirror-radius-gt": [["z3", "UNSAT"], ["cvc5", "UNKNOWN"]],
        }
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
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


def _target_source(parent: Mapping[str, Any], branch_id: str) -> dict[str, Any]:
    if branch_id not in BRANCH_IDS:
        raise Profile0034SupportingEdgeUnguardedDeletionError("unknown radius branch")
    key = f"parent-z3-mirror-radius-{branch_id}"
    systems = parent.get("source_systems")
    if type(systems) is not dict or type(systems.get(key)) is not dict:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "parent target custody is absent"
        )
    return dict(systems[key])


def assertion_group_ledger(system: Mapping[str, Any]) -> list[dict[str, Any]]:
    """Partition all 156 target assertions into 26 physical groups."""

    if type(system) is not dict or system.get("schema") != source.SYSTEM_SCHEMA:
        raise Profile0034SupportingEdgeUnguardedDeletionError("target source is malformed")
    groups: list[dict[str, Any]] = []
    for edge_index in range(13):
        entries = [
            entry
            for entry in system["supporting_edges"]
            if entry.get("edge_index") == edge_index
        ]
        commands = [f"(assert (> {entry['expression']} 0))" for entry in entries]
        groups.append(
            {
                "group_id": EDGE_GROUP_IDS[edge_index],
                "family": "supporting-edge",
                "index": edge_index,
                "source_entries": entries,
                "source_commands": commands,
            }
        )
    for index, entry in enumerate(system["source_row_equalities"]):
        groups.append(
            {
                "group_id": ROW_GROUP_IDS[index],
                "family": "source-row-equality",
                "index": index,
                "source_entries": [entry],
                "source_commands": [f"(assert (= {entry['left']} {entry['right']}))"],
            }
        )
    radius = system["radius_branch"]
    strict = system["source_strict"]
    groups.extend(
        (
            {
                "group_id": RADIUS_GROUP_ID,
                "family": RADIUS_GROUP_ID,
                "index": 0,
                "source_entries": [radius],
                "source_commands": [
                    f"(assert ({radius['relation']} {radius['left']} {radius['right']}))"
                ],
            },
            {
                "group_id": STRICT_GROUP_ID,
                "family": STRICT_GROUP_ID,
                "index": 0,
                "source_entries": [strict],
                "source_commands": [
                    f"(assert (< {strict['left']} {strict['right']}))"
                ],
            },
        )
    )
    if (
        [group["group_id"] for group in groups] != list(TARGET_GROUP_IDS)
        or [len(group["source_commands"]) for group in groups[:13]] != [11] * 13
        or [len(group["source_commands"]) for group in groups[13:24]] != [1] * 11
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "assertion group partition drifted"
        )
    source_commands = source._build_smt_commands_current(system)
    source_assertions = [
        command for command in source_commands if command.startswith("(assert ")
    ]
    expanded = [command for group in groups for command in group["source_commands"]]
    if len(expanded) != 156 or expanded != source_assertions:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "assertion group ledger does not reconstruct the source"
        )
    return groups


def _commands_for_groups(
    system: Mapping[str, Any], retained_group_ids: Sequence[str]
) -> tuple[str, ...]:
    if (
        type(retained_group_ids) not in {list, tuple}
        or len(set(retained_group_ids)) != len(retained_group_ids)
        or any(type(item) is not str for item in retained_group_ids)
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "retained assertion groups are malformed"
        )
    retained = set(retained_group_ids)
    if retained - set(TARGET_GROUP_IDS):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "retained assertion group is unknown"
        )
    ordered = [group_id for group_id in TARGET_GROUP_IDS if group_id in retained]
    if list(retained_group_ids) != ordered:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "retained assertion groups are not canonically ordered"
        )
    original = source._build_smt_commands_current(system)
    assertion_offset = next(
        (index for index, command in enumerate(original) if command.startswith("(assert ")),
        len(original),
    )
    group_map = {group["group_id"]: group for group in assertion_group_ledger(system)}
    commands = list(original[:assertion_offset])
    for group_id in ordered:
        commands.extend(group_map[group_id]["source_commands"])
    return tuple(commands)


def _journal(commands: Sequence[str]) -> bytes:
    return b"".join(command.encode("ascii") + b"\n" for command in commands)


def _control_system(key: str, parent: Mapping[str, Any]) -> dict[str, Any]:
    source_id = key.removeprefix("z3-")
    systems = parent.get("source_systems")
    if key not in CONTROL_KEYS or type(systems) is not dict:
        raise Profile0034SupportingEdgeUnguardedDeletionError("control key is invalid")
    original = systems[source_id]
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
        "key": key,
        "source_id": source_id,
        "source_system": original,
        "retained_group_ids": [],
        "omitted_group_ids": [],
        "decision_records": [],
        "claims": dict(FALSE_CLAIMS),
    }


def _probe_system(
    key: str, parent: Mapping[str, Any]
) -> dict[str, Any]:
    if key == RADIUS_PROBE_KEY:
        lt = _target_source(parent, "lt")
        gt = _target_source(parent, "gt")
        retained = [group_id for group_id in TARGET_GROUP_IDS if group_id != RADIUS_GROUP_ID]
        lt_commands = _commands_for_groups(lt, retained)
        gt_commands = _commands_for_groups(gt, retained)
        if lt_commands != gt_commands or _journal(lt_commands) != _journal(gt_commands):
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "radius-free mirror journals are not byte-identical"
            )
        return {
            "schema": SYSTEM_SCHEMA,
            "kind": "probe",
            "key": key,
            "branch_id": "shared",
            "source_id": "parent-z3-mirror-radius-lt",
            "source_system": lt,
            "source_system_sha256s": {
                "lt": _sha(_canonical(lt)),
                "gt": _sha(_canonical(gt)),
            },
            "retained_group_ids": retained,
            "omitted_group_ids": [RADIUS_GROUP_ID],
            "decision_records": [],
            "radius_free_journal_identity": {
                "lt_sha256": _sha(_journal(lt_commands)),
                "gt_sha256": _sha(_journal(gt_commands)),
                "byte_identical": True,
            },
            "claims": dict(FALSE_CLAIMS),
        }
    match = re.fullmatch(r"probe-(lt|gt)-(.+)", key)
    if match is None or match.group(2) not in BRANCH_PROBE_GROUP_IDS:
        raise Profile0034SupportingEdgeUnguardedDeletionError("probe key is invalid")
    branch_id, omitted = match.groups()
    original = _target_source(parent, branch_id)
    retained = [group_id for group_id in TARGET_GROUP_IDS if group_id != omitted]
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "probe",
        "key": key,
        "branch_id": branch_id,
        "source_id": f"parent-z3-mirror-radius-{branch_id}",
        "source_system": original,
        "source_system_sha256s": {branch_id: _sha(_canonical(original))},
        "retained_group_ids": retained,
        "omitted_group_ids": [omitted],
        "decision_records": [],
        "claims": dict(FALSE_CLAIMS),
    }


def classify_result(result: object) -> str:
    """Return the conservative candidate-decision disposition."""

    if type(result) is not dict:
        return "MALFORMED"
    engine = result.get("engine")
    if type(engine) is not dict:
        return "MALFORMED"
    raw = engine.get("raw_status")
    effective = engine.get("effective_status")
    provenance = engine.get("unsat_assumptions")
    if (
        raw == "UNSAT"
        and effective == "UNSAT_DISCOVERY_ONLY"
        and type(provenance) is dict
        and provenance.get("terminal_unsat") is True
        and provenance.get("named_core_support") is False
        and provenance.get("assumption_terms") == []
        and provenance.get("source_atom_ids") == []
    ):
        return "UNSAT_CUSTODY_VALID"
    if raw == "SAT" and effective == "SAT_SEMANTICALLY_REPLAYED":
        replay = engine.get("semantic_replay")
        return (
            "SAT_REPLAYED"
            if type(replay) is dict and replay.get("accepted") is True
            else "MALFORMED"
        )
    if raw == "SAT" and effective in {
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
        "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
    }:
        return "SAT_REPLAY_UNRESOLVED"
    if raw == "UNKNOWN" and effective == "INCONCLUSIVE_UNKNOWN":
        return "UNKNOWN"
    if raw is None and effective == "INCONCLUSIVE_TRANSPORT_LOSS":
        return "TRANSPORT_LOST"
    return "MALFORMED"


def _candidate_system(
    key: str,
    parent: Mapping[str, Any],
    probe_results: Mapping[str, Mapping[str, Any]],
) -> dict[str, Any]:
    match = re.fullmatch(r"candidate-(lt|gt)-reduced", key)
    if match is None or set(probe_results) != set(PROBE_KEYS):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "candidate inputs are incomplete"
        )
    branch_id = match.group(1)
    relevant = [
        (_branch_probe_key(branch_id, group_id), group_id)
        for group_id in BRANCH_PROBE_GROUP_IDS
    ] + [(RADIUS_PROBE_KEY, RADIUS_GROUP_ID)]
    decisions = []
    omitted = []
    for probe_key, group_id in relevant:
        result = probe_results[probe_key]
        disposition = classify_result(result)
        omit = disposition == "UNSAT_CUSTODY_VALID"
        if omit:
            omitted.append(group_id)
        decisions.append(
            {
                "probe_key": probe_key,
                "group_id": group_id,
                "disposition": disposition,
                "omit": omit,
                "probe_result_sha256": (
                    result.get("result_sha256") if type(result) is dict else None
                ),
            }
        )
    retained = [group_id for group_id in TARGET_GROUP_IDS if group_id not in omitted]
    original = _target_source(parent, branch_id)
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "candidate",
        "key": key,
        "branch_id": branch_id,
        "source_id": f"parent-z3-mirror-radius-{branch_id}",
        "source_system": original,
        "source_system_sha256s": {branch_id: _sha(_canonical(original))},
        "retained_group_ids": retained,
        "omitted_group_ids": [
            group_id for group_id in TARGET_GROUP_IDS if group_id not in retained
        ],
        "decision_records": decisions,
        "claims": dict(FALSE_CLAIMS),
    }


def build_system(
    key: str,
    parent: Mapping[str, Any],
    probe_results: Mapping[str, Mapping[str, Any]] | None = None,
) -> dict[str, Any]:
    if key in CONTROL_KEYS:
        return _control_system(key, parent)
    if key in PROBE_KEYS:
        return _probe_system(key, parent)
    if key in CANDIDATE_KEYS and probe_results is not None:
        return _candidate_system(key, parent, probe_results)
    raise Profile0034SupportingEdgeUnguardedDeletionError("query key is invalid")


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    if (
        type(system) is not dict
        or system.get("schema") != SYSTEM_SCHEMA
        or system.get("claims") != FALSE_CLAIMS
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError("system is malformed")
    if system.get("kind") == "control":
        return source._build_smt_commands_current(system["source_system"])
    return _commands_for_groups(system["source_system"], system["retained_group_ids"])


def _source_snapshots(
    parent: Mapping[str, Any],
    system: Mapping[str, Any],
    decision_sources: Sequence[adapter.SourceSnapshot],
) -> tuple[adapter.SourceSnapshot, ...]:
    snapshots = [
        adapter.SourceSnapshot("0000-parent-custody.json", _json(parent)),
        adapter.SourceSnapshot("0001-deletion-system.json", _json(system)),
        adapter.SourceSnapshot("parent-run-manifest.json", _read(PARENT_MANIFEST_PATH)),
        adapter.SourceSnapshot("parent-launch.json", _read(PARENT_LAUNCH_PATH)),
        adapter.SourceSnapshot("parent-terminal.json", _read(PARENT_TERMINAL_PATH)),
        adapter.SourceSnapshot("implementation-deletion.py", _read(Path(__file__))),
        adapter.SourceSnapshot("implementation-parent.py", _read(Path(source.__file__))),
        adapter.SourceSnapshot("implementation-adapter.py", _read(Path(adapter.__file__))),
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
    snapshots.extend(decision_sources)
    paths = [snapshot.path for snapshot in snapshots]
    if len(paths) != len(set(paths)):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "source snapshot paths are duplicated"
        )
    return tuple(sorted(snapshots, key=lambda item: item.path))


def prepare_query(
    key: str,
    *,
    parent: Mapping[str, Any] | None = None,
    probe_results: Mapping[str, Mapping[str, Any]] | None = None,
    decision_sources: Sequence[adapter.SourceSnapshot] = (),
    timeout_ms: int = TIMEOUT_MS,
) -> PreparedQuery:
    if timeout_ms != TIMEOUT_MS:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "the deletion lane timeout is fixed at 60000ms"
        )
    parent_record = dict(parent or authenticate_parent_run())
    if parent_record.get("parent_custody_sha256") != _self_hash(
        parent_record, "parent_custody_sha256"
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "parent custody record is not self-hashed"
        )
    system = build_system(key, parent_record, probe_results)
    expected_decision_paths = (
        [f"probe-result-{probe_key}.json" for probe_key in PROBE_KEYS]
        if key in CANDIDATE_KEYS
        else []
    )
    if [item.path for item in decision_sources] != expected_decision_paths:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "candidate decision-source inventory drifted"
        )
    commands = build_smt_commands(system)
    journal = _journal(commands)
    try:
        normalized, normalized_journal = adapter.normalize_state_journal(journal)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "physical-deletion journal is not accepted by the adapter"
        ) from exc
    if normalized != commands or normalized_journal != journal:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "physical-deletion journal normalization drifted"
        )
    original = system["source_system"]
    variables = sorted(
        (
            {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
            for variable in original["variables"]
        ),
        key=lambda item: item["id"],
    )
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "journal_sha256": _sha(journal),
        "parent_custody_sha256": parent_record["parent_custody_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _source_snapshots(parent_record, system, decision_sources)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {
            "id": "p97-profile0034-supporting-edge-unguarded-deletion-piqd",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "profile0034-supporting-edge-retained-only-exact-rational-replay",
            "version": "v1",
        },
        "stage_id": "exactfive-profile0034-supporting-edge-unguarded-deletion",
        "query_id": key,
        "sources": [
            {"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)}
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
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": SOLVER_PROFILE_SCHEMA,
            "solvers": [SOLVER],
            "timeout_ms": TIMEOUT_MS,
        },
    }
    query = adapter.SourceSemanticQuery(
        descriptor, _json(descriptor), journal, commands, journal, snapshots
    )
    return PreparedQuery(key, system, query, tuple(decision_sources))


def _replay_target(
    system: Mapping[str, Any], coords: Mapping[str, tuple[Fraction, Fraction]]
) -> dict[str, Any]:
    original = system["source_system"]
    if set(coords) != set(source.CLASS_IDS):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "coordinate replay is not total"
        )
    frame = source.predecessor._frame_coordinates(original["order_id"])
    if any(coords[class_id] != fixed for class_id, fixed in frame.items()):
        return {"accepted": False, "reason": "equilateral_frame"}
    retained = set(system["retained_group_ids"])
    checked: dict[str, int] = {
        "supporting_edge_assertions": 0,
        "row_equality_assertions": 0,
        "radius_assertions": 0,
        "source_strict_assertions": 0,
    }
    role = original["role_class"]
    for group in assertion_group_ledger(original):
        if group["group_id"] not in retained:
            continue
        if group["family"] == "supporting-edge":
            for entry in group["source_entries"]:
                left, right = entry["edge"]
                value = source._area_value(coords, left, right, entry["vertex"])
                if value <= 0:
                    return {
                        "accepted": False,
                        "reason": group["group_id"],
                        "value": str(value),
                    }
                checked["supporting_edge_assertions"] += 1
        elif group["family"] == "source-row-equality":
            entry = group["source_entries"][0]
            center = role[entry["center_role"]]
            left = source._distance_value(coords, center, role[entry["first_support_role"]])
            right = source._distance_value(coords, center, role[entry["other_support_role"]])
            if left != right:
                return {
                    "accepted": False,
                    "reason": group["group_id"],
                    "left": str(left),
                    "right": str(right),
                }
            checked["row_equality_assertions"] += 1
        elif group["family"] == RADIUS_GROUP_ID:
            entry = group["source_entries"][0]
            left = source._distance_value(coords, role["c2"], role["O"])
            right = source._distance_value(coords, role["c2"], role["d"])
            holds = left < right if entry["relation"] == "<" else left > right
            if not holds:
                return {
                    "accepted": False,
                    "reason": RADIUS_GROUP_ID,
                    "left": str(left),
                    "right": str(right),
                }
            checked["radius_assertions"] += 1
        elif group["family"] == STRICT_GROUP_ID:
            left = source._distance_value(coords, role["e"], role["d"])
            right = source._distance_value(coords, role["e"], role["a"])
            if not left < right:
                return {
                    "accepted": False,
                    "reason": STRICT_GROUP_ID,
                    "left": str(left),
                    "right": str(right),
                }
            checked["source_strict_assertions"] += 1
    expected_assertions = len(build_smt_commands(system)) - 1 - len(original["variables"])
    if sum(checked.values()) != expected_assertions:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "retained replay count drifted"
        )
    return {
        "accepted": True,
        "retained_group_ids": list(system["retained_group_ids"]),
        "omitted_group_ids": list(system["omitted_group_ids"]),
        **checked,
    }


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    if solver != SOLVER or type(model) is not str or type(values) is not str:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "SAT replay payload is malformed"
        )
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise Profile0034SupportingEdgeUnguardedDeletionError("semantic input is malformed")
    system = semantic.get("system")
    if type(system) is not dict or build_smt_commands(system) != query.journal_commands:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "SAT replay journal drifted"
        )
    if (
        query.descriptor_bytes != _json(query.descriptor)
        or query.original_smt2 != _journal(query.journal_commands)
        or query.journal_smt2 != query.original_smt2
        or query.descriptor.get("named_atoms") != []
        or query.descriptor.get("solve", {}).get("assumption_ids") != []
        or semantic.get("journal_sha256") != _sha(query.journal_smt2)
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "SAT replay descriptor custody drifted"
        )
    try:
        if system["kind"] == "control":
            parsed = source._parse_control_value(values)
            accepted = (
                system["source_system"]["control"] == "positive"
                and parsed == {"t": Fraction(1)}
            )
            evidence: dict[str, Any] = {
                "accepted": accepted,
                "control": system["source_system"]["control"],
                "values": {key: str(value) for key, value in parsed.items()},
            }
        else:
            original = system["source_system"]
            coords = source._parse_coordinates(
                values, query.get_values, original["order_id"]
            )
            evidence = _replay_target(system, coords)
            evidence["exact_coordinate_count"] = len(coords)
            evidence["free_coordinate_count"] = len(query.get_values)
    except (source.Profile0034SupportingEdgeError, ValueError, KeyError) as exc:
        evidence = {
            "accepted": False,
            "reason": "exact_readback_unsupported",
            "failure": type(exc).__name__,
        }
    evidence.update(
        {
            "solver": solver,
            "model_sha256": _sha(model.encode("utf-8")),
            "values_sha256": _sha(values.encode("utf-8")),
            "system_sha256": _sha(_canonical(system)),
        }
    )
    return adapter.SemanticVerification(bool(evidence.get("accepted")), evidence)


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "artifact record is malformed"
        )
    name = record["path"]
    if (
        type(name) is not str
        or not name
        or "/" in name
        or "\\" in name
        or name in seen
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "artifact path is unsafe or duplicated"
        )
    payload = _read(root / name)
    if (
        type(record["bytes"]) is not int
        or record["bytes"] != len(payload)
        or record["sha256"] != _sha(payload)
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
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
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "staged artifact is unsafe"
            )
        chunks: list[bytes] = []
        while True:
            chunk = os.read(descriptor, 65536)
            if not chunk:
                break
            chunks.append(chunk)
        payload = b"".join(chunks)
        if len(payload) != info.st_size:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "staged artifact changed while reading"
            )
        return payload
    finally:
        os.close(descriptor)


def _query_request_id(key: str) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


def _session_label(prepared: PreparedQuery) -> tuple[str, str]:
    profile_sha256 = _sha(_canonical(prepared.query.descriptor["solver_profile"]))
    label = (
        f"p97-smt-source/{prepared.key}/{SOLVER}/"
        f"{prepared.query.descriptor['semantic_sha256'][:12]}/"
        f"{_query_request_id(prepared.key)}/{profile_sha256[:12]}"
    )
    return label, profile_sha256


def _validate_transport_artifacts(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
) -> tuple[dict[str, Any], dict[str, Any] | None]:
    label, profile_sha256 = _session_label(prepared)
    request_id = _query_request_id(prepared.key)
    request_sha256 = adapter.piqd_solve_request_digest(prepared.query, ())
    create_request = {"solver": SOLVER, "lane": "smt", "label": label}
    expected_create = {
        "schema": "piqd-smt-session-create-request/v1",
        "request": create_request,
        "request_id": request_id,
        "session_label": label,
        "solver_profile": prepared.query.descriptor["solver_profile"],
        "solver_profile_sha256": profile_sha256,
    }
    if _strict(payloads["session_create_request"], "session create request") != expected_create:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "session create request drifted"
        )
    if (
        payloads["pre_append_smt2"] != b""
        or payloads["expected_post_append_smt2"] != prepared.query.journal_smt2
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "journal frontier bytes drifted"
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
    if _strict(payloads["journal_frontiers"], "journal frontiers") != expected_frontiers:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "journal frontier record drifted"
        )
    solve_request = {
        "assumptions": [],
        "timeout_ms": TIMEOUT_MS,
        "include_model": True,
        "get_values": list(prepared.query.get_values),
        "assumption_labels": [],
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
        raise Profile0034SupportingEdgeUnguardedDeletionError("solve request drifted")
    try:
        session = adapter._validate_session(
            _strict(payloads["session"], "session"),
            solver=SOLVER,
            label=label,
            expected_state="live",
        )
        adapter._validate_fresh_session(session)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "fresh session custody failed"
        ) from exc
    if payloads["smt2"] != prepared.query.journal_smt2:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "exported journal does not match"
        )
    raw = engine["raw_status"]
    solve: dict[str, Any] | None = None
    if raw is not None:
        solve_label = "reconciled_solve" if engine["response_lost"] else "solve"
        try:
            solve = adapter._validate_solve(
                _strict(payloads[solve_label], "solve"),
                timeout_ms=TIMEOUT_MS,
                assumptions=(),
                assumption_labels=(),
                named_request=True,
                replay_retry=engine["request_replayed"] is True,
            )
        except adapter.SmtSourceAdapterError as exc:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "solve custody failed"
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
            assumption_labels=(),
        )
        _, receipt = adapter._validate_receipts(
            _strict(payloads["receipts"], "receipts"),
            session=session,
            query=prepared.query,
            solve=solve,
            expected_count=0 if solve is None else 1,
            request_id=request_id,
            request_sha256=request_sha256,
            assumption_labels=(),
        )
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "receipt custody failed"
        ) from exc
    if prior is not None:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "fresh session has a prior receipt"
        )
    try:
        lifecycle = adapter._validate_session_lifecycle(
            _strict(payloads["session_lifecycle"], "session lifecycle")
        )
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "session lifecycle custody failed"
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
        or lifecycle["close_observed_state"] != "closed"
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "session lifecycle is crossed or incomplete"
        )
    try:
        closed = adapter._validate_session(
            _strict(payloads["closed_session"], "closed session"),
            solver=SOLVER,
            label=label,
            expected_state="closed",
        )
        adapter._validate_closed_session(
            closed, created=session, query=prepared.query, solve=solve
        )
        if "reconciliation_session" in payloads:
            reconciled = adapter._validate_session(
                _strict(payloads["reconciliation_session"], "reconciliation session"),
                solver=SOLVER,
                label=label,
                expected_state="live",
            )
            adapter._validate_session_frontier(
                reconciled, created=session, query=prepared.query, solve=solve
            )
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "session close custody failed"
        ) from exc
    return session, receipt


def _expected_semantic(
    prepared: PreparedQuery, solve: Mapping[str, Any]
) -> dict[str, Any]:
    verification = verify_sat_model(
        prepared.query, SOLVER, solve.get("model"), solve.get("values")
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
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "engine key set drifted"
        )
    raw = engine["raw_status"]
    if raw not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "engine status is unsupported"
        )
    lifecycle = engine["session_lifecycle"]
    if type(lifecycle) is not dict:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "session lifecycle is absent"
        )
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
        "closed_session",
    }
    if raw is not None:
        expected_artifacts.add("reconciled_solve" if engine["response_lost"] else "solve")
    if raw == "SAT":
        expected_artifacts.add("semantic")
    if "reconciliation_session" in payloads:
        if engine["response_lost"] is not True or raw is None:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "unexpected reconciliation session"
            )
        expected_artifacts.add("reconciliation_session")
    if set(payloads) != expected_artifacts:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "engine artifact inventory drifted"
        )
    session, receipt = _validate_transport_artifacts(prepared, engine, payloads)
    request_id = _query_request_id(prepared.key)
    request_sha256 = adapter.piqd_solve_request_digest(prepared.query, ())
    if (
        engine["solver"] != SOLVER
        or engine["session_id"] != session["id"]
        or engine["solver_signature"] != session["solver_signature"]
        or engine["solver_sha256"] != session["solver_sha256"]
        or engine["request_id"] != request_id
        or engine["request_sha256"] != request_sha256
        or engine["assumption_labels"] != []
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
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "engine identity or replay state drifted"
        )
    solve: dict[str, Any] | None = None
    if raw is not None:
        solve_label = "reconciled_solve" if engine["response_lost"] else "solve"
        solve = _strict(payloads[solve_label], "solve")
        digest = adapter.piqd_result_digest(solve)
        advisory = engine["result_digest_advisory"]
        expected_provenance = adapter._unsat_assumption_provenance(
            prepared.query, solve, ()
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
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "solve digest or receipt drifted"
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
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "transport-loss custody drifted"
        )
    if raw == "SAT":
        if solve is None:
            raise Profile0034SupportingEdgeUnguardedDeletionError("SAT solve is absent")
        semantic = engine["semantic_replay"]
        if (
            "semantic" not in payloads
            or _strict(payloads["semantic"], "semantic replay") != semantic
            or semantic != _expected_semantic(prepared, solve)
            or engine["effective_status"]
            not in {
                "SAT_SEMANTICALLY_REPLAYED",
                "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
            }
            or (engine["effective_status"] == "SAT_SEMANTICALLY_REPLAYED")
            is not (semantic.get("accepted") is True)
        ):
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "SAT exact replay drifted"
            )
    elif raw == "UNSAT":
        provenance = engine["unsat_assumptions"]
        if (
            engine["effective_status"] != "UNSAT_DISCOVERY_ONLY"
            or type(provenance) is not dict
            or provenance.get("basis") != "get-unsat-assumptions"
            or provenance.get("daemon_field") != "core"
            or provenance.get("named_core_support") is not False
            or provenance.get("terminal_unsat") is not True
            or provenance.get("assumption_terms") != []
            or provenance.get("source_atom_ids") != []
        ):
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "unguarded UNSAT provenance drifted"
            )
    elif raw == "UNKNOWN":
        if (
            engine["effective_status"] != "INCONCLUSIVE_UNKNOWN"
            or engine["semantic_replay"] is not None
            or engine["unsat_assumptions"] is not None
        ):
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "UNKNOWN custody drifted"
            )
    return classify_result({"engine": dict(engine)})


def _result_record(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    custody: Mapping[str, Any],
) -> dict[str, Any]:
    result = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": SOLVER,
        "system_sha256": _sha(_canonical(prepared.system)),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "retained_group_ids": list(prepared.system["retained_group_ids"]),
        "omitted_group_ids": list(prepared.system["omitted_group_ids"]),
        "disposition": classify_result({"engine": dict(engine)}),
        "engine": dict(engine),
        "custody": dict(custody),
        "claims": dict(FALSE_CLAIMS),
    }
    result["result_sha256"] = _self_hash(result, "result_sha256")
    return result


def verify_query_tree(prepared: PreparedQuery, output: Path) -> dict[str, Any]:
    if output.is_symlink() or not output.is_dir():
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "query output directory is unsafe"
        )
    result = _strict(_read(output / "result.json"), "query result")
    if (
        set(result)
        != {
            "schema",
            "key",
            "solver",
            "system_sha256",
            "journal_sha256",
            "retained_group_ids",
            "omitted_group_ids",
            "disposition",
            "engine",
            "custody",
            "claims",
            "result_sha256",
        }
        or result.get("schema") != RESULT_SCHEMA
        or result.get("key") != prepared.key
        or result.get("solver") != SOLVER
        or result.get("system_sha256") != _sha(_canonical(prepared.system))
        or result.get("journal_sha256") != _sha(prepared.query.journal_smt2)
        or result.get("retained_group_ids") != prepared.system["retained_group_ids"]
        or result.get("omitted_group_ids") != prepared.system["omitted_group_ids"]
        or result.get("claims") != FALSE_CLAIMS
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "query result identity drifted"
        )
    custody = result["custody"]
    if type(custody) is not dict or set(custody) != {
        "system",
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "sources",
    }:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "query custody inventory drifted"
        )
    seen: set[str] = {"result.json"}
    if _verify_artifact(output, custody["system"], seen) != _json(prepared.system):
        raise Profile0034SupportingEdgeUnguardedDeletionError("system artifact drifted")
    if (
        _verify_artifact(output, custody["descriptor"], seen)
        != prepared.query.descriptor_bytes
        or _verify_artifact(output, custody["original_smt2"], seen)
        != prepared.query.original_smt2
        or _verify_artifact(output, custody["journal_smt2"], seen)
        != prepared.query.journal_smt2
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "query descriptor or journal artifact drifted"
        )
    sources = custody["sources"]
    if type(sources) is not list or len(sources) != len(prepared.query.source_files):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "query source artifact inventory drifted"
        )
    for index, (record, snapshot) in enumerate(
        zip(sources, prepared.query.source_files, strict=True)
    ):
        expected_name = f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin"
        if record.get("path") != expected_name:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "query source artifact name drifted"
            )
        if _verify_artifact(output, record, seen) != snapshot.payload:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "query source artifact bytes drifted"
            )
    engine = result["engine"]
    if type(engine) is not dict or type(engine.get("artifacts")) is not dict:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "query engine artifacts are malformed"
        )
    payloads = {
        label: _verify_artifact(output, record, seen)
        for label, record in engine["artifacts"].items()
    }
    disposition = _validate_engine(prepared, engine, payloads)
    if result["disposition"] != disposition:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "query disposition drifted"
        )
    entries = list(output.iterdir())
    if (
        any(entry.is_symlink() or not entry.is_file() for entry in entries)
        or {entry.name for entry in entries} != seen
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
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
                ("system", "system.json", _json(prepared.system)),
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
            engine = adapter.run_authenticated_single_solver_query(
                prepared.query,
                solver=SOLVER,
                descriptor_schema=DESCRIPTOR_SCHEMA,
                solver_profile_schema=SOLVER_PROFILE_SCHEMA,
                authenticated_journal_commands=prepared.query.journal_commands,
                transport=transport,
                semantic_verifier=verify_sat_model,
                output_fd=transaction.file_descriptor,
                used_session_ids=used_session_ids if used_session_ids is not None else set(),
                request_id=_query_request_id(prepared.key),
                assumption_labels=(),
            )
            payloads = {
                label: _read_fd_artifact(transaction.file_descriptor, record["path"])
                for label, record in engine["artifacts"].items()
            }
            _validate_engine(prepared, engine, payloads)
            result = _result_record(prepared, engine, custody)
            transaction.write_bytes("result.json", _json(result))
            transaction.publish()
    except Profile0034SupportingEdgeUnguardedDeletionError:
        raise
    except (OSError, adapter.SmtSourceAdapterError) as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "authenticated PIQD query failed"
        ) from exc
    return verify_query_tree(prepared, output)


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict(_read(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != CHECKPOINT_OWNER
        or checkpoint.get("base_head") != CHECKPOINT_BASE_HEAD
        or checkpoint.get("owned_paths") != _OWNED_PATHS
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "lane checkpoint drifted"
        )
    return checkpoint


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


def _manifest_inputs(parent: Mapping[str, Any]) -> list[Path]:
    return [
        PARENT_MANIFEST_PATH,
        PARENT_LAUNCH_PATH,
        PARENT_TERMINAL_PATH,
        *[
            PARENT_ROOT / "artifacts" / key / "result.json"
            for key in sorted(parent["result_file_sha256"])
        ],
    ]


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    parent = authenticate_parent_run()
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_map(_manifest_sources()),
        "input_digests": _source_map(_manifest_inputs(parent)),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _authenticate_source_commit(manifest: Mapping[str, Any], commit: object) -> str:
    if type(commit) is not str or _FULL_COMMIT.fullmatch(commit) is None:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "execution commit is malformed"
        )
    source_digests = manifest.get("source_digests")
    expected_paths = sorted(_repo_path(path) for path in _manifest_sources())
    if type(source_digests) is not dict or sorted(source_digests) != expected_paths:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "execution source inventory drifted"
        )
    for relative in expected_paths:
        current = _read(REPOSITORY_ROOT / relative)
        if source_digests.get(relative) != _sha(current):
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                f"current bound source drifted: {relative}"
            )
        committed = _git_read(("show", f"{commit}:{relative}"), relative)
        if committed != current:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                f"execution commit source drifted: {relative}"
            )
    return commit


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    raw_head = _git_read(("rev-parse", "--verify", "HEAD^{commit}"), "current commit")
    try:
        head = raw_head.decode("ascii").strip()
    except UnicodeDecodeError as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "execution commit is malformed"
        ) from exc
    if raw_head != f"{head}\n".encode("ascii"):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "execution commit is malformed"
        )
    return _authenticate_source_commit(manifest, head)


def authenticate_recorded_execution_commit(
    manifest: Mapping[str, Any], launch: Mapping[str, Any]
) -> str:
    return _authenticate_source_commit(manifest, launch.get("execution_commit"))


def _require_safe_run_ancestors() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "run root escapes repository"
        ) from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "repository root is unsafe"
        )
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "run-root ancestor is unsafe"
            )


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_run_ancestors()
    if RUN_ROOT.is_symlink() or not RUN_ROOT.is_dir():
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "run root is absent or unsafe"
        )
    names = {entry.name for entry in RUN_ROOT.iterdir()}
    if names not in (
        {"run_manifest.json"},
        {"run_manifest.json", "artifacts", "events", "tmp"},
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "run-root inventory drifted"
        )
    manifest = _strict(_read(RUN_ROOT / "run_manifest.json"), "run manifest")
    created_utc = manifest.get("created_utc")
    if type(created_utc) is not str or manifest != _expected_run_manifest(created_utc):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "run manifest source or input digest drifted"
        )
    return RUN_ROOT, manifest


def _initialize_runtime_dirs(root: Path) -> None:
    if {entry.name for entry in root.iterdir()} != {"run_manifest.json"}:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "runtime initialization requires a manifest-only root"
        )
    for name in ("artifacts", "events", "tmp"):
        child = root / name
        child.mkdir()
        if child.is_symlink() or not child.is_dir():
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "runtime child is unsafe"
            )


def _flat_snapshot(path: Path, *, allow_empty: bool = False) -> list[dict[str, Any]]:
    if path.is_symlink() or not path.is_dir():
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "runtime artifact directory is unsafe"
        )
    records = []
    for entry in sorted(path.iterdir(), key=lambda item: item.name):
        info = entry.lstat()
        if entry.is_symlink() or not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "runtime artifact directory is nested or unsafe"
            )
        payload = _read(entry)
        records.append(
            {"path": entry.name, "bytes": len(payload), "sha256": _sha(payload)}
        )
    if not records and not allow_empty:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
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
        or tuple(tmp.iterdir())
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "runtime branches are unsafe or nonempty"
        )
    records: dict[str, Any] = {}
    for entry in sorted(artifacts.iterdir(), key=lambda item: item.name):
        if entry.is_symlink() or not entry.is_dir():
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "runtime artifact entry is unsafe"
            )
        if entry.name in QUERY_KEYS:
            files = _flat_snapshot(entry)
            if "result.json" not in {record["path"] for record in files}:
                raise Profile0034SupportingEdgeUnguardedDeletionError(
                    "partial query output is not resumable"
                )
            records[entry.name] = {"kind": "query", "files": files}
        elif _TOMBSTONE.fullmatch(entry.name):
            records[entry.name] = {
                "kind": "adapter-tombstone",
                "files": _flat_snapshot(entry, allow_empty=True),
            }
        else:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "undeclared runtime artifact entry"
            )
    launch = root / "events/launch.json"
    return {
        "launch_sha256": _sha(_read(launch)) if launch.exists() else None,
        "artifacts": records,
        "tmp_entries": [],
    }


def _inventory(
    root: Path, prepared: Mapping[str, PreparedQuery] | None = None
) -> str:
    if root.is_symlink() or not root.is_dir():
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "runtime root is unsafe"
        )
    names = {entry.name for entry in root.iterdir()}
    if names == {"run_manifest.json"}:
        return "INITIALIZED"
    if names != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "runtime root inventory drifted"
        )
    _runtime_snapshot(root)
    event_names = {entry.name for entry in (root / "events").iterdir()}
    if event_names == set():
        if tuple((root / "artifacts").iterdir()):
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "initialized root contains artifacts"
            )
        return "RUNTIME_READY"
    if event_names == {"launch.json"}:
        return "LAUNCHED"
    if event_names == {"launch.json", "terminal.json"}:
        entries = {entry.name for entry in (root / "artifacts").iterdir()}
        if entries != set(QUERY_KEYS):
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "terminal artifact inventory is incomplete"
            )
        if prepared is not None:
            if set(prepared) != set(QUERY_KEYS):
                raise Profile0034SupportingEdgeUnguardedDeletionError(
                    "terminal prepared-query inventory is incomplete"
                )
            for key in QUERY_KEYS:
                verify_query_tree(prepared[key], root / "artifacts" / key)
        return "TERMINAL"
    raise Profile0034SupportingEdgeUnguardedDeletionError(
        "runtime event inventory drifted"
    )


def _probe_batches(workers: int) -> list[list[str]]:
    if type(workers) is not int or type(workers) is bool or not 1 <= workers <= MAX_WORKERS:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            f"workers must lie in 1..{MAX_WORKERS}"
        )
    return [list(PROBE_KEYS[index : index + workers]) for index in range(0, len(PROBE_KEYS), workers)]


def _launch_record(
    manifest: Mapping[str, Any], execution_commit: str, server: str, workers: int
) -> dict[str, Any]:
    if _FULL_COMMIT.fullmatch(execution_commit) is None:
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "launch execution commit is malformed"
        )
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_commit": execution_commit,
        "queries": list(QUERY_KEYS),
        "control_order": list(CONTROL_KEYS),
        "probe_batches": _probe_batches(workers),
        "candidate_order": list(CANDIDATE_KEYS),
        "server": server,
        "timeout_ms": TIMEOUT_MS,
        "workers": workers,
        "max_workers": MAX_WORKERS,
        "sessions": len(QUERY_KEYS),
        "solves_per_session": 1,
        "transport": "maintained PIQD HTTP SMT adapter; fresh named sessions only",
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _require_controls(results: Mapping[str, Mapping[str, Any]]) -> None:
    if classify_result(results.get("z3-control-positive")) != "SAT_REPLAYED":
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "positive control failed exact replay"
        )
    if classify_result(results.get("z3-control-negative")) != "UNSAT_CUSTODY_VALID":
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "negative control did not return terminal UNSAT"
        )


def _terminal_record(
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    results: Mapping[str, Mapping[str, Any]],
    prepared: Mapping[str, PreparedQuery],
) -> dict[str, Any]:
    if set(results) != set(QUERY_KEYS) or set(prepared) != set(QUERY_KEYS):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "terminal result inventory is incomplete"
        )
    _require_controls(results)
    dispositions = {key: classify_result(results[key]) for key in QUERY_KEYS}
    if any(value == "MALFORMED" for value in dispositions.values()):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "verified result has a malformed disposition"
        )
    counts = {
        disposition: sum(value == disposition for value in dispositions.values())
        for disposition in sorted(set(dispositions.values()))
    }
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": "UNGUARDED_DELETION_CAMPAIGN_COMPLETE",
        "query_count": len(QUERY_KEYS),
        "probe_count": len(PROBE_KEYS),
        "disposition_counts": counts,
        "results": {
            key: {
                "disposition": dispositions[key],
                "raw_status": results[key]["engine"]["raw_status"],
                "effective_status": results[key]["engine"]["effective_status"],
                "result_sha256": results[key]["result_sha256"],
            }
            for key in QUERY_KEYS
        },
        "reduced_candidates": {
            key: {
                "retained_group_ids": list(prepared[key].system["retained_group_ids"]),
                "omitted_group_ids": list(prepared[key].system["omitted_group_ids"]),
                "result_disposition": dispositions[key],
                "scope": "authenticated reduced formula discovery only",
            }
            for key in CANDIDATE_KEYS
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
            "query_count",
            "probe_count",
            "disposition_counts",
            "results",
            "reduced_candidates",
            "claims",
            "terminal_sha256",
        }
        or value.get("schema") != TERMINAL_SCHEMA
        or value.get("lane_id") != LANE_ID
        or value.get("run_id") != RUN_ID
        or value.get("status") != "UNGUARDED_DELETION_CAMPAIGN_COMPLETE"
        or value.get("query_count") != 55
        or value.get("probe_count") != 51
        or value.get("claims") != FALSE_CLAIMS
        or value.get("terminal_sha256") != _self_hash(value, "terminal_sha256")
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "terminal record is malformed"
        )
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
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "invalid PIQD server URL"
        )
    return server.rstrip("/")


def _initial_prepared(
    parent: Mapping[str, Any]
) -> dict[str, PreparedQuery]:
    return {
        key: prepare_query(key, parent=parent)
        for key in CONTROL_KEYS + PROBE_KEYS
    }


def _candidate_inputs(
    root: Path, results: Mapping[str, Mapping[str, Any]]
) -> tuple[dict[str, Mapping[str, Any]], tuple[adapter.SourceSnapshot, ...]]:
    probes = {key: results[key] for key in PROBE_KEYS}
    snapshots = tuple(
        adapter.SourceSnapshot(
            f"probe-result-{key}.json",
            _read(root / "artifacts" / key / "result.json"),
        )
        for key in PROBE_KEYS
    )
    return probes, snapshots


def _completed_prepared(
    root: Path,
    parent: Mapping[str, Any],
) -> tuple[dict[str, PreparedQuery], dict[str, dict[str, Any]]]:
    prepared = _initial_prepared(parent)
    results = {
        key: verify_query_tree(prepared[key], root / "artifacts" / key)
        for key in CONTROL_KEYS + PROBE_KEYS
    }
    probes, snapshots = _candidate_inputs(root, results)
    for key in CANDIDATE_KEYS:
        prepared[key] = prepare_query(
            key,
            parent=parent,
            probe_results=probes,
            decision_sources=snapshots,
        )
        results[key] = verify_query_tree(prepared[key], root / "artifacts" / key)
    return prepared, results


def _run_deterministic_batches(
    prepared: Mapping[str, PreparedQuery],
    root: Path,
    transport: adapter.PiqdTransport,
    workers: int,
) -> dict[str, dict[str, Any]]:
    results: dict[str, dict[str, Any]] = {}
    for batch in _probe_batches(workers):
        with concurrent.futures.ThreadPoolExecutor(max_workers=len(batch)) as pool:
            futures = {
                key: pool.submit(
                    run_query,
                    prepared[key],
                    root / "artifacts" / key,
                    transport,
                )
                for key in batch
            }
            for key in batch:
                results[key] = futures[key].result()
    return results


def run_campaign(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = DEFAULT_WORKERS,
    init_only: bool = False,
    transport: adapter.PiqdTransport | None = None,
) -> dict[str, Any]:
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or timeout_s != DEFAULT_TIMEOUT_S
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "timeout is fixed at 60 seconds"
        )
    _probe_batches(workers)
    root, manifest = ensure_run_root()
    parent = authenticate_parent_run()
    phase = _inventory(root)
    if init_only:
        if phase != "INITIALIZED":
            raise Profile0034SupportingEdgeUnguardedDeletionError(
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
        execution_commit = authenticate_recorded_execution_commit(manifest, stored_launch)
        launch = _launch_record(manifest, execution_commit, server, workers)
        if stored_launch != launch:
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "launch does not match terminal replay"
            )
        prepared, results = _completed_prepared(root, parent)
        stored = _read_terminal(terminal_path)
        expected = _terminal_record(manifest, launch, results, prepared)
        if stored != expected or _inventory(root, prepared) != "TERMINAL":
            raise Profile0034SupportingEdgeUnguardedDeletionError(
                "terminal does not match artifact replay"
            )
        return stored
    if phase != "INITIALIZED":
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "incomplete launch cannot resume; use a fresh run id"
        )
    execution_commit = authenticate_execution_commit(manifest)
    launch = _launch_record(manifest, execution_commit, server, workers)
    _initialize_runtime_dirs(root)
    _publish_once(launch_path, _json(launch))
    if _inventory(root) != "LAUNCHED":
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "launch inventory drifted"
        )
    active_transport = transport or adapter.UrllibPiqdTransport(
        server, http_timeout_s=DEFAULT_TIMEOUT_S + 40
    )
    prepared = _initial_prepared(parent)
    results: dict[str, dict[str, Any]] = {}
    for key in CONTROL_KEYS:
        results[key] = run_query(
            prepared[key], root / "artifacts" / key, active_transport
        )
    _require_controls(results)
    results.update(
        _run_deterministic_batches(prepared, root, active_transport, workers)
    )
    probes, snapshots = _candidate_inputs(root, results)
    for key in CANDIDATE_KEYS:
        prepared[key] = prepare_query(
            key,
            parent=parent,
            probe_results=probes,
            decision_sources=snapshots,
        )
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        futures = {
            key: pool.submit(
                run_query,
                prepared[key],
                root / "artifacts" / key,
                active_transport,
            )
            for key in CANDIDATE_KEYS
        }
        for key in CANDIDATE_KEYS:
            results[key] = futures[key].result()
    session_ids = [result["engine"]["session_id"] for result in results.values()]
    if (
        any(type(session_id) is not str or not session_id for session_id in session_ids)
        or len(set(session_ids)) != len(QUERY_KEYS)
    ):
        raise Profile0034SupportingEdgeUnguardedDeletionError(
            "query session identities crossed"
        )
    terminal = _terminal_record(manifest, launch, results, prepared)
    _publish_once(terminal_path, _json(terminal))
    if _inventory(root, prepared) != "TERMINAL":
        raise Profile0034SupportingEdgeUnguardedDeletionError(
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
    except (Profile0034SupportingEdgeUnguardedDeletionError, OSError, ValueError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 2
    if args.verbose:
        print(json.dumps(result, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
