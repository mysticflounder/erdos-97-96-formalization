"""Governed PIQD-only confirmation of the profile-282 mirror assumption core.

The six solver cells are discovery computations about explicitly selected
guarded formulas.  They make no theorem, source-completeness, Lean-ingress, or
closure claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import stat
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_hard_source_swap_profile282_named_core_piqd as predecessor,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-profile282-core-confirmation-20260903"
RUN_ID = "run-0002"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = (
    REPOSITORY_ROOT
    / "docs/specs/p97-exactfive-hard-source-swap-profile282-core-confirmation-v1.md"
)
RUNNER_PATH = (
    REPOSITORY_ROOT
    / "scripts/run_exactfive_hard_source_swap_profile282_core_confirmation_piqd.py"
)
TEST_PATH = (
    REPOSITORY_ROOT
    / "census/card_head/tests/test_exactfive_hard_source_swap_profile282_core_confirmation_piqd.py"
)

PREDECESSOR_ROOT = predecessor.RUN_ROOT
PREDECESSOR_MANIFEST_PATH = PREDECESSOR_ROOT / "run_manifest.json"
PREDECESSOR_LAUNCH_PATH = PREDECESSOR_ROOT / "events/launch.json"
PREDECESSOR_COMPLETED_KEYS = (
    "z3-control-positive",
    "z3-control-negative",
    "z3-target-mirror",
    "cvc5-control-positive",
    "cvc5-control-negative",
)
PREDECESSOR_UNKNOWN_SESSION_ID = "040a1d20-c6c7-464a-96eb-ad09670e560c"
PREDECESSOR_UNKNOWN_REQUEST_ID = "a28b5a03-7022-5a6b-aa9f-8b7b09795062"
PREDECESSOR_UNKNOWN_REQUEST_SHA256 = (
    "932922d3bf5ce42f2ac30b039411e630c18b0052aef83b4140780cda2b987ea6"
)
PREDECESSOR_UNKNOWN_RESULT_SHA256 = (
    "beff21f8ac8e0d1f15e4f2fc020b3c717ba7b520cb91e001e49ac8d2f5096f3a"
)
PREDECESSOR_UNKNOWN_JOURNAL_SHA256 = (
    "a86f8a43e33eaad540429d23d2250873a65700a93fbd18c9e1ecfde6e1c5a962"
)
PREDECESSOR_UNKNOWN_SOLVER_SHA256 = (
    "fae4cef47a4e82e3b37f8928b5cb275c8a86d138a33e49d54a9933a157b57f74"
)

FIVE_CORE_IDS = (
    "normalization-000",
    "row-009",
    "area-059",
    "area-144",
    "area-244",
)
FOUR_CORE_IDS = (
    "normalization-000",
    "row-009",
    "area-059",
    "area-244",
)
DIRECT_FOUR_IDS = (
    "normalization-000",
    "row-009",
    "area-023",
    "area-184",
)
QUERY_PLAN = (
    ("z3-mirror-five", "z3", "parent-z3-mirror", FIVE_CORE_IDS),
    ("cvc5-mirror-five", "cvc5", "parent-z3-mirror", FIVE_CORE_IDS),
    ("z3-mirror-four", "z3", "parent-z3-mirror", FOUR_CORE_IDS),
    ("cvc5-mirror-four", "cvc5", "parent-z3-mirror", FOUR_CORE_IDS),
    ("z3-direct-four", "z3", "parent-cvc5-direct", DIRECT_FOUR_IDS),
    ("cvc5-direct-four", "cvc5", "parent-cvc5-direct", DIRECT_FOUR_IDS),
)
QUERY_KEYS = tuple(item[0] for item in QUERY_PLAN)
DEFAULT_TIMEOUT_S = 60.0
WORKERS = 1

SYSTEM_SCHEMA = "p97-exactfive-hard-source-swap-profile282-core-confirmation-system/v1"
DESCRIPTOR_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile282-core-confirmation-query/v1"
)
SOLVER_PROFILE_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile282-core-confirmation-solver/v1"
)
RESULT_SCHEMA = "p97-exactfive-hard-source-swap-profile282-core-confirmation-result/v1"
PREDECESSOR_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile282-core-confirmation-predecessor/v1"
)
LAUNCH_SCHEMA = "p97-exactfive-hard-source-swap-profile282-core-confirmation-launch/v1"
TERMINAL_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile282-core-confirmation-terminal/v1"
)
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"

FALSE_GLOBAL_CLAIMS = {
    "all_order_elimination": False,
    "lean_ingress": False,
    "live_closure": False,
    "live_source_completeness": False,
    "promotion": False,
    "source_realization": False,
    "theorem": False,
}

_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_profile282_core_confirmation_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_profile282_core_confirmation_piqd.py",
    "docs/specs/p97-exactfive-hard-source-swap-profile282-core-confirmation-v1.md",
    "scripts/run_exactfive_hard_source_swap_profile282_core_confirmation_piqd.py",
]


class Profile282CoreConfirmationError(RuntimeError):
    """The core-confirmation producer failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    solver: str
    selected_ids: tuple[str, ...]
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery
    assumption_labels: tuple[str, ...]


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _read_regular(path: Path) -> bytes:
    try:
        info = path.stat(follow_symlinks=False)
    except OSError as exc:
        raise Profile282CoreConfirmationError(
            f"cannot read required path: {path}"
        ) from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or path.is_symlink():
        raise Profile282CoreConfirmationError(
            f"required path is not a single-link regular file: {path}"
        )
    try:
        payload = path.read_bytes()
    except OSError as exc:
        raise Profile282CoreConfirmationError(
            f"cannot read required path: {path}"
        ) from exc
    after = path.stat(follow_symlinks=False)
    identity = lambda item: (
        item.st_dev,
        item.st_ino,
        item.st_mode,
        item.st_nlink,
        item.st_size,
        item.st_mtime_ns,
    )
    if identity(after) != identity(info):
        raise Profile282CoreConfirmationError(
            f"required path changed while reading: {path}"
        )
    return payload


def _strict_json(payload: bytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(payload)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise Profile282CoreConfirmationError(f"{label} is not strict JSON") from exc
    if type(value) is not dict or _json(value) != payload:
        raise Profile282CoreConfirmationError(f"{label} is not canonical JSON")
    return value


def _create_once(path: Path, payload: bytes) -> None:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW
    try:
        descriptor = os.open(path, flags, 0o600)
    except OSError as exc:
        raise Profile282CoreConfirmationError(
            f"cannot create immutable artifact: {path}"
        ) from exc
    try:
        os.write(descriptor, payload)
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _read_transport_json(
    transport: adapter.PiqdTransport, path: str
) -> tuple[dict[str, Any], bytes]:
    response = transport.request_json("GET", path)
    if response.status != 200 or type(response.body) is not dict:
        raise Profile282CoreConfirmationError(f"PIQD read failed: {path}")
    payload = _json(response.body)
    return dict(response.body), payload


def authenticate_predecessor_local() -> dict[str, Any]:
    root, manifest = predecessor.ensure_run_root()
    if root != PREDECESSOR_ROOT:
        raise Profile282CoreConfirmationError("predecessor run root drifted")
    launch = _strict_json(_read_regular(PREDECESSOR_LAUNCH_PATH), "predecessor launch")
    if (
        launch.get("schema") != predecessor.LAUNCH_SCHEMA
        or launch.get("queries") != list(predecessor.QUERY_KEYS)
        or launch.get("workers") != 1
        or launch.get("solves_per_session") != 1
        or launch.get("launch_sha256")
        != predecessor._self_hash(launch, "launch_sha256")
    ):
        raise Profile282CoreConfirmationError("predecessor launch drifted")
    parent = predecessor.authenticate_parent_run()
    results: dict[str, Any] = {}
    session_ids: set[str] = set()
    for key in PREDECESSOR_COMPLETED_KEYS:
        prepared = predecessor.prepare_query(key, parent=parent)
        result = predecessor.verify_query_tree(prepared, root / "artifacts" / key)
        session_id = result["engine"].get("session_id")
        if type(session_id) is not str or session_id in session_ids:
            raise Profile282CoreConfirmationError("predecessor session custody crossed")
        session_ids.add(session_id)
        results[key] = {
            "result_sha256": result["result_sha256"],
            "session_id": session_id,
            "raw_status": result["engine"].get("raw_status"),
            "effective_status": result["engine"].get("effective_status"),
        }
    expected_statuses = {
        "z3-control-positive": "SAT",
        "z3-control-negative": "UNSAT",
        "z3-target-mirror": "UNSAT",
        "cvc5-control-positive": "SAT",
        "cvc5-control-negative": "UNSAT",
    }
    if {key: row["raw_status"] for key, row in results.items()} != expected_statuses:
        raise Profile282CoreConfirmationError("predecessor controls or target drifted")
    if (root / "artifacts/cvc5-target-direct").exists():
        raise Profile282CoreConfirmationError(
            "unexpected published predecessor cvc5 target"
        )
    anchor = {
        "manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "results": results,
    }
    anchor["anchor_sha256"] = _self_hash(anchor, "anchor_sha256")
    return {"parent": parent, "manifest": manifest, "launch": launch, "anchor": anchor}


def _validate_unknown_import(
    local: Mapping[str, Any],
    session: Mapping[str, Any],
    receipts: Mapping[str, Any],
    journal: bytes,
) -> dict[str, Any]:
    parent = local["parent"]
    planned = predecessor.prepare_query("cvc5-target-direct", parent=parent)
    expected_request = adapter.piqd_solve_request_digest(
        planned.query, planned.assumption_labels
    )
    if expected_request != PREDECESSOR_UNKNOWN_REQUEST_SHA256:
        raise Profile282CoreConfirmationError(
            "predecessor UNKNOWN request reconstruction drifted"
        )
    if (
        session.get("id") != PREDECESSOR_UNKNOWN_SESSION_ID
        or session.get("state") != "closed"
        or session.get("lane") != "smt"
        or session.get("solver_name") != "cvc5"
        or session.get("solver_signature") != "cvc5-1.3.3"
        or session.get("solver_sha256") != PREDECESSOR_UNKNOWN_SOLVER_SHA256
        or session.get("solves") != 1
        or session.get("last_solve_index") != 1
        or session.get("last_status") != "UNKNOWN"
        or session.get("last_assumption_free") is not False
        or session.get("last_terminal_unsat") is not None
    ):
        raise Profile282CoreConfirmationError("predecessor UNKNOWN session drifted")
    rows = receipts.get("receipts")
    if (
        receipts.get("session_id") != PREDECESSOR_UNKNOWN_SESSION_ID
        or receipts.get("lane") != "smt"
        or receipts.get("count") != 1
        or type(rows) is not list
        or len(rows) != 1
        or type(rows[0]) is not dict
    ):
        raise Profile282CoreConfirmationError(
            "predecessor UNKNOWN receipt envelope drifted"
        )
    receipt = rows[0]
    if (
        receipt.get("status") != "UNKNOWN"
        or receipt.get("request_id") != PREDECESSOR_UNKNOWN_REQUEST_ID
        or receipt.get("request_sha256") != expected_request
        or receipt.get("result_sha256") != PREDECESSOR_UNKNOWN_RESULT_SHA256
        or receipt.get("base_sha256") != PREDECESSOR_UNKNOWN_JOURNAL_SHA256
        or receipt.get("base_bytes") != len(planned.query.journal_smt2)
        or receipt.get("base_commands") != len(planned.query.journal_commands)
        or receipt.get("assumptions") != list(planned.query.assumptions)
        or receipt.get("assumption_labels") != list(planned.assumption_labels)
        or receipt.get("timeout_ms") != 60_000
        or receipt.get("effective_deadline_ms") != 90_000
        or receipt.get("interrupted_by") != "daemon_deadline"
        or receipt.get("include_model") is not True
        or receipt.get("get_values") != list(planned.query.get_values)
        or receipt.get("solver_sha256") != PREDECESSOR_UNKNOWN_SOLVER_SHA256
    ):
        raise Profile282CoreConfirmationError("predecessor UNKNOWN receipt drifted")
    if (
        journal != planned.query.journal_smt2
        or _sha(journal) != PREDECESSOR_UNKNOWN_JOURNAL_SHA256
    ):
        raise Profile282CoreConfirmationError("predecessor UNKNOWN journal drifted")
    record = {
        "schema": PREDECESSOR_SCHEMA,
        "local_anchor": local["anchor"],
        "unknown_session_id": PREDECESSOR_UNKNOWN_SESSION_ID,
        "unknown_request_sha256": expected_request,
        "unknown_result_sha256": PREDECESSOR_UNKNOWN_RESULT_SHA256,
        "unknown_status": "UNKNOWN",
        "unknown_scope": "parent-cvc5-direct-302-assumptions-only",
        "mirror_core_adjudicated": False,
        "claims": dict(FALSE_GLOBAL_CLAIMS),
    }
    record["record_sha256"] = _self_hash(record, "record_sha256")
    return record


def import_predecessor_custody(
    output_directory: Path, transport: adapter.PiqdTransport
) -> dict[str, Any]:
    if output_directory.exists():
        return verify_predecessor_custody(output_directory)
    local = authenticate_predecessor_local()
    with adapter.SmtOutputTransaction(output_directory) as transaction:
        session, session_bytes = _read_transport_json(
            transport, f"/sessions/{PREDECESSOR_UNKNOWN_SESSION_ID}"
        )
        receipts, receipts_bytes = _read_transport_json(
            transport, f"/sessions/{PREDECESSOR_UNKNOWN_SESSION_ID}/receipts"
        )
        exported = transport.request_bytes(
            "GET", f"/sessions/{PREDECESSOR_UNKNOWN_SESSION_ID}/smt2"
        )
        if exported.status != 200 or type(exported.body) is not bytes:
            raise Profile282CoreConfirmationError("PIQD predecessor export failed")
        record = _validate_unknown_import(local, session, receipts, exported.body)
        artifacts = []
        for name, payload in (
            ("session.json", session_bytes),
            ("receipts.json", receipts_bytes),
            ("journal.smt2", exported.body),
        ):
            transaction.write_bytes(name, payload)
            artifacts.append(_artifact_record(name, payload))
        envelope = {**record, "artifacts": artifacts}
        envelope["record_sha256"] = _self_hash(envelope, "record_sha256")
        transaction.write_bytes("record.json", _json(envelope))
        transaction.publish()
    return verify_predecessor_custody(output_directory)


def verify_predecessor_custody(output_directory: Path) -> dict[str, Any]:
    if output_directory.is_symlink() or not output_directory.is_dir():
        raise Profile282CoreConfirmationError("predecessor custody directory is unsafe")
    record = _strict_json(
        _read_regular(output_directory / "record.json"), "predecessor record"
    )
    if record.get("schema") != PREDECESSOR_SCHEMA or record.get(
        "record_sha256"
    ) != _self_hash(record, "record_sha256"):
        raise Profile282CoreConfirmationError("predecessor custody record drifted")
    seen = {"record.json"}
    payloads: dict[str, bytes] = {}
    for item in record.get("artifacts", []):
        if type(item) is not dict or set(item) != {"path", "bytes", "sha256"}:
            raise Profile282CoreConfirmationError(
                "predecessor artifact record malformed"
            )
        name = item["path"]
        if type(name) is not str or name in seen or "/" in name or "\\" in name:
            raise Profile282CoreConfirmationError("predecessor artifact name unsafe")
        payload = _read_regular(output_directory / name)
        if item["bytes"] != len(payload) or item["sha256"] != _sha(payload):
            raise Profile282CoreConfirmationError(
                "predecessor artifact digest mismatch"
            )
        seen.add(name)
        payloads[name] = payload
    if {entry.name for entry in output_directory.iterdir()} != seen:
        raise Profile282CoreConfirmationError(
            "predecessor custody has unbound artifacts"
        )
    local = authenticate_predecessor_local()
    session = _strict_json(payloads["session.json"], "stored predecessor session")
    receipts = _strict_json(payloads["receipts.json"], "stored predecessor receipts")
    expected = _validate_unknown_import(
        local, session, receipts, payloads["journal.smt2"]
    )
    for key in expected:
        if key != "record_sha256" and record.get(key) != expected[key]:
            raise Profile282CoreConfirmationError("predecessor custody crossed")
    return record


def prepare_query(
    key: str, *, timeout_ms: int = 60_000, local: Mapping[str, Any] | None = None
) -> PreparedQuery:
    plan = {row[0]: row[1:] for row in QUERY_PLAN}
    if key not in plan:
        raise Profile282CoreConfirmationError(f"unknown query key: {key}")
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= 3_600_000
    ):
        raise Profile282CoreConfirmationError("query timeout is invalid")
    solver, source_id, selected_ids = plan[key]
    local_record = dict(local or authenticate_predecessor_local())
    system = predecessor.build_named_system(source_id, solver)
    bindings = system["assumption_bindings"]
    by_id = {binding["assumption_id"]: binding for binding in bindings}
    if any(item not in by_id for item in selected_ids):
        raise Profile282CoreConfirmationError("selected assumption is absent")
    commands = predecessor.build_smt_commands(system)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise Profile282CoreConfirmationError("SMT journal normalization drifted")
    variables = sorted(
        (
            {"id": value.replace("_", "-"), "term": value, "sort": "Real"}
            for value in system["source_system"]["variables"]
        ),
        key=lambda item: item["id"],
    )
    named_atoms = sorted(
        (
            {
                "id": binding["assumption_id"],
                "assumption_term": binding["assumption_term"],
            }
            for binding in bindings
        ),
        key=lambda item: item["id"],
    )
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "selected_assumption_ids": list(selected_ids),
        "predecessor_anchor_sha256": local_record["anchor"]["anchor_sha256"],
        "finding_scope": "selected-unguarded-formulas-only",
        "claims": dict(FALSE_GLOBAL_CLAIMS),
    }
    snapshots = list(predecessor._source_snapshots(local_record["parent"], system))
    snapshots.extend(
        (
            adapter.SourceSnapshot(
                "implementation-core-confirmation.py", _read_regular(Path(__file__))
            ),
            adapter.SourceSnapshot(
                "specification-core-confirmation.md", _read_regular(SPEC_PATH)
            ),
        )
    )
    snapshots = sorted(snapshots, key=lambda item: item.path)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-profile282-core-confirmation-piqd", "version": "v1"},
        "semantic_verifier": {
            "id": "selected-ledger-exact-rational-replay",
            "version": "v1",
        },
        "stage_id": "profile282-core-confirmation",
        "query_id": key,
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
        "named_atoms": named_atoms,
        "solve": {
            "assumption_ids": list(selected_ids),
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
        descriptor, _json(descriptor), journal, commands, journal, tuple(snapshots)
    )
    labels = tuple(by_id[item]["label_sha256"] for item in selected_ids)
    return PreparedQuery(key, solver, tuple(selected_ids), system, query, labels)


def _polynomial_value(
    entry: Mapping[str, Any], values: Mapping[str, Fraction]
) -> Fraction:
    total = Fraction(0)
    terms = entry.get("polynomial")
    if type(terms) is not list:
        raise Profile282CoreConfirmationError("selected polynomial ledger is malformed")
    for term in terms:
        coefficient = term.get("coefficient")
        monomial = term.get("monomial")
        if (
            type(coefficient) is not list
            or len(coefficient) != 2
            or not all(type(item) is int for item in coefficient)
            or coefficient[1] == 0
            or type(monomial) is not list
            or not all(type(item) is str and item in values for item in monomial)
        ):
            raise Profile282CoreConfirmationError(
                "selected polynomial term is malformed"
            )
        value = Fraction(coefficient[0], coefficient[1])
        for variable in monomial:
            value *= values[variable]
        total += value
    return total


def evaluate_selected_assignment(
    system: Mapping[str, Any],
    selected_ids: Sequence[str],
    values: Mapping[str, Fraction],
) -> dict[str, bool]:
    bindings = system.get("assumption_bindings")
    if type(bindings) is not list or not selected_ids:
        raise Profile282CoreConfirmationError(
            "selected formula evaluation is malformed"
        )
    by_id = {
        binding.get("assumption_id"): binding
        for binding in bindings
        if type(binding) is dict
    }
    answers: dict[str, bool] = {}
    for assumption_id in selected_ids:
        binding = by_id.get(assumption_id)
        if binding is None:
            raise Profile282CoreConfirmationError(
                "selected formula is absent from ledger"
            )
        family = binding.get("family")
        if family == "normalization":
            r = values.get("r")
            if type(r) is not Fraction:
                raise Profile282CoreConfirmationError(
                    "normalization readback is absent"
                )
            answers[assumption_id] = 4 * r * r - 3 == 0 and r > 0
        elif family == "row-equality":
            answers[assumption_id] = (
                _polynomial_value(binding["source_ledger_entry"], values) == 0
            )
        elif family == "strict-signed-area":
            answers[assumption_id] = (
                _polynomial_value(binding["source_ledger_entry"], values) > 0
            )
        else:
            raise Profile282CoreConfirmationError("unsupported selected formula family")
    return answers


def verify_selected_sat_model(
    query: adapter.SourceSemanticQuery, solver: str, model: str, values: str | None
) -> adapter.SemanticVerification:
    semantic = query.descriptor.get("semantic_input")
    if (
        solver not in adapter.SOLVERS
        or type(model) is not str
        or type(values) is not str
        or type(semantic) is not dict
    ):
        raise Profile282CoreConfirmationError("SAT replay payload is malformed")
    system = semantic.get("system")
    selected_ids = semantic.get("selected_assumption_ids")
    if (
        type(system) is not dict
        or type(selected_ids) is not list
        or selected_ids != query.descriptor["solve"]["assumption_ids"]
    ):
        raise Profile282CoreConfirmationError("SAT replay custody crossed")
    try:
        parsed = predecessor.source.parse_exact_values(values, query.get_values)
        checks = evaluate_selected_assignment(system, selected_ids, parsed)
    except (
        KeyError,
        TypeError,
        ValueError,
        Profile282CoreConfirmationError,
        predecessor.source.Profile282BoQfnraError,
    ) as exc:
        evidence = {
            "accepted": False,
            "reason": "selected_exact_readback_unsupported",
            "failure": type(exc).__name__,
        }
    else:
        evidence = {
            "accepted": all(checks.values()),
            "selected_assumption_ids": list(selected_ids),
            "selected_formula_checks": checks,
            "finding_scope": "selected-unguarded-formulas-only",
        }
    evidence.update(
        {
            "solver": solver,
            "model_sha256": _sha(model.encode()),
            "values_sha256": _sha(values.encode()),
        }
    )
    return adapter.SemanticVerification(bool(evidence.get("accepted")), evidence)


def _request_id(key: str) -> str:
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


def _validate_engine(prepared: PreparedQuery, engine: Mapping[str, Any]) -> str:
    if (
        engine.get("solver") != prepared.solver
        or engine.get("request_id") != _request_id(prepared.key)
        or engine.get("request_sha256")
        != adapter.piqd_solve_request_digest(prepared.query, prepared.assumption_labels)
        or engine.get("assumption_labels") != list(prepared.assumption_labels)
        or engine.get("claims") != adapter.FALSE_CLAIMS
    ):
        raise Profile282CoreConfirmationError("engine custody crossed")
    raw = engine.get("raw_status")
    effective = engine.get("effective_status")
    if raw == "UNSAT":
        provenance = engine.get("unsat_assumptions")
        if type(provenance) is not dict:
            raise Profile282CoreConfirmationError("UNSAT lacks named provenance")
        terms = provenance.get("assumption_terms")
        ids = provenance.get("source_atom_ids")
        labels = provenance.get("core_labels")
        by_term = {
            binding["assumption_term"]: binding
            for binding in prepared.system["assumption_bindings"]
        }
        chosen = [by_term.get(term) for term in terms] if type(terms) is list else []
        if (
            effective != "UNSAT_DISCOVERY_ONLY"
            or not chosen
            or any(binding is None for binding in chosen)
            or ids != [binding["assumption_id"] for binding in chosen]
            or any(item not in prepared.selected_ids for item in ids)
            or labels != [binding["label_sha256"] for binding in chosen]
            or provenance.get("ordered_assumption_labels")
            != list(prepared.assumption_labels)
            or provenance.get("terminal_unsat") is not False
        ):
            raise Profile282CoreConfirmationError("UNSAT named provenance drifted")
        return "UNSAT_SELECTED_FORMULAS"
    if raw == "SAT":
        semantic = engine.get("semantic_replay")
        if (
            effective == "SAT_SEMANTICALLY_REPLAYED"
            and type(semantic) is dict
            and semantic.get("accepted") is True
        ):
            return "SAT_SELECTED_FORMULAS"
        if type(effective) is str and effective.startswith("INCONCLUSIVE"):
            return effective
        raise Profile282CoreConfirmationError("SAT replay status drifted")
    if (
        raw == "UNKNOWN"
        and effective == "INCONCLUSIVE_UNKNOWN"
        and engine.get("unsat_assumptions") is None
    ):
        return "INCONCLUSIVE_UNKNOWN"
    if raw is None and effective == "INCONCLUSIVE_TRANSPORT_LOSS":
        return "INCONCLUSIVE_TRANSPORT_LOSS"
    raise Profile282CoreConfirmationError("engine status is unsupported")


def _fd_artifacts(descriptor: int) -> list[dict[str, Any]]:
    records = []
    for name in sorted(os.listdir(descriptor)):
        info = os.stat(name, dir_fd=descriptor, follow_symlinks=False)
        if (
            "/" in name
            or "\\" in name
            or not stat.S_ISREG(info.st_mode)
            or info.st_nlink != 1
        ):
            raise Profile282CoreConfirmationError("staged artifact is unsafe")
        handle = os.open(name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=descriptor)
        try:
            chunks = []
            while True:
                chunk = os.read(handle, 1 << 20)
                if not chunk:
                    break
                chunks.append(chunk)
        finally:
            os.close(handle)
        records.append(_artifact_record(name, b"".join(chunks)))
    return records


def _cell_result(
    prepared: PreparedQuery,
    state: str,
    engine: Mapping[str, Any] | None,
    artifacts: list[dict[str, Any]],
    failure: str | None,
) -> dict[str, Any]:
    result = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": prepared.solver,
        "selected_assumption_ids": list(prepared.selected_ids),
        "selected_assumption_labels": list(prepared.assumption_labels),
        "source_system_sha256": prepared.system["source_system_sha256"],
        "source_ledger_sha256": prepared.system["source_ledger_sha256"],
        "state": state,
        "engine": None if engine is None else dict(engine),
        "failure_type": failure,
        "artifacts": artifacts,
        "finding_scope": "selected-unguarded-formulas-only",
        "claims": dict(FALSE_GLOBAL_CLAIMS),
    }
    result["result_sha256"] = _self_hash(result, "result_sha256")
    return result


def run_cell(
    prepared: PreparedQuery,
    output_directory: Path,
    transport: adapter.PiqdTransport,
    used_session_ids: set[str],
) -> dict[str, Any]:
    if output_directory.exists():
        return verify_cell_tree(prepared, output_directory)
    with adapter.SmtOutputTransaction(output_directory) as transaction:
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
                semantic_verifier=verify_selected_sat_model,
                output_fd=transaction.file_descriptor,
                used_session_ids=used_session_ids,
                request_id=_request_id(prepared.key),
                assumption_labels=prepared.assumption_labels,
            )
            transaction.write_bytes("engine-observation.json", _json(engine))
            state = _validate_engine(prepared, engine)
        except (
            OSError,
            adapter.SmtSourceAdapterError,
            Profile282CoreConfirmationError,
        ) as exc:
            state = "FAILED_CUSTODY"
            failure = type(exc).__name__
        artifacts = _fd_artifacts(transaction.file_descriptor)
        result = _cell_result(prepared, state, engine, artifacts, failure)
        transaction.write_bytes("result.json", _json(result))
        transaction.publish()
    return verify_cell_tree(prepared, output_directory)


def verify_cell_tree(prepared: PreparedQuery, output_directory: Path) -> dict[str, Any]:
    if output_directory.is_symlink() or not output_directory.is_dir():
        raise Profile282CoreConfirmationError("cell output directory is unsafe")
    result = _strict_json(
        _read_regular(output_directory / "result.json"), "cell result"
    )
    if (
        result.get("schema") != RESULT_SCHEMA
        or result.get("key") != prepared.key
        or result.get("solver") != prepared.solver
        or result.get("selected_assumption_ids") != list(prepared.selected_ids)
        or result.get("selected_assumption_labels") != list(prepared.assumption_labels)
        or result.get("source_system_sha256") != prepared.system["source_system_sha256"]
        or result.get("source_ledger_sha256") != prepared.system["source_ledger_sha256"]
        or result.get("claims") != FALSE_GLOBAL_CLAIMS
        or result.get("result_sha256") != _self_hash(result, "result_sha256")
    ):
        raise Profile282CoreConfirmationError("cell result identity drifted")
    seen = {"result.json"}
    payloads: dict[str, bytes] = {}
    artifacts = result.get("artifacts")
    if type(artifacts) is not list:
        raise Profile282CoreConfirmationError("cell artifacts are malformed")
    for item in artifacts:
        if type(item) is not dict or set(item) != {"path", "bytes", "sha256"}:
            raise Profile282CoreConfirmationError("cell artifact record malformed")
        name = item["path"]
        if type(name) is not str or name in seen or "/" in name or "\\" in name:
            raise Profile282CoreConfirmationError("cell artifact name unsafe")
        payload = _read_regular(output_directory / name)
        if item["bytes"] != len(payload) or item["sha256"] != _sha(payload):
            raise Profile282CoreConfirmationError("cell artifact digest mismatch")
        seen.add(name)
        payloads[name] = payload
    entries = tuple(output_directory.iterdir())
    if {entry.name for entry in entries} != seen or any(
        entry.is_symlink()
        or not entry.is_file()
        or entry.stat(follow_symlinks=False).st_nlink != 1
        for entry in entries
    ):
        raise Profile282CoreConfirmationError(
            "cell output contains unsafe or unbound artifacts"
        )
    if (
        payloads.get("source-record.json") != _json(prepared.system)
        or payloads.get("descriptor.json") != prepared.query.descriptor_bytes
        or payloads.get("original.smt2") != prepared.query.original_smt2
        or payloads.get("journal.smt2") != prepared.query.journal_smt2
    ):
        raise Profile282CoreConfirmationError("cell source custody crossed")
    expected_sources = {
        f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin": snapshot.payload
        for index, snapshot in enumerate(prepared.query.source_files)
    }
    if any(payloads.get(name) != payload for name, payload in expected_sources.items()):
        raise Profile282CoreConfirmationError("cell source snapshot crossed")
    state = result.get("state")
    engine = result.get("engine")
    if state == "FAILED_CUSTODY":
        if engine is not None and payloads.get("engine-observation.json") != _json(
            engine
        ):
            raise Profile282CoreConfirmationError("failed engine observation crossed")
        if type(result.get("failure_type")) is not str:
            raise Profile282CoreConfirmationError("failed custody lacks failure type")
    else:
        if (
            type(engine) is not dict
            or payloads.get("engine-observation.json") != _json(engine)
            or _validate_engine(prepared, engine) != state
            or result.get("failure_type") is not None
        ):
            raise Profile282CoreConfirmationError("cell engine observation drifted")
    return result


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("base_head") != "05eee6511a2db25ed537328c2a3e9a5ccce0d0c0"
        or checkpoint.get("owned_paths") != _OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile282CoreConfirmationError("lane checkpoint drifted")
    return checkpoint


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {
        path.relative_to(REPOSITORY_ROOT).as_posix(): _sha(_read_regular(path))
        for path in paths
    }


def _expected_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    source_paths = (
        Path(__file__),
        RUNNER_PATH,
        TEST_PATH,
        SPEC_PATH,
        Path(predecessor.__file__),
        Path(predecessor.source.__file__),
        Path(adapter.__file__),
    )
    input_paths = (
        PREDECESSOR_MANIFEST_PATH,
        PREDECESSOR_LAUNCH_PATH,
        *(
            PREDECESSOR_ROOT / "artifacts" / key / "result.json"
            for key in PREDECESSOR_COMPLETED_KEYS
        ),
    )
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


def _require_safe_root() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise Profile282CoreConfirmationError("run root escapes repository") from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise Profile282CoreConfirmationError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink():
            raise Profile282CoreConfirmationError("run-root ancestor is a symlink")
        if current.exists() and not current.is_dir():
            raise Profile282CoreConfirmationError(
                "run-root ancestor is not a directory"
            )


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_root()
    if RUN_ROOT.is_symlink():
        raise Profile282CoreConfirmationError("run root is a symlink")
    if RUN_ROOT.exists() and not RUN_ROOT.is_dir():
        raise Profile282CoreConfirmationError("run root is unsafe")
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    _require_safe_root()
    if RUN_ROOT.is_symlink() or not RUN_ROOT.is_dir():
        raise Profile282CoreConfirmationError("run root is unsafe")
    for name in ("artifacts", "events", "tmp"):
        child = RUN_ROOT / name
        if child.is_symlink() or (child.exists() and not child.is_dir()):
            raise Profile282CoreConfirmationError("run-root child is unsafe")
        child.mkdir(exist_ok=True)
        if child.is_symlink() or not child.is_dir():
            raise Profile282CoreConfirmationError("run-root child is unsafe")
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists():
        manifest = _strict_json(_read_regular(manifest_path), "run manifest")
        expected = _expected_manifest(manifest.get("created_utc", ""))
        if manifest != expected:
            raise Profile282CoreConfirmationError("run manifest drifted")
    else:
        manifest = _expected_manifest(datetime.now(UTC).strftime("%Y-%m-%dT%H:%M:%SZ"))
        _create_once(manifest_path, _json(manifest))
    if {entry.name for entry in RUN_ROOT.iterdir()} - {
        "artifacts",
        "events",
        "tmp",
        "run_manifest.json",
    }:
        raise Profile282CoreConfirmationError("run root contains an unknown entry")
    return RUN_ROOT, manifest


def _launch_record(
    manifest: Mapping[str, Any], server: str, timeout_ms: int
) -> dict[str, Any]:
    record = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "server": server,
        "timeout_ms": timeout_ms,
        "workers": 1,
        "queries": list(QUERY_KEYS),
        "sessions": 6,
        "solves_per_session": 1,
        "transport": "maintained PIQD HTTP SMT adapter only",
        "claims": dict(FALSE_GLOBAL_CLAIMS),
    }
    record["launch_sha256"] = _self_hash(record, "launch_sha256")
    return record


def _terminal_record(
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    predecessor_record: Mapping[str, Any],
    results: Mapping[str, Mapping[str, Any]],
) -> dict[str, Any]:
    states = {key: results[key]["state"] for key in QUERY_KEYS}
    record = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "predecessor_record_sha256": predecessor_record["record_sha256"],
        "cells": {
            key: {"state": states[key], "result_sha256": results[key]["result_sha256"]}
            for key in QUERY_KEYS
        },
        "mirror_five_cross_engine": states["z3-mirror-five"]
        == states["cvc5-mirror-five"]
        == "UNSAT_SELECTED_FORMULAS",
        "mirror_four_cross_engine": states["z3-mirror-four"]
        == states["cvc5-mirror-four"]
        == "UNSAT_SELECTED_FORMULAS",
        "direct_four_cross_engine": states["z3-direct-four"]
        == states["cvc5-direct-four"]
        == "UNSAT_SELECTED_FORMULAS",
        "finding_scope": "selected-unguarded-formulas-only",
        "claims": dict(FALSE_GLOBAL_CLAIMS),
    }
    record["terminal_sha256"] = _self_hash(record, "terminal_sha256")
    return record


def _validate_server(server: str) -> str:
    if (
        type(server) is not str
        or not server.startswith(("http://", "https://"))
        or any(character.isspace() for character in server)
    ):
        raise Profile282CoreConfirmationError("server URL is invalid")
    return server.rstrip("/")


def run_campaign(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = WORKERS,
    transport: adapter.PiqdTransport | None = None,
) -> dict[str, Any]:
    if workers != 1 or type(workers) is bool:
        raise Profile282CoreConfirmationError("workers must be exactly 1")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise Profile282CoreConfirmationError("timeout must be exact milliseconds")
    server = _validate_server(server)
    timeout_ms = int(timeout_s * 1000)
    root, manifest = ensure_run_root()
    local = authenticate_predecessor_local()
    prepared = {
        key: prepare_query(key, timeout_ms=timeout_ms, local=local)
        for key in QUERY_KEYS
    }
    launch = _launch_record(manifest, server, timeout_ms)
    launch_path = root / "events/launch.json"
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch") != launch:
            raise Profile282CoreConfirmationError("launch record differs on resume")
    else:
        _create_once(launch_path, _json(launch))
    if transport is None:
        transport = adapter.UrllibPiqdTransport(server, http_timeout_s=timeout_s + 40)
    predecessor_record = import_predecessor_custody(
        root / "artifacts/predecessor-custody", transport
    )
    results: dict[str, dict[str, Any]] = {}
    used_session_ids: set[str] = set()
    for key in QUERY_KEYS:
        output = root / "artifacts" / key
        if output.exists():
            result = verify_cell_tree(prepared[key], output)
            engine = result.get("engine")
            if type(engine) is dict and type(engine.get("session_id")) is str:
                if engine["session_id"] in used_session_ids:
                    raise Profile282CoreConfirmationError(
                        "cell session identities crossed"
                    )
                used_session_ids.add(engine["session_id"])
            results[key] = result
    terminal_path = root / "events/terminal.json"
    if terminal_path.exists():
        terminal = _strict_json(_read_regular(terminal_path), "terminal")
        expected = _terminal_record(manifest, launch, predecessor_record, results)
        if set(results) != set(QUERY_KEYS) or terminal != expected:
            raise Profile282CoreConfirmationError("terminal record drifted")
        return terminal
    for key in QUERY_KEYS:
        if key not in results:
            results[key] = run_cell(
                prepared[key], root / "artifacts" / key, transport, used_session_ids
            )
    terminal = _terminal_record(manifest, launch, predecessor_record, results)
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
        result = (
            ensure_run_root()[1]
            if args.init_only
            else run_campaign(
                server=args.server, timeout_s=args.timeout, workers=args.workers
            )
        )
    except (Profile282CoreConfirmationError, adapter.SmtSourceAdapterError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "DEFAULT_TIMEOUT_S",
    "DIRECT_FOUR_IDS",
    "FIVE_CORE_IDS",
    "FOUR_CORE_IDS",
    "LANE_ID",
    "QUERY_KEYS",
    "QUERY_PLAN",
    "RUN_ID",
    "RUN_ROOT",
    "WORKERS",
    "PreparedQuery",
    "Profile282CoreConfirmationError",
    "authenticate_predecessor_local",
    "ensure_run_root",
    "evaluate_selected_assignment",
    "import_predecessor_custody",
    "main",
    "prepare_query",
    "run_campaign",
    "run_cell",
    "verify_cell_tree",
    "verify_predecessor_custody",
    "verify_selected_sat_model",
]
