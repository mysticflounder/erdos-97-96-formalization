"""Durable, observational runtime telemetry for the round-5 v34 worker.

The public :func:`installed` context manager temporarily instruments v19's
normalization/replay helpers and assignment journal.  It does not alter solver
inputs, tactic ordering, timeout/seed settings, normalization identities, or
the caller-owned journal payload.  Timings are attached to the hash-chained
``outcome`` record, so a recovered journal authenticates them together with the
solver outcome.
"""

from __future__ import annotations

import hashlib
import time
from collections.abc import Iterator, Mapping, Sequence
from contextlib import contextmanager
from contextvars import ContextVar
from pathlib import Path
from typing import Any

import z3

import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v19 as v19

TELEMETRY_SCHEMA_VERSION = 1
TELEMETRY_SCHEMA = {
    "scheme": "round5-v34-assignment-runtime-telemetry/v1",
    "clock": "time.monotonic",
    "durations": "nonnegative seconds",
    "scope": "proposal append start through outcome append preparation",
    "identity_effect": "observational; excluded from normalization identity",
}

_assignment_state: ContextVar[dict[str, Any] | None] = ContextVar(
    "round5_v34_assignment_telemetry", default=None
)
_normalization_event: ContextVar[dict[str, Any] | None] = ContextVar(
    "round5_v34_normalization_event", default=None
)


def file_sha256(path: Path) -> str:
    return v19.file_sha256(path)


def telemetry_source_sha256() -> str:
    """Hash every executable helper in this standalone telemetry module."""
    return hashlib.sha256(Path(__file__).read_bytes()).hexdigest()


def _seconds(started: float) -> float:
    return max(0.0, time.monotonic() - started)


def _time_call(function: Any, *args: Any, **kwargs: Any) -> tuple[Any, float]:
    started = time.monotonic()
    result = function(*args, **kwargs)
    return result, _seconds(started)


def _phase_total(phases: Mapping[str, object]) -> float:
    return sum(float(value) for value in phases.values())


def _reconciled(total: float, phases: Mapping[str, object]) -> dict[str, object]:
    measured = _phase_total(phases)
    return {
        "total_seconds": max(0.0, total),
        "measured_phase_seconds": max(0.0, measured),
        "unattributed_seconds": max(0.0, total - measured),
    }


def _timed_fixed_normalized_formula(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[v19.Fix],
    frozen_full_formula_sha256: str,
) -> tuple[tuple[z3.BoolRef, ...], tuple[z3.BoolRef, ...], dict[str, object]]:
    """Execute v19's normalizer verbatim, with non-overlapping phase clocks."""
    total_started = time.monotonic()
    phases: dict[str, float] = {}
    event = _normalization_event.get()

    try:
        trackers, phases["tracker_scan_seconds"] = _time_call(
            v17._tracker_refs, frozen_assertions
        )
        tracker_names = {str(tracker) for tracker in trackers}
        if tracker_names != v17.TRACKER_ALLOWLIST:
            raise RuntimeError(
                "frozen formula tracker allowlist mismatch: "
                f"missing={sorted(v17.TRACKER_ALLOWLIST - tracker_names)}, "
                f"extra={sorted(tracker_names - v17.TRACKER_ALLOWLIST)}"
            )

        started = time.monotonic()
        raw_pb_count = sum(
            node.decl().kind() in v17.PB_KINDS
            for node in v16._walk(frozen_assertions)
            if not z3.is_quantifier(node)
        )
        phases["raw_pb_inventory_seconds"] = _seconds(started)
        is_round5_universe = len(fixes) == 825 and any(
            str(fix.variable).startswith("block_") for fix in fixes
        )
        if is_round5_universe and raw_pb_count != 4_768:
            raise RuntimeError(
                f"frozen raw PB inventory changed: expected 4768, got {raw_pb_count}"
            )

        started = time.monotonic()
        tracker_ids = {tracker.get_id() for tracker in trackers}
        ctx = frozen_assertions[0].ctx if frozen_assertions else z3.main_ctx()
        substitutions = (
            tuple((fix.variable, z3.BoolVal(fix.value, ctx=ctx)) for fix in fixes)
            + tuple((tracker, z3.BoolVal(True, ctx=ctx)) for tracker in trackers)
        )
        source = [
            assertion
            for assertion in frozen_assertions
            if assertion.get_id() not in tracker_ids
        ]
        phases["substitution_setup_seconds"] = _seconds(started)

        started = time.monotonic()
        simplified = [
            z3.simplify(z3.substitute(assertion, *substitutions))
            for assertion in source
        ]
        phases["substitute_simplify_seconds"] = _seconds(started)

        started = time.monotonic()
        pb_nodes = [
            node
            for node in v16._walk(simplified)
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
        phases["pre_normalization_pb_audit_seconds"] = _seconds(started)

        combined, phases["formula_conjunction_seconds"] = _time_call(
            z3.And, *simplified
        )
        rewritten, phases["weighted_pb_rewrite_seconds"] = _time_call(
            v17.rewrite_weighted_pbs, combined
        )

        started = time.monotonic()
        goal = z3.Goal(ctx=ctx)
        goal.add(rewritten)
        transformed = z3.Tactic("card2bv", ctx=ctx)(goal)
        phases["card2bv_seconds"] = _seconds(started)
        if len(transformed) != 1:
            raise RuntimeError(f"card2bv produced {len(transformed)} subgoals")
        normalized = tuple(transformed[0])

        audit, phases["logic_audit_seconds"] = _time_call(
            v17.logic_audit, normalized
        )
        if audit["accepted"] is not True:
            raise RuntimeError(f"post-normalization logic audit rejected formula: {audit}")

        started = time.monotonic()
        assignment_sha = v19.canonical_sha256(v19._assignment_record(fixes))
        identity = v19._normalization_identity(
            frozen_full_formula_sha256=frozen_full_formula_sha256,
            assignment_sha256=assignment_sha,
            source_assertion_count=len(source),
            normalized_assertion_count=len(normalized),
            tracker_count=len(trackers),
            frozen_raw_pb_nodes=raw_pb_count,
            pre_normalization_pb_nodes=before_pb,
        )
        phases["normalization_identity_seconds"] = _seconds(started)
    except BaseException:
        if event is not None:
            total = _seconds(total_started)
            event["normalization"] = {
                "status": "error",
                "phases": dict(phases),
                **_reconciled(total, phases),
            }
        raise

    total = _seconds(total_started)
    runtime = {
        "status": "complete",
        "phases": dict(phases),
        **_reconciled(total, phases),
    }
    if event is not None:
        event["normalization"] = runtime
    return normalized, trackers, {
        "elapsed_seconds": total,
        "source_assertion_count": len(source),
        "frozen_raw_pb_nodes": raw_pb_count,
        "normalized_assertion_count": len(normalized),
        "pre_normalization_pb_nodes": before_pb,
        "pre_normalization_pb_shapes": dict(sorted(pb_shapes.items())),
        "normalized_replay_identity": identity,
        "normalized_formula_sha256": None,
        "normalized_formula_serialized": False,
        "logic_audit": audit,
        "runtime_telemetry": runtime,
    }


def _timed_normalized_check(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[v19.Fix],
    timeout_ms: int,
    seed: int,
    frozen_full_formula_sha256: str,
) -> tuple[str, z3.ModelRef | None, dict[str, object]]:
    state = _assignment_state.get()
    check_index = len(state["checks"]) if state is not None else 0
    label = "primary" if check_index == 0 else "replay" if check_index == 1 else f"check_{check_index}"
    event: dict[str, Any] = {"label": label}
    token = _normalization_event.set(event)
    total_started = time.monotonic()
    try:
        normalized, trackers, normalization = v19._fixed_normalized_formula(
            frozen_assertions, fixes, frozen_full_formula_sha256
        )
        ctx = frozen_assertions[0].ctx if frozen_assertions else z3.main_ctx()

        started = time.monotonic()
        solver = z3.SolverFor("QF_LRA", ctx=ctx)
        solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
        solver.add(*normalized)
        event["solver_setup_seconds"] = _seconds(started)

        started = time.monotonic()
        outcome = solver.check()
        solver_elapsed = _seconds(started)
        event["solver_check_seconds"] = solver_elapsed

        started = time.monotonic()
        model = solver.model() if outcome == z3.sat else None
        if model is not None:
            for fix in fixes:
                model.update_value(
                    fix.variable.decl(), z3.BoolVal(fix.value, ctx=ctx)
                )
            for tracker in trackers:
                model.update_value(tracker.decl(), z3.BoolVal(True, ctx=ctx))
        event["model_patch_seconds"] = _seconds(started)

        record = {
            "status": str(outcome),
            "elapsed_seconds": solver_elapsed,
            "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
            "normalization": normalization,
            "tracker_assumption_count": len(trackers),
            "tracker_mode": "exact_allowlist_substituted_true",
            "tracker_core_status": "not_requested_after_assumption_lane_timed_out",
            "tracker_core": [],
            "tracker_core_sha256": v19.canonical_sha256([]),
        }
        return str(outcome), model, record
    finally:
        total = _seconds(total_started)
        normalization_total = float(
            event.get("normalization", {}).get("total_seconds", 0.0)
        )
        top_level = {
            "normalization_seconds": normalization_total,
            "solver_setup_seconds": float(event.get("solver_setup_seconds", 0.0)),
            "solver_check_seconds": float(event.get("solver_check_seconds", 0.0)),
            "model_patch_seconds": float(event.get("model_patch_seconds", 0.0)),
        }
        event.update(_reconciled(total, top_level))
        event["top_level_phases"] = top_level
        if state is not None:
            state["checks"].append(event)
        _normalization_event.reset(token)


def _timed_reconstruct_frozen(
    assertions: Sequence[z3.BoolRef],
    fixes: Sequence[v19.Fix],
    frozen_full_formula_sha256: str,
) -> tuple[tuple[z3.BoolRef, ...], tuple[v19.Fix, ...], dict[str, object]]:
    total_started = time.monotonic()
    phases: dict[str, float] = {}

    fresh_ctx, phases["context_create_seconds"] = _time_call(z3.Context)
    started = time.monotonic()
    reconstructed = tuple(assertion.translate(fresh_ctx) for assertion in assertions)
    phases["assertion_translate_seconds"] = _seconds(started)
    started = time.monotonic()
    reconstructed_fixes = tuple(
        v19.Fix(z3.Bool(str(fix.variable), ctx=fresh_ctx), fix.value) for fix in fixes
    )
    phases["fix_rebuild_seconds"] = _seconds(started)
    reconstructed_hash, phases["formula_hash_seconds"] = _time_call(
        v17.raw_formula_sha256, reconstructed
    )
    if frozen_full_formula_sha256 != reconstructed_hash:
        raise RuntimeError("fresh raw-formula reconstruction changed frozen formula hash")

    total = _seconds(total_started)
    runtime = {
        "label": "fresh_reconstruction",
        "phases": phases,
        **_reconciled(total, phases),
    }
    state = _assignment_state.get()
    if state is not None:
        state["reconstructions"].append(runtime)
    return reconstructed, reconstructed_fixes, {
        "source_assertions_sha256": frozen_full_formula_sha256,
        "reconstructed_assertions_sha256": reconstructed_hash,
        "runtime_telemetry": runtime,
    }


def _outcome_telemetry(state: dict[str, Any]) -> dict[str, object]:
    total = _seconds(float(state["started"]))
    checks = list(state["checks"])
    reconstructions = list(state["reconstructions"])
    top_level = {
        "proposed_journal_append_seconds": float(
            state.get("proposed_journal_append_seconds", 0.0)
        ),
        "normalized_checks_seconds": sum(
            float(check["total_seconds"]) for check in checks
        ),
        "reconstruction_seconds": sum(
            float(item["total_seconds"]) for item in reconstructions
        ),
    }
    return {
        "schema_version": TELEMETRY_SCHEMA_VERSION,
        "schema": TELEMETRY_SCHEMA,
        "checks": checks,
        "reconstructions": reconstructions,
        "top_level_phases": top_level,
        **_reconciled(total, top_level),
    }


@contextmanager
def installed() -> Iterator[None]:
    """Install v34 telemetry around one inherited solve and restore afterward."""
    # Cache the predecessor's executable normalizer identity before installing
    # the observational wrapper.  Both primary and replay still execute the
    # same normalization operations in the same order.
    v19.normalization_source_sha256()
    original_fixed = v19._fixed_normalized_formula
    original_check = v19._normalized_check
    original_reconstruct = v19._reconstruct_frozen
    journal_class = v19.AssignmentJournal
    original_append = journal_class.append

    def timed_append(journal: Any, payload: Mapping[str, object]) -> dict[str, object]:
        phase = payload.get("phase")
        if phase == "proposed":
            state: dict[str, Any] = {
                "started": time.monotonic(),
                "checks": [],
                "reconstructions": [],
            }
            _assignment_state.set(state)
            started = time.monotonic()
            result = original_append(journal, payload)
            state["proposed_journal_append_seconds"] = _seconds(started)
            return result
        if phase == "outcome":
            state = _assignment_state.get()
            if state is None:
                state = {
                    "started": time.monotonic(),
                    "checks": [],
                    "reconstructions": [],
                }
            augmented = dict(payload)
            augmented["runtime_telemetry"] = _outcome_telemetry(state)
            try:
                return original_append(journal, augmented)
            finally:
                _assignment_state.set(None)
        return original_append(journal, payload)

    v19._fixed_normalized_formula = _timed_fixed_normalized_formula
    v19._normalized_check = _timed_normalized_check
    v19._reconstruct_frozen = _timed_reconstruct_frozen
    journal_class.append = timed_append
    try:
        yield
    finally:
        journal_class.append = original_append
        v19._reconstruct_frozen = original_reconstruct
        v19._normalized_check = original_check
        v19._fixed_normalized_formula = original_fixed
        _assignment_state.set(None)
        _normalization_event.set(None)


install_runtime_telemetry = installed
