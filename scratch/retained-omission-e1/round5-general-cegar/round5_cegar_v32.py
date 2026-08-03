"""Round-5 v32: v31 acute cuts plus exact-15 S-profile class cuts.

For every S-profile cap with apex ``P`` and every ordered pair of distinct
strict-interior points ``C, M``, the source-proved exact-fifteen theorem
``Problem97.ATailExactFifteenSProfileMutualClassPair.``
``false_of_sProfile_interiorPair_of_card_eq_fifteen`` licenses

``k4[C,P] and k4[C,M] and k4[M,C] -> k4[M,P]``.

The nonapex ``k4`` atoms are physical full-shell memberships in v29 and later,
so the negative consequent is a genuine shell exclusion.  There are twelve
ordered clauses per S cap and no new semantic Boolean variables.  This is
external exact-n15 pruning, not a finite coverage certificate or a universal
proof of the retained-omission target.
"""

from __future__ import annotations

import argparse
import contextlib
import hashlib
import itertools
import json
import multiprocessing
import os
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
import round5_cegar_v31 as v31

HERE = Path(__file__).resolve().parent
TARGET = v29.TARGET
SCHEMA_VERSION = 32
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v32.json"
TEST_PATH = HERE / "test_round5_cegar_v32.py"
FOCUSED_TEST_LOG_PATH = HERE / "focused-tests-v32.log"
FOCUSED_TEST_COMMAND = "uv run --with pytest pytest -q test_round5_cegar_v32.py"
WORKER_MODULE_ID = "round5_cegar_v32"
DEFAULT_ARTIFACT_DIR = HERE / "artifacts-v32-s-profile-mutual-class"
ARTIFACT_NAMES = {
    "assignment_journal": "assignment-journal-v32",
    "boolean_master": "boolean_master_v32.smt2.gz",
    "boolean_prepass": "boolean_prepass_v32.json",
    "cegar_trace": "cegar_trace_v32.json",
    "full_frozen": "full_frozen_v32.smt2.gz",
    "witness": "witness_v32.json",
}
S_PROFILE_FAMILY = "exact_fifteen_s_profile_mutual_class_pair"
ACUTE_FAMILY = v31.ACUTE_FAMILY
Case = v31.Case

AUTHENTICATED_V29_SUMMARY_SHA256 = v31.AUTHENTICATED_V29_SUMMARY_SHA256

_BASE_V31_SOURCE_CONTRACT = v31.source_contract
_BASE_V31_PROVENANCE = v31.provenance
_BASE_V31_BOUND_RUNTIME = v31._bound_v31_runtime
_BASE_V31_PROMOTE_ARTIFACTS = v31._promote_artifacts
_BASE_V31_CHECK_COMPLETE_ASSIGNMENT = v31.check_complete_assignment
_BASE_V31_SOLVE_CASE = v31.solve_case
_BASE_V31_RUN_MATRIX = v31.run_matrix
_BASE_V31_LOAD_AUTHENTICATED_V29_SUMMARY = v31.load_authenticated_v29_summary
_BASE_V31_SELECT_AUTHENTICATED_RETRY_CASES = v31.select_authenticated_retry_cases

LEAN_ADAPTER_PATH = (
    v29.PROJECT_ROOT
    / "lean/Erdos9796Proof/P97/ATail/ExactFifteenSProfileMutualClassPair.lean"
)
LEAN_KERNEL_PATH = (
    v29.PROJECT_ROOT
    / "lean/Erdos9796Proof/P97/ATail/MutualShellPairSharedMember.lean"
)


class Encoding(v31.Encoding):
    """The v31 encoding plus the source-proved S-profile implication family."""

    def _build_rich_apices(self) -> None:
        super()._build_rich_apices()
        for i, (apex, interior) in enumerate(
            zip(v8.APICES, v8.INTERIORS, strict=True)
        ):
            if self.case.profiles[i] != "S":
                continue
            for center, member in itertools.permutations(interior, 2):
                self.add(
                    S_PROFILE_FAMILY,
                    z3.Or(
                        z3.Not(self.k4[center, apex]),
                        z3.Not(self.k4[center, member]),
                        z3.Not(self.k4[member, center]),
                        self.k4[member, apex],
                    ),
                )


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def optional_file_sha256(path: Path) -> str | None:
    return file_sha256(path) if path.is_file() else None


def canonical_sha256(value: object) -> str:
    return v31.canonical_sha256(value)


def expected_s_profile_clause_count(case: Case) -> int:
    return 12 * case.profiles.count("S")


def source_contract() -> dict[str, object]:
    contract = _BASE_V31_SOURCE_CONTRACT()
    files = dict(contract["files"])
    files["exact_fifteen_s_profile_mutual_class_adapter"] = {
        "path": str(LEAN_ADAPTER_PATH.relative_to(v29.PROJECT_ROOT)),
        "sha256": file_sha256(LEAN_ADAPTER_PATH),
    }
    files["mutual_shell_pair_shared_member_kernel"] = {
        "path": str(LEAN_KERNEL_PATH.relative_to(v29.PROJECT_ROOT)),
        "sha256": file_sha256(LEAN_KERNEL_PATH),
    }
    role_map = dict(contract["role_map"])
    role_map["boolean_assignment_cegar"] = (
        "v19's Boolean-master engine and v18 static equality bank run over "
        "v32.Encoding with the unchanged v30 exact profile-specific "
        "semantic-universe gate and dual replay authentication"
    )
    role_map["spawn_adapter"] = (
        "v32 workers preserve v31's acute family, bind v12/v16/v19 to the "
        "v32 frozen contract, and return an exact parent-validated attestation"
    )
    role_map[S_PROFILE_FAMILY] = (
        "Problem97.ATailExactFifteenSProfileMutualClassPair."
        "false_of_sProfile_interiorPair_of_card_eq_fifteen; for every ordered "
        "interior pair C,M of an S cap, k4[C,P] and k4[C,M] and k4[M,C] imply "
        "k4[M,P]; valid because v29 nonapex k4 atoms are full-shell exact"
    )
    contract["files"] = files
    contract["role_map"] = role_map
    return contract


def _dependency_hashes() -> dict[str, str]:
    paths = {
        "round5_cegar_v31.py": HERE / "round5_cegar_v31.py",
        "schema_v31.json": HERE / "schema_v31.json",
        "test_round5_cegar_v31.py": HERE / "test_round5_cegar_v31.py",
        str(LEAN_ADAPTER_PATH.relative_to(v29.PROJECT_ROOT)): LEAN_ADAPTER_PATH,
        str(LEAN_KERNEL_PATH.relative_to(v29.PROJECT_ROOT)): LEAN_KERNEL_PATH,
    }
    return {name: file_sha256(path) for name, path in paths.items()}


def provenance() -> dict[str, object]:
    inherited = _BASE_V31_PROVENANCE()
    inherited.update(
        {
            "target": TARGET,
            "schema_version": SCHEMA_VERSION,
            "script_sha256": file_sha256(SCRIPT_PATH),
            "schema_sha256": file_sha256(SCHEMA_PATH),
            "v32_dependency_sha256": _dependency_hashes(),
            "focused_test_source": TEST_PATH.name,
            "focused_test_source_sha256": file_sha256(TEST_PATH),
            "focused_test_log": FOCUSED_TEST_LOG_PATH.name,
            "focused_test_log_sha256": optional_file_sha256(
                FOCUSED_TEST_LOG_PATH
            ),
            "focused_test_command": FOCUSED_TEST_COMMAND,
            "artifact_contract": {
                "default_directory": DEFAULT_ARTIFACT_DIR.name,
                "names": ARTIFACT_NAMES,
            },
            "spawn_contract": {
                "worker_range": [1, 24],
                "start_method": "spawn",
                "worker_module": WORKER_MODULE_ID,
                "encoding": "round5_cegar_v32.Encoding",
                "engine": "round5_cegar_v19.solve_case",
                "stable_seed": "sha256(base_seed, NUL, case_id) low 31 bits",
            },
            "exact_fifteen_s_profile_mutual_class_contract": {
                "family": S_PROFILE_FAMILY,
                "ordered_pairs_per_s_cap": 12,
                "clause_count": "12 * profiles.count('S')",
                "authenticated_source_cases_affected": 43,
                "authenticated_source_cases_unaffected": 24,
                "authenticated_source_total_clauses": 516,
                "semantic_boolean_delta": 0,
                "requires_full_nonapex_shell_semantics": True,
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
        raise RuntimeError(f"frozen provenance differs from v32 worker: {differing}")
    if (
        expected_script_sha256 is not None
        and current["script_sha256"] != expected_script_sha256
    ):
        raise RuntimeError("worker v32 source hash differs from parent invocation")
    return current


@contextlib.contextmanager
def _bound_v32_runtime() -> Iterator[None]:
    """Layer v32 identity and tracker admission over v31's exact runtime."""
    with _BASE_V31_BOUND_RUNTIME():
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
            (
                v17,
                "TRACKER_ALLOWLIST",
                v17.TRACKER_ALLOWLIST | {f"track_{S_PROFILE_FAMILY}"},
            ),
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
    _BASE_V31_PROMOTE_ARTIFACTS(case_dir, result)
    mapping = {
        "cegar_trace_v31.json": "cegar_trace_v32.json",
        "boolean_prepass_v31.json": "boolean_prepass_v32.json",
        "boolean_master_v31.smt2.gz": "boolean_master_v32.smt2.gz",
        "full_frozen_v31.smt2.gz": "full_frozen_v32.smt2.gz",
        "witness_v31.json": "witness_v32.json",
        "assignment-journal-v31": "assignment-journal-v32",
    }
    for old, new in mapping.items():
        old_path = case_dir / old
        if old_path.exists():
            old_path.rename(case_dir / new)
        for key, value in list(result.items()):
            if value == old:
                result[key] = new
    journal = result.get("assignment_journal")
    if isinstance(journal, dict) and journal.get("directory") == "assignment-journal-v31":
        journal["directory"] = "assignment-journal-v32"
    reason = result.get("reason_incomplete")
    if reason == "v31_assignment_budget_exhausted":
        result["reason_incomplete"] = "v32_assignment_budget_exhausted"
    elif reason == "v31_wall_clock_budget_exhausted":
        result["reason_incomplete"] = "v32_wall_clock_budget_exhausted"
    for key in ("cegar_trace_sha256", "boolean_prepass_sha256"):
        filename = result.get(key.removesuffix("_sha256") + "_file")
        if isinstance(filename, str) and (case_dir / filename).is_file():
            result[key] = file_sha256(case_dir / filename)
    blobs: dict[str, dict[str, str]] = {}
    for role, filename in (
        ("boolean_master", "boolean_master_v32.smt2.gz"),
        ("full_frozen", "full_frozen_v32.smt2.gz"),
    ):
        path = case_dir / filename
        if path.is_file():
            blobs[role] = {"file": filename, "sha256": file_sha256(path)}
    result["frozen_blob_hashes"] = blobs


def expected_semantic_bool_count(case: Case) -> int:
    return v31.expected_semantic_bool_count(case)


def _validate_complete_semantic_fixes(
    frozen_assertions: Sequence[z3.BoolRef], fixes: Sequence[v19.Fix]
) -> tuple[z3.BoolRef, ...]:
    return v31._validate_complete_semantic_fixes(frozen_assertions, fixes)


def check_complete_assignment(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[v19.Fix],
    timeout_ms: int,
    seed: int,
    iteration: int,
    frozen_full_formula_sha256: str | None = None,
) -> tuple[str, z3.ModelRef | None, tuple[v19.Fix, ...], dict[str, object]]:
    return _BASE_V31_CHECK_COMPLETE_ASSIGNMENT(
        frozen_assertions,
        fixes,
        timeout_ms,
        seed,
        iteration,
        frozen_full_formula_sha256,
    )


@contextlib.contextmanager
def _bound_v31_solve_dispatch() -> Iterator[None]:
    bindings: tuple[tuple[str, object], ...] = (
        ("Encoding", Encoding),
        ("_bound_v31_runtime", _bound_v32_runtime),
        ("_promote_artifacts", _promote_artifacts),
        ("check_complete_assignment", check_complete_assignment),
    )
    previous = [(name, getattr(v31, name)) for name, _ in bindings]
    for name, value in bindings:
        setattr(v31, name, value)
    try:
        yield
    finally:
        for name, value in reversed(previous):
            setattr(v31, name, value)


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
    with _bound_v31_solve_dispatch():
        result = _BASE_V31_SOLVE_CASE(
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
            raw_probe_timeout_ms=raw_probe_timeout_ms,
            expected_script_sha256=expected_script_sha256,
            frozen_provenance=frozen_provenance,
        )
    result["theory_classification"] = (
        "v29 full-nonapex-shell Bool+LRA+PB plus v31 reverse-hit acute and "
        "v32 exact-fifteen S-profile mutual-class clauses; v18 equality bank; "
        "complete Boolean assignment; audited primary and fresh QF_LRA replay"
    )
    result["solver_lane"] = (
        "v31-composed replay-authenticated runtime over v32.Encoding"
    )
    adapter = result.get("adapter_contract")
    if not isinstance(adapter, dict):
        adapter = {}
        result["adapter_contract"] = adapter
    adapter.update(
        {
            "encoding": "round5_cegar_v32.Encoding",
            "engine": "round5_cegar_v19.solve_case",
            "acute_family": ACUTE_FAMILY,
            "acute_clause_count": 0 if case.arm == "paired" else 8,
            "s_profile_family": S_PROFILE_FAMILY,
            "s_profile_clause_count": expected_s_profile_clause_count(case),
        }
    )
    v12.write_json(out_dir / case.case_id / "result.json", result)
    return result


def stable_case_seed(base_seed: int, case_id: str) -> int:
    return v31.stable_case_seed(base_seed, case_id)


def load_authenticated_v29_summary(path: Path) -> tuple[dict[str, object], str]:
    return _BASE_V31_LOAD_AUTHENTICATED_V29_SUMMARY(path)


def select_authenticated_retry_cases(
    prior: dict[str, object],
    *,
    include_error: bool = False,
    semantic_bool_count: int | None = None,
) -> list[Case]:
    return _BASE_V31_SELECT_AUTHENTICATED_RETRY_CASES(
        prior,
        include_error=include_error,
        semantic_bool_count=semantic_bool_count,
    )


def _worker_attestation(frozen: dict[str, object]) -> dict[str, object]:
    current = provenance()
    if current != frozen:
        raise RuntimeError("v32 worker source differs from frozen parent provenance")
    return {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": current["script_sha256"],
        "provenance_sha256": canonical_sha256(current),
        "encoding_class": "round5_cegar_v32.Encoding",
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
    with _bound_v32_runtime():
        encoding = Encoding(case, timeout_ms=1, seed=97)
        return {
            **_worker_attestation(provenance()),
            "case_id": case.case_id,
            "global_K4_count": len(encoding.groups["global_K4"]),
            "nonapex_superadditivity_count": len(
                encoding.groups["nonapex_global_k4_squared_superadditivity"]
            ),
            "reverse_hit_two_center_sqdist_acute_count": len(
                encoding.groups.get(ACUTE_FAMILY, ())
            ),
            "s_profile_mutual_class_count": len(
                encoding.groups.get(S_PROFILE_FAMILY, ())
            ),
            "v12_encoding_bound": v12.Encoding is Encoding,
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
            "semantic Boolean count does not match authenticated case profile: "
            f"expected {expected_count}"
        )
    expected_acute = 0 if case.arm == "paired" else 8
    expected_s = expected_s_profile_clause_count(case)
    adapter = result.get("adapter_contract")
    if not isinstance(adapter, dict):
        errors.append("missing adapter contract")
    else:
        expected_adapter_metadata = {
            "encoding": "round5_cegar_v32.Encoding",
            "engine": "round5_cegar_v19.solve_case",
            "acute_family": ACUTE_FAMILY,
            "s_profile_family": S_PROFILE_FAMILY,
        }
        for key, value in expected_adapter_metadata.items():
            if adapter.get(key) != value:
                errors.append(f"adapter contract mismatch: {key}")
        if adapter.get("semantic_bool_count") != expected_count:
            errors.append("adapter semantic Boolean count does not match case profile")
        if adapter.get("acute_clause_count") != expected_acute:
            errors.append("adapter acute clause count does not match case arm")
        if adapter.get("s_profile_clause_count") != expected_s:
            errors.append("adapter S-profile clause count does not match profile")
    counts = result.get("constraint_counts")
    if not isinstance(counts, dict):
        errors.append("missing constraint counts")
    else:
        if counts.get("global_K4") != 465:
            errors.append("global_K4 contract count is not 465")
        if counts.get("nonapex_global_k4_squared_superadditivity") != 4368:
            errors.append("superadditivity contract count is not 4368")
        if counts.get(ACUTE_FAMILY, 0) != expected_acute:
            errors.append(f"{ACUTE_FAMILY} contract count is not {expected_acute}")
        if counts.get(S_PROFILE_FAMILY, 0) != expected_s:
            errors.append(f"{S_PROFILE_FAMILY} contract count is not {expected_s}")
    attestation = result.get("worker_attestation")
    expected_attestation = {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": frozen["script_sha256"],
        "provenance_sha256": canonical_sha256(frozen),
        "encoding_class": "round5_cegar_v32.Encoding",
        "engine": "round5_cegar_v19.solve_case",
        "start_method": "spawn",
    }
    if not isinstance(attestation, dict):
        errors.append("missing worker attestation")
    else:
        for key, value in expected_attestation.items():
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


@contextlib.contextmanager
def _bound_v31_matrix_dispatch() -> Iterator[None]:
    bindings: tuple[tuple[str, object], ...] = (
        ("provenance", provenance),
        ("verify_frozen_provenance", verify_frozen_provenance),
        ("_worker", _worker),
        ("_validate_child_result", _validate_child_result),
    )
    previous = [(name, getattr(v31, name)) for name, _ in bindings]
    for name, value in bindings:
        setattr(v31, name, value)
    try:
        yield
    finally:
        for name, value in reversed(previous):
            setattr(v31, name, value)


def run_matrix(
    args: argparse.Namespace,
    cases: Sequence[Case],
    command: str,
    source_summary: Path | None = None,
    source_summary_sha256: str | None = None,
) -> int:
    with _bound_v31_matrix_dispatch():
        return _BASE_V31_RUN_MATRIX(
            args,
            cases,
            command,
            source_summary,
            source_summary_sha256,
        )


def parser() -> argparse.ArgumentParser:
    parser = v31.parser()
    parser.description = __doc__
    for action in parser._actions:
        if isinstance(action, argparse._SubParsersAction):
            for subparser in action.choices.values():
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = DEFAULT_ARTIFACT_DIR
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
            raise SystemExit("no authenticated retry cases match requested filters")
        return run_matrix(args, cases, "retry", args.summary, source_hash)
    raise AssertionError(args.command)


if __name__ == "__main__":
    raise SystemExit(main())
