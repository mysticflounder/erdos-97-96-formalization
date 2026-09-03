"""Governed PIQD named-assumption core query for profile 282.

This successor reconstructs the completed profile-282 B--O QF_NRA run, guards
every retained source assertion, and asks PIQD for one named UNSAT core per
authenticated order.  It makes no theorem, source-coverage, Lean, promotion,
or closure claim.
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

from census.card_head import (
    exactfive_hard_source_swap_profile282_bo_source_qfnra_piqd as source,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-profile282-named-core-20260903"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = REPOSITORY_ROOT / "docs/specs/p97-exactfive-hard-source-swap-profile282-named-core-v1.md"
RUNNER_PATH = REPOSITORY_ROOT / "scripts/run_exactfive_hard_source_swap_profile282_named_core_piqd.py"
TEST_PATH = REPOSITORY_ROOT / "census/card_head/tests/test_exactfive_hard_source_swap_profile282_named_core_piqd.py"

PARENT_ROOT = source.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PRODUCER_SHA256 = "ecf26520ddc36916629cef396a37eeb3e7a620518ebfed3d79f4dfb3e16f0228"
PARENT_MANIFEST_FILE_SHA256 = "461b20fade74dfed19f96e4678752a04106639a1a02175479786d9b4198d7e94"
PARENT_MANIFEST_SHA256 = "5a3d9ef8ca8869a04573cd1fa525cf3938f0aac5ceb172e09064b24f0deda166"
PARENT_LAUNCH_FILE_SHA256 = "f2e6032223a35372bd982325c9438474952e824501c1f92b5eeeaaa809d84780"
PARENT_LAUNCH_SHA256 = "ff8ebbdfa89ce8428b2b2471b49a0140a27ac1ff584acdc9ccaf68d88c1c2874"
PARENT_TERMINAL_FILE_SHA256 = "9a56ffd719a50ed45cd6b3c2a80402b6eddd208f1820b06b95f3ebbc0d25d4ad"
PARENT_TERMINAL_SHA256 = "eacf4956d541580aae3bef79379873d375679e7371868e79ae54ec03044bbd98"

SYSTEM_SCHEMA = "p97-exactfive-hard-source-swap-profile282-named-core-system/v1"
DESCRIPTOR_SCHEMA = "p97-exactfive-hard-source-swap-profile282-named-core-query/v1"
SOLVER_PROFILE_SCHEMA = "p97-exactfive-hard-source-swap-profile282-named-core-solver/v1"
RESULT_SCHEMA = "p97-exactfive-hard-source-swap-profile282-named-core-result/v1"
LAUNCH_SCHEMA = "p97-exactfive-hard-source-swap-profile282-named-core-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-hard-source-swap-profile282-named-core-terminal/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
DEFAULT_TIMEOUT_S = 60.0
WORKERS = 1

FALSE_CLAIMS = {
    "live_source_completeness": False,
    "source_realization": False,
    "all_order_elimination": False,
    "lean_ingress": False,
    "live_closure": False,
    "promotion": False,
    "theorem": False,
}

QUERY_PLAN = (
    ("z3-control-positive", "z3", "control-positive"),
    ("z3-control-negative", "z3", "control-negative"),
    ("z3-target-mirror", "z3", "parent-z3-mirror"),
    ("cvc5-control-positive", "cvc5", "control-positive"),
    ("cvc5-control-negative", "cvc5", "control-negative"),
    ("cvc5-target-direct", "cvc5", "parent-cvc5-direct"),
)
QUERY_KEYS = tuple(row[0] for row in QUERY_PLAN)
TARGET_KEYS = ("z3-target-mirror", "cvc5-target-direct")
NEGATIVE_CONTROL_KEYS = ("z3-control-negative", "cvc5-control-negative")
POSITIVE_CONTROL_KEYS = ("z3-control-positive", "cvc5-control-positive")
_CHECKPOINT_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_profile282_named_core_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_profile282_named_core_piqd.py",
    "docs/specs/p97-exactfive-hard-source-swap-profile282-named-core-v1.md",
    "scripts/run_exactfive_hard_source_swap_profile282_named_core_piqd.py",
]


class Profile282NamedCoreError(RuntimeError):
    """The named-core producer failed closed."""


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
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=True,
        allow_nan=False,
    ).encode("ascii")


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _utc_now() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _read_regular(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        before = path.lstat()
    except OSError as exc:
        raise Profile282NamedCoreError(f"artifact is missing or unreadable: {path}") from exc
    if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1 or before.st_size > limit:
        raise Profile282NamedCoreError(f"unsafe artifact: {path}")
    payload = path.read_bytes()
    after = path.lstat()
    if (
        len(payload) != before.st_size
        or (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns)
        != (after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns)
    ):
        raise Profile282NamedCoreError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise Profile282NamedCoreError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise Profile282NamedCoreError(f"{where} is not an object")
    return value


def _create_once(path: Path, payload: bytes) -> None:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    try:
        descriptor = os.open(path, flags, 0o600)
    except FileExistsError as exc:
        raise Profile282NamedCoreError(f"immutable artifact already exists: {path}") from exc
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
    except BaseException:
        path.unlink(missing_ok=True)
        raise


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise Profile282NamedCoreError("manifest path lies outside repository") from exc


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read_regular(path)) for path in sorted(paths)}


def authenticate_parent_run() -> dict[str, Any]:
    """Reconstruct the committed predecessor and its completed run."""

    if _sha(_read_regular(Path(source.__file__))) != PARENT_PRODUCER_SHA256:
        raise Profile282NamedCoreError("parent producer bytes drifted")
    manifest_file = _read_regular(PARENT_MANIFEST_PATH)
    launch_file = _read_regular(PARENT_LAUNCH_PATH)
    terminal_file = _read_regular(PARENT_TERMINAL_PATH)
    if (
        _sha(manifest_file) != PARENT_MANIFEST_FILE_SHA256
        or _sha(launch_file) != PARENT_LAUNCH_FILE_SHA256
        or _sha(terminal_file) != PARENT_TERMINAL_FILE_SHA256
    ):
        raise Profile282NamedCoreError("parent root records drifted")
    root, manifest = source.ensure_run_root()
    if root != PARENT_ROOT or manifest.get("manifest_sha256") != PARENT_MANIFEST_SHA256:
        raise Profile282NamedCoreError("parent run manifest identity drifted")
    launch = _strict_json(launch_file, "parent launch")
    terminal = source._read_terminal(PARENT_TERMINAL_PATH)
    if (
        launch.get("launch_sha256") != PARENT_LAUNCH_SHA256
        or terminal.get("terminal_sha256") != PARENT_TERMINAL_SHA256
        or terminal.get("status") != "TARGETS_UNSAT_DISCOVERY_ONLY"
    ):
        raise Profile282NamedCoreError("parent completed-run identity drifted")
    systems = {
        "control-positive": source.build_control_system("positive"),
        "control-negative": source.build_control_system("negative"),
        **{order_id: source.build_target_system(order_id) for order_id in source.ORDER_IDS},
    }
    prepared = {
        key: source.prepare_query(system, timeout_ms=launch["timeout_ms"])
        for key, system in systems.items()
    }
    results = {
        key: source.verify_adapter_tree(item, PARENT_ROOT / "artifacts" / key)
        for key, item in prepared.items()
    }
    expected_terminal = source._terminal_record(PARENT_ROOT, launch, results)
    if terminal != expected_terminal:
        raise Profile282NamedCoreError("parent terminal does not reconstruct")
    return {
        "schema": "p97-exactfive-hard-source-swap-profile282-parent-custody/v1",
        "producer_sha256": PARENT_PRODUCER_SHA256,
        "run_manifest_sha256": PARENT_MANIFEST_SHA256,
        "launch_sha256": PARENT_LAUNCH_SHA256,
        "terminal_sha256": PARENT_TERMINAL_SHA256,
        "profile_index": source.PROFILE_INDEX,
        "profile_sha256": source.PROFILE_SHA256,
        "result_sha256": {
            key: _sha(_read_regular(PARENT_ROOT / "artifacts" / key / "result.json"))
            for key in systems
        },
        "claims": dict(FALSE_CLAIMS),
    }


def _source_system(source_id: str) -> dict[str, Any]:
    if source_id == "control-positive":
        return source.build_control_system("positive")
    if source_id == "control-negative":
        return source.build_control_system("negative")
    if source_id in source.ORDER_IDS:
        return source.build_target_system(source_id)
    raise Profile282NamedCoreError(f"unknown source system: {source_id}")


def _target_ledger(system: Mapping[str, Any]) -> list[dict[str, Any]]:
    ledger: list[dict[str, Any]] = []
    normalization_body = "(and (= (+ (* 4 r r) (- 3)) 0) (> r 0))"
    ledger.append(
        {
            "family": "normalization",
            "index": 0,
            "source_entry": system["normalization"],
            "source_body": normalization_body,
        }
    )
    for index, entry in enumerate(system["row_equality_ledger"]):
        ledger.append(
            {
                "family": "row-equality",
                "index": index,
                "source_entry": entry,
                "source_body": f"(= {entry['reduced_smt']} 0)",
            }
        )
    radius = system["radius_disequality"]
    ledger.append(
        {
            "family": "radius-disequality",
            "index": 0,
            "source_entry": radius,
            "source_body": f"(not (= {radius['reduced_smt']} 0))",
        }
    )
    strict = system["source_strict"]
    ledger.append(
        {
            "family": "source-strict",
            "index": 0,
            "source_entry": strict,
            "source_body": f"(< {strict['reduced_smt']} 0)",
        }
    )
    for index, entry in enumerate(system["area_ledger"]):
        ledger.append(
            {
                "family": "strict-signed-area",
                "index": index,
                "source_entry": entry,
                "source_body": f"(> {entry['reduced_smt']} 0)",
            }
        )
    if len(ledger) != 302:
        raise Profile282NamedCoreError("target ledger does not contain 302 groups")
    return ledger


def _control_ledger(system: Mapping[str, Any]) -> list[dict[str, Any]]:
    commands = source.build_smt_commands(system)
    bodies = [command[len("(assert ") : -1] for command in commands if command.startswith("(assert ")]
    return [
        {
            "family": f"control-{system['control']}",
            "index": index,
            "source_entry": {"command": f"(assert {body})"},
            "source_body": body,
        }
        for index, body in enumerate(bodies)
    ]


def _assumption_id(family: str, index: int) -> str:
    prefixes = {
        "normalization": "normalization",
        "row-equality": "row",
        "radius-disequality": "radius",
        "source-strict": "source-strict",
        "strict-signed-area": "area",
        "control-positive": "control-positive",
        "control-negative": "control-negative",
    }
    return f"{prefixes[family]}-{index:03d}"


def _assumption_term(assumption_id: str) -> str:
    return "assume_" + assumption_id.replace("-", "_")


def build_named_system(source_id: str, solver: str) -> dict[str, Any]:
    if solver not in adapter.SOLVERS:
        raise Profile282NamedCoreError("solver is not maintained by the PIQD SMT adapter")
    original = _source_system(source_id)
    original = source._validate_system_current(original)
    original_commands = source.build_smt_commands(original)
    original_journal = b"".join(command.encode("ascii") + b"\n" for command in original_commands)
    ledger = _target_ledger(original) if original["kind"] == "target" else _control_ledger(original)
    source_system_sha256 = _sha(_canonical(original))
    source_ledger_sha256 = _sha(_canonical(ledger))
    bindings = []
    for entry in ledger:
        assumption_id = _assumption_id(entry["family"], entry["index"])
        binding = {
            "schema": "p97-profile282-named-assumption-label/v1",
            "assumption_id": assumption_id,
            "assumption_term": _assumption_term(assumption_id),
            "family": entry["family"],
            "index": entry["index"],
            "source_ledger_entry": entry["source_entry"],
            "source_body": entry["source_body"],
            "source_system_sha256": source_system_sha256,
            "source_ledger_sha256": source_ledger_sha256,
        }
        binding["label_sha256"] = _self_hash(binding, "label_sha256")
        bindings.append(binding)
    system = {
        "schema": SYSTEM_SCHEMA,
        "solver": solver,
        "source_id": source_id,
        "source_system": original,
        "source_system_sha256": source_system_sha256,
        "source_unguarded_commands": list(original_commands),
        "source_unguarded_journal_sha256": _sha(original_journal),
        "source_ledger": ledger,
        "source_ledger_sha256": source_ledger_sha256,
        "assumption_bindings": bindings,
        "claims": dict(FALSE_CLAIMS),
    }
    return system


def _validate_named_system(value: object) -> dict[str, Any]:
    if type(value) is not dict or value.get("schema") != SYSTEM_SCHEMA:
        raise Profile282NamedCoreError("named system is malformed")
    expected = build_named_system(value.get("source_id"), value.get("solver"))
    if value != expected:
        raise Profile282NamedCoreError("named system drifted from source ledger")
    return dict(value)


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    current = _validate_named_system(system)
    original = current["source_system"]
    out = ["(set-logic QF_NRA)"]
    for variable in original["variables"]:
        out.append(f"(declare-fun {variable} () Real)")
    for binding in current["assumption_bindings"]:
        out.append(f"(declare-fun {binding['assumption_term']} () Bool)")
    for binding in current["assumption_bindings"]:
        out.append(
            f"(assert (=> {binding['assumption_term']} {binding['source_body']}))"
        )
    return tuple(out)


def _source_snapshots(
    parent: Mapping[str, Any], system: Mapping[str, Any]
) -> tuple[adapter.SourceSnapshot, ...]:
    unguarded = b"".join(
        command.encode("ascii") + b"\n" for command in system["source_unguarded_commands"]
    )
    snapshots = (
        adapter.SourceSnapshot("0000-parent-custody.json", _json(parent)),
        adapter.SourceSnapshot("0001-named-system.json", _json(system)),
        adapter.SourceSnapshot("parent-run-manifest.json", _read_regular(PARENT_MANIFEST_PATH)),
        adapter.SourceSnapshot("parent-launch.json", _read_regular(PARENT_LAUNCH_PATH)),
        adapter.SourceSnapshot("parent-terminal.json", _read_regular(PARENT_TERMINAL_PATH)),
        adapter.SourceSnapshot("source-unguarded.smt2", unguarded),
        adapter.SourceSnapshot("implementation-named-core.py", _read_regular(Path(__file__))),
        adapter.SourceSnapshot("implementation-parent.py", _read_regular(Path(source.__file__))),
        adapter.SourceSnapshot("implementation-adapter.py", _read_regular(Path(adapter.__file__))),
        adapter.SourceSnapshot("specification.md", _read_regular(SPEC_PATH)),
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
        raise Profile282NamedCoreError(f"unknown query key: {key}")
    if type(timeout_ms) is not int or type(timeout_ms) is bool or not 0 < timeout_ms <= 3_600_000:
        raise Profile282NamedCoreError("query timeout is invalid")
    solver, source_id = plan[key]
    parent_record = dict(parent or authenticate_parent_run())
    system = build_named_system(source_id, solver)
    commands = build_smt_commands(system)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise Profile282NamedCoreError("SMT journal normalization drifted")
    variables = [
        {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
        for variable in system["source_system"]["variables"]
    ]
    variables.sort(key=lambda item: item["id"])
    bindings = system["assumption_bindings"]
    named_atoms = sorted(
        (
            {"id": binding["assumption_id"], "assumption_term": binding["assumption_term"]}
            for binding in bindings
        ),
        key=lambda item: item["id"],
    )
    assumption_ids = [binding["assumption_id"] for binding in bindings]
    assumption_labels = tuple(binding["label_sha256"] for binding in bindings)
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "parent_custody_sha256": _sha(_canonical(parent_record)),
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _source_snapshots(parent_record, system)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-profile282-named-core-piqd", "version": "v1"},
        "semantic_verifier": {
            "id": "profile282-unguarded-exact-rational-source-replay",
            "version": "v1",
        },
        "stage_id": "profile282-named-assumption-core",
        "query_id": key,
        "sources": [
            {"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)}
            for item in snapshots
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {"path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)},
        "variables": variables,
        "named_atoms": named_atoms,
        "solve": {
            "assumption_ids": assumption_ids,
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
        descriptor,
        _json(descriptor),
        journal,
        commands,
        journal,
        snapshots,
    )
    return PreparedQuery(key, solver, system, query, assumption_labels)


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict:
        raise Profile282NamedCoreError("semantic input is malformed")
    system = _validate_named_system(semantic.get("system"))
    if solver != system["solver"] or type(values) is not str:
        raise Profile282NamedCoreError("SAT replay solver or values drifted")
    timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
    unguarded = source.prepare_query(system["source_system"], timeout_ms=timeout_ms)
    verification = source.verify_sat_model(unguarded.query, solver, model, values)
    evidence = {
        "unguarded_profile_replay": verification.evidence,
        "unguarded_source_system_sha256": system["source_system_sha256"],
        "unguarded_journal_sha256": system["source_unguarded_journal_sha256"],
        "guarded_assumption_count": len(system["assumption_bindings"]),
    }
    return adapter.SemanticVerification(verification.accepted, evidence)


def _validate_core(prepared: PreparedQuery, engine: Mapping[str, Any]) -> None:
    provenance = engine.get("unsat_assumptions")
    if engine.get("raw_status") != "UNSAT" or engine.get("effective_status") != "UNSAT_DISCOVERY_ONLY":
        raise Profile282NamedCoreError(f"{prepared.key} did not return UNSAT")
    if type(provenance) is not dict:
        raise Profile282NamedCoreError("UNSAT result lacks named-core provenance")
    terms = provenance.get("assumption_terms")
    ids = provenance.get("source_atom_ids")
    labels = provenance.get("core_labels")
    if (
        type(terms) is not list
        or not terms
        or type(ids) is not list
        or type(labels) is not list
        or provenance.get("terminal_unsat") is not False
        or provenance.get("named_core_support") is not True
        or provenance.get("ordered_assumption_labels") != list(prepared.assumption_labels)
    ):
        raise Profile282NamedCoreError("UNSAT core is empty, terminal, or unlabeled")
    binding_by_term = {
        binding["assumption_term"]: binding for binding in prepared.system["assumption_bindings"]
    }
    expected = [binding_by_term.get(term) for term in terms]
    if (
        any(binding is None for binding in expected)
        or ids != [binding["assumption_id"] for binding in expected]
        or labels != [binding["label_sha256"] for binding in expected]
    ):
        raise Profile282NamedCoreError("returned core labels or provenance drifted")


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise Profile282NamedCoreError("artifact record is malformed")
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen:
        raise Profile282NamedCoreError("artifact path is unsafe or duplicated")
    payload = _read_regular(root / name)
    if record["bytes"] != len(payload) or record["sha256"] != _sha(payload):
        raise Profile282NamedCoreError(f"artifact digest mismatch: {name}")
    seen.add(name)
    return payload


def _query_request_id(key: str) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


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


def verify_query_tree(prepared: PreparedQuery, output_directory: Path) -> dict[str, Any]:
    if output_directory.is_symlink() or not output_directory.is_dir():
        raise Profile282NamedCoreError("query output directory is unsafe")
    result = _strict_json(_read_regular(output_directory / "result.json"), "query result")
    if (
        result.get("schema") != RESULT_SCHEMA
        or result.get("key") != prepared.key
        or result.get("solver") != prepared.solver
        or result.get("claims") != FALSE_CLAIMS
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
    ):
        raise Profile282NamedCoreError("query result identity drifted")
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "source_record", "descriptor", "original_smt2", "journal_smt2", "sources"
    }:
        raise Profile282NamedCoreError("query custody is malformed")
    seen = {"result.json"}
    expected_payloads = {
        "source_record": _json(prepared.system),
        "descriptor": prepared.query.descriptor_bytes,
        "original_smt2": prepared.query.original_smt2,
        "journal_smt2": prepared.query.journal_smt2,
    }
    for key, expected in expected_payloads.items():
        if _verify_artifact(output_directory, custody[key], seen) != expected:
            raise Profile282NamedCoreError(f"query {key} custody drifted")
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(prepared.query.source_files):
        raise Profile282NamedCoreError("query source custody count drifted")
    for record, snapshot in zip(source_records, prepared.query.source_files, strict=True):
        if _verify_artifact(output_directory, record, seen) != snapshot.payload:
            raise Profile282NamedCoreError("query source snapshot drifted")
    engine = result.get("engine")
    if type(engine) is not dict or engine.get("solver") != prepared.solver:
        raise Profile282NamedCoreError("query engine identity drifted")
    artifacts = engine.get("artifacts")
    if type(artifacts) is not dict:
        raise Profile282NamedCoreError("query engine artifacts are malformed")
    payloads = {
        label: _verify_artifact(output_directory, record, seen)
        for label, record in artifacts.items()
    }
    solve_label = "reconciled_solve" if engine.get("response_lost") else "solve"
    if solve_label not in payloads:
        raise Profile282NamedCoreError("query engine solve artifact is absent")
    try:
        solve = adapter._validate_solve(
            _strict_json(payloads[solve_label], "named solve"),
            timeout_ms=prepared.query.descriptor["solver_profile"]["timeout_ms"],
            assumptions=prepared.query.assumptions,
            assumption_labels=prepared.assumption_labels,
            named_request=True,
        )
    except adapter.SmtSourceAdapterError as exc:
        raise Profile282NamedCoreError("named solve artifact failed replay") from exc
    digest = adapter.piqd_result_digest(solve)
    expected_provenance = adapter._unsat_assumption_provenance(
        prepared.query, solve, prepared.assumption_labels
    )
    advisory = engine.get("result_digest_advisory")
    if (
        solve.get("status") != engine.get("raw_status")
        or solve.get("solve_index") != engine.get("solve_index")
        or solve.get("result_sha256") != digest
        or engine.get("result_sha256") != digest
        or engine.get("request_id") != _query_request_id(prepared.key)
        or engine.get("request_sha256")
        != adapter.piqd_solve_request_digest(
            prepared.query, prepared.assumption_labels
        )
        or engine.get("assumption_labels") != list(prepared.assumption_labels)
        or engine.get("unsat_assumptions") != expected_provenance
        or engine.get("claims") != adapter.FALSE_CLAIMS
        or type(advisory) is not dict
        or advisory.get("locally_recomputed") != digest
        or advisory.get("matches_daemon") is not True
    ):
        raise Profile282NamedCoreError("query engine solve custody drifted")
    if prepared.key in POSITIVE_CONTROL_KEYS:
        if engine.get("raw_status") != "SAT" or engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED":
            raise Profile282NamedCoreError("positive control failed exact SAT replay")
        semantic_payload = payloads.get("semantic")
        semantic = engine.get("semantic_replay")
        if semantic_payload is None or _strict_json(
            semantic_payload, "SAT semantic replay"
        ) != semantic:
            raise Profile282NamedCoreError("SAT semantic replay artifact drifted")
        verification = verify_sat_model(
            prepared.query,
            prepared.solver,
            solve.get("model"),
            solve.get("values"),
        )
        expected_semantic = {
            "accepted": verification.accepted,
            "evidence": verification.evidence,
            "verifier": prepared.query.descriptor["semantic_verifier"],
            "model_sha256": _sha(solve["model"].encode("utf-8")),
            "values_sha256": _sha(solve["values"].encode("utf-8")),
        }
        if semantic != expected_semantic:
            raise Profile282NamedCoreError("SAT exact replay custody drifted")
    else:
        _validate_core(prepared, engine)
    entries = tuple(output_directory.iterdir())
    if (
        any(
            entry.is_symlink()
            or not entry.is_file()
            or entry.stat(follow_symlinks=False).st_nlink != 1
            for entry in entries
        )
        or {entry.name for entry in entries} != seen
    ):
        raise Profile282NamedCoreError("query output contains unbound artifacts")
    return result


def run_query(
    prepared: PreparedQuery,
    output_directory: Path,
    transport: adapter.PiqdTransport,
    used_session_ids: set[str] | None = None,
) -> dict[str, Any]:
    if output_directory.exists():
        return verify_query_tree(prepared, output_directory)
    try:
        with adapter.SmtOutputTransaction(output_directory) as transaction:
            source_record = _json(prepared.system)
            custody: dict[str, Any] = {}
            for key, name, payload in (
                ("source_record", "source-record.json", source_record),
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
            if used_session_ids is None:
                used_session_ids = set()
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
                request_id=_query_request_id(prepared.key),
                assumption_labels=prepared.assumption_labels,
            )
            if prepared.key in POSITIVE_CONTROL_KEYS:
                if engine.get("raw_status") != "SAT" or engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED":
                    raise Profile282NamedCoreError("positive control failed")
            else:
                _validate_core(prepared, engine)
            result = _result_record(prepared, engine, custody)
            transaction.write_bytes("result.json", _json(result))
            transaction.publish()
    except Profile282NamedCoreError:
        raise
    except (OSError, adapter.SmtSourceAdapterError) as exc:
        raise Profile282NamedCoreError("authenticated PIQD named-core query failed") from exc
    return verify_query_tree(prepared, output_directory)


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owned_paths") != _CHECKPOINT_OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256") != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile282NamedCoreError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    source_paths = [
        Path(__file__),
        RUNNER_PATH,
        TEST_PATH,
        SPEC_PATH,
        Path(source.__file__),
        Path(adapter.__file__),
    ]
    input_paths = [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_digest_map(source_paths),
        "input_digests": _source_digest_map(input_paths),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _require_safe_run_ancestors() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise Profile282NamedCoreError("run root escapes repository") from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise Profile282NamedCoreError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current = current / part
        if current.is_symlink():
            raise Profile282NamedCoreError("run-root ancestor is a symlink")
        if current.exists() and not current.is_dir():
            raise Profile282NamedCoreError("run-root ancestor is not a directory")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_run_ancestors()
    if RUN_ROOT.is_symlink():
        raise Profile282NamedCoreError("run root is a symlink")
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    _require_safe_run_ancestors()
    if RUN_ROOT.is_symlink() or not RUN_ROOT.is_dir():
        raise Profile282NamedCoreError("run root is unsafe")
    for name in ("artifacts", "events", "tmp"):
        child = RUN_ROOT / name
        child.mkdir(exist_ok=True)
        if child.is_symlink() or not child.is_dir():
            raise Profile282NamedCoreError("run-root child is unsafe")
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists():
        observed = _strict_json(_read_regular(manifest_path), "run manifest")
        created_utc = observed.get("created_utc")
        if type(created_utc) is not str or observed != _expected_run_manifest(created_utc):
            raise Profile282NamedCoreError("run manifest or source digest drifted")
    else:
        observed = _expected_run_manifest(_utc_now())
        _create_once(manifest_path, _json(observed))
    return RUN_ROOT, observed


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
        raise Profile282NamedCoreError("invalid PIQD server URL")
    return server.rstrip("/")


def _launch_record(manifest: Mapping[str, Any], server: str, timeout_ms: int) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "queries": list(QUERY_KEYS),
        "server": server,
        "timeout_ms": timeout_ms,
        "workers": WORKERS,
        "sessions": 6,
        "solves_per_session": 1,
        "transport": "maintained PIQD HTTP SMT adapter only",
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _terminal_record(
    manifest: Mapping[str, Any], launch: Mapping[str, Any], results: Mapping[str, Mapping[str, Any]]
) -> dict[str, Any]:
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": "NAMED_CORES_COMPLETE",
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


def run_campaign(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = WORKERS,
    transport: adapter.PiqdTransport | None = None,
) -> dict[str, Any]:
    if workers != WORKERS or type(workers) is bool:
        raise Profile282NamedCoreError("workers must be exactly 1")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise Profile282NamedCoreError("timeout must be exact milliseconds in (0,3600]")
    server = _validate_server(server)
    timeout_ms = int(timeout_s * 1000)
    root, manifest = ensure_run_root()
    parent = authenticate_parent_run()
    prepared = {key: prepare_query(key, timeout_ms=timeout_ms, parent=parent) for key in QUERY_KEYS}
    launch = _launch_record(manifest, server, timeout_ms)
    launch_path = root / "events/launch.json"
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch") != launch:
            raise Profile282NamedCoreError("launch record differs on resume")
    else:
        _create_once(launch_path, _json(launch))
    terminal_path = root / "events/terminal.json"
    results: dict[str, dict[str, Any]] = {}
    used_session_ids: set[str] = set()
    for key in QUERY_KEYS:
        output = root / "artifacts" / key
        if output.exists():
            results[key] = verify_query_tree(prepared[key], output)
            session_id = results[key]["engine"].get("session_id")
            if type(session_id) is not str or session_id in used_session_ids:
                raise Profile282NamedCoreError("query session identities are not distinct")
            used_session_ids.add(session_id)
    if terminal_path.exists():
        stored = _strict_json(_read_regular(terminal_path), "terminal")
        if set(results) != set(QUERY_KEYS) or stored != _terminal_record(manifest, launch, results):
            raise Profile282NamedCoreError("terminal differs from artifact replay")
        return stored
    if transport is None:
        transport = adapter.UrllibPiqdTransport(server, http_timeout_s=timeout_s + 40)
    for key in QUERY_KEYS:
        if key not in results:
            results[key] = run_query(
                prepared[key],
                root / "artifacts" / key,
                transport,
                used_session_ids,
            )
    terminal = _terminal_record(manifest, launch, results)
    _create_once(terminal_path, _json(terminal))
    return terminal


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=WORKERS)
    parser.add_argument("--init-only", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        if args.init_only:
            _, manifest = ensure_run_root()
            result: Mapping[str, Any] = manifest
        else:
            result = run_campaign(
                server=args.server, timeout_s=args.timeout, workers=args.workers
            )
    except (Profile282NamedCoreError, adapter.SmtSourceAdapterError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "DEFAULT_TIMEOUT_S",
    "DESCRIPTOR_SCHEMA",
    "FALSE_CLAIMS",
    "LANE_ID",
    "QUERY_KEYS",
    "QUERY_PLAN",
    "RUN_ID",
    "RUN_ROOT",
    "SOLVER_PROFILE_SCHEMA",
    "TARGET_KEYS",
    "WORKERS",
    "PreparedQuery",
    "Profile282NamedCoreError",
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
