"""Governed singleton-deletion grid for two reduced profile-0034 cells.

All solver observations are finite-formula discovery evidence.  This producer
makes no source, theorem, Lean-ingress, closure, or promotion claim.
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
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_profile0034_new_mirror_reduced_cell_confirmation_piqd as parent,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-profile0034-new-mirror-reduced-singleton-deletion-piqd-20260905"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
TEST_PATH = REPOSITORY_ROOT / (
    "census/card_head/tests/test_exactfive_profile0034_new_mirror_"
    "reduced_singleton_deletion_piqd.py"
)
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-profile0034-new-mirror-reduced-singleton-"
    "deletion-piqd-v1.md"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_profile0034_new_mirror_reduced_singleton_deletion_piqd.py"
)

CHECKPOINT_OWNER = "profile0034-new-mirror-reduced-singleton-deletion-piqd"
CHECKPOINT_BASE_HEAD = "7951fe6cc6d540655cf48f1775c09a943452c3f8"
DEFAULT_TIMEOUT_S = 60.0
TIMEOUT_MS = 60_000
WORKERS = 20
MIN_WORKERS = 1
MAX_WORKERS = 20
BRANCH_IDS = ("gt", "lt")
GT_GROUP_IDS = (
    "edge-index-00",
    "edge-index-01",
    "edge-index-03",
    "edge-index-04",
    "source-row-equality-00",
    "source-row-equality-01",
    "source-row-equality-03",
    "source-row-equality-05",
)
LT_GROUP_IDS = (
    "edge-index-00",
    "edge-index-01",
    "edge-index-03",
    "edge-index-04",
    "edge-index-06",
    "source-row-equality-01",
    "source-row-equality-02",
    "source-row-equality-03",
    "source-row-equality-05",
)
BRANCH_GROUP_IDS = {"gt": GT_GROUP_IDS, "lt": LT_GROUP_IDS}
PARENT_TARGET_PINS = {
    "gt": {
        "group_sha256": "b87f28e24a17ce52e7f9b45b761730befa82807937b49152b04247f0306130e9",
        "journal_sha256": "b890625b9b39c1452de181d776e89addd76deb9b26321b93cb344713e35ba611",
        "assertions": 48,
        "commands": 69,
        "bytes": 5365,
    },
    "lt": {
        "group_sha256": "c38f1b732a8fc0b8043ca1b4181af97e828c273600273ba98e5b0282aef0a92c",
        "journal_sha256": "4eed0894343ae34a60d1b8b5c3328c4a584cdb7e344dad3dddcb3136e441be22",
        "assertions": 59,
        "commands": 80,
        "bytes": 6340,
    },
}
TARGET_PINS = {
    "gt": {
        "edge-index-00": ("4561ff28581955ff9dc8e9d184019dd3be3b7d2dc7b36cf1ef5f0a75879b97cd", "54f8e604275b035c969fb8fb654dfee9bcd5ae024ffa869c6b91ed3fc58531f2", 37, 58, 4500),
        "edge-index-01": ("d1703572ac43239b77436977fd4417e8019e3d2e4158c94b9f9c508eb5a83267", "3000a2a71305fbb0257a1ec3ad522683bd631aadb9ca15402f3d57e1efa50e4a", 37, 58, 4230),
        "edge-index-03": ("030ad0b23e6bcf807c0be5a4d2b26ebc5ea073820131a63beb9e05b1bdf9fc74", "1f8047bbb07595319f82f1a71e8dd59fa1d283ddb4d3792be4fcf53a6e1b4594", 37, 58, 4290),
        "edge-index-04": ("f1f87804e78046d672ef38d6c0114df9eeb594006791b611d8acbf02b904ba9e", "e964e27452f2e8fad1acc5c1c9edb2afa735529b7b1cb3c7f2d49bcd49446913", 37, 58, 4290),
        "source-row-equality-00": ("c5cb0beb9fab593a0036f0b17c7df081cf8eaf29e3f5e496dd0a43956c2af6fe", "45af2320e8cc50ac90ae4ef0e8942dcf26f8b5355ae6be050f42b2aa6f5e87a2", 47, 68, 5208),
        "source-row-equality-01": ("710338be372110a24111afe73a8dfc80e3f9aa4ae94e2f49833993509fdc86c6", "bfdb51b1f0a6cbecc0a1b54431306ec1f83559198c4036effacd8d184c654cef", 47, 68, 5208),
        "source-row-equality-03": ("d34cc6364a85dc2d7f08b21f8c03eea6ff28056fe5660d86acfd5b24a81e2c83", "d2b7ba30a7029ea60667bb4e6fe5c87a41c6958848796d1693ade7f5e9bcdece", 47, 68, 5240),
        "source-row-equality-05": ("7629a61afeae318e1f1fb8eea22eb582fdb940d47f30cabd27737ddae3017f2d", "2684cdb4fa7343bd0f50d2d006732e33c64896efba78f36d4344bc864c447d71", 47, 68, 5188),
    },
    "lt": {
        "edge-index-00": ("4a29e022e956280271b1b8436b49211f60161948ecbbc355a0579ba973a6857f", "504acf4f402778e147b219d668d690a71add8d48b5fd21ffb1275c0b0b8e3190", 48, 69, 5475),
        "edge-index-01": ("6f59c240df12cba102450094ca66b46069865ae77a34d3f391dcf70da8314d39", "38f6c6aa227ac6351f2447909818dd51c743aedfaf6dfd57b78cf59f9a5b8d52", 48, 69, 5205),
        "edge-index-03": ("cb624ad63558ae3758f870779d205dfbdf590f43e3d5775668e7a5369d260b74", "da4d0d0908f48717605fd7c12498f69fc7d4d0dec46f3c9736c76c3c23262c64", 48, 69, 5265),
        "edge-index-04": ("32ff01d39b13e306700a4da1f8c738a2939d4e5832b1f3fbcb970306f73de109", "47a60f2e757700ddb3c736ea51d08a587260ec15ee2833c7f8c54755fd0d7c38", 48, 69, 5265),
        "edge-index-06": ("bc0b94f59b4d673fa4bc7b1937e8669a741c1007ac4039061c2296baf16ade12", "58b2d4a8a6608112273a0d6c6718a037668991b5493912c84553ef4aba7bee6c", 48, 69, 5365),
        "source-row-equality-01": ("dc832af877317081fcb85f864b81d7c41ddcbfcd8a5b952e758a79689618cfac", "591f548fffb00671704c08ec284891e525a01fcd8891e5d1191f35ffa249b64d", 58, 79, 6183),
        "source-row-equality-02": ("aa69de1ce1e77a97dea4ac8335fa887d63e95b7bd33dc562e0dfd562a48cb85a", "c0dfa425e4271dcba73a0dc5990632e685381650a91ba81ac839c421c9f9469e", 58, 79, 6183),
        "source-row-equality-03": ("df1c7d7f23ee9d8e7af29d33eb0cb9deafc5f135f59496870a96a6590f9c05a3", "ca15a9cf7003a1e3138e753dd1b1df90d2a70cc81ffc80d5a6d6a2fda5755ca0", 58, 79, 6215),
        "source-row-equality-05": ("7a4a47fbdcce92a556b906f6e095690a41286bb3e8f469ad3905da19fcbee94f", "acdd51fcf96a1644e7db4983291a1a7b9863dc6c4d41029b407897dd0577f9cb", 58, 79, 6163),
    },
}
QUERY_PLAN = tuple(
    (f"z3-{branch}-drop-{group_id}", "z3", branch, group_id)
    for branch in BRANCH_IDS
    for group_id in BRANCH_GROUP_IDS[branch]
) + (
    ("z3-control-positive", "z3", "positive", None),
    ("z3-control-negative", "z3", "negative", None),
)
QUERY_KEYS = tuple(row[0] for row in QUERY_PLAN)
CONTROL_KEYS = QUERY_KEYS[-2:]

PARENT_ROOT = parent.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PINS = {
    "manifest_file": "56c7cddc59815bf9b8e0ec74c628f6a57ecd9bc1fbc8f1b3f591a58957a5649f",
    "manifest": "d1de7b82470b2d7eed2265fc4b20ba254aab675319094475ac3a50df11a457f2",
    "launch_file": "193de4aacd988eab0a01205509748df7b861392aa8e1d919760af3b519e9d6c2",
    "launch": "e8a84f9e314d9e912863b2a2a8ef09a720d259e51336ce2068cafc04ac39531f",
    "terminal_file": "88ef017b611fdea4f4f844cd823208360d35249e53382d373e86bb3cfe1ff2fa",
    "terminal": "74c28c3ff5dfc63b42a71134501126c23fa26f58193ff36f08105f737471cbc0",
    "execution_commit": "bffaf8c50100dcd7637f761a3baf6e9c397268e5",
    "confirmation_parent_custody": "bbaafb1f39e161ff7387fc6d489643152f9d0e14cd9a5570e2d8c08371930487",
    "custody": "6f70dbf7d81353bfd815df50e43f3e048331aa365178bd8872c9c1f922899a9d",
}

SYSTEM_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-singleton-deletion-system/v1"
DESCRIPTOR_SCHEMA = "p97-smt-source-semantic-descriptor/v1"
SOLVER_PROFILE_SCHEMA = "piqd-solver-profile/v1"
RESULT_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-singleton-deletion-result/v1"
PARENT_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-confirmation-parent/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-singleton-deletion-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-singleton-deletion-terminal/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
_FULL_COMMIT = re.compile(r"[0-9a-f]{40}")
_ENGINE_KEYS = frozenset(
    {
        "solver", "session_id", "solver_signature", "solver_sha256",
        "raw_status", "effective_status", "solve_index", "result_sha256",
        "response_lost", "reconciled_from_receipt", "reconciliation_attempts",
        "result_digest_advisory", "unsat_assumptions", "semantic_replay",
        "artifacts", "claims", "request_id", "request_sha256",
        "assumption_labels", "request_replay_attempted", "request_replayed",
        "resumed_from_receipt", "session_lifecycle",
    }
)

FALSE_CLAIMS = {
    "all_profile_execution": False,
    "core_minimality": False,
    "formula_minimality": False,
    "lean_ingress": False,
    "live_closure": False,
    "live_source_completeness": False,
    "promotion": False,
    "source_realization": False,
    "simultaneous_removability": False,
    "theorem": False,
}
_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_profile0034_new_mirror_reduced_singleton_deletion_piqd.py",
    "census/card_head/tests/test_exactfive_profile0034_new_mirror_reduced_singleton_deletion_piqd.py",
    "docs/specs/p97-exactfive-profile0034-new-mirror-reduced-singleton-deletion-piqd-v1.md",
    "scripts/run_exactfive_profile0034_new_mirror_reduced_singleton_deletion_piqd.py",
]


class ReducedSingletonDeletionError(RuntimeError):
    """The reduced singleton deletion lane failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    solver: str
    kind: str
    branch: str | None
    removed_group_id: str | None
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery

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
    flags = os.O_RDONLY | getattr(os, "O_NONBLOCK", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise ReducedSingletonDeletionError(f"missing custody file: {path}") from exc
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
            raise ReducedSingletonDeletionError(f"unsafe custody file: {path}")
        chunks: list[bytes] = []
        remaining = info.st_size
        while remaining:
            chunk = os.read(descriptor, remaining)
            if not chunk:
                raise ReducedSingletonDeletionError(f"custody file changed: {path}")
            chunks.append(chunk)
            remaining -= len(chunk)
        if os.read(descriptor, 1):
            raise ReducedSingletonDeletionError(f"custody file changed: {path}")
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise ReducedSingletonDeletionError(f"{where} is not strict JSON") from exc
    if type(value) is not dict or _json(value) != payload:
        raise ReducedSingletonDeletionError(f"{where} is not canonical JSON")
    return value


def _publish_once(path: Path, payload: bytes) -> None:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(path, flags, 0o600)
    except FileExistsError:
        if _read(path) != payload:
            raise ReducedSingletonDeletionError("immutable artifact drifted")
        return
    except OSError as exc:
        raise ReducedSingletonDeletionError("create-once publication failed") from exc
    try:
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise ReducedSingletonDeletionError("short immutable artifact write")
            view = view[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise ReducedSingletonDeletionError("manifest path escapes repository") from exc


def _source_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read(path)) for path in sorted(set(paths))}


def _git_read(arguments: Sequence[str], where: str) -> bytes:
    completed = subprocess.run(
        ["git", *arguments],
        cwd=REPOSITORY_ROOT,
        stdin=subprocess.DEVNULL,
        capture_output=True,
        check=False,
    )
    if completed.returncode != 0:
        raise ReducedSingletonDeletionError(f"git read failed: {where}")
    return completed.stdout


def _pinned_json(path: Path, file_sha: str, self_field: str, self_sha: str, where: str) -> dict[str, Any]:
    payload = _read(path)
    record = _strict(payload, where)
    if _sha(payload) != file_sha or record.get(self_field) != self_sha or _self_hash(record, self_field) != self_sha:
        raise ReducedSingletonDeletionError(f"{where} digest drifted")
    return record


def authenticate_parent_run() -> dict[str, Any]:
    """Authenticate the complete six-cell reduced-confirmation parent run."""
    root, manifest = parent.ensure_run_root()
    if root != PARENT_ROOT or _sha(_read(PARENT_MANIFEST_PATH)) != PARENT_PINS["manifest_file"]:
        raise ReducedSingletonDeletionError("confirmation manifest file drifted")
    if manifest.get("manifest_sha256") != PARENT_PINS["manifest"]:
        raise ReducedSingletonDeletionError("confirmation manifest drifted")
    launch = _pinned_json(
        PARENT_LAUNCH_PATH, PARENT_PINS["launch_file"], "launch_sha256", PARENT_PINS["launch"], "confirmation launch"
    )
    terminal_file = _pinned_json(
        PARENT_TERMINAL_PATH, PARENT_PINS["terminal_file"], "terminal_sha256", PARENT_PINS["terminal"], "confirmation terminal"
    )
    if launch.get("execution_commit") != PARENT_PINS["execution_commit"]:
        raise ReducedSingletonDeletionError("confirmation execution commit drifted")
    source_parent = parent.authenticate_parent_run()
    if source_parent.get("parent_custody_sha256") != PARENT_PINS["confirmation_parent_custody"]:
        raise ReducedSingletonDeletionError("confirmation parent custody drifted")
    parent._authenticate_source_commit(manifest, launch.get("execution_commit"))
    terminal = parent.verify_terminal_run(root, manifest, launch, source_parent)
    if terminal != terminal_file or terminal.get("status") != "TARGET_INCONCLUSIVE":
        raise ReducedSingletonDeletionError("confirmation terminal validation drifted")
    if launch.get("queries") != list(parent.QUERY_KEYS) or terminal.get("claims") != parent.FALSE_CLAIMS:
        raise ReducedSingletonDeletionError("confirmation terminal scope drifted")
    expected_states = {
        "z3-target-gt": "UNSAT_CUSTODY_VALID",
        "cvc5-target-gt": "UNKNOWN",
        "z3-target-lt": "UNSAT_CUSTODY_VALID",
        "cvc5-target-lt": "UNKNOWN",
        "cvc5-control-positive": "SAT_REPLAYED",
        "cvc5-control-negative": "UNSAT_CUSTODY_VALID",
    }
    cells = terminal.get("cells")
    if type(cells) is not dict or set(cells) != set(expected_states):
        raise ReducedSingletonDeletionError("confirmation cell inventory drifted")
    for key, state in expected_states.items():
        row = cells.get(key)
        if type(row) is not dict or row.get("state") != state or type(row.get("result_sha256")) is not str:
            raise ReducedSingletonDeletionError(f"confirmation cell drifted: {key}")
    for branch in BRANCH_IDS:
        if parent.BRANCH_GROUP_IDS[branch] != BRANCH_GROUP_IDS[branch]:
            raise ReducedSingletonDeletionError(f"confirmation {branch} groups drifted")
        prepared = parent.prepare_query(f"z3-target-{branch}", custody=source_parent)
        pin = PARENT_TARGET_PINS[branch]
        if (
            _sha(prepared.query.journal_smt2) != pin["journal_sha256"]
            or parent.parent._group_sha256(BRANCH_GROUP_IDS[branch]) != pin["group_sha256"]
            or sum(command.startswith("(assert ") for command in prepared.query.journal_commands) != pin["assertions"]
            or len(prepared.query.journal_commands) != pin["commands"]
            or len(prepared.query.journal_smt2) != pin["bytes"]
        ):
            raise ReducedSingletonDeletionError(f"confirmation {branch} journal drifted")
    record = {
        "schema": PARENT_SCHEMA,
        "manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "terminal_sha256": terminal["terminal_sha256"],
        "execution_commit": launch["execution_commit"],
        "confirmation_parent_custody_sha256": source_parent["parent_custody_sha256"],
        "cell_states": dict(sorted(expected_states.items())),
        "cell_result_sha256s": {key: cells[key]["result_sha256"] for key in sorted(cells)},
        "branch_groups": {branch: list(BRANCH_GROUP_IDS[branch]) for branch in BRANCH_IDS},
        "branch_journal_sha256s": {branch: PARENT_TARGET_PINS[branch]["journal_sha256"] for branch in BRANCH_IDS},
        "branch_group_sha256s": {branch: PARENT_TARGET_PINS[branch]["group_sha256"] for branch in BRANCH_IDS},
        "source_systems": {branch: source_parent["source_systems"][branch] for branch in BRANCH_IDS},
        "claims": dict(FALSE_CLAIMS),
    }
    record["parent_custody_sha256"] = _self_hash(record, "parent_custody_sha256")
    if record["parent_custody_sha256"] != PARENT_PINS["custody"]:
        raise ReducedSingletonDeletionError("singleton parent custody drifted")
    return record


def _plan(key: str) -> tuple[str, str, str | None]:
    plans = {item[0]: item[1:] for item in QUERY_PLAN}
    try:
        return plans[key]
    except KeyError as exc:
        raise ReducedSingletonDeletionError(f"unknown query key: {key}") from exc


def _build_system(key: str, custody: Mapping[str, Any]) -> tuple[str, str | None, str | None, dict[str, Any]]:
    solver, selector, removed_group_id = _plan(key)
    if selector in BRANCH_IDS:
        source = custody.get("source_systems", {}).get(selector)
        if type(source) is not dict:
            raise ReducedSingletonDeletionError("authenticated branch source is absent")
        original = BRANCH_GROUP_IDS[selector]
        if removed_group_id not in original:
            raise ReducedSingletonDeletionError("removed group is outside the parent cell")
        groups = tuple(group_id for group_id in original if group_id != removed_group_id)
        if len(groups) + 1 != len(original):
            raise ReducedSingletonDeletionError("singleton deletion cardinality drifted")
        system = {
            "schema": SYSTEM_SCHEMA,
            "kind": "target",
            "key": key,
            "solver": solver,
            "branch": selector,
            "original_group_ids": list(original),
            "removed_group_id": removed_group_id,
            "source_system": source,
            "retained_group_ids": list(groups),
            "retained_group_sha256": parent.parent._group_sha256(groups),
            "omitted_group_ids": [item for item in parent.parent.GROUP_UNIVERSE if item not in groups],
            "parent_custody_sha256": custody["parent_custody_sha256"],
            "decision_scope": "one-group deletion relative to one fixed parent cell",
            "claims": dict(FALSE_CLAIMS),
        }
        return solver, selector, removed_group_id, system
    if removed_group_id is not None or selector not in {"positive", "negative"}:
        raise ReducedSingletonDeletionError("control plan drifted")
    source = parent.parent.deletion.build_control_system(selector)
    system = {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
        "key": key,
        "solver": solver,
        "control": selector,
        "source_system": source,
        "retained_group_ids": [],
        "omitted_group_ids": [],
        "parent_custody_sha256": custody["parent_custody_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }
    return solver, None, None, system


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    if type(system) is not dict or system.get("schema") != SYSTEM_SCHEMA or system.get("claims") != FALSE_CLAIMS:
        raise ReducedSingletonDeletionError("system is malformed")
    if system.get("kind") == "control":
        return tuple(parent.parent.deletion._build_smt_commands_current(system["source_system"]))
    if system.get("kind") != "target" or system.get("branch") not in BRANCH_IDS:
        raise ReducedSingletonDeletionError("system kind is invalid")
    branch = system["branch"]
    removed = system.get("removed_group_id")
    original = BRANCH_GROUP_IDS[branch]
    retained = tuple(group_id for group_id in original if group_id != removed)
    if (
        removed not in original
        or system.get("original_group_ids") != list(original)
        or system.get("retained_group_ids") != list(retained)
        or system.get("retained_group_sha256") != parent.parent._group_sha256(retained)
    ):
        raise ReducedSingletonDeletionError("singleton retained groups drifted")
    return parent.parent.reconstruct_unguarded_commands(system["source_system"], retained)


def _journal(commands: Sequence[str]) -> bytes:
    return b"".join(command.encode("ascii") + b"\n" for command in commands)


def _manifest_sources() -> list[Path]:
    return [
        Path(__file__), TEST_PATH, SPEC_PATH, RUNNER_PATH, CHECKPOINT_PATH,
        Path(parent.__file__), Path(parent.parent.__file__),
        Path(parent.parent.deletion.__file__),
        Path(parent.parent.deletion.bo_source.__file__),
        Path(adapter.__file__),
    ]


def _manifest_inputs() -> list[Path]:
    paths = [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
    terminal = _strict(_read(PARENT_TERMINAL_PATH), "confirmation terminal")
    for key in terminal.get("cells", {}):
        paths.append(PARENT_ROOT / "artifacts" / key / "result.json")
    return sorted(set(paths))


def _snapshots(custody: Mapping[str, Any], system: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
    rows = [
        adapter.SourceSnapshot("0000-confirmation-parent-custody.json", _json(custody)),
        adapter.SourceSnapshot("0001-singleton-deletion-system.json", _json(system)),
    ]
    for index, path in enumerate(_manifest_sources()):
        rows.append(adapter.SourceSnapshot(f"source-{index:03d}-{_repo_path(path).replace('/', '--')}", _read(path)))
    for index, path in enumerate(_manifest_inputs()):
        rows.append(adapter.SourceSnapshot(f"input-{index:03d}-{_repo_path(path).replace('/', '--')}", _read(path)))
    names = [row.path for row in rows]
    if len(names) != len(set(names)):
        raise ReducedSingletonDeletionError("source snapshot names collided")
    return tuple(sorted(rows, key=lambda row: row.path))


def prepare_query(key: str, *, custody: Mapping[str, Any] | None = None, timeout_ms: int = TIMEOUT_MS) -> PreparedQuery:
    if timeout_ms != TIMEOUT_MS or type(timeout_ms) is bool:
        raise ReducedSingletonDeletionError("timeout must be 60000ms")
    bound = dict(custody or authenticate_parent_run())
    if (
        bound.get("parent_custody_sha256") != PARENT_PINS["custody"]
        or bound.get("parent_custody_sha256")
        != _self_hash(bound, "parent_custody_sha256")
    ):
        raise ReducedSingletonDeletionError("parent custody is not self-hashed")
    solver, branch, removed_group_id, system = _build_system(key, bound)
    commands = build_smt_commands(system)
    journal = _journal(commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise ReducedSingletonDeletionError("journal normalization drifted")
    text = journal.decode("ascii")
    if "(=>" in text or " Bool" in text or "(check-sat" in text:
        raise ReducedSingletonDeletionError("journal contains guards or solve commands")
    if branch is not None:
        if removed_group_id is None:
            raise ReducedSingletonDeletionError("target deletion identity is absent")
        pin = TARGET_PINS[branch][removed_group_id]
        assertions = sum(command.startswith("(assert ") for command in commands)
        if (_sha(journal), assertions, len(commands), len(journal)) != (
            pin[1], pin[2], pin[3], pin[4]
        ):
            raise ReducedSingletonDeletionError(f"{branch}/{removed_group_id} journal pin drifted")
        if system.get("retained_group_sha256") != pin[0]:
            raise ReducedSingletonDeletionError("retained group hash drifted")
    source_system = system["source_system"]
    variables = sorted(
        ({"id": variable.replace("_", "-"), "term": variable, "sort": "Real"} for variable in source_system["variables"]),
        key=lambda row: row["id"],
    )
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "journal_sha256": _sha(journal),
        "parent_custody_sha256": bound["parent_custody_sha256"],
        "finding_scope": "single-group deletion from one reduced unguarded cell only",
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _snapshots(bound, system)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-profile0034-new-mirror-reduced-singleton-deletion-piqd", "version": "v1"},
        "semantic_verifier": {"id": "profile0034-reduced-singleton-exact-rational-replay", "version": "v1"},
        "stage_id": "profile0034-new-mirror-reduced-singleton-deletion",
        "query_id": key,
        "sources": [{"path": row.path, "bytes": len(row.payload), "sha256": _sha(row.payload)} for row in snapshots],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {"path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)},
        "variables": variables,
        "named_atoms": [],
        "solve": {"assumption_ids": [], "readback_variable_ids": [row["id"] for row in variables], "include_model": True},
        "solver_profile": {"schema": SOLVER_PROFILE_SCHEMA, "solvers": [solver], "timeout_ms": TIMEOUT_MS},
    }
    query = adapter.SourceSemanticQuery(descriptor, _json(descriptor), journal, commands, journal, snapshots)
    return PreparedQuery(
        key,
        solver,
        "target" if branch else "control",
        branch,
        removed_group_id,
        system,
        query,
    )


def verify_sat_model(query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None) -> adapter.SemanticVerification:
    if solver != "z3" or type(model) is not str or type(values) is not str:
        raise ReducedSingletonDeletionError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    system = semantic.get("system") if type(semantic) is dict else None
    if (
        type(system) is not dict
        or build_smt_commands(system) != query.journal_commands
        or query.descriptor_bytes != _json(query.descriptor)
        or query.original_smt2 != _journal(query.journal_commands)
        or query.journal_smt2 != query.original_smt2
        or query.descriptor.get("named_atoms") != []
        or query.descriptor.get("solve", {}).get("assumption_ids") != []
        or semantic.get("journal_sha256") != _sha(query.journal_smt2)
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise ReducedSingletonDeletionError("SAT replay custody crossed")
    try:
        if system["kind"] == "control":
            parsed = parent.parent.deletion._parse_control_value(values)
            accepted = system["control"] == "positive" and parsed == {"t": Fraction(1)}
            evidence: dict[str, Any] = {"accepted": accepted, "control": system["control"], "values": {key: str(value) for key, value in parsed.items()}}
        else:
            coords = parent.parent.deletion._parse_coordinates(values, query.get_values)
            replay_system = {
                "source_system": system["source_system"],
                "retained_group_ids": system["retained_group_ids"],
            }
            evidence = parent.parent._replay_target(replay_system, coords)
            evidence["exact_coordinate_count"] = len(coords)
            evidence["free_coordinate_count"] = len(query.get_values)
    except (
        parent.parent.Profile0034PhysicalBlockDeletionError,
        parent.parent.deletion.Profile0034NewMirrorSupportingEdgeError,
        parent.parent.deletion.bo_source.BoSourceQfnraError,
        KeyError,
        TypeError,
        ValueError,
    ) as exc:
        evidence = {"accepted": False, "reason": "exact_readback_unsupported", "failure": type(exc).__name__}
    evidence.update({"solver": solver, "model_sha256": _sha(model.encode()), "values_sha256": _sha(values.encode()), "system_sha256": _sha(_canonical(system))})
    return adapter.SemanticVerification(bool(evidence.get("accepted")), evidence)


def _request_id(key: str) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


def _session_identity(prepared: PreparedQuery) -> tuple[str, str]:
    profile_sha256 = _sha(
        _canonical(prepared.query.descriptor["solver_profile"])
    )
    label = (
        f"p97-smt-source/{prepared.key}/{prepared.solver}/"
        f"{prepared.query.descriptor['semantic_sha256'][:12]}/"
        f"{_request_id(prepared.key)}/{profile_sha256[:12]}"
    )
    return label, profile_sha256


def _validate_transport_artifacts(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
) -> tuple[dict[str, Any], dict[str, Any] | None]:
    label, profile_sha256 = _session_identity(prepared)
    request_id = _request_id(prepared.key)
    request_sha256 = adapter.piqd_solve_request_digest(prepared.query, ())
    expected_create = {
        "schema": "piqd-smt-session-create-request/v1",
        "request": {"solver": prepared.solver, "lane": "smt", "label": label},
        "request_id": request_id,
        "session_label": label,
        "solver_profile": prepared.query.descriptor["solver_profile"],
        "solver_profile_sha256": profile_sha256,
    }
    if _strict(payloads["session_create_request"], "session create request") != expected_create:
        raise ReducedSingletonDeletionError("session create request drifted")
    if (
        payloads["pre_append_smt2"] != b""
        or payloads["expected_post_append_smt2"] != prepared.query.journal_smt2
    ):
        raise ReducedSingletonDeletionError("journal frontier bytes drifted")
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
        raise ReducedSingletonDeletionError("journal frontier record drifted")
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
        "request_sha256": request_sha256,
    }
    if _strict(payloads["solve_request"], "solve request") != expected_request:
        raise ReducedSingletonDeletionError("solve request drifted")
    try:
        session = adapter._validate_session(
            _strict(payloads["session"], "session"),
            solver=prepared.solver,
            label=label,
            expected_state="live",
        )
        adapter._validate_fresh_session(session)
    except adapter.SmtSourceAdapterError as exc:
        raise ReducedSingletonDeletionError("fresh session custody failed") from exc
    if payloads["smt2"] != prepared.query.journal_smt2:
        raise ReducedSingletonDeletionError("exported journal drifted")
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
            raise ReducedSingletonDeletionError("solve custody failed") from exc
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
        raise ReducedSingletonDeletionError("receipt custody failed") from exc
    if prior is not None:
        raise ReducedSingletonDeletionError("fresh session has a prior receipt")
    try:
        lifecycle = adapter._validate_session_lifecycle(
            _strict(payloads["session_lifecycle"], "session lifecycle")
        )
    except adapter.SmtSourceAdapterError as exc:
        raise ReducedSingletonDeletionError("session lifecycle failed") from exc
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
        raise ReducedSingletonDeletionError("session lifecycle drifted")
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
        if "reconciliation_session" in payloads:
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
        raise ReducedSingletonDeletionError("session close custody failed") from exc
    return session, receipt


def _expected_semantic(
    prepared: PreparedQuery, solve: Mapping[str, Any]
) -> tuple[str, dict[str, Any]]:
    model = solve.get("model")
    values = solve.get("values")
    if type(model) is not str or type(values) is not str:
        raise ReducedSingletonDeletionError("SAT model/readback is absent")
    try:
        verification = verify_sat_model(
            prepared.query, prepared.solver, model, values
        )
        if type(verification) is not adapter.SemanticVerification:
            raise ReducedSingletonDeletionError("semantic verifier returned wrong type")
        replay = {
            "accepted": verification.accepted,
            "evidence": json.loads(_canonical(verification.evidence)),
            "verifier": prepared.query.descriptor["semantic_verifier"],
            "model_sha256": _sha(model.encode("utf-8")),
            "values_sha256": _sha(values.encode("utf-8")),
        }
    except Exception as exc:  # noqa: BLE001 -- verifier failure is unresolved evidence
        return (
            "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
            {
                "accepted": False,
                "failure": type(exc).__name__,
                "verifier": prepared.query.descriptor["semantic_verifier"],
            },
        )
    status = (
        "SAT_SEMANTICALLY_REPLAYED"
        if verification.accepted
        else "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
    )
    return status, replay


def _validate_engine_artifacts(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
) -> str:
    if type(engine) is not dict or set(engine) != _ENGINE_KEYS:
        raise ReducedSingletonDeletionError("engine key set drifted")
    raw = engine["raw_status"]
    if raw not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise ReducedSingletonDeletionError("engine status is unsupported")
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
            raise ReducedSingletonDeletionError("reconciliation artifact is invalid")
        expected_artifacts.add("reconciliation_session")
    if set(payloads) != expected_artifacts:
        raise ReducedSingletonDeletionError("engine artifact inventory drifted")
    session, receipt = _validate_transport_artifacts(prepared, engine, payloads)
    lifecycle = engine["session_lifecycle"]
    if (
        engine["solver"] != prepared.solver
        or engine["session_id"] != session["id"]
        or engine["solver_signature"] != session["solver_signature"]
        or engine["solver_sha256"] != session["solver_sha256"]
        or engine["request_id"] != _request_id(prepared.key)
        or engine["request_sha256"]
        != adapter.piqd_solve_request_digest(prepared.query, ())
        or engine["assumption_labels"] != []
        or engine["claims"] != adapter.FALSE_CLAIMS
        or type(lifecycle) is not dict
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
        raise ReducedSingletonDeletionError("engine identity drifted")
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
            or set(advisory)
            != {"algorithm", "locally_recomputed", "matches_daemon"}
            or advisory["algorithm"] != "piqd-smt-solve-result/v1"
            or advisory["locally_recomputed"] != digest
            or advisory["matches_daemon"] is not True
        ):
            raise ReducedSingletonDeletionError("solve digest drifted")
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
        raise ReducedSingletonDeletionError("transport loss custody drifted")
    if raw == "SAT":
        if solve is None:
            raise ReducedSingletonDeletionError("SAT solve is absent")
        expected_status, expected_semantic = _expected_semantic(prepared, solve)
        if (
            "semantic" not in payloads
            or _strict(payloads["semantic"], "semantic replay")
            != engine["semantic_replay"]
            or engine["semantic_replay"] != expected_semantic
            or engine["effective_status"] != expected_status
        ):
            raise ReducedSingletonDeletionError("SAT replay drifted")
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
            or engine["semantic_replay"] is not None
        ):
            raise ReducedSingletonDeletionError("UNSAT provenance drifted")
    elif raw == "UNKNOWN" and (
        engine["effective_status"] != "INCONCLUSIVE_UNKNOWN"
        or engine["semantic_replay"] is not None
        or engine["unsat_assumptions"] is not None
    ):
        raise ReducedSingletonDeletionError("UNKNOWN custody drifted")
    return classify_engine(prepared, engine)


def classify_engine(prepared: PreparedQuery, engine: Mapping[str, Any]) -> str:
    if type(engine) is not dict or set(engine) != _ENGINE_KEYS:
        raise ReducedSingletonDeletionError("engine key set drifted")
    lifecycle = engine.get("session_lifecycle")
    expected_label, expected_profile_sha256 = _session_identity(prepared)
    if (
        engine.get("solver") != prepared.solver
        or type(engine.get("session_id")) is not str
        or not engine.get("session_id")
        or type(engine.get("solver_signature")) is not str
        or not engine.get("solver_signature")
        or type(engine.get("solver_sha256")) is not str
        or re.fullmatch(r"[0-9a-f]{64}", engine["solver_sha256"]) is None
        or engine.get("request_id") != _request_id(prepared.key)
        or engine.get("request_sha256") != adapter.piqd_solve_request_digest(prepared.query, ())
        or engine.get("assumption_labels") != []
        or engine.get("claims") != adapter.FALSE_CLAIMS
        or engine.get("resumed_from_receipt") is not False
        or type(engine.get("response_lost")) is not bool
        or type(engine.get("reconciled_from_receipt")) is not bool
        or type(engine.get("reconciliation_attempts")) is not int
        or engine.get("reconciliation_attempts") < 0
        or type(engine.get("request_replay_attempted")) is not bool
        or not (
            engine.get("request_replayed") is None
            or type(engine.get("request_replayed")) is bool
        )
        or type(lifecycle) is not dict
        or lifecycle.get("schema") != "piqd-smt-session-lifecycle/v1"
        or lifecycle.get("request_id") != _request_id(prepared.key)
        or lifecycle.get("session_id") != engine.get("session_id")
        or lifecycle.get("session_label") != expected_label
        or lifecycle.get("solver_profile_sha256") != expected_profile_sha256
        or lifecycle.get("resumed_existing_session") is not False
        or lifecycle.get("resumed_from_receipt") is not False
        or lifecycle.get("resume_journal_state") != "not_resumed"
        or lifecycle.get("resume_policy") is not None
        or lifecycle.get("close_observed_state") != "closed"
    ):
        raise ReducedSingletonDeletionError("engine identity drifted")
    raw = engine.get("raw_status")
    effective = engine.get("effective_status")
    if raw is not None and (
        engine.get("response_lost") is not False
        or engine.get("reconciled_from_receipt") is not False
        or engine.get("reconciliation_attempts") != 0
        or engine.get("request_replay_attempted") is not False
        or engine.get("request_replayed") is not False
    ):
        raise ReducedSingletonDeletionError("completed solve used loss or replay")
    if raw is None and (
        engine.get("response_lost") is not True
        or engine.get("reconciled_from_receipt") is not False
        or not (
            engine.get("request_replayed") is None
            or engine.get("request_replayed") is False
        )
    ):
        raise ReducedSingletonDeletionError("transport loss custody drifted")
    if (raw is None and engine.get("solve_index") is not None) or (
        raw is not None
        and (
            type(engine.get("solve_index")) is not int
            or engine.get("solve_index") != 1
        )
    ):
        raise ReducedSingletonDeletionError("solve count drifted")
    if raw == "UNSAT":
        provenance = engine.get("unsat_assumptions")
        if (
            effective != "UNSAT_DISCOVERY_ONLY"
            or type(provenance) is not dict
            or provenance.get("basis") != "get-unsat-assumptions"
            or provenance.get("daemon_field") != "core"
            or provenance.get("named_core_support") is not False
            or provenance.get("terminal_unsat") is not True
            or provenance.get("assumption_terms") != []
            or provenance.get("source_atom_ids") != []
            or engine.get("semantic_replay") is not None
        ):
            raise ReducedSingletonDeletionError("raw UNSAT provenance drifted")
        disposition = "UNSAT_CUSTODY_VALID"
    elif raw == "SAT":
        semantic = engine.get("semantic_replay")
        if effective == "SAT_SEMANTICALLY_REPLAYED" and type(semantic) is dict and semantic.get("accepted") is True:
            disposition = "SAT_REPLAYED"
        elif effective in {"INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED", "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE"}:
            disposition = "SAT_REPLAY_UNRESOLVED"
        else:
            raise ReducedSingletonDeletionError("SAT semantic status drifted")
    elif raw == "UNKNOWN" and effective == "INCONCLUSIVE_UNKNOWN" and engine.get("unsat_assumptions") is None and engine.get("semantic_replay") is None:
        disposition = "UNKNOWN"
    elif raw is None and effective == "INCONCLUSIVE_TRANSPORT_LOSS" and engine.get("unsat_assumptions") is None and engine.get("semantic_replay") is None:
        disposition = "TRANSPORT_LOST"
    else:
        raise ReducedSingletonDeletionError("engine status is unsupported")
    if prepared.kind == "control":
        expected = "SAT_REPLAYED" if prepared.key.endswith("positive") else "UNSAT_CUSTODY_VALID"
        if disposition != expected:
            raise ReducedSingletonDeletionError("fresh Z3 control failed")
    return disposition


def _fd_artifacts(descriptor: int) -> list[dict[str, Any]]:
    rows = []
    for name in sorted(os.listdir(descriptor)):
        if not name or "/" in name or "\\" in name:
            raise ReducedSingletonDeletionError("staged artifact name is unsafe")
        handle = os.open(name, os.O_RDONLY | getattr(os, "O_NONBLOCK", 0) | getattr(os, "O_NOFOLLOW", 0), dir_fd=descriptor)
        try:
            info = os.fstat(handle)
            if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
                raise ReducedSingletonDeletionError("staged artifact is unsafe")
            chunks, remaining = [], info.st_size
            while remaining:
                chunk = os.read(handle, remaining)
                if not chunk:
                    raise ReducedSingletonDeletionError("staged artifact changed")
                chunks.append(chunk)
                remaining -= len(chunk)
            if os.read(handle, 1):
                raise ReducedSingletonDeletionError("staged artifact changed")
            payload = b"".join(chunks)
        finally:
            os.close(handle)
        rows.append(_artifact_record(name, payload))
    return rows


def _result_record(prepared: PreparedQuery, state: str, engine: Mapping[str, Any] | None, artifacts: list[dict[str, Any]], failure: str | None) -> dict[str, Any]:
    record = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": prepared.solver,
        "kind": prepared.kind,
        "branch": prepared.branch,
        "removed_group_id": prepared.removed_group_id,
        "original_group_ids": prepared.system.get("original_group_ids", []),
        "retained_group_ids": prepared.system.get("retained_group_ids", []),
        "retained_group_sha256": prepared.system.get("retained_group_sha256"),
        "system_sha256": _sha(_json(prepared.system)),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "journal_bytes": len(prepared.query.journal_smt2),
        "assertion_count": sum(command.startswith("(assert ") for command in prepared.query.journal_commands),
        "command_count": len(prepared.query.journal_commands),
        "state": state,
        "engine": None if engine is None else dict(engine),
        "failure_type": failure,
        "artifacts": artifacts,
        "finding_scope": "single-group deletion from one reduced unguarded cell only" if prepared.kind == "target" else "transport-control-only",
        "claims": dict(FALSE_CLAIMS),
    }
    record["result_sha256"] = _self_hash(record, "result_sha256")
    return record


def run_cell(prepared: PreparedQuery, output: Path, transport: adapter.PiqdTransport, used_session_ids: set[str]) -> dict[str, Any]:
    if output.exists() or output.is_symlink():
        raise ReducedSingletonDeletionError("singleton-deletion cells cannot resume")
    with adapter.SmtOutputTransaction(output) as transaction:
        for name, payload in (("source-record.json", _json(prepared.system)), ("descriptor.json", prepared.query.descriptor_bytes), ("original.smt2", prepared.query.original_smt2), ("journal.smt2", prepared.query.journal_smt2)):
            transaction.write_bytes(name, payload)
        for index, snapshot in enumerate(prepared.query.source_files):
            transaction.write_bytes(f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin", snapshot.payload)
        engine: dict[str, Any] | None = None
        failure: str | None = None
        try:
            engine = adapter.run_authenticated_single_solver_query(
                prepared.query,
                solver=prepared.solver,
                descriptor_schema=DESCRIPTOR_SCHEMA,
                solver_profile_schema=SOLVER_PROFILE_SCHEMA,
                authenticated_journal_commands=prepared.query.journal_commands,
                transport=transport,
                semantic_verifier=verify_sat_model,
                output_fd=transaction.file_descriptor,
                used_session_ids=used_session_ids,
                request_id=_request_id(prepared.key),
                assumption_labels=(),
            )
            transaction.write_bytes("engine-observation.json", _json(engine))
            state = classify_engine(prepared, engine)
        except (OSError, adapter.SmtSourceAdapterError, ReducedSingletonDeletionError) as exc:
            state = "FAILED_CUSTODY"
            failure = type(exc).__name__
        artifacts = _fd_artifacts(transaction.file_descriptor)
        result = _result_record(prepared, state, engine, artifacts, failure)
        transaction.write_bytes("result.json", _json(result))
        transaction.publish()
    return verify_cell_tree(prepared, output)


def verify_cell_tree(prepared: PreparedQuery, output: Path) -> dict[str, Any]:
    if output.is_symlink() or not output.is_dir():
        raise ReducedSingletonDeletionError("cell output directory is unsafe")
    result = _strict(_read(output / "result.json"), "cell result")
    if (
        result.get("schema") != RESULT_SCHEMA
        or result.get("key") != prepared.key
        or result.get("solver") != prepared.solver
        or result.get("kind") != prepared.kind
        or result.get("branch") != prepared.branch
        or result.get("removed_group_id") != prepared.removed_group_id
        or result.get("original_group_ids") != prepared.system.get("original_group_ids", [])
        or result.get("retained_group_ids") != prepared.system.get("retained_group_ids", [])
        or result.get("retained_group_sha256") != prepared.system.get("retained_group_sha256")
        or result.get("system_sha256") != _sha(_json(prepared.system))
        or result.get("journal_sha256") != _sha(prepared.query.journal_smt2)
        or result.get("journal_bytes") != len(prepared.query.journal_smt2)
        or result.get("assertion_count")
        != sum(
            command.startswith("(assert ")
            for command in prepared.query.journal_commands
        )
        or result.get("command_count") != len(prepared.query.journal_commands)
        or result.get("claims") != FALSE_CLAIMS
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
    ):
        raise ReducedSingletonDeletionError("cell result identity drifted")
    seen = {"result.json"}
    payloads: dict[str, bytes] = {}
    if type(result.get("artifacts")) is not list:
        raise ReducedSingletonDeletionError("cell artifact inventory is malformed")
    for item in result["artifacts"]:
        if type(item) is not dict or set(item) != {"path", "bytes", "sha256"}:
            raise ReducedSingletonDeletionError("cell artifact record is malformed")
        name = item["path"]
        if type(name) is not str or not name or name in seen or "/" in name or "\\" in name:
            raise ReducedSingletonDeletionError("cell artifact name is unsafe")
        payload = _read(output / name)
        if item["bytes"] != len(payload) or item["sha256"] != _sha(payload):
            raise ReducedSingletonDeletionError("cell artifact digest drifted")
        seen.add(name)
        payloads[name] = payload
    if (
        payloads.get("source-record.json") != _json(prepared.system)
        or payloads.get("descriptor.json") != prepared.query.descriptor_bytes
        or payloads.get("original.smt2") != prepared.query.original_smt2
        or payloads.get("journal.smt2") != prepared.query.journal_smt2
    ):
        raise ReducedSingletonDeletionError("cell source custody crossed")
    expected_sources = {f"source-{index:04d}-{_sha(row.payload)[:16]}.bin": row.payload for index, row in enumerate(prepared.query.source_files)}
    if any(payloads.get(name) != payload for name, payload in expected_sources.items()):
        raise ReducedSingletonDeletionError("cell source snapshot crossed")
    entries = list(output.iterdir())
    if {entry.name for entry in entries} != seen or any(entry.is_symlink() or not entry.is_file() or entry.stat(follow_symlinks=False).st_nlink != 1 for entry in entries):
        raise ReducedSingletonDeletionError("cell contains unsafe or unbound artifacts")
    engine = result.get("engine")
    if result.get("state") == "FAILED_CUSTODY":
        if type(result.get("failure_type")) is not str or (
            engine is not None
            and payloads.get("engine-observation.json") != _json(engine)
        ):
            raise ReducedSingletonDeletionError("failed cell lacks failure type")
    else:
        if type(engine) is not dict or payloads.get("engine-observation.json") != _json(engine) or classify_engine(prepared, engine) != result.get("state") or result.get("failure_type") is not None:
            raise ReducedSingletonDeletionError("cell engine custody drifted")
        engine_artifacts = engine.get("artifacts")
        if type(engine_artifacts) is not dict:
            raise ReducedSingletonDeletionError("engine artifact inventory is malformed")
        by_name = {item["path"]: item for item in result["artifacts"]}
        engine_payloads: dict[str, bytes] = {}
        engine_paths: set[str] = set()
        for label, item in engine_artifacts.items():
            if (
                type(label) is not str
                or type(item) is not dict
                or set(item) != {"path", "bytes", "sha256"}
                or by_name.get(item["path"]) != item
                or item["path"] in engine_paths
            ):
                raise ReducedSingletonDeletionError("engine artifact custody crossed")
            engine_paths.add(item["path"])
            engine_payloads[label] = payloads[item["path"]]
        if _validate_engine_artifacts(prepared, engine, engine_payloads) != result.get("state"):
            raise ReducedSingletonDeletionError("engine artifact semantics drifted")
    return result


def _load_checkpoint() -> dict[str, Any]:
    try:
        checkpoint = adapter._strict_json(_read(CHECKPOINT_PATH), "lane checkpoint")
    except Exception as exc:
        raise ReducedSingletonDeletionError("lane checkpoint is not strict JSON") from exc
    if (
        type(checkpoint) is not dict
        or set(checkpoint) != {"schema", "lane_id", "owner", "base_head", "owned_paths", "generated_roots", "durable_paths", "created_utc", "manifest_sha256"}
        or checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != CHECKPOINT_OWNER
        or checkpoint.get("base_head") != CHECKPOINT_BASE_HEAD
        or checkpoint.get("owned_paths") != _OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("manifest_sha256") != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise ReducedSingletonDeletionError("lane checkpoint drifted")
    return checkpoint


def _expected_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    authenticate_parent_run()
    record = {
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
    record["manifest_sha256"] = _self_hash(record, "manifest_sha256")
    return record


def _require_safe_root() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise ReducedSingletonDeletionError("run root escapes repository") from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise ReducedSingletonDeletionError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise ReducedSingletonDeletionError("run ancestor is unsafe")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_root()
    RUN_ROOT.parent.mkdir(parents=True, exist_ok=True)
    if RUN_ROOT.is_symlink() or (RUN_ROOT.exists() and not RUN_ROOT.is_dir()):
        raise ReducedSingletonDeletionError("run root is unsafe")
    RUN_ROOT.mkdir(mode=0o700, exist_ok=True)
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists() or manifest_path.is_symlink():
        manifest = _strict(_read(manifest_path), "run manifest")
        created = manifest.get("created_utc")
        if type(created) is not str or manifest != _expected_manifest(created):
            raise ReducedSingletonDeletionError("run manifest drifted")
    else:
        if tuple(RUN_ROOT.iterdir()):
            raise ReducedSingletonDeletionError("unregistered run payload exists")
        created = dt.datetime.now(dt.UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
        manifest = _expected_manifest(created)
        _publish_once(manifest_path, _json(manifest))
    return RUN_ROOT, manifest


def _authenticate_source_commit(manifest: Mapping[str, Any], commit: object) -> str:
    if type(commit) is not str or _FULL_COMMIT.fullmatch(commit) is None:
        raise ReducedSingletonDeletionError("execution commit is malformed")
    digests = manifest.get("source_digests")
    expected = sorted(_repo_path(path) for path in _manifest_sources())
    if type(digests) is not dict or sorted(digests) != expected:
        raise ReducedSingletonDeletionError("source inventory drifted")
    for relative in expected:
        current = _read(REPOSITORY_ROOT / relative)
        if digests.get(relative) != _sha(current) or _git_read(("show", f"{commit}:{relative}"), relative) != current:
            raise ReducedSingletonDeletionError("recorded source commit drifted")
    return commit


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    raw = _git_read(("rev-parse", "--verify", "HEAD^{commit}"), "current commit")
    try:
        commit = raw.decode("ascii").strip()
    except UnicodeDecodeError as exc:
        raise ReducedSingletonDeletionError("execution commit is malformed") from exc
    if raw != f"{commit}\n".encode():
        raise ReducedSingletonDeletionError("execution commit is malformed")
    return _authenticate_source_commit(manifest, commit)


def _validate_server(server: str) -> str:
    parsed = urllib.parse.urlsplit(server)
    if parsed.scheme not in {"http", "https"} or not parsed.netloc or parsed.username is not None or parsed.password is not None or parsed.query or parsed.fragment:
        raise ReducedSingletonDeletionError("PIQD server URL is invalid")
    return server.rstrip("/")


def _inventory(root: Path) -> str:
    if root.is_symlink() or not root.is_dir():
        raise ReducedSingletonDeletionError("run root is unsafe")
    names = {entry.name for entry in root.iterdir()}
    if names == {"run_manifest.json"}:
        return "INITIALIZED"
    if names != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise ReducedSingletonDeletionError("run inventory drifted")
    for name in ("artifacts", "events", "tmp"):
        path = root / name
        if path.is_symlink() or not path.is_dir():
            raise ReducedSingletonDeletionError("runtime directory is unsafe")
    if tuple((root / "tmp").iterdir()):
        raise ReducedSingletonDeletionError("runtime tmp is not empty")
    event_names = {entry.name for entry in (root / "events").iterdir()}
    artifact_names = {entry.name for entry in (root / "artifacts").iterdir()}
    if not event_names and not artifact_names:
        return "RUNTIME_READY"
    if event_names == {"launch.json"} and artifact_names <= set(QUERY_KEYS):
        return "LAUNCHED"
    if event_names == {"launch.json", "terminal.json"} and artifact_names == set(QUERY_KEYS):
        return "TERMINAL"
    raise ReducedSingletonDeletionError("incomplete run cannot resume")


def _launch_record(
    manifest: Mapping[str, Any], commit: str, server: str, workers: int
) -> dict[str, Any]:
    if type(workers) is not int or type(workers) is bool or not MIN_WORKERS <= workers <= MAX_WORKERS:
        raise ReducedSingletonDeletionError("launch worker count drifted")
    record = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_commit": commit,
        "server": server,
        "timeout_ms": TIMEOUT_MS,
        "workers": workers,
        "queries": list(QUERY_KEYS),
        "sessions": len(QUERY_KEYS),
        "solves_per_session": 1,
        "assumptions": False,
        "resume": False,
        "transport": "maintained PIQD HTTP SMT adapter only",
        "claims": dict(FALSE_CLAIMS),
    }
    record["launch_sha256"] = _self_hash(record, "launch_sha256")
    return record


def _terminal_record(manifest: Mapping[str, Any], launch: Mapping[str, Any], custody: Mapping[str, Any], results: Mapping[str, Mapping[str, Any]]) -> dict[str, Any]:
    if set(results) != set(QUERY_KEYS):
        raise ReducedSingletonDeletionError("terminal cell inventory is incomplete")
    states = {key: results[key]["state"] for key in QUERY_KEYS}
    if states["z3-control-positive"] != "SAT_REPLAYED" or states["z3-control-negative"] != "UNSAT_CUSTODY_VALID":
        raise ReducedSingletonDeletionError("fresh Z3 controls failed")
    decisions: dict[str, dict[str, Any]] = {}
    for key, _, branch, removed_group_id in QUERY_PLAN[:-2]:
        result = results[key]
        pin = TARGET_PINS[branch][removed_group_id]
        if (
            result.get("branch") != branch
            or result.get("removed_group_id") != removed_group_id
            or result.get("original_group_ids") != list(BRANCH_GROUP_IDS[branch])
            or result.get("retained_group_ids")
            != [group_id for group_id in BRANCH_GROUP_IDS[branch] if group_id != removed_group_id]
            or result.get("retained_group_sha256") != pin[0]
            or result.get("journal_sha256") != pin[1]
            or result.get("assertion_count") != pin[2]
            or result.get("command_count") != pin[3]
            or result.get("journal_bytes") != pin[4]
        ):
            raise ReducedSingletonDeletionError("target decision identity drifted")
        state = states[key]
        if state == "SAT_REPLAYED":
            decision = "GROUP_NECESSARY_RELATIVE_TO_ORIGINAL_FIXED_CELL"
        elif state == "UNSAT_CUSTODY_VALID":
            decision = "CANDIDATE_REMOVAL_REQUIRES_FRESH_SEQUENTIAL_RERUN"
        else:
            decision = "UNRESOLVED"
        decisions[key] = {
            "branch": branch,
            "removed_group_id": removed_group_id,
            "state": state,
            "decision": decision,
            "simultaneously_removable": False,
            "minimality_established": False,
        }
    record = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "parent_custody_sha256": custody["parent_custody_sha256"],
        "status": "SINGLETON_DELETION_GRID_COMPLETE",
        "query_count": len(QUERY_KEYS),
        "cells": {
            key: {"state": states[key], "result_sha256": results[key]["result_sha256"]}
            for key in QUERY_KEYS
        },
        "decision_ledger": decisions,
        "decision_rule": {
            "sat_replayed": "the omitted group is necessary relative to the original fixed cell",
            "unsat_custody_valid": "candidate removal only; a fresh sequential rerun is required",
            "unknown_transport_loss_failure": "unresolved",
            "simultaneous_removability": False,
            "minimality": False,
        },
        "finding_scope": "seventeen independent one-group deletions from two reduced unguarded cells",
        "claims": dict(FALSE_CLAIMS),
    }
    record["terminal_sha256"] = _self_hash(record, "terminal_sha256")
    return record


def _require_distinct_session_ids(results: Mapping[str, Mapping[str, Any]]) -> None:
    session_ids = [
        result["engine"].get("session_id")
        for result in results.values()
        if type(result.get("engine")) is dict
        and type(result["engine"].get("session_id")) is str
        and result["engine"].get("session_id")
    ]
    if len(set(session_ids)) != len(session_ids):
        raise ReducedSingletonDeletionError("cell session identities crossed")


def verify_terminal_run(root: Path, manifest: Mapping[str, Any], launch: Mapping[str, Any], custody: Mapping[str, Any]) -> dict[str, Any]:
    terminal = _strict(_read(root / "events/terminal.json"), "terminal")
    prepared = {key: prepare_query(key, custody=custody) for key in QUERY_KEYS}
    results = {key: verify_cell_tree(prepared[key], root / "artifacts" / key) for key in QUERY_KEYS}
    expected = _terminal_record(manifest, launch, custody, results)
    if terminal != expected:
        raise ReducedSingletonDeletionError("terminal record drifted")
    _require_distinct_session_ids(results)
    return terminal


def run_campaign(*, server: str = "http://127.0.0.1:7272", timeout_s: float = DEFAULT_TIMEOUT_S, workers: int = WORKERS, init_only: bool = False, verify: bool = False, check_parent: bool = False, transport: adapter.PiqdTransport | None = None) -> dict[str, Any]:
    if type(timeout_s) not in {int, float} or type(timeout_s) is bool or not math.isfinite(timeout_s) or timeout_s != DEFAULT_TIMEOUT_S:
        raise ReducedSingletonDeletionError("timeout is fixed at 60 seconds")
    if type(workers) is not int or type(workers) is bool or not MIN_WORKERS <= workers <= MAX_WORKERS:
        raise ReducedSingletonDeletionError("workers must be an integer from 1 through 20")
    root, manifest = ensure_run_root()
    custody = authenticate_parent_run()
    if check_parent:
        return {"status": "PARENT_AUTHENTICATED", "parent_custody_sha256": custody["parent_custody_sha256"]}
    phase = _inventory(root)
    if init_only:
        if phase != "INITIALIZED":
            raise ReducedSingletonDeletionError("init-only requires an initialized root")
        return {"status": "INITIALIZED", "run_manifest_sha256": manifest["manifest_sha256"]}
    if verify:
        if phase != "TERMINAL":
            raise ReducedSingletonDeletionError("offline verify requires a terminal run")
        launch = _strict(_read(root / "events/launch.json"), "launch")
        commit = _authenticate_source_commit(manifest, launch.get("execution_commit"))
        stored_server = launch.get("server")
        stored_workers = launch.get("workers")
        if type(stored_server) is not str or type(stored_workers) is not int or launch != _launch_record(
            manifest, commit, _validate_server(stored_server), stored_workers
        ):
            raise ReducedSingletonDeletionError("offline launch record drifted")
        return verify_terminal_run(root, manifest, launch, custody)
    server = _validate_server(server)
    if phase == "TERMINAL":
        launch = _strict(_read(root / "events/launch.json"), "launch")
        _authenticate_source_commit(manifest, launch.get("execution_commit"))
        if launch != _launch_record(
            manifest, launch["execution_commit"], server, launch.get("workers")
        ):
            raise ReducedSingletonDeletionError("terminal launch replay drifted")
        return verify_terminal_run(root, manifest, launch, custody)
    if phase != "INITIALIZED":
        raise ReducedSingletonDeletionError("incomplete run cannot resume; use a fresh run id")
    commit = authenticate_execution_commit(manifest)
    launch = _launch_record(manifest, commit, server, workers)
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(mode=0o700)
    _publish_once(root / "events/launch.json", _json(launch))
    active_transport = transport or adapter.UrllibPiqdTransport(server, http_timeout_s=DEFAULT_TIMEOUT_S + 40)
    prepared = {key: prepare_query(key, custody=custody) for key in QUERY_KEYS}
    results: dict[str, dict[str, Any]] = {}
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as executor:
        futures = {
            executor.submit(
                run_cell,
                prepared[key],
                root / "artifacts" / key,
                active_transport,
                set(),
            ): key
            for key in QUERY_KEYS
        }
        for future in concurrent.futures.as_completed(futures):
            key = futures[future]
            results[key] = future.result()
    _require_distinct_session_ids(results)
    terminal = _terminal_record(manifest, launch, custody, results)
    _publish_once(root / "events/terminal.json", _json(terminal))
    return verify_terminal_run(root, manifest, launch, custody)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=WORKERS)
    parser.add_argument("--init-only", action="store_true")
    parser.add_argument("--verify", action="store_true")
    parser.add_argument("--check-parent", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_campaign(server=args.server, timeout_s=args.timeout, workers=args.workers, init_only=args.init_only, verify=args.verify, check_parent=args.check_parent)
    except (ReducedSingletonDeletionError, adapter.SmtSourceAdapterError, OSError, ValueError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 2
    if args.verbose:
        print(json.dumps(result, sort_keys=True, indent=2))
    return 0


__all__ = [
    "BRANCH_GROUP_IDS",
    "CONTROL_KEYS",
    "DEFAULT_TIMEOUT_S",
    "GT_GROUP_IDS",
    "LANE_ID",
    "LT_GROUP_IDS",
    "QUERY_KEYS",
    "QUERY_PLAN",
    "RUN_ID",
    "RUN_ROOT",
    "TARGET_PINS",
    "WORKERS",
    "PreparedQuery",
    "ReducedSingletonDeletionError",
    "authenticate_parent_run",
    "build_smt_commands",
    "ensure_run_root",
    "main",
    "prepare_query",
    "run_campaign",
    "run_cell",
    "verify_cell_tree",
    "verify_sat_model",
]


if __name__ == "__main__":
    raise SystemExit(main())
