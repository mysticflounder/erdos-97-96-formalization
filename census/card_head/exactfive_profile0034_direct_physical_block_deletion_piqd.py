"""Governed PIQD/Z3 physical-block deletion for the direct profile-0034 cells.

This is a discovery producer.  It binds the completed supporting-edge run, then
tests whole physical assertion groups from each direct radius branch.  It does
not claim that the coordinate formula is realized by the live Lean source.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import datetime as dt
import hashlib
import json
import os
import re
import stat
import subprocess
import threading
import uuid
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_hard_source_swap_profile0034_supporting_edge_qfnra_piqd as source,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-profile0034-direct-physical-block-deletion-piqd-20260905"
RUN_ID = "run-0001"
SOLVER = "z3"
TIMEOUT_MS = 60_000
DEFAULT_TIMEOUT_S = 60.0
DEFAULT_WORKERS = 20
MAX_WORKERS = 20
QUERY_CAP_PER_BRANCH = 128
BRANCH_IDS = ("lt", "gt")
DIRECT_ORDER_ID = "parent-cvc5-direct"
DIRECT_ORDER = (
    "c000", "c007", "c012", "c005", "c008", "c009", "c011",
    "c010", "c001", "c006", "c002", "c004", "c003",
)
CONTROL_KEYS = ("z3-control-positive", "z3-control-negative")
GRANULARITIES = (2, 4, 8, 16, 26)
CHECKPOINT_OWNER = "profile0034-direct-physical-block-deletion-impl"
CHECKPOINT_BASE_HEAD = "ed08027473e9741b2a34fac7d7597d2fe6756085"

EDGE_GROUP_IDS = tuple(f"edge-index-{index:02d}" for index in range(13))
ROW_GROUP_IDS = tuple(f"source-row-equality-{index:02d}" for index in range(11))
RADIUS_GROUP_ID = "radius-branch"
STRICT_GROUP_ID = "source-strict"
GROUP_UNIVERSE = EDGE_GROUP_IDS + ROW_GROUP_IDS + (RADIUS_GROUP_ID, STRICT_GROUP_ID)

FALSE_CLAIMS = {
    "source_realization": False,
    "live_source_completeness": False,
    "all_order_coverage": False,
    "theorem": False,
    "lean_ingress": False,
    "closure": False,
    "promotion": False,
    "core_minimality": False,
}

REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-profile0034-direct-physical-block-deletion-piqd-v1.md"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_profile0034_direct_physical_block_deletion_piqd.py"
)
OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_profile0034_direct_physical_block_deletion_piqd.py",
    "census/card_head/tests/test_exactfive_profile0034_direct_physical_block_deletion_piqd.py",
    "docs/specs/p97-exactfive-profile0034-direct-physical-block-deletion-piqd-v1.md",
    "scripts/run_exactfive_profile0034_direct_physical_block_deletion_piqd.py",
]
PARENT_ROOT = source.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"

MODULE_PINS = {
    "supporting_edge": "75cf96e48d7f0ceb89c965e3cec0d5315107b128540c608f350420689b641534",
    "predecessor": "48ea11c20276ee883f8b244ed3a423a858e787768f6e80621edf7c0b80962237",
    "bo_source": "9360339a81ce259e03c38d18f27e2808279b6d5f1869337383f2d4f904f5faf1",
    "adapter": "94058aa4e04b5acc27242b52781794944ea00a069b16805104d3263203d65e70",
}
PARENT_RECORD_PINS = {
    "manifest_file": "c1192f3afed7e089b8fbb7e49e8c4deec2cda36717e9cec537e3bf63689b96c5",
    "manifest": "6e469b3048aec1f26e1c94e644adf570752eaea49ee1dd91c60b3605d5ac50c4",
    "launch_file": "faedccc1afaa8050ac1b5d7a702dcadbbf0be6e7a5cceb8e0ae11bb45b16a250",
    "launch": "28547a2032ae396844226c89851524a24f4583b8b2824f445fe658bf1bf12997",
    "terminal_file": "09c2e3d4a9839814bf7c2c5dd4fd88b10002188acbb94d10c02be01c0954823f",
    "terminal": "db6ec92b4f2047722d3934abdac0d8bd79512768b3dc52b67cbedf71750513a5",
}
DIRECT_ARTIFACT_PINS = {
    "lt": {
        "result.json": "44cd395e4db75d0bf340710e982d003915a2f21d70703f00bad6c266562a259e",
        "journal.smt2": "330e657acc657e76c12d275c35dab43bf45a5fee1b1ca5cc7be84079df66341e",
        "descriptor.json": "0ec935f7b6fb7fb97783377912acb73d18c0edf26464cc7817e9161c276478ad",
        "source-manifest.json": "6b891c915c6afbca07f79b5b72b71ef6e247a7f0860e869c7469e2f0b531374f",
    },
    "gt": {
        "result.json": "608ac1a197610163fcf2a7bb1073e30c5d640b94469aa242f4b944778b84c683",
        "journal.smt2": "a457faa7eea07e01442a57c1e2dd8558bf5528576c238fc7a0b1456e216693eb",
        "descriptor.json": "eff18a51d6188e3e9be0d610cfc7a6b89e251dc5a7a3174864818f5332d14431",
        "source-manifest.json": "4934cd4adc34d0cacc13a2d891acf10536362c8113c3f1e32a9f06be0acee86c",
    },
}
EXPECTED_PARENT_CUSTODY_SHA256 = (
    "bfd361aa57fa6527b81974a9017eea9148f37d46aed2930ab0c4fe64782b3679"
)

SYSTEM_SCHEMA = "p97-exactfive-profile0034-direct-physical-block-system/v1"
RESULT_SCHEMA = "p97-exactfive-profile0034-direct-physical-block-result/v1"
ROUND_SCHEMA = "p97-exactfive-profile0034-direct-physical-block-round/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-direct-physical-block-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-direct-physical-block-terminal/v1"
DESCRIPTOR_SCHEMA = adapter.QUERY_SCHEMA
SOLVER_PROFILE_SCHEMA = adapter.SOLVER_PROFILE_SCHEMA
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
_FULL_COMMIT = re.compile(r"[0-9a-f]{40}")


class DirectPhysicalBlockDeletionError(RuntimeError):
    """The direct physical-block deletion producer failed closed."""


@dataclass(frozen=True)
class QuerySpec:
    key: str
    branch_id: str | None
    round_index: int
    probe_index: int
    current_group_ids: tuple[str, ...]
    deleted_block: tuple[str, ...]
    retained_group_ids: tuple[str, ...]


@dataclass(frozen=True)
class PreparedQuery:
    spec: QuerySpec
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery
    system_bytes: bytes

    @property
    def key(self) -> str:
        return self.spec.key


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
        descriptor = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    except OSError as exc:
        raise DirectPhysicalBlockDeletionError(f"unsafe or missing input: {path}") from exc
    try:
        info = os.fstat(descriptor)
        if (
            not stat.S_ISREG(info.st_mode)
            or info.st_nlink != 1
            or info.st_size > limit
        ):
            raise DirectPhysicalBlockDeletionError(f"unsafe input file: {path}")
        chunks = []
        total = 0
        while chunk := os.read(descriptor, min(65536, limit + 1 - total)):
            chunks.append(chunk)
            total += len(chunk)
            if total > limit:
                raise DirectPhysicalBlockDeletionError(f"oversized input: {path}")
        if total != info.st_size:
            raise DirectPhysicalBlockDeletionError(f"input changed while reading: {path}")
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    def pairs(rows: list[tuple[str, Any]]) -> dict[str, Any]:
        value: dict[str, Any] = {}
        for key, item in rows:
            if key in value:
                raise DirectPhysicalBlockDeletionError(f"duplicate JSON key: {where}/{key}")
            value[key] = item
        return value

    try:
        value = json.loads(payload, object_pairs_hook=pairs)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise DirectPhysicalBlockDeletionError(f"invalid JSON: {where}") from exc
    if type(value) is not dict:
        raise DirectPhysicalBlockDeletionError(f"JSON object required: {where}")
    return value


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise DirectPhysicalBlockDeletionError("source path lies outside repository") from exc


def _module_paths() -> dict[str, Path]:
    return {
        "supporting_edge": Path(source.__file__).resolve(),
        "predecessor": Path(source.predecessor.__file__).resolve(),
        "bo_source": Path(source.bo_source.__file__).resolve(),
        "adapter": Path(adapter.__file__).resolve(),
    }


def _artifact_root(branch: str) -> Path:
    return PARENT_ROOT / "artifacts" / f"{DIRECT_ORDER_ID}-radius-{branch}"


def _parent_input_paths() -> list[Path]:
    paths = [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
    for branch in BRANCH_IDS:
        root = _artifact_root(branch)
        paths.extend(root / name for name in DIRECT_ARTIFACT_PINS[branch])
    return paths


def authenticate_parent_run() -> dict[str, Any]:
    """Bind the direct supporting-edge cells and their complete source custody."""

    for name, path in _module_paths().items():
        if _sha(_read(path)) != MODULE_PINS[name]:
            raise DirectPhysicalBlockDeletionError(f"source module drifted: {name}")
    manifest_payload = _read(PARENT_MANIFEST_PATH)
    launch_payload = _read(PARENT_LAUNCH_PATH)
    terminal_payload = _read(PARENT_TERMINAL_PATH)
    if (
        _sha(manifest_payload) != PARENT_RECORD_PINS["manifest_file"]
        or _sha(launch_payload) != PARENT_RECORD_PINS["launch_file"]
        or _sha(terminal_payload) != PARENT_RECORD_PINS["terminal_file"]
    ):
        raise DirectPhysicalBlockDeletionError("parent record bytes drifted")
    manifest = _strict(manifest_payload, "parent manifest")
    launch = _strict(launch_payload, "parent launch")
    terminal = _strict(terminal_payload, "parent terminal")
    if (
        manifest.get("manifest_sha256") != PARENT_RECORD_PINS["manifest"]
        or manifest.get("manifest_sha256") != _self_hash(manifest, "manifest_sha256")
        or launch.get("launch_sha256") != PARENT_RECORD_PINS["launch"]
        or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256")
        or terminal.get("terminal_sha256") != PARENT_RECORD_PINS["terminal"]
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
        or launch.get("run_manifest_sha256") != manifest["manifest_sha256"]
        or terminal.get("run_manifest_sha256") != manifest["manifest_sha256"]
        or terminal.get("launch_sha256") != launch["launch_sha256"]
        or terminal.get("status") != "TARGET_INCONCLUSIVE"
    ):
        raise DirectPhysicalBlockDeletionError("parent record identity drifted")

    prior = source.authenticate_predecessor_run()
    systems: dict[str, dict[str, Any]] = {}
    for branch in BRANCH_IDS:
        system = source._build_target_from_prior(prior, DIRECT_ORDER_ID, branch)
        key = f"{DIRECT_ORDER_ID}-radius-{branch}"
        if system.get("key") != key or tuple(system.get("order", ())) != DIRECT_ORDER:
            raise DirectPhysicalBlockDeletionError("direct order identity drifted")
        root = _artifact_root(branch)
        for name, digest in DIRECT_ARTIFACT_PINS[branch].items():
            if _sha(_read(root / name)) != digest:
                raise DirectPhysicalBlockDeletionError(
                    f"direct parent artifact drifted: {branch}/{name}"
                )
        prepared = source._prepare_query_with_prior(system, prior, timeout_ms=TIMEOUT_MS)
        source.verify_adapter_tree(prepared, root)
        terminal_row = terminal.get("results", {}).get(key)
        if (
            type(terminal_row) is not dict
            or terminal_row.get("result_sha256") != DIRECT_ARTIFACT_PINS[branch]["result.json"]
        ):
            raise DirectPhysicalBlockDeletionError("parent terminal result pin drifted")
        systems[branch] = system
    record = {
        "schema": "p97-exactfive-profile0034-direct-parent-custody/v1",
        "parent_manifest_sha256": manifest["manifest_sha256"],
        "parent_launch_sha256": launch["launch_sha256"],
        "parent_terminal_sha256": terminal["terminal_sha256"],
        "module_sha256s": dict(MODULE_PINS),
        "direct_artifact_sha256s": {
            branch: dict(DIRECT_ARTIFACT_PINS[branch]) for branch in BRANCH_IDS
        },
        "direct_order_id": DIRECT_ORDER_ID,
        "direct_order": list(DIRECT_ORDER),
        "source_systems": systems,
        "claims": dict(FALSE_CLAIMS),
    }
    record["parent_custody_sha256"] = _self_hash(record, "parent_custody_sha256")
    return record


def canonical_group_ids(group_ids: Sequence[str]) -> tuple[str, ...]:
    if (
        isinstance(group_ids, (str, bytes))
        or len(group_ids) != len(set(group_ids))
        or not set(group_ids) <= set(GROUP_UNIVERSE)
    ):
        raise DirectPhysicalBlockDeletionError("group selection is invalid")
    selected = set(group_ids)
    return tuple(group_id for group_id in GROUP_UNIVERSE if group_id in selected)


def stable_partition(items: Sequence[str], parts: int) -> tuple[tuple[str, ...], ...]:
    rows = tuple(items)
    if type(parts) is not int or type(parts) is bool or parts <= 0 or not rows:
        raise DirectPhysicalBlockDeletionError("partition request is invalid")
    count = min(parts, len(rows))
    quotient, remainder = divmod(len(rows), count)
    result: list[tuple[str, ...]] = []
    cursor = 0
    for index in range(count):
        width = quotient + (1 if index < remainder else 0)
        result.append(rows[cursor : cursor + width])
        cursor += width
    if tuple(item for block in result for item in block) != rows:
        raise DirectPhysicalBlockDeletionError("partition lost group identity")
    return tuple(result)


def _selection_sha(group_ids: Sequence[str]) -> str:
    return _sha(_canonical(list(canonical_group_ids(group_ids))))


def anchor_spec(branch: str) -> QuerySpec:
    if branch not in BRANCH_IDS:
        raise DirectPhysicalBlockDeletionError("unknown branch")
    return QuerySpec(
        f"z3-direct-{branch}-r000-anchor", branch, 0, 0,
        GROUP_UNIVERSE, (), GROUP_UNIVERSE,
    )


def candidate_specs(
    branch: str, round_index: int, current: Sequence[str], granularity: int
) -> tuple[QuerySpec, ...]:
    if branch not in BRANCH_IDS or round_index <= 0:
        raise DirectPhysicalBlockDeletionError("candidate round is invalid")
    current_ids = canonical_group_ids(current)
    specs = []
    for probe_index, block in enumerate(stable_partition(current_ids, granularity)):
        retained = tuple(group for group in current_ids if group not in set(block))
        key = (
            f"z3-direct-{branch}-r{round_index:03d}-g{granularity:02d}-"
            f"p{probe_index:02d}-{_selection_sha(retained)[:12]}"
        )
        specs.append(
            QuerySpec(key, branch, round_index, probe_index, current_ids, block, retained)
        )
    return tuple(specs)


def control_spec(key: str) -> QuerySpec:
    if key not in CONTROL_KEYS:
        raise DirectPhysicalBlockDeletionError("unknown control")
    return QuerySpec(key, None, 0, 0, (), (), ())


def query_spec_record(spec: QuerySpec) -> dict[str, Any]:
    return {
        "key": spec.key,
        "branch_id": spec.branch_id,
        "round_index": spec.round_index,
        "probe_index": spec.probe_index,
        "current_group_ids": list(spec.current_group_ids),
        "deleted_block": list(spec.deleted_block),
        "retained_group_ids": list(spec.retained_group_ids),
        "current_sha256": _selection_sha(spec.current_group_ids) if spec.branch_id else None,
        "retained_sha256": _selection_sha(spec.retained_group_ids) if spec.branch_id else None,
    }


def query_spec_from_record(record: object) -> QuerySpec:
    if type(record) is not dict:
        raise DirectPhysicalBlockDeletionError("query spec is malformed")
    spec = QuerySpec(
        record.get("key"), record.get("branch_id"), record.get("round_index"),
        record.get("probe_index"), tuple(record.get("current_group_ids", ())),
        tuple(record.get("deleted_block", ())), tuple(record.get("retained_group_ids", ())),
    )
    if query_spec_record(spec) != record:
        raise DirectPhysicalBlockDeletionError("query spec identity drifted")
    return spec


def build_system(spec: QuerySpec, parent: Mapping[str, Any]) -> dict[str, Any]:
    if spec.branch_id is None:
        control = "positive" if spec.key == CONTROL_KEYS[0] else "negative"
        return {
            "schema": SYSTEM_SCHEMA,
            "kind": "control",
            "key": spec.key,
            "control": control,
            "variables": ["witness"],
            "claims": dict(FALSE_CLAIMS),
        }
    current = canonical_group_ids(spec.current_group_ids)
    retained = canonical_group_ids(spec.retained_group_ids)
    block = canonical_group_ids(spec.deleted_block)
    if (
        spec.branch_id not in BRANCH_IDS
        or current != spec.current_group_ids
        or retained != spec.retained_group_ids
        or set(block) & set(retained)
        or set(block) | set(retained) != set(current)
    ):
        raise DirectPhysicalBlockDeletionError("target query spec is inconsistent")
    parent_system = parent.get("source_systems", {}).get(spec.branch_id)
    if type(parent_system) is not dict or tuple(parent_system.get("order", ())) != DIRECT_ORDER:
        raise DirectPhysicalBlockDeletionError("direct source system is absent")
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "key": spec.key,
        "order_id": DIRECT_ORDER_ID,
        "order": list(DIRECT_ORDER),
        "branch_id": spec.branch_id,
        "source_system": parent_system,
        "retained_group_ids": list(retained),
        "omitted_group_ids": [g for g in GROUP_UNIVERSE if g not in retained],
        "claims": dict(FALSE_CLAIMS),
    }


def assertion_group_ledger(source_system: Mapping[str, Any]) -> tuple[dict[str, Any], ...]:
    rows: list[dict[str, Any]] = []
    for index in range(13):
        commands = [
            f"(assert (> {row['expression']} 0))"
            for row in source_system["supporting_edges"]
            if row["edge_index"] == index
        ]
        rows.append({"group_id": f"edge-index-{index:02d}", "commands": commands})
    for index, row in enumerate(source_system["source_row_equalities"]):
        rows.append(
            {
                "group_id": f"source-row-equality-{index:02d}",
                "commands": [f"(assert (= {row['left']} {row['right']}))"],
            }
        )
    radius = source_system["radius_branch"]
    strict = source_system["source_strict"]
    rows.append(
        {
            "group_id": RADIUS_GROUP_ID,
            "commands": [f"(assert ({radius['relation']} {radius['left']} {radius['right']}))"],
        }
    )
    rows.append(
        {
            "group_id": STRICT_GROUP_ID,
            "commands": [f"(assert (< {strict['left']} {strict['right']}))"],
        }
    )
    if (
        tuple(row["group_id"] for row in rows) != GROUP_UNIVERSE
        or [len(row["commands"]) for row in rows[:13]] != [11] * 13
        or sum(len(row["commands"]) for row in rows) != 156
    ):
        raise DirectPhysicalBlockDeletionError("26-group assertion ledger drifted")
    return tuple(rows)


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    if system.get("schema") != SYSTEM_SCHEMA or system.get("claims") != FALSE_CLAIMS:
        raise DirectPhysicalBlockDeletionError("system identity drifted")
    if system.get("kind") == "control":
        commands = ["(set-logic QF_NRA)", "(declare-fun witness () Real)", "(assert (= witness 1))"]
        if system.get("control") == "negative":
            commands.append("(assert (= witness 2))")
        elif system.get("control") != "positive":
            raise DirectPhysicalBlockDeletionError("control identity drifted")
        return tuple(commands)
    if system.get("kind") != "target" or tuple(system.get("order", ())) != DIRECT_ORDER:
        raise DirectPhysicalBlockDeletionError("target identity drifted")
    source_system = system["source_system"]
    retained = set(canonical_group_ids(system["retained_group_ids"]))
    commands = ["(set-logic QF_NRA)"]
    commands.extend(f"(declare-fun {name} () Real)" for name in source_system["variables"])
    for row in assertion_group_ledger(source_system):
        if row["group_id"] in retained:
            commands.extend(row["commands"])
    return tuple(commands)


def _source_paths() -> list[Path]:
    return [Path(__file__), *_module_paths().values(), SPEC_PATH, RUNNER_PATH]


def _source_snapshots(
    parent: Mapping[str, Any], system: Mapping[str, Any]
) -> tuple[adapter.SourceSnapshot, ...]:
    snapshots = [
        adapter.SourceSnapshot("0000-parent-custody.json", _json(parent)),
        adapter.SourceSnapshot("0001-query-system.json", _json(system)),
    ]
    for index, path in enumerate(_source_paths()):
        snapshots.append(
            adapter.SourceSnapshot(
                f"source-{index:02d}-{_repo_path(path).replace('/', '--')}", _read(path)
            )
        )
    for index, path in enumerate(_parent_input_paths()):
        snapshots.append(
            adapter.SourceSnapshot(
                f"input-{index:02d}-{_repo_path(path).replace('/', '--')}", _read(path)
            )
        )
    names = [item.path for item in snapshots]
    if len(names) != len(set(names)):
        raise DirectPhysicalBlockDeletionError("source snapshot names collided")
    return tuple(sorted(snapshots, key=lambda item: item.path))


def prepare_query(
    spec: QuerySpec, *, parent: Mapping[str, Any] | None = None
) -> PreparedQuery:
    parent_record = dict(parent or authenticate_parent_run())
    if (
        parent_record.get("parent_custody_sha256") != EXPECTED_PARENT_CUSTODY_SHA256
        or parent_record.get("parent_custody_sha256")
        != _self_hash(parent_record, "parent_custody_sha256")
        or parent_record.get("module_sha256s") != MODULE_PINS
        or parent_record.get("direct_artifact_sha256s") != DIRECT_ARTIFACT_PINS
        or parent_record.get("direct_order") != list(DIRECT_ORDER)
        or parent_record.get("claims") != FALSE_CLAIMS
    ):
        raise DirectPhysicalBlockDeletionError("parent custody identity is not pinned")
    system = build_system(spec, parent_record)
    commands = build_smt_commands(system)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise DirectPhysicalBlockDeletionError("SMT journal normalization drifted")
    if spec.branch_id is not None and spec.round_index == 0:
        expected = tuple(source._build_smt_commands_current(system["source_system"]))
        if commands != expected or spec.retained_group_ids != GROUP_UNIVERSE:
            raise DirectPhysicalBlockDeletionError("anchor is not the full direct source formula")
    variables = sorted(
        (
            {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
            for variable in system.get("source_system", system)["variables"]
        ),
        key=lambda row: row["id"],
    )
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "journal_sha256": _sha(journal),
        "parent_custody_sha256": parent_record["parent_custody_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _source_snapshots(parent_record, system)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-profile0034-direct-physical-block", "version": "v1"},
        "semantic_verifier": {"id": "exact-rational-retained-groups", "version": "v1"},
        "stage_id": "profile0034-direct-physical-block-deletion",
        "query_id": spec.key,
        "sources": [
            {"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)}
            for item in snapshots
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {"path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)},
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [row["id"] for row in variables],
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
    adapter.validate_authenticated_single_solver_query(
        query,
        solver=SOLVER,
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=SOLVER_PROFILE_SCHEMA,
        authenticated_journal_commands=commands,
    )
    return PreparedQuery(spec, system, query, _json(system))


def _replay_target(
    system: Mapping[str, Any], coords: Mapping[str, tuple[Fraction, Fraction]]
) -> dict[str, Any]:
    source_system = system["source_system"]
    if set(coords) != set(source.CLASS_IDS):
        return {"accepted": False, "reason": "coordinate_replay_not_total"}
    for name, value in source.predecessor._frame_coordinates(DIRECT_ORDER_ID).items():
        if coords.get(name) != value:
            return {"accepted": False, "reason": "direct_equilateral_frame"}
    retained = set(system["retained_group_ids"])
    for edge in source_system["supporting_edges"]:
        if (
            f"edge-index-{edge['edge_index']:02d}" in retained
            and source._area_value(coords, *edge["edge"], edge["vertex"]) <= 0
        ):
            return {"accepted": False, "reason": "supporting_edge"}
    for index, row in enumerate(source_system["source_row_equalities"]):
        if f"source-row-equality-{index:02d}" not in retained:
            continue
        left = source._distance_value(coords, row["center_role"], row["first_support_role"])
        right = source._distance_value(coords, row["center_role"], row["other_support_role"])
        if left != right:
            return {"accepted": False, "reason": f"source_row_equality_{index:02d}"}
    role = source_system["role_class"]
    radius = source_system["radius_branch"]
    if RADIUS_GROUP_ID in retained:
        left = source._distance_value(coords, role["c2"], role["O"])
        right = source._distance_value(coords, role["c2"], role["d"])
        if not (left < right if radius["relation"] == "<" else left > right):
            return {"accepted": False, "reason": "radius_branch"}
    if STRICT_GROUP_ID in retained:
        left = source._distance_value(coords, role["e"], role["d"])
        right = source._distance_value(coords, role["e"], role["a"])
        if not left < right:
            return {"accepted": False, "reason": "source_strict"}
    return {"accepted": True, "retained_group_count": len(retained)}


def verify_sat_model(
    query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None
) -> adapter.SemanticVerification:
    if solver != SOLVER or type(model) is not str or type(values) is not str:
        raise DirectPhysicalBlockDeletionError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    system = semantic.get("system") if type(semantic) is dict else None
    if type(system) is not dict or build_smt_commands(system) != query.journal_commands:
        raise DirectPhysicalBlockDeletionError("SAT replay query drifted")
    try:
        if system["kind"] == "control":
            parsed = source.bo_source.parse_exact_values(values, ("witness",))
            evidence = {
                "accepted": system["control"] == "positive" and parsed == {"witness": Fraction(1)},
                "control": system["control"],
            }
        else:
            coords = source._parse_coordinates(values, query.get_values)
            evidence = _replay_target(system, coords)
            evidence["exact_coordinate_count"] = len(coords)
    except (ValueError, KeyError, source.Profile0034SupportingEdgeError, source.bo_source.BoSourceQfnraError) as exc:
        evidence = {"accepted": False, "reason": "exact_readback_unsupported", "failure": type(exc).__name__}
    evidence.update(
        {
            "solver": solver,
            "model_sha256": _sha(model.encode()),
            "values_sha256": _sha(values.encode()),
            "system_sha256": _sha(_canonical(system)),
        }
    )
    return adapter.SemanticVerification(bool(evidence.get("accepted")), evidence)


class SemanticVerdictCache:
    def __init__(self) -> None:
        self._lock = threading.Lock()
        self._values: dict[str, adapter.SemanticVerification] = {}

    def verify(
        self, query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None
    ) -> adapter.SemanticVerification:
        key = _sha(
            _canonical(
                {
                    "descriptor": _sha(query.descriptor_bytes),
                    "solver": solver,
                    "model": _sha(model.encode()),
                    "values": _sha(values.encode()) if type(values) is str else None,
                }
            )
        )
        with self._lock:
            verdict = self._values.get(key)
        if verdict is None:
            verdict = verify_sat_model(query, solver, model, values)
            with self._lock:
                verdict = self._values.setdefault(key, verdict)
        return verdict


def classify_engine(engine: object) -> str:
    if type(engine) is not dict or engine.get("solver") != SOLVER:
        return "MALFORMED"
    return {
        "SAT_SEMANTICALLY_REPLAYED": "SAT_REPLAYED",
        "UNSAT_DISCOVERY_ONLY": "UNSAT_CUSTODY_VALID",
        "INCONCLUSIVE_UNKNOWN": "UNKNOWN",
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED": "SAT_REPLAY_REJECTED",
        "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE": "SAT_REPLAY_REJECTED",
        "INCONCLUSIVE_TRANSPORT_LOSS": "TRANSPORT_LOST",
    }.get(engine.get("effective_status"), "MALFORMED")


def _request_id(prepared: PreparedQuery) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{prepared.key}"))


def _session_label(prepared: PreparedQuery) -> tuple[str, str]:
    profile_sha = _sha(_canonical(prepared.query.descriptor["solver_profile"]))
    label = (
        f"p97-smt-source/{prepared.key}/{SOLVER}/"
        f"{prepared.query.descriptor['semantic_sha256'][:12]}/"
        f"{_request_id(prepared)}/{profile_sha[:12]}"
    )
    return label, profile_sha


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise DirectPhysicalBlockDeletionError("artifact record is malformed")
    name = record["path"]
    if type(name) is not str or "/" in name or name in seen:
        raise DirectPhysicalBlockDeletionError("artifact path is unsafe")
    payload = _read(root / name)
    if len(payload) != record["bytes"] or _sha(payload) != record["sha256"]:
        raise DirectPhysicalBlockDeletionError("artifact bytes drifted")
    seen.add(name)
    return payload


def _read_fd_artifact(directory_fd: int, name: str) -> bytes:
    if (
        type(name) is not str
        or not name
        or "/" in name
        or "\\" in name
        or name in {".", ".."}
        or os.path.basename(name) != name
    ):
        raise DirectPhysicalBlockDeletionError("staged artifact path is unsafe")
    descriptor = os.open(
        name, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0), dir_fd=directory_fd
    )
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise DirectPhysicalBlockDeletionError("staged artifact is unsafe")
        limit = 96 * 1024 * 1024
        if info.st_size > limit:
            raise DirectPhysicalBlockDeletionError("staged artifact exceeds size limit")
        chunks = []
        total = 0
        while chunk := os.read(descriptor, 65536):
            chunks.append(chunk)
            total += len(chunk)
            if total > limit:
                raise DirectPhysicalBlockDeletionError("staged artifact exceeds size limit")
        payload = b"".join(chunks)
        if len(payload) != info.st_size:
            raise DirectPhysicalBlockDeletionError("staged artifact changed")
        return payload
    finally:
        os.close(descriptor)


def _validate_transport_artifacts(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
) -> tuple[dict[str, Any], dict[str, Any] | None, dict[str, Any] | None]:
    label, profile_sha = _session_label(prepared)
    request_id = _request_id(prepared)
    request_sha = adapter.piqd_solve_request_digest(prepared.query, ())
    artifacts = engine["artifacts"]
    expected_create = {
        "schema": "piqd-smt-session-create-request/v1",
        "request": {"solver": SOLVER, "lane": "smt", "label": label},
        "request_id": request_id,
        "session_label": label,
        "solver_profile": prepared.query.descriptor["solver_profile"],
        "solver_profile_sha256": profile_sha,
    }
    if _strict(payloads["session_create_request"], "session create") != expected_create:
        raise DirectPhysicalBlockDeletionError("session-create request drifted")
    if (
        payloads["pre_append_smt2"] != b""
        or payloads["expected_post_append_smt2"] != prepared.query.journal_smt2
        or payloads["smt2"] != prepared.query.journal_smt2
    ):
        raise DirectPhysicalBlockDeletionError("journal frontier bytes drifted")
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
        raise DirectPhysicalBlockDeletionError("journal frontier record drifted")
    expected_request = {
        "schema": "piqd-smt-solve-request/v1",
        "journal_frontier": {
            "base_commands": len(prepared.query.journal_commands),
            "base_bytes": len(prepared.query.journal_smt2),
            "base_sha256": _sha(prepared.query.journal_smt2),
        },
        "request": {
            "assumptions": [],
            "timeout_ms": TIMEOUT_MS,
            "include_model": True,
            "get_values": list(prepared.query.get_values),
            "assumption_labels": [],
            "request_id": request_id,
        },
        "request_id": request_id,
        "request_sha256": request_sha,
    }
    if _strict(payloads["solve_request"], "solve request") != expected_request:
        raise DirectPhysicalBlockDeletionError("solve request drifted")
    try:
        session = adapter._validate_session(
            _strict(payloads["session"], "session"),
            solver=SOLVER,
            label=label,
            expected_state="live",
        )
        adapter._validate_fresh_session(session)
    except adapter.SmtSourceAdapterError as exc:
        raise DirectPhysicalBlockDeletionError("fresh session custody failed") from exc
    raw = engine["raw_status"]
    solve = None
    if raw is not None:
        solve_name = "reconciled_solve" if engine["response_lost"] else "solve"
        try:
            solve = adapter._validate_solve(
                _strict(payloads[solve_name], "solve"),
                timeout_ms=TIMEOUT_MS,
                assumptions=(),
                assumption_labels=(),
                named_request=True,
                replay_retry=engine["request_replayed"] is True,
            )
        except adapter.SmtSourceAdapterError as exc:
            raise DirectPhysicalBlockDeletionError("solve custody failed") from exc
    try:
        _, before = adapter._validate_receipts(
            _strict(payloads["receipts_before"], "prior receipts"),
            session=session,
            query=prepared.query,
            solve=None,
            expected_count=0,
            request_id=request_id,
            request_sha256=request_sha,
            assumption_labels=(),
        )
        _, receipt = adapter._validate_receipts(
            _strict(payloads["receipts"], "receipts"),
            session=session,
            query=prepared.query,
            solve=solve,
            expected_count=0 if solve is None else 1,
            request_id=request_id,
            request_sha256=request_sha,
            assumption_labels=(),
        )
    except adapter.SmtSourceAdapterError as exc:
        raise DirectPhysicalBlockDeletionError("receipt custody failed") from exc
    if before is not None:
        raise DirectPhysicalBlockDeletionError("fresh session had a prior receipt")
    try:
        lifecycle = adapter._validate_session_lifecycle(
            _strict(payloads["session_lifecycle"], "session lifecycle")
        )
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
        raise DirectPhysicalBlockDeletionError("session closure custody failed") from exc
    if (
        lifecycle != engine["session_lifecycle"]
        or lifecycle["request_id"] != request_id
        or lifecycle["session_id"] != session["id"]
        or lifecycle["session_label"] != label
        or lifecycle["solver_profile_sha256"] != profile_sha
        or lifecycle["resume_policy"] is not None
        or lifecycle["resumed_existing_session"] is not False
        or lifecycle["resumed_from_receipt"] is not False
        or lifecycle["close_observed_state"] != "closed"
    ):
        raise DirectPhysicalBlockDeletionError("session lifecycle drifted")
    return session, solve, receipt


def _verify_engine(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
    cache: SemanticVerdictCache,
) -> str:
    request_id = _request_id(prepared)
    raw = engine.get("raw_status")
    expected_artifacts = {
        "session_create_request", "pre_append_smt2", "expected_post_append_smt2",
        "journal_frontiers", "solve_request", "session", "smt2",
        "receipts_before", "receipts", "session_lifecycle", "closed_session",
    }
    if raw is not None:
        expected_artifacts.add("reconciled_solve" if engine.get("response_lost") else "solve")
    if raw == "SAT":
        expected_artifacts.add("semantic")
    expects_reconciliation = (
        engine.get("response_lost") is True
        and raw is not None
        and type(engine.get("reconciliation_attempts")) is int
        and engine["reconciliation_attempts"] > 0
    )
    if expects_reconciliation:
        expected_artifacts.add("reconciliation_session")
    if (
        engine.get("solver") != SOLVER
        or engine.get("request_id") != request_id
        or engine.get("request_sha256") != adapter.piqd_solve_request_digest(prepared.query, ())
        or engine.get("assumption_labels") != []
        or engine.get("claims") != adapter.FALSE_CLAIMS
        or engine.get("resumed_from_receipt") is not False
        or set(payloads) != expected_artifacts
    ):
        raise DirectPhysicalBlockDeletionError("engine identity drifted")
    session, solve, receipt = _validate_transport_artifacts(prepared, engine, payloads)
    lifecycle = engine["session_lifecycle"]
    if (
        engine.get("session_id") != session["id"]
        or engine.get("solver_signature") != session["solver_signature"]
        or engine.get("solver_sha256") != session["solver_sha256"]
        or type(lifecycle) is not dict
    ):
        raise DirectPhysicalBlockDeletionError("fresh-session custody drifted")
    disposition = classify_engine(engine)
    if solve is not None:
        digest = adapter.piqd_result_digest(solve)
        advisory = engine.get("result_digest_advisory")
        if (
            receipt is None
            or solve.get("status") != raw
            or receipt.get("result_sha256") != digest
            or engine.get("result_sha256") != digest
            or type(advisory) is not dict
            or advisory.get("locally_recomputed") != digest
            or advisory.get("matches_daemon") is not True
        ):
            raise DirectPhysicalBlockDeletionError("solve/receipt digest drifted")
    if raw == "UNSAT":
        provenance = engine.get("unsat_assumptions")
        if (
            disposition != "UNSAT_CUSTODY_VALID"
            or type(provenance) is not dict
            or provenance.get("terminal_unsat") is not True
            or provenance.get("assumption_terms") != []
            or provenance.get("source_atom_ids") != []
        ):
            raise DirectPhysicalBlockDeletionError("UNSAT custody drifted")
    elif raw == "SAT":
        if solve is None:
            raise DirectPhysicalBlockDeletionError("SAT solve is absent")
        semantic = engine.get("semantic_replay")
        expected = cache.verify(prepared.query, SOLVER, solve.get("model"), solve.get("values"))
        if (
            disposition not in {"SAT_REPLAYED", "SAT_REPLAY_REJECTED"}
            or type(semantic) is not dict
            or semantic.get("accepted") != expected.accepted
            or semantic.get("evidence") != expected.evidence
            or (disposition == "SAT_REPLAYED" and not expected.accepted)
        ):
            raise DirectPhysicalBlockDeletionError("SAT semantic replay drifted")
    elif raw == "UNKNOWN":
        if disposition != "UNKNOWN":
            raise DirectPhysicalBlockDeletionError("UNKNOWN custody drifted")
    elif raw is None:
        if disposition != "TRANSPORT_LOST":
            raise DirectPhysicalBlockDeletionError("transport custody drifted")
    else:
        raise DirectPhysicalBlockDeletionError("unsupported solver status")
    return disposition


def _result_record(prepared: PreparedQuery, engine: Mapping[str, Any], custody: Mapping[str, Any]) -> dict[str, Any]:
    result = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "query_spec": query_spec_record(prepared.spec),
        "system_sha256": _sha(prepared.system_bytes),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "solver": SOLVER,
        "disposition": classify_engine(engine),
        "engine": dict(engine),
        "custody": dict(custody),
        "claims": dict(FALSE_CLAIMS),
    }
    result["result_sha256"] = _self_hash(result, "result_sha256")
    return result


def verify_query_tree(
    prepared: PreparedQuery, output: Path, cache: SemanticVerdictCache | None = None
) -> dict[str, Any]:
    verdict_cache = cache or SemanticVerdictCache()
    if output.is_symlink() or not output.is_dir():
        raise DirectPhysicalBlockDeletionError("query output directory is unsafe")
    result = _strict(_read(output / "result.json"), "query result")
    if (
        result.get("schema") != RESULT_SCHEMA
        or result.get("key") != prepared.key
        or result.get("query_spec") != query_spec_record(prepared.spec)
        or result.get("system_sha256") != _sha(prepared.system_bytes)
        or result.get("journal_sha256") != _sha(prepared.query.journal_smt2)
        or result.get("solver") != SOLVER
        or result.get("claims") != FALSE_CLAIMS
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
    ):
        raise DirectPhysicalBlockDeletionError("query result identity drifted")
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict:
        raise DirectPhysicalBlockDeletionError("query custody is malformed")
    expected = {
        "system": prepared.system_bytes,
        "descriptor": prepared.query.descriptor_bytes,
        "original_smt2": prepared.query.original_smt2,
        "journal_smt2": prepared.query.journal_smt2,
    }
    for key, payload in expected.items():
        if _verify_artifact(output, custody.get(key), seen) != payload:
            raise DirectPhysicalBlockDeletionError("query source bytes drifted")
    source_records = custody.get("sources")
    if type(source_records) is not list or len(source_records) != len(prepared.query.source_files):
        raise DirectPhysicalBlockDeletionError("source custody inventory drifted")
    for record, snapshot in zip(source_records, prepared.query.source_files, strict=True):
        if _verify_artifact(output, record, seen) != snapshot.payload:
            raise DirectPhysicalBlockDeletionError("source snapshot drifted")
    engine = result.get("engine")
    if type(engine) is not dict or type(engine.get("artifacts")) is not dict:
        raise DirectPhysicalBlockDeletionError("engine artifact inventory drifted")
    payloads = {
        label: _verify_artifact(output, record, seen)
        for label, record in engine["artifacts"].items()
    }
    disposition = _verify_engine(prepared, engine, payloads, verdict_cache)
    if result.get("disposition") != disposition:
        raise DirectPhysicalBlockDeletionError("result disposition drifted")
    if {path.name for path in output.iterdir()} != seen:
        raise DirectPhysicalBlockDeletionError("query tree has unbound artifacts")
    return result


def run_query(
    prepared: PreparedQuery,
    output: Path,
    transport: adapter.PiqdTransport,
    cache: SemanticVerdictCache,
) -> dict[str, Any]:
    if output.exists() or output.is_symlink():
        raise DirectPhysicalBlockDeletionError("query output already exists")
    try:
        with adapter.SmtOutputTransaction(output) as transaction:
            custody: dict[str, Any] = {}
            for key, name, payload in (
                ("system", "system.json", prepared.system_bytes),
                ("descriptor", "descriptor.json", prepared.query.descriptor_bytes),
                ("original_smt2", "original.smt2", prepared.query.original_smt2),
                ("journal_smt2", "journal.smt2", prepared.query.journal_smt2),
            ):
                transaction.write_bytes(name, payload)
                custody[key] = _artifact_record(name, payload)
            sources = []
            for index, snapshot in enumerate(prepared.query.source_files):
                name = f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin"
                transaction.write_bytes(name, snapshot.payload)
                sources.append(_artifact_record(name, snapshot.payload))
            custody["sources"] = sources
            engine = adapter.run_authenticated_single_solver_query(
                prepared.query,
                solver=SOLVER,
                descriptor_schema=DESCRIPTOR_SCHEMA,
                solver_profile_schema=SOLVER_PROFILE_SCHEMA,
                authenticated_journal_commands=prepared.query.journal_commands,
                transport=transport,
                semantic_verifier=cache.verify,
                output_fd=transaction.file_descriptor,
                used_session_ids=set(),
                request_id=_request_id(prepared),
                assumption_labels=(),
            )
            payloads = {}
            for label, record in engine["artifacts"].items():
                if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
                    raise DirectPhysicalBlockDeletionError("staged artifact record is malformed")
                payload = _read_fd_artifact(transaction.file_descriptor, record["path"])
                if len(payload) != record["bytes"] or _sha(payload) != record["sha256"]:
                    raise DirectPhysicalBlockDeletionError("staged artifact digest drifted")
                payloads[label] = payload
            _verify_engine(prepared, engine, payloads, cache)
            result = _result_record(prepared, engine, custody)
            transaction.write_bytes("result.json", _json(result))
            transaction.publish()
        return verify_query_tree(prepared, output, cache)
    except (adapter.SmtSourceAdapterError, OSError) as exc:
        raise DirectPhysicalBlockDeletionError("PIQD query execution failed") from exc


def choose_round_winner(
    specs: Sequence[QuerySpec], results: Mapping[str, Mapping[str, Any]]
) -> QuerySpec | None:
    winners = [spec for spec in specs if results[spec.key]["disposition"] == "UNSAT_CUSTODY_VALID"]
    return min(winners, key=lambda spec: (-len(spec.deleted_block), spec.key)) if winners else None


def run_branch(
    branch: str,
    *,
    parent: Mapping[str, Any],
    root: Path,
    transport: adapter.PiqdTransport,
    executor: concurrent.futures.Executor,
    cache: SemanticVerdictCache,
    query_runner: Callable[[PreparedQuery], dict[str, Any]] | None = None,
) -> dict[str, Any]:
    runner = query_runner or (
        lambda prepared: run_query(prepared, root / "artifacts" / prepared.key, transport, cache)
    )
    current = GROUP_UNIVERSE
    anchor = prepare_query(anchor_spec(branch), parent=parent)
    anchor_result = executor.submit(runner, anchor).result()
    results = {anchor.key: anchor_result}
    specs = {anchor.key: anchor.spec}
    rounds = []
    selected_key = (
        anchor.key if anchor_result["disposition"] == "UNSAT_CUSTODY_VALID" else None
    )
    for round_index, granularity in enumerate(GRANULARITIES, start=1):
        candidates = candidate_specs(branch, round_index, current, granularity)
        if len(results) + len(candidates) > QUERY_CAP_PER_BRANCH:
            raise DirectPhysicalBlockDeletionError("target query cap would be exceeded")
        prepared = [prepare_query(spec, parent=parent) for spec in candidates]
        futures = [executor.submit(runner, item) for item in prepared]
        batch = {
            item.key: future.result()
            for item, future in zip(prepared, futures, strict=True)
        }
        results.update(batch)
        specs.update({item.key: item.spec for item in prepared})
        winner = choose_round_winner(candidates, batch)
        before = current
        if winner is not None:
            current = winner.retained_group_ids
            selected_key = winner.key
        record = {
            "schema": ROUND_SCHEMA,
            "branch_id": branch,
            "round_index": round_index,
            "granularity": granularity,
            "current_before": list(before),
            "current_after": list(current),
            "accepted_key": winner.key if winner else None,
            "results": {key: batch[key]["disposition"] for key in sorted(batch)},
        }
        record["round_sha256"] = _self_hash(record, "round_sha256")
        rounds.append(record)
    status = "REDUCED_UNSAT" if selected_key and current != GROUP_UNIVERSE else (
        "FULL_FORMULA_UNSAT_NO_SMALLER_UNSAT_SUBSET"
        if selected_key
        else "INCONCLUSIVE_NO_SMALLER_UNSAT_SUBSET_DISCOVERED"
    )
    return {
        "branch_id": branch,
        "status": status,
        "query_count": len(results),
        "query_cap": QUERY_CAP_PER_BRANCH,
        "initial_group_ids": list(GROUP_UNIVERSE),
        "final_group_ids": list(current),
        "selected_key": selected_key,
        "rounds": rounds,
        "query_specs": {key: query_spec_record(specs[key]) for key in sorted(specs)},
        "results": {key: results[key] for key in sorted(results)},
        "claims": dict(FALSE_CLAIMS),
    }


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read(path)) for path in sorted(paths)}


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict(_read(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != CHECKPOINT_OWNER
        or checkpoint.get("base_head") != CHECKPOINT_BASE_HEAD
        or checkpoint.get("owned_paths") != OWNED_PATHS
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("manifest_sha256") != _self_hash(checkpoint, "manifest_sha256")
        or checkpoint.get("generated_roots") != [_repo_path(RUN_ROOT)]
    ):
        raise DirectPhysicalBlockDeletionError("lane checkpoint drifted")
    return checkpoint


def expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": _repo_path(RUN_ROOT),
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_digest_map(_source_paths()),
        "input_digests": _source_digest_map(_parent_input_paths()),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    ancestors = [
        REPOSITORY_ROOT / "scratch",
        REPOSITORY_ROOT / "scratch/runs",
        REPOSITORY_ROOT / "scratch/runs" / LANE_ID,
        RUN_ROOT,
    ]
    if any(path.is_symlink() for path in ancestors):
        raise DirectPhysicalBlockDeletionError("run-root ancestry contains a symlink")
    try:
        RUN_ROOT.parent.resolve(strict=False).relative_to(REPOSITORY_ROOT.resolve())
    except ValueError as exc:
        raise DirectPhysicalBlockDeletionError("run root escapes repository") from exc
    if RUN_ROOT.exists():
        manifest = _strict(_read(RUN_ROOT / "run_manifest.json"), "run manifest")
        if manifest != expected_run_manifest(manifest.get("created_utc")):
            raise DirectPhysicalBlockDeletionError("immutable run root drifted")
        return RUN_ROOT, manifest
    RUN_ROOT.mkdir(parents=True, exist_ok=False)
    created = dt.datetime.now(dt.UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
    manifest = expected_run_manifest(created)
    (RUN_ROOT / "run_manifest.json").write_bytes(_json(manifest))
    return RUN_ROOT, manifest


def _git_head() -> str:
    result = subprocess.run(
        ["git", "rev-parse", "HEAD"], cwd=REPOSITORY_ROOT, check=True,
        capture_output=True,
    )
    head = result.stdout.decode().strip()
    if _FULL_COMMIT.fullmatch(head) is None:
        raise DirectPhysicalBlockDeletionError("execution HEAD is invalid")
    return head


def _write_json_once(path: Path, value: Mapping[str, Any]) -> None:
    payload = _json(value)
    path.parent.mkdir(parents=True, exist_ok=True)
    try:
        fd = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    except FileExistsError:
        if _read(path) != payload:
            raise DirectPhysicalBlockDeletionError("immutable event drifted")
        return
    try:
        os.write(fd, payload)
    finally:
        os.close(fd)


def verify_terminal_run(root: Path = RUN_ROOT) -> dict[str, Any]:
    """Reconstruct every query and adaptive transition from immutable bytes."""

    if root != RUN_ROOT or root.is_symlink() or not root.is_dir():
        raise DirectPhysicalBlockDeletionError("run root is unsafe or unexpected")
    manifest = _strict(_read(root / "run_manifest.json"), "run manifest")
    if manifest != expected_run_manifest(manifest.get("created_utc")):
        raise DirectPhysicalBlockDeletionError("run manifest drifted")
    launch = _strict(_read(root / "events/launch.json"), "launch")
    terminal = _strict(_read(root / "events/terminal.json"), "terminal")
    expected_launch = {
        "schema": LAUNCH_SCHEMA,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_head": launch.get("execution_head"),
        "solver": SOLVER,
        "timeout_ms": TIMEOUT_MS,
        "workers": launch.get("workers"),
        "branches": list(BRANCH_IDS),
        "granularities": list(GRANULARITIES),
        "query_cap_per_branch": QUERY_CAP_PER_BRANCH,
        "controls": list(CONTROL_KEYS),
        "claims": dict(FALSE_CLAIMS),
    }
    expected_launch["launch_sha256"] = _self_hash(expected_launch, "launch_sha256")
    if (
        launch != expected_launch
        or _FULL_COMMIT.fullmatch(launch["execution_head"]) is None
        or type(launch["workers"]) is not int
        or not 1 <= launch["workers"] <= MAX_WORKERS
    ):
        raise DirectPhysicalBlockDeletionError("launch identity drifted")
    if (
        terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("run_manifest_sha256") != manifest["manifest_sha256"]
        or terminal.get("launch_sha256") != launch["launch_sha256"]
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise DirectPhysicalBlockDeletionError("terminal identity drifted")
    parent = authenticate_parent_run()
    cache = SemanticVerdictCache()
    seen_keys: set[str] = set()
    controls = terminal.get("controls")
    if type(controls) is not dict or set(controls) != set(CONTROL_KEYS):
        raise DirectPhysicalBlockDeletionError("terminal control inventory drifted")
    for key, disposition in zip(
        CONTROL_KEYS, ("SAT_REPLAYED", "UNSAT_CUSTODY_VALID"), strict=True
    ):
        prepared = prepare_query(control_spec(key), parent=parent)
        result = verify_query_tree(prepared, root / "artifacts" / key, cache)
        if result["disposition"] != disposition or controls[key] != result["result_sha256"]:
            raise DirectPhysicalBlockDeletionError("terminal control result drifted")
        seen_keys.add(key)
    branches = terminal.get("branches")
    if type(branches) is not dict or set(branches) != set(BRANCH_IDS):
        raise DirectPhysicalBlockDeletionError("terminal branch inventory drifted")
    for branch in BRANCH_IDS:
        report = branches[branch]
        if (
            type(report) is not dict
            or report.get("branch_id") != branch
            or report.get("initial_group_ids") != list(GROUP_UNIVERSE)
            or report.get("query_cap") != QUERY_CAP_PER_BRANCH
            or report.get("claims") != FALSE_CLAIMS
            or type(report.get("query_specs")) is not dict
            or type(report.get("results")) is not dict
        ):
            raise DirectPhysicalBlockDeletionError("branch report identity drifted")
        specs = {
            key: query_spec_from_record(record)
            for key, record in report["query_specs"].items()
        }
        if (
            set(specs) != set(report["results"])
            or report.get("query_count") != len(specs)
            or not 1 <= len(specs) <= QUERY_CAP_PER_BRANCH
        ):
            raise DirectPhysicalBlockDeletionError("branch query inventory drifted")
        verified: dict[str, dict[str, Any]] = {}
        for key, spec in specs.items():
            if key != spec.key:
                raise DirectPhysicalBlockDeletionError("branch query key drifted")
            prepared = prepare_query(spec, parent=parent)
            result = verify_query_tree(prepared, root / "artifacts" / key, cache)
            if result != report["results"][key]:
                raise DirectPhysicalBlockDeletionError("embedded query result drifted")
            verified[key] = result
            seen_keys.add(key)
        anchor = anchor_spec(branch)
        if anchor.key not in verified:
            raise DirectPhysicalBlockDeletionError("branch anchor is absent")
        current = GROUP_UNIVERSE
        selected_key = None
        expected_query_keys = {anchor.key}
        if verified[anchor.key]["disposition"] == "UNSAT_CUSTODY_VALID":
            selected_key = anchor.key
        rounds = report.get("rounds")
        if type(rounds) is not list or len(rounds) != len(GRANULARITIES):
            raise DirectPhysicalBlockDeletionError("branch rounds are malformed")
        for round_index, row in enumerate(rounds, start=1):
            if (
                type(row) is not dict
                or row.get("schema") != ROUND_SCHEMA
                or row.get("branch_id") != branch
                or row.get("round_index") != round_index
                or row.get("granularity") != GRANULARITIES[round_index - 1]
                or row.get("current_before") != list(current)
                or row.get("round_sha256") != _self_hash(row, "round_sha256")
            ):
                raise DirectPhysicalBlockDeletionError("adaptive round identity drifted")
            candidates = candidate_specs(
                branch, round_index, current, GRANULARITIES[round_index - 1]
            )
            expected_query_keys.update(spec.key for spec in candidates)
            batch = {spec.key: verified[spec.key] for spec in candidates}
            if row.get("results") != {
                key: batch[key]["disposition"] for key in sorted(batch)
            }:
                raise DirectPhysicalBlockDeletionError("adaptive round results drifted")
            winner = choose_round_winner(candidates, batch)
            if row.get("accepted_key") != (winner.key if winner else None):
                raise DirectPhysicalBlockDeletionError("adaptive winner drifted")
            if winner is not None:
                current = winner.retained_group_ids
                selected_key = winner.key
            if row.get("current_after") != list(current):
                raise DirectPhysicalBlockDeletionError("adaptive current set drifted")
        if set(specs) != expected_query_keys:
            raise DirectPhysicalBlockDeletionError("branch has unreferenced or missing probes")
        expected_status = (
            "REDUCED_UNSAT" if selected_key and current != GROUP_UNIVERSE else
            "FULL_FORMULA_UNSAT_NO_SMALLER_UNSAT_SUBSET" if selected_key else
            "INCONCLUSIVE_NO_SMALLER_UNSAT_SUBSET_DISCOVERED"
        )
        if (
            report.get("status") != expected_status
            or report.get("final_group_ids") != list(current)
            or report.get("selected_key") != selected_key
        ):
            raise DirectPhysicalBlockDeletionError("branch final state drifted")
    artifact_root = root / "artifacts"
    if (
        artifact_root.is_symlink()
        or {path.name for path in artifact_root.iterdir()} != seen_keys
        or any(path.is_symlink() or not path.is_dir() for path in artifact_root.iterdir())
    ):
        raise DirectPhysicalBlockDeletionError("run artifact inventory drifted")
    expected_status = (
        "REDUCTION_FOUND"
        if any(row["status"] == "REDUCED_UNSAT" for row in branches.values())
        else "NO_SMALLER_UNSAT_SUBSET_DISCOVERED"
    )
    if terminal.get("status") != expected_status:
        raise DirectPhysicalBlockDeletionError("terminal status drifted")
    if (
        {path.name for path in root.iterdir()}
        != {"run_manifest.json", "events", "artifacts"}
        or any(path.is_symlink() for path in root.iterdir())
        or {path.name for path in (root / "events").iterdir()}
        != {"launch.json", "terminal.json"}
        or any(
            path.is_symlink() or not path.is_file()
            for path in (root / "events").iterdir()
        )
    ):
        raise DirectPhysicalBlockDeletionError("run/event inventory drifted")
    return terminal


def run_campaign(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = DEFAULT_WORKERS,
    init_only: bool = False,
    verify: bool = False,
    check_parent: bool = False,
    transport: adapter.PiqdTransport | None = None,
) -> dict[str, Any]:
    if timeout_s != DEFAULT_TIMEOUT_S or type(workers) is not int or not 1 <= workers <= MAX_WORKERS:
        raise DirectPhysicalBlockDeletionError("fixed timeout or worker bound drifted")
    parent = authenticate_parent_run()
    if check_parent:
        return parent
    if verify:
        return verify_terminal_run()
    root, manifest = ensure_run_root()
    if init_only:
        return manifest
    launch = {
        "schema": LAUNCH_SCHEMA,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_head": _git_head(),
        "solver": SOLVER,
        "timeout_ms": TIMEOUT_MS,
        "workers": workers,
        "branches": list(BRANCH_IDS),
        "granularities": list(GRANULARITIES),
        "query_cap_per_branch": QUERY_CAP_PER_BRANCH,
        "controls": list(CONTROL_KEYS),
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    _write_json_once(root / "events/launch.json", launch)
    (root / "artifacts").mkdir(exist_ok=True)
    active_transport = transport or adapter.UrllibPiqdTransport(
        server, http_timeout_s=DEFAULT_TIMEOUT_S + 40
    )
    cache = SemanticVerdictCache()
    controls = {}
    for key in CONTROL_KEYS:
        prepared = prepare_query(control_spec(key), parent=parent)
        controls[key] = run_query(
            prepared, root / "artifacts" / key, active_transport, cache
        )
    if (
        controls[CONTROL_KEYS[0]]["disposition"] != "SAT_REPLAYED"
        or controls[CONTROL_KEYS[1]]["disposition"] != "UNSAT_CUSTODY_VALID"
    ):
        raise DirectPhysicalBlockDeletionError("fresh Z3 controls failed")
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as executor:
        branches = {
            branch: run_branch(
                branch, parent=parent, root=root, transport=active_transport,
                executor=executor, cache=cache,
            )
            for branch in BRANCH_IDS
        }
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "status": (
            "REDUCTION_FOUND" if any(row["status"] == "REDUCED_UNSAT" for row in branches.values())
            else "NO_SMALLER_UNSAT_SUBSET_DISCOVERED"
        ),
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "controls": {key: controls[key]["result_sha256"] for key in CONTROL_KEYS},
        "branches": branches,
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    _write_json_once(root / "events/terminal.json", terminal)
    return terminal


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=DEFAULT_WORKERS)
    parser.add_argument("--init-only", action="store_true")
    parser.add_argument("--verify", action="store_true")
    parser.add_argument("--check-parent", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_campaign(
            server=args.server, timeout_s=args.timeout, workers=args.workers,
            init_only=args.init_only, verify=args.verify, check_parent=args.check_parent,
        )
    except (DirectPhysicalBlockDeletionError, adapter.SmtSourceAdapterError, OSError, ValueError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 2
    if args.verbose:
        print(json.dumps(result, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


__all__ = [
    "BRANCH_IDS", "CONTROL_KEYS", "DIRECT_ARTIFACT_PINS", "DIRECT_ORDER",
    "DIRECT_ORDER_ID", "FALSE_CLAIMS", "GRANULARITIES", "GROUP_UNIVERSE",
    "LANE_ID", "MODULE_PINS", "PARENT_RECORD_PINS", "QUERY_CAP_PER_BRANCH",
    "RUN_ID", "RUN_ROOT", "SOLVER", "anchor_spec", "assertion_group_ledger",
    "authenticate_parent_run", "build_smt_commands", "candidate_specs",
    "classify_engine", "control_spec", "expected_run_manifest", "main",
    "prepare_query", "run_branch", "run_campaign", "stable_partition",
    "verify_query_tree", "verify_sat_model", "verify_terminal_run",
]
