"""Governed physical block deletion for the profile-0034 supporting-edge cells."""

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
import threading
import urllib.parse
import uuid
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd as deletion,
)
from census.card_head import (
    exactfive_hard_source_swap_profile0034_unresolved_group_core_piqd as group_core,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-profile0034-physical-block-deletion-piqd-20260904"
RUN_ID = "run-0003"
SOLVER = "z3"
TIMEOUT_MS = 60_000
DEFAULT_TIMEOUT_S = 60.0
DEFAULT_WORKERS = 20
MAX_WORKERS = 20
BRANCH_IDS = ("lt", "gt")
CONTROL_KEYS = ("z3-control-positive", "z3-control-negative")
QUERY_CAP_PER_BRANCH = 128
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
TEST_PATH = REPOSITORY_ROOT / (
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_"
    "physical_block_deletion_piqd.py"
)
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-"
    "physical-block-deletion-v1.md"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_hard_source_swap_profile0034_physical_block_deletion_piqd.py"
)

CHECKPOINT_OWNER = "profile0034-physical-block-deletion-impl"
CHECKPOINT_BASE_HEAD = "e883c794b0b75ec56889f802831ab0310cb57441"
_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_profile0034_physical_block_deletion_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_physical_block_deletion_piqd.py",
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-physical-block-deletion-v1.md",
    "scripts/run_exactfive_hard_source_swap_profile0034_physical_block_deletion_piqd.py",
]

DELETION_ROOT = deletion.RUN_ROOT
DELETION_MANIFEST_PATH = DELETION_ROOT / "run_manifest.json"
DELETION_LAUNCH_PATH = DELETION_ROOT / "events/launch.json"
DELETION_TERMINAL_PATH = DELETION_ROOT / "events/terminal.json"
DELETION_RECORD_HASHES = {
    "manifest_file": "f83e04a9c74a5e96bbf45b85b3e1e84d379b9901791c9dbc2934dd46b4f1cefb",
    "manifest": "12ebeaf41cb6fe8a79c11f37f3143a33379e71a88f9274dc3edcad2bd133a342",
    "launch_file": "103e1be490e7086ec20541a50148d3d3982ddcaf024bcfc0b8b7b8c7e4590f91",
    "launch": "45c4f3767df769f025e8473dde05c59e7d4c63462a6a4b59608b419226241002",
    "terminal_file": "a637a02559c019bdf1f10d50539df6e4ea00c649b73151343aa035f778ec011a",
    "terminal": "bcc34f7e5c76ba9d0debd10532d875c83eb62139b120c01b7e23b38b4e6d9098",
    "execution_commit": "35e24a0e141ea7e3bb3099e503bbc88d31fe5414",
    "producer": "4d112265c5490ec770979a00009f35264e5aee8aa956065ec99582e08830bb78",
}
GROUP_CORE_ROOT = group_core.RUN_ROOT
GROUP_CORE_MANIFEST_PATH = GROUP_CORE_ROOT / "run_manifest.json"
GROUP_CORE_LAUNCH_PATH = GROUP_CORE_ROOT / "events/launch.json"
GROUP_CORE_TERMINAL_PATH = GROUP_CORE_ROOT / "events/terminal.json"
GROUP_CORE_RECORD_HASHES = {
    "manifest_file": "52a0d428846e6a68d995fbfd81b6297fe727d5704d971ad0dc93f65fedaa5e60",
    "manifest": "6805cabc752d31fc980cd32e11c93d39532c8cedba7eb7d0e3bc6823e64c2409",
    "launch_file": "ddab36f5af85c654d7cf35431465267caee7d155bb4a43eba6facbf6038735bf",
    "launch": "6a4db50380ede193a61940a418aa6d5369c5c15a73f39b20f8ba3675f615747a",
    "terminal_file": "adf43beb1859600cf163f932883c49f13a25630bcedd1229e11cf78f48b96b5b",
    "terminal": "c06bd1902fa1c64efa6fd15b04d85ab69de7758fb170d97fc49739061220b491",
    "execution_commit": "200d362ed5abc75312991ba6a2cc52eddcd2d589",
    "producer": "b3c9cc132756526264758c0e4288776598d056cf705174bbaa56174e0e4e7a85",
}
ADAPTER_SHA256 = "94058aa4e04b5acc27242b52781794944ea00a069b16805104d3263203d65e70"
SOURCE_SHA256 = "75cf96e48d7f0ceb89c965e3cec0d5315107b128540c608f350420689b641534"
SOURCE_PARENT_ROOT = deletion.PARENT_ROOT
SOURCE_PARENT_TERMINAL_PATH = deletion.PARENT_TERMINAL_PATH
SOURCE_PARENT_TERMINAL_FILE_SHA256 = deletion.PARENT_TERMINAL_FILE_SHA256
SOURCE_PARENT_TERMINAL_SHA256 = deletion.PARENT_TERMINAL_SHA256
SOURCE_PARENT_RESULT_FILES = {
    "lt": deletion.EXPECTED_PARENT_RESULTS["parent-z3-mirror-radius-lt"],
    "gt": deletion.EXPECTED_PARENT_RESULTS["parent-z3-mirror-radius-gt"],
}
SOURCE_PARENT_JOURNAL_FILES = {
    "lt": "48ab8d3f71b20f5c723c7d31244fde69db12e8602ff1aeb490ebfa42e6231603",
    "gt": "437626368d798f22d5a34c94d842f5b00461be4e6183a7804990f8c1aed9e3fc",
}

BASE_GROUP_IDS = {
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
GROUP_UNIVERSE = tuple(deletion.TARGET_GROUP_IDS)
REMOVABLE_GROUP_IDS = {
    branch: tuple(row for row in GROUP_UNIVERSE if row not in BASE_GROUP_IDS[branch])
    for branch in BRANCH_IDS
}
BASE_WITNESS_VALUES = {
    "lt": {
        "x_c002": "9/8",
        "Y_c002": "-3/8",
        "x_c004": "1",
        "Y_c004": "-1/2",
        "x_c005": "6/67",
        "Y_c005": "-16/67",
        "x_c006": "1",
        "Y_c006": "0",
        "x_c007": "0",
        "Y_c007": "1",
        "x_c008": "1",
        "Y_c008": "0",
        "x_c009": "0",
        "Y_c009": "1",
        "x_c010": "1",
        "Y_c010": "0",
        "x_c011": "0",
        "Y_c011": "1",
        "x_c012": "1",
        "Y_c012": "0",
    },
    "gt": {
        "x_c002": "3/4",
        "Y_c002": "-1/4",
        "x_c004": "2",
        "Y_c004": "0",
        "x_c005": "6/67",
        "Y_c005": "-16/67",
        "x_c006": "1",
        "Y_c006": "0",
        "x_c007": "1/97",
        "Y_c007": "56/97",
        "x_c008": "1",
        "Y_c008": "0",
        "x_c009": "0",
        "Y_c009": "1",
        "x_c010": "1",
        "Y_c010": "0",
        "x_c011": "0",
        "Y_c011": "1",
        "x_c012": "1",
        "Y_c012": "0",
    },
}

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
SYSTEM_SCHEMA = "p97-exactfive-profile0034-physical-block-deletion-system/v1"
DESCRIPTOR_SCHEMA = "p97-smt-source-semantic-descriptor/v1"
SOLVER_PROFILE_SCHEMA = "piqd-solver-profile/v1"
RESULT_SCHEMA = "p97-exactfive-profile0034-physical-block-deletion-result/v1"
ROUND_SCHEMA = "p97-exactfive-profile0034-physical-block-deletion-round/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-physical-block-deletion-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-physical-block-deletion-terminal/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
_FULL_COMMIT = re.compile(r"[0-9a-f]{40}")
_TOMBSTONE = re.compile(r"\.piqd-smt-tombstone-[0-9a-f]{32}")


class Profile0034PhysicalBlockDeletionError(RuntimeError):
    """The physical block-deletion lane failed closed."""


@dataclass(frozen=True)
class QuerySpec:
    key: str
    branch_id: str | None
    round_index: int
    probe_index: int
    current_group_ids: tuple[str, ...]
    deleted_block: tuple[str, ...]
    retained_group_ids: tuple[str, ...]
    current_sha256: str
    block_sha256: str


@dataclass(frozen=True)
class PreparedQuery:
    spec: QuerySpec
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery
    system_bytes: bytes
    source_metadata: tuple[dict[str, Any], ...]

    @property
    def key(self) -> str:
        return self.spec.key

    @property
    def assumption_labels(self) -> tuple[str, ...]:
        return ()


class SemanticVerdictCache:
    """Keep one exact verdict for one fully bound SAT payload per process."""

    def __init__(self) -> None:
        self._lock = threading.Lock()
        self._values: dict[str, dict[str, Any]] = {}
        self.calls = 0

    def _key(
        self, query: adapter.SourceSemanticQuery, solver: str, model: str, values: str
    ) -> str:
        return _sha(
            _canonical(
                {
                    "descriptor_sha256": _sha(query.descriptor_bytes),
                    "journal_sha256": _sha(query.journal_smt2),
                    "solver": solver,
                    "model_sha256": _sha(model.encode("utf-8")),
                    "values_sha256": _sha(values.encode("utf-8")),
                }
            )
        )

    def verify(
        self,
        query: adapter.SourceSemanticQuery,
        solver: str,
        model: str,
        values: str | None,
    ) -> adapter.SemanticVerification:
        if type(values) is not str:
            raise Profile0034PhysicalBlockDeletionError("SAT readback is absent")
        key = self._key(query, solver, model, values)
        with self._lock:
            cached = self._values.get(key)
        if cached is None:
            verdict = verify_sat_model(query, solver, model, values)
            frozen = {
                "accepted": verdict.accepted,
                "evidence": json.loads(_canonical(verdict.evidence)),
            }
            with self._lock:
                present = self._values.setdefault(key, frozen)
                if present != frozen:
                    raise Profile0034PhysicalBlockDeletionError(
                        "semantic verdict cache crossed"
                    )
                cached = present
                self.calls += 1
        return adapter.SemanticVerification(
            bool(cached["accepted"]), dict(cached["evidence"])
        )


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


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise Profile0034PhysicalBlockDeletionError(
            f"{where} is not strict JSON"
        ) from exc
    if type(value) is not dict or _json(value) != payload:
        raise Profile0034PhysicalBlockDeletionError(f"{where} is not canonical")
    return value


def _read(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise Profile0034PhysicalBlockDeletionError(
            f"missing custody file: {path}"
        ) from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise Profile0034PhysicalBlockDeletionError(f"unsafe custody file: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile0034PhysicalBlockDeletionError(f"custody file changed: {path}")
    return payload


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise Profile0034PhysicalBlockDeletionError(
            "manifest path escapes repository"
        ) from exc


def _source_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read(path)) for path in sorted(paths)}


def _git_read(arguments: Sequence[str], where: str) -> bytes:
    completed = subprocess.run(
        ["git", *arguments],
        cwd=REPOSITORY_ROOT,
        stdin=subprocess.DEVNULL,
        capture_output=True,
        check=False,
    )
    if completed.returncode != 0:
        raise Profile0034PhysicalBlockDeletionError(f"Git object is absent: {where}")
    return completed.stdout


def _record(
    path: Path, *, file_sha: str, self_field: str, self_sha: str, where: str
) -> dict[str, Any]:
    payload = _read(path)
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise Profile0034PhysicalBlockDeletionError(
            f"{where} is not strict JSON"
        ) from exc
    if type(value) is not dict:
        raise Profile0034PhysicalBlockDeletionError(f"{where} is not an object")
    if _sha(payload) != file_sha or value.get(self_field) != self_sha:
        raise Profile0034PhysicalBlockDeletionError(f"{where} digest drifted")
    if value.get(self_field) != _self_hash(value, self_field):
        raise Profile0034PhysicalBlockDeletionError(f"{where} self-hash drifted")
    return value


def _candidate_paths(branch: str) -> tuple[Path, Path, Path]:
    root = DELETION_ROOT / "artifacts" / f"candidate-{branch}-reduced"
    return root / "result.json", root / "system.json", root / "original.smt2"


_CANDIDATE_FILE_HASHES = {
    "lt": (
        "b9d2849a1d3a5da7aba1a249e7e48b59050dc3793eba8b6340ee2259dc0c8392",
        "2bc544d01c53adb2dddc2a4ef8a399ee3aeb185d26208069b557ce5ca09a2fd0",
        "96ca87981938e7e2009ba27b78dbb21d4430774c6ecdfc2d7e0e6c7b36bd3698",
    ),
    "gt": (
        "291b83137650a2ac56e77488104c7ff6f13a75ff7dcdcad5fe8fb5f05ff2b393",
        "2fb8d0a1e8101d7be3544cd860125d9c2ce0ba9cbc3b9f34cd0a088d96abbbab",
        "8e49b2ef6bd4afa6ec286e5f0bdd9d49ffa3dbfbeb773f0a8023389e772484be",
    ),
}
_GROUP_CORE_RESULT_FILES = {
    "z3-control-negative": "509174d039a0a99d033af1f67edd7dd2760c104fb866f587ce662973864c1181",
    "z3-control-positive": "0f9cf86a29585ff0ec557ebf83be454fd32081572180b608083b35d3e08014ad",
    "z3-target-mirror-radius-gt": "e55d1a38f20ca6aa53925b472c6671a5a1772476111607e27125b8137e5b82a4",
    "z3-target-mirror-radius-lt": "9a57a04c9092c7110aba0d228aa9d6ebf48ca5ade62dc1d1ed972963d2bada76",
}
_GROUP_CORE_SOURCE_FILES = {
    "gt": "76caeba1e6f8ffb79463d38a1ff64f67f6157b707739b093efc6842433e60108",
    "lt": "35e57904f7c698a6ce5f226949142fbc00e8a5cf8001ae6f033eab120b393a47",
}


def _witness_coordinates(
    source_system: Mapping[str, Any], branch: str
) -> dict[str, tuple[Fraction, Fraction]]:
    values = BASE_WITNESS_VALUES[branch]
    if set(values) != set(source_system["variables"]):
        raise Profile0034PhysicalBlockDeletionError("base witness is not total")
    coords = deletion.source.predecessor._frame_coordinates(source_system["order_id"])
    for class_id in deletion.source.FREE_CLASS_IDS:
        coords[class_id] = (
            Fraction(values[f"x_{class_id}"]),
            Fraction(values[f"Y_{class_id}"]),
        )
    return coords


def _base_system(branch: str, source_system: Mapping[str, Any]) -> dict[str, Any]:
    retained = BASE_GROUP_IDS[branch]
    return {
        "schema": deletion.SYSTEM_SCHEMA,
        "kind": "candidate",
        "key": f"base-{branch}",
        "branch_id": branch,
        "source_id": f"parent-z3-mirror-radius-{branch}",
        "source_system": dict(source_system),
        "source_system_sha256s": {branch: _sha(_canonical(source_system))},
        "retained_group_ids": list(retained),
        "omitted_group_ids": [row for row in GROUP_UNIVERSE if row not in retained],
        "decision_records": [],
        "claims": dict(FALSE_CLAIMS),
    }


def verify_base_witness(
    branch: str, source_system: Mapping[str, Any]
) -> dict[str, Any]:
    system = _base_system(branch, source_system)
    evidence = deletion._replay_target(
        system, _witness_coordinates(source_system, branch)
    )
    if evidence.get("accepted") is not True:
        raise Profile0034PhysicalBlockDeletionError("embedded base witness failed")
    return {
        "branch_id": branch,
        "values": dict(BASE_WITNESS_VALUES[branch]),
        "evidence": evidence,
        "witness_sha256": _sha(_canonical(BASE_WITNESS_VALUES[branch])),
    }


def authenticate_parent_runs() -> dict[str, Any]:
    """Authenticate both completed discovery runs and derive the frozen bases."""

    if _sha(_read(Path(deletion.__file__))) != DELETION_RECORD_HASHES["producer"]:
        raise Profile0034PhysicalBlockDeletionError("deletion producer bytes drifted")
    if _sha(_read(Path(group_core.__file__))) != GROUP_CORE_RECORD_HASHES["producer"]:
        raise Profile0034PhysicalBlockDeletionError("group-core producer bytes drifted")
    if _sha(_read(Path(adapter.__file__))) != ADAPTER_SHA256:
        raise Profile0034PhysicalBlockDeletionError("adapter bytes drifted")
    if _sha(_read(Path(deletion.source.__file__))) != SOURCE_SHA256:
        raise Profile0034PhysicalBlockDeletionError("source producer bytes drifted")
    deletion_manifest = _record(
        DELETION_MANIFEST_PATH,
        file_sha=DELETION_RECORD_HASHES["manifest_file"],
        self_field="manifest_sha256",
        self_sha=DELETION_RECORD_HASHES["manifest"],
        where="deletion manifest",
    )
    deletion_launch = _record(
        DELETION_LAUNCH_PATH,
        file_sha=DELETION_RECORD_HASHES["launch_file"],
        self_field="launch_sha256",
        self_sha=DELETION_RECORD_HASHES["launch"],
        where="deletion launch",
    )
    deletion_terminal = _record(
        DELETION_TERMINAL_PATH,
        file_sha=DELETION_RECORD_HASHES["terminal_file"],
        self_field="terminal_sha256",
        self_sha=DELETION_RECORD_HASHES["terminal"],
        where="deletion terminal",
    )
    core_manifest = _record(
        GROUP_CORE_MANIFEST_PATH,
        file_sha=GROUP_CORE_RECORD_HASHES["manifest_file"],
        self_field="manifest_sha256",
        self_sha=GROUP_CORE_RECORD_HASHES["manifest"],
        where="group-core manifest",
    )
    core_launch = _record(
        GROUP_CORE_LAUNCH_PATH,
        file_sha=GROUP_CORE_RECORD_HASHES["launch_file"],
        self_field="launch_sha256",
        self_sha=GROUP_CORE_RECORD_HASHES["launch"],
        where="group-core launch",
    )
    core_terminal = _record(
        GROUP_CORE_TERMINAL_PATH,
        file_sha=GROUP_CORE_RECORD_HASHES["terminal_file"],
        self_field="terminal_sha256",
        self_sha=GROUP_CORE_RECORD_HASHES["terminal"],
        where="group-core terminal",
    )
    source_parent_terminal = _record(
        SOURCE_PARENT_TERMINAL_PATH,
        file_sha=SOURCE_PARENT_TERMINAL_FILE_SHA256,
        self_field="terminal_sha256",
        self_sha=SOURCE_PARENT_TERMINAL_SHA256,
        where="source parent terminal",
    )
    try:
        deletion_commit = deletion.authenticate_recorded_execution_commit(
            deletion_manifest, deletion_launch
        )
        core_commit = group_core.authenticate_recorded_execution_commit(
            core_manifest, core_launch
        )
        deletion_custody = group_core.authenticate_parent_run()
    except Exception as exc:
        raise Profile0034PhysicalBlockDeletionError(
            "parent execution authentication failed"
        ) from exc
    if (
        deletion_commit != DELETION_RECORD_HASHES["execution_commit"]
        or core_commit != GROUP_CORE_RECORD_HASHES["execution_commit"]
        or deletion_terminal.get("status") != "UNGUARDED_DELETION_CAMPAIGN_COMPLETE"
        or deletion_terminal.get("query_count") != 55
        or core_terminal.get("status") != "COMPLETED"
        or core_terminal.get("disposition_counts")
        != {"SAT_REPLAYED": 1, "UNKNOWN": 2, "UNSAT_GROUP_CORE": 1}
        or deletion_terminal.get("claims") != FALSE_CLAIMS
        or core_terminal.get("claims") != FALSE_CLAIMS
    ):
        raise Profile0034PhysicalBlockDeletionError("parent status drifted")
    for key, expected_file_sha256 in _GROUP_CORE_RESULT_FILES.items():
        payload = _read(GROUP_CORE_ROOT / "artifacts" / key / "result.json")
        result = _strict(payload, f"group-core result {key}")
        expected_raw = (
            "SAT"
            if key.endswith("positive")
            else ("UNSAT" if key.endswith("negative") else "UNKNOWN")
        )
        if (
            _sha(payload) != expected_file_sha256
            or result.get("result_sha256") != _self_hash(result, "result_sha256")
            or result.get("engine", {}).get("raw_status") != expected_raw
        ):
            raise Profile0034PhysicalBlockDeletionError("group-core result drifted")
    sources = deletion_custody.get("source_systems")
    if type(sources) is not dict:
        raise Profile0034PhysicalBlockDeletionError("parent sources are absent")
    base_systems: dict[str, dict[str, Any]] = {}
    witnesses: dict[str, dict[str, Any]] = {}
    for branch in BRANCH_IDS:
        source_id = f"parent-z3-mirror-radius-{branch}"
        source_system = sources.get(source_id)
        if type(source_system) is not dict:
            raise Profile0034PhysicalBlockDeletionError("branch source is absent")
        source_key = f"parent-z3-mirror-radius-{branch}"
        source_directory = SOURCE_PARENT_ROOT / "artifacts" / source_key
        source_result_payload = _read(source_directory / "result.json")
        source_result = _strict(source_result_payload, f"{branch} source result")
        terminal_row = source_parent_terminal.get("results", {}).get(source_key)
        z3_rows = [
            row
            for row in source_result.get("engines", ())
            if type(row) is dict and row.get("solver") == SOLVER
        ]
        source_journal = _read(source_directory / "journal.smt2")
        if (
            _sha(source_result_payload) != SOURCE_PARENT_RESULT_FILES[branch]
            or type(terminal_row) is not dict
            or terminal_row.get("result_sha256") != SOURCE_PARENT_RESULT_FILES[branch]
            or len(z3_rows) != 1
            or z3_rows[0].get("raw_status") != "UNSAT"
            or z3_rows[0].get("effective_status") != "UNSAT_DISCOVERY_ONLY"
            or _sha(source_journal) != SOURCE_PARENT_JOURNAL_FILES[branch]
            or source_journal
            != _journal(deletion.source._build_smt_commands_current(source_system))
        ):
            raise Profile0034PhysicalBlockDeletionError("source UNSAT custody drifted")
        ledger = deletion.assertion_group_ledger(source_system)
        if tuple(row["group_id"] for row in ledger) != GROUP_UNIVERSE:
            raise Profile0034PhysicalBlockDeletionError("source ledger drifted")
        strict = ledger[-1]
        expected_strict = source_system["source_strict"]
        if strict["group_id"] != deletion.STRICT_GROUP_ID or strict[
            "source_commands"
        ] != [f"(assert (< {expected_strict['left']} {expected_strict['right']}))"]:
            raise Profile0034PhysicalBlockDeletionError(
                "source-strict direction drifted"
            )
        candidate_result_path, candidate_system_path, candidate_journal_path = (
            _candidate_paths(branch)
        )
        expected_result, expected_system, expected_journal = _CANDIDATE_FILE_HASHES[
            branch
        ]
        candidate_result_payload = _read(candidate_result_path)
        candidate_system_payload = _read(candidate_system_path)
        candidate_journal = _read(candidate_journal_path)
        candidate_result = _strict(
            candidate_result_payload, f"{branch} candidate result"
        )
        candidate_system = _strict(
            candidate_system_payload, f"{branch} candidate system"
        )
        if (
            _sha(candidate_result_payload) != expected_result
            or _sha(candidate_system_payload) != expected_system
            or _sha(candidate_journal) != expected_journal
            or candidate_result.get("result_sha256")
            != _self_hash(candidate_result, "result_sha256")
            or candidate_result.get("engine", {}).get("raw_status") != "SAT"
            or candidate_result.get("engine", {}).get("effective_status")
            != "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
            or tuple(candidate_system.get("retained_group_ids", ()))
            != BASE_GROUP_IDS[branch]
            or tuple(candidate_system.get("omitted_group_ids", ()))
            != REMOVABLE_GROUP_IDS[branch]
            or candidate_system.get("source_system") != source_system
            or deletion._journal(deletion.build_smt_commands(candidate_system))
            != candidate_journal
        ):
            raise Profile0034PhysicalBlockDeletionError("reduced base custody drifted")
        target_key = f"z3-target-mirror-radius-{branch}"
        target_result_payload = _read(
            GROUP_CORE_ROOT / "artifacts" / target_key / "result.json"
        )
        target_result = _strict(target_result_payload, f"{branch} group-core result")
        target_system = _strict(
            _read(GROUP_CORE_ROOT / "artifacts" / target_key / "source-record.json"),
            f"{branch} group-core system",
        )
        if (
            _sha(target_result_payload) != _GROUP_CORE_RESULT_FILES[target_key]
            or target_result.get("result_sha256")
            != _self_hash(target_result, "result_sha256")
            or _sha(
                _read(GROUP_CORE_ROOT / "artifacts" / target_key / "source-record.json")
            )
            != _GROUP_CORE_SOURCE_FILES[branch]
            or target_result.get("engine", {}).get("raw_status") != "UNKNOWN"
            or tuple(target_system.get("assumption_group_ids", ()))
            != BASE_GROUP_IDS[branch]
            or group_core.reconstruct_unguarded_commands(target_system)
            != tuple(deletion.source._build_smt_commands_current(source_system))
        ):
            raise Profile0034PhysicalBlockDeletionError("group-core target drifted")
        base_systems[branch] = candidate_system
        witnesses[branch] = verify_base_witness(branch, source_system)
    record = {
        "schema": "p97-exactfive-profile0034-physical-block-parent-custody/v1",
        "deletion": dict(DELETION_RECORD_HASHES),
        "group_core": dict(GROUP_CORE_RECORD_HASHES),
        "source_parent_terminal_sha256": SOURCE_PARENT_TERMINAL_SHA256,
        "source_parent_result_file_sha256s": dict(SOURCE_PARENT_RESULT_FILES),
        "source_parent_journal_file_sha256s": dict(SOURCE_PARENT_JOURNAL_FILES),
        "deletion_parent_custody_sha256": deletion_custody["parent_custody_sha256"],
        "source_systems": {
            branch: base_systems[branch]["source_system"] for branch in BRANCH_IDS
        },
        "base_system_sha256s": {
            branch: _sha(_canonical(base_systems[branch])) for branch in BRANCH_IDS
        },
        "base_witnesses": witnesses,
        "claims": dict(FALSE_CLAIMS),
    }
    record["parent_custody_sha256"] = _self_hash(record, "parent_custody_sha256")
    return record


def canonical_group_ids(group_ids: Sequence[str]) -> tuple[str, ...]:
    """Require a duplicate-free subsequence in the frozen source order."""

    supplied = tuple(group_ids)
    if len(supplied) != len(set(supplied)) or not set(supplied) <= set(GROUP_UNIVERSE):
        raise Profile0034PhysicalBlockDeletionError("group list is not a subset")
    ordered = tuple(group_id for group_id in GROUP_UNIVERSE if group_id in supplied)
    if supplied != ordered:
        raise Profile0034PhysicalBlockDeletionError("group list order drifted")
    return ordered


def stable_partition(
    items: Sequence[str], granularity: int
) -> tuple[tuple[str, ...], ...]:
    """Split a canonical sequence into stable near-equal nonempty blocks."""

    values = tuple(items)
    if not values or type(granularity) is not int or granularity < 1:
        raise Profile0034PhysicalBlockDeletionError("partition request is malformed")
    count = min(granularity, len(values))
    width, surplus = divmod(len(values), count)
    blocks: list[tuple[str, ...]] = []
    cursor = 0
    for index in range(count):
        size = width + (1 if index < surplus else 0)
        blocks.append(values[cursor : cursor + size])
        cursor += size
    if tuple(item for block in blocks for item in block) != values:
        raise Profile0034PhysicalBlockDeletionError("partition reconstruction failed")
    return tuple(blocks)


def _group_sha256(group_ids: Sequence[str]) -> str:
    return _sha(_canonical(list(group_ids)))


def anchor_spec(branch: str) -> QuerySpec:
    if branch not in BRANCH_IDS:
        raise Profile0034PhysicalBlockDeletionError("branch is invalid")
    current = GROUP_UNIVERSE
    current_sha256 = _group_sha256(current)
    block_sha256 = _group_sha256(())
    return QuerySpec(
        key=f"z3-{branch}-anchor-{current_sha256[:16]}",
        branch_id=branch,
        round_index=0,
        probe_index=0,
        current_group_ids=current,
        deleted_block=(),
        retained_group_ids=current,
        current_sha256=current_sha256,
        block_sha256=block_sha256,
    )


def candidate_specs(
    branch: str,
    round_index: int,
    current_group_ids: Sequence[str],
    granularity: int,
) -> tuple[QuerySpec, ...]:
    """Build one unchanged-current physical-deletion batch."""

    if branch not in BRANCH_IDS or type(round_index) is not int or round_index < 1:
        raise Profile0034PhysicalBlockDeletionError(
            "candidate batch identity is invalid"
        )
    current = canonical_group_ids(current_group_ids)
    base = BASE_GROUP_IDS[branch]
    if not set(base) <= set(current):
        raise Profile0034PhysicalBlockDeletionError("candidate current lost its base")
    removable = tuple(group_id for group_id in current if group_id not in base)
    blocks = stable_partition(removable, granularity)
    current_sha256 = _group_sha256(current)
    specs: list[QuerySpec] = []
    for probe_index, block in enumerate(blocks):
        retained = tuple(group_id for group_id in current if group_id not in block)
        block_sha256 = _group_sha256(block)
        key = (
            f"z3-{branch}-r{round_index:03d}-{current_sha256[:16]}-"
            f"drop-{block_sha256[:16]}"
        )
        specs.append(
            QuerySpec(
                key=key,
                branch_id=branch,
                round_index=round_index,
                probe_index=probe_index,
                current_group_ids=current,
                deleted_block=block,
                retained_group_ids=retained,
                current_sha256=current_sha256,
                block_sha256=block_sha256,
            )
        )
    if len({spec.key for spec in specs}) != len(specs):
        raise Profile0034PhysicalBlockDeletionError("candidate keys collided")
    return tuple(specs)


def control_spec(key: str) -> QuerySpec:
    if key not in CONTROL_KEYS:
        raise Profile0034PhysicalBlockDeletionError("control key is invalid")
    return QuerySpec(key, None, -1, 0, (), (), (), _group_sha256(()), _group_sha256(()))


def _control_source(key: str) -> dict[str, Any]:
    control = "positive" if key.endswith("positive") else "negative"
    return deletion.source.predecessor.build_control_system(control)


def build_system(spec: QuerySpec, parent: Mapping[str, Any]) -> dict[str, Any]:
    validate_query_spec(spec)
    if spec.branch_id is None:
        source_system = _control_source(spec.key)
        return {
            "schema": SYSTEM_SCHEMA,
            "kind": "control",
            "key": spec.key,
            "source_system": source_system,
            "retained_group_ids": [],
            "omitted_group_ids": [],
            "query_spec": query_spec_record(spec),
            "claims": dict(FALSE_CLAIMS),
        }
    branch = spec.branch_id
    sources = parent.get("source_systems")
    if type(sources) is not dict or type(sources.get(branch)) is not dict:
        raise Profile0034PhysicalBlockDeletionError("authenticated source is absent")
    current = canonical_group_ids(spec.current_group_ids)
    retained = canonical_group_ids(spec.retained_group_ids)
    block = canonical_group_ids(spec.deleted_block)
    if (
        spec.current_sha256 != _group_sha256(current)
        or spec.block_sha256 != _group_sha256(block)
        or set(retained) != set(current) - set(block)
        or set(block) & set(BASE_GROUP_IDS[branch])
        or not set(BASE_GROUP_IDS[branch]) <= set(retained)
    ):
        raise Profile0034PhysicalBlockDeletionError("query specification drifted")
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "key": spec.key,
        "branch_id": branch,
        "source_id": f"parent-z3-mirror-radius-{branch}",
        "source_system": dict(sources[branch]),
        "retained_group_ids": list(retained),
        "omitted_group_ids": [row for row in GROUP_UNIVERSE if row not in retained],
        "query_spec": query_spec_record(spec),
        "parent_custody_sha256": parent["parent_custody_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }


def query_spec_record(spec: QuerySpec) -> dict[str, Any]:
    return {
        "key": spec.key,
        "branch_id": spec.branch_id,
        "round_index": spec.round_index,
        "probe_index": spec.probe_index,
        "current_group_ids": list(spec.current_group_ids),
        "deleted_block": list(spec.deleted_block),
        "retained_group_ids": list(spec.retained_group_ids),
        "current_sha256": spec.current_sha256,
        "block_sha256": spec.block_sha256,
    }


def validate_query_spec(spec: QuerySpec) -> QuerySpec:
    if (
        type(spec) is not QuerySpec
        or type(spec.key) is not str
        or type(spec.round_index) is not int
        or type(spec.round_index) is bool
        or type(spec.probe_index) is not int
        or type(spec.probe_index) is bool
    ):
        raise Profile0034PhysicalBlockDeletionError("query specification is malformed")
    if spec.branch_id is None:
        if spec != control_spec(spec.key):
            raise Profile0034PhysicalBlockDeletionError("control specification drifted")
        return spec
    if spec.branch_id not in BRANCH_IDS or spec.probe_index < 0:
        raise Profile0034PhysicalBlockDeletionError("target specification drifted")
    current = canonical_group_ids(spec.current_group_ids)
    block = canonical_group_ids(spec.deleted_block)
    retained = canonical_group_ids(spec.retained_group_ids)
    if (
        spec.current_sha256 != _group_sha256(current)
        or spec.block_sha256 != _group_sha256(block)
        or set(retained) != set(current) - set(block)
        or set(block) & set(BASE_GROUP_IDS[spec.branch_id])
        or not set(BASE_GROUP_IDS[spec.branch_id]) <= set(retained)
    ):
        raise Profile0034PhysicalBlockDeletionError("query specification drifted")
    if spec.round_index == 0:
        if spec != anchor_spec(spec.branch_id):
            raise Profile0034PhysicalBlockDeletionError("anchor specification drifted")
        return spec
    expected_key = (
        f"z3-{spec.branch_id}-r{spec.round_index:03d}-{spec.current_sha256[:16]}-"
        f"drop-{spec.block_sha256[:16]}"
    )
    if spec.round_index < 1 or not block or spec.key != expected_key:
        raise Profile0034PhysicalBlockDeletionError("dynamic query key drifted")
    return spec


def query_spec_from_record(record: object) -> QuerySpec:
    if type(record) is not dict or set(record) != {
        "key",
        "branch_id",
        "round_index",
        "probe_index",
        "current_group_ids",
        "deleted_block",
        "retained_group_ids",
        "current_sha256",
        "block_sha256",
    }:
        raise Profile0034PhysicalBlockDeletionError(
            "recorded query specification drifted"
        )
    try:
        spec = QuerySpec(
            key=record["key"],
            branch_id=record["branch_id"],
            round_index=record["round_index"],
            probe_index=record["probe_index"],
            current_group_ids=tuple(record["current_group_ids"]),
            deleted_block=tuple(record["deleted_block"]),
            retained_group_ids=tuple(record["retained_group_ids"]),
            current_sha256=record["current_sha256"],
            block_sha256=record["block_sha256"],
        )
    except (KeyError, TypeError) as exc:
        raise Profile0034PhysicalBlockDeletionError(
            "query specification is malformed"
        ) from exc
    return validate_query_spec(spec)


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    if (
        type(system) is not dict
        or system.get("schema") != SYSTEM_SCHEMA
        or system.get("claims") != FALSE_CLAIMS
    ):
        raise Profile0034PhysicalBlockDeletionError("system is malformed")
    if system.get("kind") == "control":
        return tuple(
            deletion.source._build_smt_commands_current(system["source_system"])
        )
    if system.get("kind") != "target":
        raise Profile0034PhysicalBlockDeletionError("system kind is invalid")
    retained = canonical_group_ids(system["retained_group_ids"])
    return tuple(deletion._commands_for_groups(system["source_system"], retained))


def _journal(commands: Sequence[str]) -> bytes:
    return b"".join(command.encode("ascii") + b"\n" for command in commands)


def _manifest_sources() -> list[Path]:
    paths = [
        Path(__file__),
        TEST_PATH,
        SPEC_PATH,
        RUNNER_PATH,
        CHECKPOINT_PATH,
        Path(deletion.__file__),
        Path(group_core.__file__),
        Path(adapter.__file__),
        Path(deletion.source.__file__),
        Path(deletion.source.predecessor.__file__),
        Path(deletion.source.bo_source.__file__),
    ]
    return sorted(set(paths))


def _manifest_inputs() -> list[Path]:
    paths = [
        DELETION_MANIFEST_PATH,
        DELETION_LAUNCH_PATH,
        DELETION_TERMINAL_PATH,
        GROUP_CORE_MANIFEST_PATH,
        GROUP_CORE_LAUNCH_PATH,
        GROUP_CORE_TERMINAL_PATH,
        SOURCE_PARENT_TERMINAL_PATH,
    ]
    for branch in BRANCH_IDS:
        paths.extend(_candidate_paths(branch))
        target = GROUP_CORE_ROOT / "artifacts" / f"z3-target-mirror-radius-{branch}"
        paths.extend((target / "result.json", target / "source-record.json"))
        source_target = (
            SOURCE_PARENT_ROOT / "artifacts" / f"parent-z3-mirror-radius-{branch}"
        )
        paths.extend((source_target / "result.json", source_target / "journal.smt2"))
    for key in CONTROL_KEYS:
        paths.append(GROUP_CORE_ROOT / "artifacts" / key / "result.json")
    return sorted(set(paths))


def _source_snapshots(
    parent: Mapping[str, Any], system: Mapping[str, Any]
) -> tuple[adapter.SourceSnapshot, ...]:
    snapshots = [
        adapter.SourceSnapshot("0000-parent-custody.json", _json(parent)),
        adapter.SourceSnapshot("0001-physical-system.json", _json(system)),
    ]
    for index, path in enumerate(_manifest_sources()):
        name = _repo_path(path).replace("/", "--")
        snapshots.append(
            adapter.SourceSnapshot(f"source-{index:02d}-{name}", _read(path))
        )
    for index, path in enumerate(_manifest_inputs()):
        name = _repo_path(path).replace("/", "--")
        snapshots.append(
            adapter.SourceSnapshot(f"input-{index:02d}-{name}", _read(path))
        )
    names = [snapshot.path for snapshot in snapshots]
    if len(names) != len(set(names)):
        raise Profile0034PhysicalBlockDeletionError("source snapshot names collided")
    return tuple(sorted(snapshots, key=lambda item: item.path))


def prepare_query(
    spec: QuerySpec,
    *,
    parent: Mapping[str, Any] | None = None,
    timeout_ms: int = TIMEOUT_MS,
) -> PreparedQuery:
    if timeout_ms != TIMEOUT_MS:
        raise Profile0034PhysicalBlockDeletionError("timeout must be 60000ms")
    parent_record = dict(parent or authenticate_parent_runs())
    if parent_record.get("parent_custody_sha256") != _self_hash(
        parent_record, "parent_custody_sha256"
    ):
        raise Profile0034PhysicalBlockDeletionError("parent custody is not self-hashed")
    system = build_system(spec, parent_record)
    commands = build_smt_commands(system)
    journal = _journal(commands)
    try:
        normalized, normalized_journal = adapter.normalize_state_journal(journal)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034PhysicalBlockDeletionError(
            "journal normalization failed"
        ) from exc
    if normalized != commands or normalized_journal != journal:
        raise Profile0034PhysicalBlockDeletionError("journal normalization drifted")
    text = journal.decode("ascii")
    if "(=>" in text or " Bool" in text:
        raise Profile0034PhysicalBlockDeletionError(
            "query contains a guarded assertion"
        )
    if spec.branch_id is not None and spec.round_index == 0:
        source_commands = tuple(
            deletion.source._build_smt_commands_current(system["source_system"])
        )
        if commands != source_commands or spec.retained_group_ids != GROUP_UNIVERSE:
            raise Profile0034PhysicalBlockDeletionError(
                "anchor is not the full parent journal"
            )
    source_system = system["source_system"]
    variables = sorted(
        (
            {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
            for variable in source_system["variables"]
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
    snapshots = _source_snapshots(parent_record, system)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {
            "id": "p97-profile0034-physical-block-deletion-piqd",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "profile0034-physical-retained-exact-rational-replay",
            "version": "v1",
        },
        "stage_id": "exactfive-profile0034-physical-block-deletion",
        "query_id": spec.key,
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
    metadata = tuple(
        {"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)}
        for item in snapshots
    )
    return PreparedQuery(spec, system, query, _json(system), metadata)


def _replay_system(system: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": deletion.SYSTEM_SCHEMA,
        "kind": "candidate",
        "key": system["key"],
        "branch_id": system["branch_id"],
        "source_id": system["source_id"],
        "source_system": system["source_system"],
        "source_system_sha256s": {
            system["branch_id"]: _sha(_canonical(system["source_system"]))
        },
        "retained_group_ids": system["retained_group_ids"],
        "omitted_group_ids": system["omitted_group_ids"],
        "decision_records": [],
        "claims": dict(FALSE_CLAIMS),
    }


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    if solver != SOLVER or type(model) is not str or type(values) is not str:
        raise Profile0034PhysicalBlockDeletionError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise Profile0034PhysicalBlockDeletionError("semantic input is malformed")
    system = semantic.get("system")
    if type(system) is not dict or build_smt_commands(system) != query.journal_commands:
        raise Profile0034PhysicalBlockDeletionError("SAT replay journal drifted")
    if (
        query.descriptor_bytes != _json(query.descriptor)
        or query.original_smt2 != _journal(query.journal_commands)
        or query.journal_smt2 != query.original_smt2
        or query.descriptor.get("named_atoms") != []
        or query.descriptor.get("solve", {}).get("assumption_ids") != []
        or semantic.get("journal_sha256") != _sha(query.journal_smt2)
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise Profile0034PhysicalBlockDeletionError("SAT descriptor custody drifted")
    try:
        if system["kind"] == "control":
            parsed = deletion.source._parse_control_value(values)
            accepted = system["source_system"]["control"] == "positive" and parsed == {
                "t": Fraction(1)
            }
            evidence: dict[str, Any] = {
                "accepted": accepted,
                "control": system["source_system"]["control"],
                "values": {key: str(value) for key, value in parsed.items()},
            }
        else:
            source_system = system["source_system"]
            coords = deletion.source._parse_coordinates(
                values, query.get_values, source_system["order_id"]
            )
            evidence = deletion._replay_target(_replay_system(system), coords)
            evidence["exact_coordinate_count"] = len(coords)
            evidence["free_coordinate_count"] = len(query.get_values)
    except Exception as exc:
        allowed = (
            deletion.source.Profile0034SupportingEdgeError,
            deletion.Profile0034SupportingEdgeUnguardedDeletionError,
            ValueError,
            KeyError,
        )
        if not isinstance(exc, allowed):
            raise
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


def classify_result(result: object) -> str:
    if type(result) is not dict or type(result.get("engine")) is not dict:
        return "MALFORMED"
    effective = result["engine"].get("effective_status")
    return {
        "SAT_SEMANTICALLY_REPLAYED": "SAT_REPLAYED",
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED": "SAT_REPLAY_UNRESOLVED",
        "UNSAT_DISCOVERY_ONLY": "UNSAT_CUSTODY_VALID",
        "INCONCLUSIVE_UNKNOWN": "UNKNOWN",
        "INCONCLUSIVE_TRANSPORT_LOSS": "TRANSPORT_LOST",
    }.get(effective, "MALFORMED")


def _query_request_id(prepared: PreparedQuery | str) -> str:
    key = prepared if type(prepared) is str else prepared.key
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


def _session_label(prepared: PreparedQuery) -> tuple[str, str]:
    profile_sha256 = _sha(_canonical(prepared.query.descriptor["solver_profile"]))
    label = (
        f"p97-smt-source/{prepared.key}/{SOLVER}/"
        f"{prepared.query.descriptor['semantic_sha256'][:12]}/"
        f"{_query_request_id(prepared)}/{profile_sha256[:12]}"
    )
    return label, profile_sha256


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise Profile0034PhysicalBlockDeletionError("artifact record is malformed")
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen:
        raise Profile0034PhysicalBlockDeletionError("artifact path is unsafe")
    payload = _read(root / name)
    if record["bytes"] != len(payload) or record["sha256"] != _sha(payload):
        raise Profile0034PhysicalBlockDeletionError("artifact digest drifted")
    seen.add(name)
    return payload


def _read_fd_artifact(directory_fd: int, name: str) -> bytes:
    descriptor = os.open(
        name, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0), dir_fd=directory_fd
    )
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise Profile0034PhysicalBlockDeletionError("staged artifact is unsafe")
        chunks: list[bytes] = []
        while True:
            chunk = os.read(descriptor, 65536)
            if not chunk:
                break
            chunks.append(chunk)
        payload = b"".join(chunks)
        if len(payload) != info.st_size:
            raise Profile0034PhysicalBlockDeletionError("staged artifact changed")
        return payload
    finally:
        os.close(descriptor)


def _validate_transport_artifacts(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
) -> tuple[dict[str, Any], dict[str, Any] | None]:
    label, profile_sha256 = _session_label(prepared)
    request_id = _query_request_id(prepared)
    request_sha256 = adapter.piqd_solve_request_digest(prepared.query, ())
    expected_create = {
        "schema": "piqd-smt-session-create-request/v1",
        "request": {"solver": SOLVER, "lane": "smt", "label": label},
        "request_id": request_id,
        "session_label": label,
        "solver_profile": prepared.query.descriptor["solver_profile"],
        "solver_profile_sha256": profile_sha256,
    }
    if (
        _strict(payloads["session_create_request"], "session create request")
        != expected_create
    ):
        raise Profile0034PhysicalBlockDeletionError("session create request drifted")
    if (
        payloads["pre_append_smt2"] != b""
        or payloads["expected_post_append_smt2"] != prepared.query.journal_smt2
    ):
        raise Profile0034PhysicalBlockDeletionError("journal frontier bytes drifted")
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
        raise Profile0034PhysicalBlockDeletionError("journal frontier record drifted")
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
        raise Profile0034PhysicalBlockDeletionError("solve request drifted")
    try:
        session = adapter._validate_session(
            _strict(payloads["session"], "session"),
            solver=SOLVER,
            label=label,
            expected_state="live",
        )
        adapter._validate_fresh_session(session)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034PhysicalBlockDeletionError(
            "fresh session custody failed"
        ) from exc
    if payloads["smt2"] != prepared.query.journal_smt2:
        raise Profile0034PhysicalBlockDeletionError("exported journal drifted")
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
            raise Profile0034PhysicalBlockDeletionError("solve custody failed") from exc
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
        raise Profile0034PhysicalBlockDeletionError("receipt custody failed") from exc
    if prior is not None:
        raise Profile0034PhysicalBlockDeletionError("fresh session has a prior receipt")
    try:
        lifecycle = adapter._validate_session_lifecycle(
            _strict(payloads["session_lifecycle"], "session lifecycle")
        )
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034PhysicalBlockDeletionError("session lifecycle failed") from exc
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
        raise Profile0034PhysicalBlockDeletionError("session lifecycle drifted")
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
        raise Profile0034PhysicalBlockDeletionError(
            "session close custody failed"
        ) from exc
    return session, receipt


def _expected_semantic(
    prepared: PreparedQuery, solve: Mapping[str, Any], cache: SemanticVerdictCache
) -> dict[str, Any]:
    verification = cache.verify(
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
    cache: SemanticVerdictCache,
) -> str:
    if type(engine) is not dict or set(engine) != deletion._ENGINE_KEYS:
        raise Profile0034PhysicalBlockDeletionError("engine key set drifted")
    raw = engine["raw_status"]
    if raw not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise Profile0034PhysicalBlockDeletionError("engine status is unsupported")
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
        expected_artifacts.add(
            "reconciled_solve" if engine["response_lost"] else "solve"
        )
    if raw == "SAT":
        expected_artifacts.add("semantic")
    if "reconciliation_session" in payloads:
        if engine["response_lost"] is not True or raw is None:
            raise Profile0034PhysicalBlockDeletionError(
                "reconciliation artifact is invalid"
            )
        expected_artifacts.add("reconciliation_session")
    if set(payloads) != expected_artifacts:
        raise Profile0034PhysicalBlockDeletionError("engine artifact inventory drifted")
    session, receipt = _validate_transport_artifacts(prepared, engine, payloads)
    request_id = _query_request_id(prepared)
    request_sha256 = adapter.piqd_solve_request_digest(prepared.query, ())
    lifecycle = engine["session_lifecycle"]
    if (
        engine["solver"] != SOLVER
        or engine["session_id"] != session["id"]
        or engine["solver_signature"] != session["solver_signature"]
        or engine["solver_sha256"] != session["solver_sha256"]
        or engine["request_id"] != request_id
        or engine["request_sha256"] != request_sha256
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
        raise Profile0034PhysicalBlockDeletionError("engine identity drifted")
    solve: dict[str, Any] | None = None
    if raw is not None:
        label = "reconciled_solve" if engine["response_lost"] else "solve"
        solve = _strict(payloads[label], "solve")
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
            raise Profile0034PhysicalBlockDeletionError("solve digest drifted")
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
        raise Profile0034PhysicalBlockDeletionError("transport loss custody drifted")
    if raw == "SAT":
        if solve is None:
            raise Profile0034PhysicalBlockDeletionError("SAT solve is absent")
        semantic = engine["semantic_replay"]
        if (
            "semantic" not in payloads
            or _strict(payloads["semantic"], "semantic replay") != semantic
            or semantic != _expected_semantic(prepared, solve, cache)
            or engine["effective_status"]
            not in {
                "SAT_SEMANTICALLY_REPLAYED",
                "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
            }
            or (engine["effective_status"] == "SAT_SEMANTICALLY_REPLAYED")
            is not (semantic.get("accepted") is True)
        ):
            raise Profile0034PhysicalBlockDeletionError("SAT replay drifted")
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
            raise Profile0034PhysicalBlockDeletionError("UNSAT provenance drifted")
    elif raw == "UNKNOWN":
        if (
            engine["effective_status"] != "INCONCLUSIVE_UNKNOWN"
            or engine["semantic_replay"] is not None
            or engine["unsat_assumptions"] is not None
        ):
            raise Profile0034PhysicalBlockDeletionError("UNKNOWN custody drifted")
    disposition = classify_result({"engine": dict(engine)})
    if prepared.spec.branch_id is None:
        expected = (
            "SAT_REPLAYED"
            if prepared.key.endswith("positive")
            else "UNSAT_CUSTODY_VALID"
        )
        if disposition != expected:
            raise Profile0034PhysicalBlockDeletionError("transport control failed")
    return disposition


def _result_record(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    custody: Mapping[str, Any],
) -> dict[str, Any]:
    result = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": SOLVER,
        "query_spec": query_spec_record(prepared.spec),
        "system_sha256": _sha(prepared.system_bytes),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "retained_group_ids": list(prepared.spec.retained_group_ids),
        "omitted_group_ids": (
            [
                row
                for row in GROUP_UNIVERSE
                if row not in prepared.spec.retained_group_ids
            ]
            if prepared.spec.branch_id is not None
            else []
        ),
        "disposition": classify_result({"engine": dict(engine)}),
        "engine": dict(engine),
        "custody": dict(custody),
        "claims": dict(FALSE_CLAIMS),
    }
    result["result_sha256"] = _self_hash(result, "result_sha256")
    return result


def verify_query_tree(
    prepared: PreparedQuery,
    output: Path,
    cache: SemanticVerdictCache | None = None,
) -> dict[str, Any]:
    verdict_cache = cache or SemanticVerdictCache()
    if output.is_symlink() or not output.is_dir():
        raise Profile0034PhysicalBlockDeletionError("query output directory is unsafe")
    result = _strict(_read(output / "result.json"), "query result")
    if (
        set(result)
        != {
            "schema",
            "key",
            "solver",
            "query_spec",
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
        or result.get("query_spec") != query_spec_record(prepared.spec)
        or result.get("system_sha256") != _sha(prepared.system_bytes)
        or result.get("journal_sha256") != _sha(prepared.query.journal_smt2)
        or result.get("retained_group_ids") != list(prepared.spec.retained_group_ids)
        or result.get("claims") != FALSE_CLAIMS
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
    ):
        raise Profile0034PhysicalBlockDeletionError("query result identity drifted")
    custody = result["custody"]
    if type(custody) is not dict or set(custody) != {
        "system",
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "sources",
    }:
        raise Profile0034PhysicalBlockDeletionError("query custody inventory drifted")
    seen = {"result.json"}
    if _verify_artifact(output, custody["system"], seen) != prepared.system_bytes:
        raise Profile0034PhysicalBlockDeletionError("system artifact drifted")
    if (
        _verify_artifact(output, custody["descriptor"], seen)
        != prepared.query.descriptor_bytes
        or _verify_artifact(output, custody["original_smt2"], seen)
        != prepared.query.original_smt2
        or _verify_artifact(output, custody["journal_smt2"], seen)
        != prepared.query.journal_smt2
    ):
        raise Profile0034PhysicalBlockDeletionError("query bytes drifted")
    sources = custody["sources"]
    if type(sources) is not list or len(sources) != len(prepared.query.source_files):
        raise Profile0034PhysicalBlockDeletionError("source inventory drifted")
    for index, (record, snapshot) in enumerate(
        zip(sources, prepared.query.source_files, strict=True)
    ):
        expected_name = f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin"
        if record.get("path") != expected_name:
            raise Profile0034PhysicalBlockDeletionError("source artifact name drifted")
        if _verify_artifact(output, record, seen) != snapshot.payload:
            raise Profile0034PhysicalBlockDeletionError("source artifact bytes drifted")
    engine = result["engine"]
    if type(engine) is not dict or type(engine.get("artifacts")) is not dict:
        raise Profile0034PhysicalBlockDeletionError("engine artifacts are malformed")
    payloads = {
        label: _verify_artifact(output, record, seen)
        for label, record in engine["artifacts"].items()
    }
    disposition = _validate_engine(prepared, engine, payloads, verdict_cache)
    if result["disposition"] != disposition:
        raise Profile0034PhysicalBlockDeletionError("query disposition drifted")
    entries = list(output.iterdir())
    if (
        any(entry.is_symlink() or not entry.is_file() for entry in entries)
        or {entry.name for entry in entries} != seen
    ):
        raise Profile0034PhysicalBlockDeletionError(
            "query tree contains unbound artifacts"
        )
    return result


def run_query(
    prepared: PreparedQuery,
    output: Path,
    transport: adapter.PiqdTransport,
    cache: SemanticVerdictCache,
) -> dict[str, Any]:
    if output.exists() or output.is_symlink():
        raise Profile0034PhysicalBlockDeletionError("query output already exists")
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
                semantic_verifier=cache.verify,
                output_fd=transaction.file_descriptor,
                used_session_ids=set(),
                request_id=_query_request_id(prepared),
                assumption_labels=(),
            )
            payloads = {
                label: _read_fd_artifact(transaction.file_descriptor, record["path"])
                for label, record in engine["artifacts"].items()
            }
            _validate_engine(prepared, engine, payloads, cache)
            result = _result_record(prepared, engine, custody)
            transaction.write_bytes("result.json", _json(result), publish=True)
        return verify_query_tree(prepared, output, cache)
    except (adapter.SmtSourceAdapterError, OSError) as exc:
        raise Profile0034PhysicalBlockDeletionError("query execution failed") from exc


def _publish_once(path: Path, payload: bytes) -> None:
    try:
        deletion._publish_once(path, payload)
    except Exception as exc:
        raise Profile0034PhysicalBlockDeletionError(
            "create-once publication failed"
        ) from exc


def choose_round_winner(
    specs: Sequence[QuerySpec], results: Mapping[str, Mapping[str, Any]]
) -> QuerySpec | None:
    """Choose one canonical custody-valid deletion from one fixed-current batch."""

    candidates = tuple(specs)
    if not candidates or set(results) != {spec.key for spec in candidates}:
        raise Profile0034PhysicalBlockDeletionError("round result inventory drifted")
    current_sha256 = candidates[0].current_sha256
    branch = candidates[0].branch_id
    valid: list[QuerySpec] = []
    for spec in candidates:
        result = results[spec.key]
        if (
            spec.current_sha256 != current_sha256
            or spec.branch_id != branch
            or result.get("query_spec") != query_spec_record(spec)
            or result.get("result_sha256") != _self_hash(result, "result_sha256")
        ):
            raise Profile0034PhysicalBlockDeletionError("stale round sibling rejected")
        disposition = classify_result(result)
        if disposition == "MALFORMED":
            raise Profile0034PhysicalBlockDeletionError("round result is malformed")
        if disposition == "UNSAT_CUSTODY_VALID":
            valid.append(spec)
    if not valid:
        return None
    return min(
        valid,
        key=lambda item: (
            len(item.retained_group_ids),
            item.retained_group_ids,
            item.deleted_block,
            item.key,
        ),
    )


def _round_record(
    branch: str,
    round_index: int,
    granularity: int,
    specs: Sequence[QuerySpec],
    results: Mapping[str, Mapping[str, Any]],
    winner: QuerySpec | None,
) -> dict[str, Any]:
    current = specs[0].current_group_ids
    record = {
        "schema": ROUND_SCHEMA,
        "branch_id": branch,
        "round_index": round_index,
        "granularity": granularity,
        "current_group_ids": list(current),
        "current_sha256": _group_sha256(current),
        "candidate_keys": [spec.key for spec in specs],
        "candidates": [
            {
                "query_spec": query_spec_record(spec),
                "disposition": classify_result(results[spec.key]),
                "result_sha256": results[spec.key]["result_sha256"],
            }
            for spec in specs
        ],
        "accepted_key": None if winner is None else winner.key,
        "next_group_ids": list(
            current if winner is None else winner.retained_group_ids
        ),
        "next_sha256": _group_sha256(
            current if winner is None else winner.retained_group_ids
        ),
        "single_mutation": winner is None
        or set(current) - set(winner.retained_group_ids) == set(winner.deleted_block),
        "claims": dict(FALSE_CLAIMS),
    }
    record["round_sha256"] = _self_hash(record, "round_sha256")
    return record


def _write_round(root: Path, record: Mapping[str, Any]) -> Path:
    branch = record["branch_id"]
    directory = root / "events" / "rounds" / branch
    directory.mkdir(parents=True, exist_ok=True)
    path = directory / f"round-{record['round_index']:04d}.json"
    _publish_once(path, _json(record))
    return path


def _run_prepared(
    prepared: PreparedQuery,
    root: Path,
    transport: adapter.PiqdTransport,
    cache: SemanticVerdictCache,
) -> dict[str, Any]:
    return run_query(prepared, root / "artifacts" / prepared.key, transport, cache)


def run_branch(
    branch: str,
    *,
    parent: Mapping[str, Any],
    root: Path,
    transport: adapter.PiqdTransport,
    query_executor: concurrent.futures.Executor,
    cache: SemanticVerdictCache,
    query_cap: int = QUERY_CAP_PER_BRANCH,
    query_runner: Callable[[PreparedQuery], dict[str, Any]] | None = None,
) -> dict[str, Any]:
    """Run one branch coordinator against the shared bounded executor."""

    if (
        branch not in BRANCH_IDS
        or type(query_cap) is not int
        or not 1 <= query_cap <= QUERY_CAP_PER_BRANCH
    ):
        raise Profile0034PhysicalBlockDeletionError("branch query cap is invalid")
    runner = query_runner or (
        lambda prepared: _run_prepared(prepared, root, transport, cache)
    )
    all_results: dict[str, dict[str, Any]] = {}
    all_specs: dict[str, QuerySpec] = {}
    anchor = prepare_query(anchor_spec(branch), parent=parent)
    anchor_result = query_executor.submit(runner, anchor).result()
    all_specs[anchor.key] = anchor.spec
    all_results[anchor.key] = anchor_result
    if classify_result(anchor_result) != "UNSAT_CUSTODY_VALID":
        raise Profile0034PhysicalBlockDeletionError(
            "full anchor is not custody-valid UNSAT"
        )
    selected_spec = anchor.spec
    selected_result = anchor_result
    current = GROUP_UNIVERSE
    granularity = 2
    round_index = 1
    singleton_tests: set[str] = set()
    stop_reason = "no-removable-groups"
    deletion_stable = not REMOVABLE_GROUP_IDS[branch]
    round_files: list[dict[str, Any]] = []
    while True:
        removable = tuple(
            group_id for group_id in current if group_id not in BASE_GROUP_IDS[branch]
        )
        if not removable:
            deletion_stable = True
            stop_reason = "base-is-unsat"
            break
        specs = candidate_specs(branch, round_index, current, granularity)
        if len(all_results) + len(specs) > query_cap:
            deletion_stable = False
            stop_reason = "query-cap"
            break
        prepared = [prepare_query(spec, parent=parent) for spec in specs]
        futures = [query_executor.submit(runner, item) for item in prepared]
        batch_results: dict[str, dict[str, Any]] = {}
        for item, future in zip(prepared, futures, strict=True):
            result = future.result()
            batch_results[item.key] = result
            all_results[item.key] = result
            all_specs[item.key] = item.spec
        if granularity >= len(removable):
            singleton_tests.update(
                spec.deleted_block[0] for spec in specs if len(spec.deleted_block) == 1
            )
        winner = choose_round_winner(specs, batch_results)
        round_record = _round_record(
            branch, round_index, granularity, specs, batch_results, winner
        )
        round_path = _write_round(root, round_record)
        round_files.append(
            {
                "path": round_path.relative_to(root).as_posix(),
                "sha256": _sha(_read(round_path)),
                "round_sha256": round_record["round_sha256"],
            }
        )
        if winner is not None:
            selected_spec = winner
            selected_result = batch_results[winner.key]
            current = winner.retained_group_ids
            granularity = min(2, max(1, len(current)))
            stop_reason = "accepted-removal"
        elif granularity < len(removable):
            granularity = min(len(removable), granularity * 2)
            stop_reason = "refined-granularity"
        else:
            dispositions = [classify_result(batch_results[spec.key]) for spec in specs]
            deletion_stable = all(value == "SAT_REPLAYED" for value in dispositions)
            stop_reason = (
                "singleton-closed" if deletion_stable else "singleton-unresolved"
            )
            break
        round_index += 1
    if classify_result(selected_result) != "UNSAT_CUSTODY_VALID":
        raise Profile0034PhysicalBlockDeletionError("final UNSAT invariant failed")
    selected_current = tuple(selected_spec.retained_group_ids)
    if selected_current != current:
        raise Profile0034PhysicalBlockDeletionError("selected current drifted")
    return {
        "branch_id": branch,
        "query_count": len(all_results),
        "query_cap": query_cap,
        "final_group_ids": list(current),
        "final_sha256": _group_sha256(current),
        "removed_group_ids": [row for row in GROUP_UNIVERSE if row not in current],
        "singleton_removals_tested": [
            row for row in GROUP_UNIVERSE if row in singleton_tests
        ],
        "deletion_stable": deletion_stable,
        "stop_reason": stop_reason,
        "selected_result": {
            "key": selected_spec.key,
            "result_sha256": selected_result["result_sha256"],
            "disposition": "UNSAT_CUSTODY_VALID",
        },
        "round_files": round_files,
        "query_specs": {
            key: query_spec_record(all_specs[key]) for key in sorted(all_specs)
        },
        "results": {key: all_results[key] for key in sorted(all_results)},
        "claims": dict(FALSE_CLAIMS),
    }


def _load_checkpoint() -> dict[str, Any]:
    try:
        checkpoint = adapter._strict_json(_read(CHECKPOINT_PATH), "lane checkpoint")
    except Exception as exc:
        raise Profile0034PhysicalBlockDeletionError(
            "lane checkpoint is invalid"
        ) from exc
    if (
        set(checkpoint)
        != {
            "schema",
            "lane_id",
            "owner",
            "base_head",
            "owned_paths",
            "generated_roots",
            "durable_paths",
            "created_utc",
            "manifest_sha256",
        }
        or checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != CHECKPOINT_OWNER
        or checkpoint.get("base_head") != CHECKPOINT_BASE_HEAD
        or checkpoint.get("owned_paths") != _OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile0034PhysicalBlockDeletionError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    authenticate_parent_runs()
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


def _require_safe_run_ancestors() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise Profile0034PhysicalBlockDeletionError(
            "run root escapes repository"
        ) from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise Profile0034PhysicalBlockDeletionError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise Profile0034PhysicalBlockDeletionError("run ancestor is unsafe")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_run_ancestors()
    RUN_ROOT.parent.mkdir(parents=True, exist_ok=True)
    if RUN_ROOT.is_symlink() or (RUN_ROOT.exists() and not RUN_ROOT.is_dir()):
        raise Profile0034PhysicalBlockDeletionError("run root is unsafe")
    RUN_ROOT.mkdir(mode=0o700, exist_ok=True)
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists() or manifest_path.is_symlink():
        manifest = _strict(_read(manifest_path), "run manifest")
        created = manifest.get("created_utc")
        if type(created) is not str or manifest != _expected_run_manifest(created):
            raise Profile0034PhysicalBlockDeletionError("run manifest drifted")
    else:
        if tuple(RUN_ROOT.iterdir()):
            raise Profile0034PhysicalBlockDeletionError(
                "unregistered run payload exists"
            )
        created = (
            dt.datetime.now(dt.UTC)
            .replace(microsecond=0)
            .isoformat()
            .replace("+00:00", "Z")
        )
        manifest = _expected_run_manifest(created)
        _publish_once(manifest_path, _json(manifest))
    return RUN_ROOT, manifest


def _authenticate_source_commit(manifest: Mapping[str, Any], commit: object) -> str:
    if type(commit) is not str or _FULL_COMMIT.fullmatch(commit) is None:
        raise Profile0034PhysicalBlockDeletionError("execution commit is malformed")
    digests = manifest.get("source_digests")
    expected = sorted(_repo_path(path) for path in _manifest_sources())
    if type(digests) is not dict or sorted(digests) != expected:
        raise Profile0034PhysicalBlockDeletionError("source inventory drifted")
    for relative in expected:
        current = _read(REPOSITORY_ROOT / relative)
        if digests.get(relative) != _sha(current):
            raise Profile0034PhysicalBlockDeletionError("current source drifted")
        if _git_read(("show", f"{commit}:{relative}"), relative) != current:
            raise Profile0034PhysicalBlockDeletionError(
                "recorded source commit drifted"
            )
    return commit


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    raw = _git_read(("rev-parse", "--verify", "HEAD^{commit}"), "current commit")
    try:
        commit = raw.decode("ascii").strip()
    except UnicodeDecodeError as exc:
        raise Profile0034PhysicalBlockDeletionError(
            "execution commit is malformed"
        ) from exc
    if raw != f"{commit}\n".encode("ascii"):
        raise Profile0034PhysicalBlockDeletionError("execution commit is malformed")
    return _authenticate_source_commit(manifest, commit)


def authenticate_recorded_execution_commit(
    manifest: Mapping[str, Any], launch: Mapping[str, Any]
) -> str:
    return _authenticate_source_commit(manifest, launch.get("execution_commit"))


def _initialize_runtime_dirs(root: Path) -> None:
    if {entry.name for entry in root.iterdir()} != {"run_manifest.json"}:
        raise Profile0034PhysicalBlockDeletionError("runtime root is not pristine")
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(mode=0o700)


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
        raise Profile0034PhysicalBlockDeletionError("PIQD server URL is invalid")
    return server.rstrip("/")


def _launch_record(
    manifest: Mapping[str, Any], execution_commit: str, server: str, workers: int
) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_commit": execution_commit,
        "controls": list(CONTROL_KEYS),
        "branches": list(BRANCH_IDS),
        "strategy": "physical-stable-partition-ddmin",
        "initial_granularity": 2,
        "query_cap_per_branch": QUERY_CAP_PER_BRANCH,
        "server": server,
        "timeout_ms": TIMEOUT_MS,
        "workers": workers,
        "max_workers": MAX_WORKERS,
        "solves_per_session": 1,
        "resume": False,
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _read_launch(path: Path) -> dict[str, Any]:
    launch = _strict(_read(path), "launch")
    if (
        set(launch)
        != {
            "schema",
            "lane_id",
            "run_id",
            "run_manifest_sha256",
            "execution_commit",
            "controls",
            "branches",
            "strategy",
            "initial_granularity",
            "query_cap_per_branch",
            "server",
            "timeout_ms",
            "workers",
            "max_workers",
            "solves_per_session",
            "resume",
            "claims",
            "launch_sha256",
        }
        or launch.get("schema") != LAUNCH_SCHEMA
        or launch.get("lane_id") != LANE_ID
        or launch.get("run_id") != RUN_ID
        or launch.get("claims") != FALSE_CLAIMS
        or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256")
    ):
        raise Profile0034PhysicalBlockDeletionError("launch record drifted")
    return launch


def _inventory(root: Path) -> str:
    if root.is_symlink() or not root.is_dir():
        raise Profile0034PhysicalBlockDeletionError("run root is unsafe")
    names = {entry.name for entry in root.iterdir()}
    if names == {"run_manifest.json"}:
        return "INITIALIZED"
    if names != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise Profile0034PhysicalBlockDeletionError("run inventory drifted")
    for name in ("artifacts", "events", "tmp"):
        path = root / name
        if path.is_symlink() or not path.is_dir():
            raise Profile0034PhysicalBlockDeletionError("runtime directory is unsafe")
    if tuple((root / "tmp").iterdir()):
        raise Profile0034PhysicalBlockDeletionError("runtime tmp is not empty")
    event_names = {entry.name for entry in (root / "events").iterdir()}
    if not event_names:
        if tuple((root / "artifacts").iterdir()):
            raise Profile0034PhysicalBlockDeletionError("artifacts precede launch")
        return "RUNTIME_READY"
    for path in root.rglob("*"):
        if path.name.startswith(".piqd-smt-tombstone-"):
            raise Profile0034PhysicalBlockDeletionError("transaction tombstone remains")
    for entry in (root / "artifacts").iterdir():
        if (
            entry.is_symlink()
            or not entry.is_dir()
            or not (
                entry.name in CONTROL_KEYS
                or re.fullmatch(
                    r"z3-(lt|gt)-(anchor-[0-9a-f]{16}|r[0-9]{3}-[0-9a-f]{16}-drop-[0-9a-f]{16})",
                    entry.name,
                )
            )
        ):
            raise Profile0034PhysicalBlockDeletionError(
                "runtime artifact entry is invalid"
            )
        children = list(entry.iterdir())
        if (
            not children
            or "result.json" not in {child.name for child in children}
            or any(child.is_symlink() or not child.is_file() for child in children)
        ):
            raise Profile0034PhysicalBlockDeletionError(
                "runtime query tree is incomplete"
            )
    if event_names == {"launch.json"}:
        return "LAUNCHED"
    if event_names == {"launch.json", "rounds"}:
        return "LAUNCHED"
    if event_names == {"launch.json", "rounds", "terminal.json"}:
        return "TERMINAL"
    raise Profile0034PhysicalBlockDeletionError("event inventory drifted")


def _terminal_record(
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    controls: Mapping[str, Mapping[str, Any]],
    branches: Mapping[str, Mapping[str, Any]],
) -> dict[str, Any]:
    if set(controls) != set(CONTROL_KEYS) or set(branches) != set(BRANCH_IDS):
        raise Profile0034PhysicalBlockDeletionError("terminal inventory is incomplete")
    if (
        classify_result(controls[CONTROL_KEYS[0]]) != "SAT_REPLAYED"
        or classify_result(controls[CONTROL_KEYS[1]]) != "UNSAT_CUSTODY_VALID"
    ):
        raise Profile0034PhysicalBlockDeletionError("control result drifted")
    results: dict[str, Mapping[str, Any]] = dict(controls)
    query_specs: dict[str, Any] = {
        key: query_spec_record(control_spec(key)) for key in CONTROL_KEYS
    }
    branch_records: dict[str, Any] = {}
    for branch in BRANCH_IDS:
        report = branches[branch]
        branch_results = report.get("results")
        branch_specs = report.get("query_specs")
        if type(branch_results) is not dict or type(branch_specs) is not dict:
            raise Profile0034PhysicalBlockDeletionError(
                "branch result inventory is absent"
            )
        if set(results) & set(branch_results) or set(branch_results) != set(
            branch_specs
        ):
            raise Profile0034PhysicalBlockDeletionError("query identities crossed")
        results.update(branch_results)
        query_specs.update(branch_specs)
        branch_records[branch] = {
            key: value
            for key, value in report.items()
            if key not in {"results", "query_specs"}
        }
    session_ids = [
        result.get("engine", {}).get("session_id") for result in results.values()
    ]
    if any(
        type(session_id) is not str or not session_id for session_id in session_ids
    ) or len(set(session_ids)) != len(session_ids):
        raise Profile0034PhysicalBlockDeletionError("query session identities crossed")
    dispositions = {key: classify_result(result) for key, result in results.items()}
    if any(value == "MALFORMED" for value in dispositions.values()):
        raise Profile0034PhysicalBlockDeletionError("terminal has malformed results")
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": "PHYSICAL_BLOCK_DELETION_COMPLETE",
        "query_count": len(results),
        "disposition_counts": {
            value: sum(item == value for item in dispositions.values())
            for value in sorted(set(dispositions.values()))
        },
        "queries": {
            key: {
                "query_spec": query_specs[key],
                "raw_status": results[key]["engine"]["raw_status"],
                "effective_status": results[key]["engine"]["effective_status"],
                "disposition": dispositions[key],
                "result_sha256": results[key]["result_sha256"],
            }
            for key in sorted(results)
        },
        "branches": branch_records,
        "deletion_stable": all(
            branch_records[branch]["deletion_stable"] for branch in BRANCH_IDS
        ),
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _read_terminal(path: Path) -> dict[str, Any]:
    terminal = _strict(_read(path), "terminal")
    if (
        set(terminal)
        != {
            "schema",
            "lane_id",
            "run_id",
            "run_manifest_sha256",
            "launch_sha256",
            "status",
            "query_count",
            "disposition_counts",
            "queries",
            "branches",
            "deletion_stable",
            "claims",
            "terminal_sha256",
        }
        or terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("lane_id") != LANE_ID
        or terminal.get("run_id") != RUN_ID
        or terminal.get("status") != "PHYSICAL_BLOCK_DELETION_COMPLETE"
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise Profile0034PhysicalBlockDeletionError("terminal record drifted")
    return terminal


def _verify_round_files(
    root: Path, branch: str, report: Mapping[str, Any], terminal: Mapping[str, Any]
) -> None:
    rows = report.get("round_files")
    if type(rows) is not list:
        raise Profile0034PhysicalBlockDeletionError("round inventory is absent")
    current = GROUP_UNIVERSE
    last: dict[str, Any] | None = None
    for expected_index, locator in enumerate(rows, start=1):
        if type(locator) is not dict or set(locator) != {
            "path",
            "sha256",
            "round_sha256",
        }:
            raise Profile0034PhysicalBlockDeletionError("round locator drifted")
        expected_path = f"events/rounds/{branch}/round-{expected_index:04d}.json"
        if locator["path"] != expected_path:
            raise Profile0034PhysicalBlockDeletionError("round path drifted")
        payload = _read(root / expected_path)
        record = _strict(payload, "round")
        if (
            set(record)
            != {
                "schema",
                "branch_id",
                "round_index",
                "granularity",
                "current_group_ids",
                "current_sha256",
                "candidate_keys",
                "candidates",
                "accepted_key",
                "next_group_ids",
                "next_sha256",
                "single_mutation",
                "claims",
                "round_sha256",
            }
            or type(record.get("granularity")) is not int
            or type(record.get("granularity")) is bool
            or _sha(payload) != locator["sha256"]
            or record.get("round_sha256") != locator["round_sha256"]
            or record.get("round_sha256") != _self_hash(record, "round_sha256")
            or record.get("schema") != ROUND_SCHEMA
            or record.get("branch_id") != branch
            or record.get("round_index") != expected_index
            or record.get("current_group_ids") != list(current)
            or record.get("current_sha256") != _group_sha256(current)
            or record.get("claims") != FALSE_CLAIMS
        ):
            raise Profile0034PhysicalBlockDeletionError("round custody drifted")
        candidates = record.get("candidates")
        if type(candidates) is not list or not candidates:
            raise Profile0034PhysicalBlockDeletionError("round candidates are absent")
        accepted = record.get("accepted_key")
        accepted_rows: list[QuerySpec] = []
        parsed_specs: list[QuerySpec] = []
        for row in candidates:
            if type(row) is not dict or set(row) != {
                "query_spec",
                "disposition",
                "result_sha256",
            }:
                raise Profile0034PhysicalBlockDeletionError("round candidate drifted")
            spec = query_spec_from_record(row.get("query_spec"))
            parsed_specs.append(spec)
            query = terminal["queries"].get(spec.key)
            if (
                spec.branch_id != branch
                or spec.current_group_ids != current
                or type(query) is not dict
                or query.get("query_spec") != row["query_spec"]
                or query.get("disposition") != row.get("disposition")
                or query.get("result_sha256") != row.get("result_sha256")
            ):
                raise Profile0034PhysicalBlockDeletionError("round query link drifted")
            if row.get("disposition") == "UNSAT_CUSTODY_VALID":
                accepted_rows.append(spec)
        expected_specs = candidate_specs(
            branch, expected_index, current, record["granularity"]
        )
        if tuple(parsed_specs) != expected_specs or record.get("candidate_keys") != [
            spec.key for spec in expected_specs
        ]:
            raise Profile0034PhysicalBlockDeletionError("round partition drifted")
        winner = (
            None
            if not accepted_rows
            else min(
                accepted_rows,
                key=lambda item: (
                    len(item.retained_group_ids),
                    item.retained_group_ids,
                    item.deleted_block,
                    item.key,
                ),
            )
        )
        if accepted != (None if winner is None else winner.key):
            raise Profile0034PhysicalBlockDeletionError("round winner drifted")
        next_current = current if winner is None else winner.retained_group_ids
        if (
            record.get("next_group_ids") != list(next_current)
            or record.get("next_sha256") != _group_sha256(next_current)
            or record.get("single_mutation") is not True
        ):
            raise Profile0034PhysicalBlockDeletionError(
                "round current mutation drifted"
            )
        current = next_current
        last = record
    if report.get("final_group_ids") != list(current) or report.get(
        "final_sha256"
    ) != _group_sha256(current):
        raise Profile0034PhysicalBlockDeletionError("final current drifted")
    if report.get("deletion_stable") is True:
        removable = tuple(row for row in current if row not in BASE_GROUP_IDS[branch])
        if removable:
            if last is None or last.get("granularity") != len(removable):
                raise Profile0034PhysicalBlockDeletionError(
                    "stability lacks singleton coverage"
                )
            if any(
                row.get("disposition") != "SAT_REPLAYED" for row in last["candidates"]
            ):
                raise Profile0034PhysicalBlockDeletionError(
                    "stability has unresolved singleton"
                )


def verify_terminal_run(
    root: Path,
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    parent: Mapping[str, Any],
    cache: SemanticVerdictCache | None = None,
) -> dict[str, Any]:
    terminal = _read_terminal(root / "events" / "terminal.json")
    if (
        terminal["run_manifest_sha256"] != manifest["manifest_sha256"]
        or terminal["launch_sha256"] != launch["launch_sha256"]
        or set(terminal["branches"]) != set(BRANCH_IDS)
        or terminal["query_count"] != len(terminal["queries"])
    ):
        raise Profile0034PhysicalBlockDeletionError("terminal links drifted")
    if type(terminal["queries"]) is not dict or not terminal["queries"]:
        raise Profile0034PhysicalBlockDeletionError("terminal query inventory drifted")
    for row in terminal["queries"].values():
        if type(row) is not dict or set(row) != {
            "query_spec",
            "raw_status",
            "effective_status",
            "disposition",
            "result_sha256",
        }:
            raise Profile0034PhysicalBlockDeletionError("terminal query row drifted")
    verdict_cache = cache or SemanticVerdictCache()
    results: dict[str, dict[str, Any]] = {}
    artifact_entries = {entry.name for entry in (root / "artifacts").iterdir()}
    if artifact_entries != set(terminal["queries"]):
        raise Profile0034PhysicalBlockDeletionError(
            "terminal artifact inventory drifted"
        )
    for key, row in terminal["queries"].items():
        spec = query_spec_from_record(row.get("query_spec"))
        if spec.key != key:
            raise Profile0034PhysicalBlockDeletionError("terminal query key drifted")
        prepared = prepare_query(spec, parent=parent)
        result = verify_query_tree(prepared, root / "artifacts" / key, verdict_cache)
        if (
            row.get("raw_status") != result["engine"]["raw_status"]
            or row.get("effective_status") != result["engine"]["effective_status"]
            or row.get("disposition") != classify_result(result)
            or row.get("result_sha256") != result["result_sha256"]
        ):
            raise Profile0034PhysicalBlockDeletionError(
                "terminal query summary drifted"
            )
        results[key] = result
    for branch in BRANCH_IDS:
        report = terminal["branches"][branch]
        if type(report) is not dict or set(report) != {
            "branch_id",
            "query_count",
            "query_cap",
            "final_group_ids",
            "final_sha256",
            "removed_group_ids",
            "singleton_removals_tested",
            "deletion_stable",
            "stop_reason",
            "selected_result",
            "round_files",
            "claims",
        }:
            raise Profile0034PhysicalBlockDeletionError("branch terminal row drifted")
        branch_query_count = sum(
            row.get("query_spec", {}).get("branch_id") == branch
            for row in terminal["queries"].values()
        )
        if (
            report.get("branch_id") != branch
            or report.get("query_count") != branch_query_count
            or type(report.get("query_count")) is not int
            or not 1 <= report["query_count"] <= QUERY_CAP_PER_BRANCH
            or report.get("query_cap") != QUERY_CAP_PER_BRANCH
            or report.get("claims") != FALSE_CLAIMS
            or type(report.get("deletion_stable")) is not bool
            or canonical_group_ids(report.get("final_group_ids", ()))
            != tuple(report["final_group_ids"])
            or report.get("removed_group_ids")
            != [row for row in GROUP_UNIVERSE if row not in report["final_group_ids"]]
            or not set(report.get("singleton_removals_tested", ()))
            <= set(REMOVABLE_GROUP_IDS[branch])
        ):
            raise Profile0034PhysicalBlockDeletionError(
                "branch terminal summary drifted"
            )
        selected = report.get("selected_result")
        selected_result = results.get(
            selected.get("key") if type(selected) is dict else None
        )
        if (
            type(selected) is not dict
            or set(selected) != {"key", "result_sha256", "disposition"}
            or selected.get("disposition") != "UNSAT_CUSTODY_VALID"
            or type(selected_result) is not dict
            or classify_result(selected_result) != "UNSAT_CUSTODY_VALID"
            or selected_result.get("result_sha256") != selected.get("result_sha256")
            or selected_result.get("retained_group_ids")
            != report.get("final_group_ids")
        ):
            raise Profile0034PhysicalBlockDeletionError("final UNSAT link drifted")
        _verify_round_files(root, branch, report, terminal)
        round_directory = root / "events" / "rounds" / branch
        expected_round_names = {Path(row["path"]).name for row in report["round_files"]}
        if (
            round_directory.is_symlink()
            or not round_directory.is_dir()
            or {path.name for path in round_directory.iterdir()} != expected_round_names
        ):
            raise Profile0034PhysicalBlockDeletionError("round directory drifted")
    rounds_root = root / "events" / "rounds"
    if (
        rounds_root.is_symlink()
        or not rounds_root.is_dir()
        or {path.name for path in rounds_root.iterdir()} != set(BRANCH_IDS)
    ):
        raise Profile0034PhysicalBlockDeletionError("round branch inventory drifted")
    expected_counts = {
        value: sum(row["disposition"] == value for row in terminal["queries"].values())
        for value in sorted(
            {row["disposition"] for row in terminal["queries"].values()}
        )
    }
    if terminal["disposition_counts"] != expected_counts or terminal[
        "deletion_stable"
    ] is not all(
        terminal["branches"][branch]["deletion_stable"] for branch in BRANCH_IDS
    ):
        raise Profile0034PhysicalBlockDeletionError("terminal status summary drifted")
    return terminal


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
        raise Profile0034PhysicalBlockDeletionError("timeout is fixed at 60 seconds")
    if (
        type(workers) is not int
        or type(workers) is bool
        or not 1 <= workers <= MAX_WORKERS
    ):
        raise Profile0034PhysicalBlockDeletionError("workers must lie in 1..20")
    root, manifest = ensure_run_root()
    parent = authenticate_parent_runs()
    phase = _inventory(root)
    if init_only:
        if phase != "INITIALIZED":
            raise Profile0034PhysicalBlockDeletionError(
                "init-only requires an initialized root"
            )
        return {
            "status": "INITIALIZED",
            "lane_id": LANE_ID,
            "run_id": RUN_ID,
            "run_manifest_sha256": manifest["manifest_sha256"],
        }
    server = _validate_server(server)
    launch_path = root / "events" / "launch.json"
    if phase == "TERMINAL":
        stored_launch = _read_launch(launch_path)
        execution_commit = authenticate_recorded_execution_commit(
            manifest, stored_launch
        )
        expected_launch = _launch_record(manifest, execution_commit, server, workers)
        if stored_launch != expected_launch:
            raise Profile0034PhysicalBlockDeletionError(
                "terminal launch replay drifted"
            )
        return verify_terminal_run(root, manifest, stored_launch, parent)
    if phase != "INITIALIZED":
        raise Profile0034PhysicalBlockDeletionError(
            "incomplete launch cannot resume; use a fresh run id"
        )
    execution_commit = authenticate_execution_commit(manifest)
    launch = _launch_record(manifest, execution_commit, server, workers)
    _initialize_runtime_dirs(root)
    _publish_once(launch_path, _json(launch))
    if _inventory(root) != "LAUNCHED":
        raise Profile0034PhysicalBlockDeletionError("launch inventory drifted")
    active_transport = transport or adapter.UrllibPiqdTransport(
        server, http_timeout_s=DEFAULT_TIMEOUT_S + 40
    )
    cache = SemanticVerdictCache()
    controls: dict[str, dict[str, Any]] = {}
    for key in CONTROL_KEYS:
        prepared = prepare_query(control_spec(key), parent=parent)
        controls[key] = _run_prepared(prepared, root, active_transport, cache)
    if (
        classify_result(controls[CONTROL_KEYS[0]]) != "SAT_REPLAYED"
        or classify_result(controls[CONTROL_KEYS[1]]) != "UNSAT_CUSTODY_VALID"
    ):
        raise Profile0034PhysicalBlockDeletionError("transport controls failed")
    with (
        concurrent.futures.ThreadPoolExecutor(max_workers=workers) as query_pool,
        concurrent.futures.ThreadPoolExecutor(max_workers=2) as coordinator_pool,
    ):
        futures = {
            branch: coordinator_pool.submit(
                run_branch,
                branch,
                parent=parent,
                root=root,
                transport=active_transport,
                query_executor=query_pool,
                cache=cache,
            )
            for branch in BRANCH_IDS
        }
        branches = {branch: futures[branch].result() for branch in BRANCH_IDS}
    for report in branches.values():
        selected = report["selected_result"]
        spec = query_spec_from_record(report["query_specs"][selected["key"]])
        result = verify_query_tree(
            prepare_query(spec, parent=parent),
            root / "artifacts" / selected["key"],
            cache,
        )
        if (
            classify_result(result) != "UNSAT_CUSTODY_VALID"
            or result["retained_group_ids"] != report["final_group_ids"]
        ):
            raise Profile0034PhysicalBlockDeletionError("final UNSAT recheck failed")
    terminal = _terminal_record(manifest, launch, controls, branches)
    _publish_once(root / "events" / "terminal.json", _json(terminal))
    if _inventory(root) != "TERMINAL":
        raise Profile0034PhysicalBlockDeletionError("terminal inventory drifted")
    return verify_terminal_run(root, manifest, launch, parent, cache)


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
    except (Profile0034PhysicalBlockDeletionError, OSError, ValueError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 2
    if args.verbose:
        print(json.dumps(result, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
