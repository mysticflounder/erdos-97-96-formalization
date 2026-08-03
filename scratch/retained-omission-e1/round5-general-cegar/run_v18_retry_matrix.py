#!/usr/bin/env python3
"""Authenticated, resumable v18 exact-n15 retry-matrix orchestrator.

The 67-case universe is derived from the reviewed v8 -> v10 terminal chain in
``run_v17_retry_matrix``.  A resume source is accepted only as
``SUMMARY.json::SHA256``.  Its v17/v18 provenance, result, trace, frozen
formula, semantic-Bool universe, ordered blockers, cumulative hash, and replay
records are checked before any reconstructed blocker reaches v18's Boolean
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
import run_v17_retry_matrix as source_matrix


HERE = Path(__file__).resolve().parent
TARGET = v18.TARGET
MAX_WORKERS = 24
NICENESS_INCREMENT = 10
HEX_DIGITS = frozenset("0123456789abcdef")


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def file_sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def canonical_sha256(value: object) -> str:
    return v18.canonical_sha256(value)


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

    def fixes(self) -> tuple[v18.Fix, ...]:
        return tuple(v18.Fix(z3.Bool(name), value) for name, value in self.projected_core)

    def formula(self) -> z3.BoolRef:
        return v16.blocker_for_core(self.fixes())


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
            raise ValueError("all v18 budgets must be positive")


@dataclass(frozen=True)
class FrozenInputs:
    file_hashes: dict[str, str]
    v18_provenance: dict[str, object]
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
    if version == 18:
        return v18.provenance()
    raise RuntimeError(f"only v17/v18 traces may be resumed, got schema {version}")


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
    fixes = tuple(v18.Fix(z3.Bool(name), value) for name, value in core)
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


def _validate_qf_lra_record(record: Mapping[str, object], label: str) -> None:
    if record.get("status") != "unsat":
        raise RuntimeError(f"{label} did not record UNSAT")
    normalization = _dict(record.get("normalization"), f"{label}.normalization")
    audit = _dict(normalization.get("logic_audit"), f"{label}.logic_audit")
    if audit.get("accepted") is not True or audit.get("classification") != "QF_LRA":
        raise RuntimeError(f"{label} lacks an accepted QF_LRA audit")
    require_sha256(normalization.get("normalized_formula_sha256"), f"{label}.normalized")


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
            _validate_qf_lra_record(primary, f"iteration {ordinal} primary")
            _validate_qf_lra_record(replay, f"iteration {ordinal} fresh replay")
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
        raise RuntimeError("only fail-closed incomplete v17/v18 results may be resumed")

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
    )


def compose_resumed_trace(
    resume: ValidatedResume,
    child_trace: Mapping[str, object],
) -> dict[str, object]:
    """Compose an authenticated source trace and one incremental v18 trace.

    The result deliberately retains the ordinary v17/v18 trace schema.  Thus
    its own ``cegar_trace_file`` can be supplied to a later v18 continuation;
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
    combined_iterations = imported_iterations
    ordered_hashes = [item.blocker_sha256 for item in resume.blockers]
    next_blocker = 0
    for local_ordinal, raw in enumerate(incremental_iterations):
        entry = copy.deepcopy(_dict(raw, "incremental trace iteration"))
        entry["iteration"] = len(imported_iterations) + local_ordinal
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
        "kind": "retained-core-v18-resumed-trace/v2",
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
    }
    _, _, validated, validated_cumulative = validate_trace_object(
        combined, expected_case_id=resume.case.case_id
    )
    if len(validated) != len(ordered_hashes) or validated_cumulative != combined[
        "cumulative_blocker_sha256"
    ]:
        raise RuntimeError("composed continuation trace failed its own audit")
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
    fixes: Sequence[v18.Fix],
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
    static_bank = v18.static_triangle_bank(case.profiles)
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

    def wrap(
        self,
        delegate: Callable[
            [Sequence[z3.BoolRef], Sequence[v18.Fix], int, int, int],
            tuple[str, z3.ModelRef | None, tuple[v18.Fix, ...], dict[str, object]],
        ],
    ) -> Callable[
        [Sequence[z3.BoolRef], Sequence[v18.Fix], int, int, int],
        tuple[str, z3.ModelRef | None, tuple[v18.Fix, ...], dict[str, object]],
    ]:
        def guarded(
            frozen_assertions: Sequence[z3.BoolRef],
            fixes: Sequence[v18.Fix],
            timeout_ms: int,
            seed: int,
            iteration: int,
        ) -> tuple[str, z3.ModelRef | None, tuple[v18.Fix, ...], dict[str, object]]:
            if self.call_count == 0:
                self.audit = audit_resumed_proposal(self.resume, self.case, fixes)
            self.call_count += 1
            return delegate(frozen_assertions, fixes, timeout_ms, seed, iteration)

        return guarded

    def record(self) -> dict[str, object]:
        if self.audit is None:
            return {
                "observed": False,
                "check_assignment_call_count": self.call_count,
                "reason": "Boolean master produced no full-theory proposal",
                "imported_blocker_count": len(self.resume.blockers),
                "static_bank_cut_count": len(v18.static_triangle_bank(self.case.profiles)),
            }
        return {**self.audit, "check_assignment_call_count": self.call_count}


def _runtime_resume_prepass(
    resume: ValidatedResume,
    old_prepass: Callable[..., tuple[dict[str, object], list[object], z3.Solver]],
) -> Callable[..., tuple[dict[str, object], list[object], z3.Solver]]:
    def wrapped(
        encoding: object,
        full_gate: v12.FullSolverGate,
        *args: object,
        **kwargs: object,
    ) -> tuple[dict[str, object], list[object], z3.Solver]:
        report, learned, master = old_prepass(encoding, full_gate, *args, **kwargs)
        frozen_assertions = tuple(full_gate.solver.assertions())
        full_hash = v17.raw_formula_sha256(frozen_assertions)
        groups = getattr(encoding, "groups", None)
        if not isinstance(groups, dict):
            raise RuntimeError("v18 encoding lacks a constraint-group mapping")
        group_constraints = tuple(
            constraint for family in sorted(groups) for constraint in groups[family]
        )
        semantic = tuple(
            str(variable)
            for variable in v16.collect_semantic_bools((*group_constraints, *frozen_assertions))
        )
        if full_hash != resume.full_frozen_formula_sha256:
            raise RuntimeError("current v18 frozen formula differs from resume source")
        if semantic != resume.semantic_bools:
            raise RuntimeError("current v18 semantic-Bool universe differs from resume source")
        if canonical_sha256(list(semantic)) != resume.semantic_bool_universe_sha256:
            raise RuntimeError("current v18 semantic-Bool universe hash mismatch")

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
        }
        return report, learned, master

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
    run_dir = _make_run_dir(args.artifacts, "v18-resume-case")
    frozen = v18.provenance()
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
    old_v18_check = v18.check_assignment
    proposal_guard: FirstResumedProposalGuard | None = None
    if resume is not None:
        v12.run_boolean_prepass = _runtime_resume_prepass(resume, old_prepass)  # type: ignore[assignment]
        proposal_guard = FirstResumedProposalGuard(resume, case)
        v18.check_assignment = proposal_guard.wrap(old_v18_check)  # type: ignore[assignment]
    started = time.monotonic()
    try:
        result = v18.solve_case(
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
        v18.check_assignment = old_v18_check

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
        continuation = compose_resumed_trace(resume, child_trace)
        continuation_path = result_path.parent / "resumed_cegar_trace_v18.json"
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
            raise RuntimeError(f"another v18 retry matrix owns {self.path}") from exc
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
        "orchestrator_test": HERE / "test_run_v18_retry_matrix.py",
        "orchestrator_doc": HERE / "V18-RESUME-ORCHESTRATOR.md",
        "v18_script": HERE / "round5_cegar_v18.py",
        "v18_schema": HERE / "schema_v18.json",
        "v18_test": HERE / "test_round5_cegar_v18.py",
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
    provenance = v18.provenance()
    if provenance.get("script_sha256") != hashes["v18_script"]:
        raise RuntimeError("v18 provenance does not attest current script")
    if provenance.get("schema_sha256") != hashes["v18_schema"]:
        raise RuntimeError("v18 provenance does not attest current schema")
    if provenance.get("focused_test_source_sha256") != hashes["v18_test"]:
        raise RuntimeError("v18 provenance does not attest current focused test")
    if provenance.get("uv_lock_sha256") != hashes["uv_lock"]:
        raise RuntimeError("v18 provenance does not attest current uv.lock")
    return FrozenInputs(
        file_hashes=hashes,
        v18_provenance=provenance,
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
    _check_provenance(invocation, frozen.v18_provenance, "child invocation")
    _check_provenance(summary, frozen.v18_provenance, "child summary")
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
        raise ValueError("the resumable v18 matrix requires at least one --resume source")
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

    with MatrixLease(artifacts / ".v18-resume-matrix.lock"):
        run_dir = _make_run_dir(artifacts, "v18-resume-matrix")
        base = {
            "kind": "retained-core-v18-resume-matrix/v1",
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
            "frozen_v18_provenance": frozen.v18_provenance,
            "workers": workers,
            "global_worker_cap": MAX_WORKERS,
            "niceness_increment": NICENESS_INCREMENT,
            "seed": seed,
            "resolved_budgets": _resolved_budgets(budgets),
            "child_interface": "one-case v18 solve_case through authenticated resume prepass",
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
            "terminal_claim": "all_selected_v18_children_complete" if complete else "none_fail_closed_incomplete",
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
    matrix.add_argument("--artifacts", type=Path, default=HERE / "artifacts-v18-resume-matrix")
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
