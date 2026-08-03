#!/usr/bin/env python3
"""Authenticated, resumable v19 exact-n15 retry-matrix orchestrator.

The 67-case universe is derived from the reviewed v8 -> v10 terminal chain in
``run_v17_retry_matrix``.  A resume source is accepted only as
``SUMMARY.json::SHA256``.  Its v17/v19 provenance, result, trace, frozen
formula, semantic-Bool universe, ordered blockers, cumulative hash, and replay
records are checked before any reconstructed blocker reaches v19's Boolean
master.

This driver is preflight-only unless ``matrix --launch`` is supplied.  It does
not turn external solver evidence into a Lean proof or a universal result.
"""

from __future__ import annotations

import argparse
import copy
import concurrent.futures
import fcntl
import hashlib
import json
import os
import shutil
import subprocess
import sys
import threading
import time
from collections import Counter
from collections.abc import Callable, Mapping, Sequence
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path

import z3

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v18 as v18
import round5_cegar_v19 as v19
import run_v17_retry_matrix as source_matrix


HERE = Path(__file__).resolve().parent
TARGET = v19.TARGET
MAX_WORKERS = 24
NICENESS_INCREMENT = 10
HEX_DIGITS = frozenset("0123456789abcdef")


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def file_sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def canonical_sha256(value: object) -> str:
    return v19.canonical_sha256(value)


def is_sha256(value: object) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in HEX_DIGITS for character in value)
    )


def require_sha256(value: object, label: str) -> str:
    if not is_sha256(value):
        raise RuntimeError(f"{label} is not a lowercase SHA-256 digest")
    return str(value)


def read_json(path: Path) -> dict[str, object]:
    value = json.loads(path.read_bytes())
    if not isinstance(value, dict):
        raise RuntimeError(f"expected JSON object in {path}")
    return value


def write_json_atomic(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()
    temporary = path.with_name(
        f".{path.name}.tmp-{os.getpid()}-{threading.get_ident()}"
    )
    with temporary.open("xb") as handle:
        handle.write(payload)
        handle.flush()
        os.fsync(handle.fileno())
    temporary.replace(path)


def _dict(value: object, label: str) -> dict[str, object]:
    if not isinstance(value, dict):
        raise RuntimeError(f"{label} must be a JSON object")
    return value


def _list(value: object, label: str) -> list[object]:
    if not isinstance(value, list):
        raise RuntimeError(f"{label} must be a JSON array")
    return value


@dataclass(frozen=True)
class ResumeSpec:
    summary: Path
    summary_sha256: str

    @classmethod
    def parse(cls, text: str) -> "ResumeSpec":
        try:
            raw_path, digest = text.rsplit("::", 1)
        except ValueError as exc:
            raise argparse.ArgumentTypeError(
                "resume source must be SUMMARY.json::SHA256"
            ) from exc
        if not raw_path or not is_sha256(digest):
            raise argparse.ArgumentTypeError(
                "resume source must end in a lowercase SHA-256 digest"
            )
        return cls(Path(raw_path).expanduser().resolve(), digest)

    def record(self) -> dict[str, str]:
        return {"summary": str(self.summary), "summary_sha256": self.summary_sha256}


@dataclass(frozen=True)
class ImportedBlocker:
    ordinal: int
    assignment: tuple[tuple[str, bool], ...]
    projected_core: tuple[tuple[str, bool], ...]
    blocker_sha256: str
    cumulative_blocker_sha256: str
    lane: str
    generalized: bool
    semantics: dict[str, object]
    source_iteration: dict[str, object]

    def fixes(self) -> tuple[v19.Fix, ...]:
        return tuple(v19.Fix(z3.Bool(name), value) for name, value in self.projected_core)

    def formula(self) -> z3.BoolRef:
        return v16.blocker_for_core(self.fixes())


@dataclass(frozen=True)
class PendingAssignment:
    """One journal-authenticated proposal whose outcome was never recorded."""

    iteration: int
    assignment: tuple[tuple[str, bool], ...]
    assignment_sha256: str
    frozen_full_formula_sha256: str
    source_case_id: str
    source_journal_head_sha256: str
    source_journal_record_count: int

    def record(self) -> dict[str, object]:
        return {
            "iteration": self.iteration,
            "assignment": _signed_record(self.assignment),
            "assignment_sha256": self.assignment_sha256,
            "frozen_full_formula_sha256": self.frozen_full_formula_sha256,
            "source_case_id": self.source_case_id,
            "source_journal_head_sha256": self.source_journal_head_sha256,
            "source_journal_record_count": self.source_journal_record_count,
        }

    def fixes(self) -> tuple[v19.Fix, ...]:
        return tuple(v19.Fix(z3.Bool(name), value) for name, value in self.assignment)


@dataclass(frozen=True)
class ValidatedJournal:
    path: Path
    record_count: int
    head_sha256: str | None
    completed_assignment_sha256: tuple[str, ...]
    completed_outcomes: tuple[dict[str, object], ...]
    pending_assignments: tuple[PendingAssignment, ...]

    def manifest(self) -> dict[str, object]:
        return {
            "directory": self.path.name,
            "record_count": self.record_count,
            "head_sha256": self.head_sha256,
            "completed_assignment_count": len(self.completed_assignment_sha256),
            "pending_assignment_count": len(self.pending_assignments),
            "completed_assignment_sha256": canonical_sha256(
                list(self.completed_assignment_sha256)
            ),
            "pending_assignment_sha256": canonical_sha256(
                [item.assignment_sha256 for item in self.pending_assignments]
            ),
        }


@dataclass(frozen=True)
class ValidatedResume:
    spec: ResumeSpec
    schema_version: int
    case: v8.Case
    invocation_sha256: str
    result_sha256: str
    trace_path: Path
    trace_sha256: str
    frozen_blob_path: Path
    frozen_blob_sha256: str
    full_frozen_formula_sha256: str
    semantic_bools: tuple[str, ...]
    semantic_bool_universe_sha256: str
    blockers: tuple[ImportedBlocker, ...]
    cumulative_blocker_sha256: str
    journal: ValidatedJournal | None = None
    pending_assignments: tuple[PendingAssignment, ...] = ()

    def manifest(self) -> dict[str, object]:
        return {
            **self.spec.record(),
            "schema_version": self.schema_version,
            "case_id": self.case.case_id,
            "case": asdict(self.case),
            "invocation_sha256": self.invocation_sha256,
            "result_sha256": self.result_sha256,
            "trace": str(self.trace_path),
            "trace_sha256": self.trace_sha256,
            "frozen_blob": str(self.frozen_blob_path),
            "frozen_blob_sha256": self.frozen_blob_sha256,
            "full_frozen_formula_sha256": self.full_frozen_formula_sha256,
            "semantic_bool_count": len(self.semantic_bools),
            "semantic_bool_universe_sha256": self.semantic_bool_universe_sha256,
            "blocker_count": len(self.blockers),
            "ordered_blocker_sha256": [item.blocker_sha256 for item in self.blockers],
            "cumulative_blocker_sha256": self.cumulative_blocker_sha256,
            "blocker_semantics_sha256": canonical_sha256(
                [item.semantics for item in self.blockers]
            ),
            "assignment_journal": self.journal.manifest() if self.journal else None,
            "pending_assignment_count": len(self.pending_assignments),
            "pending_assignments": [
                item.record() for item in self.pending_assignments
            ],
            "pending_assignments_sha256": canonical_sha256(
                [item.record() for item in self.pending_assignments]
            ),
        }


@dataclass(frozen=True)
class Budgets:
    timeout_ms: int = 600_000
    bool_timeout_ms: int = 30_000
    max_assignments: int = 100_000
    replay_timeout_ms: int = 30_000
    max_power_cuts: int = 256
    max_power_candidates: int = 2_000_000
    max_bool_power_cuts: int = 256
    max_bool_power_candidates: int = 2_000_000

    def validate(self) -> None:
        if any(value <= 0 for value in asdict(self).values()):
            raise ValueError("all v19 budgets must be positive")


@dataclass(frozen=True)
class FrozenInputs:
    file_hashes: dict[str, str]
    v19_provenance: dict[str, object]
    source_case_entry_sha256: tuple[str, ...]
    resume_manifest_sha256: dict[str, str]


@dataclass(frozen=True)
class ChildSpec:
    ordinal: int
    selected: source_matrix.SelectedCase
    child_artifacts: Path
    resume: ValidatedResume | None
    command: tuple[str, ...]


@dataclass(frozen=True)
class ChildExecution:
    exit_code: int
    elapsed_seconds: float
    stdout_path: Path
    stderr_path: Path


ChildRunner = Callable[[ChildSpec], ChildExecution]


def load_authenticated_case_selection(
    chain: source_matrix.SourceChain = source_matrix.SourceChain(),
) -> tuple[source_matrix.SelectedCase, ...]:
    """Return the ordered v8 UNKNOWN set with hashes of the actual entries.

    ``run_v17_retry_matrix.load_case_selection`` performs the source-chain and
    case-order authentication.  Its v8 entry-hash projection indexes the
    unfiltered 68-entry result array, however, so every entry after the sole
    v8 UNSAT can receive its predecessor's hash.  Reconstruct the projection
    from the authenticated filtered UNKNOWN array and independently require
    the v10 order again.  The upstream file is intentionally left untouched:
    this continuation driver owns and freezes its corrected projection.
    """
    inherited = source_matrix.load_case_selection(chain)
    v8_summary = source_matrix.read_json_hashed(
        chain.v8_summary, chain.v8_summary_sha256
    )
    v10_summary = source_matrix.read_json_hashed(
        chain.v10_summary, chain.v10_summary_sha256
    )
    v8_results = source_matrix._validate_terminal_summary(
        v8_summary, case_count=68, statuses={"unknown": 67, "unsat": 1}
    )
    v10_results = source_matrix._validate_terminal_summary(
        v10_summary, case_count=67, statuses={"unknown": 67}
    )
    unresolved_v8 = tuple(
        item for item in v8_results if item.get("status") == "unknown"
    )
    inherited_ids = tuple(item.case.case_id for item in inherited)
    v8_ids = tuple(str(item.get("case_id")) for item in unresolved_v8)
    v10_ids = tuple(str(item.get("case_id")) for item in v10_results)
    if len(inherited) != 67 or inherited_ids != v8_ids or v8_ids != v10_ids:
        raise RuntimeError("authenticated v8/v10 unresolved case projection changed")
    return tuple(
        source_matrix.SelectedCase(
            source_index=item.source_index,
            case=item.case,
            v8_result_entry_sha256=canonical_sha256(unresolved_v8[index]),
            v10_result_entry_sha256=canonical_sha256(v10_results[index]),
        )
        for index, item in enumerate(inherited)
    )


def _provenance_for_version(version: int) -> dict[str, object]:
    if version == 17:
        return v17.provenance()
    if version == 19:
        return v19.provenance()
    raise RuntimeError(f"only v17/v19 traces may be resumed, got schema {version}")


def _check_provenance(
    record: Mapping[str, object], expected: Mapping[str, object], label: str
) -> None:
    mismatches = sorted(key for key, value in expected.items() if record.get(key) != value)
    if mismatches:
        raise RuntimeError(f"{label} provenance mismatch: {mismatches}")


def _signed_map(value: object, label: str) -> tuple[tuple[str, bool], ...]:
    items = _list(value, label)
    parsed: list[tuple[str, bool]] = []
    for index, raw in enumerate(items):
        item = _dict(raw, f"{label}[{index}]")
        if set(item) != {"bool", "value"}:
            raise RuntimeError(f"{label}[{index}] must contain exactly bool/value")
        name, bit = item["bool"], item["value"]
        if not isinstance(name, str) or not name or not isinstance(bit, bool):
            raise RuntimeError(f"{label}[{index}] has an invalid signed literal")
        parsed.append((name, bit))
    if len({name for name, _ in parsed}) != len(parsed):
        raise RuntimeError(f"{label} contains duplicate Bool names")
    return tuple(parsed)


def _signed_record(items: Sequence[tuple[str, bool]]) -> list[dict[str, object]]:
    return [{"bool": name, "value": value} for name, value in items]


def _reconstructed_blocker(core: Sequence[tuple[str, bool]]) -> z3.BoolRef:
    fixes = tuple(v19.Fix(z3.Bool(name), value) for name, value in core)
    return v16.blocker_for_core(fixes)


def _prove_blocker_semantics(
    assignment: Sequence[tuple[str, bool]],
    core: Sequence[tuple[str, bool]],
    universe: Sequence[str],
) -> dict[str, object]:
    assignment_map = dict(assignment)
    core_map = dict(core)
    if tuple(name for name, _ in assignment) != tuple(universe):
        raise RuntimeError("recorded assignment is not the ordered semantic-Bool universe")
    if any(name not in assignment_map for name in core_map):
        raise RuntimeError("projected core contains a non-semantic Bool")
    if any(assignment_map[name] is not value for name, value in core):
        raise RuntimeError("recorded assignment does not extend its projected core")

    # The reconstructed clause is Or(name != recorded_core_value).  Therefore
    # it is false precisely on assignments extending the core.  These finite
    # checks make the recorded assignment and every one-literal boundary loud.
    falsified = not any(assignment_map[name] is not value for name, value in core)
    flip_boundary = all(
        any(
            ((not value) if candidate == name else assignment_map[candidate])
            is not expected
            for candidate, expected in core
        )
        for name, value in core
    )
    if not falsified or not flip_boundary:
        raise RuntimeError("reconstructed blocker semantics check failed")
    complete = set(core_map) == set(universe)
    return {
        "clause_form": "Or(bool != recorded_core_value)",
        "falsified_by_recorded_assignment": True,
        "every_single_core_literal_flip_satisfies": True,
        "falsifying_set": (
            "exact_recorded_complete_assignment"
            if complete
            else "exact_extensions_of_recorded_projected_core"
        ),
        "projected_core_size": len(core),
        "semantic_bool_count": len(universe),
        "projected_core_sha256": canonical_sha256(_signed_record(core)),
        "assignment_sha256": canonical_sha256(_signed_record(assignment)),
    }


def _validate_qf_lra_record(
    record: Mapping[str, object],
    label: str,
    *,
    expected_full_formula_sha256: str,
    expected_assignment_sha256: str,
) -> dict[str, object] | None:
    if record.get("status") != "unsat":
        raise RuntimeError(f"{label} did not record UNSAT")
    normalization = _dict(record.get("normalization"), f"{label}.normalization")
    audit = _dict(normalization.get("logic_audit"), f"{label}.logic_audit")
    if audit.get("accepted") is not True or audit.get("classification") != "QF_LRA":
        raise RuntimeError(f"{label} lacks an accepted QF_LRA audit")
    normalized_hash = normalization.get("normalized_formula_sha256")
    if is_sha256(normalized_hash):
        # v17 serialized the normalized QF_LRA assertion sequence.
        return None
    if normalized_hash is not None:
        raise RuntimeError(f"{label}.normalized is neither v17 nor v19")
    if normalization.get("normalized_formula_serialized") is not False:
        raise RuntimeError(f"{label} does not attest nonserialized v19 normalization")
    identity = _dict(
        normalization.get("normalized_replay_identity"),
        f"{label}.normalized_replay_identity",
    )
    if set(identity) != {"kind", "is_raw_formula_sha256", "components", "sha256"}:
        raise RuntimeError(f"{label} compositional identity has unexpected fields")
    if identity.get("kind") != "compositional_normalized_replay_identity":
        raise RuntimeError(f"{label} compositional identity kind mismatch")
    components = _dict(identity.get("components"), f"{label}.identity.components")
    expected_keys = {
        "scheme", "frozen_full_formula_sha256", "complete_assignment_sha256",
        "normalization_spec_sha256", "normalization_source_sha256",
        "source_assertion_count", "normalized_assertion_count", "tracker_count",
        "frozen_raw_pb_nodes", "pre_normalization_pb_nodes",
    }
    if set(components) != expected_keys:
        raise RuntimeError(f"{label} compositional identity component set mismatch")
    if components.get("scheme") != "round5-v19-compositional-normalized-replay/v1":
        raise RuntimeError(f"{label} compositional identity scheme mismatch")
    if components.get("frozen_full_formula_sha256") != expected_full_formula_sha256:
        raise RuntimeError(f"{label} compositional identity formula mismatch")
    if components.get("complete_assignment_sha256") != expected_assignment_sha256:
        raise RuntimeError(f"{label} compositional identity assignment mismatch")
    if components.get("normalization_spec_sha256") != canonical_sha256(v19.NORMALIZATION_SPEC):
        raise RuntimeError(f"{label} normalization specification mismatch")
    if components.get("normalization_source_sha256") != v19.normalization_source_sha256():
        raise RuntimeError(f"{label} normalization source mismatch")
    for key in (
        "source_assertion_count", "normalized_assertion_count", "tracker_count",
        "frozen_raw_pb_nodes", "pre_normalization_pb_nodes",
    ):
        value = components.get(key)
        if isinstance(value, bool) or not isinstance(value, int) or value < 0:
            raise RuntimeError(f"{label} compositional count {key} is invalid")
    v19.validate_normalization_identity(identity, identity)
    return identity


def validate_trace_object(
    trace: Mapping[str, object], *, expected_case_id: str | None = None
) -> tuple[tuple[str, ...], str, tuple[ImportedBlocker, ...], str]:
    case_id = trace.get("case_id")
    if not isinstance(case_id, str) or (expected_case_id is not None and case_id != expected_case_id):
        raise RuntimeError("trace case identifier mismatch")
    universe_raw = _list(trace.get("semantic_bools"), "trace.semantic_bools")
    if not all(isinstance(name, str) and name for name in universe_raw):
        raise RuntimeError("trace semantic-Bool universe is malformed")
    universe = tuple(str(name) for name in universe_raw)
    if universe != tuple(sorted(universe)) or len(set(universe)) != len(universe):
        raise RuntimeError("trace semantic-Bool universe must be sorted and unique")
    if trace.get("semantic_bool_count") != len(universe):
        raise RuntimeError("trace semantic-Bool count mismatch")
    universe_hash = canonical_sha256(list(universe))
    full_hash = require_sha256(
        trace.get("full_frozen_formula_sha256"), "trace full frozen formula"
    )
    require_sha256(trace.get("initial_master_formula_sha256"), "trace initial master")
    require_sha256(trace.get("final_master_formula_sha256"), "trace final master")
    iterations = _list(trace.get("iterations"), "trace.iterations")
    blocker_hashes: list[str] = []
    blockers: list[ImportedBlocker] = []

    for ordinal, raw in enumerate(iterations):
        entry = _dict(raw, f"trace.iterations[{ordinal}]")
        if entry.get("iteration") != ordinal:
            raise RuntimeError("trace iteration order is not contiguous from zero")
        assignment = _signed_map(entry.get("assignment"), f"iteration {ordinal} assignment")
        if canonical_sha256(_signed_record(assignment)) != entry.get("assignment_sha256"):
            raise RuntimeError(f"iteration {ordinal} assignment hash mismatch")
        if entry.get("semantic_bool_count") != len(universe):
            raise RuntimeError(f"iteration {ordinal} semantic-Bool count mismatch")
        if tuple(name for name, _ in assignment) != universe:
            raise RuntimeError(f"iteration {ordinal} assignment universe/order mismatch")
        require_sha256(entry.get("master_formula_sha256_before"), "master before")
        check = _dict(entry.get("full_check"), f"iteration {ordinal} full_check")
        if check.get("status") != "unsat":
            if ordinal != len(iterations) - 1 or check.get("status") not in {"sat", "unknown"}:
                raise RuntimeError(
                    f"iteration {ordinal} is neither an authenticated blocker nor a final terminal check"
                )
            forbidden = {
                "projected_core", "projected_core_sha256", "blocker",
                "blocker_sha256", "master_formula_sha256_after",
                "cumulative_blocker_sha256",
            }
            if forbidden.intersection(entry):
                raise RuntimeError(f"terminal iteration {ordinal} contains blocker fields")
            continue

        core = _signed_map(entry.get("projected_core"), f"iteration {ordinal} core")
        core_record = _signed_record(core)
        if canonical_sha256(core_record) != entry.get("projected_core_sha256"):
            raise RuntimeError(f"iteration {ordinal} projected-core hash mismatch")
        semantics = _prove_blocker_semantics(assignment, core, universe)

        blocker = _reconstructed_blocker(core)
        blocker_sexpr = blocker.sexpr()
        blocker_hash = sha256_bytes(blocker_sexpr.encode())
        if entry.get("blocker") != blocker_sexpr:
            raise RuntimeError(f"iteration {ordinal} stored SMT differs from reconstruction")
        if entry.get("blocker_sha256") != blocker_hash:
            raise RuntimeError(f"iteration {ordinal} blocker hash mismatch")
        blocker_hashes.append(blocker_hash)
        cumulative = canonical_sha256(blocker_hashes)
        if entry.get("cumulative_blocker_sha256") != cumulative:
            raise RuntimeError(f"iteration {ordinal} cumulative blocker hash mismatch")
        require_sha256(entry.get("master_formula_sha256_after"), "master after")

        lane = check.get("lane")
        if check.get("status") != "unsat" or lane not in {
            "equality_closure_raw_replay", "fixed_assignment_qf_lra"
        }:
            raise RuntimeError(f"iteration {ordinal} is not a replay-authenticated UNSAT lane")
        generalized = lane == "equality_closure_raw_replay"
        if check.get("generalized") is not generalized:
            raise RuntimeError(f"iteration {ordinal} generalized flag mismatch")
        if check.get("assignment_sha256") != entry.get("assignment_sha256"):
            raise RuntimeError(f"iteration {ordinal} full-check assignment mismatch")

        if generalized:
            if check.get("projected_core_size") != len(core):
                raise RuntimeError(f"iteration {ordinal} replay core-size mismatch")
            replay = _dict(check.get("replay"), f"iteration {ordinal} replay")
            if replay.get("status") != "unsat":
                raise RuntimeError(f"iteration {ordinal} raw replay is not UNSAT")
            replay_core = _signed_map(replay.get("core"), f"iteration {ordinal} replay core")
            if replay_core != core or replay.get("core_sha256") != canonical_sha256(core_record):
                raise RuntimeError(f"iteration {ordinal} raw replay core mismatch")
            if replay.get("frozen_full_formula_sha256") != full_hash:
                raise RuntimeError(f"iteration {ordinal} raw replay formula mismatch")
            require_sha256(replay.get("replay_formula_sha256"), "raw replay formula")
        else:
            if check.get("blocker_scope") != "complete_semantic_assignment":
                raise RuntimeError(f"iteration {ordinal} fixed blocker scope mismatch")
            if len(core) != len(universe) or dict(core) != dict(assignment):
                raise RuntimeError(f"iteration {ordinal} fixed blocker is not complete")
            if check.get("semantic_bool_universe_sha256") != universe_hash:
                raise RuntimeError(f"iteration {ordinal} semantic universe hash mismatch")
            if check.get("expected_complete_blocker_sha256") != blocker_hash:
                raise RuntimeError(f"iteration {ordinal} expected blocker hash mismatch")
            if check.get("frozen_full_formula_sha256") != full_hash:
                raise RuntimeError(f"iteration {ordinal} fixed formula hash mismatch")
            primary = _dict(check.get("primary"), f"iteration {ordinal} primary")
            replay = _dict(
                check.get("fresh_normalized_full_replay"),
                f"iteration {ordinal} fresh normalized replay",
            )
            primary_identity = _validate_qf_lra_record(
                primary,
                f"iteration {ordinal} primary",
                expected_full_formula_sha256=full_hash,
                expected_assignment_sha256=str(entry.get("assignment_sha256")),
            )
            replay_identity = _validate_qf_lra_record(
                replay,
                f"iteration {ordinal} fresh replay",
                expected_full_formula_sha256=full_hash,
                expected_assignment_sha256=str(entry.get("assignment_sha256")),
            )
            if (primary_identity is None) != (replay_identity is None):
                raise RuntimeError(f"iteration {ordinal} mixed v17/v19 replay identities")
            if primary_identity is not None and replay_identity is not None:
                v19.validate_normalization_identity(primary_identity, replay_identity)
            replay_audit = _dict(replay.get("qf_lra_audit"), "fresh replay audit")
            if replay_audit.get("accepted") is not True or replay_audit.get("classification") != "QF_LRA":
                raise RuntimeError(f"iteration {ordinal} fresh replay audit mismatch")
            if replay.get("replay_status") != "unsat":
                raise RuntimeError(f"iteration {ordinal} fresh replay status mismatch")
            if replay.get("raw_formula_sha256") != full_hash:
                raise RuntimeError(f"iteration {ordinal} fresh replay raw formula mismatch")
            if replay.get("semantic_bool_universe_sha256") != universe_hash:
                raise RuntimeError(f"iteration {ordinal} fresh replay universe mismatch")
            if replay.get("assignment_sha256") != entry.get("assignment_sha256"):
                raise RuntimeError(f"iteration {ordinal} fresh replay assignment mismatch")
            if replay.get("complete_blocker_sha256") != blocker_hash:
                raise RuntimeError(f"iteration {ordinal} fresh replay blocker mismatch")
            if replay.get("complete_assignment_size") != len(universe):
                raise RuntimeError(f"iteration {ordinal} fresh replay size mismatch")
            source_assertions = require_sha256(
                replay.get("source_assertions_sha256"), "fresh replay source assertions"
            )
            if replay.get("reconstructed_assertions_sha256") != source_assertions:
                raise RuntimeError(f"iteration {ordinal} fresh reconstruction mismatch")

        blockers.append(ImportedBlocker(
            ordinal=ordinal,
            assignment=assignment,
            projected_core=core,
            blocker_sha256=blocker_hash,
            cumulative_blocker_sha256=cumulative,
            lane=str(lane),
            generalized=generalized,
            semantics=semantics,
            source_iteration=entry,
        ))

    cumulative = canonical_sha256(blocker_hashes)
    if trace.get("blocker_count") != len(blockers):
        raise RuntimeError("trace blocker count mismatch")
    if trace.get("cumulative_blocker_sha256") != cumulative:
        raise RuntimeError("trace terminal cumulative blocker hash mismatch")
    return universe, full_hash, tuple(blockers), cumulative


def _parse_pending_assignment(
    raw: object,
    *,
    label: str,
    case_id: str,
    universe: Sequence[str],
    full_hash: str,
) -> PendingAssignment:
    record = _dict(raw, label)
    expected = {
        "iteration", "assignment", "assignment_sha256",
        "frozen_full_formula_sha256", "source_case_id",
        "source_journal_head_sha256", "source_journal_record_count",
    }
    if set(record) != expected:
        raise RuntimeError(f"{label} has unexpected fields")
    iteration = record.get("iteration")
    count = record.get("source_journal_record_count")
    if isinstance(iteration, bool) or not isinstance(iteration, int) or iteration < 0:
        raise RuntimeError(f"{label} iteration is invalid")
    if isinstance(count, bool) or not isinstance(count, int) or count <= 0:
        raise RuntimeError(f"{label} journal record count is invalid")
    assignment = _signed_map(record.get("assignment"), f"{label}.assignment")
    if assignment != tuple((name, dict(assignment)[name]) for name in universe):
        raise RuntimeError(f"{label} is not a complete ordered semantic assignment")
    assignment_hash = require_sha256(
        record.get("assignment_sha256"), f"{label}.assignment_sha256"
    )
    if assignment_hash != canonical_sha256(_signed_record(assignment)):
        raise RuntimeError(f"{label} assignment hash mismatch")
    if record.get("frozen_full_formula_sha256") != full_hash:
        raise RuntimeError(f"{label} frozen formula mismatch")
    if record.get("source_case_id") != case_id:
        raise RuntimeError(f"{label} source case mismatch")
    head = require_sha256(
        record.get("source_journal_head_sha256"),
        f"{label}.source_journal_head_sha256",
    )
    return PendingAssignment(
        iteration=iteration,
        assignment=assignment,
        assignment_sha256=assignment_hash,
        frozen_full_formula_sha256=full_hash,
        source_case_id=case_id,
        source_journal_head_sha256=head,
        source_journal_record_count=count,
    )


def _trace_pending_assignments(
    trace: Mapping[str, object],
    *,
    case_id: str,
    universe: Sequence[str],
    full_hash: str,
) -> tuple[PendingAssignment, ...]:
    fields = {
        "pending_assignment_count", "pending_assignments",
        "pending_assignments_sha256",
    }
    present = fields & set(trace)
    if not present:
        return ()
    if present != fields:
        raise RuntimeError("trace has a partial pending-assignment manifest")
    raw_items = _list(trace.get("pending_assignments"), "trace.pending_assignments")
    items = tuple(
        _parse_pending_assignment(
            raw, label=f"trace.pending_assignments[{index}]", case_id=case_id,
            universe=universe, full_hash=full_hash,
        )
        for index, raw in enumerate(raw_items)
    )
    if trace.get("pending_assignment_count") != len(items):
        raise RuntimeError("trace pending-assignment count mismatch")
    if trace.get("pending_assignments_sha256") != canonical_sha256(
        [item.record() for item in items]
    ):
        raise RuntimeError("trace pending-assignment manifest hash mismatch")
    if len({item.assignment_sha256 for item in items}) != len(items):
        raise RuntimeError("trace contains duplicate pending assignments")
    return items


def validate_assignment_journal(
    journal_path: Path,
    recorded_summary: Mapping[str, object],
    *,
    case_id: str,
    universe: Sequence[str],
    full_hash: str,
    incremental_trace: Mapping[str, object],
) -> ValidatedJournal:
    """Validate the v19 chain and bind every completed record to its trace."""
    paths = sorted(journal_path.glob("[0-9][0-9][0-9][0-9][0-9][0-9].json"))
    for index, path in enumerate(paths):
        if path.name != f"{index:06d}.json":
            raise RuntimeError(f"assignment journal filename gap at {path.name}")
    recovered = v19.AssignmentJournal(journal_path).recover()
    records = _list(recovered.get("records"), "assignment journal records")
    if len(records) != len(paths):
        raise RuntimeError("assignment journal path/recovery count mismatch")

    proposals: dict[str, tuple[int, tuple[tuple[str, bool], ...]]] = {}
    completed: list[dict[str, object]] = []
    proposal_count = 0
    active_assignment_sha256: str | None = None
    for sequence, raw in enumerate(records):
        record = _dict(raw, f"assignment journal record {sequence}")
        if set(record) != {
            "sequence", "previous_record_sha256", "payload",
            "payload_sha256", "record_sha256",
        }:
            raise RuntimeError("assignment journal record has unexpected fields")
        payload = _dict(record.get("payload"), f"assignment journal payload {sequence}")
        phase = payload.get("phase")
        if phase == "proposed":
            if active_assignment_sha256 is not None:
                raise RuntimeError("journal contains overlapping proposals")
            if set(payload) != {
                "phase", "iteration", "assignment", "assignment_sha256",
                "frozen_full_formula_sha256",
            }:
                raise RuntimeError("journal proposed payload has unexpected fields")
            iteration = payload.get("iteration")
            if iteration != proposal_count:
                raise RuntimeError("journal proposal iterations are not contiguous")
            proposal_count += 1
            assignment = _signed_map(
                payload.get("assignment"), f"journal proposal {iteration}.assignment"
            )
            if assignment != tuple((name, dict(assignment)[name]) for name in universe):
                raise RuntimeError("journal proposal is not a complete ordered assignment")
            assignment_hash = require_sha256(
                payload.get("assignment_sha256"), "journal proposal assignment"
            )
            if assignment_hash != canonical_sha256(_signed_record(assignment)):
                raise RuntimeError("journal proposal assignment hash mismatch")
            if payload.get("frozen_full_formula_sha256") != full_hash:
                raise RuntimeError("journal proposal frozen-formula mismatch")
            if assignment_hash in proposals:
                raise RuntimeError("journal repeats a completed assignment proposal")
            proposals[assignment_hash] = (int(iteration), assignment)
            active_assignment_sha256 = assignment_hash
            continue

        if phase != "outcome":
            raise RuntimeError("journal payload has an unknown phase")
        status = payload.get("status")
        if status not in {"unsat", "sat", "unknown", "error"}:
            raise RuntimeError("journal outcome status is invalid")
        assignment_hash = require_sha256(
            payload.get("assignment_sha256"), "journal outcome assignment"
        )
        if assignment_hash != active_assignment_sha256:
            raise RuntimeError("journal outcome is not paired with the active proposal")
        proposal = proposals.get(assignment_hash)
        if proposal is None or payload.get("iteration") != proposal[0]:
            raise RuntimeError("journal outcome does not match its proposal iteration")
        if status == "error":
            if set(payload) != {
                "phase", "iteration", "assignment_sha256", "status", "error", "blocker"
            } or not isinstance(payload.get("error"), str):
                raise RuntimeError("journal error outcome is malformed")
        else:
            if set(payload) != {
                "phase", "iteration", "assignment_sha256", "status",
                "full_check_sha256", "blocker",
            }:
                raise RuntimeError("journal solver outcome has unexpected fields")
            require_sha256(payload.get("full_check_sha256"), "journal full check")
        blocker_raw = payload.get("blocker")
        if status == "unsat":
            blocker = _dict(blocker_raw, "journal UNSAT blocker")
            if set(blocker) != {
                "projected_core", "projected_core_sha256", "blocker", "blocker_sha256"
            }:
                raise RuntimeError("journal UNSAT blocker has unexpected fields")
            core = _signed_map(blocker.get("projected_core"), "journal projected core")
            if not core or not set(core).issubset(set(proposal[1])):
                raise RuntimeError("journal projected core is outside the assignment")
            if blocker.get("projected_core_sha256") != canonical_sha256(_signed_record(core)):
                raise RuntimeError("journal projected-core hash mismatch")
            reconstructed = _reconstructed_blocker(core).sexpr()
            if blocker.get("blocker") != reconstructed:
                raise RuntimeError("journal blocker reconstruction mismatch")
            if blocker.get("blocker_sha256") != sha256_bytes(reconstructed.encode()):
                raise RuntimeError("journal blocker hash mismatch")
            _prove_blocker_semantics(proposal[1], core, universe)
        elif blocker_raw is not None:
            raise RuntimeError("non-UNSAT journal outcome carries a blocker")
        completed.append(dict(payload))
        active_assignment_sha256 = None

    pending_raw = _list(recovered.get("pending"), "assignment journal pending")
    if len(pending_raw) > 1:
        raise RuntimeError("v19 journal contains more than one pending assignment")
    head = recovered.get("head_sha256")
    if paths:
        head_hash = require_sha256(head, "assignment journal head")
    elif head is None:
        head_hash = None
    else:
        raise RuntimeError("empty assignment journal has a nonempty head")
    pending: tuple[PendingAssignment, ...] = ()
    if pending_raw:
        payload = _dict(pending_raw[0], "assignment journal pending payload")
        assignment_hash = require_sha256(
            payload.get("assignment_sha256"), "pending assignment identity"
        )
        proposal = proposals.get(assignment_hash)
        if proposal is None or head_hash is None:
            raise RuntimeError("pending journal assignment lacks its proposal")
        if not records or _dict(records[-1], "last journal record").get("payload") != payload:
            raise RuntimeError("pending assignment is not the journal tail")
        pending = (PendingAssignment(
            iteration=proposal[0], assignment=proposal[1],
            assignment_sha256=assignment_hash,
            frozen_full_formula_sha256=full_hash, source_case_id=case_id,
            source_journal_head_sha256=head_hash,
            source_journal_record_count=len(records),
        ),)

    validated = ValidatedJournal(
        path=journal_path,
        record_count=len(records),
        head_sha256=head_hash,
        completed_assignment_sha256=tuple(
            str(item["assignment_sha256"]) for item in completed
        ),
        completed_outcomes=tuple(completed),
        pending_assignments=pending,
    )
    if dict(recorded_summary) != validated.manifest():
        raise RuntimeError("result assignment-journal summary mismatch")

    trace_iterations = _list(
        incremental_trace.get("iterations"), "incremental trace iterations"
    )
    if len(trace_iterations) != len(completed):
        raise RuntimeError("journal completed outcomes do not match incremental trace length")
    for index, (raw_entry, outcome) in enumerate(zip(trace_iterations, completed)):
        entry = _dict(raw_entry, f"incremental trace iteration {index}")
        check = _dict(entry.get("full_check"), f"incremental full check {index}")
        if entry.get("assignment_sha256") != outcome.get("assignment_sha256"):
            raise RuntimeError("journal/trace assignment identity mismatch")
        if check.get("status") != outcome.get("status"):
            raise RuntimeError("journal/trace outcome mismatch")
        if outcome.get("full_check_sha256") != canonical_sha256(check):
            raise RuntimeError("journal/trace full-check hash mismatch")
        blocker = outcome.get("blocker")
        if outcome.get("status") == "unsat":
            assert isinstance(blocker, dict)
            if entry.get("blocker_sha256") != blocker.get("blocker_sha256"):
                raise RuntimeError("journal/trace blocker identity mismatch")
    return validated


def _merge_pending_assignments(
    inherited: Sequence[PendingAssignment],
    journal: ValidatedJournal | None,
) -> tuple[PendingAssignment, ...]:
    completed = set(journal.completed_assignment_sha256) if journal else set()
    merged: dict[str, PendingAssignment] = {
        item.assignment_sha256: item
        for item in inherited
        if item.assignment_sha256 not in completed
    }
    if journal:
        for item in journal.pending_assignments:
            prior = merged.get(item.assignment_sha256)
            if prior is not None and prior.assignment != item.assignment:
                raise RuntimeError("pending assignment identity collision")
            merged[item.assignment_sha256] = item
    return tuple(merged.values())


def validate_resume_artifact(
    spec: ResumeSpec, *, expected_case_id: str | None = None
) -> ValidatedResume:
    if file_sha256(spec.summary) != spec.summary_sha256:
        raise RuntimeError(f"resume summary hash mismatch: {spec.summary}")
    summary = read_json(spec.summary)
    version = summary.get("schema_version")
    if isinstance(version, bool) or not isinstance(version, int):
        raise RuntimeError("resume summary lacks an integer schema_version")
    provenance = _provenance_for_version(version)
    _check_provenance(summary, provenance, "resume summary")
    run_dir = spec.summary.parent
    invocation_path = run_dir / "invocation.json"
    invocation = read_json(invocation_path)
    _check_provenance(invocation, provenance, "resume invocation")
    for key in ("argv", "case_count", "workers", "resolved_budgets"):
        if invocation.get(key) != summary.get(key):
            raise RuntimeError(f"resume invocation/summary mismatch for {key}")
    if invocation.get("case_count") != 1 or invocation.get("workers") != 1:
        raise RuntimeError("resume source is not a one-case artifact")

    summary_results = _list(summary.get("results"), "resume summary results")
    if len(summary_results) != 1:
        raise RuntimeError("resume summary must contain exactly one result")
    summary_result = _dict(summary_results[0], "resume summary result")
    case_id = summary_result.get("case_id")
    if not isinstance(case_id, str) or (expected_case_id is not None and case_id != expected_case_id):
        raise RuntimeError("resume result case identifier mismatch")
    universe_cases = {
        case.case_id: case
        for case in (*v8.all_cases(), *v8.all_secondcap_endpoint_cases())
    }
    if case_id not in universe_cases:
        raise RuntimeError("resume source case is outside the exact-n15 universe")
    case = universe_cases[case_id]
    if summary_result.get("case") != asdict(case):
        raise RuntimeError("resume result case payload mismatch")
    result_path = run_dir / case_id / "result.json"
    result_digest = file_sha256(result_path)
    if summary_result.get("result_file_sha256") != result_digest:
        raise RuntimeError("resume result file hash mismatch")
    result = read_json(result_path)
    _check_provenance(result, provenance, "resume result")
    if {key: value for key, value in summary_result.items() if key != "result_file_sha256"} != result:
        raise RuntimeError("resume summary does not exactly embed result.json")
    if result.get("complete") is not False or result.get("status") not in {"unknown", "budget"}:
        raise RuntimeError("only fail-closed incomplete v17/v19 results may be resumed")

    trace_name = result.get("cegar_trace_file")
    if not isinstance(trace_name, str) or Path(trace_name).name != trace_name:
        raise RuntimeError("resume result has an unsafe trace filename")
    trace_path = result_path.parent / trace_name
    trace_digest = file_sha256(trace_path)
    if result.get("cegar_trace_sha256") != trace_digest:
        raise RuntimeError("resume trace file hash mismatch")
    trace = read_json(trace_path)
    universe, full_hash, blockers, cumulative = validate_trace_object(
        trace, expected_case_id=case_id
    )
    trace_iterations = _list(trace.get("iterations"), "resume trace iterations")
    if not blockers:
        raise RuntimeError("resume trace contains no authenticated blockers")
    if result.get("full_frozen_formula_sha256") != full_hash:
        raise RuntimeError("resume result/trace frozen-formula mismatch")
    if result.get("semantic_bool_count") != len(universe):
        raise RuntimeError("resume result/trace semantic-Bool count mismatch")
    if result.get("blocker_count") != len(blockers):
        raise RuntimeError("resume result/trace blocker count mismatch")
    if result.get("assignment_checks") != len(trace_iterations):
        raise RuntimeError("resume result/trace assignment-check count mismatch")
    if result.get("cumulative_blocker_sha256") != cumulative:
        raise RuntimeError("resume result/trace cumulative hash mismatch")

    frozen_name = result.get("full_frozen_file")
    if not isinstance(frozen_name, str) or Path(frozen_name).name != frozen_name:
        raise RuntimeError("resume result has an unsafe frozen-formula filename")
    frozen_path = result_path.parent / frozen_name
    frozen_digest = file_sha256(frozen_path)
    blob_hashes = _dict(result.get("frozen_blob_hashes"), "frozen blob hashes")
    frozen_record = _dict(blob_hashes.get("full_frozen"), "full frozen blob")
    if frozen_record != {"file": frozen_name, "sha256": frozen_digest}:
        raise RuntimeError("resume frozen blob hash mismatch")

    trace_pending = _trace_pending_assignments(
        trace, case_id=case_id, universe=universe, full_hash=full_hash
    )
    journal: ValidatedJournal | None = None
    pending = trace_pending
    if version == 19:
        journal_summary = _dict(
            result.get("assignment_journal"), "resume assignment journal"
        )
        journal_name = journal_summary.get("directory")
        if not isinstance(journal_name, str) or Path(journal_name).name != journal_name:
            raise RuntimeError("resume result has an unsafe journal directory")

        incremental_trace = trace
        incremental_name = result.get("incremental_cegar_trace_file")
        if incremental_name is not None:
            if not isinstance(incremental_name, str) or Path(incremental_name).name != incremental_name:
                raise RuntimeError("resume result has an unsafe incremental trace filename")
            incremental_path = result_path.parent / incremental_name
            incremental_digest = file_sha256(incremental_path)
            if result.get("incremental_cegar_trace_sha256") != incremental_digest:
                raise RuntimeError("resume incremental trace hash mismatch")
            incremental_trace = read_json(incremental_path)
            incremental_universe, incremental_full, _, _ = validate_trace_object(
                incremental_trace, expected_case_id=case_id
            )
            if incremental_universe != universe or incremental_full != full_hash:
                raise RuntimeError("resume incremental trace formula/universe mismatch")

        journal = validate_assignment_journal(
            result_path.parent / journal_name,
            journal_summary,
            case_id=case_id,
            universe=universe,
            full_hash=full_hash,
            incremental_trace=incremental_trace,
        )
        if trace_pending:
            journal_pending_hashes = {
                item.assignment_sha256 for item in journal.pending_assignments
            }
            trace_pending_hashes = {
                item.assignment_sha256 for item in trace_pending
            }
            if not journal_pending_hashes.issubset(trace_pending_hashes):
                raise RuntimeError("trace dropped a current journal pending assignment")
            if set(journal.completed_assignment_sha256) & trace_pending_hashes:
                raise RuntimeError("trace retains an assignment completed by its journal")
        else:
            pending = journal.pending_assignments

        result_pending = _trace_pending_assignments(
            result, case_id=case_id, universe=universe, full_hash=full_hash
        )
        if result_pending:
            if result_pending != pending:
                raise RuntimeError("resume result/trace pending-assignment mismatch")
        elif pending:
            raise RuntimeError("resume result does not expose pending assignments")
    elif any(key in result for key in (
        "assignment_journal", "pending_assignment_count", "pending_assignments",
        "pending_assignments_sha256",
    )):
        raise RuntimeError("v17 resume result unexpectedly carries v19 journal state")

    return ValidatedResume(
        spec=spec,
        schema_version=version,
        case=case,
        invocation_sha256=file_sha256(invocation_path),
        result_sha256=result_digest,
        trace_path=trace_path,
        trace_sha256=trace_digest,
        frozen_blob_path=frozen_path,
        frozen_blob_sha256=frozen_digest,
        full_frozen_formula_sha256=full_hash,
        semantic_bools=universe,
        semantic_bool_universe_sha256=canonical_sha256(list(universe)),
        blockers=blockers,
        cumulative_blocker_sha256=cumulative,
        journal=journal,
        pending_assignments=pending,
    )


def compose_resumed_trace(
    resume: ValidatedResume,
    child_trace: Mapping[str, object],
    *,
    pending_assignments: Sequence[PendingAssignment] = (),
) -> dict[str, object]:
    """Compose an authenticated source trace and one incremental v19 trace.

    The result deliberately retains the ordinary v17/v19 trace schema.  Thus
    its own ``cegar_trace_file`` can be supplied to a later v19 continuation;
    no imported blocker disappears after the first resumed run.
    """
    if file_sha256(resume.trace_path) != resume.trace_sha256:
        raise RuntimeError("resume trace changed after authentication")
    source_trace = read_json(resume.trace_path)
    source_universe, source_full, source_blockers, source_cumulative = (
        validate_trace_object(source_trace, expected_case_id=resume.case.case_id)
    )
    if (
        source_universe != resume.semantic_bools
        or source_full != resume.full_frozen_formula_sha256
        or tuple(item.blocker_sha256 for item in source_blockers)
        != tuple(item.blocker_sha256 for item in resume.blockers)
        or source_cumulative != resume.cumulative_blocker_sha256
    ):
        raise RuntimeError("resume trace no longer matches its authenticated manifest")

    child_universe, child_full, child_blockers, _ = validate_trace_object(
        child_trace, expected_case_id=resume.case.case_id
    )
    if child_universe != source_universe or child_full != source_full:
        raise RuntimeError("incremental trace changed formula or semantic-Bool universe")

    # A previous terminal SAT/UNKNOWN check did not justify a blocker.  Keep it
    # authenticated by the source artifact, but do not put it before new work:
    # the ordinary trace schema permits such a check only in final position.
    imported_iterations = [
        copy.deepcopy(item.source_iteration) for item in resume.blockers
    ]
    incremental_iterations = _list(
        child_trace.get("iterations"), "incremental trace iterations"
    )
    imported_iteration_count = len(imported_iterations)
    combined_iterations = imported_iterations
    ordered_hashes = [item.blocker_sha256 for item in resume.blockers]
    next_blocker = 0
    for local_ordinal, raw in enumerate(incremental_iterations):
        entry = copy.deepcopy(_dict(raw, "incremental trace iteration"))
        # ``combined_iterations`` aliases ``imported_iterations`` below, so its
        # length grows as entries are appended.  Keep the authenticated resume
        # offset fixed across the whole incremental trace.
        entry["iteration"] = imported_iteration_count + local_ordinal
        if "blocker_sha256" in entry:
            if next_blocker >= len(child_blockers):
                raise RuntimeError("incremental trace contains an unvalidated blocker")
            expected = child_blockers[next_blocker].blocker_sha256
            if entry.get("blocker_sha256") != expected:
                raise RuntimeError("incremental blocker order changed during composition")
            if expected in ordered_hashes:
                raise RuntimeError("incremental trace repeats an imported blocker")
            ordered_hashes.append(expected)
            entry["cumulative_blocker_sha256"] = canonical_sha256(ordered_hashes)
            next_blocker += 1
        combined_iterations.append(entry)
    if next_blocker != len(child_blockers):
        raise RuntimeError("incremental blocker count changed during composition")

    combined = {
        "kind": "retained-core-v19-resumed-trace/v2",
        "case_id": resume.case.case_id,
        "resume_source": resume.manifest(),
        "full_frozen_formula_sha256": source_full,
        "semantic_bools": list(source_universe),
        "semantic_bool_count": len(source_universe),
        "semantic_bool_universe_sha256": canonical_sha256(list(source_universe)),
        "initial_master_formula_sha256": require_sha256(
            source_trace.get("initial_master_formula_sha256"),
            "resume trace initial master",
        ),
        "final_master_formula_sha256": require_sha256(
            child_trace.get("final_master_formula_sha256"),
            "incremental trace final master",
        ),
        "imported_blocker_count": len(resume.blockers),
        "new_blocker_count": len(child_blockers),
        "blocker_count": len(ordered_hashes),
        "ordered_blocker_sha256": ordered_hashes,
        "cumulative_blocker_sha256": canonical_sha256(ordered_hashes),
        "iterations": combined_iterations,
        "pending_assignment_count": len(pending_assignments),
        "pending_assignments": [item.record() for item in pending_assignments],
        "pending_assignments_sha256": canonical_sha256(
            [item.record() for item in pending_assignments]
        ),
    }
    _, _, validated, validated_cumulative = validate_trace_object(
        combined, expected_case_id=resume.case.case_id
    )
    if len(validated) != len(ordered_hashes) or validated_cumulative != combined[
        "cumulative_blocker_sha256"
    ]:
        raise RuntimeError("composed continuation trace failed its own audit")
    if _trace_pending_assignments(
        combined, case_id=resume.case.case_id, universe=source_universe,
        full_hash=source_full,
    ) != tuple(pending_assignments):
        raise RuntimeError("composed continuation trace lost pending assignments")
    return combined


def load_resume_catalog(
    specs: Sequence[ResumeSpec], authenticated_case_ids: set[str]
) -> dict[str, ValidatedResume]:
    catalog: dict[str, ValidatedResume] = {}
    for spec in specs:
        resume = validate_resume_artifact(spec)
        case_id = resume.case.case_id
        if case_id not in authenticated_case_ids:
            raise RuntimeError(f"resume case is outside authenticated unresolved set: {case_id}")
        if case_id in catalog:
            raise RuntimeError(f"duplicate resume source for case: {case_id}")
        catalog[case_id] = resume
    return catalog


def audit_resumed_proposal(
    resume: ValidatedResume,
    case: v8.Case,
    fixes: Sequence[v19.Fix],
) -> dict[str, object]:
    """Fail closed unless a complete proposal escapes both imported banks."""
    assignment_pairs = tuple((str(fix.variable), fix.value) for fix in fixes)
    if any(not isinstance(value, bool) for _, value in assignment_pairs):
        raise RuntimeError("resumed proposal contains a non-Boolean value")
    if len({name for name, _ in assignment_pairs}) != len(assignment_pairs):
        raise RuntimeError("resumed proposal contains duplicate semantic Bools")
    assignment = dict(assignment_pairs)
    if tuple(sorted(assignment)) != resume.semantic_bools:
        raise RuntimeError("resumed proposal is not complete for the authenticated universe")

    imported_hits = tuple(
        blocker.ordinal
        for blocker in resume.blockers
        if all(assignment.get(name) is value for name, value in blocker.projected_core)
    )
    static_bank = v19.static_triangle_bank(case.profiles)
    static_hits = v18.matching_static_cuts(static_bank, assignment)
    ordered_assignment = tuple((name, assignment[name]) for name in resume.semantic_bools)
    report = {
        "observed": True,
        "assignment_sha256": canonical_sha256(_signed_record(ordered_assignment)),
        "semantic_bool_count": len(ordered_assignment),
        "semantic_bool_universe_sha256": resume.semantic_bool_universe_sha256,
        "imported_blocker_count": len(resume.blockers),
        "matched_imported_blocker_ordinals": list(imported_hits),
        "static_bank_cut_count": len(static_bank),
        "static_bank_descriptor_sha256": v18.static_triangle_bank_sha256(static_bank),
        "matched_static_cut_count": len(static_hits),
        "matched_static_cut_sha256": canonical_sha256(
            [cut.record() for cut in static_hits]
        ),
        "outside_every_imported_blocker": not imported_hits,
        "outside_static_triangle_bank": not static_hits,
    }
    if imported_hits:
        raise RuntimeError(
            f"first resumed proposal violates imported blockers {list(imported_hits)}"
        )
    if static_hits:
        raise RuntimeError(
            f"first resumed proposal violates {len(static_hits)} static triangle cuts"
        )
    return report


@dataclass
class FirstResumedProposalGuard:
    """Audit exactly the first full-theory proposal of a resumed child."""

    resume: ValidatedResume
    case: v8.Case
    audit: dict[str, object] | None = None
    call_count: int = 0
    recovered_pending_count: int = 0

    def wrap(
        self,
        delegate: Callable[
            [Sequence[z3.BoolRef], Sequence[v19.Fix], int, int, int, str | None],
            tuple[str, z3.ModelRef | None, tuple[v19.Fix, ...], dict[str, object]],
        ],
    ) -> Callable[
        [Sequence[z3.BoolRef], Sequence[v19.Fix], int, int, int, str | None],
        tuple[str, z3.ModelRef | None, tuple[v19.Fix, ...], dict[str, object]],
    ]:
        def guarded(
            frozen_assertions: Sequence[z3.BoolRef],
            fixes: Sequence[v19.Fix],
            timeout_ms: int,
            seed: int,
            iteration: int,
            frozen_full_formula_sha256: str | None = None,
        ) -> tuple[str, z3.ModelRef | None, tuple[v19.Fix, ...], dict[str, object]]:
            if self.call_count < len(self.resume.pending_assignments):
                expected = self.resume.pending_assignments[self.call_count]
                actual = tuple((str(fix.variable), fix.value) for fix in fixes)
                if actual != expected.assignment:
                    raise RuntimeError(
                        "resumed master did not replay pending assignment before fresh work"
                    )
                self.recovered_pending_count += 1
            if self.call_count == 0:
                self.audit = audit_resumed_proposal(self.resume, self.case, fixes)
            self.call_count += 1
            return delegate(
                frozen_assertions, fixes, timeout_ms, seed, iteration,
                frozen_full_formula_sha256,
            )

        return guarded

    def record(self) -> dict[str, object]:
        if self.audit is None:
            return {
                "observed": False,
                "check_assignment_call_count": self.call_count,
                "reason": "Boolean master produced no full-theory proposal",
                "imported_blocker_count": len(self.resume.blockers),
                "static_bank_cut_count": len(v19.static_triangle_bank(self.case.profiles)),
                "recovered_pending_assignment_count": self.recovered_pending_count,
                "expected_pending_assignment_count": len(self.resume.pending_assignments),
            }
        return {
            **self.audit,
            "check_assignment_call_count": self.call_count,
            "recovered_pending_assignment_count": self.recovered_pending_count,
            "expected_pending_assignment_count": len(self.resume.pending_assignments),
            "pending_assignment_sha256": [
                item.assignment_sha256 for item in self.resume.pending_assignments
            ],
        }


class PendingFirstSolver:
    """Force authenticated pending assignments before unconstrained proposals."""

    def __init__(
        self, delegate: z3.Solver, pending_assignments: Sequence[PendingAssignment]
    ) -> None:
        self._delegate = delegate
        self._pending = tuple(pending_assignments)
        self._next = 0

    def check(self, *assumptions: z3.BoolRef) -> z3.CheckSatResult:
        if assumptions:
            raise RuntimeError("pending-first master received unexpected assumptions")
        if self._next >= len(self._pending):
            return self._delegate.check()
        pending = self._pending[self._next]
        self._next += 1
        fixes = tuple(
            z3.Bool(name, ctx=self._delegate.ctx) == z3.BoolVal(
                value, ctx=self._delegate.ctx
            )
            for name, value in pending.assignment
        )
        outcome = self._delegate.check(*fixes)
        if outcome != z3.sat:
            raise RuntimeError(
                "authenticated pending assignment no longer satisfies resumed master"
            )
        return outcome

    @property
    def recovered_pending_count(self) -> int:
        return self._next

    def __getattr__(self, name: str) -> object:
        return getattr(self._delegate, name)


def _runtime_resume_prepass(
    resume: ValidatedResume,
    old_prepass: Callable[..., tuple[dict[str, object], list[object], z3.Solver]],
) -> Callable[..., tuple[dict[str, object], list[object], object]]:
    def wrapped(
        encoding: object,
        full_gate: v12.FullSolverGate,
        *args: object,
        **kwargs: object,
    ) -> tuple[dict[str, object], list[object], object]:
        report, learned, master = old_prepass(encoding, full_gate, *args, **kwargs)
        frozen_assertions = tuple(full_gate.solver.assertions())
        full_hash = v17.raw_formula_sha256(frozen_assertions)
        groups = getattr(encoding, "groups", None)
        if not isinstance(groups, dict):
            raise RuntimeError("v19 encoding lacks a constraint-group mapping")
        group_constraints = tuple(
            constraint for family in sorted(groups) for constraint in groups[family]
        )
        semantic = tuple(
            str(variable)
            for variable in v16.collect_semantic_bools((*group_constraints, *frozen_assertions))
        )
        if full_hash != resume.full_frozen_formula_sha256:
            raise RuntimeError("current v19 frozen formula differs from resume source")
        if semantic != resume.semantic_bools:
            raise RuntimeError("current v19 semantic-Bool universe differs from resume source")
        if canonical_sha256(list(semantic)) != resume.semantic_bool_universe_sha256:
            raise RuntimeError("current v19 semantic-Bool universe hash mismatch")

        before = v16.formula_sha256(master)
        imported_hashes: list[str] = []
        for imported in resume.blockers:
            blocker = imported.formula()
            digest = sha256_bytes(blocker.sexpr().encode())
            if digest != imported.blocker_sha256:
                raise RuntimeError("runtime blocker reconstruction changed an imported hash")
            if imported.semantics.get("falsified_by_recorded_assignment") is not True:
                raise RuntimeError("runtime import lost blocker semantics proof")
            master.add(blocker)
            imported_hashes.append(digest)
        cumulative = canonical_sha256(imported_hashes)
        if cumulative != resume.cumulative_blocker_sha256:
            raise RuntimeError("runtime imported blocker order/cumulative hash mismatch")
        after = v16.formula_sha256(master)
        report = dict(report)
        report["resume_import"] = {
            **resume.manifest(),
            "pre_import_master_formula_sha256": before,
            "post_import_master_formula_sha256": after,
            "runtime_frozen_formula_sha256": full_hash,
            "runtime_semantic_bool_universe_sha256": canonical_sha256(list(semantic)),
            "reconstructed_not_stored_smt": True,
            "imported_before_first_master_check": True,
            "frozen_full_formula_augmented": False,
            "pending_assignment_count": len(resume.pending_assignments),
            "pending_assignment_sha256": [
                item.assignment_sha256 for item in resume.pending_assignments
            ],
            "pending_forced_before_fresh_proposals": True,
        }
        resumed_master: object = master
        if resume.pending_assignments:
            resumed_master = PendingFirstSolver(master, resume.pending_assignments)
        return report, learned, resumed_master

    return wrapped


def _resolved_budgets(budgets: Budgets) -> dict[str, int]:
    return asdict(budgets)


def _case_args(case: v8.Case) -> list[str]:
    result = [
        "--arm", case.arm, "--profiles", case.profiles,
        "--kept", str(case.kept), "--deleted", str(case.deleted),
    ]
    if case.fresh is not None:
        result.extend(("--fresh", str(case.fresh)))
    return result


def _budget_args(budgets: Budgets) -> list[str]:
    return [
        "--timeout-ms", str(budgets.timeout_ms),
        "--bool-timeout-ms", str(budgets.bool_timeout_ms),
        "--max-assignments", str(budgets.max_assignments),
        "--replay-timeout-ms", str(budgets.replay_timeout_ms),
        "--max-power-cuts", str(budgets.max_power_cuts),
        "--max-power-candidates", str(budgets.max_power_candidates),
        "--max-bool-power-cuts", str(budgets.max_bool_power_cuts),
        "--max-bool-power-candidates", str(budgets.max_bool_power_candidates),
    ]


def build_child_command(
    selected: source_matrix.SelectedCase,
    artifacts: Path,
    budgets: Budgets,
    seed: int,
    resume: ValidatedResume | None,
) -> tuple[str, ...]:
    nice = shutil.which("nice") or "nice"
    uv = shutil.which("uv") or "uv"
    command = [
        nice, "-n", str(NICENESS_INCREMENT), uv, "run", "python", "-u",
        str(Path(__file__).resolve()), "child", *_case_args(selected.case),
        "--seed", str(seed), "--artifacts", str(artifacts), *_budget_args(budgets),
    ]
    if resume is not None:
        command.extend(("--resume", f"{resume.spec.summary}::{resume.spec.summary_sha256}"))
    return tuple(command)


def _make_run_dir(root: Path, label: str) -> Path:
    root.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ")
    run_dir = root / f"{stamp}-{label}-pid{os.getpid()}"
    run_dir.mkdir(exist_ok=False)
    return run_dir


def run_resume_child(args: argparse.Namespace) -> int:
    case = v8.Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
    resume = validate_resume_artifact(args.resume, expected_case_id=case.case_id) if args.resume else None
    budgets = Budgets(
        timeout_ms=args.timeout_ms,
        bool_timeout_ms=args.bool_timeout_ms,
        max_assignments=args.max_assignments,
        replay_timeout_ms=args.replay_timeout_ms,
        max_power_cuts=args.max_power_cuts,
        max_power_candidates=args.max_power_candidates,
        max_bool_power_cuts=args.max_bool_power_cuts,
        max_bool_power_candidates=args.max_bool_power_candidates,
    )
    budgets.validate()
    run_dir = _make_run_dir(args.artifacts, "v19-resume-case")
    frozen = v19.provenance()
    invocation = {
        **frozen,
        "argv": list(sys.argv),
        "case_count": 1,
        "workers": 1,
        "resolved_budgets": _resolved_budgets(budgets),
        "resume_source": resume.manifest() if resume else None,
        "resume_orchestrator_sha256": file_sha256(Path(__file__).resolve()),
    }
    write_json_atomic(run_dir / "invocation.json", invocation)
    old_prepass = v12.run_boolean_prepass
    old_v19_check = v19.check_assignment
    proposal_guard: FirstResumedProposalGuard | None = None
    if resume is not None:
        v12.run_boolean_prepass = _runtime_resume_prepass(resume, old_prepass)  # type: ignore[assignment]
        proposal_guard = FirstResumedProposalGuard(resume, case)
        v19.check_assignment = proposal_guard.wrap(old_v19_check)  # type: ignore[assignment]
    started = time.monotonic()
    try:
        result = v19.solve_case(
            case=case,
            timeout_ms=budgets.timeout_ms,
            out_dir=run_dir,
            seed=args.seed,
            max_power_cuts=budgets.max_power_cuts,
            max_power_candidates=budgets.max_power_candidates,
            bool_timeout_ms=budgets.bool_timeout_ms,
            max_bool_power_cuts=budgets.max_bool_power_cuts,
            max_bool_power_candidates=budgets.max_bool_power_candidates,
            max_assignments=budgets.max_assignments,
            replay_timeout_ms=budgets.replay_timeout_ms,
            expected_script_sha256=str(frozen["script_sha256"]),
            frozen_provenance=frozen,
        )
    finally:
        v12.run_boolean_prepass = old_prepass
        v19.check_assignment = old_v19_check

    result_path = run_dir / case.case_id / "result.json"
    if resume is not None:
        assert proposal_guard is not None
        prepass = _dict(result.get("boolean_prepass"), "child Boolean prepass")
        runtime_import = _dict(prepass.get("resume_import"), "child resume import")
        if runtime_import.get("cumulative_blocker_sha256") != resume.cumulative_blocker_sha256:
            raise RuntimeError("child result did not attest the requested resume import")
        child_trace_path = result_path.parent / str(result["cegar_trace_file"])
        child_trace = read_json(child_trace_path)
        child_universe, child_full, child_blockers, _ = validate_trace_object(
            child_trace, expected_case_id=case.case_id
        )
        if child_universe != resume.semantic_bools or child_full != resume.full_frozen_formula_sha256:
            raise RuntimeError("child trace does not continue the resumed formula/universe")
        child_journal_summary = _dict(
            result.get("assignment_journal"), "child assignment journal"
        )
        child_journal_name = child_journal_summary.get("directory")
        if (
            not isinstance(child_journal_name, str)
            or Path(child_journal_name).name != child_journal_name
        ):
            raise RuntimeError("child result has an unsafe journal directory")
        child_journal = validate_assignment_journal(
            result_path.parent / child_journal_name,
            child_journal_summary,
            case_id=case.case_id,
            universe=child_universe,
            full_hash=child_full,
            incremental_trace=child_trace,
        )
        pending = _merge_pending_assignments(
            resume.pending_assignments, child_journal
        )
        continuation = compose_resumed_trace(
            resume, child_trace, pending_assignments=pending
        )
        continuation_path = result_path.parent / "resumed_cegar_trace_v19.json"
        write_json_atomic(continuation_path, continuation)
        incremental_trace_sha256 = file_sha256(child_trace_path)
        result["resume_import"] = runtime_import
        result["first_resumed_proposal_audit"] = proposal_guard.record()
        result["incremental_cegar_trace_file"] = child_trace_path.name
        result["incremental_cegar_trace_sha256"] = incremental_trace_sha256
        result["cegar_trace_file"] = continuation_path.name
        result["cegar_trace_sha256"] = file_sha256(continuation_path)
        result["assignment_checks"] = len(
            _list(continuation.get("iterations"), "composed trace iterations")
        )
        result["blocker_count"] = continuation["blocker_count"]
        result["cumulative_blocker_sha256"] = continuation[
            "cumulative_blocker_sha256"
        ]
        result["resumed_cegar_trace_file"] = continuation_path.name
        result["resumed_cegar_trace_sha256"] = result["cegar_trace_sha256"]
        result["resumed_cumulative_blocker_sha256"] = continuation["cumulative_blocker_sha256"]
        result["pending_assignment_count"] = len(pending)
        result["pending_assignments"] = [item.record() for item in pending]
        result["pending_assignments_sha256"] = canonical_sha256(
            [item.record() for item in pending]
        )
        write_json_atomic(result_path, result)

    result_attested = {**result, "result_file_sha256": file_sha256(result_path)}
    complete = result.get("complete") is True
    summary = {
        **invocation,
        "command": "case",
        "elapsed_seconds": time.monotonic() - started,
        "counts": {str(result.get("status")): 1},
        "complete": complete,
        "results": [result_attested],
    }
    write_json_atomic(run_dir / "summary.json", summary)
    print(json.dumps({
        "case_id": case.case_id,
        "complete": complete,
        "counts": summary["counts"],
        "imported_blockers": len(resume.blockers) if resume else 0,
        "run_dir": str(run_dir),
    }, sort_keys=True))
    return 0 if complete else 2


class MatrixLease:
    def __init__(self, path: Path):
        self.path = path
        self.handle: object | None = None

    def __enter__(self) -> "MatrixLease":
        self.path.parent.mkdir(parents=True, exist_ok=True)
        self.handle = self.path.open("a+")
        try:
            fcntl.flock(self.handle.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)  # type: ignore[union-attr]
        except BlockingIOError as exc:
            raise RuntimeError(f"another v19 retry matrix owns {self.path}") from exc
        return self

    def __exit__(self, *_: object) -> None:
        if self.handle is not None:
            fcntl.flock(self.handle.fileno(), fcntl.LOCK_UN)  # type: ignore[union-attr]
            self.handle.close()  # type: ignore[union-attr]


def capture_frozen_inputs(
    selected: Sequence[source_matrix.SelectedCase],
    resumes: Mapping[str, ValidatedResume],
) -> FrozenInputs:
    files = {
        "orchestrator": Path(__file__).resolve(),
        "orchestrator_test": HERE / "test_run_v19_retry_matrix.py",
        "orchestrator_doc": HERE / "V19-RESUME-ORCHESTRATOR.md",
        "v19_script": HERE / "round5_cegar_v19.py",
        "v19_schema": HERE / "schema_v19.json",
        "v19_test": HERE / "test_round5_cegar_v19.py",
        "v17_script": HERE / "round5_cegar_v17.py",
        "v17_schema": HERE / "schema_v17.json",
        "source_matrix": HERE / "run_v17_retry_matrix.py",
        "uv_lock": HERE / "uv.lock",
        "v8_source_summary": source_matrix.V8_SUMMARY,
        "v10_source_invocation": source_matrix.V10_INVOCATION,
        "v10_source_summary": source_matrix.V10_SUMMARY,
    }
    hashes = {role: file_sha256(path) for role, path in files.items()}
    expected_source = {
        "v8_source_summary": source_matrix.V8_SUMMARY_SHA256,
        "v10_source_invocation": source_matrix.V10_INVOCATION_SHA256,
        "v10_source_summary": source_matrix.V10_SUMMARY_SHA256,
    }
    for role, digest in expected_source.items():
        if hashes[role] != digest:
            raise RuntimeError(f"authenticated exact-n15 source hash drifted: {role}")
    provenance = v19.provenance()
    if provenance.get("script_sha256") != hashes["v19_script"]:
        raise RuntimeError("v19 provenance does not attest current script")
    if provenance.get("schema_sha256") != hashes["v19_schema"]:
        raise RuntimeError("v19 provenance does not attest current schema")
    if provenance.get("focused_test_source_sha256") != hashes["v19_test"]:
        raise RuntimeError("v19 provenance does not attest current focused test")
    if provenance.get("uv_lock_sha256") != hashes["uv_lock"]:
        raise RuntimeError("v19 provenance does not attest current uv.lock")
    return FrozenInputs(
        file_hashes=hashes,
        v19_provenance=provenance,
        source_case_entry_sha256=tuple(
            canonical_sha256({
                "source_index": item.source_index,
                "case": asdict(item.case),
                "v8": item.v8_result_entry_sha256,
                "v10": item.v10_result_entry_sha256,
            })
            for item in selected
        ),
        resume_manifest_sha256={
            case_id: canonical_sha256(resume.manifest())
            for case_id, resume in sorted(resumes.items())
        },
    )


def run_child_process(spec: ChildSpec) -> ChildExecution:
    spec.child_artifacts.mkdir(parents=True, exist_ok=False)
    stdout_path = spec.child_artifacts / "child.stdout.log"
    stderr_path = spec.child_artifacts / "child.stderr.log"
    started = time.monotonic()
    with stdout_path.open("wb") as stdout, stderr_path.open("wb") as stderr:
        completed = subprocess.run(
            spec.command,
            cwd=HERE,
            stdin=subprocess.DEVNULL,
            stdout=stdout,
            stderr=stderr,
            check=False,
            start_new_session=True,
        )
    return ChildExecution(
        exit_code=completed.returncode,
        elapsed_seconds=time.monotonic() - started,
        stdout_path=stdout_path,
        stderr_path=stderr_path,
    )


def _only_child_run(child_artifacts: Path) -> Path:
    runs = sorted(path for path in child_artifacts.iterdir() if path.is_dir())
    if len(runs) != 1:
        raise RuntimeError(f"expected one child run directory, found {len(runs)}")
    return runs[0]


def attest_child(
    spec: ChildSpec,
    execution: ChildExecution,
    frozen: FrozenInputs,
    budgets: Budgets,
    seed: int,
) -> dict[str, object]:
    run_dir = _only_child_run(spec.child_artifacts)
    invocation_path = run_dir / "invocation.json"
    summary_path = run_dir / "summary.json"
    invocation = read_json(invocation_path)
    summary = read_json(summary_path)
    errors: list[str] = []
    _check_provenance(invocation, frozen.v19_provenance, "child invocation")
    _check_provenance(summary, frozen.v19_provenance, "child summary")
    if invocation.get("case_count") != 1 or invocation.get("workers") != 1:
        errors.append("child is not one-case/one-worker")
    if invocation.get("resolved_budgets") != _resolved_budgets(budgets):
        errors.append("child budget mismatch")
    expected_resume = spec.resume.manifest() if spec.resume else None
    if invocation.get("resume_source") != expected_resume:
        errors.append("child resume-source mismatch")
    results = summary.get("results")
    if not isinstance(results, list) or len(results) != 1 or not isinstance(results[0], dict):
        errors.append("child summary result list malformed")
        result_entry: dict[str, object] = {}
    else:
        result_entry = results[0]
    if result_entry.get("case_id") != spec.selected.case.case_id:
        errors.append("child case mismatch")
    result_path = run_dir / spec.selected.case.case_id / "result.json"
    if not result_path.is_file() or result_entry.get("result_file_sha256") != file_sha256(result_path):
        errors.append("child result hash mismatch")
    if spec.resume is not None:
        resume_import = result_entry.get("resume_import")
        if not isinstance(resume_import, dict) or resume_import.get("cumulative_blocker_sha256") != spec.resume.cumulative_blocker_sha256:
            errors.append("child did not attest imported blockers")
        proposal_audit = result_entry.get("first_resumed_proposal_audit")
        if not isinstance(proposal_audit, dict):
            errors.append("child omitted first-resumed-proposal audit")
        elif proposal_audit.get("observed") is True and (
            proposal_audit.get("outside_every_imported_blocker") is not True
            or proposal_audit.get("outside_static_triangle_bank") is not True
        ):
            errors.append("child first proposal did not escape both blocker banks")
        resumed_name = result_entry.get("resumed_cegar_trace_file")
        if not isinstance(resumed_name, str):
            errors.append("child omitted resumed continuation trace")
        else:
            resumed_path = result_path.parent / resumed_name
            if not resumed_path.is_file() or result_entry.get("resumed_cegar_trace_sha256") != file_sha256(resumed_path):
                errors.append("child resumed-trace hash mismatch")
        if (
            result_entry.get("complete") is not True
            and result_path.is_file()
            and summary_path.is_file()
        ):
            try:
                recursive = validate_resume_artifact(
                    ResumeSpec(summary_path, file_sha256(summary_path)),
                    expected_case_id=spec.selected.case.case_id,
                )
                if recursive.cumulative_blocker_sha256 != result_entry.get(
                    "cumulative_blocker_sha256"
                ):
                    errors.append("recursive resume cumulative hash mismatch")
            except Exception as exc:
                errors.append(f"child is not recursively resumable: {type(exc).__name__}: {exc}")
    complete = result_entry.get("complete") is True
    if complete != (execution.exit_code == 0):
        errors.append("child exit code disagrees with completeness")
    if execution.exit_code not in {0, 2}:
        errors.append(f"unexpected child exit code {execution.exit_code}")
    artifacts = {
        "invocation": {"path": str(invocation_path), "sha256": file_sha256(invocation_path)},
        "summary": {"path": str(summary_path), "sha256": file_sha256(summary_path)},
        "result": {"path": str(result_path), "sha256": file_sha256(result_path)} if result_path.is_file() else None,
        "stdout": {"path": str(execution.stdout_path), "sha256": file_sha256(execution.stdout_path)},
        "stderr": {"path": str(execution.stderr_path), "sha256": file_sha256(execution.stderr_path)},
    }
    return {
        "ordinal": spec.ordinal,
        "source_index": spec.selected.source_index,
        "case_id": spec.selected.case.case_id,
        "case": asdict(spec.selected.case),
        "command": list(spec.command),
        "exit_code": execution.exit_code,
        "elapsed_seconds": execution.elapsed_seconds,
        "status": str(result_entry.get("status", "worker_error")),
        "complete": complete,
        "artifact_attested": not errors,
        "attestation_errors": errors,
        "resume_source": expected_resume,
        "artifacts": artifacts,
    }


def emit_status(record: Mapping[str, object]) -> None:
    print(json.dumps(dict(record), sort_keys=True), flush=True)


def orchestrate(
    *,
    artifacts: Path,
    workers: int,
    budgets: Budgets,
    seed: int,
    exclude_case_ids: Sequence[str],
    resume_specs: Sequence[ResumeSpec],
    runner: ChildRunner = run_child_process,
) -> tuple[int, Path, dict[str, object]]:
    if not 1 <= workers <= MAX_WORKERS:
        raise ValueError(f"workers must be in the closed interval 1..{MAX_WORKERS}")
    budgets.validate()
    selected_all = load_authenticated_case_selection()
    authenticated_ids = {item.case.case_id for item in selected_all}
    resumes = load_resume_catalog(resume_specs, authenticated_ids)
    if not resumes:
        raise ValueError("the resumable v19 matrix requires at least one --resume source")
    excluded = tuple(dict.fromkeys(exclude_case_ids))
    missing = sorted(set(excluded) - set(resumes))
    if missing:
        raise ValueError(f"cannot exclude cases without authenticated resume sources: {missing}")
    selected_run = tuple(
        item
        for item in selected_all
        if item.case.case_id in resumes and item.case.case_id not in excluded
    )
    if not selected_run:
        raise ValueError("exclusions removed every authenticated resume case")
    frozen = capture_frozen_inputs(selected_all, resumes)

    with MatrixLease(artifacts / ".v19-resume-matrix.lock"):
        run_dir = _make_run_dir(artifacts, "v19-resume-matrix")
        base = {
            "kind": "retained-core-v19-resume-matrix/v1",
            "target": TARGET,
            "scope": "normalized exact-n15 retained-omission terminal",
            "source_derivation": "authenticated ordered v8 UNKNOWN set, exactly cross-checked by v10",
            "source_chain": {
                "v8_summary": str(source_matrix.V8_SUMMARY),
                "v8_summary_sha256": source_matrix.V8_SUMMARY_SHA256,
                "v10_invocation": str(source_matrix.V10_INVOCATION),
                "v10_invocation_sha256": source_matrix.V10_INVOCATION_SHA256,
                "v10_summary": str(source_matrix.V10_SUMMARY),
                "v10_summary_sha256": source_matrix.V10_SUMMARY_SHA256,
            },
            "source_case_count": len(selected_all),
            "selected_case_count": len(selected_run),
            "selected_case_ids": [item.case.case_id for item in selected_run],
            "excluded_case_ids": list(excluded),
            "source_case_entry_sha256": list(frozen.source_case_entry_sha256),
            "resume_sources": {case_id: resume.manifest() for case_id, resume in sorted(resumes.items())},
            "resume_manifest_sha256": frozen.resume_manifest_sha256,
            "frozen_file_hashes": frozen.file_hashes,
            "frozen_v19_provenance": frozen.v19_provenance,
            "workers": workers,
            "global_worker_cap": MAX_WORKERS,
            "niceness_increment": NICENESS_INCREMENT,
            "seed": seed,
            "resolved_budgets": _resolved_budgets(budgets),
            "child_interface": "one-case v19 solve_case through authenticated resume prepass",
        }
        write_json_atomic(run_dir / "run_manifest.json", {
            **base, "state": "RUNNING", "children": [],
            "started_utc": datetime.now(timezone.utc).isoformat(),
        })
        specs = tuple(
            ChildSpec(
                ordinal=ordinal,
                selected=item,
                child_artifacts=run_dir / "children" / f"{ordinal:03d}-{item.case.case_id}",
                resume=resumes.get(item.case.case_id),
                command=build_child_command(
                    item,
                    run_dir / "children" / f"{ordinal:03d}-{item.case.case_id}",
                    budgets,
                    seed,
                    resumes.get(item.case.case_id),
                ),
            )
            for ordinal, item in enumerate(selected_run)
        )
        started = time.monotonic()

        def execute(spec: ChildSpec) -> dict[str, object]:
            emit_status({"event": "case_started", "ordinal": spec.ordinal, "case_id": spec.selected.case.case_id})
            try:
                execution = runner(spec)
                record = attest_child(spec, execution, frozen, budgets, seed)
            except Exception as exc:
                record = {
                    "ordinal": spec.ordinal,
                    "source_index": spec.selected.source_index,
                    "case_id": spec.selected.case.case_id,
                    "case": asdict(spec.selected.case),
                    "command": list(spec.command),
                    "status": "worker_error",
                    "complete": False,
                    "artifact_attested": False,
                    "attestation_errors": [f"{type(exc).__name__}: {exc}"],
                    "resume_source": spec.resume.manifest() if spec.resume else None,
                }
            emit_status({"event": "case_finished", "ordinal": spec.ordinal, "case_id": spec.selected.case.case_id, "status": record["status"], "complete": record["complete"]})
            return record

        with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
            children = list(pool.map(execute, specs))
        children.sort(key=lambda item: int(item["ordinal"]))

        drift_error: str | None = None
        try:
            current_selected = load_authenticated_case_selection()
            current_resumes = load_resume_catalog(resume_specs, authenticated_ids)
            current_frozen = capture_frozen_inputs(current_selected, current_resumes)
            if current_frozen != frozen:
                raise RuntimeError("frozen source/provenance/resume inputs changed during matrix")
        except Exception as exc:
            drift_error = f"{type(exc).__name__}: {exc}"
        counts = Counter(str(item["status"]) for item in children)
        complete = (
            drift_error is None
            and len(children) == len(selected_run)
            and all(item.get("artifact_attested") is True for item in children)
            and all(item.get("complete") is True for item in children)
        )
        aggregate = {
            **base,
            "state": "TERMINAL",
            "complete": complete,
            "terminal_claim": "all_selected_v19_children_complete" if complete else "none_fail_closed_incomplete",
            "elapsed_seconds": time.monotonic() - started,
            "counts": dict(sorted(counts.items())),
            "frozen_input_recheck_error": drift_error,
            "children": children,
        }
        write_json_atomic(run_dir / "aggregate_manifest.json", aggregate)
        emit_status({"event": "matrix_finished", "complete": complete, "counts": dict(sorted(counts.items())), "run_dir": str(run_dir)})
        return (0 if complete else 2), run_dir, aggregate


def bounded_workers(value: str) -> int:
    parsed = int(value)
    if not 1 <= parsed <= MAX_WORKERS:
        raise argparse.ArgumentTypeError(f"workers must be in 1..{MAX_WORKERS}")
    return parsed


def _add_budget_arguments(parser: argparse.ArgumentParser) -> None:
    parser.add_argument("--seed", type=int, default=97)
    parser.add_argument("--timeout-ms", type=int, default=600_000)
    parser.add_argument("--bool-timeout-ms", type=int, default=30_000)
    parser.add_argument("--max-assignments", type=int, default=100_000)
    parser.add_argument("--replay-timeout-ms", type=int, default=30_000)
    parser.add_argument("--max-power-cuts", type=int, default=256)
    parser.add_argument("--max-power-candidates", type=int, default=2_000_000)
    parser.add_argument("--max-bool-power-cuts", type=int, default=256)
    parser.add_argument("--max-bool-power-candidates", type=int, default=2_000_000)


def parser() -> argparse.ArgumentParser:
    top = argparse.ArgumentParser(description=__doc__)
    commands = top.add_subparsers(dest="command", required=True)
    matrix = commands.add_parser("matrix", help="preflight or launch the authenticated matrix")
    matrix.add_argument("--launch", action="store_true")
    matrix.add_argument("--artifacts", type=Path, default=HERE / "artifacts-v19-resume-matrix")
    matrix.add_argument("--workers", type=bounded_workers, default=MAX_WORKERS)
    matrix.add_argument("--exclude-case-id", action="append", default=[])
    matrix.add_argument("--resume", type=ResumeSpec.parse, action="append", required=True)
    _add_budget_arguments(matrix)

    child = commands.add_parser("child", help=argparse.SUPPRESS)
    child.add_argument("--arm", choices=("paired", "fresh", "secondcap"), required=True)
    child.add_argument("--profiles", required=True)
    child.add_argument("--kept", type=int, required=True)
    child.add_argument("--deleted", type=int, required=True)
    child.add_argument("--fresh", type=int)
    child.add_argument("--artifacts", type=Path, required=True)
    child.add_argument("--resume", type=ResumeSpec.parse, required=True)
    _add_budget_arguments(child)
    return top


def _budgets_from_args(args: argparse.Namespace) -> Budgets:
    return Budgets(
        timeout_ms=args.timeout_ms,
        bool_timeout_ms=args.bool_timeout_ms,
        max_assignments=args.max_assignments,
        replay_timeout_ms=args.replay_timeout_ms,
        max_power_cuts=args.max_power_cuts,
        max_power_candidates=args.max_power_candidates,
        max_bool_power_cuts=args.max_bool_power_cuts,
        max_bool_power_candidates=args.max_bool_power_candidates,
    )


def main(argv: Sequence[str] | None = None) -> int:
    args = parser().parse_args(argv)
    if args.command == "child":
        return run_resume_child(args)
    budgets = _budgets_from_args(args)
    budgets.validate()
    selected = load_authenticated_case_selection()
    ids = {item.case.case_id for item in selected}
    resumes = load_resume_catalog(args.resume, ids)
    frozen = capture_frozen_inputs(selected, resumes)
    excluded = tuple(dict.fromkeys(args.exclude_case_id))
    unknown = sorted(set(excluded) - set(resumes))
    if unknown:
        raise SystemExit(f"--exclude-case-id lacks an authenticated resume source: {unknown}")
    selected_resume_count = len(resumes) - len(excluded)
    if selected_resume_count <= 0:
        raise SystemExit("exclusions removed every authenticated resume case")
    if not args.launch:
        emit_status({
            "event": "preflight_only",
            "launch": False,
            "source_case_count": len(selected),
            "selected_case_count": selected_resume_count,
            "resume_case_ids": sorted(resumes),
            "resume_blocker_counts": {case_id: len(resume.blockers) for case_id, resume in sorted(resumes.items())},
            "workers": args.workers,
            "niceness_increment": NICENESS_INCREMENT,
            "resolved_budgets": _resolved_budgets(budgets),
            "frozen_file_hashes": frozen.file_hashes,
        })
        return 0
    code, _, _ = orchestrate(
        artifacts=args.artifacts,
        workers=args.workers,
        budgets=budgets,
        seed=args.seed,
        exclude_case_ids=excluded,
        resume_specs=args.resume,
    )
    return code


if __name__ == "__main__":
    raise SystemExit(main())
