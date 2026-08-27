"""Authenticated one-cell PIQD adapter for cap-configuration diagnostics."""

from __future__ import annotations

import os
from collections.abc import Mapping
from typing import Any, NoReturn

from census.p97_search import phase3_piqd_smt_source_adapter as shared

from .encode import PolynomialSystem
from .replay import SemanticReplayRecord, replay_piqd_sat_values
from .schema import (
    canonical_json_bytes,
    parse_stored_json_bytes,
    raw_sha256,
    stored_json_bytes,
    structured_hash,
)
from .universe import CELL_SCHEMA

CAP_CELL_SCHEMA = CELL_SCHEMA
CAP_QUERY_SCHEMA = "cap-configuration-piqd-cell-query/v1"
CAP_SOLVER_PROFILE_SCHEMA = "cap-configuration-piqd-single-solver/v1"
CAP_ADAPTER_RESULT_SCHEMA = "cap-configuration-piqd-adapter-result/v1"

CAP_ADAPTER_CLASSIFICATIONS = frozenset(
    {
        "SAT_SEMANTICALLY_REPLAYED",
        "UNSAT_DISCOVERY_ONLY",
        "INCONCLUSIVE_UNKNOWN",
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
        "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
        "INCONCLUSIVE_TRANSPORT_LOSS",
    }
)

_RETAINED_RESULT_KEYS = {
    "solver",
    "session_id",
    "solver_signature",
    "solver_sha256",
    "raw_status",
    "effective_status",
    "solve_index",
    "result_sha256",
    "response_lost",
    "reconciled_from_receipt",
    "reconciliation_attempts",
    "result_digest_advisory",
    "unsat_assumptions",
    "semantic_replay",
    "artifacts",
    "claims",
    "request_id",
    "request_sha256",
    "assumption_labels",
    "request_replay_attempted",
    "request_replayed",
    "resumed_from_receipt",
    "session_lifecycle",
    "schema",
    "classification",
    "cap_semantic_replay",
    "cap_values_artifact",
    "cap_values_json_field",
    "cap_values_raw_sha256",
}
_RETAINED_REQUIRED_ARTIFACTS = {
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
}
_RETAINED_OPTIONAL_ARTIFACTS = {
    "solve",
    "reconciled_solve",
    "reconciliation_session",
    "semantic",
    "closed_session",
    "final_session_lifecycle",
}

PiqdTransport = shared.PiqdTransport
PiqdTransportLoss = shared.PiqdTransportLoss
JsonResponse = shared.JsonResponse
BytesResponse = shared.BytesResponse
SourceSemanticQuery = shared.SourceSemanticQuery
PIQD_RESUME_REQUIRE_EXISTING = shared.PIQD_RESUME_REQUIRE_EXISTING
PIQD_RESUME_ALLOW_CREATE_IF_MISSING = shared.PIQD_RESUME_ALLOW_CREATE_IF_MISSING


class CapConfigurationPiqdAdapterError(RuntimeError):
    """A cap packet, shared custody boundary, or PIQD response failed closed."""


def _fail(message: str) -> NoReturn:
    raise CapConfigurationPiqdAdapterError(message)


def _strict_object(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = parse_stored_json_bytes(payload)
    except Exception as exc:
        raise CapConfigurationPiqdAdapterError(
            f"{where} is not canonical stored JSON"
        ) from exc
    if type(value) is not dict:
        _fail(f"{where} must be an exact JSON object")
    return value


def _authenticated_cell(payload: bytes) -> dict[str, Any]:
    cell = _strict_object(payload, "cell")
    if cell.get("schema") != CAP_CELL_SCHEMA:
        _fail("cell schema mismatch")
    digest = cell.get("cell_sha256")
    if type(digest) is not str:
        _fail("cell lacks cell_sha256")
    identity = {key: value for key, value in cell.items() if key != "cell_sha256"}
    if digest != structured_hash(CAP_CELL_SCHEMA, identity):
        _fail("cell_sha256 mismatch")
    return cell


def _authenticated_system(payload: bytes) -> PolynomialSystem:
    record = _strict_object(payload, "polynomial system")
    try:
        system = PolynomialSystem.from_record(record)
    except Exception as exc:
        raise CapConfigurationPiqdAdapterError(
            "polynomial system failed canonical validation"
        ) from exc
    if stored_json_bytes(system.to_record()) != payload:
        _fail("polynomial system bytes disagree with validated system")
    return system


def build_authenticated_cell_query(
    *,
    cell_bytes: bytes,
    system_bytes: bytes,
    solver: str,
    timeout_ms: int,
) -> SourceSemanticQuery:
    """Build one source-bound query from canonical cell and system bytes."""

    if type(cell_bytes) is not bytes or type(system_bytes) is not bytes:
        _fail("cell and polynomial-system inputs must be exact bytes")
    if type(solver) is not str or solver not in shared.SOLVERS:
        _fail("solver must be exactly z3 or cvc5")
    if type(timeout_ms) is not int or timeout_ms < 1 or timeout_ms > 3_600_000:
        _fail("timeout_ms must be an exact integer from 1 through 3600000")

    cell = _authenticated_cell(cell_bytes)
    system = _authenticated_system(system_bytes)
    if cell.get("polynomial_system") != system.to_record():
        _fail("cell polynomial system disagrees with authenticated system bytes")
    commands = system.state_commands()
    journal = system.state_smt2_bytes()
    expected_journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    if journal != expected_journal:
        _fail("polynomial-system journal reconstruction mismatch")

    semantic_input = {
        "cell": cell,
        "cell_bytes_sha256": raw_sha256(cell_bytes),
        "polynomial_system": system.to_record(),
        "polynomial_system_bytes_sha256": raw_sha256(system_bytes),
        "state_smt2_sha256": raw_sha256(journal),
    }
    semantic_sha256 = raw_sha256(canonical_json_bytes(semantic_input))
    identity = {
        "cell_sha256": cell["cell_sha256"],
        "polynomial_system_bytes_sha256": raw_sha256(system_bytes),
        "solver": solver,
        "timeout_ms": timeout_ms,
    }
    query_id = (
        "cap-cell-"
        + structured_hash("cap-configuration-piqd-query-identity/v1", identity)[:32]
    )
    sources = (
        shared.SourceSnapshot("cell.json", cell_bytes),
        shared.SourceSnapshot("polynomial-system.json", system_bytes),
    )
    variables = [
        {"id": f"variable-{index:06d}", "term": f"|{name}|", "sort": "Real"}
        for index, name in enumerate(system.variable_order)
    ]
    descriptor = {
        "schema": CAP_QUERY_SCHEMA,
        "producer": {
            "id": "cap-configuration-polynomial-system",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "cap-configuration-exact-rational-replay",
            "version": "v1",
        },
        "stage_id": "cap-configuration-cell",
        "query_id": query_id,
        "sources": [
            {
                "path": source.path,
                "bytes": len(source.payload),
                "sha256": raw_sha256(source.payload),
            }
            for source in sources
        ],
        "semantic_input": semantic_input,
        "semantic_sha256": semantic_sha256,
        "original_smt2": {
            "path": "query.smt2",
            "bytes": len(journal),
            "sha256": raw_sha256(journal),
        },
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [entry["id"] for entry in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": CAP_SOLVER_PROFILE_SCHEMA,
            "solvers": [solver],
            "timeout_ms": timeout_ms,
        },
    }
    descriptor_bytes = stored_json_bytes(descriptor)
    return SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=descriptor_bytes,
        original_smt2=journal,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=sources,
    )


def _system_from_query(query: SourceSemanticQuery) -> PolynomialSystem:
    if type(query) is not SourceSemanticQuery:
        _fail("query has the wrong type")
    cell_matches = [
        source for source in query.source_files if source.path == "cell.json"
    ]
    if len(cell_matches) != 1:
        _fail("query does not carry exactly one authenticated cell snapshot")
    cell = _authenticated_cell(cell_matches[0].payload)
    matches = [
        source
        for source in query.source_files
        if source.path == "polynomial-system.json"
    ]
    if len(matches) != 1:
        _fail("query does not carry exactly one polynomial-system snapshot")
    system = _authenticated_system(matches[0].payload)
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict:
        _fail("query semantic_input is malformed")
    if semantic.get("cell") != cell or semantic.get("cell_bytes_sha256") != raw_sha256(
        cell_matches[0].payload
    ):
        _fail("query cell cross-binding mismatch")
    if (
        semantic.get("polynomial_system") != system.to_record()
        or semantic.get("polynomial_system_bytes_sha256")
        != raw_sha256(matches[0].payload)
        or semantic.get("state_smt2_sha256") != raw_sha256(query.journal_smt2)
        or query.journal_commands != system.state_commands()
        or query.journal_smt2 != system.state_smt2_bytes()
    ):
        _fail("query polynomial-system cross-binding mismatch")
    return system


def _retained_artifact_descriptor(value: object, where: str) -> dict[str, object]:
    if type(value) is not dict or set(value) != {"path", "bytes", "sha256"}:
        _fail(f"{where} artifact descriptor has an inexact schema")
    path = value["path"]
    size = value["bytes"]
    digest = value["sha256"]
    if (
        type(path) is not str
        or not path
        or "/" in path
        or "\\" in path
        or path in {".", ".."}
    ):
        _fail(f"{where} artifact path is unsafe")
    if type(size) is not int or size < 0 or size > shared.MAX_OUTPUT_BYTES:
        _fail(f"{where} artifact byte count is invalid")
    try:
        shared._digest(digest, f"{where}.sha256")
    except Exception as exc:
        raise CapConfigurationPiqdAdapterError(
            f"{where} artifact digest is invalid"
        ) from exc
    return {"path": path, "bytes": size, "sha256": digest}


def _load_retained_artifacts(
    result: Mapping[str, object], output_fd: int
) -> tuple[dict[str, dict[str, object]], dict[str, bytes]]:
    if type(output_fd) is not int or output_fd < 0:
        _fail("retained PIQD output descriptor is invalid")
    artifacts_value = result.get("artifacts")
    if type(artifacts_value) is not dict:
        _fail("retained adapter result lacks an exact artifact inventory")
    artifact_keys = set(artifacts_value)
    if (
        not _RETAINED_REQUIRED_ARTIFACTS <= artifact_keys
        or not artifact_keys
        <= _RETAINED_REQUIRED_ARTIFACTS | _RETAINED_OPTIONAL_ARTIFACTS
    ):
        _fail("retained adapter artifact keys are incomplete or unsupported")
    descriptors: dict[str, dict[str, object]] = {}
    paths: set[str] = set()
    for key, value in artifacts_value.items():
        descriptor = _retained_artifact_descriptor(value, f"artifacts.{key}")
        if descriptor["path"] in paths:
            _fail("retained adapter artifacts repeat a path")
        paths.add(str(descriptor["path"]))
        descriptors[key] = descriptor
    try:
        installed = set(os.listdir(output_fd))
    except OSError as exc:
        raise CapConfigurationPiqdAdapterError(
            "cannot list retained PIQD output directory"
        ) from exc
    if installed != paths:
        _fail("retained PIQD output inventory has missing or unreferenced files")
    payloads: dict[str, bytes] = {}
    for key, descriptor in descriptors.items():
        try:
            payload = shared._read_relative(
                output_fd,
                str(descriptor["path"]),
                shared.MAX_OUTPUT_BYTES,
                f"retained artifact {key}",
            )
        except Exception as exc:
            raise CapConfigurationPiqdAdapterError(
                f"cannot authenticate retained artifact {key}"
            ) from exc
        if (
            len(payload) != descriptor["bytes"]
            or raw_sha256(payload) != descriptor["sha256"]
        ):
            _fail(f"retained artifact {key} disagrees with its descriptor")
        payloads[key] = payload
    return descriptors, payloads


def _retained_json(payload: bytes, where: str) -> dict[str, Any]:
    return _strict_object(payload, where)


def _validate_retained_request_and_journal(
    *,
    query: SourceSemanticQuery,
    solver: str,
    request_id: str,
    descriptors: Mapping[str, Mapping[str, object]],
    payloads: Mapping[str, bytes],
) -> tuple[str, str, dict[str, object]]:
    profile = query.descriptor["solver_profile"]
    profile_sha256 = raw_sha256(canonical_json_bytes(profile))
    label = (
        f"p97-smt-source/{query.descriptor['query_id']}/{solver}/"
        f"{query.descriptor['semantic_sha256'][:12]}/{request_id}/"
        f"{profile_sha256[:12]}"
    )
    create_request = _retained_json(
        payloads["session_create_request"], "retained session create request"
    )
    expected_create = {
        "schema": "piqd-smt-session-create-request/v1",
        "request": {"solver": solver, "lane": "smt", "label": label},
        "request_id": request_id,
        "session_label": label,
        "solver_profile": profile,
        "solver_profile_sha256": profile_sha256,
    }
    if create_request != expected_create:
        _fail("retained session create request disagrees with query identity")
    if payloads["pre_append_smt2"] != b"":
        _fail("retained pre-append SMT2 is not the exact empty frontier")
    if (
        payloads["expected_post_append_smt2"] != query.journal_smt2
        or payloads["smt2"] != query.journal_smt2
    ):
        _fail("retained PIQD journal bytes disagree with authenticated system")
    append_request = {
        "commands": list(query.journal_commands),
        "expect_commands": 0,
    }
    expected_frontiers = {
        "schema": "piqd-smt-journal-frontiers/v1",
        "append_request": append_request,
        "pre": {
            "commands": 0,
            "bytes": 0,
            "sha256": raw_sha256(b""),
            "artifact": descriptors["pre_append_smt2"],
        },
        "post": {
            "commands": len(query.journal_commands),
            "bytes": len(query.journal_smt2),
            "sha256": raw_sha256(query.journal_smt2),
            "artifact": descriptors["expected_post_append_smt2"],
        },
    }
    if (
        _retained_json(payloads["journal_frontiers"], "retained journal frontiers")
        != expected_frontiers
    ):
        _fail("retained journal frontier record disagrees with exact bytes")
    solve_request: dict[str, object] = {
        "assumptions": [],
        "timeout_ms": query.descriptor["solver_profile"]["timeout_ms"],
        "include_model": True,
        "get_values": list(query.get_values),
        "assumption_labels": [],
        "request_id": request_id,
    }
    request_sha256 = shared.piqd_solve_request_digest(query, ())
    expected_solve_binding = {
        "schema": "piqd-smt-solve-request/v1",
        "journal_frontier": {
            "base_commands": len(query.journal_commands),
            "base_bytes": len(query.journal_smt2),
            "base_sha256": raw_sha256(query.journal_smt2),
        },
        "request": solve_request,
        "request_id": request_id,
        "request_sha256": request_sha256,
    }
    if (
        _retained_json(payloads["solve_request"], "retained solve request")
        != expected_solve_binding
    ):
        _fail("retained solve request object or digest disagrees")
    return label, request_sha256, solve_request


def _validate_retained_lifecycle_consistency(
    lifecycle: Mapping[str, object],
) -> None:
    resumed = lifecycle["resumed_existing_session"]
    policy = lifecycle["resume_policy"]
    journal_state = lifecycle["resume_journal_state"]
    if policy is None and resumed:
        _fail("retained lifecycle resumed without an explicit resume policy")
    if policy == PIQD_RESUME_REQUIRE_EXISTING and not resumed:
        _fail("retained required-resume lifecycle did not discover a session")
    if resumed == (journal_state == "not_resumed"):
        _fail("retained lifecycle resume state is internally inconsistent")
    if resumed and lifecycle["create_response_lost"]:
        _fail("retained resumed lifecycle also claims session creation")
    if lifecycle["close_outcome"] == "closure_unproven":
        _fail("retained result cannot claim an unproven close")

    append_losses = lifecycle["append_response_losses"]
    append_retry = lifecycle["append_retry_attempted"]
    append_reconciled = lifecycle["append_reconciled_from_export"]
    if journal_state == "exact_post" and (
        append_losses or append_retry or append_reconciled
    ):
        _fail("retained post-journal resume unexpectedly claims an append")
    if append_losses == 0 and (append_retry or append_reconciled):
        _fail("retained lifecycle claims append recovery without response loss")
    if append_losses == 1 and append_retry is append_reconciled:
        _fail("retained one-loss append recovery has an impossible state")
    if append_losses == 2 and not (append_retry and append_reconciled):
        _fail("retained two-loss append recovery lacks retry/export evidence")

    close_outcome = lifecycle["close_outcome"]
    close_shapes = {
        "closed_delete_response": (True, False, 0, None, False, "closed"),
        "absent_delete_response": (True, False, 0, None, False, "absent"),
        "closed_status": (True, True, 1, 200, False, "closed"),
        "absent_status": (True, True, 1, 404, False, "absent"),
        "closed_after_cleanup": (True, True, 2, 200, True, "closed"),
        "absent_after_cleanup": (True, True, 2, 404, True, "absent"),
        "closed_resume_status": (False, False, 1, 200, False, "closed"),
    }
    expected = close_shapes[close_outcome]
    observed = (
        lifecycle["close_delete_attempted"],
        lifecycle["close_response_lost"],
        lifecycle["close_status_lookups"],
        lifecycle["close_status_http"],
        lifecycle["close_cleanup_delete_attempted"],
        lifecycle["close_observed_state"],
    )
    if observed != expected:
        _fail("retained close lifecycle fields disagree with its outcome")
    if (
        not lifecycle["close_cleanup_delete_attempted"]
        and lifecycle["close_cleanup_response_lost"]
    ):
        _fail("retained close lifecycle loses an unattempted cleanup response")


def _retained_session_is_fresh(session: Mapping[str, object]) -> bool:
    return (
        session["clauses"] == 0
        and session["max_var"] == 0
        and session["solves"] == 0
        and session["updated_at"] == session["created_at"]
        and session["last_status"] is None
        and session["last_solve_index"] is None
        and session["last_assumption_free"] is None
        and session["last_terminal_unsat"] is None
    )


def _validate_retained_result_impl(
    *,
    query: SourceSemanticQuery,
    system: PolynomialSystem,
    solver: str,
    request_id: str,
    adapter_result: Mapping[str, object],
    output_fd: int,
) -> dict[str, object]:
    result_value = shared._snapshot_builtin_json(
        adapter_result, "retained cap adapter result"
    )
    if type(result_value) is not dict or set(result_value) != _RETAINED_RESULT_KEYS:
        _fail("retained cap adapter result has an inexact schema")
    result: dict[str, object] = result_value
    if result["schema"] != CAP_ADAPTER_RESULT_SCHEMA:
        _fail("retained cap adapter result schema mismatch")
    if result["solver"] != solver or result["request_id"] != request_id:
        _fail("retained cap adapter solver or request identity mismatch")
    if result["assumption_labels"] != []:
        _fail("retained cap adapter unexpectedly carries assumptions")
    for key in (
        "response_lost",
        "reconciled_from_receipt",
        "request_replay_attempted",
        "resumed_from_receipt",
    ):
        if type(result[key]) is not bool:
            _fail(f"retained cap adapter {key} is not Boolean")
    if (
        result["request_replayed"] is not None
        and type(result["request_replayed"]) is not bool
    ):
        _fail("retained cap adapter request_replayed has wrong type")
    if (
        type(result["reconciliation_attempts"]) is not int
        or result["reconciliation_attempts"] < 0
    ):
        _fail("retained cap adapter reconciliation count is invalid")
    if (
        result["response_lost"]
        and result["request_replay_attempted"]
        and not result["reconciled_from_receipt"]
        and result["request_replayed"] is False
    ):
        _fail("retained named retry lacks replay proof")

    descriptors, payloads = _load_retained_artifacts(result, output_fd)
    label, request_sha256, solve_request = _validate_retained_request_and_journal(
        query=query,
        solver=solver,
        request_id=request_id,
        descriptors=descriptors,
        payloads=payloads,
    )
    if result["request_sha256"] != request_sha256:
        _fail("retained result request digest disagrees with request artifact")

    session = shared._validate_session_record(
        _retained_json(payloads["session"], "retained session"),
        "retained session",
    )
    if (
        session["lane"] != "smt"
        or session["solver_name"] != solver
        or session["label"] != label
        or result["session_id"] != session["id"]
        or result["solver_signature"] != session["solver_signature"]
        or result["solver_sha256"] != session["solver_sha256"]
    ):
        _fail("retained session identity disagrees with adapter result")

    lifecycle_artifact = _retained_json(
        payloads["session_lifecycle"], "retained session lifecycle"
    )
    lifecycle = shared._validate_session_lifecycle(lifecycle_artifact)
    if (
        lifecycle["request_id"] != request_id
        or lifecycle["session_id"] != session["id"]
        or lifecycle["session_label"] != label
        or lifecycle["solver_profile_sha256"]
        != raw_sha256(canonical_json_bytes(query.descriptor["solver_profile"]))
    ):
        _fail("retained lifecycle identity disagrees with authenticated query")
    final_lifecycle = lifecycle
    if "final_session_lifecycle" in descriptors:
        initial_lifecycle = lifecycle
        if not (
            initial_lifecycle["close_outcome"] == "closure_unproven"
            and initial_lifecycle["close_observed_state"] == "unknown"
            and initial_lifecycle["close_status_response_losses"] == 2
        ):
            _fail("retained initial lifecycle lacks closure-loss evidence")
        final_lifecycle = shared._validate_session_lifecycle(
            _retained_json(
                payloads["final_session_lifecycle"],
                "retained final session lifecycle",
            )
        )
        if final_lifecycle != result["session_lifecycle"]:
            _fail("retained final lifecycle disagrees with adapter result")
        if (
            final_lifecycle["request_id"] != request_id
            or final_lifecycle["session_id"] != session["id"]
            or final_lifecycle["session_label"] != label
            or final_lifecycle["solver_profile_sha256"]
            != raw_sha256(canonical_json_bytes(query.descriptor["solver_profile"]))
        ):
            _fail(
                "retained final lifecycle identity disagrees with authenticated query"
            )
    else:
        if lifecycle != result["session_lifecycle"]:
            _fail("retained lifecycle artifact disagrees with adapter result")
    _validate_retained_lifecycle_consistency(final_lifecycle)

    receipts_before, _ = shared._validate_receipts(
        _retained_json(payloads["receipts_before"], "retained pre-solve receipts"),
        session=session,
        query=query,
        solve=None,
        request_id=request_id,
        request_sha256=request_sha256,
        assumption_labels=(),
    )
    receipts, receipt = shared._validate_receipts(
        _retained_json(payloads["receipts"], "retained receipts"),
        session=session,
        query=query,
        solve=None,
        request_id=request_id,
        request_sha256=request_sha256,
        assumption_labels=(),
    )
    if receipts_before["count"] == 1 and receipts_before != receipts:
        _fail("retained resumed pre-solve receipt changed before final capture")

    solve_keys = {"solve", "reconciled_solve"} & set(descriptors)
    raw_status = result["raw_status"]
    solve: dict[str, object] | None = None
    if raw_status is None:
        if solve_keys or receipt is not None:
            _fail("transport-loss result unexpectedly carries a solve or receipt")
        if result["solve_index"] is not None or result["result_sha256"] is not None:
            _fail("transport-loss result has terminal solve fields")
        if (
            not result["response_lost"]
            or result["reconciled_from_receipt"]
            or result["resumed_from_receipt"]
            or not result["request_replay_attempted"]
            or result["request_replayed"] is not None
            or result["reconciliation_attempts"] < 1
        ):
            _fail("transport-loss result has inconsistent reconciliation flags")
    else:
        if raw_status not in {"SAT", "UNSAT", "UNKNOWN"}:
            _fail("retained result has an unsupported raw solver status")
        if len(solve_keys) != 1 or receipt is None:
            _fail("terminal retained result lacks one solve artifact and receipt")
        solve_key = next(iter(solve_keys))
        raw_solve = _retained_json(payloads[solve_key], "retained solve")
        derived_solve = shared._solve_from_receipt(receipt)
        if "replayed" in raw_solve:
            if solve_key == "reconciled_solve" and raw_solve["replayed"] is not True:
                _fail("retained named retry lacks replay proof")
            solve = shared._validate_solve(
                raw_solve,
                timeout_ms=solve_request["timeout_ms"],
                assumptions=(),
                assumption_labels=(),
                named_request=True,
                replay_retry=raw_solve.get("replayed") is True,
            )
        else:
            if raw_solve != derived_solve:
                _fail("retained reconciled solve disagrees with durable receipt")
            solve = derived_solve
        shared._validate_receipts(
            receipts,
            session=session,
            query=query,
            solve=solve,
            request_id=request_id,
            request_sha256=request_sha256,
            assumption_labels=(),
        )
        if (
            solve["status"] != raw_status
            or result["solve_index"] != solve["solve_index"]
            or result["result_sha256"] != receipt["result_sha256"]
            or shared.piqd_result_digest(solve) != receipt["result_sha256"]
        ):
            _fail("retained solve, receipt, result digest, or adapter fields disagree")
        expected_advisory = {
            "algorithm": "piqd-smt-solve-result/v1",
            "locally_recomputed": receipt["result_sha256"],
            "matches_daemon": True,
        }
        if result["result_digest_advisory"] != expected_advisory:
            _fail("retained result digest advisory disagrees with exact recomputation")
        if (solve_key == "reconciled_solve") is not result["response_lost"]:
            _fail("retained solve artifact selection disagrees with response-loss flag")
        if result["request_replay_attempted"] and not result["response_lost"]:
            _fail("retained result claims replay without a lost solve response")
        if (
            result["reconciliation_attempts"] > 0
            and not result["reconciled_from_receipt"]
        ):
            _fail("retained result has receipt polls without receipt reconciliation")
        if result["resumed_from_receipt"] and (
            not result["reconciled_from_receipt"]
            or result["request_replayed"] is not True
        ):
            _fail("retained receipt resume flags are internally inconsistent")

    if _retained_session_is_fresh(session):
        if not lifecycle["resumed_existing_session"] and session["state"] != "live":
            _fail("fresh retained session has an impossible state")
    else:
        if not lifecycle["resumed_existing_session"]:
            _fail("nonfresh retained session lacks resume provenance")
        session_solve = solve if session["solves"] == 1 else None
        shared._validate_session_frontier(
            session,
            created=session,
            query=query,
            solve=session_solve,
        )
        if session["state"] == "closed" and session_solve is None:
            _fail("retained closed session lacks a terminal solve")

    if result["reconciled_from_receipt"] != ("reconciliation_session" in descriptors):
        _fail("retained receipt reconciliation artifact inventory disagrees")

    if raw_status is None:
        if result["result_digest_advisory"] is not None:
            _fail("transport-loss result unexpectedly carries a result digest advisory")
        expected_classification = "INCONCLUSIVE_TRANSPORT_LOSS"
        expected_semantic = None
        expected_cap_replay = None
    elif raw_status == "SAT":
        if solve is None:
            _fail("retained SAT result lacks solve evidence")
        values = solve.get("values")
        model = solve.get("model")
        if type(values) is not str or type(model) is not str:
            _fail("retained SAT solve lacks exact model/readback text")
        replay_record = replay_piqd_sat_values(system, values)
        expected_cap_replay = replay_record.to_record()
        expected_classification = replay_record.adapter_classification
        if replay_record.outcome == "verifier_failure":
            expected_semantic = {
                "accepted": False,
                "failure": "_VerifierFailure",
                "verifier": query.descriptor["semantic_verifier"],
            }
        else:
            expected_semantic = {
                "accepted": replay_record.outcome == "accepted",
                "evidence": expected_cap_replay,
                "verifier": query.descriptor["semantic_verifier"],
                "model_sha256": raw_sha256(model.encode("utf-8")),
                "values_sha256": raw_sha256(values.encode("utf-8")),
            }
        solve_key = next(iter(solve_keys))
        if (
            result["cap_values_artifact"] != descriptors[solve_key]
            or result["cap_values_json_field"] != "values"
            or result["cap_values_raw_sha256"] != raw_sha256(values.encode("utf-8"))
        ):
            _fail("retained cap values binding disagrees with exact solve text")
    elif raw_status == "UNSAT":
        if solve is None:
            _fail("retained UNSAT result lacks solve evidence")
        expected_classification = "UNSAT_DISCOVERY_ONLY"
        expected_semantic = None
        expected_cap_replay = None
    else:
        expected_classification = "INCONCLUSIVE_UNKNOWN"
        expected_semantic = None
        expected_cap_replay = None

    if raw_status != "SAT" and (
        result["cap_values_artifact"] is not None
        or result["cap_values_json_field"] is not None
        or result["cap_values_raw_sha256"] is not None
    ):
        _fail("non-SAT retained result unexpectedly carries cap values evidence")
    if (
        result["effective_status"] != expected_classification
        or result["classification"] != expected_classification
        or result["semantic_replay"] != expected_semantic
        or result["cap_semantic_replay"] != expected_cap_replay
    ):
        _fail("retained semantic classification or replay record disagrees")
    if expected_semantic is None:
        if "semantic" in descriptors:
            _fail("non-semantic retained result unexpectedly has a semantic artifact")
    else:
        if (
            "semantic" not in descriptors
            or _retained_json(payloads["semantic"], "retained semantic replay")
            != expected_semantic
        ):
            _fail("retained semantic artifact disagrees with exact replay")

    expected_unsat = (
        shared._unsat_assumption_provenance(query, solve, ())
        if solve is not None and raw_status == "UNSAT"
        else None
    )
    if result["unsat_assumptions"] != expected_unsat:
        _fail("retained UNSAT assumption provenance disagrees")
    if result["claims"] != dict(shared.FALSE_CLAIMS):
        _fail("retained adapter result makes an unsupported claim")

    if "reconciliation_session" in descriptors:
        reconciliation = shared._validate_session_record(
            _retained_json(
                payloads["reconciliation_session"],
                "retained reconciliation session",
            ),
            "retained reconciliation session",
        )
        if (
            reconciliation["lane"] != "smt"
            or reconciliation["solver_name"] != solver
            or reconciliation["label"] != label
        ):
            _fail("retained reconciliation session identity mismatch")
        shared._validate_session_frontier(
            reconciliation,
            created=session,
            query=query,
            solve=solve,
        )

    if "closed_session" in descriptors:
        closed = shared._validate_session(
            _retained_json(payloads["closed_session"], "retained closed session"),
            solver=solver,
            label=label,
            expected_state="closed",
        )
        shared._validate_closed_session(
            closed,
            created=session,
            query=query,
            solve=solve,
        )
        if final_lifecycle["close_observed_state"] != "closed":
            _fail("retained close lifecycle disagrees with closed session artifact")
    elif final_lifecycle["close_observed_state"] != "absent":
        _fail("retained close lifecycle lacks closed or absent evidence")
    return result


def validate_retained_cell_query_result(
    *,
    cell_bytes: bytes,
    system_bytes: bytes,
    solver: str,
    timeout_ms: int,
    request_id: str,
    adapter_result: Mapping[str, object],
    output_fd: int,
) -> dict[str, object]:
    """Authenticate and replay one retained cap PIQD result without PIQD."""

    try:
        query = build_authenticated_cell_query(
            cell_bytes=cell_bytes,
            system_bytes=system_bytes,
            solver=solver,
            timeout_ms=timeout_ms,
        )
        request_id = shared._canonical_uuid(request_id, "request_id")
        system = _system_from_query(query)
        return _validate_retained_result_impl(
            query=query,
            system=system,
            solver=solver,
            request_id=request_id,
            adapter_result=adapter_result,
            output_fd=output_fd,
        )
    except CapConfigurationPiqdAdapterError:
        raise
    except Exception as exc:
        raise CapConfigurationPiqdAdapterError(
            "retained cap PIQD result failed offline validation"
        ) from exc


class _VerifierFailure(RuntimeError):
    pass


def run_authenticated_cell_query(
    query: SourceSemanticQuery,
    *,
    request_id: str,
    transport: PiqdTransport,
    output_fd: int,
    used_session_ids: set[str] | None = None,
    resume_policy: str | None = None,
) -> dict[str, object]:
    """Run exactly one solver request and preserve the shared classification."""

    system = _system_from_query(query)
    profile = query.descriptor.get("solver_profile")
    if type(profile) is not dict or type(profile.get("solvers")) is not list:
        _fail("query has no supported single-solver selection")
    solvers = profile["solvers"]
    if (
        len(solvers) != 1
        or type(solvers[0]) is not str
        or solvers[0] not in shared.SOLVERS
    ):
        _fail("query has no supported single-solver selection")
    solver = solvers[0]
    replay_record: SemanticReplayRecord | None = None

    def semantic_verifier(
        _query: SourceSemanticQuery,
        _solver: str,
        _model: str,
        values: str | None,
    ) -> shared.SemanticVerification:
        nonlocal replay_record
        if type(values) is not str:
            raise _VerifierFailure("SAT response lacks exact get-value text")
        replay_record = replay_piqd_sat_values(system, values)
        if replay_record.outcome == "verifier_failure":
            raise _VerifierFailure("cap exact replay verifier failed")
        return shared.SemanticVerification(
            replay_record.outcome == "accepted", replay_record.to_record()
        )

    try:
        engine = shared.run_authenticated_single_solver_query(
            query,
            solver=solver,
            descriptor_schema=CAP_QUERY_SCHEMA,
            solver_profile_schema=CAP_SOLVER_PROFILE_SCHEMA,
            authenticated_journal_commands=system.state_commands(),
            transport=transport,
            semantic_verifier=semantic_verifier,
            output_fd=output_fd,
            used_session_ids=used_session_ids,
            request_id=request_id,
            assumption_labels=(),
            resume_policy=resume_policy,
        )
    except CapConfigurationPiqdAdapterError:
        raise
    except Exception as exc:
        raise CapConfigurationPiqdAdapterError(
            "authenticated cap PIQD query failed closed"
        ) from exc

    classification = engine.get("effective_status")
    if classification not in CAP_ADAPTER_CLASSIFICATIONS:
        _fail("shared adapter returned a non-frozen classification")
    replay = None if replay_record is None else replay_record.to_record()
    if replay is not None and replay["adapter_classification"] != classification:
        _fail("cap replay classification disagrees with shared adapter")
    values_artifact = None
    values_field = None
    values_raw_sha256 = None
    if engine.get("raw_status") == "SAT":
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            _fail("SAT engine lacks immutable shared artifacts")
        artifact_key = "reconciled_solve" if engine.get("response_lost") else "solve"
        values_artifact = artifacts.get(artifact_key)
        if type(values_artifact) is not dict:
            _fail("SAT engine lacks its immutable solve artifact")
        values_field = "values"
        if replay is not None:
            values_raw_sha256 = replay["values_raw_sha256"]
    return {
        **engine,
        "schema": CAP_ADAPTER_RESULT_SCHEMA,
        "classification": classification,
        "cap_semantic_replay": replay,
        "cap_values_artifact": values_artifact,
        "cap_values_json_field": values_field,
        "cap_values_raw_sha256": values_raw_sha256,
    }


def stdlib_piqd_transport(base_url: str, *, timeout_ms: int) -> PiqdTransport:
    """Return the bounded no-redirect standard-library PIQD transport."""

    try:
        timeout_s = shared.bounded_solve_http_timeout_s(timeout_ms)
        return shared.UrllibPiqdTransport(base_url, http_timeout_s=timeout_s)
    except Exception as exc:
        raise CapConfigurationPiqdAdapterError(
            "invalid bounded PIQD HTTP transport configuration"
        ) from exc


__all__ = [
    "CAP_ADAPTER_CLASSIFICATIONS",
    "CAP_ADAPTER_RESULT_SCHEMA",
    "CAP_CELL_SCHEMA",
    "CAP_QUERY_SCHEMA",
    "CAP_SOLVER_PROFILE_SCHEMA",
    "PIQD_RESUME_ALLOW_CREATE_IF_MISSING",
    "PIQD_RESUME_REQUIRE_EXISTING",
    "BytesResponse",
    "CapConfigurationPiqdAdapterError",
    "JsonResponse",
    "PiqdTransport",
    "PiqdTransportLoss",
    "SourceSemanticQuery",
    "build_authenticated_cell_query",
    "run_authenticated_cell_query",
    "stdlib_piqd_transport",
    "validate_retained_cell_query_result",
]
