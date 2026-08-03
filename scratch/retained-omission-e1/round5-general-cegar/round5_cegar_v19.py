#!/usr/bin/env python3
"""Round-5 v19: replay identity without normalized SMT serialization.

This worker inherits v18's complete profile-specific static equality bank and
v17's two dynamic lanes.  The fixed-assignment lane still performs a primary
QF_LRA check and a freshly reconstructed independent QF_LRA replay, but it no
longer serializes the (very large) normalized assertion vector.  Instead, both
checks authenticate the same compositional identity: frozen raw formula,
complete assignment, deterministic normalizer source/specification, and the
audited assertion/tracker inventories.

Every proposed assignment and every completed outcome/blocker is also written
to an immutable, hash-chained, fsynced journal record.  UNKNOWN never admits a
blocker.  This remains external exact-n15 solver evidence, not a Lean proof.
"""

from __future__ import annotations

import argparse
import hashlib
import inspect
import json
import os
import time
from collections.abc import Mapping, Sequence
from functools import cache
from pathlib import Path

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v18 as v18
import z3

HERE = Path(__file__).resolve().parent
TARGET = v18.TARGET
SCHEMA_VERSION = 19
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v19.json"
TEST_PATH = HERE / "test_round5_cegar_v19.py"
FOCUSED_TEST_LOG_PATH = HERE / "focused-tests-v19.log"
FOCUSED_TEST_COMMAND = "uv run --with pytest pytest -q test_round5_cegar_v19.py"
Case = v18.Case
Fix = v18.Fix

NORMALIZATION_SPEC = {
    "scheme": "round5-v19-fixed-assignment-qf-lra/v1",
    "steps": [
        "validate exact tracker allowlist and raw PB inventory",
        "substitute the complete semantic-Bool assignment and trackers=true",
        "simplify every non-tracker raw assertion",
        "rewrite only the audited weighted PB shapes",
        "apply Z3 card2bv in the assertion context",
        "audit the result as QF_LRA",
    ],
    "identity_is_not": "a raw or normalized SMT formula SHA-256",
}


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def optional_file_sha256(path: Path) -> str | None:
    return file_sha256(path) if path.is_file() else None


def canonical_sha256(value: object) -> str:
    return v17.canonical_sha256(value)


def _assignment_record(fixes: Sequence[Fix]) -> list[dict[str, object]]:
    return [fix.record() for fix in sorted(fixes, key=lambda item: str(item.variable))]


@cache
def normalization_source_sha256() -> str:
    """Pin the executable normalizer and its inherited rewrite/audit helpers."""
    return canonical_sha256({
        "specification": NORMALIZATION_SPEC,
        "fixed_normalizer_source": inspect.getsource(_fixed_normalized_formula),
        "weighted_pb_rewriter_source": inspect.getsource(v17.rewrite_weighted_pbs),
        "logic_audit_source": inspect.getsource(v17.logic_audit),
    })


def _normalization_identity(
    *,
    frozen_full_formula_sha256: str,
    assignment_sha256: str,
    source_assertion_count: int,
    normalized_assertion_count: int,
    tracker_count: int,
    frozen_raw_pb_nodes: int,
    pre_normalization_pb_nodes: int,
) -> dict[str, object]:
    components: dict[str, object] = {
        "scheme": "round5-v19-compositional-normalized-replay/v1",
        "frozen_full_formula_sha256": frozen_full_formula_sha256,
        "complete_assignment_sha256": assignment_sha256,
        "normalization_spec_sha256": canonical_sha256(NORMALIZATION_SPEC),
        "normalization_source_sha256": normalization_source_sha256(),
        "source_assertion_count": source_assertion_count,
        "normalized_assertion_count": normalized_assertion_count,
        "tracker_count": tracker_count,
        "frozen_raw_pb_nodes": frozen_raw_pb_nodes,
        "pre_normalization_pb_nodes": pre_normalization_pb_nodes,
    }
    return {
        "kind": "compositional_normalized_replay_identity",
        "is_raw_formula_sha256": False,
        "components": components,
        "sha256": canonical_sha256(components),
    }


def validate_normalization_identity(
    primary: Mapping[str, object], replay: Mapping[str, object]
) -> None:
    if primary != replay:
        differing = sorted(
            key for key in set(primary) | set(replay)
            if primary.get(key) != replay.get(key)
        )
        raise RuntimeError(
            f"fresh normalized replay identity differs from primary: {differing}"
        )
    if primary.get("is_raw_formula_sha256") is not False:
        raise RuntimeError("normalized replay identity was mislabeled as a raw formula hash")
    components = primary.get("components")
    if not isinstance(components, dict):
        raise TypeError("normalized replay identity components are missing")
    if primary.get("sha256") != canonical_sha256(components):
        raise RuntimeError("normalized replay compositional identity hash is invalid")


def _fixed_normalized_formula(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[Fix],
    frozen_full_formula_sha256: str,
) -> tuple[tuple[z3.BoolRef, ...], tuple[z3.BoolRef, ...], dict[str, object]]:
    """Normalize exactly as v17, without serializing normalized assertions."""
    started = time.monotonic()
    trackers = v17._tracker_refs(frozen_assertions)
    tracker_names = {str(tracker) for tracker in trackers}
    if tracker_names != v17.TRACKER_ALLOWLIST:
        raise RuntimeError(
            "frozen formula tracker allowlist mismatch: "
            f"missing={sorted(v17.TRACKER_ALLOWLIST - tracker_names)}, "
            f"extra={sorted(tracker_names - v17.TRACKER_ALLOWLIST)}"
        )
    raw_pb_count = sum(
        node.decl().kind() in v17.PB_KINDS
        for node in v16._walk(frozen_assertions)
        if not z3.is_quantifier(node)
    )
    is_round5_universe = len(fixes) == 825 and any(
        str(fix.variable).startswith("block_") for fix in fixes
    )
    if is_round5_universe and raw_pb_count != 4_768:
        raise RuntimeError(
            f"frozen raw PB inventory changed: expected 4768, got {raw_pb_count}"
        )
    tracker_ids = {tracker.get_id() for tracker in trackers}
    ctx = frozen_assertions[0].ctx if frozen_assertions else z3.main_ctx()
    substitutions = (
        tuple((fix.variable, z3.BoolVal(fix.value, ctx=ctx)) for fix in fixes)
        + tuple((tracker, z3.BoolVal(True, ctx=ctx)) for tracker in trackers)
    )
    source = [
        assertion for assertion in frozen_assertions
        if assertion.get_id() not in tracker_ids
    ]
    simplified = [
        z3.simplify(z3.substitute(assertion, *substitutions))
        for assertion in source
    ]
    pb_nodes = [
        node for node in v16._walk(simplified)
        if not z3.is_quantifier(node) and node.decl().kind() in v17.PB_KINDS
    ]
    before_pb = len(pb_nodes)
    pb_shapes: dict[str, int] = {}
    for node in pb_nodes:
        key = (
            f"kind={node.decl().kind()};arity={node.num_args()};"
            f"params={','.join(map(str, node.params()))}"
        )
        pb_shapes[key] = pb_shapes.get(key, 0) + 1
    combined = z3.And(*simplified)
    rewritten = v17.rewrite_weighted_pbs(combined)
    goal = z3.Goal(ctx=ctx)
    goal.add(rewritten)
    transformed = z3.Tactic("card2bv", ctx=ctx)(goal)
    if len(transformed) != 1:
        raise RuntimeError(f"card2bv produced {len(transformed)} subgoals")
    normalized = tuple(transformed[0])
    audit = v17.logic_audit(normalized)
    if audit["accepted"] is not True:
        raise RuntimeError(f"post-normalization logic audit rejected formula: {audit}")
    assignment_sha = canonical_sha256(_assignment_record(fixes))
    identity = _normalization_identity(
        frozen_full_formula_sha256=frozen_full_formula_sha256,
        assignment_sha256=assignment_sha,
        source_assertion_count=len(source),
        normalized_assertion_count=len(normalized),
        tracker_count=len(trackers),
        frozen_raw_pb_nodes=raw_pb_count,
        pre_normalization_pb_nodes=before_pb,
    )
    return normalized, trackers, {
        "elapsed_seconds": time.monotonic() - started,
        "source_assertion_count": len(source),
        "frozen_raw_pb_nodes": raw_pb_count,
        "normalized_assertion_count": len(normalized),
        "pre_normalization_pb_nodes": before_pb,
        "pre_normalization_pb_shapes": dict(sorted(pb_shapes.items())),
        "normalized_replay_identity": identity,
        "normalized_formula_sha256": None,
        "normalized_formula_serialized": False,
        "logic_audit": audit,
    }


def _normalized_check(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[Fix],
    timeout_ms: int,
    seed: int,
    frozen_full_formula_sha256: str,
) -> tuple[str, z3.ModelRef | None, dict[str, object]]:
    normalized, trackers, normalization = _fixed_normalized_formula(
        frozen_assertions, fixes, frozen_full_formula_sha256
    )
    ctx = frozen_assertions[0].ctx if frozen_assertions else z3.main_ctx()
    solver = z3.SolverFor("QF_LRA", ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    solver.add(*normalized)
    started = time.monotonic()
    outcome = solver.check()
    elapsed = time.monotonic() - started
    model = solver.model() if outcome == z3.sat else None
    if model is not None:
        for fix in fixes:
            model.update_value(fix.variable.decl(), z3.BoolVal(fix.value, ctx=ctx))
        for tracker in trackers:
            model.update_value(tracker.decl(), z3.BoolVal(True, ctx=ctx))
    record = {
        "status": str(outcome),
        "elapsed_seconds": elapsed,
        "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
        "normalization": normalization,
        "tracker_assumption_count": len(trackers),
        "tracker_mode": "exact_allowlist_substituted_true",
        "tracker_core_status": "not_requested_after_assumption_lane_timed_out",
        "tracker_core": [],
        "tracker_core_sha256": canonical_sha256([]),
    }
    return str(outcome), model, record


def _reconstruct_frozen(
    assertions: Sequence[z3.BoolRef],
    fixes: Sequence[Fix],
    frozen_full_formula_sha256: str,
) -> tuple[tuple[z3.BoolRef, ...], tuple[Fix, ...], dict[str, str]]:
    fresh_ctx = z3.Context()
    reconstructed = tuple(assertion.translate(fresh_ctx) for assertion in assertions)
    reconstructed_fixes = tuple(
        Fix(z3.Bool(str(fix.variable), ctx=fresh_ctx), fix.value) for fix in fixes
    )
    reconstructed_hash = v17.raw_formula_sha256(reconstructed)
    if frozen_full_formula_sha256 != reconstructed_hash:
        raise RuntimeError("fresh raw-formula reconstruction changed frozen formula hash")
    return reconstructed, reconstructed_fixes, {
        "source_assertions_sha256": frozen_full_formula_sha256,
        "reconstructed_assertions_sha256": reconstructed_hash,
    }


def check_assignment(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[Fix],
    timeout_ms: int,
    seed: int,
    iteration: int,
    frozen_full_formula_sha256: str | None = None,
) -> tuple[str, z3.ModelRef | None, tuple[Fix, ...], dict[str, object]]:
    assignment_record = _assignment_record(fixes)
    assignment_hash = canonical_sha256(assignment_record)
    universe_hash = canonical_sha256(sorted(str(fix.variable) for fix in fixes))
    if len(fixes) != 825 or len({str(fix.variable) for fix in fixes}) != 825:
        raise RuntimeError("v19 requires exactly 825 unique complete semantic fixes")
    expected_blocker_hash = hashlib.sha256(
        v16.blocker_for_core(fixes).sexpr().encode()
    ).hexdigest()
    closure_core = v17.equality_closure_core(fixes)
    if closure_core:
        replay = v16.replay_projected_core(
            frozen_assertions,
            closure_core,
            timeout_ms,
            seed,
            nonce=f"v19_closure_{iteration:06d}",
        )
        if replay["status"] == "unknown":
            return "unknown", None, (), {
                "status": "unknown",
                "lane": "equality_closure_raw_replay",
                "reason_unknown": replay["reason_unknown"],
                "replay": replay,
            }
        v16.authenticate_unsat_core(replay)
        return "unsat", None, closure_core, {
            "status": "unsat",
            "lane": "equality_closure_raw_replay",
            "generalized": True,
            "assignment_sha256": assignment_hash,
            "projected_core_size": len(closure_core),
            "replay": replay,
        }

    raw_formula_hash = frozen_full_formula_sha256 or v17.raw_formula_sha256(
        frozen_assertions
    )
    first_status, model, first = _normalized_check(
        frozen_assertions, fixes, timeout_ms, seed, raw_formula_hash
    )
    if first_status == "unknown":
        return "unknown", None, (), {
            "status": "unknown",
            "lane": "fixed_assignment_qf_lra",
            "reason_unknown": first["reason_unknown"],
            "primary": first,
        }
    if first_status == "sat":
        assert model is not None
        validation = v17._validate_raw_model(frozen_assertions, model)
        if validation["failures"]:
            raise RuntimeError("normalized SAT model failed frozen raw assertion evaluation")
        return "sat", model, (), {
            "status": "sat",
            "lane": "fixed_assignment_qf_lra",
            "reason_unknown": None,
            "primary": first,
            "raw_model_validation": validation,
        }

    reconstructed, replay_fixes, reconstruction = _reconstruct_frozen(
        frozen_assertions, fixes, raw_formula_hash
    )
    replay_status, _, replay = _normalized_check(
        reconstructed, replay_fixes, timeout_ms, seed, raw_formula_hash
    )
    replay_assignment_hash = canonical_sha256(_assignment_record(replay_fixes))
    if replay_assignment_hash != assignment_hash:
        raise RuntimeError("fresh normalized replay assignment identity changed")
    primary_normalization = first["normalization"]
    replay_normalization = replay["normalization"]
    assert isinstance(primary_normalization, dict)
    assert isinstance(replay_normalization, dict)
    validate_normalization_identity(
        primary_normalization["normalized_replay_identity"],
        replay_normalization["normalized_replay_identity"],
    )
    if replay_status == "unknown":
        return "unknown", None, (), {
            "status": "unknown",
            "lane": "fixed_assignment_qf_lra_replay",
            "reason_unknown": replay["reason_unknown"],
            "primary": first,
            "replay": replay,
        }
    if replay_status != "unsat":
        raise RuntimeError(
            f"fresh normalized replay disagreed with UNSAT primary: {replay_status}"
        )
    replay.update({
        "replay_status": replay_status,
        "theory_logic": "QF_LRA",
        "qf_lra_audit": replay_normalization["logic_audit"],
        "normalized_replay_identity": replay_normalization[
            "normalized_replay_identity"
        ],
        "fixed_assignment_pb_nodes": replay_normalization[
            "pre_normalization_pb_nodes"
        ],
        "frozen_raw_pb_nodes": replay_normalization["frozen_raw_pb_nodes"],
        "raw_formula_sha256": raw_formula_hash,
        **reconstruction,
        "semantic_bool_universe_sha256": universe_hash,
        "assignment_sha256": replay_assignment_hash,
        "complete_blocker_sha256": expected_blocker_hash,
        "complete_assignment_size": len(replay_fixes),
    })
    return "unsat", None, tuple(fixes), {
        "status": "unsat",
        "lane": "fixed_assignment_qf_lra",
        "reason_unknown": None,
        "generalized": False,
        "blocker_scope": "complete_semantic_assignment",
        "assignment_sha256": assignment_hash,
        "semantic_bool_universe_sha256": universe_hash,
        "expected_complete_blocker_sha256": expected_blocker_hash,
        "frozen_full_formula_sha256": raw_formula_hash,
        "primary": first,
        "fresh_normalized_full_replay": replay,
    }


class AssignmentJournal:
    """Immutable atomic record files forming one append-only hash chain."""

    def __init__(self, path: Path):
        self.path = path

    def _record_paths(self) -> list[Path]:
        if not self.path.is_dir():
            return []
        return sorted(self.path.glob("[0-9][0-9][0-9][0-9][0-9][0-9].json"))

    def recover(self) -> dict[str, object]:
        records: list[dict[str, object]] = []
        pending: dict[str, dict[str, object]] = {}
        completed: list[dict[str, object]] = []
        previous: str | None = None
        for expected_sequence, path in enumerate(self._record_paths()):
            try:
                record = json.loads(path.read_text())
            except (OSError, json.JSONDecodeError) as exc:
                raise RuntimeError(f"invalid journal record {path.name}: {exc}") from exc
            if record.get("sequence") != expected_sequence:
                raise RuntimeError(f"nonconsecutive journal record {path.name}")
            if record.get("previous_record_sha256") != previous:
                raise RuntimeError(f"journal hash chain mismatch at {path.name}")
            payload = record.get("payload")
            if record.get("payload_sha256") != canonical_sha256(payload):
                raise RuntimeError(f"journal payload hash mismatch at {path.name}")
            authenticated = {key: record[key] for key in (
                "sequence", "previous_record_sha256", "payload", "payload_sha256"
            )}
            digest = canonical_sha256(authenticated)
            if record.get("record_sha256") != digest:
                raise RuntimeError(f"journal record hash mismatch at {path.name}")
            if not isinstance(payload, dict):
                raise TypeError(f"journal payload is not an object at {path.name}")
            assignment_sha = payload.get("assignment_sha256")
            if not isinstance(assignment_sha, str):
                raise TypeError(f"journal assignment identity missing at {path.name}")
            phase = payload.get("phase")
            if phase == "proposed":
                if assignment_sha in pending:
                    raise RuntimeError("duplicate pending journal proposal")
                pending[assignment_sha] = payload
            elif phase == "outcome":
                if assignment_sha not in pending:
                    raise RuntimeError("journal outcome has no pending proposal")
                pending.pop(assignment_sha)
                completed.append(payload)
            else:
                raise RuntimeError(f"unknown journal phase at {path.name}: {phase}")
            records.append(record)
            previous = digest
        return {
            "record_count": len(records),
            "head_sha256": previous,
            "pending": list(pending.values()),
            "completed": completed,
            "records": records,
        }

    def append(self, payload: Mapping[str, object]) -> dict[str, object]:
        state = self.recover()
        sequence = int(state["record_count"])
        payload_copy = dict(payload)
        record: dict[str, object] = {
            "sequence": sequence,
            "previous_record_sha256": state["head_sha256"],
            "payload": payload_copy,
            "payload_sha256": canonical_sha256(payload_copy),
        }
        record["record_sha256"] = canonical_sha256(record)
        self.path.mkdir(parents=True, exist_ok=True)
        final_path = self.path / f"{sequence:06d}.json"
        temporary_path = self.path / f".{sequence:06d}.{os.getpid()}.tmp"
        data = (json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n").encode()
        descriptor = os.open(
            temporary_path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o644
        )
        try:
            written = os.write(descriptor, data)
            if written != len(data):
                raise RuntimeError("short write while appending assignment journal")
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
        os.replace(temporary_path, final_path)
        directory_descriptor = os.open(self.path, os.O_RDONLY)
        try:
            os.fsync(directory_descriptor)
        finally:
            os.close(directory_descriptor)
        return record


def source_contract() -> dict[str, object]:
    contract = v18.source_contract()
    role_map = dict(contract["role_map"])
    role_map["boolean_assignment_cegar"] = (
        "v19 inherits v18's complete static bank and v17's exact dynamic "
        "semantics; fixed assignments use primary plus freshly reconstructed "
        "normalized QF_LRA replay authenticated compositionally without "
        "normalized SMT serialization, with an atomic hash-chained journal"
    )
    contract["role_map"] = role_map
    return contract


def provenance() -> dict[str, object]:
    inherited = v18.provenance()
    return {
        **inherited,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "base_v18_script_sha256": file_sha256(HERE / "round5_cegar_v18.py"),
        "base_v18_schema_sha256": file_sha256(HERE / "schema_v18.json"),
        "base_v18_focused_test_source_sha256": inherited[
            "focused_test_source_sha256"
        ],
        "base_v18_focused_test_log_sha256": inherited["focused_test_log_sha256"],
        "base_v18_focused_test_command": inherited["focused_test_command"],
        "static_equality_triangle_bank_manifest": v18.static_triangle_bank_manifest(),
        "normalization_spec_sha256": canonical_sha256(NORMALIZATION_SPEC),
        "normalization_source_sha256": normalization_source_sha256(),
        "focused_test_source": TEST_PATH.name,
        "focused_test_source_sha256": file_sha256(TEST_PATH),
        "focused_test_log": FOCUSED_TEST_LOG_PATH.name,
        "focused_test_log_sha256": optional_file_sha256(FOCUSED_TEST_LOG_PATH),
        "focused_test_command": FOCUSED_TEST_COMMAND,
        "source_contract": source_contract(),
    }


def verify_frozen_provenance(
    frozen: dict[str, object], expected_script_sha256: str | None = None
) -> dict[str, object]:
    current = provenance()
    if frozen != current:
        differing = sorted(
            key for key in set(frozen) | set(current)
            if frozen.get(key) != current.get(key)
        )
        raise RuntimeError(f"frozen provenance differs from worker source: {differing}")
    if expected_script_sha256 is not None and current["script_sha256"] != expected_script_sha256:
        raise RuntimeError("worker v19 source hash differs from parent invocation")
    return current


# Re-export v18's bank for focused audits and downstream workers.
static_triangle_bank = v18.static_triangle_bank
static_triangle_bank_manifest = v18.static_triangle_bank_manifest
add_static_triangle_bank = v18.add_static_triangle_bank
equality_closure_core = v17.equality_closure_core


def _journal_summary(journal: AssignmentJournal) -> dict[str, object]:
    recovered = journal.recover()
    completed = recovered["completed"]
    pending = recovered["pending"]
    assert isinstance(completed, list)
    assert isinstance(pending, list)
    return {
        "directory": journal.path.name,
        "record_count": recovered["record_count"],
        "head_sha256": recovered["head_sha256"],
        "completed_assignment_count": len(completed),
        "pending_assignment_count": len(pending),
        "completed_assignment_sha256": canonical_sha256([
            item["assignment_sha256"] for item in completed
        ]),
        "pending_assignment_sha256": canonical_sha256([
            item["assignment_sha256"] for item in pending
        ]),
    }


def _rename_v19_artifacts(case_dir: Path, result: dict[str, object]) -> None:
    mapping = {
        "cegar_trace_v16.json": "cegar_trace_v19.json",
        "boolean_prepass_v16.json": "boolean_prepass_v19.json",
        "boolean_master_v16.smt2.gz": "boolean_master_v19.smt2.gz",
        "full_frozen_v16.smt2.gz": "full_frozen_v19.smt2.gz",
        "witness_v16.json": "witness_v19.json",
    }
    for old, new in mapping.items():
        old_path = case_dir / old
        if old_path.exists():
            old_path.rename(case_dir / new)
        for key, value in list(result.items()):
            if value == old:
                result[key] = new
    trace_path = case_dir / "cegar_trace_v19.json"
    prepass_path = case_dir / "boolean_prepass_v19.json"
    if trace_path.exists():
        result["cegar_trace_sha256"] = file_sha256(trace_path)
    if prepass_path.exists():
        result["boolean_prepass_sha256"] = file_sha256(prepass_path)
    blobs: dict[str, dict[str, str]] = {}
    for role, filename in (
        ("boolean_master", "boolean_master_v19.smt2.gz"),
        ("full_frozen", "full_frozen_v19.smt2.gz"),
    ):
        path = case_dir / filename
        if path.is_file():
            blobs[role] = {"file": filename, "sha256": file_sha256(path)}
    result["frozen_blob_hashes"] = blobs
    result["result_hash_contract"] = {
        "embedded": False,
        "reason": "A result.json SHA-256 cannot be embedded in its own bytes.",
        "external_attestation": "summary.json:results[0].result_file_sha256",
    }


def _rename_incomplete_reason(result: dict[str, object]) -> None:
    reason = result.get("reason_incomplete")
    if reason == "v16_assignment_budget_exhausted":
        result["reason_incomplete"] = "v19_assignment_budget_exhausted"
    elif reason == "v16_wall_clock_budget_exhausted":
        result["reason_incomplete"] = "v19_wall_clock_budget_exhausted"


def solve_case(
    case: Case,
    timeout_ms: int,
    out_dir: Path,
    seed: int = 97,
    max_power_cuts: int = 256,
    max_power_candidates: int = 2_000_000,
    bool_timeout_ms: int = 30_000,
    max_bool_power_cuts: int = 256,
    max_bool_power_candidates: int = 2_000_000,
    max_assignments: int = 256,
    replay_timeout_ms: int = 30_000,
    expected_script_sha256: str | None = None,
    frozen_provenance: dict[str, object] | None = None,
) -> dict[str, object]:
    launch = frozen_provenance if frozen_provenance is not None else provenance()
    expected = expected_script_sha256 or str(launch["script_sha256"])
    old_check = v16.check_assignment
    old_verify = v16.verify_frozen_provenance
    old_prepass = v12.run_boolean_prepass
    journal = AssignmentJournal(
        out_dir / case.case_id / "assignment-journal-v19"
    )
    frozen_hash_cache: str | None = None

    def journaled_check(
        frozen_assertions: Sequence[z3.BoolRef],
        fixes: Sequence[Fix],
        timeout_ms: int,
        seed: int,
        iteration: int,
    ) -> tuple[str, z3.ModelRef | None, tuple[Fix, ...], dict[str, object]]:
        nonlocal frozen_hash_cache
        if frozen_hash_cache is None:
            frozen_hash_cache = v17.raw_formula_sha256(frozen_assertions)
        assignment = _assignment_record(fixes)
        assignment_sha = canonical_sha256(assignment)
        journal.append({
            "phase": "proposed",
            "iteration": iteration,
            "assignment": assignment,
            "assignment_sha256": assignment_sha,
            "frozen_full_formula_sha256": frozen_hash_cache,
        })
        try:
            outcome, model, core, record = check_assignment(
                frozen_assertions,
                fixes,
                timeout_ms,
                seed,
                iteration,
                frozen_hash_cache,
            )
        except Exception as exc:
            journal.append({
                "phase": "outcome",
                "iteration": iteration,
                "assignment_sha256": assignment_sha,
                "status": "error",
                "error": f"{type(exc).__name__}: {exc}",
                "blocker": None,
            })
            raise
        blocker_record: dict[str, object] | None = None
        if outcome == "unsat":
            blocker = v16.blocker_for_core(core)
            core_record = [fix.record() for fix in core]
            blocker_record = {
                "projected_core": core_record,
                "projected_core_sha256": canonical_sha256(core_record),
                "blocker": blocker.sexpr(),
                "blocker_sha256": hashlib.sha256(blocker.sexpr().encode()).hexdigest(),
            }
        journal.append({
            "phase": "outcome",
            "iteration": iteration,
            "assignment_sha256": assignment_sha,
            "status": outcome,
            "full_check_sha256": canonical_sha256(record),
            "blocker": blocker_record,
        })
        return outcome, model, core, record

    def prepass_with_static_bank(*args: object, **kwargs: object):
        report, learned, master = old_prepass(*args, **kwargs)
        _, bank_record = v18.add_static_triangle_bank(master, case.profiles)
        report = dict(report)
        report["static_equality_triangle_bank"] = bank_record
        return report, learned, master

    try:
        v16.check_assignment = journaled_check
        v16.verify_frozen_provenance = verify_frozen_provenance
        v12.run_boolean_prepass = prepass_with_static_bank
        result = v16.solve_case(
            case=case,
            timeout_ms=timeout_ms,
            out_dir=out_dir,
            seed=seed,
            max_power_cuts=max_power_cuts,
            max_power_candidates=max_power_candidates,
            bool_timeout_ms=bool_timeout_ms,
            max_bool_power_cuts=max_bool_power_cuts,
            max_bool_power_candidates=max_bool_power_candidates,
            max_assignments=max_assignments,
            replay_timeout_ms=replay_timeout_ms,
            expected_script_sha256=expected,
            frozen_provenance=launch,
        )
    finally:
        v16.check_assignment = old_check
        v16.verify_frozen_provenance = old_verify
        v12.run_boolean_prepass = old_prepass

    case_dir = out_dir / case.case_id
    _rename_v19_artifacts(case_dir, result)
    _rename_incomplete_reason(result)
    prepass = result.get("boolean_prepass")
    if isinstance(prepass, dict):
        result["static_equality_triangle_bank"] = prepass.get(
            "static_equality_triangle_bank"
        )
    result["assignment_journal"] = _journal_summary(journal)
    result["theory_classification"] = (
        "static Boolean equality implications; then exact PB rewriting and "
        "audited QF_LRA with compositional replay identity"
    )
    result["solver_lane"] = (
        "v18 static length-two bank; replay-authenticated dynamic equality "
        "closure; otherwise primary plus fresh-context QF_LRA replay without "
        "normalized SMT serialization"
    )
    v12.write_json(case_dir / "result.json", result)
    return result


def parser() -> argparse.ArgumentParser:
    result = v16.parser()
    result.description = __doc__
    for action in result._actions:
        if isinstance(action, argparse._SubParsersAction):
            for subparser in action.choices.values():
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = HERE / "artifacts-v19"
    return result


def run_one(args: argparse.Namespace, case: Case, command: str) -> int:
    started = time.monotonic()
    run_dir = v8.make_run_dir(args.artifacts, command)
    frozen = provenance()
    invocation = {
        **frozen,
        "argv": list(__import__("sys").argv),
        "case_count": 1,
        "workers": 1,
        "resolved_budgets": {
            "timeout_ms": args.timeout_ms,
            "bool_timeout_ms": args.bool_timeout_ms,
            "replay_timeout_ms": args.replay_timeout_ms,
            "max_assignments": args.max_assignments,
            "max_bool_power_cuts": args.max_bool_power_cuts,
            "max_bool_power_candidates": args.max_bool_power_candidates,
        },
    }
    v12.write_json(run_dir / "invocation.json", invocation)
    result = solve_case(
        case=case,
        timeout_ms=args.timeout_ms,
        out_dir=run_dir,
        seed=args.seed,
        max_power_cuts=args.max_power_cuts,
        max_power_candidates=args.max_power_candidates,
        bool_timeout_ms=args.bool_timeout_ms,
        max_bool_power_cuts=args.max_bool_power_cuts,
        max_bool_power_candidates=args.max_bool_power_candidates,
        max_assignments=args.max_assignments,
        replay_timeout_ms=args.replay_timeout_ms,
        expected_script_sha256=str(frozen["script_sha256"]),
        frozen_provenance=frozen,
    )
    result_path = run_dir / case.case_id / "result.json"
    result_attested = {**result, "result_file_sha256": file_sha256(result_path)}
    complete = result.get("complete") is True
    summary = {
        **invocation,
        "command": command,
        "elapsed_seconds": time.monotonic() - started,
        "counts": {str(result["status"]): 1},
        "complete": complete,
        "results": [result_attested],
    }
    v12.write_json(run_dir / "summary.json", summary)
    print(json.dumps({
        "counts": summary["counts"], "complete": complete, "run_dir": str(run_dir)
    }, sort_keys=True))
    return 0 if complete else 2


def main() -> int:
    args = parser().parse_args()
    if args.command == "smoke":
        args.workers = 1
        return run_one(args, Case("paired", "SSS", 0, 1, None), "smoke")
    if args.command == "case":
        args.workers = 1
        return run_one(
            args,
            Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh),
            "case",
        )
    raise SystemExit("v19 permits only one-case or smoke runs; no broad matrix")


if __name__ == "__main__":
    raise SystemExit(main())
