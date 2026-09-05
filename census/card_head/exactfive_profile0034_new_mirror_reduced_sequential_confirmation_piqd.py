"""Governed sequential confirmation of two reduced profile-0034 cells.

This is a fresh Z3-only replay lane.  Its finite observations are discovery
evidence; all theorem, source, minimality, simultaneous, and promotion claims
remain false.
"""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
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
    exactfive_profile0034_new_mirror_reduced_singleton_deletion_piqd as parent,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-profile0034-new-mirror-reduced-sequential-confirmation-piqd-20260905"
RUN_ID = "run-0003"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
TEST_PATH = REPOSITORY_ROOT / "census/card_head/tests/test_exactfive_profile0034_new_mirror_reduced_sequential_confirmation_piqd.py"
SPEC_PATH = REPOSITORY_ROOT / "docs/specs/p97-exactfive-profile0034-new-mirror-reduced-sequential-confirmation-piqd-v1.md"
RUNNER_PATH = REPOSITORY_ROOT / "scripts/run_exactfive_profile0034_new_mirror_reduced_sequential_confirmation_piqd.py"
CHECKPOINT_OWNER = "profile0034-new-mirror-reduced-sequential-confirmation-piqd"
CHECKPOINT_BASE_HEAD = "7e56f18e3ff88e01845c36a3646e77806ba1eda4"
OWNED_PATHS = [f".codex/worktree-checkpoints/{LANE_ID}.json", "census/card_head/exactfive_profile0034_new_mirror_reduced_sequential_confirmation_piqd.py", "census/card_head/tests/test_exactfive_profile0034_new_mirror_reduced_sequential_confirmation_piqd.py", "docs/specs/p97-exactfive-profile0034-new-mirror-reduced-sequential-confirmation-piqd-v1.md", "scripts/run_exactfive_profile0034_new_mirror_reduced_sequential_confirmation_piqd.py"]
DEFAULT_TIMEOUT_S = 60.0
TIMEOUT_MS = 60_000
WORKERS = 1
BRANCH_IDS = ("gt", "lt")
GT_GROUP_IDS = ("edge-index-00", "edge-index-01", "edge-index-03", "edge-index-04", "source-row-equality-00", "source-row-equality-03", "source-row-equality-05")
LT_GROUP_IDS = ("edge-index-00", "edge-index-01", "edge-index-03", "edge-index-04", "edge-index-06", "source-row-equality-02", "source-row-equality-03", "source-row-equality-05")
BRANCH_GROUP_IDS = {"gt": GT_GROUP_IDS, "lt": LT_GROUP_IDS}
TARGET_PINS = {
    "gt": {"journal_sha256": "bfdb51b1f0a6cbecc0a1b54431306ec1f83559198c4036effacd8d184c654cef", "assertions": 47, "commands": 68, "bytes": 5208},
    "lt": {"journal_sha256": "591f548fffb00671704c08ec284891e525a01fcd8891e5d1191f35ffa249b64d", "assertions": 58, "commands": 79, "bytes": 6183},
}
QUERY_PLAN = (("z3-target-gt", "z3", "gt"), ("z3-target-lt", "z3", "lt"), ("z3-control-positive", "z3", "positive"), ("z3-control-negative", "z3", "negative"))
QUERY_KEYS = tuple(row[0] for row in QUERY_PLAN)
CONTROL_KEYS = QUERY_KEYS[-2:]
PARENT_ROOT = parent.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PINS = {
    "manifest_file": "c1cd49737ecfd92e359f54d9d8454f47aa7ab9a41cb194652f3364ab0cae1ad4",
    "manifest": "a019d04b982f95b50bc170d059f3266b5cb022072609a1b299debec9b4718e59",
    "launch_file": "b6dbc5b4ab08cba3c60ef4cc2315973faf69926099a4bbcc8049770be1abf85e",
    "launch": "7b4cf3b5d8f11e9a02dd9921bf6baa85676e54246f5fc19f09b8eb75843928ed",
    "terminal_file": "ce23dad47b839ab48e0603f2c9a5c0ca120a0505123bd8394133831ab48b35b7",
    "terminal": "f901fb71afa12381287a16f647934e07dfa490455d6310a532cf8cea1b215b7b",
    "execution_commit": "ac9a1f89b81782f1a596290a340ad10dc29c23aa",
    "custody": "6f70dbf7d81353bfd815df50e43f3e048331aa365178bd8872c9c1f922899a9d",
}
SYSTEM_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-sequential-confirmation-system/v1"
DESCRIPTOR_SCHEMA = "p97-smt-source-semantic-descriptor/v1"
SOLVER_PROFILE_SCHEMA = "piqd-solver-profile/v1"
RESULT_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-sequential-confirmation-result/v1"
PARENT_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-sequential-parent/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-sequential-confirmation-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-new-mirror-reduced-sequential-confirmation-terminal/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
FALSE_CLAIMS = {"all_profile_execution": False, "core_minimality": False, "formula_minimality": False, "lean_ingress": False, "live_closure": False, "live_source_completeness": False, "promotion": False, "source_realization": False, "simultaneous_removability": False, "theorem": False}
ENGINE_KEYS = frozenset({"solver", "session_id", "solver_signature", "solver_sha256", "raw_status", "effective_status", "solve_index", "result_sha256", "response_lost", "reconciled_from_receipt", "reconciliation_attempts", "result_digest_advisory", "unsat_assumptions", "semantic_replay", "artifacts", "claims", "request_id", "request_sha256", "assumption_labels", "request_replay_attempted", "request_replayed", "resumed_from_receipt", "session_lifecycle"})


class SequentialConfirmationError(RuntimeError):
    """The sequential confirmation lane failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    solver: str
    kind: str
    branch: str | None
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(value, ensure_ascii=True, allow_nan=False, sort_keys=True, separators=(",", ":")).encode("ascii")


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _read(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        fd = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    except OSError as exc:
        raise SequentialConfirmationError(f"missing custody file: {path}") from exc
    try:
        info = os.fstat(fd)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
            raise SequentialConfirmationError(f"unsafe custody file: {path}")
        data = os.read(fd, info.st_size)
        if len(data) != info.st_size or os.read(fd, 1):
            raise SequentialConfirmationError(f"custody file changed: {path}")
        return data
    finally:
        os.close(fd)


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    value = adapter._strict_json(payload, where)
    if type(value) is not dict or _json(value) != payload:
        raise SequentialConfirmationError(f"{where} is not canonical JSON")
    return value


def _publish_once(path: Path, payload: bytes) -> None:
    try:
        fd = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0), 0o600)
    except FileExistsError:
        if _read(path) != payload:
            raise SequentialConfirmationError("immutable artifact drifted")
        return
    except OSError as exc:
        raise SequentialConfirmationError("create-once publication failed") from exc
    try:
        os.write(fd, payload)
        os.fsync(fd)
    finally:
        os.close(fd)


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise SequentialConfirmationError("manifest path escapes repository") from exc


def _source_paths() -> list[Path]:
    return [Path(__file__), TEST_PATH, SPEC_PATH, RUNNER_PATH, CHECKPOINT_PATH, Path(parent.__file__), Path(parent.parent.__file__), Path(parent.parent.parent.__file__), Path(adapter.__file__)]


def _snapshots(custody: Mapping[str, Any], system: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
    paths = [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
    terminal = _strict(_read(PARENT_TERMINAL_PATH), "singleton terminal")
    paths.extend(PARENT_ROOT / "artifacts" / key / "result.json" for key in terminal.get("cells", {}))
    rows = [adapter.SourceSnapshot("0000-parent-custody.json", _json(custody)), adapter.SourceSnapshot("0001-sequential-system.json", _json(system))]
    rows.extend(adapter.SourceSnapshot(f"source-{i:03d}-{_repo_path(p).replace('/', '--')}", _read(p)) for i, p in enumerate(_source_paths()))
    rows.extend(adapter.SourceSnapshot(f"input-{i:03d}-{_repo_path(p).replace('/', '--')}", _read(p)) for i, p in enumerate(sorted(set(paths))))
    if len({row.path for row in rows}) != len(rows):
        raise SequentialConfirmationError("source snapshot names collided")
    return tuple(sorted(rows, key=lambda row: row.path))


def authenticate_parent_run() -> dict[str, Any]:
    """Authenticate the completed singleton run and bind all nineteen results."""
    if PARENT_ROOT != parent.RUN_ROOT or _sha(_read(PARENT_MANIFEST_PATH)) != PARENT_PINS["manifest_file"]:
        raise SequentialConfirmationError("singleton manifest file drifted")
    manifest = _strict(_read(PARENT_MANIFEST_PATH), "singleton manifest")
    if manifest.get("manifest_sha256") != PARENT_PINS["manifest"]:
        raise SequentialConfirmationError("singleton manifest drifted")
    launch = _strict(_read(PARENT_LAUNCH_PATH), "singleton launch")
    terminal = _strict(_read(PARENT_TERMINAL_PATH), "singleton terminal")
    if _sha(_read(PARENT_LAUNCH_PATH)) != PARENT_PINS["launch_file"] or launch.get("launch_sha256") != PARENT_PINS["launch"] or _self_hash(launch, "launch_sha256") != PARENT_PINS["launch"]:
        raise SequentialConfirmationError("singleton launch drifted")
    if _sha(_read(PARENT_TERMINAL_PATH)) != PARENT_PINS["terminal_file"] or terminal.get("terminal_sha256") != PARENT_PINS["terminal"] or _self_hash(terminal, "terminal_sha256") != PARENT_PINS["terminal"]:
        raise SequentialConfirmationError("singleton terminal drifted")
    if launch.get("execution_commit") != PARENT_PINS["execution_commit"] or launch.get("workers") != 20 or launch.get("queries") != list(parent.QUERY_KEYS) or terminal.get("query_count") != 19 or terminal.get("status") != "SINGLETON_DELETION_GRID_COMPLETE" or terminal.get("claims") != parent.FALSE_CLAIMS:
        raise SequentialConfirmationError("singleton execution scope drifted")
    singleton_custody = parent.authenticate_parent_run()
    parent._authenticate_source_commit(manifest, launch.get("execution_commit"))
    parent.verify_terminal_run(PARENT_ROOT, manifest, launch, singleton_custody)
    custody = parent.parent.authenticate_parent_run()
    if custody.get("parent_custody_sha256") != "bbaafb1f39e161ff7387fc6d489643152f9d0e14cd9a5570e2d8c08371930487":
        raise SequentialConfirmationError("reduced-cell custody drifted")
    result_digests = {
        key: row["result_sha256"] for key, row in terminal.get("cells", {}).items()
    }
    if len(result_digests) != 19 or any(type(value) is not str for value in result_digests.values()):
        raise SequentialConfirmationError("singleton result inventory is not nineteen records")
    for key, digest in result_digests.items():
        result = _strict(_read(PARENT_ROOT / "artifacts" / key / "result.json"), f"singleton result {key}")
        if result.get("result_sha256") != digest or _self_hash(result, "result_sha256") != digest:
            raise SequentialConfirmationError(f"singleton result drifted: {key}")
    return {"schema": PARENT_SCHEMA, "manifest_sha256": manifest["manifest_sha256"], "launch_sha256": launch["launch_sha256"], "terminal_sha256": terminal["terminal_sha256"], "execution_commit": launch["execution_commit"], "singleton_result_sha256s": dict(sorted(result_digests.items())), "source_systems": dict(custody["source_systems"]), "branch_groups": {branch: list(BRANCH_GROUP_IDS[branch]) for branch in BRANCH_IDS}, "claims": dict(FALSE_CLAIMS), "singleton_custody_sha256": PARENT_PINS["custody"], "parent_custody_sha256": PARENT_PINS["custody"]}


def _plan(key: str) -> tuple[str, str]:
    try:
        return next((solver, selector) for query, solver, selector in QUERY_PLAN if query == key)
    except StopIteration as exc:
        raise SequentialConfirmationError(f"unknown query key: {key}") from exc


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    if type(system) is not dict or system.get("schema") != SYSTEM_SCHEMA or system.get("claims") != FALSE_CLAIMS:
        raise SequentialConfirmationError("system is malformed")
    if system.get("kind") == "target":
        branch = system.get("branch")
        if branch not in BRANCH_IDS or system.get("retained_group_ids") != list(BRANCH_GROUP_IDS[branch]):
            raise SequentialConfirmationError("target groups drifted")
        return tuple(parent.parent.parent.reconstruct_unguarded_commands(system["source_system"], BRANCH_GROUP_IDS[branch]))
    if system.get("kind") == "control":
        return tuple(parent.parent.parent.deletion._build_smt_commands_current(system["source_system"]))
    raise SequentialConfirmationError("system kind is invalid")


def prepare_query(key: str, *, custody: Mapping[str, Any] | None = None, timeout_ms: int = TIMEOUT_MS) -> PreparedQuery:
    if type(timeout_ms) is bool or timeout_ms != TIMEOUT_MS:
        raise SequentialConfirmationError("timeout must be 60000ms")
    bound = dict(custody or authenticate_parent_run())
    if bound.get("parent_custody_sha256") != PARENT_PINS["custody"] or len(bound.get("singleton_result_sha256s", {})) != 19:
        raise SequentialConfirmationError("parent custody drifted")
    solver, selector = _plan(key)
    if selector in BRANCH_IDS:
        source = bound["source_systems"].get(selector)
        system = {"schema": SYSTEM_SCHEMA, "kind": "target", "key": key, "solver": solver, "branch": selector, "source_system": source, "retained_group_ids": list(BRANCH_GROUP_IDS[selector]), "omitted_group_ids": [x for x in parent.parent.parent.GROUP_UNIVERSE if x not in BRANCH_GROUP_IDS[selector]], "parent_custody_sha256": bound["parent_custody_sha256"], "finding_scope": "fresh sequential reduced unguarded cell", "claims": dict(FALSE_CLAIMS)}
    else:
        system = {"schema": SYSTEM_SCHEMA, "kind": "control", "key": key, "solver": solver, "control": selector, "source_system": parent.parent.parent.deletion.build_control_system(selector), "retained_group_ids": [], "omitted_group_ids": [], "parent_custody_sha256": bound["parent_custody_sha256"], "finding_scope": "fresh transport control", "claims": dict(FALSE_CLAIMS)}
    commands = build_smt_commands(system)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal or any(token in journal.decode("ascii") for token in ("(=>", " Bool", "(check-sat")):
        raise SequentialConfirmationError("journal normalization or guard check failed")
    if selector in BRANCH_IDS:
        pin = TARGET_PINS[selector]
        if (_sha(journal), sum(x.startswith("(assert ") for x in commands), len(commands), len(journal)) != (pin["journal_sha256"], pin["assertions"], pin["commands"], pin["bytes"]):
            raise SequentialConfirmationError("target journal pin drifted")
    variables = sorted(({"id": name.replace("_", "-"), "term": name, "sort": "Real"} for name in system["source_system"]["variables"]), key=lambda row: row["id"])
    semantic = {"schema": SYSTEM_SCHEMA, "system": system, "journal_sha256": _sha(journal), "parent_custody_sha256": bound["parent_custody_sha256"], "claims": dict(FALSE_CLAIMS)}
    snapshots = _snapshots(bound, system)
    descriptor = {"schema": DESCRIPTOR_SCHEMA, "producer": {"id": "p97-profile0034-new-mirror-reduced-sequential-confirmation-piqd", "version": "v1"}, "semantic_verifier": {"id": "profile0034-reduced-sequential-exact-rational-replay", "version": "v1"}, "stage_id": "profile0034-new-mirror-reduced-sequential-confirmation", "query_id": key, "sources": [{"path": row.path, "bytes": len(row.payload), "sha256": _sha(row.payload)} for row in snapshots], "semantic_input": semantic, "semantic_sha256": _sha(_canonical(semantic)), "original_smt2": {"path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)}, "variables": variables, "named_atoms": [], "solve": {"assumption_ids": [], "readback_variable_ids": [row["id"] for row in variables], "include_model": True}, "solver_profile": {"schema": SOLVER_PROFILE_SCHEMA, "solvers": ["z3"], "timeout_ms": TIMEOUT_MS}}
    query = adapter.SourceSemanticQuery(descriptor, _json(descriptor), journal, commands, journal, snapshots)
    return PreparedQuery(key, solver, "target" if selector in BRANCH_IDS else "control", selector if selector in BRANCH_IDS else None, system, query)


def verify_sat_model(query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None) -> adapter.SemanticVerification:
    if solver != "z3" or type(model) is not str or type(values) is not str:
        return adapter.SemanticVerification(False, {"accepted": False, "reason": "exact_readback_unsupported"})
    system = query.descriptor["semantic_input"]["system"]
    try:
        if system["kind"] == "control":
            parsed = parent.parent.parent.deletion._parse_control_value(values)
            accepted = (system["control"] == "positive" and parsed == {"t": Fraction(1)})
            evidence = {"accepted": accepted, "control": system["control"], "values": {k: str(v) for k, v in parsed.items()}}
        else:
            coords = parent.parent.parent.deletion._parse_coordinates(values, query.get_values)
            evidence = parent.parent.parent._replay_target({"source_system": system["source_system"], "retained_group_ids": system["retained_group_ids"]}, coords)
    except (
        parent.parent.parent.Profile0034PhysicalBlockDeletionError,
        parent.parent.parent.deletion.Profile0034NewMirrorSupportingEdgeError,
        parent.parent.parent.deletion.bo_source.BoSourceQfnraError,
        KeyError,
        TypeError,
        ValueError,
    ) as exc:
        evidence = {"accepted": False, "reason": "exact_readback_unsupported", "failure": type(exc).__name__}
    evidence.update({"solver": solver, "model_sha256": _sha(model.encode()), "values_sha256": _sha(values.encode()), "system_sha256": _sha(_canonical(system))})
    return adapter.SemanticVerification(bool(evidence.get("accepted")), evidence)


def _request_id(key: str) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


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
        raise SequentialConfirmationError("session create request drifted")
    if (
        payloads["pre_append_smt2"] != b""
        or payloads["expected_post_append_smt2"] != prepared.query.journal_smt2
    ):
        raise SequentialConfirmationError("journal frontier bytes drifted")
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
        raise SequentialConfirmationError("journal frontier record drifted")
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
        raise SequentialConfirmationError("solve request drifted")
    try:
        session = adapter._validate_session(
            _strict(payloads["session"], "session"),
            solver=prepared.solver,
            label=label,
            expected_state="live",
        )
        adapter._validate_fresh_session(session)
    except adapter.SmtSourceAdapterError as exc:
        raise SequentialConfirmationError("fresh session custody failed") from exc
    if payloads["smt2"] != prepared.query.journal_smt2:
        raise SequentialConfirmationError("exported journal drifted")
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
            raise SequentialConfirmationError("solve custody failed") from exc
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
        raise SequentialConfirmationError("receipt custody failed") from exc
    if prior is not None:
        raise SequentialConfirmationError("fresh session has a prior receipt")
    try:
        lifecycle = adapter._validate_session_lifecycle(
            _strict(payloads["session_lifecycle"], "session lifecycle")
        )
    except adapter.SmtSourceAdapterError as exc:
        raise SequentialConfirmationError("session lifecycle failed") from exc
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
        raise SequentialConfirmationError("session lifecycle drifted")
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
        raise SequentialConfirmationError("session close custody failed") from exc
    return session, receipt



def _session_identity(prepared: PreparedQuery) -> tuple[str, str]:
    profile_sha256 = _sha(_canonical(prepared.query.descriptor["solver_profile"]))
    label = f"p97-smt-source/{prepared.key}/{prepared.solver}/{prepared.query.descriptor['semantic_sha256'][:12]}/{_request_id(prepared.key)}/{profile_sha256[:12]}"
    return label, profile_sha256


def _expected_semantic(
    prepared: PreparedQuery, solve: Mapping[str, Any]
) -> tuple[str, dict[str, Any]]:
    model = solve.get("model")
    values = solve.get("values")
    if type(model) is not str or type(values) is not str:
        raise SequentialConfirmationError("SAT model/readback is absent")
    try:
        verification = verify_sat_model(
            prepared.query, prepared.solver, model, values
        )
        if type(verification) is not adapter.SemanticVerification:
            raise SequentialConfirmationError("semantic verifier returned wrong type")
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
    if type(engine) is not dict or set(engine) != ENGINE_KEYS:
        raise SequentialConfirmationError("engine key set drifted")
    raw = engine["raw_status"]
    if raw not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise SequentialConfirmationError("engine status is unsupported")
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
            raise SequentialConfirmationError("reconciliation artifact is invalid")
        expected_artifacts.add("reconciliation_session")
    if set(payloads) != expected_artifacts:
        raise SequentialConfirmationError("engine artifact inventory drifted")
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
        raise SequentialConfirmationError("engine identity drifted")
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
            raise SequentialConfirmationError("solve digest drifted")
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
        raise SequentialConfirmationError("transport loss custody drifted")
    if raw == "SAT":
        if solve is None:
            raise SequentialConfirmationError("SAT solve is absent")
        expected_status, expected_semantic = _expected_semantic(prepared, solve)
        if (
            "semantic" not in payloads
            or _strict(payloads["semantic"], "semantic replay")
            != engine["semantic_replay"]
            or engine["semantic_replay"] != expected_semantic
            or engine["effective_status"] != expected_status
        ):
            raise SequentialConfirmationError("SAT replay drifted")
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
            raise SequentialConfirmationError("UNSAT provenance drifted")
    elif raw == "UNKNOWN" and (
        engine["effective_status"] != "INCONCLUSIVE_UNKNOWN"
        or engine["semantic_replay"] is not None
        or engine["unsat_assumptions"] is not None
    ):
        raise SequentialConfirmationError("UNKNOWN custody drifted")
    return classify_engine(prepared, engine)



def classify_engine(prepared: PreparedQuery, engine: Mapping[str, Any]) -> str:
    if type(engine) is not dict or set(engine) != ENGINE_KEYS:
        raise SequentialConfirmationError("engine key set drifted")
    lifecycle = engine["session_lifecycle"]
    label, profile_sha256 = _session_identity(prepared)
    if (engine["solver"] != prepared.solver or type(engine["session_id"]) is not str or not engine["session_id"] or type(engine["solver_signature"]) is not str or not engine["solver_signature"] or re.fullmatch(r"[0-9a-f]{64}", engine["solver_sha256"]) is None or engine["request_id"] != _request_id(prepared.key) or engine["request_sha256"] != adapter.piqd_solve_request_digest(prepared.query, ()) or engine["assumption_labels"] != [] or engine["claims"] != adapter.FALSE_CLAIMS or engine["resumed_from_receipt"] is not False or type(lifecycle) is not dict or lifecycle.get("schema") != "piqd-smt-session-lifecycle/v1" or lifecycle.get("request_id") != _request_id(prepared.key) or lifecycle.get("session_id") != engine["session_id"] or lifecycle.get("session_label") != label or lifecycle.get("solver_profile_sha256") != profile_sha256 or lifecycle.get("resumed_existing_session") is not False or lifecycle.get("resumed_from_receipt") is not False or lifecycle.get("resume_journal_state") != "not_resumed" or lifecycle.get("resume_policy") is not None or lifecycle.get("close_observed_state") != "closed"):
        raise SequentialConfirmationError("engine identity drifted")
    raw, effective = engine["raw_status"], engine["effective_status"]
    if (raw is None and engine["solve_index"] is not None) or (raw is not None and engine["solve_index"] != 1):
        raise SequentialConfirmationError("solve count drifted")
    if raw == "UNSAT":
        provenance = engine["unsat_assumptions"]
        if effective != "UNSAT_DISCOVERY_ONLY" or type(provenance) is not dict or provenance.get("basis") != "get-unsat-assumptions" or provenance.get("daemon_field") != "core" or provenance.get("named_core_support") is not False or provenance.get("terminal_unsat") is not True or provenance.get("assumption_terms") != [] or provenance.get("source_atom_ids") != []:
            raise SequentialConfirmationError("UNSAT provenance drifted")
        disposition = "UNSAT_CUSTODY_VALID"
    elif raw == "SAT":
        semantic = engine["semantic_replay"]
        if effective == "SAT_SEMANTICALLY_REPLAYED" and type(semantic) is dict and semantic.get("accepted") is True:
            disposition = "SAT_REPLAYED"
        elif effective in {"INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED", "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE"}:
            disposition = "SAT_REPLAY_UNRESOLVED"
        else:
            raise SequentialConfirmationError("SAT semantic status drifted")
    elif raw == "UNKNOWN" and effective == "INCONCLUSIVE_UNKNOWN":
        disposition = "UNKNOWN"
    elif raw is None and effective == "INCONCLUSIVE_TRANSPORT_LOSS":
        disposition = "TRANSPORT_LOST"
    else:
        raise SequentialConfirmationError("engine status unsupported")
    if prepared.kind == "control" and disposition != ("SAT_REPLAYED" if prepared.key.endswith("positive") else "UNSAT_CUSTODY_VALID"):
        raise SequentialConfirmationError("fresh Z3 control failed")
    return disposition


def _result_record(prepared: PreparedQuery, state: str, engine: Mapping[str, Any] | None, failure: str | None, artifacts: list[dict[str, Any]]) -> dict[str, Any]:
    record = {"schema": RESULT_SCHEMA, "key": prepared.key, "solver": prepared.solver, "kind": prepared.kind, "branch": prepared.branch, "system_sha256": _sha(_json(prepared.system)), "journal_sha256": _sha(prepared.query.journal_smt2), "assertion_count": sum(x.startswith("(assert ") for x in prepared.query.journal_commands), "command_count": len(prepared.query.journal_commands), "state": state, "engine": None if engine is None else dict(engine), "failure_type": failure, "artifacts": artifacts, "finding_scope": "fresh sequential finite cell only", "claims": dict(FALSE_CLAIMS)}
    record["result_sha256"] = _self_hash(record, "result_sha256")
    return record


def _fd_artifacts(fd: int) -> list[dict[str, Any]]:
    rows = []
    for name in sorted(os.listdir(fd)):
        if not name or "/" in name or "\\" in name:
            raise SequentialConfirmationError("staged artifact name is unsafe")
        handle = os.open(name, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0), dir_fd=fd)
        try:
            info = os.fstat(handle)
            if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
                raise SequentialConfirmationError("staged artifact is unsafe")
            payload = os.read(handle, info.st_size)
            if len(payload) != info.st_size or os.read(handle, 1):
                raise SequentialConfirmationError("staged artifact changed")
        finally:
            os.close(handle)
        rows.append({"path": name, "bytes": len(payload), "sha256": _sha(payload)})
    return rows


def run_cell(prepared: PreparedQuery, output: Path, transport: adapter.PiqdTransport, used_session_ids: set[str]) -> dict[str, Any]:
    if output.exists() or output.is_symlink():
        raise SequentialConfirmationError("cells cannot resume")
    with adapter.SmtOutputTransaction(output) as transaction:
        for name, payload in (("source-record.json", _json(prepared.system)), ("descriptor.json", prepared.query.descriptor_bytes), ("original.smt2", prepared.query.original_smt2), ("journal.smt2", prepared.query.journal_smt2)):
            transaction.write_bytes(name, payload)
        for index, snapshot in enumerate(prepared.query.source_files):
            transaction.write_bytes(f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin", snapshot.payload)
        engine = None
        failure = None
        try:
            engine = adapter.run_authenticated_single_solver_query(prepared.query, solver="z3", descriptor_schema=DESCRIPTOR_SCHEMA, solver_profile_schema=SOLVER_PROFILE_SCHEMA, authenticated_journal_commands=prepared.query.journal_commands, transport=transport, semantic_verifier=verify_sat_model, output_fd=transaction.file_descriptor, used_session_ids=used_session_ids, request_id=_request_id(prepared.key), assumption_labels=())
            transaction.write_bytes("engine-observation.json", _json(engine))
            state = classify_engine(prepared, engine)
        except (OSError, adapter.SmtSourceAdapterError, SequentialConfirmationError) as exc:
            state, failure = "FAILED_CUSTODY", type(exc).__name__
        artifacts = _fd_artifacts(transaction.file_descriptor)
        result = _result_record(prepared, state, engine, failure, artifacts)
        transaction.write_bytes("result.json", _json(result))
        transaction.publish()
    return verify_cell_tree(prepared, output)


def verify_cell_tree(prepared: PreparedQuery, output: Path) -> dict[str, Any]:
    """Validate one result tree, including every descriptor-named artifact."""
    if output.is_symlink() or not output.is_dir():
        raise SequentialConfirmationError("cell output directory is unsafe")
    result = _strict(_read(output / "result.json"), "cell result")
    if result.get("schema") != RESULT_SCHEMA or result.get("key") != prepared.key or result.get("solver") != prepared.solver or result.get("kind") != prepared.kind or result.get("branch") != prepared.branch or result.get("system_sha256") != _sha(_json(prepared.system)) or result.get("journal_sha256") != _sha(prepared.query.journal_smt2) or result.get("assertion_count") != sum(x.startswith("(assert ") for x in prepared.query.journal_commands) or result.get("command_count") != len(prepared.query.journal_commands) or result.get("claims") != FALSE_CLAIMS or result.get("result_sha256") != _self_hash(result, "result_sha256"):
        raise SequentialConfirmationError("cell result identity drifted")
    if type(result.get("artifacts")) is not list:
        raise SequentialConfirmationError("cell artifact inventory is malformed")
    seen = {"result.json"}
    payloads: dict[str, bytes] = {}
    for item in result["artifacts"]:
        if type(item) is not dict or set(item) != {"path", "bytes", "sha256"}:
            raise SequentialConfirmationError("cell artifact record is malformed")
        name = item["path"]
        if type(name) is not str or not name or name in seen or "/" in name or "\\" in name:
            raise SequentialConfirmationError("cell artifact name is unsafe")
        payload = _read(output / name)
        if item["bytes"] != len(payload) or item["sha256"] != _sha(payload):
            raise SequentialConfirmationError("cell artifact digest drifted")
        seen.add(name); payloads[name] = payload
    expected = {"source-record.json": _json(prepared.system), "descriptor.json": prepared.query.descriptor_bytes, "original.smt2": prepared.query.original_smt2, "journal.smt2": prepared.query.journal_smt2}
    expected.update({f"source-{index:04d}-{_sha(row.payload)[:16]}.bin": row.payload for index, row in enumerate(prepared.query.source_files)})
    entries = list(output.iterdir())
    if any(payloads.get(name) != payload for name, payload in expected.items()) or {entry.name for entry in entries} != seen or any(entry.is_symlink() or not entry.is_file() or entry.stat(follow_symlinks=False).st_nlink != 1 for entry in entries):
        raise SequentialConfirmationError("cell source custody crossed")
    engine = result.get("engine")
    if result.get("state") == "FAILED_CUSTODY":
        if type(result.get("failure_type")) is not str or engine is not None:
            raise SequentialConfirmationError("failed cell custody drifted")
    else:
        if type(engine) is not dict or result.get("failure_type") is not None or payloads.get("engine-observation.json") != _json(engine) or classify_engine(prepared, engine) != result.get("state"):
            raise SequentialConfirmationError("cell engine custody drifted")
        engine_artifacts = engine.get("artifacts")
        if type(engine_artifacts) is not dict:
            raise SequentialConfirmationError("engine artifact inventory is malformed")
        by_path = {item["path"]: item for item in result["artifacts"]}
        seen_labels: set[str] = set()
        seen_paths: set[str] = set()
        for label, item in engine_artifacts.items():
            if type(label) is not str or label in seen_labels or type(item) is not dict or set(item) != {"path", "bytes", "sha256"} or item.get("path") in seen_paths or by_path.get(item.get("path")) != item:
                raise SequentialConfirmationError("engine artifact custody crossed")
            seen_labels.add(label); seen_paths.add(item["path"])
            name = item["path"]
            if name not in payloads:
                raise SequentialConfirmationError("engine artifact missing")
            if name.endswith(".json"):
                _strict(payloads[name], f"engine artifact {label}")
        engine_payloads = {
            label: payloads[item["path"]] for label, item in engine_artifacts.items()
        }
        if _validate_engine_artifacts(prepared, engine, engine_payloads) != result.get("state"):
            raise SequentialConfirmationError("engine artifact semantics drifted")
    return result


def _manifest() -> dict[str, Any]:
    return _expected_manifest(dt.datetime.now(dt.UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z"))


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict(_read(CHECKPOINT_PATH), "lane checkpoint")
    expected = {"schema", "lane_id", "owner", "base_head", "owned_paths", "generated_roots", "durable_paths", "created_utc", "manifest_sha256"}
    if set(checkpoint) != expected or checkpoint["schema"] != "worktree-lane-checkpoint/v1" or checkpoint["lane_id"] != LANE_ID or checkpoint["owner"] != CHECKPOINT_OWNER or checkpoint["base_head"] != CHECKPOINT_BASE_HEAD or checkpoint["owned_paths"] != OWNED_PATHS or checkpoint["generated_roots"] != [f"scratch/runs/{LANE_ID}/{RUN_ID}"] or checkpoint["durable_paths"] != [] or checkpoint["manifest_sha256"] != _self_hash(checkpoint, "manifest_sha256"):
        raise SequentialConfirmationError("lane checkpoint drifted")
    return checkpoint


def _expected_manifest(created_utc: str) -> dict[str, Any]:
    if type(created_utc) is not str or not re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z", created_utc):
        raise SequentialConfirmationError("run manifest creation time is malformed")
    checkpoint = _load_checkpoint()
    source = {_repo_path(path): _sha(_read(path)) for path in sorted(set(_source_paths()))}
    terminal = _strict(_read(PARENT_TERMINAL_PATH), "singleton terminal")
    if terminal.get("schema") != parent.TERMINAL_SCHEMA or set(terminal.get("cells", {})) != set(parent.QUERY_KEYS):
        raise SequentialConfirmationError("singleton input inventory is incomplete")
    input_paths = [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
    input_paths.extend(PARENT_ROOT / "artifacts" / key / "result.json" for key in terminal.get("cells", {}))
    inputs = {_repo_path(path): _sha(_read(path)) for path in sorted(set(input_paths))}
    record = {"schema": RUN_MANIFEST_SCHEMA, "lane_id": LANE_ID, "run_id": RUN_ID, "root": f"scratch/runs/{LANE_ID}/{RUN_ID}", "owner": checkpoint["owner"], "base_head": checkpoint["base_head"], "output_classes": ["artifacts", "events", "tmp"], "source_digests": source, "input_digests": inputs, "created_utc": created_utc}
    record["manifest_sha256"] = _self_hash(record, "manifest_sha256")
    return record


def _git_head() -> str:
    out = subprocess.run(["git", "rev-parse", "HEAD"], cwd=REPOSITORY_ROOT, capture_output=True, check=False).stdout.decode().strip()
    if not re.fullmatch(r"[0-9a-f]{40}", out):
        raise SequentialConfirmationError("execution commit is malformed")
    return out


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _load_checkpoint()
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise SequentialConfirmationError("run root escapes repository") from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise SequentialConfirmationError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise SequentialConfirmationError("run ancestor is unsafe")
    RUN_ROOT.parent.mkdir(parents=True, exist_ok=True)
    if RUN_ROOT.is_symlink() or (RUN_ROOT.exists() and not RUN_ROOT.is_dir()):
        raise SequentialConfirmationError("run root is unsafe")
    RUN_ROOT.mkdir(mode=0o700, exist_ok=True)
    if RUN_ROOT.exists():
        manifest_path = RUN_ROOT / "run_manifest.json"
        if manifest_path.exists() or manifest_path.is_symlink():
            manifest = _strict(_read(manifest_path), "run manifest")
            created = manifest.get("created_utc")
            if type(created) is not str or manifest != _expected_manifest(created):
                raise SequentialConfirmationError("run manifest drifted")
            return RUN_ROOT, manifest
        if tuple(RUN_ROOT.iterdir()):
            raise SequentialConfirmationError("unregistered run payload exists")
    else:
        RUN_ROOT.mkdir(mode=0o700)
    manifest = _manifest()
    _publish_once(RUN_ROOT / "run_manifest.json", _json(manifest))
    return RUN_ROOT, manifest


def _authenticate_source_commit(manifest: Mapping[str, Any], commit: object) -> str:
    if type(commit) is not str or re.fullmatch(r"[0-9a-f]{40}", commit) is None:
        raise SequentialConfirmationError("execution commit is malformed")
    expected = sorted(_repo_path(path) for path in set(_source_paths()))
    digests = manifest.get("source_digests")
    if type(digests) is not dict or sorted(digests) != expected:
        raise SequentialConfirmationError("source inventory drifted")
    for relative in expected:
        current = _read(REPOSITORY_ROOT / relative)
        if type(digests.get(relative)) is not str or not re.fullmatch(r"[0-9a-f]{64}", digests[relative]) or digests[relative] != _sha(current):
            raise SequentialConfirmationError("source digest drifted")
        shown = subprocess.run(["git", "show", f"{commit}:{relative}"], cwd=REPOSITORY_ROOT, capture_output=True, check=False)
        if shown.returncode != 0 or shown.stdout != current:
            raise SequentialConfirmationError("recorded source commit drifted")
    return commit


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    commit = _git_head()
    return _authenticate_source_commit(manifest, commit)


def _validate_server(server: str) -> str:
    if type(server) is not str:
        raise SequentialConfirmationError("PIQD server URL is invalid")
    parsed = urllib.parse.urlsplit(server)
    if parsed.scheme not in {"http", "https"} or not parsed.netloc or parsed.username is not None or parsed.password is not None or parsed.query or parsed.fragment:
        raise SequentialConfirmationError("PIQD server URL is invalid")
    return server.rstrip("/")


def _inventory(root: Path) -> str:
    if root.is_symlink() or not root.is_dir():
        raise SequentialConfirmationError("run root is unsafe")
    names = {entry.name for entry in root.iterdir()}
    if names == {"run_manifest.json"}:
        return "INITIALIZED"
    if names != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise SequentialConfirmationError("run inventory drifted")
    for name in ("artifacts", "events", "tmp"):
        path = root / name
        if path.is_symlink() or not path.is_dir():
            raise SequentialConfirmationError("runtime directory is unsafe")
    if tuple((root / "tmp").iterdir()):
        raise SequentialConfirmationError("runtime tmp is not empty")
    event_entries = list((root / "events").iterdir())
    artifact_entries = list((root / "artifacts").iterdir())
    if any(entry.is_symlink() or not entry.is_file() or entry.stat(follow_symlinks=False).st_nlink != 1 for entry in event_entries):
        raise SequentialConfirmationError("event inventory is unsafe")
    if any(entry.is_symlink() or not entry.is_dir() for entry in artifact_entries):
        raise SequentialConfirmationError("artifact inventory is unsafe")
    event_names = {entry.name for entry in event_entries}
    artifact_names = {entry.name for entry in artifact_entries}
    if not event_names and not artifact_names:
        return "RUNTIME_READY"
    if event_names == {"launch.json"} and artifact_names <= set(QUERY_KEYS):
        return "LAUNCHED"
    if event_names == {"launch.json", "terminal.json"} and artifact_names == set(QUERY_KEYS):
        return "TERMINAL"
    raise SequentialConfirmationError("incomplete run cannot resume")


def _launch_record(manifest: Mapping[str, Any], commit: str, server: str) -> dict[str, Any]:
    if type(commit) is not str or re.fullmatch(r"[0-9a-f]{40}", commit) is None:
        raise SequentialConfirmationError("execution commit is malformed")
    record = {"schema": LAUNCH_SCHEMA, "lane_id": LANE_ID, "run_id": RUN_ID, "run_manifest_sha256": manifest["manifest_sha256"], "execution_commit": commit, "server": _validate_server(server), "timeout_ms": TIMEOUT_MS, "workers": WORKERS, "queries": list(QUERY_KEYS), "sessions": len(QUERY_KEYS), "solves_per_session": 1, "assumptions": False, "resume": False, "transport": "maintained PIQD HTTP SMT adapter only", "claims": dict(FALSE_CLAIMS)}
    record["launch_sha256"] = _self_hash(record, "launch_sha256")
    return record


def _terminal_record(manifest: Mapping[str, Any], launch: Mapping[str, Any], custody: Mapping[str, Any], results: Mapping[str, Mapping[str, Any]]) -> dict[str, Any]:
    if set(results) != set(QUERY_KEYS):
        raise SequentialConfirmationError("terminal cell inventory is incomplete")
    if results["z3-control-positive"].get("state") != "SAT_REPLAYED" or results["z3-control-negative"].get("state") != "UNSAT_CUSTODY_VALID":
        raise SequentialConfirmationError("fresh controls failed")
    record = {"schema": TERMINAL_SCHEMA, "lane_id": LANE_ID, "run_id": RUN_ID, "run_manifest_sha256": manifest["manifest_sha256"], "launch_sha256": launch["launch_sha256"], "parent_custody_sha256": custody["parent_custody_sha256"], "status": "SEQUENTIAL_CONFIRMATION_COMPLETE", "query_count": len(QUERY_KEYS), "cells": {key: {"state": results[key]["state"], "result_sha256": results[key]["result_sha256"]} for key in QUERY_KEYS}, "finding_scope": "two fresh reduced cells and two controls", "transport": "maintained PIQD HTTP SMT adapter only", "assumptions": False, "resume": False, "workers": WORKERS, "sessions": len(QUERY_KEYS), "solves_per_session": 1, "claims": dict(FALSE_CLAIMS)}
    record["terminal_sha256"] = _self_hash(record, "terminal_sha256")
    return record


def _verify_terminal(root: Path, manifest: Mapping[str, Any], custody: Mapping[str, Any]) -> dict[str, Any]:
    """Verify a completed tree using only local bytes; no transport is touched."""
    launch = _strict(_read(root / "events/launch.json"), "launch")
    terminal = _strict(_read(root / "events/terminal.json"), "terminal")
    if launch.get("schema") != LAUNCH_SCHEMA or launch.get("lane_id") != LANE_ID or launch.get("run_id") != RUN_ID or launch.get("run_manifest_sha256") != manifest.get("manifest_sha256") or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256") or launch.get("queries") != list(QUERY_KEYS) or launch.get("workers") != WORKERS:
        raise SequentialConfirmationError("launch custody drifted")
    commit = _authenticate_source_commit(manifest, launch.get("execution_commit"))
    if launch != _launch_record(manifest, commit, launch.get("server")):
        raise SequentialConfirmationError("launch record drifted")
    if terminal.get("schema") != TERMINAL_SCHEMA or terminal.get("lane_id") != LANE_ID or terminal.get("run_id") != RUN_ID or terminal.get("launch_sha256") != launch.get("launch_sha256") or terminal.get("parent_custody_sha256") != custody.get("parent_custody_sha256") or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256") or terminal.get("claims") != FALSE_CLAIMS:
        raise SequentialConfirmationError("terminal custody drifted")
    if set(terminal.get("cells", {})) != set(QUERY_KEYS):
        raise SequentialConfirmationError("terminal cell inventory drifted")
    sessions: set[str] = set()
    results: dict[str, dict[str, Any]] = {}
    for key in QUERY_KEYS:
        prepared = prepare_query(key, custody=custody)
        result = verify_cell_tree(prepared, root / "artifacts" / key)
        if result.get("result_sha256") != terminal["cells"][key].get("result_sha256"):
            raise SequentialConfirmationError(f"result custody drifted: {key}")
        engine = result.get("engine")
        if type(engine) is not dict:
            raise SequentialConfirmationError(f"engine custody missing: {key}")
        session_id = engine.get("session_id")
        if type(session_id) is not str or session_id in sessions:
            raise SequentialConfirmationError("session identities crossed")
        sessions.add(session_id)
        if classify_engine(prepared, engine) != result.get("state"):
            raise SequentialConfirmationError(f"engine state drifted: {key}")
        results[key] = result
    if terminal != _terminal_record(manifest, launch, custody, results):
        raise SequentialConfirmationError("terminal record drifted")
    return terminal


def run_campaign(*, server: str = "http://127.0.0.1:7272", timeout_s: float = DEFAULT_TIMEOUT_S, workers: int = WORKERS, init_only: bool = False, verify: bool = False, check_parent: bool = False, transport: adapter.PiqdTransport | None = None) -> dict[str, Any]:
    if timeout_s != DEFAULT_TIMEOUT_S or type(timeout_s) is bool or workers != WORKERS or type(workers) is bool:
        raise SequentialConfirmationError("timeout is fixed at 60 seconds and workers must be exactly 1")
    root, manifest = ensure_run_root()
    custody = authenticate_parent_run()
    if check_parent:
        return {"status": "PARENT_AUTHENTICATED", "parent_custody_sha256": custody["parent_custody_sha256"], "bound_parent_results": len(custody["singleton_result_sha256s"])}
    phase = _inventory(root)
    if init_only:
        if phase != "INITIALIZED":
            raise SequentialConfirmationError("init-only requires an initialized root")
        return {"status": "INITIALIZED", "run_manifest_sha256": manifest["manifest_sha256"]}
    if verify:
        if phase != "TERMINAL":
            raise SequentialConfirmationError("offline verify requires a terminal run")
        launch = _strict(_read(root / "events/launch.json"), "launch")
        commit = _authenticate_source_commit(manifest, launch.get("execution_commit"))
        if launch != _launch_record(manifest, commit, launch.get("server")):
            raise SequentialConfirmationError("offline launch record drifted")
        return _verify_terminal(root, manifest, custody)
    server = _validate_server(server)
    if phase != "INITIALIZED":
        raise SequentialConfirmationError("incomplete run cannot resume; use a fresh run id")
    commit = authenticate_execution_commit(manifest)
    (root / "artifacts").mkdir(mode=0o700); (root / "events").mkdir(mode=0o700); (root / "tmp").mkdir(mode=0o700)
    launch = _launch_record(manifest, commit, server)
    _publish_once(root / "events/launch.json", _json(launch))
    active = transport or adapter.UrllibPiqdTransport(server.rstrip("/"), http_timeout_s=DEFAULT_TIMEOUT_S + 40)
    prepared = {key: prepare_query(key, custody=custody) for key in QUERY_KEYS}
    results = {}
    used: set[str] = set()
    for key in QUERY_KEYS:
        results[key] = run_cell(prepared[key], root / "artifacts" / key, active, used)
    states = {key: results[key]["state"] for key in QUERY_KEYS}
    if states["z3-control-positive"] != "SAT_REPLAYED" or states["z3-control-negative"] != "UNSAT_CUSTODY_VALID":
        raise SequentialConfirmationError("fresh controls failed")
    terminal = _terminal_record(manifest, launch, custody, results)
    _publish_once(root / "events/terminal.json", _json(terminal))
    return _verify_terminal(root, manifest, custody)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272"); parser.add_argument("--timeout", type=float, default=DEFAULT_TIMEOUT_S); parser.add_argument("--workers", type=int, default=WORKERS); parser.add_argument("--init-only", action="store_true"); parser.add_argument("--verify", action="store_true"); parser.add_argument("--check-parent", action="store_true"); parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_campaign(server=args.server, timeout_s=args.timeout, workers=args.workers, init_only=args.init_only, verify=args.verify, check_parent=args.check_parent)
    except (SequentialConfirmationError, adapter.SmtSourceAdapterError, OSError, ValueError) as exc:
        print(f"error: {exc}", file=os.sys.stderr); return 2
    if args.verbose: print(json.dumps(result, sort_keys=True, indent=2))
    return 0


__all__ = ["BRANCH_GROUP_IDS", "CONTROL_KEYS", "GT_GROUP_IDS", "LANE_ID", "LT_GROUP_IDS", "PARENT_PINS", "QUERY_KEYS", "QUERY_PLAN", "RUN_ID", "RUN_ROOT", "TARGET_PINS", "WORKERS", "PreparedQuery", "SequentialConfirmationError", "_request_id", "_session_identity", "authenticate_parent_run", "build_smt_commands", "classify_engine", "ensure_run_root", "main", "prepare_query", "run_campaign", "run_cell", "verify_cell_tree", "verify_sat_model"]

if __name__ == "__main__":
    raise SystemExit(main())
