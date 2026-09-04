"""Governed named-assumption core mining for two residual formula families.

The lane authenticates the completed residual QF_NRA run, proves that its six
target journals form two exact assertion families, and submits one
representative from each family to each maintained solver through PIQD.  All
claims remain formula-local and discovery-only.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import stat
import urllib.parse
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

from census.card_head import exactfive_opposed_turn_residual_qfnra_piqd as source
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-opposed-turn-residual-named-core-20260903"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = REPOSITORY_ROOT / "docs/specs/p97-exactfive-opposed-turn-residual-named-core-v1.md"
TEST_PATH = REPOSITORY_ROOT / "census/card_head/tests/test_exactfive_opposed_turn_residual_named_core_piqd.py"
RUNNER_PATH = REPOSITORY_ROOT / "scripts/run_exactfive_opposed_turn_residual_named_core_piqd.py"

PARENT_ROOT = source.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PRODUCER_SHA256 = "47a1fbb12d337877197c0293694dcb1d38796b564161f491cef9b209db81a856"
PARENT_MANIFEST_FILE_SHA256 = "5dde5031ee5fa3237b192cf34a3cc60d4b7e891887e5348fe5772595c773af7c"
PARENT_MANIFEST_SHA256 = "c93b7bcf02abb8b90676470863aa8a60210652d6a2edea3ea5e70d93463c2deb"
PARENT_LAUNCH_FILE_SHA256 = "419df079a460ddf801964ac45443b59f5d2676d6bd10f30e38fca7eae67577a6"
PARENT_LAUNCH_SHA256 = "f5fc5ad777c026765051d23b060cf1722c11a6bc25e74408d3bd27ae642d27ad"
PARENT_TERMINAL_FILE_SHA256 = "137ca473dba9daaf5e86356cdd355768712e067b339a7a7e8afa77a1d2a61d85"
PARENT_TERMINAL_SHA256 = "eabfb133d705fc82582d4fd35d2814050f58b4fcc405a1218336f1a4bf4ab485"

SYSTEM_SCHEMA = "p97-exactfive-opposed-turn-residual-named-core-system/v1"
DESCRIPTOR_SCHEMA = "p97-exactfive-opposed-turn-residual-named-core-query/v1"
SOLVER_PROFILE_SCHEMA = "p97-exactfive-opposed-turn-residual-named-core-solver/v1"
RESULT_SCHEMA = "p97-exactfive-opposed-turn-residual-named-core-result/v1"
LAUNCH_SCHEMA = "p97-exactfive-opposed-turn-residual-named-core-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-opposed-turn-residual-named-core-terminal/v1"
FAILURE_SCHEMA = "p97-exactfive-opposed-turn-residual-named-core-failure/v1"
FAMILY_SCHEMA = "p97-exactfive-opposed-turn-residual-formula-families/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
DEFAULT_TIMEOUT_S = 60.0
WORKERS = 1

FALSE_CLAIMS = {
    "formula_family_scope_only": True,
    "source_realization": False,
    "all_profile_execution": False,
    "lean_ingress": False,
    "live_closure": False,
    "promotion": False,
    "theorem": False,
}
FAMILY_GROUPS = {
    "family-12": (360, 467),
    "family-13": (363, 376, 470, 483),
}
REPRESENTATIVES = {"family-12": 360, "family-13": 363}
EXPECTED_ASSUMPTIONS = {360: 236, 363: 302}
QUERY_PLAN = (
    ("z3-control-positive", "z3", "control-positive"),
    ("z3-control-negative", "z3", "control-negative"),
    ("z3-target-0360", "z3", "profile-0360"),
    ("z3-target-0363", "z3", "profile-0363"),
    ("cvc5-control-positive", "cvc5", "control-positive"),
    ("cvc5-control-negative", "cvc5", "control-negative"),
    ("cvc5-target-0360", "cvc5", "profile-0360"),
    ("cvc5-target-0363", "cvc5", "profile-0363"),
)
QUERY_KEYS = tuple(row[0] for row in QUERY_PLAN)
TARGET_KEYS = tuple(key for key, _, source_id in QUERY_PLAN if source_id.startswith("profile-"))
POSITIVE_CONTROL_KEYS = ("z3-control-positive", "cvc5-control-positive")
NEGATIVE_CONTROL_KEYS = ("z3-control-negative", "cvc5-control-negative")
_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_opposed_turn_residual_named_core_piqd.py",
    "census/card_head/tests/test_exactfive_opposed_turn_residual_named_core_piqd.py",
    "docs/specs/p97-exactfive-opposed-turn-residual-named-core-v1.md",
    "scripts/run_exactfive_opposed_turn_residual_named_core_piqd.py",
]
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
        "schema", "key", "solver", "source_id", "representative_family",
        "assumption_count", "source_system_sha256", "source_ledger_sha256",
        "assumption_label_sha256", "engine", "custody", "claims", "result_sha256",
    }
)
_TOMBSTONE = source._TOMBSTONE


class ResidualNamedCoreError(RuntimeError):
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
        raise ResidualNamedCoreError(f"missing custody file: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise ResidualNamedCoreError(f"unsafe custody file: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise ResidualNamedCoreError(f"custody file changed while reading: {path}")
    return payload


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except adapter.SmtSourceAdapterError as exc:
        raise ResidualNamedCoreError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise ResidualNamedCoreError(f"{where} is not an object")
    return value


def _publish_once(path: Path, payload: bytes) -> None:
    try:
        source._publish_once(path, payload)
    except source.ResidualQfnraError as exc:
        raise ResidualNamedCoreError(f"immutable publication failed: {path}") from exc


def _repo_path(path: Path) -> str:
    return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()


def _source_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read(path)) for path in sorted(paths)}


def authenticate_parent_run() -> dict[str, Any]:
    """Reconstruct all eight immutable result trees and the terminal."""

    if _sha(_read(Path(source.__file__))) != PARENT_PRODUCER_SHA256:
        raise ResidualNamedCoreError("parent producer bytes drifted")
    manifest_payload = _read(PARENT_MANIFEST_PATH)
    launch_payload = _read(PARENT_LAUNCH_PATH)
    terminal_payload = _read(PARENT_TERMINAL_PATH)
    if (
        _sha(manifest_payload) != PARENT_MANIFEST_FILE_SHA256
        or _sha(launch_payload) != PARENT_LAUNCH_FILE_SHA256
        or _sha(terminal_payload) != PARENT_TERMINAL_FILE_SHA256
    ):
        raise ResidualNamedCoreError("parent record bytes drifted")
    try:
        root, manifest = source.ensure_run_root()
        launch = source._strict(launch_payload, "parent launch")
        terminal = source._read_terminal(PARENT_TERMINAL_PATH)
    except (source.ResidualQfnraError, OSError, ValueError) as exc:
        raise ResidualNamedCoreError("parent root validation failed") from exc
    if (
        root != PARENT_ROOT
        or manifest.get("manifest_sha256") != PARENT_MANIFEST_SHA256
        or launch.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or terminal.get("terminal_sha256") != PARENT_TERMINAL_SHA256
        or terminal.get("status") != "TARGET_INCONCLUSIVE"
    ):
        raise ResidualNamedCoreError("parent identity or terminal status drifted")
    timeout_ms = launch.get("timeout_ms")
    if type(timeout_ms) is not int:
        raise ResidualNamedCoreError("parent timeout is malformed")
    prepared = {
        "control-positive": source.prepare_control_query("positive", timeout_ms),
        "control-negative": source.prepare_control_query("negative", timeout_ms),
        **{
            f"profile-{index:04d}": source.prepare_query(index, timeout_ms)
            for index in source.PROFILE_INDICES
        },
    }
    try:
        results = {
            key: source.verify_adapter_tree(item, root / "artifacts" / key)
            for key, item in prepared.items()
        }
        source._require_control("control-positive", results["control-positive"])
        source._require_control("control-negative", results["control-negative"])
        expected = source._terminal_record(root, launch, results)
        phase = source._inventory(root, prepared)
    except (source.ResidualQfnraError, OSError, ValueError) as exc:
        raise ResidualNamedCoreError("parent result replay failed") from exc
    if terminal != expected or phase != "TERMINAL":
        raise ResidualNamedCoreError("parent terminal does not reconstruct")
    record = {
        "schema": "p97-exactfive-opposed-turn-residual-parent-custody/v1",
        "producer_sha256": PARENT_PRODUCER_SHA256,
        "run_manifest_file_sha256": PARENT_MANIFEST_FILE_SHA256,
        "run_manifest_sha256": PARENT_MANIFEST_SHA256,
        "launch_file_sha256": PARENT_LAUNCH_FILE_SHA256,
        "launch_sha256": PARENT_LAUNCH_SHA256,
        "terminal_file_sha256": PARENT_TERMINAL_FILE_SHA256,
        "terminal_sha256": PARENT_TERMINAL_SHA256,
        "terminal_status": terminal["status"],
        "result_file_sha256": {
            key: _sha(_read(root / "artifacts" / key / "result.json"))
            for key in prepared
        },
        "claims": dict(FALSE_CLAIMS),
    }
    record["parent_custody_sha256"] = _self_hash(record, "parent_custody_sha256")
    return record


def formula_family_record() -> dict[str, Any]:
    """Prove the two exact assertion families from current frozen systems."""

    profiles: dict[str, Any] = {}
    assertions: dict[int, tuple[str, ...]] = {}
    for index in source.PROFILE_INDICES:
        system = source.build_system(index)
        ordered = tuple(
            command
            for command in source.build_smt_commands(system)
            if command.startswith("(assert ")
        )
        if not ordered:
            raise ResidualNamedCoreError("profile assertion ledger is empty")
        assertions[index] = ordered
        profiles[str(index)] = {
            "profile_sha256": source.PROFILE_HASHES[index],
            "assertion_occurrences": len(ordered),
            "unique_assertions": len(set(ordered)),
            "assertion_set_sha256": _sha(_canonical(sorted(set(ordered)))),
            "assertion_multiset_sha256": _sha(_canonical(sorted(ordered))),
            "role_class_sha256": _sha(_canonical(system["role_class"])),
        }
    families: dict[str, Any] = {}
    for family, members in FAMILY_GROUPS.items():
        representative = REPRESENTATIVES[family]
        if any(sorted(assertions[index]) != sorted(assertions[representative]) for index in members):
            raise ResidualNamedCoreError(f"{family} exact assertion multiset differs")
        role_hashes = {profiles[str(index)]["role_class_sha256"] for index in members}
        if len(role_hashes) != len(members):
            raise ResidualNamedCoreError(f"{family} does not retain distinct role maps")
        families[family] = {
            "members": list(members),
            "representative": representative,
            "assertion_set_sha256": profiles[str(representative)]["assertion_set_sha256"],
            "assertion_multiset_sha256": profiles[str(representative)]["assertion_multiset_sha256"],
            "exact_set_equal": True,
            "exact_multiset_equal": True,
            "distinct_role_maps": True,
        }
    record = {
        "schema": FAMILY_SCHEMA,
        "profiles": profiles,
        "families": families,
        "representatives": dict(REPRESENTATIVES),
        "claims": dict(FALSE_CLAIMS),
    }
    record["family_record_sha256"] = _self_hash(record, "family_record_sha256")
    return record


def _source_system(source_id: str) -> dict[str, Any]:
    if source_id == "control-positive":
        return source.build_control_system("positive")
    if source_id == "control-negative":
        return source.build_control_system("negative")
    if source_id in {"profile-0360", "profile-0363"}:
        return source.build_system(int(source_id.removeprefix("profile-")))
    raise ResidualNamedCoreError(f"unknown source system: {source_id}")


def _target_ledger(system: Mapping[str, Any]) -> list[dict[str, Any]]:
    ledger: list[dict[str, Any]] = [
        {
            "family": "normalization",
            "index": 0,
            "source_entry": system["normalization"],
            "source_commands": [
                "(assert (= (+ (* 4 r r) (- 3)) 0))",
                "(assert (> r 0))",
            ],
            "source_body": "(and (= (+ (* 4 r r) (- 3)) 0) (> r 0))",
        }
    ]
    for index, entry in enumerate(system["row_equality_ledger"]):
        ledger.append(
            {
                "family": "row-equality", "index": index, "source_entry": entry,
                "source_commands": [f"(assert (= {entry['smt']} 0))"],
                "source_body": f"(= {entry['smt']} 0)",
            }
        )
    for family, entry, body in (
        (
            "radius-disequality", system["radius_disequality"],
            f"(not (= {system['radius_disequality']['smt']} 0))",
        ),
        ("source-strict", system["source_strict"], f"(< {system['source_strict']['smt']} 0)"),
    ):
        ledger.append(
            {
                "family": family, "index": 0, "source_entry": entry,
                "source_commands": [f"(assert {body})"], "source_body": body,
            }
        )
    for index, entry in enumerate(system["area_ledger"]):
        body = f"(> {entry['smt']} 0)"
        ledger.append(
            {
                "family": "strict-signed-area", "index": index, "source_entry": entry,
                "source_commands": [f"(assert {body})"], "source_body": body,
            }
        )
    expected = EXPECTED_ASSUMPTIONS[system["profile_index"]]
    if len(ledger) != expected:
        raise ResidualNamedCoreError("target named ledger count drifted")
    source_assertions = sorted(
        command
        for command in source.build_smt_commands(system)
        if command.startswith("(assert ")
    )
    expanded = sorted(command for entry in ledger for command in entry["source_commands"])
    if source_assertions != expanded:
        raise ResidualNamedCoreError("named target ledger does not expand to the source")
    return ledger


def _control_ledger(system: Mapping[str, Any]) -> list[dict[str, Any]]:
    assertions = [
        command
        for command in source.build_smt_commands(system)
        if command.startswith("(assert ")
    ]
    return [
        {
            "family": f"control-{system['control']}", "index": index,
            "source_entry": {"command": command}, "source_commands": [command],
            "source_body": command[len("(assert ") : -1],
        }
        for index, command in enumerate(assertions)
    ]


def _assumption_id(family: str, index: int) -> str:
    prefixes = {
        "normalization": "normalization", "row-equality": "row",
        "radius-disequality": "radius", "source-strict": "source-strict",
        "strict-signed-area": "area", "control-positive": "control-positive",
        "control-negative": "control-negative",
    }
    return f"{prefixes[family]}-{index:03d}"


def build_named_system(source_id: str, solver: str) -> dict[str, Any]:
    if solver not in adapter.SOLVERS:
        raise ResidualNamedCoreError("solver is not maintained by the PIQD adapter")
    original = _source_system(source_id)
    ledger = _target_ledger(original) if original["kind"] == "target" else _control_ledger(original)
    source_system_sha256 = _sha(_canonical(original))
    source_ledger_sha256 = _sha(_canonical(ledger))
    bindings = []
    for entry in ledger:
        assumption_id = _assumption_id(entry["family"], entry["index"])
        binding = {
            "schema": "p97-residual-named-assumption-label/v1",
            "assumption_id": assumption_id,
            "assumption_term": "assume_" + assumption_id.replace("-", "_"),
            "family": entry["family"], "index": entry["index"],
            "source_ledger_entry": entry["source_entry"],
            "source_commands": entry["source_commands"], "source_body": entry["source_body"],
            "source_system_sha256": source_system_sha256,
            "source_ledger_sha256": source_ledger_sha256,
        }
        binding["label_sha256"] = _self_hash(binding, "label_sha256")
        bindings.append(binding)
    family = next(
        (name for name, representative in REPRESENTATIVES.items() if source_id == f"profile-{representative:04d}"),
        None,
    )
    family_record = formula_family_record()
    unguarded_commands = source.build_smt_commands(original)
    system = {
        "schema": SYSTEM_SCHEMA, "solver": solver, "source_id": source_id,
        "representative_family": family, "source_system": original,
        "source_system_sha256": source_system_sha256,
        "source_unguarded_commands": list(unguarded_commands),
        "source_unguarded_journal_sha256": _sha(
            b"".join(command.encode("ascii") + b"\n" for command in unguarded_commands)
        ),
        "source_ledger": ledger, "source_ledger_sha256": source_ledger_sha256,
        "family_record_sha256": family_record["family_record_sha256"],
        "assumption_bindings": bindings, "claims": dict(FALSE_CLAIMS),
    }
    return system


def _validate_named_system(value: object) -> dict[str, Any]:
    if type(value) is not dict or value.get("schema") != SYSTEM_SCHEMA:
        raise ResidualNamedCoreError("named system is malformed")
    expected = build_named_system(value.get("source_id"), value.get("solver"))
    if value != expected:
        raise ResidualNamedCoreError("named system drifted from the source ledger")
    return dict(value)


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    current = _validate_named_system(system)
    original = current["source_system"]
    out = ["(set-logic QF_NRA)"]
    out.extend(f"(declare-fun {variable} () Real)" for variable in original["variables"])
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
    family = formula_family_record()
    unguarded = b"".join(
        command.encode("ascii") + b"\n" for command in system["source_unguarded_commands"]
    )
    snapshots = (
        adapter.SourceSnapshot("0000-parent-custody.json", _json(parent)),
        adapter.SourceSnapshot("0001-family-reduction.json", _json(family)),
        adapter.SourceSnapshot("0002-named-system.json", _json(system)),
        adapter.SourceSnapshot("parent-run-manifest.json", _read(PARENT_MANIFEST_PATH)),
        adapter.SourceSnapshot("parent-launch.json", _read(PARENT_LAUNCH_PATH)),
        adapter.SourceSnapshot("parent-terminal.json", _read(PARENT_TERMINAL_PATH)),
        adapter.SourceSnapshot("source-unguarded.smt2", unguarded),
        adapter.SourceSnapshot("implementation-named-core.py", _read(Path(__file__))),
        adapter.SourceSnapshot("implementation-parent.py", _read(Path(source.__file__))),
        adapter.SourceSnapshot("implementation-adapter.py", _read(Path(adapter.__file__))),
        adapter.SourceSnapshot("tests.py", _read(TEST_PATH)),
        adapter.SourceSnapshot("runner.py", _read(RUNNER_PATH)),
        adapter.SourceSnapshot("checkpoint.json", _read(CHECKPOINT_PATH)),
        adapter.SourceSnapshot("specification.md", _read(SPEC_PATH)),
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
        raise ResidualNamedCoreError(f"unknown query key: {key}")
    if type(timeout_ms) is not int or type(timeout_ms) is bool or not 0 < timeout_ms <= 3_600_000:
        raise ResidualNamedCoreError("query timeout is invalid")
    solver, source_id = plan[key]
    parent_record = dict(parent or authenticate_parent_run())
    if parent_record.get("parent_custody_sha256") != _self_hash(
        parent_record, "parent_custody_sha256"
    ):
        raise ResidualNamedCoreError("parent custody record is not self-hashed")
    system = build_named_system(source_id, solver)
    commands = build_smt_commands(system)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    try:
        normalized, normalized_journal = adapter.normalize_state_journal(journal)
    except adapter.SmtSourceAdapterError as exc:
        raise ResidualNamedCoreError("named journal is not accepted by the adapter") from exc
    if normalized != commands or normalized_journal != journal:
        raise ResidualNamedCoreError("named journal normalization drifted")
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
            {"id": binding["assumption_id"], "assumption_term": binding["assumption_term"]}
            for binding in bindings
        ),
        key=lambda item: item["id"],
    )
    assumption_labels = tuple(binding["label_sha256"] for binding in bindings)
    family = formula_family_record()
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "parent_custody_sha256": parent_record["parent_custody_sha256"],
        "family_record_sha256": family["family_record_sha256"],
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _source_snapshots(parent_record, system)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-residual-named-core-piqd", "version": "v1"},
        "semantic_verifier": {
            "id": "residual-unguarded-exact-rational-replay", "version": "v1"
        },
        "stage_id": "exactfive-opposed-turn-residual-named-core",
        "query_id": key,
        "sources": [
            {"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)}
            for item in snapshots
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)
        },
        "variables": variables,
        "named_atoms": named_atoms,
        "solve": {
            "assumption_ids": [binding["assumption_id"] for binding in bindings],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": SOLVER_PROFILE_SCHEMA, "solvers": [solver], "timeout_ms": timeout_ms
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
        raise ResidualNamedCoreError("SAT replay payload is malformed")
    system = _validate_named_system(semantic.get("system"))
    if solver != system["solver"]:
        raise ResidualNamedCoreError("SAT replay solver is crossed")
    timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
    source_id = system["source_id"]
    if source_id == "control-positive":
        unguarded = source.prepare_control_query("positive", timeout_ms)
    elif source_id == "control-negative":
        unguarded = source.prepare_control_query("negative", timeout_ms)
    else:
        unguarded = source.prepare_query(int(source_id.removeprefix("profile-")), timeout_ms)
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
        raise ResidualNamedCoreError("artifact record is malformed")
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen:
        raise ResidualNamedCoreError("artifact path is unsafe or duplicated")
    payload = _read(root / name)
    if type(record["bytes"]) is not int or record["bytes"] != len(payload) or record["sha256"] != _sha(payload):
        raise ResidualNamedCoreError(f"artifact digest drifted: {name}")
    seen.add(name)
    return payload


def _read_fd_artifact(directory_fd: int, name: str) -> bytes:
    descriptor = os.open(
        name, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0), dir_fd=directory_fd
    )
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise ResidualNamedCoreError("staged artifact is unsafe")
        chunks: list[bytes] = []
        while True:
            chunk = os.read(descriptor, 65536)
            if not chunk:
                break
            chunks.append(chunk)
        payload = b"".join(chunks)
        if len(payload) != info.st_size:
            raise ResidualNamedCoreError("staged artifact changed while reading")
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
    create_request = {
        "solver": prepared.solver, "lane": "smt", "label": label
    }
    expected_create = {
        "schema": "piqd-smt-session-create-request/v1",
        "request": create_request,
        "request_id": request_id,
        "session_label": label,
        "solver_profile": prepared.query.descriptor["solver_profile"],
        "solver_profile_sha256": profile_sha256,
    }
    if _strict(payloads["session_create_request"], "session create request") != expected_create:
        raise ResidualNamedCoreError("named session create request drifted")
    if payloads["pre_append_smt2"] != b"" or payloads["expected_post_append_smt2"] != prepared.query.journal_smt2:
        raise ResidualNamedCoreError("named journal frontier bytes drifted")
    artifacts = engine["artifacts"]
    expected_frontiers = {
        "schema": "piqd-smt-journal-frontiers/v1",
        "append_request": {
            "commands": list(prepared.query.journal_commands), "expect_commands": 0
        },
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
        raise ResidualNamedCoreError("named journal frontier record drifted")
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
        raise ResidualNamedCoreError("named solve request drifted")
    try:
        session = adapter._validate_session(
            _strict(payloads["session"], "session"),
            solver=prepared.solver, label=label, expected_state="live",
        )
        adapter._validate_fresh_session(session)
    except adapter.SmtSourceAdapterError as exc:
        raise ResidualNamedCoreError("named session custody failed") from exc
    if payloads["smt2"] != prepared.query.journal_smt2:
        raise ResidualNamedCoreError("exported journal differs")
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
            raise ResidualNamedCoreError("named solve custody failed") from exc
    try:
        _, prior = adapter._validate_receipts(
            _strict(payloads["receipts_before"], "prior receipts"),
            session=session, query=prepared.query, solve=None, expected_count=0,
            request_id=request_id, request_sha256=request_sha256,
            assumption_labels=prepared.assumption_labels,
        )
        _, receipt = adapter._validate_receipts(
            _strict(payloads["receipts"], "receipts"),
            session=session, query=prepared.query, solve=solve,
            expected_count=0 if solve is None else 1,
            request_id=request_id, request_sha256=request_sha256,
            assumption_labels=prepared.assumption_labels,
        )
    except adapter.SmtSourceAdapterError as exc:
        raise ResidualNamedCoreError("named receipt custody failed") from exc
    if prior is not None:
        raise ResidualNamedCoreError("fresh named session has a prior receipt")
    lifecycle_payload = _strict(payloads["session_lifecycle"], "session lifecycle")
    try:
        lifecycle = adapter._validate_session_lifecycle(lifecycle_payload)
    except adapter.SmtSourceAdapterError as exc:
        raise ResidualNamedCoreError("named lifecycle custody failed") from exc
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
        raise ResidualNamedCoreError("named lifecycle is cross-bound")
    if "closed_session" in payloads:
        try:
            closed = adapter._validate_session(
                _strict(payloads["closed_session"], "closed session"),
                solver=prepared.solver, label=label, expected_state="closed",
            )
            adapter._validate_closed_session(
                closed, created=session, query=prepared.query, solve=solve
            )
        except adapter.SmtSourceAdapterError as exc:
            raise ResidualNamedCoreError("named closed-session custody failed") from exc
    if "reconciliation_session" in payloads:
        try:
            reconciled = adapter._validate_session(
                _strict(payloads["reconciliation_session"], "reconciliation session"),
                solver=prepared.solver, label=label, expected_state="live",
            )
            adapter._validate_session_frontier(
                reconciled, created=session, query=prepared.query, solve=solve
            )
        except adapter.SmtSourceAdapterError as exc:
            raise ResidualNamedCoreError("named reconciliation custody failed") from exc
    return session, receipt


def _validate_core(prepared: PreparedQuery, engine: Mapping[str, Any]) -> None:
    provenance = engine.get("unsat_assumptions")
    if (
        engine.get("raw_status") != "UNSAT"
        or engine.get("effective_status") != "UNSAT_DISCOVERY_ONLY"
        or type(provenance) is not dict
    ):
        raise ResidualNamedCoreError("UNSAT core status or provenance is absent")
    terms = provenance.get("assumption_terms")
    ids = provenance.get("source_atom_ids")
    labels = provenance.get("core_labels")
    bindings = {
        binding["assumption_term"]: binding
        for binding in prepared.system["assumption_bindings"]
    }
    selected = [bindings.get(term) for term in terms] if type(terms) is list else []
    if (
        not selected
        or any(binding is None for binding in selected)
        or ids != [binding["assumption_id"] for binding in selected]
        or labels != [binding["label_sha256"] for binding in selected]
        or provenance.get("terminal_unsat") is not False
        or provenance.get("named_core_support") is not True
        or provenance.get("ordered_assumption_labels") != list(prepared.assumption_labels)
        or provenance.get("basis") != "get-unsat-assumptions"
        or provenance.get("daemon_field") != "core"
    ):
        raise ResidualNamedCoreError("UNSAT core is empty, terminal, or cross-bound")


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
        raise ResidualNamedCoreError("named engine key set drifted")
    raw = engine["raw_status"]
    if raw not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise ResidualNamedCoreError("named engine status is unsupported")
    lifecycle = engine["session_lifecycle"]
    if type(lifecycle) is not dict:
        raise ResidualNamedCoreError("named lifecycle is absent")
    expected_artifacts = {
        "session_create_request", "pre_append_smt2", "expected_post_append_smt2",
        "journal_frontiers", "solve_request", "session", "smt2", "receipts_before",
        "receipts", "session_lifecycle",
    }
    if lifecycle.get("close_observed_state") == "closed":
        expected_artifacts.add("closed_session")
    elif lifecycle.get("close_observed_state") not in {"absent", "unknown"}:
        raise ResidualNamedCoreError("named lifecycle close state is malformed")
    if raw is not None:
        expected_artifacts.add("reconciled_solve" if engine["response_lost"] else "solve")
    if raw == "SAT":
        expected_artifacts.add("semantic")
    if "reconciliation_session" in payloads:
        if engine["response_lost"] is not True or raw is None:
            raise ResidualNamedCoreError("unexpected reconciliation session")
        expected_artifacts.add("reconciliation_session")
    if set(payloads) != expected_artifacts:
        raise ResidualNamedCoreError("named engine artifact inventory drifted")
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
        or (
            not engine["response_lost"]
            and engine["request_replayed"] is not False
        )
    ):
        raise ResidualNamedCoreError("named engine identity or replay state drifted")
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
            raise ResidualNamedCoreError("named solve digest or receipt drifted")
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
        raise ResidualNamedCoreError("transport-loss status custody drifted")
    if prepared.key in POSITIVE_CONTROL_KEYS:
        if raw != "SAT" or engine["effective_status"] != "SAT_SEMANTICALLY_REPLAYED":
            raise ResidualNamedCoreError("positive named control failed")
    elif prepared.key in NEGATIVE_CONTROL_KEYS:
        if raw != "UNSAT":
            raise ResidualNamedCoreError("negative named control failed")
        _validate_core(prepared, engine)
    elif raw == "UNSAT":
        _validate_core(prepared, engine)
    elif raw == "UNKNOWN":
        if (
            engine["effective_status"] != "INCONCLUSIVE_UNKNOWN"
            or engine["semantic_replay"] is not None
            or engine["unsat_assumptions"] is not None
        ):
            raise ResidualNamedCoreError("UNKNOWN classification drifted")
    elif raw is None:
        return "INCONCLUSIVE_TRANSPORT_LOSS"
    elif raw != "SAT":
        raise ResidualNamedCoreError("target status drifted")
    if raw == "SAT":
        if solve is None:
            raise ResidualNamedCoreError("SAT solve is absent")
        semantic = engine["semantic_replay"]
        if (
            engine["effective_status"] != "SAT_SEMANTICALLY_REPLAYED"
            or "semantic" not in payloads
            or _strict(payloads["semantic"], "semantic replay") != semantic
            or semantic != _expected_semantic(prepared, solve)
            or semantic.get("accepted") is not True
        ):
            raise ResidualNamedCoreError("SAT exact rational replay drifted")
        return "SAT_SEMANTICALLY_REPLAYED"
    if raw == "UNSAT":
        return "UNSAT_NAMED_CORE"
    return "INCONCLUSIVE_UNKNOWN"


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
        "representative_family": prepared.system["representative_family"],
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
        raise ResidualNamedCoreError("query output directory is unsafe")
    result = _strict(_read(output / "result.json"), "query result")
    expected_identity = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": prepared.solver,
        "source_id": prepared.system["source_id"],
        "representative_family": prepared.system["representative_family"],
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
        raise ResidualNamedCoreError("query result identity drifted")
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "source_record", "descriptor", "original_smt2", "journal_smt2", "sources"
    }:
        raise ResidualNamedCoreError("query custody is malformed")
    seen = {"result.json"}
    expected_payloads = {
        "source_record": _json(prepared.system),
        "descriptor": prepared.query.descriptor_bytes,
        "original_smt2": prepared.query.original_smt2,
        "journal_smt2": prepared.query.journal_smt2,
    }
    for key, expected in expected_payloads.items():
        if _verify_artifact(output, custody[key], seen) != expected:
            raise ResidualNamedCoreError(f"query {key} custody drifted")
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(prepared.query.source_files):
        raise ResidualNamedCoreError("query source custody count drifted")
    for record, snapshot in zip(source_records, prepared.query.source_files, strict=True):
        if _verify_artifact(output, record, seen) != snapshot.payload:
            raise ResidualNamedCoreError("query source snapshot drifted")
    engine = result.get("engine")
    if type(engine) is not dict or type(engine.get("artifacts")) is not dict:
        raise ResidualNamedCoreError("query engine is malformed")
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
        raise ResidualNamedCoreError("query output contains unsafe or unbound artifacts")
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
    except ResidualNamedCoreError:
        raise
    except (OSError, adapter.SmtSourceAdapterError) as exc:
        raise ResidualNamedCoreError("authenticated named-core PIQD query failed") from exc
    return verify_query_tree(prepared, output)


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict(_read(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owned_paths") != _OWNED_PATHS
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256") != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise ResidualNamedCoreError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    parent = authenticate_parent_run()
    formula_family_record()
    source_paths = [
        Path(__file__), Path(source.__file__), Path(adapter.__file__), TEST_PATH,
        RUNNER_PATH, SPEC_PATH, CHECKPOINT_PATH,
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
            [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
            + parent_result_paths
        ),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _require_safe_run_ancestors() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise ResidualNamedCoreError("run root escapes repository") from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise ResidualNamedCoreError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise ResidualNamedCoreError("run-root ancestor is unsafe")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_run_ancestors()
    if RUN_ROOT.is_symlink():
        raise ResidualNamedCoreError("run root is a symlink")
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    for name in ("artifacts", "events", "tmp"):
        child = RUN_ROOT / name
        child.mkdir(exist_ok=True)
        if child.is_symlink() or not child.is_dir():
            raise ResidualNamedCoreError("run-root child is unsafe")
    if {entry.name for entry in RUN_ROOT.iterdir()} != {
        "run_manifest.json", "artifacts", "events", "tmp"
    } - ({"run_manifest.json"} if not (RUN_ROOT / "run_manifest.json").exists() else set()):
        raise ResidualNamedCoreError("run-root inventory drifted")
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists() or manifest_path.is_symlink():
        observed = _strict(_read(manifest_path), "run manifest")
        created_utc = observed.get("created_utc")
        if type(created_utc) is not str or observed != _expected_run_manifest(created_utc):
            raise ResidualNamedCoreError("run manifest source or input digest drifted")
    else:
        created_utc = datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")
        observed = _expected_run_manifest(created_utc)
        _publish_once(manifest_path, _json(observed))
    return RUN_ROOT, observed


def _flat_snapshot(path: Path, *, allow_empty: bool = False) -> list[dict[str, Any]]:
    if path.is_symlink() or not path.is_dir():
        raise ResidualNamedCoreError("runtime artifact directory is unsafe")
    records = []
    for entry in sorted(path.iterdir(), key=lambda item: item.name):
        info = entry.lstat()
        if entry.is_symlink() or not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise ResidualNamedCoreError("runtime artifact directory is nested or unsafe")
        payload = _read(entry)
        records.append({"path": entry.name, "bytes": len(payload), "sha256": _sha(payload)})
    if not records and not allow_empty:
        raise ResidualNamedCoreError("runtime artifact directory is empty")
    return records


def _runtime_snapshot(root: Path) -> dict[str, Any]:
    artifacts = root / "artifacts"
    tmp = root / "tmp"
    if artifacts.is_symlink() or not artifacts.is_dir() or tmp.is_symlink() or not tmp.is_dir():
        raise ResidualNamedCoreError("runtime branches are unsafe")
    if tuple(tmp.iterdir()):
        raise ResidualNamedCoreError("runtime tmp directory is not empty")
    records: dict[str, Any] = {}
    for entry in sorted(artifacts.iterdir(), key=lambda item: item.name):
        if entry.is_symlink() or not entry.is_dir():
            raise ResidualNamedCoreError("runtime artifact entry is unsafe")
        if entry.name in QUERY_KEYS:
            files = _flat_snapshot(entry)
            if "result.json" not in {record["path"] for record in files}:
                raise ResidualNamedCoreError("partial query output is not resumable")
            records[entry.name] = {"kind": "query", "files": files}
        elif _TOMBSTONE.fullmatch(entry.name):
            files = _flat_snapshot(entry, allow_empty=True)
            records[entry.name] = {"kind": "adapter-tombstone", "files": files}
        else:
            raise ResidualNamedCoreError("undeclared runtime artifact entry")
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
        raise ResidualNamedCoreError("runtime root is unsafe")
    if {entry.name for entry in root.iterdir()} != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise ResidualNamedCoreError("runtime root inventory drifted")
    _runtime_snapshot(root)
    event_names = {entry.name for entry in (root / "events").iterdir()}
    if event_names == set():
        if tuple((root / "artifacts").iterdir()):
            raise ResidualNamedCoreError("initialized root contains artifacts")
        return "INITIALIZED"
    if event_names == {"launch.json"}:
        return "LAUNCHED"
    if event_names == {"launch.json", "failure.json"}:
        return "FAILURE"
    if event_names == {"launch.json", "terminal.json"}:
        entries = {entry.name for entry in (root / "artifacts").iterdir()}
        if entries != set(QUERY_KEYS) or prepared is None:
            raise ResidualNamedCoreError("terminal artifact inventory is incomplete")
        for key in QUERY_KEYS:
            verify_query_tree(prepared[key], root / "artifacts" / key)
        return "TERMINAL"
    raise ResidualNamedCoreError("runtime event inventory drifted")


def _launch_record(
    manifest: Mapping[str, Any], server: str, timeout_ms: int
) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "queries": list(QUERY_KEYS),
        "server": server,
        "timeout_ms": timeout_ms,
        "workers": WORKERS,
        "sessions": len(QUERY_KEYS),
        "solves_per_session": 1,
        "transport": "maintained PIQD HTTP SMT adapter only",
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
        raise ResidualNamedCoreError("terminal result inventory is incomplete")
    target_raw = [results[key]["engine"]["raw_status"] for key in TARGET_KEYS]
    if all(status == "UNSAT" for status in target_raw):
        status = "NAMED_CORES_COMPLETE"
    elif any(item in {"UNKNOWN", None} for item in target_raw):
        status = "NAMED_CORE_INCONCLUSIVE"
    else:
        status = "NAMED_TARGET_SAT_REPLAYED"
    family = formula_family_record()
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": status,
        "formula_family_record_sha256": family["family_record_sha256"],
        "results": {
            key: {
                "solver": results[key]["solver"],
                "source_id": results[key]["source_id"],
                "representative_family": results[key]["representative_family"],
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
            "schema", "lane_id", "run_id", "run_manifest_sha256", "launch_sha256",
            "status", "formula_family_record_sha256", "results", "claims", "terminal_sha256",
        }
        or value.get("schema") != TERMINAL_SCHEMA
        or value.get("lane_id") != LANE_ID
        or value.get("run_id") != RUN_ID
        or value.get("status") not in {
            "NAMED_CORES_COMPLETE", "NAMED_CORE_INCONCLUSIVE", "NAMED_TARGET_SAT_REPLAYED"
        }
        or value.get("claims") != FALSE_CLAIMS
        or value.get("terminal_sha256") != _self_hash(value, "terminal_sha256")
    ):
        raise ResidualNamedCoreError("terminal record is malformed")
    return value


def _read_failure(root: Path, manifest: Mapping[str, Any]) -> dict[str, Any]:
    failure = _strict(_read(root / "events/failure.json"), "failure")
    if (
        set(failure)
        != {
            "schema", "lane_id", "run_id", "run_manifest_sha256", "error_type",
            "error", "retained", "claims", "failure_sha256",
        }
        or failure.get("schema") != FAILURE_SCHEMA
        or failure.get("lane_id") != LANE_ID
        or failure.get("run_id") != RUN_ID
        or failure.get("run_manifest_sha256") != manifest.get("manifest_sha256")
        or type(failure.get("error_type")) is not str
        or type(failure.get("error")) is not str
        or failure.get("retained") != _runtime_snapshot(root)
        or failure.get("claims") != FALSE_CLAIMS
        or failure.get("failure_sha256") != _self_hash(failure, "failure_sha256")
    ):
        raise ResidualNamedCoreError("failure record custody drifted")
    if _inventory(root) != "FAILURE":
        raise ResidualNamedCoreError("failure phase drifted")
    return failure


def _write_failure(
    root: Path, manifest: Mapping[str, Any], error: BaseException | str
) -> dict[str, Any]:
    if os.path.lexists(root / "events/terminal.json"):
        raise ResidualNamedCoreError("terminal cannot acquire a failure record")
    path = root / "events/failure.json"
    if path.exists() or path.is_symlink():
        return _read_failure(root, manifest)
    if {entry.name for entry in (root / "events").iterdir()} != {"launch.json"}:
        raise ResidualNamedCoreError("failure publication found invalid event state")
    failure = {
        "schema": FAILURE_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "error_type": type(error).__name__ if isinstance(error, BaseException) else "error",
        "error": str(error),
        "retained": _runtime_snapshot(root),
        "claims": dict(FALSE_CLAIMS),
    }
    failure["failure_sha256"] = _self_hash(failure, "failure_sha256")
    _publish_once(path, _json(failure))
    return _read_failure(root, manifest)


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
        raise ResidualNamedCoreError("invalid PIQD server URL")
    return server.rstrip("/")


def run_campaign(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = WORKERS,
    init_only: bool = False,
    transport: adapter.PiqdTransport | None = None,
) -> dict[str, Any]:
    if type(workers) is not int or type(workers) is bool or workers != WORKERS:
        raise ResidualNamedCoreError("workers must be exactly 1")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise ResidualNamedCoreError("timeout must be exact milliseconds in (0,3600]")
    root, manifest = ensure_run_root()
    parent = authenticate_parent_run()
    timeout_ms = int(timeout_s * 1000)
    prepared = {
        key: prepare_query(key, timeout_ms=timeout_ms, parent=parent) for key in QUERY_KEYS
    }
    phase = _inventory(root, prepared)
    if init_only:
        if phase != "INITIALIZED":
            raise ResidualNamedCoreError("init-only requires a pristine initialized root")
        return {
            "status": "INITIALIZED", "lane_id": LANE_ID,
            "run_manifest_sha256": manifest["manifest_sha256"],
            "formula_family_record_sha256": formula_family_record()[
                "family_record_sha256"
            ],
            "representatives": list(REPRESENTATIVES.values()),
        }
    server = _validate_server(server)
    launch = _launch_record(manifest, server, timeout_ms)
    launch_path = root / "events/launch.json"
    terminal_path = root / "events/terminal.json"
    failure_path = root / "events/failure.json"
    if terminal_path.exists() or terminal_path.is_symlink():
        if _strict(_read(launch_path), "launch") != launch:
            raise ResidualNamedCoreError("launch differs on terminal replay")
        stored = _read_terminal(terminal_path)
        results = {
            key: verify_query_tree(prepared[key], root / "artifacts" / key)
            for key in QUERY_KEYS
        }
        expected = _terminal_record(manifest, launch, results)
        if stored != expected or _inventory(root, prepared) != "TERMINAL":
            raise ResidualNamedCoreError("terminal differs from artifact replay")
        return stored
    if failure_path.exists() or failure_path.is_symlink():
        _read_failure(root, manifest)
        raise ResidualNamedCoreError("existing failure record blocks resume")
    try:
        if launch_path.exists() or launch_path.is_symlink():
            if _strict(_read(launch_path), "launch") != launch:
                raise ResidualNamedCoreError("launch differs on resume")
        else:
            _publish_once(launch_path, _json(launch))
        if _inventory(root, prepared) != "LAUNCHED":
            raise ResidualNamedCoreError("launch inventory drifted")
        active_transport = transport
        if active_transport is None:
            active_transport = adapter.UrllibPiqdTransport(
                server, http_timeout_s=timeout_s + 40
            )
        results: dict[str, dict[str, Any]] = {}
        session_ids: set[str] = set()
        for key in QUERY_KEYS:
            result = run_query(
                prepared[key], root / "artifacts" / key, active_transport, session_ids
            )
            session_id = result["engine"]["session_id"]
            if type(session_id) is not str or session_id in {
                row["engine"]["session_id"] for row in results.values()
            }:
                raise ResidualNamedCoreError("query session identities crossed")
            results[key] = result
        terminal = _terminal_record(manifest, launch, results)
        _publish_once(terminal_path, _json(terminal))
        if _inventory(root, prepared) != "TERMINAL":
            raise ResidualNamedCoreError("terminal inventory drifted after publication")
        return terminal
    except Exception as exc:
        if not os.path.lexists(terminal_path):
            _write_failure(root, manifest, exc)
        raise


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=WORKERS)
    parser.add_argument("--init-only", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_campaign(
            server=args.server, timeout_s=args.timeout, workers=args.workers,
            init_only=args.init_only,
        )
    except Exception as exc:  # noqa: BLE001 -- ordinary failures are CLI diagnostics
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "DEFAULT_TIMEOUT_S", "DESCRIPTOR_SCHEMA", "FALSE_CLAIMS", "LANE_ID",
    "QUERY_KEYS", "QUERY_PLAN", "RUN_ID", "RUN_ROOT", "SOLVER_PROFILE_SCHEMA",
    "TARGET_KEYS", "WORKERS", "PreparedQuery", "ResidualNamedCoreError",
    "authenticate_parent_run", "build_named_system", "build_smt_commands",
    "ensure_run_root", "formula_family_record", "main", "prepare_query",
    "run_campaign", "run_query", "verify_query_tree", "verify_sat_model",
]
