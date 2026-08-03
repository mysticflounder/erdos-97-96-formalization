"""Round-5 v33: exact-15 endpoint shared-blocker selected-seed slice.

This frozen slice keeps only the ordinary v8 ``fresh`` arm and adds the
source-proved shared-blocker continuation.  Its two exact four-shells form a
dynamic six-point seed.  For one simultaneous selected-four-class choice at
every seed center, the Lean producer proves that at least one chosen row
escapes the seed.

The new ``qrow`` and ``qsel`` supports are selected four-subsets.  They are not
registered as full physical circles and therefore are never admitted to the
power-pattern miner.  SAT is only a finite relaxation survivor; UNSAT closes
this exact-cardinality-15 shared-blocker slice externally, not the arbitrary-n
retained-omission target.
"""

from __future__ import annotations

import argparse
import contextlib
import hashlib
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
import round5_cegar_v30 as v30
import round5_cegar_v32 as v32

HERE = Path(__file__).resolve().parent
TARGET = v29.TARGET
SCHEMA_VERSION = 33
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v33.json"
TEST_PATH = HERE / "test_round5_cegar_v33.py"
FOCUSED_TEST_LOG_PATH = HERE / "focused-tests-v33.log"
FOCUSED_TEST_COMMAND = "uv run --with pytest pytest -q test_round5_cegar_v33.py"
WORKER_MODULE_ID = "round5_cegar_v33"
DEFAULT_ARTIFACT_DIR = HERE / "artifacts-v33-endpoint-shared-blocker-seed"
ARTIFACT_NAMES = {
    "assignment_journal": "assignment-journal-v33",
    "boolean_master": "boolean_master_v33.smt2.gz",
    "boolean_prepass": "boolean_prepass_v33.json",
    "cegar_trace": "cegar_trace_v33.json",
    "full_frozen": "full_frozen_v33.smt2.gz",
    "witness": "witness_v33.json",
}

ENDPOINT_COLLISION_FAMILY = "endpoint_fresh_shared_blocker_collision"
J_SELECTOR_FAMILY = "endpoint_fresh_j_selector"
J_CROSS_HIT_FAMILY = "endpoint_fresh_j_cross_hit"
J_SHARED_BLOCKER_FAMILY = "endpoint_fresh_j_shared_blocker"
FRONTIER_INTERSECTION_FAMILY = "endpoint_fresh_frontier_intersection"
QROW_FAMILY = "endpoint_fresh_first_apex_selected_row"
SEED_CARD_FAMILY = "endpoint_fresh_two_shell_seed_card"
SEED_SELECTED_ROWS_FAMILY = "endpoint_fresh_seed_selected_rows"
SEED_ESCAPE_FAMILY = "endpoint_fresh_seed_selected_row_escape"
NEW_FAMILIES = (
    ENDPOINT_COLLISION_FAMILY,
    J_SELECTOR_FAMILY,
    J_CROSS_HIT_FAMILY,
    J_SHARED_BLOCKER_FAMILY,
    FRONTIER_INTERSECTION_FAMILY,
    QROW_FAMILY,
    SEED_CARD_FAMILY,
    SEED_SELECTED_ROWS_FAMILY,
    SEED_ESCAPE_FAMILY,
)
NEW_FAMILY_COUNTS = {
    ENDPOINT_COLLISION_FAMILY: 15,
    J_SELECTOR_FAMILY: 1,
    J_CROSS_HIT_FAMILY: 11,
    J_SHARED_BLOCKER_FAMILY: 165,
    FRONTIER_INTERSECTION_FAMILY: 15,
    QROW_FAMILY: 28,
    SEED_CARD_FAMILY: 1,
    SEED_SELECTED_ROWS_FAMILY: 465,
    SEED_ESCAPE_FAMILY: 1,
}
J_DOMAIN = tuple(point for point in v8.POINTS if point not in v8.INTERIORS[0])
SEMANTIC_BOOL_DELTA = len(J_DOMAIN) + 15 + 15 * 15

Case = v32.Case
ACUTE_FAMILY = v32.ACUTE_FAMILY
S_PROFILE_FAMILY = v32.S_PROFILE_FAMILY

_BASE_V32_SOURCE_CONTRACT = v32.source_contract
_BASE_V32_PROVENANCE = v32.provenance
_BASE_V32_BOUND_RUNTIME = v32._bound_v32_runtime
_BASE_V32_PROMOTE_ARTIFACTS = v32._promote_artifacts
_BASE_V32_CHECK_COMPLETE_ASSIGNMENT = v32.check_complete_assignment
_BASE_V32_SOLVE_CASE = v32.solve_case
_BASE_V32_RUN_MATRIX = v32.run_matrix
_BASE_V30_EXPECTED_SEMANTIC_BOOL_COUNT = v30.expected_semantic_bool_count

LEAN_FRONTIER_PATH = (
    v29.PROJECT_ROOT / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean"
)
LEAN_CONTINUATION_PATH = (
    v29.PROJECT_ROOT
    / "lean/Erdos9796Proof/P97/ATail/RetainedMatchingEndpointContinuation.lean"
)
LEAN_LOCALIZATION_PATH = (
    v29.PROJECT_ROOT
    / "lean/Erdos9796Proof/P97/ATail/RetainedMatchingEndpointCollisionLocalization.lean"
)
LEAN_ENDPOINT_FIBER_PATH = (
    v29.PROJECT_ROOT
    / "lean/Erdos9796Proof/P97/ATail/RetainedMatchingCommonDeletionCycle.lean"
)


class Encoding(v32.Encoding):
    """The v32 encoding restricted to the shared-blocker seed continuation."""

    endpoint_j: dict[int, z3.BoolRef]
    endpoint_qrow: list[z3.BoolRef]
    endpoint_qsel: dict[tuple[int, int], z3.BoolRef]
    endpoint_common: list[z3.BoolRef]
    endpoint_seed: list[z3.BoolRef]

    def _build_normal_form(self) -> None:
        if self.case.arm != "fresh":
            raise ValueError("v33 admits only the ordinary fresh arm")
        super()._build_normal_form()

        kept = self.case.kept
        fresh = self.case.fresh
        assert fresh is not None
        frontier = self.rich[0, 0]["support"]
        assert isinstance(frontier, list)

        self.endpoint_common = [
            self.dynamic_row_member(kept, point) for point in v8.POINTS
        ]

        # The endpoint collision identifies the actual blockers of fresh and kept.
        for center in v8.CENTER_CANDIDATES:
            self.add(
                ENDPOINT_COLLISION_FAMILY,
                self.block[fresh, center] == self.block[kept, center],
            )

        # J is outside the first strict cap interior.  The first-apex support
        # constraints below eliminate the apex label without a special case.
        self.endpoint_j = {
            point: z3.Bool(f"endpoint_j_{point}") for point in J_DOMAIN
        }
        self.add(J_SELECTOR_FAMILY, v8.exactly(list(self.endpoint_j.values()), 1))
        for point, selected in self.endpoint_j.items():
            self.add(
                J_CROSS_HIT_FAMILY,
                z3.Implies(selected, self.dynamic_row_member(point, fresh)),
            )
            for center in v8.CENTER_CANDIDATES:
                self.add(
                    J_SHARED_BLOCKER_FAMILY,
                    z3.Implies(
                        selected,
                        self.block[point, center] == self.block[kept, center],
                    ),
                )

        def j_at(point: int) -> z3.BoolRef:
            return self.endpoint_j.get(point, z3.BoolVal(False))

        # The public source theorem identifies the whole physical frontier
        # intersection, not merely the selected Q row intersection.
        for point in v8.POINTS:
            named_pair = z3.BoolVal(True) if point == kept else j_at(point)
            self.add(
                FRONTIER_INTERSECTION_FAMILY,
                z3.And(self.endpoint_common[point], frontier[point]) == named_pair,
            )

        # Q.row is an exact selected four-subset of the first-apex frontier.
        # It intentionally remains absent from self.circles.
        self.endpoint_qrow = [
            z3.Bool(f"endpoint_qrow_{point}") for point in v8.POINTS
        ]
        self.add(QROW_FAMILY, v8.exactly(self.endpoint_qrow, 4))
        for point in v8.POINTS:
            self.add(
                QROW_FAMILY,
                z3.Implies(self.endpoint_qrow[point], frontier[point]),
            )
        self.add(QROW_FAMILY, self.endpoint_qrow[kept])
        for point, selected in self.endpoint_j.items():
            self.add(
                QROW_FAMILY,
                z3.Implies(selected, self.endpoint_qrow[point]),
            )

        self.endpoint_seed = [
            z3.Or(self.endpoint_common[point], self.endpoint_qrow[point])
            for point in v8.POINTS
        ]
        self.add(SEED_CARD_FAMILY, v8.exactly(self.endpoint_seed, 6))

        # Pick one selected four-class at each active seed center.  These are
        # subsets of v29's chosen K4 witnesses and are never full-shell rows.
        self.endpoint_qsel = {}
        for center in v8.POINTS:
            row: list[z3.BoolRef] = []
            for point in v8.POINTS:
                selected = z3.Bool(f"endpoint_qsel_{center}_{point}")
                self.endpoint_qsel[center, point] = selected
                row.append(selected)
                self.add(
                    SEED_SELECTED_ROWS_FAMILY,
                    z3.Implies(selected, self.endpoint_seed[center]),
                    z3.Implies(selected, self.k4[center, point]),
                )
            self.add(
                SEED_SELECTED_ROWS_FAMILY,
                z3.Implies(self.endpoint_seed[center], v8.exactly(row, 4)),
            )

        escape_terms = [
            z3.And(
                self.endpoint_seed[center],
                self.endpoint_qsel[center, point],
                z3.Not(self.endpoint_seed[point]),
            )
            for center in v8.POINTS
            for point in v8.POINTS
        ]
        self.add(SEED_ESCAPE_FAMILY, v8.z3_or(escape_terms))


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def optional_file_sha256(path: Path) -> str | None:
    return file_sha256(path) if path.is_file() else None


def canonical_sha256(value: object) -> str:
    return v32.canonical_sha256(value)


def source_contract() -> dict[str, object]:
    contract = _BASE_V32_SOURCE_CONTRACT()
    files = dict(contract["files"])
    files.update(
        {
            "endpoint_shared_blocker_frontier": {
                "path": str(LEAN_FRONTIER_PATH.relative_to(v29.PROJECT_ROOT)),
                "sha256": file_sha256(LEAN_FRONTIER_PATH),
            },
            "endpoint_first_apex_row_source": {
                "path": str(LEAN_CONTINUATION_PATH.relative_to(v29.PROJECT_ROOT)),
                "sha256": file_sha256(LEAN_CONTINUATION_PATH),
            },
            "endpoint_shared_blocker_localization": {
                "path": str(LEAN_LOCALIZATION_PATH.relative_to(v29.PROJECT_ROOT)),
                "sha256": file_sha256(LEAN_LOCALIZATION_PATH),
            },
            "endpoint_critical_fiber": {
                "path": str(LEAN_ENDPOINT_FIBER_PATH.relative_to(v29.PROJECT_ROOT)),
                "sha256": file_sha256(LEAN_ENDPOINT_FIBER_PATH),
            },
        }
    )
    role_map = dict(contract["role_map"])
    role_map.update(
        {
            ENDPOINT_COLLISION_FAMILY: (
                "RetainedMatchingEndpointCriticalFiber.endpoint_blockers_eq "
                "between the walk's fresh and kept endpoints"
            ),
            J_SELECTOR_FAMILY: (
                "nonempty_endpointFreshFirstApexRowSource supplies Q.J, and "
                "RetainedMatchingEndpointCollisionLocalization."
                "J_not_mem_firstCapInterior_of_sharedBlocker places it outside "
                "the first strict cap interior"
            ),
            J_CROSS_HIT_FAMILY: (
                "EndpointFreshCrossOrCommonDeletion.crossHit: Q.K belongs to "
                "the selected critical shell sourced by Q.J"
            ),
            J_SHARED_BLOCKER_FAMILY: (
                "EndpointFreshCriticalRoleOutcome.sharedBlocker branch equality "
                "between blocker(Q.J) and blocker(Q.C)"
            ),
            FRONTIER_INTERSECTION_FAMILY: (
                "Problem97.ATailFrontierLiveClosure."
                "endpointFresh_criticalShell_inter_frontierRadiusClass_eq_pair_of_sharedBlocker"
            ),
            QROW_FAMILY: (
                "EndpointFreshFirstApexRowSource.row_radius_eq and Q.row's "
                "SelectedFourClass support contract"
            ),
            SEED_CARD_FAMILY: (
                "Problem97.ATailFrontierLiveClosure."
                "endpointFresh_twoShellSeed_card_eq_six_of_sharedBlocker"
            ),
            SEED_SELECTED_ROWS_FAMILY: (
                "one simultaneous selected-four-class choice at each dynamic "
                "seed center, represented as an exact-four subset of v29 k4"
            ),
            SEED_ESCAPE_FAMILY: (
                "Problem97.ATailFrontierLiveClosure."
                "endpointFresh_exists_prescribedRow_escape_twoShellSeed_of_sharedBlocker"
            ),
        }
    )
    contract["files"] = files
    contract["role_map"] = role_map
    return contract


def _dependency_hashes() -> dict[str, str]:
    paths = {
        "round5_cegar_v32.py": HERE / "round5_cegar_v32.py",
        "schema_v32.json": HERE / "schema_v32.json",
        "test_round5_cegar_v32.py": HERE / "test_round5_cegar_v32.py",
        str(LEAN_FRONTIER_PATH.relative_to(v29.PROJECT_ROOT)): LEAN_FRONTIER_PATH,
        str(LEAN_CONTINUATION_PATH.relative_to(v29.PROJECT_ROOT)): LEAN_CONTINUATION_PATH,
        str(LEAN_LOCALIZATION_PATH.relative_to(v29.PROJECT_ROOT)): LEAN_LOCALIZATION_PATH,
        str(LEAN_ENDPOINT_FIBER_PATH.relative_to(v29.PROJECT_ROOT)): LEAN_ENDPOINT_FIBER_PATH,
    }
    return {name: file_sha256(path) for name, path in paths.items()}


def provenance() -> dict[str, object]:
    inherited = _BASE_V32_PROVENANCE()
    inherited.update(
        {
            "target": TARGET,
            "schema_version": SCHEMA_VERSION,
            "script_sha256": file_sha256(SCRIPT_PATH),
            "schema_sha256": file_sha256(SCHEMA_PATH),
            "v33_dependency_sha256": _dependency_hashes(),
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
                "encoding": "round5_cegar_v33.Encoding",
                "engine": "round5_cegar_v19.solve_case",
                "stable_seed": "sha256(base_seed, NUL, case_id) low 31 bits",
            },
            "endpoint_shared_blocker_seed_contract": {
                "scope": "exact n=15 ordinary fresh shared-blocker cross-hit arm",
                "j_domain": list(J_DOMAIN),
                "seed_cardinality": 6,
                "selected_rows": 15,
                "selected_row_width": 15,
                "semantic_boolean_delta": SEMANTIC_BOOL_DELTA,
                "new_family_counts": NEW_FAMILY_COUNTS,
                "full_circle_registration": False,
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
        raise RuntimeError(f"frozen provenance differs from v33 worker: {differing}")
    if expected_script_sha256 is not None and (
        current["script_sha256"] != expected_script_sha256
    ):
        raise RuntimeError("worker v33 source hash differs from parent invocation")
    return current


@contextlib.contextmanager
def _bound_v33_runtime() -> Iterator[None]:
    """Layer v33 identity, Bool-count, and tracker admission over v32."""
    with _BASE_V32_BOUND_RUNTIME():
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
            (v30, "expected_semantic_bool_count", expected_semantic_bool_count),
            (
                v17,
                "TRACKER_ALLOWLIST",
                v17.TRACKER_ALLOWLIST
                | {f"track_{family}" for family in NEW_FAMILIES},
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
    _BASE_V32_PROMOTE_ARTIFACTS(case_dir, result)
    mapping = {
        "cegar_trace_v32.json": "cegar_trace_v33.json",
        "boolean_prepass_v32.json": "boolean_prepass_v33.json",
        "boolean_master_v32.smt2.gz": "boolean_master_v33.smt2.gz",
        "full_frozen_v32.smt2.gz": "full_frozen_v33.smt2.gz",
        "witness_v32.json": "witness_v33.json",
        "assignment-journal-v32": "assignment-journal-v33",
    }
    for old, new in mapping.items():
        old_path = case_dir / old
        if old_path.exists():
            old_path.rename(case_dir / new)
        for key, value in list(result.items()):
            if value == old:
                result[key] = new
    journal = result.get("assignment_journal")
    if isinstance(journal, dict) and journal.get("directory") == (
        "assignment-journal-v32"
    ):
        journal["directory"] = "assignment-journal-v33"
    reason = result.get("reason_incomplete")
    if reason == "v32_assignment_budget_exhausted":
        result["reason_incomplete"] = "v33_assignment_budget_exhausted"
    elif reason == "v32_wall_clock_budget_exhausted":
        result["reason_incomplete"] = "v33_wall_clock_budget_exhausted"
    for key in ("cegar_trace_sha256", "boolean_prepass_sha256"):
        filename = result.get(key.removesuffix("_sha256") + "_file")
        if isinstance(filename, str) and (case_dir / filename).is_file():
            result[key] = file_sha256(case_dir / filename)
    blobs: dict[str, dict[str, str]] = {}
    for role, filename in (
        ("boolean_master", "boolean_master_v33.smt2.gz"),
        ("full_frozen", "full_frozen_v33.smt2.gz"),
    ):
        path = case_dir / filename
        if path.is_file():
            blobs[role] = {"file": filename, "sha256": file_sha256(path)}
    result["frozen_blob_hashes"] = blobs


def expected_semantic_bool_count(case: Case) -> int:
    case.validate()
    if case.arm != "fresh":
        raise ValueError("v33 semantic universe exists only for the fresh arm")
    # v32 delegates this calculation through v31 back to v30.  During a v33
    # solve, v30 is deliberately rebound to this function so that inherited
    # completeness checks see the enlarged formula.  Calling through v32 here
    # would therefore recurse; retain the original v30 counter as the base.
    return _BASE_V30_EXPECTED_SEMANTIC_BOOL_COUNT(case) + SEMANTIC_BOOL_DELTA


def _validate_complete_semantic_fixes(
    frozen_assertions: Sequence[z3.BoolRef], fixes: Sequence[v19.Fix]
) -> tuple[z3.BoolRef, ...]:
    return v32._validate_complete_semantic_fixes(frozen_assertions, fixes)


def check_complete_assignment(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[v19.Fix],
    timeout_ms: int,
    seed: int,
    iteration: int,
    frozen_full_formula_sha256: str | None = None,
) -> tuple[str, z3.ModelRef | None, tuple[v19.Fix, ...], dict[str, object]]:
    return _BASE_V32_CHECK_COMPLETE_ASSIGNMENT(
        frozen_assertions,
        fixes,
        timeout_ms,
        seed,
        iteration,
        frozen_full_formula_sha256,
    )


@contextlib.contextmanager
def _bound_v32_solve_dispatch() -> Iterator[None]:
    bindings: tuple[tuple[str, object], ...] = (
        ("Encoding", Encoding),
        ("_bound_v32_runtime", _bound_v33_runtime),
        ("_promote_artifacts", _promote_artifacts),
        ("check_complete_assignment", check_complete_assignment),
        ("expected_semantic_bool_count", expected_semantic_bool_count),
        ("source_contract", source_contract),
        ("provenance", provenance),
        ("verify_frozen_provenance", verify_frozen_provenance),
    )
    previous = [(name, getattr(v32, name)) for name, _ in bindings]
    for name, value in bindings:
        setattr(v32, name, value)
    try:
        yield
    finally:
        for name, value in reversed(previous):
            setattr(v32, name, value)


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
    if case.arm != "fresh":
        raise ValueError("v33 admits only the ordinary fresh arm")
    with _bound_v32_solve_dispatch():
        result = _BASE_V32_SOLVE_CASE(
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
        "v29 physical-shell Bool+LRA+PB plus v31/v32 theorem cuts and the v33 "
        "exact-fifteen endpoint shared-blocker dynamic selected-seed escape; "
        "complete Boolean assignment with dual raw replay"
    )
    result["solver_lane"] = (
        "v32-composed replay-authenticated runtime over v33.Encoding"
    )
    adapter = result.get("adapter_contract")
    if not isinstance(adapter, dict):
        adapter = {}
        result["adapter_contract"] = adapter
    adapter.update(
        {
            "encoding": "round5_cegar_v33.Encoding",
            "engine": "round5_cegar_v19.solve_case",
            "semantic_bool_count": expected_semantic_bool_count(case),
            "semantic_bool_count_formula": (
                f"780 + 15 * profiles.count('D') + {SEMANTIC_BOOL_DELTA}"
            ),
            "acute_family": ACUTE_FAMILY,
            "acute_clause_count": 8,
            "s_profile_family": S_PROFILE_FAMILY,
            "s_profile_clause_count": v32.expected_s_profile_clause_count(case),
            "endpoint_seed_families": list(NEW_FAMILIES),
            "endpoint_seed_family_counts": NEW_FAMILY_COUNTS,
        }
    )
    v12.write_json(out_dir / case.case_id / "result.json", result)
    return result


def stable_case_seed(base_seed: int, case_id: str) -> int:
    return v32.stable_case_seed(base_seed, case_id)


def _worker_attestation(frozen: dict[str, object]) -> dict[str, object]:
    current = provenance()
    if current != frozen:
        raise RuntimeError("v33 worker source differs from frozen parent provenance")
    return {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": current["script_sha256"],
        "provenance_sha256": canonical_sha256(current),
        "encoding_class": "round5_cegar_v33.Encoding",
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
    with _bound_v33_runtime():
        encoding = Encoding(case, timeout_ms=1, seed=97)
        solver, _ = encoding.make_solver()
        semantic_names = {
            str(item) for item in v16.collect_semantic_bools(solver.assertions())
        }
        return {
            **_worker_attestation(provenance()),
            "case_id": case.case_id,
            "semantic_bool_count": len(semantic_names),
            "v33_semantic_prefix_counts": {
                "endpoint_j": sum(
                    name.startswith("endpoint_j_") for name in semantic_names
                ),
                "endpoint_qrow": sum(
                    name.startswith("endpoint_qrow_") for name in semantic_names
                ),
                "endpoint_qsel": sum(
                    name.startswith("endpoint_qsel_") for name in semantic_names
                ),
            },
            "constraint_counts": encoding.constraint_counts(),
            "v12_encoding_bound": v12.Encoding is Encoding,
            "v16_encoding_bound": v16.Encoding is Encoding,
            "v19_provenance_bound": v19.provenance is provenance,
            "v30_count_bound": v30.expected_semantic_bool_count
            is expected_semantic_bool_count,
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
            "semantic Boolean count does not match v33 case profile: "
            f"expected {expected_count}"
        )
    adapter = result.get("adapter_contract")
    if not isinstance(adapter, dict):
        errors.append("missing adapter contract")
    else:
        if adapter.get("encoding") != "round5_cegar_v33.Encoding":
            errors.append("adapter encoding mismatch")
        if adapter.get("engine") != "round5_cegar_v19.solve_case":
            errors.append("adapter engine mismatch")
        if adapter.get("semantic_bool_count") != expected_count:
            errors.append("adapter semantic Boolean count mismatch")
        if adapter.get("acute_clause_count") != 8:
            errors.append("adapter acute clause count mismatch")
        if adapter.get("s_profile_clause_count") != (
            v32.expected_s_profile_clause_count(case)
        ):
            errors.append("adapter S-profile clause count mismatch")
        if adapter.get("endpoint_seed_family_counts") != NEW_FAMILY_COUNTS:
            errors.append("adapter endpoint family counts mismatch")

    counts = result.get("constraint_counts")
    if not isinstance(counts, dict):
        errors.append("missing constraint counts")
    else:
        if counts.get("global_K4") != 465:
            errors.append("global_K4 contract count is not 465")
        if counts.get("nonapex_global_k4_squared_superadditivity") != 4368:
            errors.append("superadditivity contract count is not 4368")
        if counts.get(ACUTE_FAMILY, 0) != 8:
            errors.append("acute-family contract count is not 8")
        if counts.get(S_PROFILE_FAMILY, 0) != (
            v32.expected_s_profile_clause_count(case)
        ):
            errors.append("S-profile contract count mismatch")
        for family, expected in NEW_FAMILY_COUNTS.items():
            if counts.get(family, 0) != expected:
                errors.append(f"{family} contract count is not {expected}")

    attestation = result.get("worker_attestation")
    expected_attestation = {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": frozen["script_sha256"],
        "provenance_sha256": canonical_sha256(frozen),
        "encoding_class": "round5_cegar_v33.Encoding",
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
def _bound_v32_matrix_dispatch() -> Iterator[None]:
    bindings: tuple[tuple[str, object], ...] = (
        ("provenance", provenance),
        ("verify_frozen_provenance", verify_frozen_provenance),
        ("_worker", _worker),
        ("_validate_child_result", _validate_child_result),
        ("expected_semantic_bool_count", expected_semantic_bool_count),
    )
    previous = [(name, getattr(v32, name)) for name, _ in bindings]
    old_v30_expected = v30.expected_semantic_bool_count
    for name, value in bindings:
        setattr(v32, name, value)
    v30.expected_semantic_bool_count = expected_semantic_bool_count
    try:
        yield
    finally:
        v30.expected_semantic_bool_count = old_v30_expected
        for name, value in reversed(previous):
            setattr(v32, name, value)


def run_matrix(
    args: argparse.Namespace,
    cases: Sequence[Case],
    command: str,
    source_summary: Path | None = None,
    source_summary_sha256: str | None = None,
) -> int:
    if any(case.arm != "fresh" for case in cases):
        raise ValueError("v33 matrix admits only ordinary fresh cases")
    with _bound_v32_matrix_dispatch():
        return _BASE_V32_RUN_MATRIX(
            args,
            cases,
            command,
            source_summary,
            source_summary_sha256,
        )


def fresh_cases() -> list[Case]:
    return [case for case in v8.all_cases() if case.arm == "fresh"]


def parser() -> argparse.ArgumentParser:
    parser = v32.parser()
    parser.description = __doc__
    for action in parser._actions:
        if isinstance(action, argparse._SubParsersAction):
            for unsupported in ("secondcap-matrix", "retry"):
                action.choices.pop(unsupported, None)
            action._choices_actions = [
                choice
                for choice in action._choices_actions
                if choice.dest not in {"secondcap-matrix", "retry"}
            ]
            for subparser in action.choices.values():
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = DEFAULT_ARTIFACT_DIR
                    elif subaction.dest == "arm":
                        subaction.choices = ("fresh",)
    return parser


def main() -> int:
    args = parser().parse_args()
    if args.command == "smoke":
        args.workers = 1
        return run_matrix(args, [Case("fresh", "SSS", 0, 1, 2)], "smoke")
    if args.command == "case":
        args.workers = 1
        case = Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
        return run_matrix(args, [case], "case")
    if args.command == "matrix":
        return run_matrix(args, fresh_cases(), "matrix")
    raise AssertionError(args.command)


if __name__ == "__main__":
    raise SystemExit(main())
