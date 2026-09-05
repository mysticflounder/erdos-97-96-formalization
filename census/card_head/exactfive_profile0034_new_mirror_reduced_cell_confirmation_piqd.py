"""Governed cross-engine confirmation of two reduced profile-0034 cells.

All solver observations are finite-formula discovery evidence.  This producer
makes no source, theorem, Lean-ingress, closure, or promotion claim.
"""

from __future__ import annotations

import argparse
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
    exactfive_profile0034_new_mirror_physical_block_deletion_recovery_piqd as parent,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-profile0034-new-mirror-reduced-cell-confirmation-piqd-20260905"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
TEST_PATH = REPOSITORY_ROOT / (
    "census/card_head/tests/test_exactfive_profile0034_new_mirror_"
    "reduced_cell_confirmation_piqd.py"
)
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-profile0034-new-mirror-reduced-cell-"
    "confirmation-piqd-v1.md"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_profile0034_new_mirror_reduced_cell_confirmation_piqd.py"
)

CHECKPOINT_OWNER = "profile0034-new-mirror-reduced-cell-confirmation-piqd"
CHECKPOINT_BASE_HEAD = "6628bc27d0d23fbbe3969419f66e232dfcb209a4"
DEFAULT_TIMEOUT_S = 60.0
TIMEOUT_MS = 60_000
WORKERS = 1
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
TARGET_PINS = {
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
QUERY_PLAN = (
    ("z3-target-gt", "z3", "gt"),
    ("cvc5-target-gt", "cvc5", "gt"),
    ("z3-target-lt", "z3", "lt"),
    ("cvc5-target-lt", "cvc5", "lt"),
    ("cvc5-control-positive", "cvc5", "positive"),
    ("cvc5-control-negative", "cvc5", "negative"),
)
QUERY_KEYS = tuple(row[0] for row in QUERY_PLAN)
CONTROL_KEYS = QUERY_KEYS[-2:]

PARENT_ROOT = parent.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PINS = {
    "manifest_file": "cf18023cad0efcc3d673aa97416ce83253c6379d31839eaf268013cc087d606b",
    "manifest": "13a6d03f7d1fef460a39c5a459313dee510667a1410f5a7093c810754887190b",
    "launch_file": "2f4d3896eef6eaeb5c8a361d9e6f1a1c699971628d941f8dcbc6161f621a3d0e",
    "launch": "ae4575b2fadd05f66c212d554169e9793a64c4d338ca4c388a8ded931f97858b",
    "terminal_file": "cf60033581e03ef1b429fe4261b10488426cbd380ad2296ac005e1f42697acdc",
    "terminal": "97dd3a900e5df1304fee6614c687af24ddc5ed3a00212acdce18a371338aa1f8",
    "execution_commit": "eab46043e52350b1ffa805325acb4d2577655659",
}

SYSTEM_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-cell-system/v1"
DESCRIPTOR_SCHEMA = "p97-smt-source-semantic-descriptor/v1"
SOLVER_PROFILE_SCHEMA = "piqd-solver-profile/v1"
RESULT_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-cell-result/v1"
PARENT_SCHEMA = "p97-exactfive-profile0034-new-mirror-recovery-parent/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-cell-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-cell-terminal/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
_FULL_COMMIT = re.compile(r"[0-9a-f]{40}")

FALSE_CLAIMS = {
    "all_profile_execution": False,
    "core_minimality": False,
    "lean_ingress": False,
    "live_closure": False,
    "live_source_completeness": False,
    "promotion": False,
    "source_realization": False,
    "theorem": False,
}
_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_profile0034_new_mirror_reduced_cell_confirmation_piqd.py",
    "census/card_head/tests/test_exactfive_profile0034_new_mirror_reduced_cell_confirmation_piqd.py",
    "docs/specs/p97-exactfive-profile0034-new-mirror-reduced-cell-confirmation-piqd-v1.md",
    "scripts/run_exactfive_profile0034_new_mirror_reduced_cell_confirmation_piqd.py",
]


class ReducedCellConfirmationError(RuntimeError):
    """The reduced-cell confirmation lane failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    solver: str
    kind: str
    branch: str | None
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
        raise ReducedCellConfirmationError(f"missing custody file: {path}") from exc
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
            raise ReducedCellConfirmationError(f"unsafe custody file: {path}")
        chunks: list[bytes] = []
        remaining = info.st_size
        while remaining:
            chunk = os.read(descriptor, remaining)
            if not chunk:
                raise ReducedCellConfirmationError(f"custody file changed: {path}")
            chunks.append(chunk)
            remaining -= len(chunk)
        if os.read(descriptor, 1):
            raise ReducedCellConfirmationError(f"custody file changed: {path}")
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise ReducedCellConfirmationError(f"{where} is not strict JSON") from exc
    if type(value) is not dict or _json(value) != payload:
        raise ReducedCellConfirmationError(f"{where} is not canonical JSON")
    return value


def _publish_once(path: Path, payload: bytes) -> None:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(path, flags, 0o600)
    except FileExistsError:
        if _read(path) != payload:
            raise ReducedCellConfirmationError("immutable artifact drifted")
        return
    except OSError as exc:
        raise ReducedCellConfirmationError("create-once publication failed") from exc
    try:
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise ReducedCellConfirmationError("short immutable artifact write")
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
        raise ReducedCellConfirmationError("manifest path escapes repository") from exc


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
        raise ReducedCellConfirmationError(f"git read failed: {where}")
    return completed.stdout


def _pinned_json(path: Path, file_sha: str, self_field: str, self_sha: str, where: str) -> dict[str, Any]:
    payload = _read(path)
    record = _strict(payload, where)
    if _sha(payload) != file_sha or record.get(self_field) != self_sha or _self_hash(record, self_field) != self_sha:
        raise ReducedCellConfirmationError(f"{where} digest drifted")
    return record


def authenticate_parent_run() -> dict[str, Any]:
    """Authenticate the complete recovery run and both retained cells."""
    root, manifest = parent.ensure_run_root()
    if root != PARENT_ROOT or _sha(_read(PARENT_MANIFEST_PATH)) != PARENT_PINS["manifest_file"]:
        raise ReducedCellConfirmationError("recovery manifest file drifted")
    if manifest.get("manifest_sha256") != PARENT_PINS["manifest"]:
        raise ReducedCellConfirmationError("recovery manifest drifted")
    launch = _pinned_json(
        PARENT_LAUNCH_PATH, PARENT_PINS["launch_file"], "launch_sha256", PARENT_PINS["launch"], "recovery launch"
    )
    terminal_file = _pinned_json(
        PARENT_TERMINAL_PATH, PARENT_PINS["terminal_file"], "terminal_sha256", PARENT_PINS["terminal"], "recovery terminal"
    )
    if launch.get("execution_commit") != PARENT_PINS["execution_commit"]:
        raise ReducedCellConfirmationError("recovery execution commit drifted")
    source_parent = parent.authenticate_parent_runs()
    parent.authenticate_recorded_execution_commit(manifest, launch)
    terminal = parent.verify_terminal_run(root, manifest, launch, source_parent)
    if terminal != terminal_file or terminal.get("status") != "PHYSICAL_BLOCK_DELETION_COMPLETE":
        raise ReducedCellConfirmationError("recovery terminal validation drifted")
    if terminal.get("query_count") != 60 or terminal.get("claims") != parent.FALSE_CLAIMS:
        raise ReducedCellConfirmationError("recovery terminal scope drifted")
    for branch in BRANCH_IDS:
        report = terminal.get("branches", {}).get(branch)
        pin = TARGET_PINS[branch]
        if (
            type(report) is not dict
            or report.get("final_group_ids") != list(BRANCH_GROUP_IDS[branch])
            or report.get("final_sha256") != pin["group_sha256"]
            or report.get("selected_result", {}).get("disposition") != "UNSAT_CUSTODY_VALID"
        ):
            raise ReducedCellConfirmationError(f"recovery {branch} final cell drifted")
    queries = terminal.get("queries")
    if type(queries) is not dict or len(queries) != 60:
        raise ReducedCellConfirmationError("recovery query inventory drifted")
    z3_controls = {}
    for key, expected in (("z3-control-positive", "SAT_REPLAYED"), ("z3-control-negative", "UNSAT_CUSTODY_VALID")):
        row = queries.get(key)
        if type(row) is not dict or row.get("disposition") != expected:
            raise ReducedCellConfirmationError("recovery Z3 control drifted")
        z3_controls[key] = {
            "disposition": expected,
            "result_sha256": row["result_sha256"],
        }
    record = {
        "schema": PARENT_SCHEMA,
        "manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "terminal_sha256": terminal["terminal_sha256"],
        "execution_commit": launch["execution_commit"],
        "query_result_sha256s": {key: queries[key]["result_sha256"] for key in sorted(queries)},
        "z3_controls": z3_controls,
        "branch_groups": {branch: list(BRANCH_GROUP_IDS[branch]) for branch in BRANCH_IDS},
        "branch_journal_sha256s": {branch: TARGET_PINS[branch]["journal_sha256"] for branch in BRANCH_IDS},
        "branch_group_sha256s": {branch: TARGET_PINS[branch]["group_sha256"] for branch in BRANCH_IDS},
        "source_systems": {branch: source_parent["source_systems"][branch] for branch in BRANCH_IDS},
        "claims": dict(FALSE_CLAIMS),
    }
    record["parent_custody_sha256"] = _self_hash(record, "parent_custody_sha256")
    return record


def _plan(key: str) -> tuple[str, str]:
    plans = {item[0]: item[1:] for item in QUERY_PLAN}
    try:
        return plans[key]
    except KeyError as exc:
        raise ReducedCellConfirmationError(f"unknown query key: {key}") from exc


def _build_system(key: str, custody: Mapping[str, Any]) -> tuple[str, str | None, dict[str, Any]]:
    solver, selector = _plan(key)
    if selector in BRANCH_IDS:
        source = custody.get("source_systems", {}).get(selector)
        if type(source) is not dict:
            raise ReducedCellConfirmationError("authenticated branch source is absent")
        groups = BRANCH_GROUP_IDS[selector]
        system = {
            "schema": SYSTEM_SCHEMA,
            "kind": "target",
            "key": key,
            "solver": solver,
            "branch": selector,
            "source_system": source,
            "retained_group_ids": list(groups),
            "omitted_group_ids": [item for item in parent.GROUP_UNIVERSE if item not in groups],
            "parent_custody_sha256": custody["parent_custody_sha256"],
            "claims": dict(FALSE_CLAIMS),
        }
        return solver, selector, system
    source = parent.deletion.build_control_system(selector)
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
    return solver, None, system


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    if type(system) is not dict or system.get("schema") != SYSTEM_SCHEMA or system.get("claims") != FALSE_CLAIMS:
        raise ReducedCellConfirmationError("system is malformed")
    if system.get("kind") == "control":
        return tuple(parent.deletion._build_smt_commands_current(system["source_system"]))
    if system.get("kind") != "target" or system.get("branch") not in BRANCH_IDS:
        raise ReducedCellConfirmationError("system kind is invalid")
    branch = system["branch"]
    if system.get("retained_group_ids") != list(BRANCH_GROUP_IDS[branch]):
        raise ReducedCellConfirmationError("retained groups drifted")
    return parent.reconstruct_unguarded_commands(system["source_system"], BRANCH_GROUP_IDS[branch])


def _journal(commands: Sequence[str]) -> bytes:
    return b"".join(command.encode("ascii") + b"\n" for command in commands)


def _manifest_sources() -> list[Path]:
    return [
        Path(__file__), TEST_PATH, SPEC_PATH, RUNNER_PATH, CHECKPOINT_PATH,
        Path(parent.__file__), Path(parent.deletion.__file__), Path(adapter.__file__),
    ]


def _manifest_inputs() -> list[Path]:
    paths = [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
    terminal = _strict(_read(PARENT_TERMINAL_PATH), "recovery terminal")
    for key in terminal.get("queries", {}):
        paths.append(PARENT_ROOT / "artifacts" / key / "result.json")
    for report in terminal.get("branches", {}).values():
        if type(report) is dict:
            for row in report.get("round_files", []):
                if type(row) is dict and type(row.get("path")) is str:
                    paths.append(PARENT_ROOT / row["path"])
    return sorted(set(paths))


def _snapshots(custody: Mapping[str, Any], system: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
    rows = [
        adapter.SourceSnapshot("0000-recovery-parent-custody.json", _json(custody)),
        adapter.SourceSnapshot("0001-reduced-system.json", _json(system)),
    ]
    for index, path in enumerate(_manifest_sources()):
        rows.append(adapter.SourceSnapshot(f"source-{index:03d}-{_repo_path(path).replace('/', '--')}", _read(path)))
    for index, path in enumerate(_manifest_inputs()):
        rows.append(adapter.SourceSnapshot(f"input-{index:03d}-{_repo_path(path).replace('/', '--')}", _read(path)))
    names = [row.path for row in rows]
    if len(names) != len(set(names)):
        raise ReducedCellConfirmationError("source snapshot names collided")
    return tuple(sorted(rows, key=lambda row: row.path))


def prepare_query(key: str, *, custody: Mapping[str, Any] | None = None, timeout_ms: int = TIMEOUT_MS) -> PreparedQuery:
    if timeout_ms != TIMEOUT_MS or type(timeout_ms) is bool:
        raise ReducedCellConfirmationError("timeout must be 60000ms")
    bound = dict(custody or authenticate_parent_run())
    if bound.get("parent_custody_sha256") != _self_hash(bound, "parent_custody_sha256"):
        raise ReducedCellConfirmationError("parent custody is not self-hashed")
    solver, branch, system = _build_system(key, bound)
    commands = build_smt_commands(system)
    journal = _journal(commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise ReducedCellConfirmationError("journal normalization drifted")
    text = journal.decode("ascii")
    if "(=>" in text or " Bool" in text or "(check-sat" in text:
        raise ReducedCellConfirmationError("journal contains guards or solve commands")
    if branch is not None:
        pin = TARGET_PINS[branch]
        assertions = sum(command.startswith("(assert ") for command in commands)
        if (_sha(journal), assertions, len(commands), len(journal)) != (
            pin["journal_sha256"], pin["assertions"], pin["commands"], pin["bytes"]
        ):
            raise ReducedCellConfirmationError(f"{branch} journal pin drifted")
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
        "finding_scope": "reduced-unguarded-cell-only",
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _snapshots(bound, system)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-profile0034-new-mirror-reduced-cell-confirmation-piqd", "version": "v1"},
        "semantic_verifier": {"id": "profile0034-reduced-cell-exact-rational-replay", "version": "v1"},
        "stage_id": "profile0034-new-mirror-reduced-cell-confirmation",
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
    return PreparedQuery(key, solver, "target" if branch else "control", branch, system, query)


def verify_sat_model(query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None) -> adapter.SemanticVerification:
    if solver not in {"z3", "cvc5"} or type(model) is not str or type(values) is not str:
        raise ReducedCellConfirmationError("SAT replay payload is malformed")
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
        raise ReducedCellConfirmationError("SAT replay custody crossed")
    try:
        if system["kind"] == "control":
            parsed = parent.deletion._parse_control_value(values)
            accepted = system["control"] == "positive" and parsed == {"t": Fraction(1)}
            evidence: dict[str, Any] = {"accepted": accepted, "control": system["control"], "values": {key: str(value) for key, value in parsed.items()}}
        else:
            coords = parent.deletion._parse_coordinates(values, query.get_values)
            replay_system = {
                "source_system": system["source_system"],
                "retained_group_ids": system["retained_group_ids"],
            }
            evidence = parent._replay_target(replay_system, coords)
            evidence["exact_coordinate_count"] = len(coords)
            evidence["free_coordinate_count"] = len(query.get_values)
    except (parent.Profile0034PhysicalBlockDeletionError, parent.deletion.Profile0034NewMirrorSupportingEdgeError, parent.deletion.bo_source.BoSourceQfnraError, KeyError, TypeError, ValueError) as exc:
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


def classify_engine(prepared: PreparedQuery, engine: Mapping[str, Any]) -> str:
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
        raise ReducedCellConfirmationError("engine identity drifted")
    raw = engine.get("raw_status")
    effective = engine.get("effective_status")
    if (raw is None and engine.get("solve_index") is not None) or (
        raw is not None and engine.get("solve_index") != 1
    ):
        raise ReducedCellConfirmationError("solve count drifted")
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
            raise ReducedCellConfirmationError("raw UNSAT provenance drifted")
        disposition = "UNSAT_CUSTODY_VALID"
    elif raw == "SAT":
        semantic = engine.get("semantic_replay")
        if effective == "SAT_SEMANTICALLY_REPLAYED" and type(semantic) is dict and semantic.get("accepted") is True:
            disposition = "SAT_REPLAYED"
        elif effective in {"INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED", "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE"}:
            disposition = "SAT_REPLAY_UNRESOLVED"
        else:
            raise ReducedCellConfirmationError("SAT semantic status drifted")
    elif raw == "UNKNOWN" and effective == "INCONCLUSIVE_UNKNOWN" and engine.get("unsat_assumptions") is None and engine.get("semantic_replay") is None:
        disposition = "UNKNOWN"
    elif raw is None and effective == "INCONCLUSIVE_TRANSPORT_LOSS" and engine.get("unsat_assumptions") is None and engine.get("semantic_replay") is None:
        disposition = "TRANSPORT_LOST"
    else:
        raise ReducedCellConfirmationError("engine status is unsupported")
    if prepared.kind == "control":
        expected = "SAT_REPLAYED" if prepared.key.endswith("positive") else "UNSAT_CUSTODY_VALID"
        if disposition != expected:
            raise ReducedCellConfirmationError("fresh cvc5 control failed")
    return disposition


def _fd_artifacts(descriptor: int) -> list[dict[str, Any]]:
    rows = []
    for name in sorted(os.listdir(descriptor)):
        if not name or "/" in name or "\\" in name:
            raise ReducedCellConfirmationError("staged artifact name is unsafe")
        handle = os.open(name, os.O_RDONLY | getattr(os, "O_NONBLOCK", 0) | getattr(os, "O_NOFOLLOW", 0), dir_fd=descriptor)
        try:
            info = os.fstat(handle)
            if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
                raise ReducedCellConfirmationError("staged artifact is unsafe")
            chunks, remaining = [], info.st_size
            while remaining:
                chunk = os.read(handle, remaining)
                if not chunk:
                    raise ReducedCellConfirmationError("staged artifact changed")
                chunks.append(chunk)
                remaining -= len(chunk)
            if os.read(handle, 1):
                raise ReducedCellConfirmationError("staged artifact changed")
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
        "system_sha256": _sha(_json(prepared.system)),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "assertion_count": sum(command.startswith("(assert ") for command in prepared.query.journal_commands),
        "command_count": len(prepared.query.journal_commands),
        "state": state,
        "engine": None if engine is None else dict(engine),
        "failure_type": failure,
        "artifacts": artifacts,
        "finding_scope": "reduced-unguarded-cell-only" if prepared.kind == "target" else "transport-control-only",
        "claims": dict(FALSE_CLAIMS),
    }
    record["result_sha256"] = _self_hash(record, "result_sha256")
    return record


def run_cell(prepared: PreparedQuery, output: Path, transport: adapter.PiqdTransport, used_session_ids: set[str]) -> dict[str, Any]:
    if output.exists() or output.is_symlink():
        raise ReducedCellConfirmationError("confirmation cells cannot resume")
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
        except (OSError, adapter.SmtSourceAdapterError, ReducedCellConfirmationError) as exc:
            state = "FAILED_CUSTODY"
            failure = type(exc).__name__
        artifacts = _fd_artifacts(transaction.file_descriptor)
        result = _result_record(prepared, state, engine, artifacts, failure)
        transaction.write_bytes("result.json", _json(result))
        transaction.publish()
    return verify_cell_tree(prepared, output)


def verify_cell_tree(prepared: PreparedQuery, output: Path) -> dict[str, Any]:
    if output.is_symlink() or not output.is_dir():
        raise ReducedCellConfirmationError("cell output directory is unsafe")
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
            command.startswith("(assert ")
            for command in prepared.query.journal_commands
        )
        or result.get("command_count") != len(prepared.query.journal_commands)
        or result.get("claims") != FALSE_CLAIMS
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
    ):
        raise ReducedCellConfirmationError("cell result identity drifted")
    seen = {"result.json"}
    payloads: dict[str, bytes] = {}
    if type(result.get("artifacts")) is not list:
        raise ReducedCellConfirmationError("cell artifact inventory is malformed")
    for item in result["artifacts"]:
        if type(item) is not dict or set(item) != {"path", "bytes", "sha256"}:
            raise ReducedCellConfirmationError("cell artifact record is malformed")
        name = item["path"]
        if type(name) is not str or not name or name in seen or "/" in name or "\\" in name:
            raise ReducedCellConfirmationError("cell artifact name is unsafe")
        payload = _read(output / name)
        if item["bytes"] != len(payload) or item["sha256"] != _sha(payload):
            raise ReducedCellConfirmationError("cell artifact digest drifted")
        seen.add(name)
        payloads[name] = payload
    if (
        payloads.get("source-record.json") != _json(prepared.system)
        or payloads.get("descriptor.json") != prepared.query.descriptor_bytes
        or payloads.get("original.smt2") != prepared.query.original_smt2
        or payloads.get("journal.smt2") != prepared.query.journal_smt2
    ):
        raise ReducedCellConfirmationError("cell source custody crossed")
    expected_sources = {f"source-{index:04d}-{_sha(row.payload)[:16]}.bin": row.payload for index, row in enumerate(prepared.query.source_files)}
    if any(payloads.get(name) != payload for name, payload in expected_sources.items()):
        raise ReducedCellConfirmationError("cell source snapshot crossed")
    entries = list(output.iterdir())
    if {entry.name for entry in entries} != seen or any(entry.is_symlink() or not entry.is_file() or entry.stat(follow_symlinks=False).st_nlink != 1 for entry in entries):
        raise ReducedCellConfirmationError("cell contains unsafe or unbound artifacts")
    engine = result.get("engine")
    if result.get("state") == "FAILED_CUSTODY":
        if type(result.get("failure_type")) is not str or (
            engine is not None
            and payloads.get("engine-observation.json") != _json(engine)
        ):
            raise ReducedCellConfirmationError("failed cell lacks failure type")
    else:
        if type(engine) is not dict or payloads.get("engine-observation.json") != _json(engine) or classify_engine(prepared, engine) != result.get("state") or result.get("failure_type") is not None:
            raise ReducedCellConfirmationError("cell engine custody drifted")
        engine_artifacts = engine.get("artifacts")
        if type(engine_artifacts) is not dict:
            raise ReducedCellConfirmationError("engine artifact inventory is malformed")
        by_name = {item["path"]: item for item in result["artifacts"]}
        for item in engine_artifacts.values():
            if (
                type(item) is not dict
                or set(item) != {"path", "bytes", "sha256"}
                or by_name.get(item["path"]) != item
            ):
                raise ReducedCellConfirmationError("engine artifact custody crossed")
    return result


def _load_checkpoint() -> dict[str, Any]:
    try:
        checkpoint = adapter._strict_json(_read(CHECKPOINT_PATH), "lane checkpoint")
    except Exception as exc:
        raise ReducedCellConfirmationError("lane checkpoint is not strict JSON") from exc
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
        raise ReducedCellConfirmationError("lane checkpoint drifted")
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
        raise ReducedCellConfirmationError("run root escapes repository") from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise ReducedCellConfirmationError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise ReducedCellConfirmationError("run ancestor is unsafe")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_root()
    RUN_ROOT.parent.mkdir(parents=True, exist_ok=True)
    if RUN_ROOT.is_symlink() or (RUN_ROOT.exists() and not RUN_ROOT.is_dir()):
        raise ReducedCellConfirmationError("run root is unsafe")
    RUN_ROOT.mkdir(mode=0o700, exist_ok=True)
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists() or manifest_path.is_symlink():
        manifest = _strict(_read(manifest_path), "run manifest")
        created = manifest.get("created_utc")
        if type(created) is not str or manifest != _expected_manifest(created):
            raise ReducedCellConfirmationError("run manifest drifted")
    else:
        if tuple(RUN_ROOT.iterdir()):
            raise ReducedCellConfirmationError("unregistered run payload exists")
        created = dt.datetime.now(dt.UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
        manifest = _expected_manifest(created)
        _publish_once(manifest_path, _json(manifest))
    return RUN_ROOT, manifest


def _authenticate_source_commit(manifest: Mapping[str, Any], commit: object) -> str:
    if type(commit) is not str or _FULL_COMMIT.fullmatch(commit) is None:
        raise ReducedCellConfirmationError("execution commit is malformed")
    digests = manifest.get("source_digests")
    expected = sorted(_repo_path(path) for path in _manifest_sources())
    if type(digests) is not dict or sorted(digests) != expected:
        raise ReducedCellConfirmationError("source inventory drifted")
    for relative in expected:
        current = _read(REPOSITORY_ROOT / relative)
        if digests.get(relative) != _sha(current) or _git_read(("show", f"{commit}:{relative}"), relative) != current:
            raise ReducedCellConfirmationError("recorded source commit drifted")
    return commit


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    raw = _git_read(("rev-parse", "--verify", "HEAD^{commit}"), "current commit")
    try:
        commit = raw.decode("ascii").strip()
    except UnicodeDecodeError as exc:
        raise ReducedCellConfirmationError("execution commit is malformed") from exc
    if raw != f"{commit}\n".encode():
        raise ReducedCellConfirmationError("execution commit is malformed")
    return _authenticate_source_commit(manifest, commit)


def _validate_server(server: str) -> str:
    parsed = urllib.parse.urlsplit(server)
    if parsed.scheme not in {"http", "https"} or not parsed.netloc or parsed.username is not None or parsed.password is not None or parsed.query or parsed.fragment:
        raise ReducedCellConfirmationError("PIQD server URL is invalid")
    return server.rstrip("/")


def _inventory(root: Path) -> str:
    if root.is_symlink() or not root.is_dir():
        raise ReducedCellConfirmationError("run root is unsafe")
    names = {entry.name for entry in root.iterdir()}
    if names == {"run_manifest.json"}:
        return "INITIALIZED"
    if names != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise ReducedCellConfirmationError("run inventory drifted")
    for name in ("artifacts", "events", "tmp"):
        path = root / name
        if path.is_symlink() or not path.is_dir():
            raise ReducedCellConfirmationError("runtime directory is unsafe")
    if tuple((root / "tmp").iterdir()):
        raise ReducedCellConfirmationError("runtime tmp is not empty")
    event_names = {entry.name for entry in (root / "events").iterdir()}
    artifact_names = {entry.name for entry in (root / "artifacts").iterdir()}
    if not event_names and not artifact_names:
        return "RUNTIME_READY"
    if event_names == {"launch.json"} and artifact_names <= set(QUERY_KEYS):
        return "LAUNCHED"
    if event_names == {"launch.json", "terminal.json"} and artifact_names == set(QUERY_KEYS):
        return "TERMINAL"
    raise ReducedCellConfirmationError("incomplete run cannot resume")


def _launch_record(manifest: Mapping[str, Any], commit: str, server: str) -> dict[str, Any]:
    record = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_commit": commit,
        "server": server,
        "timeout_ms": TIMEOUT_MS,
        "workers": WORKERS,
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
        raise ReducedCellConfirmationError("terminal cell inventory is incomplete")
    states = {key: results[key]["state"] for key in QUERY_KEYS}
    if states["cvc5-control-positive"] != "SAT_REPLAYED" or states["cvc5-control-negative"] != "UNSAT_CUSTODY_VALID":
        raise ReducedCellConfirmationError("fresh cvc5 controls failed")
    agreements = {}
    for branch in BRANCH_IDS:
        left, right = states[f"z3-target-{branch}"], states[f"cvc5-target-{branch}"]
        agreements[branch] = left == right and left in {"UNSAT_CUSTODY_VALID", "SAT_REPLAYED"}
    record = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "parent_custody_sha256": custody["parent_custody_sha256"],
        "status": (
            "REDUCED_CELLS_CROSS_ENGINE_UNSAT"
            if all(
                states[f"{solver}-target-{branch}"] == "UNSAT_CUSTODY_VALID"
                for solver in ("z3", "cvc5")
                for branch in BRANCH_IDS
            )
            else "TARGET_INCONCLUSIVE"
        ),
        "cells": {key: {"state": states[key], "result_sha256": results[key]["result_sha256"]} for key in QUERY_KEYS},
        "cross_engine_agreement": agreements,
        "imported_z3_controls": custody["z3_controls"],
        "finding_scope": "reduced-unguarded-cells-only",
        "claims": dict(FALSE_CLAIMS),
    }
    record["terminal_sha256"] = _self_hash(record, "terminal_sha256")
    return record


def verify_terminal_run(root: Path, manifest: Mapping[str, Any], launch: Mapping[str, Any], custody: Mapping[str, Any]) -> dict[str, Any]:
    terminal = _strict(_read(root / "events/terminal.json"), "terminal")
    prepared = {key: prepare_query(key, custody=custody) for key in QUERY_KEYS}
    results = {key: verify_cell_tree(prepared[key], root / "artifacts" / key) for key in QUERY_KEYS}
    expected = _terminal_record(manifest, launch, custody, results)
    if terminal != expected:
        raise ReducedCellConfirmationError("terminal record drifted")
    session_ids = [
        result["engine"].get("session_id")
        for result in results.values()
        if type(result.get("engine")) is dict
    ]
    if len(set(session_ids)) != len(session_ids):
        raise ReducedCellConfirmationError("cell session identities crossed")
    return terminal


def run_campaign(*, server: str = "http://127.0.0.1:7272", timeout_s: float = DEFAULT_TIMEOUT_S, workers: int = WORKERS, init_only: bool = False, verify: bool = False, check_parent: bool = False, transport: adapter.PiqdTransport | None = None) -> dict[str, Any]:
    if type(timeout_s) not in {int, float} or type(timeout_s) is bool or not math.isfinite(timeout_s) or timeout_s != DEFAULT_TIMEOUT_S:
        raise ReducedCellConfirmationError("timeout is fixed at 60 seconds")
    if workers != WORKERS or type(workers) is bool:
        raise ReducedCellConfirmationError("workers must be exactly 1")
    root, manifest = ensure_run_root()
    custody = authenticate_parent_run()
    if check_parent:
        return {"status": "PARENT_AUTHENTICATED", "parent_custody_sha256": custody["parent_custody_sha256"]}
    phase = _inventory(root)
    if init_only:
        if phase != "INITIALIZED":
            raise ReducedCellConfirmationError("init-only requires an initialized root")
        return {"status": "INITIALIZED", "run_manifest_sha256": manifest["manifest_sha256"]}
    if verify:
        if phase != "TERMINAL":
            raise ReducedCellConfirmationError("offline verify requires a terminal run")
        launch = _strict(_read(root / "events/launch.json"), "launch")
        commit = _authenticate_source_commit(manifest, launch.get("execution_commit"))
        stored_server = launch.get("server")
        if type(stored_server) is not str or launch != _launch_record(
            manifest, commit, _validate_server(stored_server)
        ):
            raise ReducedCellConfirmationError("offline launch record drifted")
        return verify_terminal_run(root, manifest, launch, custody)
    server = _validate_server(server)
    if phase == "TERMINAL":
        launch = _strict(_read(root / "events/launch.json"), "launch")
        _authenticate_source_commit(manifest, launch.get("execution_commit"))
        if launch != _launch_record(manifest, launch["execution_commit"], server):
            raise ReducedCellConfirmationError("terminal launch replay drifted")
        return verify_terminal_run(root, manifest, launch, custody)
    if phase != "INITIALIZED":
        raise ReducedCellConfirmationError("incomplete run cannot resume; use a fresh run id")
    commit = authenticate_execution_commit(manifest)
    launch = _launch_record(manifest, commit, server)
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(mode=0o700)
    _publish_once(root / "events/launch.json", _json(launch))
    active_transport = transport or adapter.UrllibPiqdTransport(server, http_timeout_s=DEFAULT_TIMEOUT_S + 40)
    prepared = {key: prepare_query(key, custody=custody) for key in QUERY_KEYS}
    results: dict[str, dict[str, Any]] = {}
    used_session_ids: set[str] = set()
    for key in QUERY_KEYS:
        results[key] = run_cell(prepared[key], root / "artifacts" / key, active_transport, used_session_ids)
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
    except (ReducedCellConfirmationError, adapter.SmtSourceAdapterError, OSError, ValueError) as exc:
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
    "ReducedCellConfirmationError",
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
