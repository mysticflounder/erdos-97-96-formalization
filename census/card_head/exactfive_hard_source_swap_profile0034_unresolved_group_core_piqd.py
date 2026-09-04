"""PIQD named group-core probes for unresolved profile-0034 deletions.

The lane authenticates the completed physical-deletion run, hard-asserts every
settled group, and guards only the deletion probes that ended UNKNOWN.  Every
cell uses a fresh PIQD session and one Z3 solve.  The records are discovery
data only.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import datetime as dt
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
    exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd as parent,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-profile0034-unresolved-group-core-piqd-20260904"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
PRELAUNCH_QUARANTINE_CONTAINER = RUN_ROOT / "tmp" / "prelaunch-quarantine"
PRELAUNCH_QUARANTINE_ROOT = (
    PRELAUNCH_QUARANTINE_CONTAINER / "20260904T200247Z-manifest-63627cb4"
)
PREVIOUS_MANIFEST_PATH = PRELAUNCH_QUARANTINE_ROOT / "run_manifest.json"
PRELAUNCH_QUARANTINE_RECEIPT_PATH = PRELAUNCH_QUARANTINE_ROOT / "receipt.json"
PREVIOUS_MANIFEST_FILE_SHA256 = (
    "63627cb44d6acb6ac0debafb4c0414e54293643ed058ccd15fa4c831b73a9d5c"
)
PREVIOUS_MANIFEST_SHA256 = (
    "191c77496546f353ce91c82c47003e780da8133fcd4347961dbc273e6767e7fa"
)
PRELAUNCH_QUARANTINE_RECEIPT_FILE_SHA256 = (
    "fff423572d2ac6a534b5cfd8eecba7eef4680d0c8392c333d5f0e54fd7373fa3"
)
PRELAUNCH_QUARANTINE_RECEIPT_SHA256 = (
    "b6889849fc01798da342686a3f93a77c38f5dd417a16b12ca4300a4e4de5237c"
)
SECOND_PRELAUNCH_QUARANTINE_ROOT = (
    PRELAUNCH_QUARANTINE_CONTAINER / "20260904T202533Z-manifest-2f884086"
)
SECOND_PREVIOUS_MANIFEST_PATH = SECOND_PRELAUNCH_QUARANTINE_ROOT / "run_manifest.json"
SECOND_PRELAUNCH_QUARANTINE_RECEIPT_PATH = (
    SECOND_PRELAUNCH_QUARANTINE_ROOT / "receipt.json"
)
SECOND_PREVIOUS_MANIFEST_FILE_SHA256 = (
    "2f884086d5f5c15b1411c1303e72681c67fc7b34f880d22d205295524feb4644"
)
SECOND_PREVIOUS_MANIFEST_SHA256 = (
    "f009179dc368b0176e106cf2ed64a678d2959df7c383d9a605f188fedc8c9dc3"
)
SECOND_PRELAUNCH_QUARANTINE_RECEIPT_FILE_SHA256 = (
    "c895a024e5234531f1f2f9293d865deb8f013d7e270f8178fd26357b617f8286"
)
SECOND_PRELAUNCH_QUARANTINE_RECEIPT_SHA256 = (
    "f2b91c7734653fb62a0490390acf40f5f5bf68f5dd4da92e4cc89ac843eb9562"
)
THIRD_PRELAUNCH_QUARANTINE_ROOT = (
    PRELAUNCH_QUARANTINE_CONTAINER / "20260904T203228Z-manifest-99528066"
)
THIRD_PREVIOUS_MANIFEST_PATH = THIRD_PRELAUNCH_QUARANTINE_ROOT / "run_manifest.json"
THIRD_PRELAUNCH_QUARANTINE_RECEIPT_PATH = (
    THIRD_PRELAUNCH_QUARANTINE_ROOT / "receipt.json"
)
THIRD_PREVIOUS_MANIFEST_FILE_SHA256 = (
    "995280668eed519572a04f0f2741975ae59728d0910e4003352f448c4616d657"
)
THIRD_PREVIOUS_MANIFEST_SHA256 = (
    "3ad296deef65cbc6a2b37dc6a03cd2820ce4e4cbb993b1c4a1666ca301fbae01"
)
THIRD_PRELAUNCH_QUARANTINE_RECEIPT_FILE_SHA256 = (
    "2a84f119679ab943090b5d421e7b63a8807c3ac212bffc0f5232051abce0b8e2"
)
THIRD_PRELAUNCH_QUARANTINE_RECEIPT_SHA256 = (
    "935d5039f665c66282b510e715c67168fae7e5fe8f9c921c391afb64e39fd7b5"
)
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
TEST_PATH = REPOSITORY_ROOT / (
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_"
    "unresolved_group_core_piqd.py"
)
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-"
    "unresolved-group-core-v1.md"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_hard_source_swap_profile0034_unresolved_group_core_piqd.py"
)

PARENT_ROOT = parent.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PRODUCER_SHA256 = "4d112265c5490ec770979a00009f35264e5aee8aa956065ec99582e08830bb78"
ADAPTER_SHA256 = "94058aa4e04b5acc27242b52781794944ea00a069b16805104d3263203d65e70"
PARENT_MANIFEST_FILE_SHA256 = "f83e04a9c74a5e96bbf45b85b3e1e84d379b9901791c9dbc2934dd46b4f1cefb"
PARENT_MANIFEST_SHA256 = "12ebeaf41cb6fe8a79c11f37f3143a33379e71a88f9274dc3edcad2bd133a342"
PARENT_LAUNCH_FILE_SHA256 = "103e1be490e7086ec20541a50148d3d3982ddcaf024bcfc0b8b7b8c7e4590f91"
PARENT_LAUNCH_SHA256 = "45c4f3767df769f025e8473dde05c59e7d4c63462a6a4b59608b419226241002"
PARENT_TERMINAL_FILE_SHA256 = "a637a02559c019bdf1f10d50539df6e4ea00c649b73151343aa035f778ec011a"
PARENT_TERMINAL_SHA256 = "bcc34f7e5c76ba9d0debd10532d875c83eb62139b120c01b7e23b38b4e6d9098"
PARENT_EXECUTION_COMMIT = "35e24a0e141ea7e3bb3099e503bbc88d31fe5414"

UNRESOLVED_GROUPS = {
    "lt": (
        "edge-index-00",
        "edge-index-03",
        "edge-index-04",
        "source-row-equality-01",
        "source-row-equality-05",
    ),
    "gt": (
        "edge-index-00",
        "edge-index-03",
        "source-row-equality-00",
        "source-row-equality-01",
        "source-row-equality-03",
        "source-row-equality-05",
    ),
}
EXPECTED_UNKNOWN_RESULTS = {
    "probe-gt-edge-index-00": "e88cfe15f932caa8521ef542e4198cefd99dd39d8e37cdfaceee27b13543bf0e",
    "probe-gt-edge-index-03": "29869d63ea660e59cbaea7193f07b1edf1b5e98794a85471f052b80a3220a087",
    "probe-gt-source-row-equality-00": "0fee6536d06afcaf73e40e44183ad271a8d8f5ecfd885cedf8decd47059b7bd4",
    "probe-gt-source-row-equality-01": "797e40dd5bb8211c116ac439a9dbd26615869b6e12dcf3934ce474d35a823a67",
    "probe-gt-source-row-equality-03": "51f9b28a1c91f2d3c0878f6e6d01e594adc82f00b459dd7417d477aacc5134a0",
    "probe-gt-source-row-equality-05": "f996a73da0c49ea36dae97d8530ca7bfd6d2047b74853b1c82fbbc326a66c9f1",
    "probe-lt-edge-index-00": "4b782f30657e20cc384f9bd2d9100a9adf865049c3dacc36970cd0e0b2ceadea",
    "probe-lt-edge-index-03": "91846ca94b8955cb62fc9ce3fe23f786ca6b95708564ccc0c5d34413de8a4922",
    "probe-lt-edge-index-04": "6596560a53cf02b1a39e8bfb416da313f3c519e89e257eaae171a23ce34abd0a",
    "probe-lt-source-row-equality-01": "79bff7313d834a45834b52f4c1b160f05e3d233f3d242d1a606b704e39cd53e3",
    "probe-lt-source-row-equality-05": "85c29b0671de3cf3c0112ebfc7c0c397d1827ddff91400c7c722726096429c72",
}
EXPECTED_UNKNOWN_RESULT_FILES = {
    "probe-gt-edge-index-00": "a8460ddd7c36cbde540a475ca28fdf2254056513221e7cc18a0c27b1df0c9502",
    "probe-gt-edge-index-03": "93c916315ecf1548716dcdfc510b761d2bbbf4d56541872eca0193e11604af36",
    "probe-gt-source-row-equality-00": "8c717158036cc9f6f79e599c9e20ec064fd622d73784260e5e21ae34a4de6ebb",
    "probe-gt-source-row-equality-01": "7a69f96745b184427747fe29fd77780b3bb5fbfce489c210a9eabd7c04f4e269",
    "probe-gt-source-row-equality-03": "024716b9bcde3b98cc9e675ab2ce2647b51de02aaa6c1cce2d16a870adf52d06",
    "probe-gt-source-row-equality-05": "7a112d85de82baa3b862354f03b0977f83d44d81cf56875cba8d946b990f1609",
    "probe-lt-edge-index-00": "f4c8af3e913a3467f6eaf5b92a0877b808c9fb83e49fa9924385359adc607b71",
    "probe-lt-edge-index-03": "436e9077eb89f02130f140aef9728b16a701de4749aaef843bb53dbb7d0d8319",
    "probe-lt-edge-index-04": "01c83ea7003c3ab7a3d238faa576bd3c5e3114d2a0d8e2e3f1535f79beb5ddd6",
    "probe-lt-source-row-equality-01": "b252d8ec8ec4273e8d01ee3d12204799631b1cc08f890aabacbc163743f520b4",
    "probe-lt-source-row-equality-05": "a86a3317bed104d908acf7671c8aca4c811f4d1e2d4e8cd5c4c9531fa2eef2bc",
}
EXPECTED_CONTROL_RESULTS = {
    "z3-control-positive": "e9668d79be9c1819cea4c4f2b136dc7d0cb3c28976da4c0d964f14b8fee543f7",
    "z3-control-negative": "dd4d553465f185fc6f99eef1df0ef1f66b80ebac5e4e9edc35b9b8f59f00ef29",
}
EXPECTED_CONTROL_RESULT_FILES = {
    "z3-control-positive": "7562e8c2af11fc10638f0b545680e853f6d401660074db367d39685a3973abc7",
    "z3-control-negative": "4152958cfbba0c457533088fe0b05208086c780baab52ce84b15bc578d14257e",
}

SYSTEM_SCHEMA = "p97-exactfive-profile0034-unresolved-group-core-system/v1"
GROUP_SCHEMA = "p97-exactfive-profile0034-unresolved-group-core-binding/v1"
DESCRIPTOR_SCHEMA = "p97-exactfive-profile0034-unresolved-group-core-query/v1"
SOLVER_PROFILE_SCHEMA = "p97-exactfive-profile0034-unresolved-group-core-solver/v1"
RESULT_SCHEMA = "p97-exactfive-profile0034-unresolved-group-core-result/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-unresolved-group-core-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-unresolved-group-core-terminal/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
SOLVER = "z3"
TIMEOUT_MS = 60_000
DEFAULT_TIMEOUT_S = 60.0
MAX_WORKERS = 4
DEFAULT_WORKERS = 4
CHECKPOINT_OWNER = "profile0034-unresolved-group-core-impl"
CHECKPOINT_BASE_HEAD = "35e24a0e141ea7e3bb3099e503bbc88d31fe5414"

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
    ("z3-control-positive", "control-positive"),
    ("z3-control-negative", "control-negative"),
    ("z3-target-mirror-radius-lt", "parent-z3-mirror-radius-lt"),
    ("z3-target-mirror-radius-gt", "parent-z3-mirror-radius-gt"),
)
QUERY_KEYS = tuple(row[0] for row in QUERY_PLAN)
CONTROL_KEYS = QUERY_KEYS[:2]
TARGET_KEYS = QUERY_KEYS[2:]
_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_profile0034_unresolved_group_core_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_unresolved_group_core_piqd.py",
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-unresolved-group-core-v1.md",
    "scripts/run_exactfive_hard_source_swap_profile0034_unresolved_group_core_piqd.py",
]
_FULL_COMMIT = re.compile(r"^[0-9a-f]{40}$")
_TOMBSTONE = re.compile(
    r"\.piqd-smt-tombstone-[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-"
    r"[89ab][0-9a-f]{3}-[0-9a-f]{12}\Z"
)


class Profile0034UnresolvedGroupCoreError(RuntimeError):
    """The governed unresolved-group lane failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery
    assumption_labels: tuple[str, ...]

    @property
    def solver(self) -> str:
        return SOLVER


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
        raise Profile0034UnresolvedGroupCoreError(f"missing custody file: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise Profile0034UnresolvedGroupCoreError(f"unsafe custody file: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile0034UnresolvedGroupCoreError(f"custody file changed: {path}")
    return payload


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034UnresolvedGroupCoreError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise Profile0034UnresolvedGroupCoreError(f"{where} is not an object")
    return value


def _publish_once(path: Path, payload: bytes) -> None:
    try:
        parent._publish_once(path, payload)
    except parent.Profile0034SupportingEdgeUnguardedDeletionError as exc:
        raise Profile0034UnresolvedGroupCoreError(f"immutable publication failed: {path}") from exc


def _repo_path(path: Path) -> str:
    return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()


def _source_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read(path)) for path in sorted(paths)}


def _git_read(arguments: Sequence[str], where: str) -> bytes:
    completed = subprocess.run(
        ["git", *arguments], cwd=REPOSITORY_ROOT, stdin=subprocess.DEVNULL,
        capture_output=True, check=False,
    )
    if completed.returncode != 0:
        raise Profile0034UnresolvedGroupCoreError(f"Git object is absent: {where}")
    return completed.stdout


def _probe_key(branch: str, group_id: str) -> str:
    return f"probe-{branch}-{group_id}"


def _authenticate_parent_result(
    key: str,
    *,
    terminal: Mapping[str, Any],
    expected_result_sha256: str,
    expected_file_sha256: str,
    expected_raw_status: str,
    expected_effective_status: str,
) -> tuple[dict[str, Any], dict[str, Any]]:
    directory = PARENT_ROOT / "artifacts" / key
    result_path = directory / "result.json"
    result_payload = _read(result_path)
    result = _strict(result_payload, f"parent result {key}")
    terminal_row = terminal.get("results", {}).get(key)
    engine = result.get("engine")
    custody = result.get("custody")
    system_record = custody.get("system") if type(custody) is dict else None
    if (
        type(terminal_row) is not dict
        or terminal_row.get("raw_status") != expected_raw_status
        or terminal_row.get("effective_status") != expected_effective_status
        or terminal_row.get("result_sha256") != expected_result_sha256
        or _sha(result_payload) != expected_file_sha256
        or result.get("result_sha256") != expected_result_sha256
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
        or result.get("key") != key
        or type(engine) is not dict
        or engine.get("raw_status") != expected_raw_status
        or engine.get("effective_status") != expected_effective_status
        or type(system_record) is not dict
        or set(system_record) != {"path", "bytes", "sha256"}
        or system_record.get("path") != "system.json"
    ):
        raise Profile0034UnresolvedGroupCoreError(f"parent result drifted: {key}")
    system_payload = _read(directory / "system.json")
    if (
        system_record["bytes"] != len(system_payload)
        or system_record["sha256"] != _sha(system_payload)
    ):
        raise Profile0034UnresolvedGroupCoreError(f"parent system custody drifted: {key}")
    system = _strict(system_payload, f"parent system {key}")
    if (
        system.get("schema") != parent.SYSTEM_SCHEMA
        or system.get("key") != key
        or system.get("claims") != parent.FALSE_CLAIMS
        or type(system.get("source_system")) is not dict
    ):
        raise Profile0034UnresolvedGroupCoreError(f"parent system identity drifted: {key}")
    return result, system


def authenticate_parent_run() -> dict[str, Any]:
    """Authenticate the completed deletion run and its eleven UNKNOWN probes."""

    if _sha(_read(Path(parent.__file__))) != PARENT_PRODUCER_SHA256:
        raise Profile0034UnresolvedGroupCoreError("parent producer bytes drifted")
    if _sha(_read(Path(adapter.__file__))) != ADAPTER_SHA256:
        raise Profile0034UnresolvedGroupCoreError("adapter bytes drifted")
    payloads = {
        "manifest": _read(PARENT_MANIFEST_PATH),
        "launch": _read(PARENT_LAUNCH_PATH),
        "terminal": _read(PARENT_TERMINAL_PATH),
    }
    if {key: _sha(value) for key, value in payloads.items()} != {
        "manifest": PARENT_MANIFEST_FILE_SHA256,
        "launch": PARENT_LAUNCH_FILE_SHA256,
        "terminal": PARENT_TERMINAL_FILE_SHA256,
    }:
        raise Profile0034UnresolvedGroupCoreError("parent record bytes drifted")
    try:
        manifest = _strict(payloads["manifest"], "parent manifest")
        launch = parent._strict(payloads["launch"], "parent launch")
        terminal = parent._read_terminal(PARENT_TERMINAL_PATH)
        execution_commit = parent.authenticate_recorded_execution_commit(manifest, launch)
    except (parent.Profile0034SupportingEdgeUnguardedDeletionError, OSError, ValueError) as exc:
        raise Profile0034UnresolvedGroupCoreError("parent run authentication failed") from exc
    if (
        manifest.get("schema") != RUN_MANIFEST_SCHEMA
        or manifest.get("lane_id") != parent.LANE_ID
        or manifest.get("run_id") != parent.RUN_ID
        or manifest.get("root") != f"scratch/runs/{parent.LANE_ID}/{parent.RUN_ID}"
        or manifest.get("manifest_sha256") != PARENT_MANIFEST_SHA256
        or manifest.get("manifest_sha256") != _self_hash(manifest, "manifest_sha256")
        or launch.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or terminal.get("terminal_sha256") != PARENT_TERMINAL_SHA256
        or launch.get("execution_commit") != PARENT_EXECUTION_COMMIT
        or execution_commit != PARENT_EXECUTION_COMMIT
        or terminal.get("status") != "UNGUARDED_DELETION_CAMPAIGN_COMPLETE"
        or terminal.get("query_count") != 55
        or terminal.get("probe_count") != 51
        or terminal.get("claims") != FALSE_CLAIMS
    ):
        raise Profile0034UnresolvedGroupCoreError("parent identity or status drifted")
    for inventory_name in ("source_digests", "input_digests"):
        inventory = manifest.get(inventory_name)
        if type(inventory) is not dict or not inventory:
            raise Profile0034UnresolvedGroupCoreError("parent manifest inventory is malformed")
        for relative, digest in inventory.items():
            if (
                type(relative) is not str
                or type(digest) is not str
                or _sha(_read(REPOSITORY_ROOT / relative)) != digest
            ):
                raise Profile0034UnresolvedGroupCoreError(
                    f"parent manifest input drifted: {relative}"
                )
    expected_keys = {
        _probe_key(branch, group_id)
        for branch, group_ids in UNRESOLVED_GROUPS.items()
        for group_id in group_ids
    }
    if expected_keys != set(EXPECTED_UNKNOWN_RESULTS):
        raise Profile0034UnresolvedGroupCoreError("fixed UNKNOWN group inventory drifted")
    source_systems: dict[str, dict[str, Any]] = {}
    branch_sources: dict[str, dict[str, Any]] = {}
    for key in sorted(expected_keys):
        _, system = _authenticate_parent_result(
            key,
            terminal=terminal,
            expected_result_sha256=EXPECTED_UNKNOWN_RESULTS[key],
            expected_file_sha256=EXPECTED_UNKNOWN_RESULT_FILES[key],
            expected_raw_status="UNKNOWN",
            expected_effective_status="INCONCLUSIVE_UNKNOWN",
        )
        match = re.fullmatch(r"probe-(lt|gt)-.+", key)
        if match is None or system.get("branch_id") != match.group(1):
            raise Profile0034UnresolvedGroupCoreError("parent branch custody drifted")
        source_system = system["source_system"]
        branch = match.group(1)
        if branch in branch_sources and branch_sources[branch] != source_system:
            raise Profile0034UnresolvedGroupCoreError("parent branch sources crossed")
        branch_sources[branch] = source_system
    for key, source_id in zip(CONTROL_KEYS, ("control-positive", "control-negative"), strict=True):
        _, system = _authenticate_parent_result(
            key,
            terminal=terminal,
            expected_result_sha256=EXPECTED_CONTROL_RESULTS[key],
            expected_file_sha256=EXPECTED_CONTROL_RESULT_FILES[key],
            expected_raw_status="SAT" if key.endswith("positive") else "UNSAT",
            expected_effective_status=(
                "SAT_SEMANTICALLY_REPLAYED" if key.endswith("positive")
                else "UNSAT_DISCOVERY_ONLY"
            ),
        )
        if system.get("source_id") != source_id or system.get("kind") != "control":
            raise Profile0034UnresolvedGroupCoreError("parent control custody drifted")
        source_systems[source_id] = system["source_system"]
    source_systems.update(
        {
            f"parent-z3-mirror-radius-{branch}": source_system
            for branch, source_system in branch_sources.items()
        }
    )
    if set(source_systems) != {
        "control-positive", "control-negative",
        "parent-z3-mirror-radius-lt", "parent-z3-mirror-radius-gt",
    }:
        raise Profile0034UnresolvedGroupCoreError("parent source inventory drifted")
    record = {
        "schema": "p97-exactfive-profile0034-unresolved-group-parent-custody/v1",
        "producer_sha256": PARENT_PRODUCER_SHA256,
        "adapter_sha256": ADAPTER_SHA256,
        "run_manifest_file_sha256": PARENT_MANIFEST_FILE_SHA256,
        "run_manifest_sha256": PARENT_MANIFEST_SHA256,
        "launch_file_sha256": PARENT_LAUNCH_FILE_SHA256,
        "launch_sha256": PARENT_LAUNCH_SHA256,
        "terminal_file_sha256": PARENT_TERMINAL_FILE_SHA256,
        "terminal_sha256": PARENT_TERMINAL_SHA256,
        "execution_commit": execution_commit,
        "unknown_result_sha256": dict(EXPECTED_UNKNOWN_RESULTS),
        "unknown_result_file_sha256": dict(EXPECTED_UNKNOWN_RESULT_FILES),
        "control_result_sha256": dict(EXPECTED_CONTROL_RESULTS),
        "control_result_file_sha256": dict(EXPECTED_CONTROL_RESULT_FILES),
        "bound_parent_input_sha256": _sha(_canonical(manifest["input_digests"])),
        "source_systems": source_systems,
        "claims": dict(FALSE_CLAIMS),
    }
    record["parent_custody_sha256"] = _self_hash(record, "parent_custody_sha256")
    return record


def _source_system(source_id: str, custody: Mapping[str, Any]) -> dict[str, Any]:
    systems = custody.get("source_systems")
    if type(systems) is not dict or type(systems.get(source_id)) is not dict:
        raise Profile0034UnresolvedGroupCoreError("source-system custody is absent")
    return dict(systems[source_id])


def _control_groups(source_id: str, original: Mapping[str, Any]) -> list[dict[str, Any]]:
    commands = parent.source._build_smt_commands_current(original)
    assertions = [command for command in commands if command.startswith("(assert ")]
    return [{
        "group_id": source_id,
        "family": source_id,
        "index": 0,
        "source_entries": [{"command": command} for command in assertions],
        "source_commands": assertions,
    }]


def _assumption_term(group_id: str) -> str:
    return "assume_" + group_id.replace("-", "_")


def build_group_system(source_id: str, custody: Mapping[str, Any]) -> dict[str, Any]:
    """Build one fixed-background system with group-level assumption bindings."""

    original = _source_system(source_id, custody)
    if source_id.startswith("control-"):
        groups = _control_groups(source_id, original)
        assumption_ids = (source_id,)
        branch = None
    else:
        match = re.fullmatch(r"parent-z3-mirror-radius-(lt|gt)", source_id)
        if match is None:
            raise Profile0034UnresolvedGroupCoreError("source id is outside the plan")
        branch = match.group(1)
        groups = parent.assertion_group_ledger(original)
        assumption_ids = UNRESOLVED_GROUPS[branch]
    group_map = {row["group_id"]: row for row in groups}
    if len(group_map) != len(groups) or any(group_id not in group_map for group_id in assumption_ids):
        raise Profile0034UnresolvedGroupCoreError("assumption group is absent")
    original_commands = parent.source._build_smt_commands_current(original)
    assertion_offset = next(
        (i for i, command in enumerate(original_commands) if command.startswith("(assert ")),
        len(original_commands),
    )
    source_sha = _sha(_canonical(original))
    ledger_sha = _sha(_canonical(groups))
    bindings = []
    for group_id in assumption_ids:
        row = group_map[group_id]
        binding = {
            "schema": GROUP_SCHEMA,
            "group_id": group_id,
            "family": row["family"],
            "index": row["index"],
            "assumption_term": _assumption_term(group_id),
            "source_entries": row["source_entries"],
            "source_commands": row["source_commands"],
            "source_entries_sha256": _sha(_canonical(row["source_entries"])),
            "source_commands_sha256": _sha(_canonical(row["source_commands"])),
            "source_system_sha256": source_sha,
            "source_ledger_sha256": ledger_sha,
        }
        binding["label_sha256"] = _self_hash(binding, "label_sha256")
        bindings.append(binding)
    hard_ids = tuple(row["group_id"] for row in groups if row["group_id"] not in assumption_ids)
    system = {
        "schema": SYSTEM_SCHEMA,
        "solver": SOLVER,
        "source_id": source_id,
        "branch_id": branch,
        "source_system": original,
        "source_system_sha256": source_sha,
        "source_unguarded_commands": list(original_commands),
        "source_unguarded_journal_sha256": _sha(parent._journal(original_commands)),
        "assertion_offset": assertion_offset,
        "source_groups": groups,
        "source_ledger_sha256": ledger_sha,
        "hard_group_ids": list(hard_ids),
        "assumption_group_ids": list(assumption_ids),
        "group_bindings": bindings,
        "claims": dict(FALSE_CLAIMS),
    }
    return system


def _validate_group_system(value: object) -> dict[str, Any]:
    if type(value) is not dict or value.get("schema") != SYSTEM_SCHEMA:
        raise Profile0034UnresolvedGroupCoreError("group system is malformed")
    custody = {"source_systems": {value.get("source_id"): value.get("source_system")}}
    if value != build_group_system(value.get("source_id"), custody):
        raise Profile0034UnresolvedGroupCoreError("group system drifted")
    return dict(value)


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    current = _validate_group_system(system)
    original = tuple(current["source_unguarded_commands"])
    out = list(original[: current["assertion_offset"]])
    bindings = {row["group_id"]: row for row in current["group_bindings"]}
    out.extend(f"(declare-fun {row['assumption_term']} () Bool)" for row in current["group_bindings"])
    for group in current["source_groups"]:
        binding = bindings.get(group["group_id"])
        if binding is None:
            out.extend(group["source_commands"])
        else:
            term = binding["assumption_term"]
            out.extend(
                f"(assert (=> {term} {command[len('(assert '):-1]}))"
                for command in group["source_commands"]
            )
    return tuple(out)


def reconstruct_unguarded_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    current = _validate_group_system(system)
    groups = [command for row in current["source_groups"] for command in row["source_commands"]]
    reconstructed = tuple(current["source_unguarded_commands"][: current["assertion_offset"]]) + tuple(groups)
    if reconstructed != tuple(current["source_unguarded_commands"]):
        raise Profile0034UnresolvedGroupCoreError("enabled assumptions do not reconstruct the source")
    return reconstructed


def _manifest_sources() -> list[Path]:
    return [
        Path(__file__),
        Path(parent.__file__),
        Path(parent.source.__file__),
        Path(adapter.__file__),
        TEST_PATH,
        RUNNER_PATH,
        SPEC_PATH,
        CHECKPOINT_PATH,
    ]


def _manifest_inputs() -> list[Path]:
    keys = sorted(set(EXPECTED_UNKNOWN_RESULTS) | set(EXPECTED_CONTROL_RESULTS))
    return [
        PARENT_MANIFEST_PATH,
        PARENT_LAUNCH_PATH,
        PARENT_TERMINAL_PATH,
        PREVIOUS_MANIFEST_PATH,
        PRELAUNCH_QUARANTINE_RECEIPT_PATH,
        SECOND_PREVIOUS_MANIFEST_PATH,
        SECOND_PRELAUNCH_QUARANTINE_RECEIPT_PATH,
        THIRD_PREVIOUS_MANIFEST_PATH,
        THIRD_PRELAUNCH_QUARANTINE_RECEIPT_PATH,
        *[PARENT_ROOT / "artifacts" / key / "result.json" for key in keys],
        *[PARENT_ROOT / "artifacts" / key / "system.json" for key in keys],
    ]


def _source_snapshots(
    custody: Mapping[str, Any], system: Mapping[str, Any]
) -> tuple[adapter.SourceSnapshot, ...]:
    snapshots = [
        adapter.SourceSnapshot("0000-parent-custody.json", _json(custody)),
        adapter.SourceSnapshot("0001-group-system.json", _json(system)),
        adapter.SourceSnapshot("parent-run-manifest.json", _read(PARENT_MANIFEST_PATH)),
        adapter.SourceSnapshot("parent-launch.json", _read(PARENT_LAUNCH_PATH)),
        adapter.SourceSnapshot("parent-terminal.json", _read(PARENT_TERMINAL_PATH)),
        adapter.SourceSnapshot(
            "prelaunch-obsolete-run-manifest.json", _read(PREVIOUS_MANIFEST_PATH)
        ),
        adapter.SourceSnapshot(
            "prelaunch-manifest-quarantine-receipt.json",
            _read(PRELAUNCH_QUARANTINE_RECEIPT_PATH),
        ),
        adapter.SourceSnapshot(
            "prelaunch-second-obsolete-run-manifest.json",
            _read(SECOND_PREVIOUS_MANIFEST_PATH),
        ),
        adapter.SourceSnapshot(
            "prelaunch-second-manifest-quarantine-receipt.json",
            _read(SECOND_PRELAUNCH_QUARANTINE_RECEIPT_PATH),
        ),
        adapter.SourceSnapshot(
            "prelaunch-third-obsolete-run-manifest.json",
            _read(THIRD_PREVIOUS_MANIFEST_PATH),
        ),
        adapter.SourceSnapshot(
            "prelaunch-third-manifest-quarantine-receipt.json",
            _read(THIRD_PRELAUNCH_QUARANTINE_RECEIPT_PATH),
        ),
        adapter.SourceSnapshot("implementation-group-core.py", _read(Path(__file__))),
        adapter.SourceSnapshot("implementation-parent.py", _read(Path(parent.__file__))),
        adapter.SourceSnapshot(
            "implementation-supporting-edge-qfnra-parent.py",
            _read(Path(parent.source.__file__)),
        ),
        adapter.SourceSnapshot("implementation-adapter.py", _read(Path(adapter.__file__))),
        adapter.SourceSnapshot("tests.py", _read(TEST_PATH)),
        adapter.SourceSnapshot("runner.py", _read(RUNNER_PATH)),
        adapter.SourceSnapshot("checkpoint.json", _read(CHECKPOINT_PATH)),
        adapter.SourceSnapshot("specification.md", _read(SPEC_PATH)),
    ]
    snapshots.extend(
        adapter.SourceSnapshot(
            f"parent-unknown-result-{key}.json",
            _read(PARENT_ROOT / "artifacts" / key / "result.json"),
        )
        for key in sorted(EXPECTED_UNKNOWN_RESULTS)
    )
    snapshots.extend(
        adapter.SourceSnapshot(
            f"parent-control-result-{key}.json",
            _read(PARENT_ROOT / "artifacts" / key / "result.json"),
        )
        for key in sorted(EXPECTED_CONTROL_RESULTS)
    )
    snapshots.extend(
        adapter.SourceSnapshot(
            f"parent-system-{key}.json",
            _read(PARENT_ROOT / "artifacts" / key / "system.json"),
        )
        for key in sorted(set(EXPECTED_UNKNOWN_RESULTS) | set(EXPECTED_CONTROL_RESULTS))
    )
    names = [row.path for row in snapshots]
    if len(names) != len(set(names)):
        raise Profile0034UnresolvedGroupCoreError("source snapshot paths repeat")
    return tuple(sorted(snapshots, key=lambda row: row.path))


def prepare_query(
    key: str,
    *,
    timeout_ms: int = TIMEOUT_MS,
    custody: Mapping[str, Any] | None = None,
) -> PreparedQuery:
    plan = dict(QUERY_PLAN)
    if key not in plan:
        raise Profile0034UnresolvedGroupCoreError(f"unknown query key: {key}")
    if type(timeout_ms) is not int or type(timeout_ms) is bool or timeout_ms != TIMEOUT_MS:
        raise Profile0034UnresolvedGroupCoreError("query timeout is fixed at 60000 ms")
    parent_custody = dict(custody or authenticate_parent_run())
    if parent_custody.get("parent_custody_sha256") != _self_hash(
        parent_custody, "parent_custody_sha256"
    ):
        raise Profile0034UnresolvedGroupCoreError("parent custody is not self-hashed")
    source_id = plan[key]
    system = build_group_system(source_id, parent_custody)
    commands = build_smt_commands(system)
    journal = parent._journal(commands)
    try:
        normalized, normalized_journal = adapter.normalize_state_journal(journal)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034UnresolvedGroupCoreError("group journal is rejected") from exc
    if normalized != commands or normalized_journal != journal:
        raise Profile0034UnresolvedGroupCoreError("group journal normalization drifted")
    bindings = system["group_bindings"]
    named_atoms = [
        {"id": row["group_id"], "assumption_term": row["assumption_term"]}
        for row in bindings
    ]
    labels = tuple(row["label_sha256"] for row in bindings)
    variables = sorted(
        (
            {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
            for variable in system["source_system"]["variables"]
        ),
        key=lambda row: row["id"],
    )
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "parent_custody_sha256": parent_custody["parent_custody_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _source_snapshots(parent_custody, system)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-profile0034-unresolved-group-core-piqd", "version": "v1"},
        "semantic_verifier": {
            "id": "profile0034-full-original-exact-rational-replay",
            "version": "v1",
        },
        "stage_id": "exactfive-profile0034-unresolved-group-core",
        "query_id": key,
        "sources": [
            {"path": row.path, "bytes": len(row.payload), "sha256": _sha(row.payload)}
            for row in snapshots
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
            "assumption_ids": [row["group_id"] for row in bindings],
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
    if reconstruct_unguarded_commands(system) != tuple(system["source_unguarded_commands"]):
        raise Profile0034UnresolvedGroupCoreError("full-source reconstruction failed")
    return PreparedQuery(key, system, query, labels)


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or type(model) is not str or type(values) is not str:
        raise Profile0034UnresolvedGroupCoreError("SAT replay payload is malformed")
    system = _validate_group_system(semantic.get("system"))
    if solver != SOLVER:
        raise Profile0034UnresolvedGroupCoreError("SAT replay solver is crossed")
    original = parent.source.prepare_query(system["source_system"], timeout_ms=TIMEOUT_MS)
    verification = parent.source.verify_sat_model(original.query, solver, model, values)
    evidence = {
        "accepted": verification.accepted,
        "full_original_exact_replay": verification.evidence,
        "source_system_sha256": system["source_system_sha256"],
        "source_unguarded_journal_sha256": system["source_unguarded_journal_sha256"],
        "assumption_group_ids": system["assumption_group_ids"],
        "hard_group_ids": system["hard_group_ids"],
    }
    return adapter.SemanticVerification(verification.accepted, evidence)


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise Profile0034UnresolvedGroupCoreError("artifact record is malformed")
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen:
        raise Profile0034UnresolvedGroupCoreError("artifact path is unsafe")
    payload = _read(root / name)
    if record["bytes"] != len(payload) or record["sha256"] != _sha(payload):
        raise Profile0034UnresolvedGroupCoreError(f"artifact digest drifted: {name}")
    seen.add(name)
    return payload


def _read_fd_artifact(directory_fd: int, name: str) -> bytes:
    descriptor = os.open(name, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0), dir_fd=directory_fd)
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise Profile0034UnresolvedGroupCoreError("staged artifact is unsafe")
        chunks = []
        while True:
            chunk = os.read(descriptor, 65536)
            if not chunk:
                break
            chunks.append(chunk)
        payload = b"".join(chunks)
        if len(payload) != info.st_size:
            raise Profile0034UnresolvedGroupCoreError("staged artifact changed")
        return payload
    finally:
        os.close(descriptor)


def _query_request_id(key: str) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


def _session_label(prepared: PreparedQuery) -> tuple[str, str]:
    profile_sha = _sha(_canonical(prepared.query.descriptor["solver_profile"]))
    label = (
        f"p97-smt-source/{prepared.key}/{SOLVER}/"
        f"{prepared.query.descriptor['semantic_sha256'][:12]}/"
        f"{_query_request_id(prepared.key)}/{profile_sha[:12]}"
    )
    return label, profile_sha


_ENGINE_KEYS = frozenset(
    {
        "solver", "session_id", "solver_signature", "solver_sha256", "raw_status",
        "effective_status", "solve_index", "result_sha256", "response_lost",
        "reconciled_from_receipt", "reconciliation_attempts", "result_digest_advisory",
        "unsat_assumptions", "semantic_replay", "artifacts", "claims", "request_id",
        "request_sha256", "assumption_labels", "request_replay_attempted",
        "request_replayed", "resumed_from_receipt", "session_lifecycle",
    }
)
_RESULT_KEYS = frozenset(
    {
        "schema", "key", "solver", "source_id", "assumption_count",
        "source_system_sha256", "source_ledger_sha256", "assumption_label_sha256",
        "engine", "custody", "claims", "result_sha256",
    }
)


def _validate_transport_artifacts(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
) -> tuple[dict[str, Any], dict[str, Any] | None, dict[str, Any] | None]:
    label, profile_sha = _session_label(prepared)
    request_id = _query_request_id(prepared.key)
    request_sha = adapter.piqd_solve_request_digest(prepared.query, prepared.assumption_labels)
    expected_create = {
        "schema": "piqd-smt-session-create-request/v1",
        "request": {"solver": SOLVER, "lane": "smt", "label": label},
        "request_id": request_id,
        "session_label": label,
        "solver_profile": prepared.query.descriptor["solver_profile"],
        "solver_profile_sha256": profile_sha,
    }
    if _strict(payloads["session_create_request"], "session create request") != expected_create:
        raise Profile0034UnresolvedGroupCoreError("session create request drifted")
    if payloads["pre_append_smt2"] != b"" or payloads["expected_post_append_smt2"] != prepared.query.journal_smt2:
        raise Profile0034UnresolvedGroupCoreError("journal frontier bytes drifted")
    artifacts = engine["artifacts"]
    expected_frontiers = {
        "schema": "piqd-smt-journal-frontiers/v1",
        "append_request": {"commands": list(prepared.query.journal_commands), "expect_commands": 0},
        "pre": {
            "commands": 0, "bytes": 0, "sha256": _sha(b""),
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
        raise Profile0034UnresolvedGroupCoreError("journal frontier record drifted")
    solve_request = {
        "assumptions": list(prepared.query.assumptions),
        "timeout_ms": TIMEOUT_MS,
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
        "request_sha256": request_sha,
    }
    if _strict(payloads["solve_request"], "solve request") != expected_request:
        raise Profile0034UnresolvedGroupCoreError("solve request drifted")
    try:
        session = adapter._validate_session(
            _strict(payloads["session"], "session"),
            solver=SOLVER, label=label, expected_state="live",
        )
        adapter._validate_fresh_session(session)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034UnresolvedGroupCoreError("fresh session custody failed") from exc
    if payloads["smt2"] != prepared.query.journal_smt2:
        raise Profile0034UnresolvedGroupCoreError("exported journal drifted")
    raw = engine["raw_status"]
    solve = None
    if raw is not None:
        solve_label = "reconciled_solve" if engine["response_lost"] else "solve"
        try:
            solve = adapter._validate_solve(
                _strict(payloads[solve_label], "solve"),
                timeout_ms=TIMEOUT_MS,
                assumptions=prepared.query.assumptions,
                assumption_labels=prepared.assumption_labels,
                named_request=True,
                replay_retry=engine["request_replayed"] is True,
            )
        except adapter.SmtSourceAdapterError as exc:
            raise Profile0034UnresolvedGroupCoreError("solve custody failed") from exc
    try:
        _, prior = adapter._validate_receipts(
            _strict(payloads["receipts_before"], "prior receipts"),
            session=session, query=prepared.query, solve=None, expected_count=0,
            request_id=request_id, request_sha256=request_sha,
            assumption_labels=prepared.assumption_labels,
        )
        _, receipt = adapter._validate_receipts(
            _strict(payloads["receipts"], "receipts"),
            session=session, query=prepared.query, solve=solve,
            expected_count=0 if solve is None else 1,
            request_id=request_id, request_sha256=request_sha,
            assumption_labels=prepared.assumption_labels,
        )
        lifecycle = adapter._validate_session_lifecycle(
            _strict(payloads["session_lifecycle"], "session lifecycle")
        )
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034UnresolvedGroupCoreError("receipt or lifecycle custody failed") from exc
    if prior is not None:
        raise Profile0034UnresolvedGroupCoreError("fresh session has a prior receipt")
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
        raise Profile0034UnresolvedGroupCoreError("session lifecycle drifted")
    try:
        closed = adapter._validate_session(
            _strict(payloads["closed_session"], "closed session"),
            solver=SOLVER, label=label, expected_state="closed",
        )
        adapter._validate_closed_session(closed, created=session, query=prepared.query, solve=solve)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034UnresolvedGroupCoreError("closed-session custody failed") from exc
    if "reconciliation_session" in payloads:
        try:
            reconciled = adapter._validate_session(
                _strict(payloads["reconciliation_session"], "reconciliation session"),
                solver=SOLVER, label=label, expected_state="live",
            )
            adapter._validate_session_frontier(reconciled, created=session, query=prepared.query, solve=solve)
        except adapter.SmtSourceAdapterError as exc:
            raise Profile0034UnresolvedGroupCoreError("reconciliation custody failed") from exc
    return session, receipt, solve


def _validate_core(prepared: PreparedQuery, engine: Mapping[str, Any]) -> None:
    provenance = engine.get("unsat_assumptions")
    bindings = prepared.system["group_bindings"]
    by_term = {row["assumption_term"]: row for row in bindings}
    terms = provenance.get("assumption_terms") if type(provenance) is dict else None
    selected = [by_term.get(term) for term in terms] if type(terms) is list else []
    if (
        not selected
        or any(row is None for row in selected)
        or len(terms) != len(set(terms))
        or provenance.get("source_atom_ids") != [row["group_id"] for row in selected]
        or provenance.get("core_labels") != [row["label_sha256"] for row in selected]
        or provenance.get("ordered_assumption_labels") != list(prepared.assumption_labels)
        or provenance.get("basis") != "get-unsat-assumptions"
        or provenance.get("daemon_field") != "core"
        or provenance.get("named_core_support") is not True
        or provenance.get("terminal_unsat") is not False
        or any(row["label_sha256"] != _self_hash(row, "label_sha256") for row in bindings)
    ):
        raise Profile0034UnresolvedGroupCoreError("UNSAT group core is empty or cross-bound")


def _expected_semantic(prepared: PreparedQuery, solve: Mapping[str, Any]) -> dict[str, Any]:
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
        raise Profile0034UnresolvedGroupCoreError("engine key set drifted")
    raw = engine["raw_status"]
    if raw not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise Profile0034UnresolvedGroupCoreError("engine status is unsupported")
    expected_artifacts = {
        "session_create_request", "pre_append_smt2", "expected_post_append_smt2",
        "journal_frontiers", "solve_request", "session", "smt2", "receipts_before",
        "receipts", "session_lifecycle", "closed_session",
    }
    if raw is not None:
        expected_artifacts.add("reconciled_solve" if engine["response_lost"] else "solve")
    if raw == "SAT":
        expected_artifacts.add("semantic")
    if "reconciliation_session" in payloads:
        if engine["response_lost"] is not True or raw is None:
            raise Profile0034UnresolvedGroupCoreError(
                "unexpected reconciliation session"
            )
        expected_artifacts.add("reconciliation_session")
    if set(payloads) != expected_artifacts:
        raise Profile0034UnresolvedGroupCoreError("engine artifact inventory drifted")
    session, receipt, solve = _validate_transport_artifacts(prepared, engine, payloads)
    request_id = _query_request_id(prepared.key)
    request_sha = adapter.piqd_solve_request_digest(prepared.query, prepared.assumption_labels)
    if (
        engine["solver"] != SOLVER
        or engine["session_id"] != session["id"]
        or engine["solver_signature"] != session["solver_signature"]
        or engine["solver_sha256"] != session["solver_sha256"]
        or engine["request_id"] != request_id
        or engine["request_sha256"] != request_sha
        or engine["assumption_labels"] != list(prepared.assumption_labels)
        or engine["claims"] != adapter.FALSE_CLAIMS
        or engine["resumed_from_receipt"] is not False
        or type(engine["response_lost"]) is not bool
        or type(engine["reconciled_from_receipt"]) is not bool
        or type(engine["request_replay_attempted"]) is not bool
        or engine["request_replayed"] not in {True, False, None}
        or type(engine["reconciliation_attempts"]) is not int
        or engine["reconciliation_attempts"] < 0
        or (not engine["response_lost"] and engine["reconciliation_attempts"] != 0)
        or (engine["reconciled_from_receipt"] and not engine["response_lost"])
        or (engine["request_replay_attempted"] and not engine["response_lost"])
        or (not engine["response_lost"] and engine["request_replayed"] is not False)
    ):
        raise Profile0034UnresolvedGroupCoreError("engine identity or replay state drifted")
    if raw is None:
        raise Profile0034UnresolvedGroupCoreError("transport loss is not publishable")
    assert solve is not None
    digest = adapter.piqd_result_digest(solve)
    expected_provenance = adapter._unsat_assumption_provenance(
        prepared.query, solve, prepared.assumption_labels
    )
    advisory = engine["result_digest_advisory"]
    if (
        receipt is None
        or solve.get("status") != raw
        or solve.get("solve_index") != engine["solve_index"]
        or solve.get("result_sha256") != digest
        or receipt.get("result_sha256") != digest
        or engine["result_sha256"] != digest
        or engine["unsat_assumptions"] != expected_provenance
        or type(advisory) is not dict
        or advisory.get("algorithm") != "piqd-smt-solve-result/v1"
        or advisory.get("locally_recomputed") != digest
        or advisory.get("matches_daemon") is not True
    ):
        raise Profile0034UnresolvedGroupCoreError("solve digest or receipt drifted")
    if prepared.key == CONTROL_KEYS[0]:
        allowed = {"SAT"}
    elif prepared.key == CONTROL_KEYS[1]:
        allowed = {"UNSAT"}
    else:
        allowed = {"SAT", "UNSAT", "UNKNOWN"}
    if raw not in allowed:
        raise Profile0034UnresolvedGroupCoreError("cell result violates the fixed plan")
    if raw == "SAT":
        semantic = engine["semantic_replay"]
        if (
            engine["effective_status"] != "SAT_SEMANTICALLY_REPLAYED"
            or _strict(payloads["semantic"], "semantic replay") != semantic
            or semantic != _expected_semantic(prepared, solve)
            or semantic.get("accepted") is not True
        ):
            raise Profile0034UnresolvedGroupCoreError("SAT full-source replay failed")
        return "SAT_REPLAYED"
    if raw == "UNSAT":
        if engine["effective_status"] != "UNSAT_DISCOVERY_ONLY":
            raise Profile0034UnresolvedGroupCoreError("UNSAT status drifted")
        _validate_core(prepared, engine)
        return "UNSAT_GROUP_CORE"
    if (
        engine["effective_status"] != "INCONCLUSIVE_UNKNOWN"
        or engine["semantic_replay"] is not None
        or engine["unsat_assumptions"] is not None
    ):
        raise Profile0034UnresolvedGroupCoreError("UNKNOWN custody drifted")
    return "UNKNOWN"


def _result_record(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    custody: Mapping[str, Any],
) -> dict[str, Any]:
    result = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": SOLVER,
        "source_id": prepared.system["source_id"],
        "assumption_count": len(prepared.system["group_bindings"]),
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
        raise Profile0034UnresolvedGroupCoreError("query output directory is unsafe")
    result = _strict(_read(output / "result.json"), "query result")
    expected_identity = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": SOLVER,
        "source_id": prepared.system["source_id"],
        "assumption_count": len(prepared.system["group_bindings"]),
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
        raise Profile0034UnresolvedGroupCoreError("query result identity drifted")
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "source_record", "descriptor", "original_smt2", "journal_smt2", "sources"
    }:
        raise Profile0034UnresolvedGroupCoreError("query custody is malformed")
    seen = {"result.json"}
    expected_payloads = {
        "source_record": _json(prepared.system),
        "descriptor": prepared.query.descriptor_bytes,
        "original_smt2": prepared.query.original_smt2,
        "journal_smt2": prepared.query.journal_smt2,
    }
    for key, expected in expected_payloads.items():
        if _verify_artifact(output, custody[key], seen) != expected:
            raise Profile0034UnresolvedGroupCoreError(f"query {key} custody drifted")
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(prepared.query.source_files):
        raise Profile0034UnresolvedGroupCoreError("query source custody count drifted")
    for record, snapshot in zip(source_records, prepared.query.source_files, strict=True):
        if _verify_artifact(output, record, seen) != snapshot.payload:
            raise Profile0034UnresolvedGroupCoreError("query source snapshot drifted")
    engine = result.get("engine")
    if type(engine) is not dict or type(engine.get("artifacts")) is not dict:
        raise Profile0034UnresolvedGroupCoreError("query engine is malformed")
    payloads = {
        label: _verify_artifact(output, record, seen)
        for label, record in engine["artifacts"].items()
    }
    _validate_engine(prepared, engine, payloads)
    entries = tuple(output.iterdir())
    if (
        any(
            row.is_symlink()
            or not stat.S_ISREG(row.lstat().st_mode)
            or row.lstat().st_nlink != 1
            for row in entries
        )
        or {row.name for row in entries} != seen
    ):
        raise Profile0034UnresolvedGroupCoreError("query output contains unbound artifacts")
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
    except Profile0034UnresolvedGroupCoreError:
        raise
    except (OSError, adapter.SmtSourceAdapterError) as exc:
        raise Profile0034UnresolvedGroupCoreError("authenticated PIQD group query failed") from exc
    return verify_query_tree(prepared, output)


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict(_read(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != CHECKPOINT_OWNER
        or checkpoint.get("base_head") != CHECKPOINT_BASE_HEAD
        or checkpoint.get("owned_paths") != _OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("manifest_sha256") != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile0034UnresolvedGroupCoreError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    authenticate_parent_run()
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_map(_manifest_sources()),
        "input_digests": _source_map(_manifest_inputs()),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _authenticate_source_commit(manifest: Mapping[str, Any], commit: object) -> str:
    if type(commit) is not str or _FULL_COMMIT.fullmatch(commit) is None:
        raise Profile0034UnresolvedGroupCoreError("execution commit is malformed")
    expected_paths = sorted(_repo_path(path) for path in _manifest_sources())
    source_digests = manifest.get("source_digests")
    if type(source_digests) is not dict or sorted(source_digests) != expected_paths:
        raise Profile0034UnresolvedGroupCoreError("execution source inventory drifted")
    for relative in expected_paths:
        current = _read(REPOSITORY_ROOT / relative)
        if source_digests.get(relative) != _sha(current):
            raise Profile0034UnresolvedGroupCoreError(f"current source drifted: {relative}")
        if _git_read(("show", f"{commit}:{relative}"), relative) != current:
            raise Profile0034UnresolvedGroupCoreError(f"execution commit source drifted: {relative}")
    return commit


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    raw = _git_read(("rev-parse", "--verify", "HEAD^{commit}"), "current commit")
    try:
        commit = raw.decode("ascii").strip()
    except UnicodeDecodeError as exc:
        raise Profile0034UnresolvedGroupCoreError("execution commit is malformed") from exc
    if raw != f"{commit}\n".encode("ascii"):
        raise Profile0034UnresolvedGroupCoreError("execution commit is malformed")
    return _authenticate_source_commit(manifest, commit)


def authenticate_recorded_execution_commit(
    manifest: Mapping[str, Any], launch: Mapping[str, Any]
) -> str:
    return _authenticate_source_commit(manifest, launch.get("execution_commit"))


def _require_safe_run_ancestors() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise Profile0034UnresolvedGroupCoreError("run root escapes repository") from exc
    current = REPOSITORY_ROOT
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise Profile0034UnresolvedGroupCoreError("run ancestor is unsafe")


def _validate_prelaunch_quarantine() -> None:
    container = PRELAUNCH_QUARANTINE_CONTAINER
    records = (
        (
            PRELAUNCH_QUARANTINE_ROOT,
            PREVIOUS_MANIFEST_PATH,
            PREVIOUS_MANIFEST_FILE_SHA256,
            PREVIOUS_MANIFEST_SHA256,
            PRELAUNCH_QUARANTINE_RECEIPT_PATH,
            PRELAUNCH_QUARANTINE_RECEIPT_FILE_SHA256,
            PRELAUNCH_QUARANTINE_RECEIPT_SHA256,
        ),
        (
            SECOND_PRELAUNCH_QUARANTINE_ROOT,
            SECOND_PREVIOUS_MANIFEST_PATH,
            SECOND_PREVIOUS_MANIFEST_FILE_SHA256,
            SECOND_PREVIOUS_MANIFEST_SHA256,
            SECOND_PRELAUNCH_QUARANTINE_RECEIPT_PATH,
            SECOND_PRELAUNCH_QUARANTINE_RECEIPT_FILE_SHA256,
            SECOND_PRELAUNCH_QUARANTINE_RECEIPT_SHA256,
        ),
        (
            THIRD_PRELAUNCH_QUARANTINE_ROOT,
            THIRD_PREVIOUS_MANIFEST_PATH,
            THIRD_PREVIOUS_MANIFEST_FILE_SHA256,
            THIRD_PREVIOUS_MANIFEST_SHA256,
            THIRD_PRELAUNCH_QUARANTINE_RECEIPT_PATH,
            THIRD_PRELAUNCH_QUARANTINE_RECEIPT_FILE_SHA256,
            THIRD_PRELAUNCH_QUARANTINE_RECEIPT_SHA256,
        ),
    )
    if (
        container.is_symlink()
        or not container.is_dir()
        or {row.name for row in container.iterdir()} != {row[0].name for row in records}
    ):
        raise Profile0034UnresolvedGroupCoreError("prelaunch quarantine is absent")
    for (
        root,
        previous_path,
        previous_file_sha,
        previous_sha,
        receipt_path,
        receipt_file_sha,
        receipt_sha,
    ) in records:
        if (
            root.is_symlink()
            or not root.is_dir()
            or {row.name for row in root.iterdir()} != {"run_manifest.json", "receipt.json"}
        ):
            raise Profile0034UnresolvedGroupCoreError(
                "prelaunch quarantine inventory drifted"
            )
        previous_payload = _read(previous_path)
        receipt_payload = _read(receipt_path)
        previous = _strict(previous_payload, "previous run manifest")
        receipt = _strict(receipt_payload, "prelaunch quarantine receipt")
        if (
            _sha(previous_payload) != previous_file_sha
            or previous.get("manifest_sha256") != previous_sha
            or previous.get("manifest_sha256")
            != _self_hash(previous, "manifest_sha256")
            or _sha(receipt_payload) != receipt_file_sha
            or receipt.get("receipt_sha256") != receipt_sha
            or receipt.get("receipt_sha256") != _self_hash(receipt, "receipt_sha256")
            or receipt.get("old_manifest_file_sha256") != previous_file_sha
            or receipt.get("old_manifest_sha256") != previous_sha
            or receipt.get("external_reference_count") != 0
        ):
            raise Profile0034UnresolvedGroupCoreError(
                "prelaunch quarantine custody drifted"
            )


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_run_ancestors()
    _validate_prelaunch_quarantine()
    RUN_ROOT.parent.mkdir(parents=True, exist_ok=True)
    if RUN_ROOT.is_symlink() or (RUN_ROOT.exists() and not RUN_ROOT.is_dir()):
        raise Profile0034UnresolvedGroupCoreError("run root is unsafe")
    RUN_ROOT.mkdir(mode=0o700, exist_ok=True)
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists() or manifest_path.is_symlink():
        manifest = _strict(_read(manifest_path), "run manifest")
        created = manifest.get("created_utc")
        if type(created) is not str or manifest != _expected_run_manifest(created):
            raise Profile0034UnresolvedGroupCoreError("run manifest drifted")
    else:
        created = dt.datetime.now(dt.UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
        manifest = _expected_run_manifest(created)
        _publish_once(manifest_path, _json(manifest))
    return RUN_ROOT, manifest


def _initialize_runtime_dirs(root: Path) -> None:
    for name in ("artifacts", "events"):
        path = root / name
        if path.exists() or path.is_symlink():
            raise Profile0034UnresolvedGroupCoreError("runtime directory already exists")
        path.mkdir(mode=0o700)
    tmp = root / "tmp"
    if tmp.is_symlink() or not tmp.is_dir():
        raise Profile0034UnresolvedGroupCoreError("runtime tmp is unsafe")
    _validate_prelaunch_quarantine()


def _inventory(
    root: Path, prepared: Mapping[str, PreparedQuery] | None = None
) -> str:
    if root.is_symlink() or not root.is_dir():
        raise Profile0034UnresolvedGroupCoreError("run root is unsafe")
    _validate_prelaunch_quarantine()
    names = {row.name for row in root.iterdir()}
    if names == {"run_manifest.json", "tmp"}:
        return "INITIALIZED"
    if names != {
        "run_manifest.json",
        "artifacts",
        "events",
        "tmp",
    }:
        raise Profile0034UnresolvedGroupCoreError("run inventory drifted")
    for name in ("artifacts", "events", "tmp"):
        path = root / name
        if path.is_symlink() or not path.is_dir():
            raise Profile0034UnresolvedGroupCoreError("runtime directory is unsafe")
    if {row.name for row in (root / "tmp").iterdir()} != {
        PRELAUNCH_QUARANTINE_CONTAINER.name
    }:
        raise Profile0034UnresolvedGroupCoreError("runtime tmp inventory drifted")
    for row in root.rglob("*"):
        if row.name.startswith(".piqd-smt-tombstone-") or _TOMBSTONE.fullmatch(row.name):
            raise Profile0034UnresolvedGroupCoreError("transaction tombstone remains")
    event_names = {row.name for row in (root / "events").iterdir()}
    if "launch.json" not in event_names or event_names - {"launch.json", "terminal.json"}:
        raise Profile0034UnresolvedGroupCoreError("event inventory drifted")
    if "terminal.json" not in event_names:
        return "LAUNCHED"
    if prepared is None or set(prepared) != set(QUERY_KEYS):
        raise Profile0034UnresolvedGroupCoreError("terminal replay inputs are absent")
    artifacts = root / "artifacts"
    if {row.name for row in artifacts.iterdir()} != set(QUERY_KEYS):
        raise Profile0034UnresolvedGroupCoreError("query inventory drifted")
    for key in QUERY_KEYS:
        verify_query_tree(prepared[key], artifacts / key)
    return "TERMINAL"


def _launch_record(
    manifest: Mapping[str, Any], execution_commit: str, server: str, workers: int
) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_commit": execution_commit,
        "server": server,
        "transport": "piqd-http-json",
        "solver": SOLVER,
        "timeout_ms": TIMEOUT_MS,
        "workers": workers,
        "max_workers": MAX_WORKERS,
        "queries": list(QUERY_KEYS),
        "control_order": list(CONTROL_KEYS),
        "target_batches": [list(TARGET_KEYS)],
        "sessions": "fresh-per-cell",
        "solves_per_session": 1,
        "request_ids": {key: _query_request_id(key) for key in QUERY_KEYS},
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _core_summary(prepared: PreparedQuery, result: Mapping[str, Any]) -> list[dict[str, Any]] | None:
    engine = result["engine"]
    if engine["raw_status"] != "UNSAT":
        return None
    terms = engine["unsat_assumptions"]["assumption_terms"]
    by_term = {row["assumption_term"]: row for row in prepared.system["group_bindings"]}
    return [
        {
            "group_id": by_term[term]["group_id"],
            "assumption_term": term,
            "label_sha256": by_term[term]["label_sha256"],
        }
        for term in terms
    ]


def _terminal_record(
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    results: Mapping[str, Mapping[str, Any]],
    prepared: Mapping[str, PreparedQuery],
) -> dict[str, Any]:
    if set(results) != set(QUERY_KEYS) or set(prepared) != set(QUERY_KEYS):
        raise Profile0034UnresolvedGroupCoreError("terminal query inventory drifted")
    rows = {}
    counts = {"SAT_REPLAYED": 0, "UNSAT_GROUP_CORE": 0, "UNKNOWN": 0}
    for key in QUERY_KEYS:
        result = results[key]
        disposition = (
            "SAT_REPLAYED" if result["engine"]["raw_status"] == "SAT" else
            "UNSAT_GROUP_CORE" if result["engine"]["raw_status"] == "UNSAT" else
            "UNKNOWN"
        )
        counts[disposition] += 1
        rows[key] = {
            "raw_status": result["engine"]["raw_status"],
            "effective_status": result["engine"]["effective_status"],
            "disposition": disposition,
            "result_sha256": result["result_sha256"],
            "group_core": _core_summary(prepared[key], result),
        }
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": "COMPLETED",
        "query_count": len(QUERY_KEYS),
        "disposition_counts": counts,
        "results": rows,
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _read_terminal(path: Path) -> dict[str, Any]:
    terminal = _strict(_read(path), "terminal")
    if (
        terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("lane_id") != LANE_ID
        or terminal.get("run_id") != RUN_ID
        or terminal.get("status") != "COMPLETED"
        or terminal.get("query_count") != len(QUERY_KEYS)
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise Profile0034UnresolvedGroupCoreError("terminal record drifted")
    return terminal


def _validate_server(server: str) -> str:
    if type(server) is not str:
        raise Profile0034UnresolvedGroupCoreError("PIQD server URL is malformed")
    parsed = urllib.parse.urlsplit(server)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.hostname
        or parsed.path not in {"", "/"}
        or parsed.username is not None
        or parsed.password is not None
        or parsed.query
        or parsed.fragment
    ):
        raise Profile0034UnresolvedGroupCoreError("PIQD server URL is malformed")
    return server.rstrip("/")


def _execute_queries(
    prepared: Mapping[str, PreparedQuery],
    root: Path,
    transport: adapter.PiqdTransport,
    workers: int,
) -> dict[str, dict[str, Any]]:
    """Run controls in order, then the two targets as one bounded batch."""

    if set(prepared) != set(QUERY_KEYS):
        raise Profile0034UnresolvedGroupCoreError("prepared query inventory drifted")
    results: dict[str, dict[str, Any]] = {}
    for key in CONTROL_KEYS:
        results[key] = run_query(prepared[key], root / "artifacts" / key, transport)
    with concurrent.futures.ThreadPoolExecutor(
        max_workers=min(workers, len(TARGET_KEYS))
    ) as pool:
        futures = {
            key: pool.submit(
                run_query, prepared[key], root / "artifacts" / key, transport
            )
            for key in TARGET_KEYS
        }
        for key in TARGET_KEYS:
            results[key] = futures[key].result()
    session_ids = [result["engine"]["session_id"] for result in results.values()]
    if (
        any(type(session_id) is not str or not session_id for session_id in session_ids)
        or len(session_ids) != len(set(session_ids))
    ):
        raise Profile0034UnresolvedGroupCoreError("query session identities crossed")
    return results


def run_campaign(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = DEFAULT_WORKERS,
    init_only: bool = False,
    transport: adapter.PiqdTransport | None = None,
) -> dict[str, Any]:
    if type(workers) is not int or type(workers) is bool or not 2 <= workers <= MAX_WORKERS:
        raise Profile0034UnresolvedGroupCoreError(f"workers must lie in 2..{MAX_WORKERS}")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or timeout_s != DEFAULT_TIMEOUT_S
    ):
        raise Profile0034UnresolvedGroupCoreError("timeout is fixed at 60 seconds")
    root, manifest = ensure_run_root()
    custody = authenticate_parent_run()
    prepared = {key: prepare_query(key, custody=custody) for key in QUERY_KEYS}
    phase = _inventory(root, prepared) if (root / "events/terminal.json").exists() else _inventory(root)
    if init_only:
        if phase != "INITIALIZED":
            raise Profile0034UnresolvedGroupCoreError("init-only requires a pristine root")
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
        if launch != stored_launch:
            raise Profile0034UnresolvedGroupCoreError("launch replay drifted")
        results = {
            key: verify_query_tree(prepared[key], root / "artifacts" / key)
            for key in QUERY_KEYS
        }
        expected = _terminal_record(manifest, launch, results, prepared)
        stored = _read_terminal(terminal_path)
        if expected != stored or _inventory(root, prepared) != "TERMINAL":
            raise Profile0034UnresolvedGroupCoreError("terminal replay drifted")
        return stored
    if phase != "INITIALIZED":
        raise Profile0034UnresolvedGroupCoreError("incomplete launch cannot resume; use a fresh run id")
    execution_commit = authenticate_execution_commit(manifest)
    launch = _launch_record(manifest, execution_commit, server, workers)
    _initialize_runtime_dirs(root)
    _publish_once(launch_path, _json(launch))
    active = transport or adapter.UrllibPiqdTransport(server, http_timeout_s=DEFAULT_TIMEOUT_S + 40)
    results = _execute_queries(prepared, root, active, workers)
    terminal = _terminal_record(manifest, launch, results, prepared)
    _publish_once(terminal_path, _json(terminal))
    if _inventory(root, prepared) != "TERMINAL":
        raise Profile0034UnresolvedGroupCoreError("terminal inventory drifted")
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
            server=args.server, timeout_s=args.timeout, workers=args.workers,
            init_only=args.init_only,
        )
    except Exception as exc:  # noqa: BLE001 -- CLI errors must be visible
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "DEFAULT_TIMEOUT_S", "DEFAULT_WORKERS", "FALSE_CLAIMS", "LANE_ID",
    "MAX_WORKERS", "QUERY_KEYS", "RUN_ID", "RUN_ROOT", "TARGET_KEYS",
    "TIMEOUT_MS", "UNRESOLVED_GROUPS", "authenticate_parent_run",
    "build_group_system", "build_smt_commands", "main", "prepare_query",
    "reconstruct_unguarded_commands", "run_campaign", "run_query",
    "verify_query_tree", "verify_sat_model",
]


if __name__ == "__main__":
    raise SystemExit(main())
