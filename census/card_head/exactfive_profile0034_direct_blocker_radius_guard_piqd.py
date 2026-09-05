# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Governed PIQD canary for the direct profile-0034 blocker-radius guard.

This discovery-only producer authenticates the completed direct physical-block
run and appends one source-proved squared-distance guard to each frozen full
radius branch.  It makes no source-realization, theorem, closure, or promotion
claim.
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
    exactfive_profile0034_direct_physical_block_deletion_piqd as parent,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-profile0034-direct-blocker-radius-guard-piqd-20260905"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
TEST_PATH = REPOSITORY_ROOT / (
    "census/card_head/tests/test_exactfive_profile0034_direct_blocker_radius_guard_piqd.py"
)
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-profile0034-direct-blocker-radius-guard-piqd-v1.md"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_profile0034_direct_blocker_radius_guard_piqd.py"
)
LEAN_SOURCE_PATH = REPOSITORY_ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactFiveDistinctProfile0034SourceAdapter.lean"
)

CHECKPOINT_OWNER = "profile0034-direct-blocker-radius-guard-piqd"
CHECKPOINT_BASE_HEAD = "79ee277bc3000d19b6a021d9915d24305f7f6a8c"
THEOREM_SOURCE_COMMIT = CHECKPOINT_BASE_HEAD
THEOREM_NAME = (
    "RobustApexFourIncidenceContinuationPacket."
    "secondApex_sqDist_lt_sqDist_blocker"
)
LEAN_SOURCE_SHA256 = "5381678645d913b188299749a1cf0e8cf049003b729519c815aec49ebae71b04"
PARENT_MODULE_SHA256 = "1f587faced5dc6f25df0ff5940620509c7484f9ba4c43316efa41db6bde25824"
ADAPTER_SHA256 = "94058aa4e04b5acc27242b52781794944ea00a069b16805104d3263203d65e70"

TIMEOUT_MS = 300_000
DEFAULT_TIMEOUT_S = 300.0
DEFAULT_WORKERS = 8
MAX_WORKERS = 20
BRANCH_IDS = ("lt", "gt")
SOLVERS = ("z3", "cvc5")
QUERY_PLAN = tuple(
    (f"{solver}-target-{branch}", solver, "target", branch)
    for solver in SOLVERS
    for branch in BRANCH_IDS
) + tuple(
    (f"{solver}-control-{polarity}", solver, "control", polarity)
    for solver in SOLVERS
    for polarity in ("positive", "negative")
)
QUERY_KEYS = tuple(row[0] for row in QUERY_PLAN)
CONTROL_KEYS = tuple(row[0] for row in QUERY_PLAN if row[2] == "control")

PARENT_ROOT = parent.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PINS = {
    "manifest_file": "d6aef350e1f2035519bd6d046282265d9fb839fc7ceef929ffeb2c8dc0b8d3fe",
    "manifest": "c80e09b9fe8b5d15dad8b2403b1023ec0fc8fbdccb04f5a82b3979876e1d71b0",
    "launch_file": "832565a52a9c2eaa96893bf57bf249cde395a17bfc714e1f7da4ac89bbdbdce2",
    "launch": "fe9e795a8df4d2b0f38c24a7c5536a778ae07dd8952e139fb6fa3947e891a568",
    "terminal_file": "88584644fe1ef0bd2627dd6b8f74d9da7c33dae70c69a82912992d75a1a3eec7",
    "terminal": "666ed25997beb262efb6a00062aaca64e8211660fc482cb7d5dac51d0dbd1720",
    "execution_head": "53a044df922b4b9723ac51f44372b1f089c08478",
}
ANCHOR_PINS = {
    "lt": {
        "key": "z3-direct-lt-r000-anchor",
        "result_file": "fe21eb144c18fd1d240daf283cc9122749c040b56cf3839edc9beae65317898c",
        "result": "0765907898076c0243081500e84fa3ee43fe658b1c0e65aca435d737f914ab64",
        "system": "0983e3e85c18e94c654107e8b360864bf16b005ba78b9bb03e36fcf2febb0f14",
        "journal": "330e657acc657e76c12d275c35dab43bf45a5fee1b1ca5cc7be84079df66341e",
        "guarded_journal": "c24f53801bcfbdaed9819e5174795e15ed470b80c752cc473c087602da81c25e",
    },
    "gt": {
        "key": "z3-direct-gt-r000-anchor",
        "result_file": "a911593b1348da4c4d588e84b28617a49df22fce24a3d7ba4b745079eb328564",
        "result": "7f03d4e541cc8bc712a75b0bd4af254ec83e973931b4bd35313e18a1a7086e5d",
        "system": "2b01633db32d65d2a3117272da2515a9fa9a2ea74a7b1db8b9c68d906be42636",
        "journal": "a457faa7eea07e01442a57c1e2dd8558bf5528576c238fc7a0b1456e216693eb",
        "guarded_journal": "bdd07eb7269b476d267f019c88e506ba9b727f0531bbd11c62a3624cafc23ae3",
    },
}

GUARD_ASSERTION = (
    "(assert (< (+ (* (- x_c002 1) (- x_c002 1)) "
    "(* 3 (- Y_c002 0) (- Y_c002 0))) "
    "(+ (* (- x_c002 0) (- x_c002 0)) "
    "(* 3 (- Y_c002 0) (- Y_c002 0)))))"
)

SYSTEM_SCHEMA = "p97-exactfive-profile0034-direct-blocker-radius-guard-system/v1"
RESULT_SCHEMA = "p97-exactfive-profile0034-direct-blocker-radius-guard-result/v1"
PARENT_SCHEMA = "p97-exactfive-profile0034-direct-physical-block-parent/v1"
GUARD_SCHEMA = "p97-exactfive-profile0034-source-proved-blocker-radius-guard/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-direct-blocker-radius-guard-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-direct-blocker-radius-guard-terminal/v1"
DESCRIPTOR_SCHEMA = adapter.QUERY_SCHEMA
SOLVER_PROFILE_SCHEMA = adapter.SOLVER_PROFILE_SCHEMA
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
_FULL_COMMIT = re.compile(r"[0-9a-f]{40}")

FALSE_CLAIMS = {
    "all_order_coverage": False,
    "closure": False,
    "formula_to_source_lift": False,
    "lean_ingress": False,
    "live_source_completeness": False,
    "promotion": False,
    "source_realization": False,
    "theorem": False,
}
OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_profile0034_direct_blocker_radius_guard_piqd.py",
    "census/card_head/tests/test_exactfive_profile0034_direct_blocker_radius_guard_piqd.py",
    "docs/specs/p97-exactfive-profile0034-direct-blocker-radius-guard-piqd-v1.md",
    "scripts/run_exactfive_profile0034_direct_blocker_radius_guard_piqd.py",
]


class DirectBlockerRadiusGuardError(RuntimeError):
    """The governed direct blocker-radius canary failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    """One immutable target or fresh-control PIQD query."""

    key: str
    solver: str
    kind: str
    branch: str | None
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=True,
        allow_nan=False,
        sort_keys=True,
        separators=(",", ":"),
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
        raise DirectBlockerRadiusGuardError(f"missing custody file: {path}") from exc
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
            raise DirectBlockerRadiusGuardError(f"unsafe custody file: {path}")
        chunks: list[bytes] = []
        remaining = info.st_size
        while remaining:
            chunk = os.read(descriptor, remaining)
            if not chunk:
                raise DirectBlockerRadiusGuardError(f"custody file changed: {path}")
            chunks.append(chunk)
            remaining -= len(chunk)
        if os.read(descriptor, 1):
            raise DirectBlockerRadiusGuardError(f"custody file changed: {path}")
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise DirectBlockerRadiusGuardError(f"{where} is not strict JSON") from exc
    if type(value) is not dict or _json(value) != payload:
        raise DirectBlockerRadiusGuardError(f"{where} is not canonical JSON")
    return value


def _publish_once(path: Path, payload: bytes) -> None:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(path, flags, 0o600)
    except FileExistsError:
        if _read(path) != payload:
            raise DirectBlockerRadiusGuardError("immutable artifact drifted")
        return
    except OSError as exc:
        raise DirectBlockerRadiusGuardError("create-once publication failed") from exc
    try:
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise DirectBlockerRadiusGuardError("short immutable artifact write")
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
        raise DirectBlockerRadiusGuardError("manifest path escapes repository") from exc


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
        raise DirectBlockerRadiusGuardError(f"git read failed: {where}")
    return completed.stdout


def _pinned_json(
    path: Path,
    file_sha: str,
    self_field: str,
    self_sha: str,
    where: str,
) -> dict[str, Any]:
    payload = _read(path)
    record = _strict(payload, where)
    if (
        _sha(payload) != file_sha
        or record.get(self_field) != self_sha
        or _self_hash(record, self_field) != self_sha
    ):
        raise DirectBlockerRadiusGuardError(f"{where} digest drifted")
    return record


def _parent_anchor_path(branch: str, name: str) -> Path:
    pin = ANCHOR_PINS[branch]
    return PARENT_ROOT / "artifacts" / pin["key"] / name


def _guard_record(parent_system: Mapping[str, Any]) -> dict[str, Any]:
    source_system = parent_system.get("source_system")
    role_class = source_system.get("role_class") if type(source_system) is dict else None
    if (
        type(role_class) is not dict
        or role_class.get("c2") != "c002"
        or role_class.get("O") != "c001"
        or role_class.get("U") != "c000"
    ):
        raise DirectBlockerRadiusGuardError("parent role class drifted")
    squared_distance = parent.source.predecessor._squared_distance
    left = squared_distance(parent.DIRECT_ORDER_ID, role_class["c2"], role_class["O"])
    right = squared_distance(parent.DIRECT_ORDER_ID, role_class["c2"], role_class["U"])
    assertion = f"(assert (< {left} {right}))"
    if assertion != GUARD_ASSERTION:
        raise DirectBlockerRadiusGuardError("source-proved guard encoding drifted")
    return {
        "schema": GUARD_SCHEMA,
        "lean_declaration": THEOREM_NAME,
        "lean_source_path": _repo_path(LEAN_SOURCE_PATH),
        "lean_source_sha256": LEAN_SOURCE_SHA256,
        "theorem_source_commit": THEOREM_SOURCE_COMMIT,
        "role_class": {"c2": "c002", "O": "c001", "U": "c000"},
        "coordinate_metric": "dx^2 + 3*dY^2",
        "relation": "<",
        "left": left,
        "right": right,
        "assertion": assertion,
        "lean_ingress_binding": None,
        "source_realization": False,
    }


def authenticate_parent_run() -> dict[str, Any]:
    """Authenticate the complete run-0003 and its exact full branch formulas."""
    if _sha(_read(Path(parent.__file__))) != PARENT_MODULE_SHA256:
        raise DirectBlockerRadiusGuardError("direct parent module drifted")
    if _sha(_read(Path(adapter.__file__))) != ADAPTER_SHA256:
        raise DirectBlockerRadiusGuardError("PIQD adapter drifted")
    if _sha(_read(LEAN_SOURCE_PATH)) != LEAN_SOURCE_SHA256:
        raise DirectBlockerRadiusGuardError("Lean theorem source drifted")

    manifest = _pinned_json(
        PARENT_MANIFEST_PATH,
        PARENT_PINS["manifest_file"],
        "manifest_sha256",
        PARENT_PINS["manifest"],
        "direct parent manifest",
    )
    launch = _pinned_json(
        PARENT_LAUNCH_PATH,
        PARENT_PINS["launch_file"],
        "launch_sha256",
        PARENT_PINS["launch"],
        "direct parent launch",
    )
    terminal_file = _pinned_json(
        PARENT_TERMINAL_PATH,
        PARENT_PINS["terminal_file"],
        "terminal_sha256",
        PARENT_PINS["terminal"],
        "direct parent terminal",
    )
    if launch.get("execution_head") != PARENT_PINS["execution_head"]:
        raise DirectBlockerRadiusGuardError("direct parent execution HEAD drifted")
    terminal = parent.verify_terminal_run(PARENT_ROOT)
    if terminal != terminal_file or terminal.get("status") != "NO_SMALLER_UNSAT_SUBSET_DISCOVERED":
        raise DirectBlockerRadiusGuardError("complete direct parent replay drifted")

    anchors: dict[str, Any] = {}
    systems: dict[str, Any] = {}
    for branch in BRANCH_IDS:
        pin = ANCHOR_PINS[branch]
        result_payload = _read(_parent_anchor_path(branch, "result.json"))
        result = _strict(result_payload, f"{branch} parent anchor result")
        system_payload = _read(_parent_anchor_path(branch, "system.json"))
        system = _strict(system_payload, f"{branch} parent anchor system")
        journal = _read(_parent_anchor_path(branch, "journal.smt2"))
        commands = parent.build_smt_commands(system)
        if (
            _sha(result_payload) != pin["result_file"]
            or result.get("result_sha256") != pin["result"]
            or parent._self_hash(result, "result_sha256") != pin["result"]
            or _sha(system_payload) != pin["system"]
            or result.get("system_sha256") != pin["system"]
            or _sha(journal) != pin["journal"]
            or result.get("journal_sha256") != pin["journal"]
            or journal != b"".join(command.encode("ascii") + b"\n" for command in commands)
            or result.get("disposition") != "UNKNOWN"
            or system.get("retained_group_ids") != list(parent.GROUP_UNIVERSE)
        ):
            raise DirectBlockerRadiusGuardError(f"{branch} parent full formula drifted")
        guard = _guard_record(system)
        guarded = journal + guard["assertion"].encode("ascii") + b"\n"
        if (
            _sha(guarded) != pin["guarded_journal"]
            or len(commands) != 177
            or sum(command.startswith("(assert ") for command in commands) != 156
        ):
            raise DirectBlockerRadiusGuardError(f"{branch} guarded formula pin drifted")
        anchors[branch] = {
            "key": pin["key"],
            "result_file_sha256": pin["result_file"],
            "result_sha256": pin["result"],
            "system_sha256": pin["system"],
            "journal_sha256": pin["journal"],
            "guarded_journal_sha256": pin["guarded_journal"],
        }
        systems[branch] = system

    record = {
        "schema": PARENT_SCHEMA,
        "manifest_file_sha256": PARENT_PINS["manifest_file"],
        "manifest_sha256": manifest["manifest_sha256"],
        "launch_file_sha256": PARENT_PINS["launch_file"],
        "launch_sha256": launch["launch_sha256"],
        "terminal_file_sha256": PARENT_PINS["terminal_file"],
        "terminal_sha256": terminal["terminal_sha256"],
        "execution_head": launch["execution_head"],
        "parent_module_sha256": PARENT_MODULE_SHA256,
        "adapter_sha256": ADAPTER_SHA256,
        "lean_source_sha256": LEAN_SOURCE_SHA256,
        "lean_declaration": THEOREM_NAME,
        "anchors": anchors,
        "anchor_systems": systems,
        "claims": dict(FALSE_CLAIMS),
    }
    record["parent_custody_sha256"] = _self_hash(record, "parent_custody_sha256")
    return record


def _validate_parent_custody(custody: Mapping[str, Any]) -> dict[str, Any]:
    """Require the exact pinned custody record, not merely a fresh self-hash."""
    bound = dict(custody)
    expected_fields = {
        "schema",
        "manifest_file_sha256",
        "manifest_sha256",
        "launch_file_sha256",
        "launch_sha256",
        "terminal_file_sha256",
        "terminal_sha256",
        "execution_head",
        "parent_module_sha256",
        "adapter_sha256",
        "lean_source_sha256",
        "lean_declaration",
        "anchors",
        "anchor_systems",
        "claims",
        "parent_custody_sha256",
    }
    expected_scalars = {
        "schema": PARENT_SCHEMA,
        "manifest_file_sha256": PARENT_PINS["manifest_file"],
        "manifest_sha256": PARENT_PINS["manifest"],
        "launch_file_sha256": PARENT_PINS["launch_file"],
        "launch_sha256": PARENT_PINS["launch"],
        "terminal_file_sha256": PARENT_PINS["terminal_file"],
        "terminal_sha256": PARENT_PINS["terminal"],
        "execution_head": PARENT_PINS["execution_head"],
        "parent_module_sha256": PARENT_MODULE_SHA256,
        "adapter_sha256": ADAPTER_SHA256,
        "lean_source_sha256": LEAN_SOURCE_SHA256,
        "lean_declaration": THEOREM_NAME,
        "claims": FALSE_CLAIMS,
    }
    if (
        set(bound) != expected_fields
        or any(bound.get(name) != value for name, value in expected_scalars.items())
        or bound.get("parent_custody_sha256")
        != _self_hash(bound, "parent_custody_sha256")
    ):
        raise DirectBlockerRadiusGuardError("parent custody identity drifted")
    anchors = bound.get("anchors")
    systems = bound.get("anchor_systems")
    if type(anchors) is not dict or type(systems) is not dict:
        raise DirectBlockerRadiusGuardError("parent custody branches are absent")
    if set(anchors) != set(BRANCH_IDS) or set(systems) != set(BRANCH_IDS):
        raise DirectBlockerRadiusGuardError("parent custody branch inventory drifted")
    for branch in BRANCH_IDS:
        pin = ANCHOR_PINS[branch]
        expected_anchor = {
            "key": pin["key"],
            "result_file_sha256": pin["result_file"],
            "result_sha256": pin["result"],
            "system_sha256": pin["system"],
            "journal_sha256": pin["journal"],
            "guarded_journal_sha256": pin["guarded_journal"],
        }
        system = systems[branch]
        if (
            anchors[branch] != expected_anchor
            or type(system) is not dict
            or _sha(_json(system)) != pin["system"]
        ):
            raise DirectBlockerRadiusGuardError(
                f"{branch} parent custody branch drifted"
            )
    return bound


def _plan(key: str) -> tuple[str, str, str]:
    plans = {row[0]: row[1:] for row in QUERY_PLAN}
    try:
        return plans[key]
    except KeyError as exc:
        raise DirectBlockerRadiusGuardError(f"unknown query key: {key}") from exc


def _build_system(
    key: str,
    custody: Mapping[str, Any],
) -> tuple[str, str | None, dict[str, Any]]:
    solver, kind, selector = _plan(key)
    if kind == "control":
        return solver, None, {
            "schema": SYSTEM_SCHEMA,
            "kind": "control",
            "key": key,
            "solver": solver,
            "control": selector,
            "variables": ["witness"],
            "claims": dict(FALSE_CLAIMS),
        }
    parent_system = custody.get("anchor_systems", {}).get(selector)
    if type(parent_system) is not dict:
        raise DirectBlockerRadiusGuardError("authenticated parent branch is absent")
    pin = ANCHOR_PINS[selector]
    return solver, selector, {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "key": key,
        "solver": solver,
        "branch": selector,
        "parent_anchor_key": pin["key"],
        "parent_system_sha256": pin["system"],
        "parent_journal_sha256": pin["journal"],
        "parent_system": parent_system,
        "guard": _guard_record(parent_system),
        "parent_custody_sha256": custody["parent_custody_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    if system.get("schema") != SYSTEM_SCHEMA or system.get("claims") != FALSE_CLAIMS:
        raise DirectBlockerRadiusGuardError("query system identity drifted")
    if system.get("kind") == "control":
        commands = [
            "(set-logic QF_NRA)",
            "(declare-fun witness () Real)",
            "(assert (= witness 1))",
        ]
        if system.get("control") == "negative":
            commands.append("(assert (= witness 2))")
        elif system.get("control") != "positive":
            raise DirectBlockerRadiusGuardError("control identity drifted")
        return tuple(commands)
    branch = system.get("branch")
    if system.get("kind") != "target" or branch not in BRANCH_IDS:
        raise DirectBlockerRadiusGuardError("target identity drifted")
    pin = ANCHOR_PINS[branch]
    parent_system = system.get("parent_system")
    guard = system.get("guard")
    if (
        type(parent_system) is not dict
        or system.get("parent_anchor_key") != pin["key"]
        or system.get("parent_system_sha256") != pin["system"]
        or system.get("parent_journal_sha256") != pin["journal"]
        or type(guard) is not dict
        or guard != _guard_record(parent_system)
    ):
        raise DirectBlockerRadiusGuardError("target parent or guard drifted")
    base = parent.build_smt_commands(parent_system)
    base_journal = b"".join(command.encode("ascii") + b"\n" for command in base)
    if _sha(base_journal) != pin["journal"] or guard["assertion"] in base:
        raise DirectBlockerRadiusGuardError("parent formula is not the frozen full formula")
    commands = (*base, guard["assertion"])
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    if (
        _sha(journal) != pin["guarded_journal"]
        or len(commands) != 178
        or sum(command.startswith("(assert ") for command in commands) != 157
        or commands.count(GUARD_ASSERTION) != 1
    ):
        raise DirectBlockerRadiusGuardError("guarded target formula drifted")
    return commands


def _journal(commands: Sequence[str]) -> bytes:
    return b"".join(command.encode("ascii") + b"\n" for command in commands)


def _manifest_sources() -> list[Path]:
    return [
        Path(__file__),
        TEST_PATH,
        SPEC_PATH,
        RUNNER_PATH,
        CHECKPOINT_PATH,
        Path(parent.__file__),
        Path(adapter.__file__),
        LEAN_SOURCE_PATH,
    ]


def _manifest_inputs() -> list[Path]:
    paths = [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
    for branch in BRANCH_IDS:
        for name in ("result.json", "system.json", "journal.smt2"):
            paths.append(_parent_anchor_path(branch, name))
    return sorted(paths)


def _snapshots(
    custody: Mapping[str, Any],
    system: Mapping[str, Any],
) -> tuple[adapter.SourceSnapshot, ...]:
    rows = [
        adapter.SourceSnapshot("0000-direct-parent-custody.json", _json(custody)),
        adapter.SourceSnapshot("0001-guarded-query-system.json", _json(system)),
    ]
    for index, path in enumerate(_manifest_sources()):
        rows.append(
            adapter.SourceSnapshot(
                f"source-{index:03d}-{_repo_path(path).replace('/', '--')}",
                _read(path),
            )
        )
    for index, path in enumerate(_manifest_inputs()):
        rows.append(
            adapter.SourceSnapshot(
                f"input-{index:03d}-{_repo_path(path).replace('/', '--')}",
                _read(path),
            )
        )
    names = [row.path for row in rows]
    if len(names) != len(set(names)):
        raise DirectBlockerRadiusGuardError("source snapshot names collided")
    return tuple(sorted(rows, key=lambda row: row.path))


def prepare_query(
    key: str,
    *,
    custody: Mapping[str, Any] | None = None,
    timeout_ms: int = TIMEOUT_MS,
) -> PreparedQuery:
    if type(timeout_ms) is bool or timeout_ms != TIMEOUT_MS:
        raise DirectBlockerRadiusGuardError("timeout must be exactly 300000ms")
    supplied = authenticate_parent_run() if custody is None else custody
    bound = _validate_parent_custody(supplied)
    solver, branch, system = _build_system(key, bound)
    commands = build_smt_commands(system)
    journal = _journal(commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise DirectBlockerRadiusGuardError("journal normalization drifted")
    text = journal.decode("ascii")
    if "(=>" in text or " Bool" in text or "(check-sat" in text:
        raise DirectBlockerRadiusGuardError("journal contains a guard proxy or solve command")
    variables_source = (
        system["variables"]
        if branch is None
        else system["parent_system"]["source_system"]["variables"]
    )
    variables = sorted(
        (
            {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
            for variable in variables_source
        ),
        key=lambda row: row["id"],
    )
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "journal_sha256": _sha(journal),
        "parent_custody_sha256": bound["parent_custody_sha256"],
        "finding_scope": (
            "authenticated-direct-full-formula-plus-source-proved-guard"
            if branch is not None
            else "fresh-transport-control-only"
        ),
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _snapshots(bound, system)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {
            "id": "p97-exactfive-profile0034-direct-blocker-radius-guard-piqd",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "profile0034-direct-blocker-radius-exact-rational-replay",
            "version": "v1",
        },
        "stage_id": "profile0034-direct-blocker-radius-guard-canary",
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
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [row["id"] for row in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": SOLVER_PROFILE_SCHEMA,
            "solvers": [solver],
            "timeout_ms": TIMEOUT_MS,
        },
    }
    query = adapter.SourceSemanticQuery(
        descriptor,
        _json(descriptor),
        journal,
        commands,
        journal,
        snapshots,
    )
    adapter.validate_authenticated_single_solver_query(
        query,
        solver=solver,
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=SOLVER_PROFILE_SCHEMA,
        authenticated_journal_commands=commands,
    )
    return PreparedQuery(key, solver, "target" if branch else "control", branch, system, query)


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    """Replay a SAT assignment over exact rationals or reject it conservatively."""
    if solver not in SOLVERS or type(model) is not str or type(values) is not str:
        raise DirectBlockerRadiusGuardError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    system = semantic.get("system") if type(semantic) is dict else None
    if (
        type(system) is not dict
        or system.get("solver") != solver
        or build_smt_commands(system) != query.journal_commands
        or query.descriptor_bytes != _json(query.descriptor)
        or query.original_smt2 != _journal(query.journal_commands)
        or query.journal_smt2 != query.original_smt2
        or query.descriptor.get("named_atoms") != []
        or query.descriptor.get("solve", {}).get("assumption_ids") != []
        or semantic.get("journal_sha256") != _sha(query.journal_smt2)
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise DirectBlockerRadiusGuardError("SAT replay custody crossed")
    try:
        if system["kind"] == "control":
            parsed = parent.source.bo_source.parse_exact_values(values, ("witness",))
            accepted = system["control"] == "positive" and parsed == {
                "witness": Fraction(1)
            }
            evidence: dict[str, Any] = {
                "accepted": accepted,
                "control": system["control"],
                "values": {key: str(value) for key, value in parsed.items()},
            }
        else:
            parent_system = system["parent_system"]
            coords = parent.source._parse_coordinates(
                values,
                query.get_values,
                parent.DIRECT_ORDER_ID,
            )
            evidence = parent._replay_target(parent_system, coords)
            role_class = parent_system["source_system"]["role_class"]
            left = parent.source._distance_value(
                coords, role_class["c2"], role_class["O"]
            )
            right = parent.source._distance_value(
                coords, role_class["c2"], role_class["U"]
            )
            guard_accepted = left < right
            evidence.update(
                {
                    "accepted": bool(evidence.get("accepted")) and guard_accepted,
                    "guard_accepted": guard_accepted,
                    "guard_left": str(left),
                    "guard_right": str(right),
                    "guard_assertion": GUARD_ASSERTION,
                    "lean_declaration": THEOREM_NAME,
                    "exact_coordinate_count": len(coords),
                }
            )
    except (
        KeyError,
        TypeError,
        ValueError,
        parent.DirectPhysicalBlockDeletionError,
        parent.source.Profile0034SupportingEdgeError,
        parent.source.bo_source.BoSourceQfnraError,
    ) as exc:
        evidence = {
            "accepted": False,
            "reason": "exact_readback_unsupported",
            "failure": type(exc).__name__,
        }
    evidence.update(
        {
            "solver": solver,
            "model_sha256": _sha(model.encode()),
            "values_sha256": _sha(values.encode()),
            "system_sha256": _sha(_canonical(system)),
        }
    )
    return adapter.SemanticVerification(bool(evidence.get("accepted")), evidence)


def _request_id(key: str) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


def _session_identity(prepared: PreparedQuery) -> tuple[str, str]:
    profile_sha256 = _sha(_canonical(prepared.query.descriptor["solver_profile"]))
    label = (
        f"p97-smt-source/{prepared.key}/{prepared.solver}/"
        f"{prepared.query.descriptor['semantic_sha256'][:12]}/"
        f"{_request_id(prepared.key)}/{profile_sha256[:12]}"
    )
    return label, profile_sha256


def classify_engine(prepared: PreparedQuery, engine: Mapping[str, Any]) -> str:
    """Classify one PIQD observation while validating its full session identity."""
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
        or engine.get("request_sha256")
        != adapter.piqd_solve_request_digest(prepared.query, ())
        or engine.get("assumption_labels") != []
        or engine.get("claims") != adapter.FALSE_CLAIMS
        or engine.get("resumed_from_receipt") is not False
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
        raise DirectBlockerRadiusGuardError("engine identity drifted")
    raw = engine.get("raw_status")
    effective = engine.get("effective_status")
    if (raw is None and engine.get("solve_index") is not None) or (
        raw is not None and engine.get("solve_index") != 1
    ):
        raise DirectBlockerRadiusGuardError("solve count drifted")
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
        ):
            raise DirectBlockerRadiusGuardError("raw UNSAT provenance drifted")
        disposition = "UNSAT_CUSTODY_VALID"
    elif raw == "SAT":
        replay = engine.get("semantic_replay")
        if (
            effective == "SAT_SEMANTICALLY_REPLAYED"
            and type(replay) is dict
            and replay.get("accepted") is True
        ):
            disposition = "SAT_REPLAYED"
        elif effective in {
            "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
            "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
        }:
            disposition = "SAT_REPLAY_REJECTED"
        else:
            raise DirectBlockerRadiusGuardError("SAT semantic status drifted")
    elif (
        raw == "UNKNOWN"
        and effective == "INCONCLUSIVE_UNKNOWN"
        and engine.get("unsat_assumptions") is None
        and engine.get("semantic_replay") is None
    ):
        disposition = "UNKNOWN"
    elif (
        raw is None
        and effective == "INCONCLUSIVE_TRANSPORT_LOSS"
        and engine.get("unsat_assumptions") is None
        and engine.get("semantic_replay") is None
    ):
        disposition = "TRANSPORT_LOST"
    else:
        raise DirectBlockerRadiusGuardError("engine status is unsupported")
    if prepared.kind == "control":
        expected = (
            "SAT_REPLAYED" if prepared.key.endswith("positive") else "UNSAT_CUSTODY_VALID"
        )
        if disposition != expected:
            raise DirectBlockerRadiusGuardError("fresh solver control failed")
    return disposition


def _fd_artifacts(descriptor: int) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for name in sorted(os.listdir(descriptor)):
        if not name or "/" in name or "\\" in name:
            raise DirectBlockerRadiusGuardError("staged artifact name is unsafe")
        handle = os.open(
            name,
            os.O_RDONLY | getattr(os, "O_NONBLOCK", 0) | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=descriptor,
        )
        try:
            info = os.fstat(handle)
            if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
                raise DirectBlockerRadiusGuardError("staged artifact is unsafe")
            chunks: list[bytes] = []
            remaining = info.st_size
            while remaining:
                chunk = os.read(handle, remaining)
                if not chunk:
                    raise DirectBlockerRadiusGuardError("staged artifact changed")
                chunks.append(chunk)
                remaining -= len(chunk)
            if os.read(handle, 1):
                raise DirectBlockerRadiusGuardError("staged artifact changed")
            payload = b"".join(chunks)
        finally:
            os.close(handle)
        rows.append(_artifact_record(name, payload))
    return rows


def _result_record(
    prepared: PreparedQuery,
    state: str,
    engine: Mapping[str, Any] | None,
    artifacts: list[dict[str, Any]],
    failure: str | None,
) -> dict[str, Any]:
    record = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": prepared.solver,
        "kind": prepared.kind,
        "branch": prepared.branch,
        "system_sha256": _sha(_json(prepared.system)),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "assertion_count": sum(
            command.startswith("(assert ") for command in prepared.query.journal_commands
        ),
        "command_count": len(prepared.query.journal_commands),
        "state": state,
        "engine": None if engine is None else dict(engine),
        "failure_type": failure,
        "artifacts": artifacts,
        "finding_scope": (
            "authenticated-direct-full-formula-plus-source-proved-guard"
            if prepared.kind == "target"
            else "fresh-transport-control-only"
        ),
        "claims": dict(FALSE_CLAIMS),
    }
    record["result_sha256"] = _self_hash(record, "result_sha256")
    return record


def run_cell(
    prepared: PreparedQuery,
    output: Path,
    transport: adapter.PiqdTransport,
) -> dict[str, Any]:
    """Run one fresh PIQD session into a create-once artifact directory."""
    if output.exists() or output.is_symlink():
        raise DirectBlockerRadiusGuardError("canary cells cannot resume")
    with adapter.SmtOutputTransaction(output) as transaction:
        for name, payload in (
            ("source-record.json", _json(prepared.system)),
            ("descriptor.json", prepared.query.descriptor_bytes),
            ("original.smt2", prepared.query.original_smt2),
            ("journal.smt2", prepared.query.journal_smt2),
        ):
            transaction.write_bytes(name, payload)
        for index, snapshot in enumerate(prepared.query.source_files):
            transaction.write_bytes(
                f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin",
                snapshot.payload,
            )
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
                used_session_ids=set(),
                request_id=_request_id(prepared.key),
                assumption_labels=(),
            )
            transaction.write_bytes("engine-observation.json", _json(engine))
            state = classify_engine(prepared, engine)
        except (OSError, adapter.SmtSourceAdapterError, DirectBlockerRadiusGuardError) as exc:
            state = "FAILED_CUSTODY"
            failure = type(exc).__name__
        artifacts = _fd_artifacts(transaction.file_descriptor)
        result = _result_record(prepared, state, engine, artifacts, failure)
        transaction.write_bytes("result.json", _json(result))
        transaction.publish()
    return verify_cell_tree(prepared, output)


def verify_cell_tree(prepared: PreparedQuery, output: Path) -> dict[str, Any]:
    """Verify one immutable cell without contacting PIQD."""
    if output.is_symlink() or not output.is_dir():
        raise DirectBlockerRadiusGuardError("cell output directory is unsafe")
    result = _strict(_read(output / "result.json"), "cell result")
    if (
        result.get("schema") != RESULT_SCHEMA
        or result.get("key") != prepared.key
        or result.get("solver") != prepared.solver
        or result.get("kind") != prepared.kind
        or result.get("branch") != prepared.branch
        or result.get("system_sha256") != _sha(_json(prepared.system))
        or result.get("journal_sha256") != _sha(prepared.query.journal_smt2)
        or result.get("assertion_count")
        != sum(
            command.startswith("(assert ") for command in prepared.query.journal_commands
        )
        or result.get("command_count") != len(prepared.query.journal_commands)
        or result.get("claims") != FALSE_CLAIMS
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
    ):
        raise DirectBlockerRadiusGuardError("cell result identity drifted")
    seen = {"result.json"}
    payloads: dict[str, bytes] = {}
    rows = result.get("artifacts")
    if type(rows) is not list:
        raise DirectBlockerRadiusGuardError("cell artifact inventory is malformed")
    for item in rows:
        if type(item) is not dict or set(item) != {"path", "bytes", "sha256"}:
            raise DirectBlockerRadiusGuardError("cell artifact record is malformed")
        name = item["path"]
        if (
            type(name) is not str
            or not name
            or name in seen
            or "/" in name
            or "\\" in name
        ):
            raise DirectBlockerRadiusGuardError("cell artifact name is unsafe")
        payload = _read(output / name)
        if item["bytes"] != len(payload) or item["sha256"] != _sha(payload):
            raise DirectBlockerRadiusGuardError("cell artifact digest drifted")
        seen.add(name)
        payloads[name] = payload
    if (
        payloads.get("source-record.json") != _json(prepared.system)
        or payloads.get("descriptor.json") != prepared.query.descriptor_bytes
        or payloads.get("original.smt2") != prepared.query.original_smt2
        or payloads.get("journal.smt2") != prepared.query.journal_smt2
    ):
        raise DirectBlockerRadiusGuardError("cell source custody crossed")
    expected_sources = {
        f"source-{index:04d}-{_sha(row.payload)[:16]}.bin": row.payload
        for index, row in enumerate(prepared.query.source_files)
    }
    if any(payloads.get(name) != payload for name, payload in expected_sources.items()):
        raise DirectBlockerRadiusGuardError("cell source snapshot crossed")
    entries = list(output.iterdir())
    if (
        {entry.name for entry in entries} != seen
        or any(
            entry.is_symlink()
            or not entry.is_file()
            or entry.stat(follow_symlinks=False).st_nlink != 1
            for entry in entries
        )
    ):
        raise DirectBlockerRadiusGuardError("cell contains unsafe or unbound artifacts")
    engine = result.get("engine")
    if result.get("state") == "FAILED_CUSTODY":
        if type(result.get("failure_type")) is not str or (
            engine is not None and payloads.get("engine-observation.json") != _json(engine)
        ):
            raise DirectBlockerRadiusGuardError("failed cell lacks failure custody")
    else:
        if (
            type(engine) is not dict
            or payloads.get("engine-observation.json") != _json(engine)
            or classify_engine(prepared, engine) != result.get("state")
            or result.get("failure_type") is not None
        ):
            raise DirectBlockerRadiusGuardError("cell engine custody drifted")
        engine_artifacts = engine.get("artifacts")
        if type(engine_artifacts) is not dict:
            raise DirectBlockerRadiusGuardError("engine artifact inventory is malformed")
        by_name = {item["path"]: item for item in rows}
        for item in engine_artifacts.values():
            if (
                type(item) is not dict
                or set(item) != {"path", "bytes", "sha256"}
                or by_name.get(item["path"]) != item
            ):
                raise DirectBlockerRadiusGuardError("engine artifact custody crossed")
    return result


def _load_checkpoint() -> dict[str, Any]:
    try:
        checkpoint = adapter._strict_json(_read(CHECKPOINT_PATH), "lane checkpoint")
    except Exception as exc:
        raise DirectBlockerRadiusGuardError("lane checkpoint is not strict JSON") from exc
    if (
        type(checkpoint) is not dict
        or set(checkpoint)
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
        or checkpoint.get("owned_paths") != OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise DirectBlockerRadiusGuardError("lane checkpoint drifted")
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
        raise DirectBlockerRadiusGuardError("run root escapes repository") from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise DirectBlockerRadiusGuardError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise DirectBlockerRadiusGuardError("run ancestor is unsafe")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    """Create or authenticate the manifest-only registered run root."""
    _require_safe_root()
    RUN_ROOT.parent.mkdir(parents=True, exist_ok=True)
    if RUN_ROOT.is_symlink() or (RUN_ROOT.exists() and not RUN_ROOT.is_dir()):
        raise DirectBlockerRadiusGuardError("run root is unsafe")
    RUN_ROOT.mkdir(mode=0o700, exist_ok=True)
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists() or manifest_path.is_symlink():
        manifest = _strict(_read(manifest_path), "run manifest")
        created_utc = manifest.get("created_utc")
        if type(created_utc) is not str or manifest != _expected_manifest(created_utc):
            raise DirectBlockerRadiusGuardError("run manifest drifted")
    else:
        if tuple(RUN_ROOT.iterdir()):
            raise DirectBlockerRadiusGuardError("unregistered run payload exists")
        created_utc = (
            dt.datetime.now(dt.UTC)
            .replace(microsecond=0)
            .isoformat()
            .replace("+00:00", "Z")
        )
        manifest = _expected_manifest(created_utc)
        _publish_once(manifest_path, _json(manifest))
    return RUN_ROOT, manifest


def _authenticate_source_commit(manifest: Mapping[str, Any], commit: object) -> str:
    if type(commit) is not str or _FULL_COMMIT.fullmatch(commit) is None:
        raise DirectBlockerRadiusGuardError("execution commit is malformed")
    digests = manifest.get("source_digests")
    expected = sorted(_repo_path(path) for path in _manifest_sources())
    if type(digests) is not dict or sorted(digests) != expected:
        raise DirectBlockerRadiusGuardError("source inventory drifted")
    for relative in expected:
        current = _read(REPOSITORY_ROOT / relative)
        committed = _git_read(("show", f"{commit}:{relative}"), relative)
        if digests.get(relative) != _sha(current) or committed != current:
            raise DirectBlockerRadiusGuardError("recorded source commit drifted")
    return commit


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    raw = _git_read(("rev-parse", "--verify", "HEAD^{commit}"), "current commit")
    try:
        commit = raw.decode("ascii").strip()
    except UnicodeDecodeError as exc:
        raise DirectBlockerRadiusGuardError("execution commit is malformed") from exc
    if raw != f"{commit}\n".encode():
        raise DirectBlockerRadiusGuardError("execution commit is malformed")
    return _authenticate_source_commit(manifest, commit)


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
        raise DirectBlockerRadiusGuardError("PIQD server URL is invalid")
    return server.rstrip("/")


def _inventory(root: Path) -> str:
    if root.is_symlink() or not root.is_dir():
        raise DirectBlockerRadiusGuardError("run root is unsafe")
    names = {entry.name for entry in root.iterdir()}
    if names == {"run_manifest.json"}:
        return "INITIALIZED"
    if names != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise DirectBlockerRadiusGuardError("run inventory drifted")
    for name in ("artifacts", "events", "tmp"):
        path = root / name
        if path.is_symlink() or not path.is_dir():
            raise DirectBlockerRadiusGuardError("runtime directory is unsafe")
    if tuple((root / "tmp").iterdir()):
        raise DirectBlockerRadiusGuardError("runtime tmp is not empty")
    event_names = {entry.name for entry in (root / "events").iterdir()}
    artifact_names = {entry.name for entry in (root / "artifacts").iterdir()}
    if not event_names and not artifact_names:
        return "RUNTIME_READY"
    if event_names == {"launch.json"} and artifact_names <= set(QUERY_KEYS):
        return "LAUNCHED"
    if event_names == {"launch.json", "terminal.json"} and artifact_names == set(
        QUERY_KEYS
    ):
        return "TERMINAL"
    raise DirectBlockerRadiusGuardError("incomplete run cannot resume")


def _launch_record(
    manifest: Mapping[str, Any],
    commit: str,
    server: str,
    workers: int,
) -> dict[str, Any]:
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
        "solvers": list(SOLVERS),
        "branches": list(BRANCH_IDS),
        "fresh_controls": {
            solver: [
                f"{solver}-control-positive",
                f"{solver}-control-negative",
            ]
            for solver in SOLVERS
        },
        "assumptions": False,
        "resume": False,
        "transport": "maintained PIQD HTTP SMT adapter only",
        "claims": dict(FALSE_CLAIMS),
    }
    record["launch_sha256"] = _self_hash(record, "launch_sha256")
    return record


def _terminal_record(
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    custody: Mapping[str, Any],
    results: Mapping[str, Mapping[str, Any]],
) -> dict[str, Any]:
    if set(results) != set(QUERY_KEYS):
        raise DirectBlockerRadiusGuardError("terminal cell inventory is incomplete")
    states = {key: results[key]["state"] for key in QUERY_KEYS}
    for solver in SOLVERS:
        if (
            states[f"{solver}-control-positive"] != "SAT_REPLAYED"
            or states[f"{solver}-control-negative"] != "UNSAT_CUSTODY_VALID"
        ):
            raise DirectBlockerRadiusGuardError(f"fresh {solver} controls failed")
    agreements: dict[str, bool] = {}
    for branch in BRANCH_IDS:
        left = states[f"z3-target-{branch}"]
        right = states[f"cvc5-target-{branch}"]
        agreements[branch] = left == right and left in {
            "UNSAT_CUSTODY_VALID",
            "SAT_REPLAYED",
        }
    all_unsat = all(
        states[f"{solver}-target-{branch}"] == "UNSAT_CUSTODY_VALID"
        for solver in SOLVERS
        for branch in BRANCH_IDS
    )
    all_sat = all(
        states[f"{solver}-target-{branch}"] == "SAT_REPLAYED"
        for solver in SOLVERS
        for branch in BRANCH_IDS
    )
    guard = _guard_record(custody["anchor_systems"][BRANCH_IDS[0]])
    record = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "parent_custody_sha256": custody["parent_custody_sha256"],
        "status": (
            "GUARDED_BRANCHES_CROSS_ENGINE_UNSAT"
            if all_unsat
            else "GUARDED_BRANCHES_CROSS_ENGINE_SAT_REPLAYED"
            if all_sat
            else "TARGET_INCONCLUSIVE"
        ),
        "cells": {
            key: {
                "state": states[key],
                "result_sha256": results[key]["result_sha256"],
            }
            for key in QUERY_KEYS
        },
        "cross_engine_agreement": agreements,
        "fresh_controls": {solver: True for solver in SOLVERS},
        "guard": guard,
        "finding_scope": "two-authenticated-full-formulas-plus-one-source-proved-guard-each",
        "claims": dict(FALSE_CLAIMS),
    }
    record["terminal_sha256"] = _self_hash(record, "terminal_sha256")
    return record


def verify_terminal_run(
    root: Path,
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    custody: Mapping[str, Any],
) -> dict[str, Any]:
    """Verify every artifact and receipt without PIQD or any solver process."""
    if root.is_symlink() or not root.is_dir():
        raise DirectBlockerRadiusGuardError("terminal root is unsafe")
    if root.resolve() != RUN_ROOT.resolve():
        raise DirectBlockerRadiusGuardError("terminal root is not the registered run root")
    bound = _validate_parent_custody(custody)
    stored_manifest = _strict(_read(root / "run_manifest.json"), "run manifest")
    created_utc = stored_manifest.get("created_utc")
    if (
        dict(manifest) != stored_manifest
        or type(created_utc) is not str
        or stored_manifest != _expected_manifest(created_utc)
    ):
        raise DirectBlockerRadiusGuardError("run manifest authentication drifted")
    stored_launch = _strict(_read(root / "events/launch.json"), "launch")
    server = stored_launch.get("server")
    workers = stored_launch.get("workers")
    commit = _authenticate_source_commit(
        stored_manifest, stored_launch.get("execution_commit")
    )
    if (
        dict(launch) != stored_launch
        or type(server) is not str
        or type(workers) is not int
        or not 1 <= workers <= MAX_WORKERS
        or stored_launch
        != _launch_record(
            stored_manifest,
            commit,
            _validate_server(server),
            workers,
        )
    ):
        raise DirectBlockerRadiusGuardError("launch authentication drifted")
    terminal = _strict(_read(root / "events/terminal.json"), "terminal")
    prepared = {key: prepare_query(key, custody=bound) for key in QUERY_KEYS}
    results = {
        key: verify_cell_tree(prepared[key], root / "artifacts" / key)
        for key in QUERY_KEYS
    }
    expected = _terminal_record(stored_manifest, stored_launch, bound, results)
    if terminal != expected:
        raise DirectBlockerRadiusGuardError("terminal record drifted")
    session_ids = [
        result["engine"].get("session_id")
        for result in results.values()
        if type(result.get("engine")) is dict
    ]
    if len(session_ids) != len(set(session_ids)):
        raise DirectBlockerRadiusGuardError("cell session identities crossed")
    if _inventory(root) != "TERMINAL":
        raise DirectBlockerRadiusGuardError("terminal inventory drifted")
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
    """Initialize, execute, or offline-verify the eight-cell governed canary."""
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or timeout_s != DEFAULT_TIMEOUT_S
    ):
        raise DirectBlockerRadiusGuardError("timeout is fixed at 300 seconds")
    if type(workers) is bool or type(workers) is not int or not 1 <= workers <= MAX_WORKERS:
        raise DirectBlockerRadiusGuardError("workers must be between 1 and 20")
    custody = authenticate_parent_run()
    if check_parent:
        return {
            "status": "PARENT_AUTHENTICATED",
            "parent_custody_sha256": custody["parent_custody_sha256"],
            "lean_declaration": THEOREM_NAME,
            "lean_source_sha256": LEAN_SOURCE_SHA256,
        }
    root, manifest = ensure_run_root()
    phase = _inventory(root)
    if init_only:
        if phase != "INITIALIZED":
            raise DirectBlockerRadiusGuardError("init-only requires an initialized root")
        return {
            "status": "INITIALIZED",
            "run_manifest_sha256": manifest["manifest_sha256"],
        }
    if verify:
        if phase != "TERMINAL":
            raise DirectBlockerRadiusGuardError("offline verify requires a terminal run")
        launch = _strict(_read(root / "events/launch.json"), "launch")
        commit = _authenticate_source_commit(manifest, launch.get("execution_commit"))
        stored_server = launch.get("server")
        stored_workers = launch.get("workers")
        if (
            type(stored_server) is not str
            or type(stored_workers) is not int
            or launch
            != _launch_record(
                manifest,
                commit,
                _validate_server(stored_server),
                stored_workers,
            )
        ):
            raise DirectBlockerRadiusGuardError("offline launch record drifted")
        return verify_terminal_run(root, manifest, launch, custody)

    server = _validate_server(server)
    if phase == "TERMINAL":
        launch = _strict(_read(root / "events/launch.json"), "launch")
        commit = _authenticate_source_commit(manifest, launch.get("execution_commit"))
        if launch != _launch_record(manifest, commit, server, workers):
            raise DirectBlockerRadiusGuardError("terminal launch replay drifted")
        return verify_terminal_run(root, manifest, launch, custody)
    if phase != "INITIALIZED":
        raise DirectBlockerRadiusGuardError(
            "incomplete run cannot resume; use a fresh registered run id"
        )

    commit = authenticate_execution_commit(manifest)
    launch = _launch_record(manifest, commit, server, workers)
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(mode=0o700)
    _publish_once(root / "events/launch.json", _json(launch))
    active_transport = transport or adapter.UrllibPiqdTransport(
        server,
        http_timeout_s=DEFAULT_TIMEOUT_S + 40,
    )
    prepared = {key: prepare_query(key, custody=custody) for key in QUERY_KEYS}
    results: dict[str, dict[str, Any]] = {}
    with concurrent.futures.ThreadPoolExecutor(
        max_workers=min(workers, len(QUERY_KEYS))
    ) as executor:
        futures = {
            key: executor.submit(
                run_cell,
                prepared[key],
                root / "artifacts" / key,
                active_transport,
            )
            for key in QUERY_KEYS
        }
        for key in QUERY_KEYS:
            results[key] = futures[key].result()
    terminal = _terminal_record(manifest, launch, custody, results)
    _publish_once(root / "events/terminal.json", _json(terminal))
    return verify_terminal_run(root, manifest, launch, custody)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-seconds", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=DEFAULT_WORKERS)
    parser.add_argument("--init-only", action="store_true")
    parser.add_argument("--verify", action="store_true")
    parser.add_argument("--check-parent", action="store_true")
    args = parser.parse_args(argv)
    result = run_campaign(
        server=args.server,
        timeout_s=args.timeout_seconds,
        workers=args.workers,
        init_only=args.init_only,
        verify=args.verify,
        check_parent=args.check_parent,
    )
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
