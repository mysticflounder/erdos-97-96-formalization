"""Round-5 v30: spawn-safe v19 Boolean CEGAR over the v29 encoding.

This is an adapter, not a new mathematical encoding.  It runs v19's
hash-chained, replay-authenticated complete-assignment engine with v29's full
nonapex K4-shell semantics and power-shell whitelist.  Every worker is imported
under an explicit ``spawn`` context and exact-compared against the parent's
frozen provenance before its result is admitted.

The profile-specific semantic Boolean universe remains a complete assignment:
SSS/DSS/SDD/DDD cases contain 780/795/810/825 variables respectively.  An
UNSAT assignment is blocked only after the primary and fresh reconstructed
QF_LRA checks both return UNSAT.  SAT and UNSAT are complete; UNKNOWN, budget,
and error remain incomplete.  This is external exact-n15 evidence, not a Lean
proof or a universal closure theorem.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import contextlib
import hashlib
import json
import multiprocessing
import os
import sys
import time
from collections import Counter
from collections.abc import Iterator, Sequence
from dataclasses import asdict
from pathlib import Path

import z3

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v19 as v19
import round5_cegar_v29 as v29

HERE = Path(__file__).resolve().parent
TARGET = v29.TARGET
SCHEMA_VERSION = 30
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v30.json"
TEST_PATH = HERE / "test_round5_cegar_v30.py"
FOCUSED_TEST_LOG_PATH = HERE / "focused-tests-v30.log"
FOCUSED_TEST_COMMAND = "uv run --with pytest pytest -q test_round5_cegar_v30.py"
WORKER_MODULE_ID = "round5_cegar_v30"
DEFAULT_ARTIFACT_DIR = HERE / "artifacts-v30-boolean-master-full-shell"
ARTIFACT_NAMES = {
    "assignment_journal": "assignment-journal-v30",
    "boolean_master": "boolean_master_v30.smt2.gz",
    "boolean_prepass": "boolean_prepass_v30.json",
    "cegar_trace": "cegar_trace_v30.json",
    "full_frozen": "full_frozen_v30.smt2.gz",
    "witness": "witness_v30.json",
}
Case = v29.Case
Encoding = v29.Encoding

AUTHENTICATED_V29_SUMMARY_SHA256 = (
    "96bc41be3a625843ee5047df1ca08eaba49fa7d22d38f2471fb5ce9724c4a46d"
)


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def optional_file_sha256(path: Path) -> str | None:
    return file_sha256(path) if path.is_file() else None


def canonical_sha256(value: object) -> str:
    return v12.canonical_sha256(value)


def source_contract() -> dict[str, object]:
    contract = v29.source_contract()
    role_map = dict(contract["role_map"])
    role_map["boolean_assignment_cegar"] = (
        "v19's Boolean-master engine and v18 static equality bank run over "
        "v29.Encoding with a v30 exact profile-specific semantic-universe "
        "gate; every blocked assignment has a primary and fresh reconstructed "
        "QF_LRA UNSAT replay plus a durable hash-chained journal record"
    )
    role_map["spawn_adapter"] = (
        "v30 workers import under multiprocessing spawn, bind v12 through "
        "v29's full-shell runtime, bind v16/v19 to the v30 frozen contract, "
        "and return an exact parent-validated attestation"
    )
    role_map["raw_assignment_probe"] = (
        "optional one-second v16 raw selector check; only a primary UNSAT with "
        "a fresh frozen-formula UNSAT replay may bypass normalization. SAT, "
        "UNKNOWN, and probe errors fall through to the unchanged v19 primary "
        "plus fresh-context normalized QF_LRA replay"
    )
    contract["role_map"] = role_map
    return contract


def _dependency_hashes() -> dict[str, str]:
    names = (
        "round5_cegar_v29.py",
        "schema_v29.json",
        "test_round5_cegar_v29.py",
        "round5_cegar_v19.py",
        "schema_v19.json",
        "test_round5_cegar_v19.py",
        "round5_cegar_v18.py",
        "schema_v18.json",
        "round5_cegar_v17.py",
        "schema_v17.json",
        "round5_cegar_v16.py",
        "schema_v16.json",
        "round5_cegar_v12.py",
        "schema_v12.json",
    )
    return {name: file_sha256(HERE / name) for name in names}


def provenance() -> dict[str, object]:
    inherited = v29.provenance()
    inherited.update(
        {
            "target": TARGET,
            "schema_version": SCHEMA_VERSION,
            "script_sha256": file_sha256(SCRIPT_PATH),
            "schema_sha256": file_sha256(SCHEMA_PATH),
            "v30_dependency_sha256": _dependency_hashes(),
            "v19_static_equality_triangle_bank_manifest": (
                v19.static_triangle_bank_manifest()
            ),
            "v19_normalization_spec_sha256": v19.canonical_sha256(
                v19.NORMALIZATION_SPEC
            ),
            "v19_normalization_source_sha256": v19.normalization_source_sha256(),
            "retry_source_contract": {
                "kind": "byte-frozen authenticated v29 terminal summary",
                "sha256": AUTHENTICATED_V29_SUMMARY_SHA256,
                "expected_schema_version": 29,
                "expected_case_count": 67,
                "expected_counts": {"unknown": 67},
                "expected_child_contract_valid": True,
            },
            "focused_test_source": TEST_PATH.name,
            "focused_test_source_sha256": file_sha256(TEST_PATH),
            "focused_test_log": FOCUSED_TEST_LOG_PATH.name,
            "focused_test_log_sha256": optional_file_sha256(FOCUSED_TEST_LOG_PATH),
            "focused_test_command": FOCUSED_TEST_COMMAND,
            "artifact_contract": {
                "default_directory": DEFAULT_ARTIFACT_DIR.name,
                "names": ARTIFACT_NAMES,
            },
            "spawn_contract": {
                "worker_range": [1, 24],
                "start_method": "spawn",
                "worker_module": WORKER_MODULE_ID,
                "encoding": "round5_cegar_v29.Encoding",
                "engine": "round5_cegar_v19.solve_case",
                "stable_seed": "sha256(base_seed, NUL, case_id) low 31 bits",
            },
            "raw_probe_contract": {
                "engine": "round5_cegar_v16.check_assignment",
                "default_timeout_ms": 1000,
                "disabled_value": 0,
                "unsat_admission": "primary raw UNSAT plus fresh raw UNSAT replay",
                "fallback": "SAT, UNKNOWN, or error uses v19 normalized dual replay",
            },
            "source_contract": source_contract(),
        }
    )
    return inherited


def verify_frozen_provenance(
    frozen: dict[str, object], expected_script_sha256: str | None = None
) -> dict[str, object]:
    current = provenance()
    if frozen != current:
        differing = sorted(
            key
            for key in set(frozen) | set(current)
            if frozen.get(key) != current.get(key)
        )
        raise RuntimeError(f"frozen provenance differs from v30 worker: {differing}")
    if (
        expected_script_sha256 is not None
        and current["script_sha256"] != expected_script_sha256
    ):
        raise RuntimeError("worker v30 source hash differs from parent invocation")
    return current


@contextlib.contextmanager
def _bound_v30_runtime() -> Iterator[None]:
    """Temporarily compose v29 semantics with v19's authenticated engine."""
    with v29._bound_v12_runtime():
        bindings: tuple[tuple[object, str, object], ...] = (
            (v12, "SCHEMA_VERSION", SCHEMA_VERSION),
            (v12, "SCRIPT_PATH", SCRIPT_PATH),
            (v12, "SCHEMA_PATH", SCHEMA_PATH),
            (v12, "Encoding", Encoding),
            (v12, "source_contract", source_contract),
            (v12, "provenance", provenance),
            (v16, "SCHEMA_VERSION", SCHEMA_VERSION),
            (v16, "SCRIPT_PATH", SCRIPT_PATH),
            (v16, "SCHEMA_PATH", SCHEMA_PATH),
            (v16, "Encoding", Encoding),
            (v16, "source_contract", source_contract),
            (v16, "provenance", provenance),
            (v19, "SCHEMA_VERSION", SCHEMA_VERSION),
            (v19, "SCRIPT_PATH", SCRIPT_PATH),
            (v19, "SCHEMA_PATH", SCHEMA_PATH),
            (v19, "source_contract", source_contract),
            (v19, "provenance", provenance),
            (v19, "verify_frozen_provenance", verify_frozen_provenance),
        )
        previous = [(owner, name, getattr(owner, name)) for owner, name, _ in bindings]
        for owner, name, value in bindings:
            setattr(owner, name, value)
        try:
            yield
        finally:
            for owner, name, value in reversed(previous):
                setattr(owner, name, value)


def _promote_artifacts(case_dir: Path, result: dict[str, object]) -> None:
    mapping = {
        "cegar_trace_v19.json": "cegar_trace_v30.json",
        "boolean_prepass_v19.json": "boolean_prepass_v30.json",
        "boolean_master_v19.smt2.gz": "boolean_master_v30.smt2.gz",
        "full_frozen_v19.smt2.gz": "full_frozen_v30.smt2.gz",
        "witness_v19.json": "witness_v30.json",
        "assignment-journal-v19": "assignment-journal-v30",
    }
    for old, new in mapping.items():
        old_path = case_dir / old
        if old_path.exists():
            old_path.rename(case_dir / new)
        for key, value in list(result.items()):
            if value == old:
                result[key] = new
    journal = result.get("assignment_journal")
    if (
        isinstance(journal, dict)
        and journal.get("directory") == "assignment-journal-v19"
    ):
        journal["directory"] = "assignment-journal-v30"
    reason = result.get("reason_incomplete")
    if reason == "v19_assignment_budget_exhausted":
        result["reason_incomplete"] = "v30_assignment_budget_exhausted"
    elif reason == "v19_wall_clock_budget_exhausted":
        result["reason_incomplete"] = "v30_wall_clock_budget_exhausted"
    for key in ("cegar_trace_sha256", "boolean_prepass_sha256"):
        filename = result.get(key.removesuffix("_sha256") + "_file")
        if isinstance(filename, str) and (case_dir / filename).is_file():
            result[key] = file_sha256(case_dir / filename)
    blobs: dict[str, dict[str, str]] = {}
    for role, filename in (
        ("boolean_master", "boolean_master_v30.smt2.gz"),
        ("full_frozen", "full_frozen_v30.smt2.gz"),
    ):
        path = case_dir / filename
        if path.is_file():
            blobs[role] = {"file": filename, "sha256": file_sha256(path)}
    result["frozen_blob_hashes"] = blobs
    result["result_hash_contract"] = {
        "embedded": False,
        "reason": "A result.json SHA-256 cannot be embedded in its own bytes.",
        "external_attestation": ("summary.json:result_file_sha256_by_case[case_id]"),
    }


def expected_semantic_bool_count(case: Case) -> int:
    """Exact v29 semantic-Bool count for one rich-profile case."""
    case.validate()
    return 780 + 15 * case.profiles.count("D")


def _validate_complete_semantic_fixes(
    frozen_assertions: Sequence[z3.BoolRef], fixes: Sequence[v19.Fix]
) -> tuple[z3.BoolRef, ...]:
    """Authenticate a complete assignment against this exact frozen formula."""
    expected = v16.collect_semantic_bools(frozen_assertions)
    expected_names = {str(variable) for variable in expected}
    fix_names = [str(fix.variable) for fix in fixes]
    if len(fix_names) != len(set(fix_names)):
        raise RuntimeError("v30 semantic fixes contain duplicate Boolean names")
    if set(fix_names) != expected_names:
        missing = sorted(expected_names - set(fix_names))
        extra = sorted(set(fix_names) - expected_names)
        raise RuntimeError(
            "v30 fixes are not complete for the frozen semantic-Bool universe: "
            f"missing={missing[:8]}, extra={extra[:8]}"
        )
    return expected


def check_complete_assignment(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[v19.Fix],
    timeout_ms: int,
    seed: int,
    iteration: int,
    frozen_full_formula_sha256: str | None = None,
) -> tuple[str, z3.ModelRef | None, tuple[v19.Fix, ...], dict[str, object]]:
    """v19 dual replay with case-specific exact assignment completeness."""
    _validate_complete_semantic_fixes(frozen_assertions, fixes)

    assignment_record = v19._assignment_record(fixes)
    assignment_hash = canonical_sha256(assignment_record)
    universe_hash = canonical_sha256(sorted(str(fix.variable) for fix in fixes))
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
            nonce=f"v30_closure_{iteration:06d}",
        )
        if replay["status"] == "unknown":
            return (
                "unknown",
                None,
                (),
                {
                    "status": "unknown",
                    "lane": "equality_closure_raw_replay",
                    "reason_unknown": replay["reason_unknown"],
                    "replay": replay,
                },
            )
        v16.authenticate_unsat_core(replay)
        return (
            "unsat",
            None,
            closure_core,
            {
                "status": "unsat",
                "lane": "equality_closure_raw_replay",
                "generalized": True,
                "assignment_sha256": assignment_hash,
                "projected_core_size": len(closure_core),
                "replay": replay,
            },
        )

    raw_formula_hash = frozen_full_formula_sha256 or v17.raw_formula_sha256(
        frozen_assertions
    )
    first_status, model, first = v19._normalized_check(
        frozen_assertions, fixes, timeout_ms, seed, raw_formula_hash
    )
    if first_status == "unknown":
        return (
            "unknown",
            None,
            (),
            {
                "status": "unknown",
                "lane": "fixed_assignment_qf_lra",
                "reason_unknown": first["reason_unknown"],
                "primary": first,
            },
        )
    if first_status == "sat":
        assert model is not None
        validation = v17._validate_raw_model(frozen_assertions, model)
        if validation["failures"]:
            raise RuntimeError(
                "normalized SAT model failed frozen raw assertion evaluation"
            )
        return (
            "sat",
            model,
            (),
            {
                "status": "sat",
                "lane": "fixed_assignment_qf_lra",
                "reason_unknown": None,
                "primary": first,
                "raw_model_validation": validation,
            },
        )

    reconstructed, replay_fixes, reconstruction = v19._reconstruct_frozen(
        frozen_assertions, fixes, raw_formula_hash
    )
    replay_status, _, replay = v19._normalized_check(
        reconstructed, replay_fixes, timeout_ms, seed, raw_formula_hash
    )
    replay_assignment_hash = canonical_sha256(v19._assignment_record(replay_fixes))
    if replay_assignment_hash != assignment_hash:
        raise RuntimeError("fresh normalized replay assignment identity changed")
    primary_normalization = first["normalization"]
    replay_normalization = replay["normalization"]
    assert isinstance(primary_normalization, dict)
    assert isinstance(replay_normalization, dict)
    v19.validate_normalization_identity(
        primary_normalization["normalized_replay_identity"],
        replay_normalization["normalized_replay_identity"],
    )
    if replay_status == "unknown":
        return (
            "unknown",
            None,
            (),
            {
                "status": "unknown",
                "lane": "fixed_assignment_qf_lra_replay",
                "reason_unknown": replay["reason_unknown"],
                "primary": first,
                "replay": replay,
            },
        )
    if replay_status != "unsat":
        raise RuntimeError(
            f"fresh normalized replay disagreed with UNSAT primary: {replay_status}"
        )
    replay.update(
        {
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
        }
    )
    return (
        "unsat",
        None,
        tuple(fixes),
        {
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
        },
    )


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
    raw_probe_timeout_ms: int = 1000,
    expected_script_sha256: str | None = None,
    frozen_provenance: dict[str, object] | None = None,
) -> dict[str, object]:
    if raw_probe_timeout_ms < 0:
        raise ValueError("raw probe timeout must be nonnegative")
    with _bound_v30_runtime():
        raw_check = v16.check_assignment
        normalized_check = check_complete_assignment

        def hybrid_check(
            frozen_assertions: Sequence[object],
            fixes: Sequence[v19.Fix],
            assignment_timeout_ms: int,
            assignment_seed: int,
            iteration: int,
            frozen_full_formula_sha256: str | None = None,
        ) -> tuple[str, object, tuple[v19.Fix, ...], dict[str, object]]:
            semantic_bools = _validate_complete_semantic_fixes(frozen_assertions, fixes)
            expected_count = expected_semantic_bool_count(case)
            if len(semantic_bools) != expected_count:
                raise RuntimeError(
                    "v30 frozen semantic-Bool count disagrees with the case profile: "
                    f"expected={expected_count}, actual={len(semantic_bools)}"
                )
            raw_record: dict[str, object] = {
                "status": "disabled",
                "timeout_ms": raw_probe_timeout_ms,
            }
            if raw_probe_timeout_ms:
                try:
                    raw_status, raw_model, raw_core, raw_details = raw_check(
                        frozen_assertions,
                        fixes,
                        min(assignment_timeout_ms, raw_probe_timeout_ms),
                        assignment_seed,
                        iteration,
                    )
                except Exception as exc:  # noqa: BLE001
                    # An optional optimization failure is not a mathematical verdict.
                    raw_record = {
                        "status": "error",
                        "timeout_ms": raw_probe_timeout_ms,
                        "error": f"{type(exc).__name__}: {exc}",
                    }
                else:
                    raw_record = {
                        **raw_details,
                        "status": raw_status,
                        "timeout_ms": raw_probe_timeout_ms,
                    }
                    if raw_status == "unsat":
                        return (
                            "unsat",
                            raw_model,
                            raw_core,
                            {
                                **raw_record,
                                "lane": "raw_selector_primary_plus_fresh_replay",
                                "normalized_fallback_used": False,
                                "raw_probe": raw_record,
                            },
                        )
            outcome, model, core, details = normalized_check(
                frozen_assertions,
                fixes,
                assignment_timeout_ms,
                assignment_seed,
                iteration,
                frozen_full_formula_sha256,
            )
            return (
                outcome,
                model,
                core,
                {
                    **details,
                    "normalized_fallback_used": True,
                    "raw_probe": raw_record,
                },
            )

        old_check = v19.check_assignment
        v19.check_assignment = hybrid_check
        try:
            result = v19.solve_case(
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
                expected_script_sha256=expected_script_sha256,
                frozen_provenance=frozen_provenance,
            )
        finally:
            v19.check_assignment = old_check
    case_dir = out_dir / case.case_id
    _promote_artifacts(case_dir, result)
    result["theory_classification"] = (
        "v29 full-nonapex-shell Bool+LRA+PB; v18 static equality bank; "
        "complete Boolean assignment; audited primary and fresh QF_LRA replay"
    )
    result["solver_lane"] = (
        "v19 replay-authenticated Boolean-master/journal engine over v29.Encoding"
    )
    result["adapter_contract"] = {
        "semantic_bool_count": expected_semantic_bool_count(case),
        "semantic_bool_count_formula": "780 + 15 * profiles.count('D')",
        "complete_assignment_gate": (
            "exact fix-name set equality with frozen-formula semantic Booleans"
        ),
        "complete_assignment_required": True,
        "encoding": "round5_cegar_v29.Encoding",
        "engine": "round5_cegar_v19.solve_case",
        "raw_probe_timeout_ms": raw_probe_timeout_ms,
    }
    budgets = result.get("budgets")
    if isinstance(budgets, dict):
        budgets["raw_probe_timeout_ms"] = raw_probe_timeout_ms
    v12.write_json(case_dir / "result.json", result)
    return result


def stable_case_seed(base_seed: int, case_id: str) -> int:
    return v29.stable_case_seed(base_seed, case_id)


def load_authenticated_v29_summary(path: Path) -> tuple[dict[str, object], str]:
    source = path.read_bytes()
    source_hash = hashlib.sha256(source).hexdigest()
    if source_hash != AUTHENTICATED_V29_SUMMARY_SHA256:
        raise ValueError("retry source is not the authenticated v29 summary bytes")
    try:
        prior = json.loads(source)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ValueError("retry source is not valid JSON") from exc
    results = prior.get("results") if isinstance(prior, dict) else None
    if (
        not isinstance(prior, dict)
        or prior.get("target") != TARGET
        or prior.get("schema_version") != 29
        or prior.get("case_count") != 67
        or prior.get("counts") != {"unknown": 67}
        or prior.get("complete") is not False
        or prior.get("child_contract_valid") is not True
        or not isinstance(results, list)
        or len(results) != 67
    ):
        raise ValueError("authenticated v29 summary has an invalid semantic envelope")
    case_ids: list[str] = []
    for result in results:
        if (
            not isinstance(result, dict)
            or result.get("status") != "unknown"
            or result.get("complete") is not False
        ):
            raise ValueError("authenticated v29 summary contains a non-UNKNOWN case")
        payload = result.get("case")
        if not isinstance(payload, dict):
            raise TypeError("authenticated v29 result lacks its case payload")
        case = Case(**payload)
        if result.get("case_id") != case.case_id:
            raise ValueError("authenticated v29 result case identity mismatch")
        case_ids.append(case.case_id)
    if case_ids != sorted(case_ids) or len(set(case_ids)) != len(case_ids):
        raise ValueError("authenticated v29 case ids are not sorted and unique")
    return prior, source_hash


def select_authenticated_retry_cases(
    prior: dict[str, object],
    *,
    include_error: bool = False,
    semantic_bool_count: int | None = None,
) -> list[Case]:
    """Select a deterministic subset of the authenticated v29 retry universe."""
    statuses = {"unknown"}
    if include_error:
        statuses.add("error")
    requested = {
        str(item["case_id"])
        for item in prior["results"]
        if item.get("status") in statuses
    }
    universe = {
        case.case_id: case
        for case in (*v8.all_cases(), *v8.all_secondcap_endpoint_cases())
    }
    missing = sorted(requested - universe.keys())
    if missing:
        raise ValueError(f"summary contains unknown case ids: {missing}")
    cases = [universe[case_id] for case_id in sorted(requested)]
    if semantic_bool_count is not None:
        cases = [
            case
            for case in cases
            if expected_semantic_bool_count(case) == semantic_bool_count
        ]
    return cases


def _worker_attestation(frozen: dict[str, object]) -> dict[str, object]:
    current = provenance()
    if current != frozen:
        raise RuntimeError("v30 worker source differs from frozen parent provenance")
    return {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": current["script_sha256"],
        "provenance_sha256": canonical_sha256(current),
        "encoding_class": "round5_cegar_v29.Encoding",
        "engine": "round5_cegar_v19.solve_case",
        "pid": os.getpid(),
        "start_method": multiprocessing.get_start_method(),
    }


def _worker(payload: tuple[dict[str, object], dict[str, object]]) -> dict[str, object]:
    data, frozen = payload
    local = dict(data)
    case = Case(**local.pop("case"))
    result = solve_case(case=case, frozen_provenance=frozen, **local)
    result["worker_attestation"] = _worker_attestation(frozen)
    cut_path = Path(local["out_dir"]) / case.case_id / "power_cuts_v12.json"
    kind_counts: Counter[str] = Counter()
    if cut_path.is_file():
        cut_artifact = json.loads(cut_path.read_text())
        for cut in cut_artifact.get("cuts", []):
            for row in cut.get("rows", []):
                kind_counts[str(row.get("kind"))] += 1
    result["power_cut_row_kind_counts"] = dict(sorted(kind_counts.items()))
    v12.write_json(Path(local["out_dir"]) / case.case_id / "result.json", result)
    return result


def _spawn_contract_probe(case_data: dict[str, object]) -> dict[str, object]:
    case = Case(**case_data)
    with _bound_v30_runtime():
        encoding = Encoding(case, timeout_ms=1, seed=97)
        return {
            **_worker_attestation(provenance()),
            "case_id": case.case_id,
            "global_K4_count": len(encoding.groups["global_K4"]),
            "nonapex_superadditivity_count": len(
                encoding.groups["nonapex_global_k4_squared_superadditivity"]
            ),
            "v16_encoding_bound": v16.Encoding is Encoding,
            "v19_provenance_bound": v19.provenance is provenance,
        }


def _validate_child_result(
    result: object, case: Case, frozen: dict[str, object], result_path: Path
) -> list[str]:
    errors: list[str] = []
    if not isinstance(result, dict):
        return ["worker returned a non-object result"]
    for key, value in frozen.items():
        if result.get(key) != value:
            errors.append(f"frozen provenance mismatch: {key}")
    if result.get("case_id") != case.case_id or result.get("case") != asdict(case):
        errors.append("case identity mismatch")
    status = result.get("status")
    if status not in {"sat", "unsat", "unknown", "budget", "error"}:
        errors.append("invalid terminal status")
    if result.get("complete") is not (status in {"sat", "unsat"}):
        errors.append("complete flag does not match fail-closed terminal policy")
    expected_count = expected_semantic_bool_count(case)
    if result.get("semantic_bool_count") != expected_count:
        errors.append(
            "semantic Boolean count does not match the authenticated case profile: "
            f"expected {expected_count}"
        )
    adapter = result.get("adapter_contract")
    if (
        isinstance(adapter, dict)
        and adapter.get("semantic_bool_count") != expected_count
    ):
        errors.append("adapter semantic Boolean count does not match case profile")
    counts = result.get("constraint_counts")
    if not isinstance(counts, dict):
        errors.append("missing constraint counts")
    else:
        if counts.get("global_K4") != 465:
            errors.append("global_K4 contract count is not 465")
        if counts.get("nonapex_global_k4_squared_superadditivity") != 4368:
            errors.append("superadditivity contract count is not 4368")
    attestation = result.get("worker_attestation")
    expected = {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": frozen["script_sha256"],
        "provenance_sha256": canonical_sha256(frozen),
        "encoding_class": "round5_cegar_v29.Encoding",
        "engine": "round5_cegar_v19.solve_case",
        "start_method": "spawn",
    }
    if not isinstance(attestation, dict):
        errors.append("missing worker attestation")
    else:
        for key, value in expected.items():
            if attestation.get(key) != value:
                errors.append(f"worker attestation mismatch: {key}")
        pid = attestation.get("pid")
        if isinstance(pid, bool) or not isinstance(pid, int) or pid <= 0:
            errors.append("worker attestation has invalid pid")
    if not isinstance(result.get("assignment_journal"), dict):
        errors.append("missing authenticated assignment journal summary")
    if not isinstance(result.get("power_cut_row_kind_counts"), dict):
        errors.append("missing power-cut row-kind accounting")
    if not result_path.is_file():
        errors.append("worker result file is missing")
    else:
        try:
            disk_result = json.loads(result_path.read_text())
        except json.JSONDecodeError:
            errors.append("worker result file is invalid JSON")
        else:
            if disk_result != result:
                errors.append("worker result differs from durable result file")
    return errors


def _atomic_write_json(path: Path, value: object) -> None:
    v29._atomic_write_json(path, value)


def _args_budgets(args: argparse.Namespace) -> dict[str, object]:
    return {
        "timeout_ms": args.timeout_ms,
        "bool_timeout_ms": args.bool_timeout_ms,
        "replay_timeout_ms": args.replay_timeout_ms,
        "max_assignments": args.max_assignments,
        "max_bool_power_cuts": args.max_bool_power_cuts,
        "max_bool_power_candidates": args.max_bool_power_candidates,
        "raw_probe_timeout_ms": args.raw_probe_timeout_ms,
    }


def run_matrix(
    args: argparse.Namespace,
    cases: Sequence[Case],
    command: str,
    source_summary: Path | None = None,
    source_summary_sha256: str | None = None,
) -> int:
    started = time.monotonic()
    if not 1 <= args.workers <= 24:
        raise ValueError("workers must be in the closed interval 1..24")
    if not cases:
        raise ValueError("at least one case is required")
    case_ids = [case.case_id for case in cases]
    if len(case_ids) != len(set(case_ids)):
        raise ValueError("duplicate case ids are forbidden")
    if (source_summary is None) != (source_summary_sha256 is None):
        raise ValueError("retry source path and authenticated hash must be paired")

    run_dir = v8.make_run_dir(args.artifacts, command)
    frozen = provenance()
    verify_frozen_provenance(frozen, str(frozen["script_sha256"]))
    invocation = {
        **frozen,
        "argv": sys.argv,
        "case_count": len(cases),
        "workers": args.workers,
        "multiprocessing_start_method": "spawn",
        "seed_schedule": "sha256(base_seed, NUL, case_id) low 31 bits",
        "resolved_budgets": _args_budgets(args),
        "semantic_bool_count_distribution": dict(
            sorted(
                Counter(expected_semantic_bool_count(case) for case in cases).items()
            )
        ),
        "retry_semantic_bool_count_filter": getattr(args, "semantic_bool_count", None),
        "source_summary": str(source_summary) if source_summary else None,
        "source_summary_sha256": source_summary_sha256,
    }
    v12.write_json(run_dir / "invocation.json", invocation)
    payloads = [
        (
            {
                "case": asdict(case),
                "timeout_ms": args.timeout_ms,
                "out_dir": run_dir,
                "seed": stable_case_seed(args.seed, case.case_id),
                "max_power_cuts": args.max_power_cuts,
                "max_power_candidates": args.max_power_candidates,
                "bool_timeout_ms": args.bool_timeout_ms,
                "max_bool_power_cuts": args.max_bool_power_cuts,
                "max_bool_power_candidates": args.max_bool_power_candidates,
                "max_assignments": args.max_assignments,
                "replay_timeout_ms": args.replay_timeout_ms,
                "raw_probe_timeout_ms": args.raw_probe_timeout_ms,
                "expected_script_sha256": str(frozen["script_sha256"]),
            },
            frozen,
        )
        for case in cases
    ]

    results: list[dict[str, object]] = []
    validation_errors: dict[str, list[str]] = {}
    context = multiprocessing.get_context("spawn")
    with concurrent.futures.ProcessPoolExecutor(
        max_workers=min(args.workers, len(payloads)), mp_context=context
    ) as pool:
        future_cases = {
            pool.submit(_worker, payload): case
            for payload, case in zip(payloads, cases, strict=True)
        }
        for future in concurrent.futures.as_completed(future_cases):
            case = future_cases[future]
            try:
                result = future.result()
            except Exception as exc:  # noqa: BLE001
                result = {
                    **frozen,
                    "case": asdict(case),
                    "case_id": case.case_id,
                    "status": "error",
                    "complete": False,
                    "error": f"worker exception: {type(exc).__name__}: {exc}",
                }
            errors = _validate_child_result(
                result, case, frozen, run_dir / case.case_id / "result.json"
            )
            if errors:
                validation_errors[case.case_id] = errors
                result["status"] = "error"
                result["complete"] = False
                result["parent_validation_errors"] = errors
            results.append(result)
            _atomic_write_json(
                run_dir / "progress.json",
                {
                    **invocation,
                    "completed_count": len(results),
                    "remaining_count": len(cases) - len(results),
                    "counts": dict(
                        sorted(
                            Counter(str(item.get("status")) for item in results).items()
                        )
                    ),
                    "validation_errors": validation_errors,
                    "completed": [
                        {"case_id": item.get("case_id"), "status": item.get("status")}
                        for item in sorted(
                            results, key=lambda item: str(item.get("case_id"))
                        )
                    ],
                },
            )

    results.sort(key=lambda item: str(item.get("case_id")))
    child_contract_valid = not validation_errors
    complete = child_contract_valid and v12.matrix_is_complete(cases, results)
    summary = {
        **invocation,
        "command": command,
        "elapsed_seconds": time.monotonic() - started,
        "counts": dict(
            sorted(Counter(str(result.get("status")) for result in results).items())
        ),
        "child_contract_valid": child_contract_valid,
        "child_validation_errors": validation_errors,
        "complete": complete,
        "result_file_sha256_by_case": {
            case.case_id: file_sha256(run_dir / case.case_id / "result.json")
            for case in cases
            if (run_dir / case.case_id / "result.json").is_file()
        },
        "results": results,
    }
    _atomic_write_json(run_dir / "summary.json", summary)
    print(
        json.dumps(
            {
                "counts": summary["counts"],
                "child_contract_valid": child_contract_valid,
                "run_dir": str(run_dir),
            },
            sort_keys=True,
        )
    )
    return 0 if complete else 2


def parser() -> argparse.ArgumentParser:
    parser = v19.parser()
    parser.description = __doc__
    for action in parser._actions:
        if isinstance(action, argparse._SubParsersAction):
            for command, subparser in action.choices.items():
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = DEFAULT_ARTIFACT_DIR
                subparser.add_argument(
                    "--raw-probe-timeout-ms",
                    type=int,
                    default=1000,
                    help=(
                        "optional replay-authenticated raw v16 probe timeout; "
                        "zero disables it before normalized v19 fallback"
                    ),
                )
                if command == "retry":
                    subparser.add_argument(
                        "--semantic-bool-count",
                        type=int,
                        default=None,
                        help=(
                            "retry only authenticated cases whose exact frozen "
                            "semantic Boolean universe has this cardinality"
                        ),
                    )
    return parser


def main() -> int:
    args = parser().parse_args()
    if args.command == "smoke":
        args.workers = 1
        return run_matrix(args, [Case("paired", "SSS", 0, 1, None)], "smoke")
    if args.command == "case":
        args.workers = 1
        case = Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
        return run_matrix(args, [case], "case")
    if args.command == "matrix":
        return run_matrix(args, v8.all_cases(), "matrix")
    if args.command == "secondcap-matrix":
        return run_matrix(args, v8.all_secondcap_endpoint_cases(), "secondcap-matrix")
    if args.command == "retry":
        prior, source_hash = load_authenticated_v29_summary(args.summary)
        cases = select_authenticated_retry_cases(
            prior,
            include_error=args.include_error,
            semantic_bool_count=args.semantic_bool_count,
        )
        if not cases:
            raise SystemExit("no authenticated retry cases match the requested filters")
        return run_matrix(args, cases, "retry", args.summary, source_hash)
    raise AssertionError(args.command)


if __name__ == "__main__":
    raise SystemExit(main())
