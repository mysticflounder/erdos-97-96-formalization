"""Round-5 v35: nonapex full-shell transitivity over the frozen v34 slice.

This successor keeps v34's tracker-admission repair and adds the approved
six-literal full-shell transitivity family.  For every ordered distinct triple
of nonapex centers ``P, C, M``, five shell memberships imply the sixth. There
are ``12 * 11 * 10 = 1320`` clauses and no new semantic Booleans.
"""

from __future__ import annotations

import argparse
import contextlib
import hashlib
import itertools
import json
import multiprocessing
import os
import subprocess
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
import round5_cegar_v30 as v30
import round5_cegar_v32 as v32
import round5_cegar_v33 as v33
import round5_cegar_v34_telemetry as telemetry

HERE = Path(__file__).resolve().parent
TARGET = v33.TARGET
SCHEMA_VERSION = 35
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v35.json"
TEST_PATH = HERE / "test_round5_cegar_v35.py"
TELEMETRY_PATH = HERE / "round5_cegar_v34_telemetry.py"
TELEMETRY_TEST_PATH = HERE / "test_round5_cegar_v34_telemetry.py"
FOCUSED_TEST_COMMAND = (
    "PYTHONDONTWRITEBYTECODE=1 uv run --with pytest pytest -q "
    "-p no:cacheprovider "
    "test_round5_cegar_v35.py test_round5_cegar_v34_telemetry.py"
)
WORKER_MODULE_ID = "round5_cegar_v35"
DEFAULT_ARTIFACT_DIR = HERE / "artifacts-v35-nonapex-transitivity"
ARTIFACT_NAMES = {
    "assignment_journal": "assignment-journal-v35",
    "boolean_master": "boolean_master_v35.smt2.gz",
    "boolean_prepass": "boolean_prepass_v35.json",
    "cegar_trace": "cegar_trace_v35.json",
    "full_frozen": "full_frozen_v35.smt2.gz",
    "witness": "witness_v35.json",
}

Case = v33.Case
ACUTE_FAMILY = v33.ACUTE_FAMILY
S_PROFILE_FAMILY = v33.S_PROFILE_FAMILY
NONAPEX_TRANSITIVITY_FAMILY = "nonapex_global_k4_full_shell_transitivity"
NONAPEX_TRANSITIVITY_COUNT = 1320
NEW_FAMILIES = v33.NEW_FAMILIES
NEW_FAMILY_COUNTS = v33.NEW_FAMILY_COUNTS
SEMANTIC_BOOL_DELTA = v33.SEMANTIC_BOOL_DELTA
HARD_CANARY_ROLE_TRIPLES = (
    (0, 2, 1),
    (0, 2, 3),
    (0, 3, 1),
    (0, 3, 2),
    (1, 3, 0),
    (1, 3, 2),
    (2, 0, 1),
    (2, 0, 3),
    (3, 0, 1),
    (3, 0, 2),
    (3, 1, 0),
    (3, 1, 2),
)

# Capture every predecessor callable before any dispatch rebinding.  Calling a
# dynamically rebound v33 attribute from its v34 replacement would recurse.
_BASE_V33_SOURCE_CONTRACT = v33.source_contract
_BASE_V33_PROVENANCE = v33.provenance
_BASE_V33_BOUND_RUNTIME = v33._bound_v33_runtime
_BASE_V33_PROMOTE_ARTIFACTS = v33._promote_artifacts
_BASE_V33_EXPECTED_SEMANTIC_BOOL_COUNT = v33.expected_semantic_bool_count
_BASE_V33_CHECK_COMPLETE_ASSIGNMENT = v33.check_complete_assignment
_BASE_V33_SOLVE_CASE = v33.solve_case
_BASE_V33_RUN_MATRIX = v33.run_matrix


class Encoding(v33.Encoding):
    """The v34 tracker repair plus nonapex full-shell transitivity."""

    def _build_rich_apices(self) -> None:
        super()._build_rich_apices()
        # DDD has no S-profile clauses.  Keeping the empty family key makes
        # v8.make_solver emit its allowlisted provenance tracker as a tautology.
        self.groups.setdefault(S_PROFILE_FAMILY, [])
        # For ordered distinct nonapex centers P,C,M, the five shell
        # memberships k4[P,C], k4[P,M], k4[C,P], k4[C,M], k4[M,C] imply
        # k4[M,P].  Nonapex k4 atoms are exact full-shell memberships in v29.
        for p, c, m in itertools.permutations(v8.NONAPICES, 3):
            self.add(
                NONAPEX_TRANSITIVITY_FAMILY,
                z3.Or(
                    z3.Not(self.k4[p, c]),
                    z3.Not(self.k4[p, m]),
                    z3.Not(self.k4[c, p]),
                    z3.Not(self.k4[c, m]),
                    z3.Not(self.k4[m, c]),
                    self.k4[m, p],
                ),
            )


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return v33.canonical_sha256(value)


TRANSITIVITY_LEAN_PATH = (
    v8.PROJECT_ROOT
    / "lean/Erdos9796Proof/P97/ATail/MutualShellPairSharedMember.lean"
)


def source_contract() -> dict[str, object]:
    contract = _BASE_V33_SOURCE_CONTRACT()
    files = dict(contract["files"])
    files["nonapex_full_shell_transitivity_adapter"] = {
        "path": str(TRANSITIVITY_LEAN_PATH.relative_to(v8.PROJECT_ROOT)),
        "sha256": file_sha256(TRANSITIVITY_LEAN_PATH),
    }
    role_map = dict(contract["role_map"])
    role_map[NONAPEX_TRANSITIVITY_FAMILY] = (
        "Problem97.false_of_mutualClassPair_sharedMember_thirdClassExcludes; "
        "instantiated for every ordered distinct nonapex triple P,C,M, with "
        "v29 exact full-shell k4 semantics at all three centers"
    )
    contract["files"] = files
    contract["role_map"] = role_map
    return contract


def _provenance_source_paths() -> dict[str, Path]:
    """Return every file-backed source used by the transitive v35 contract."""
    local_names = (
        "round5_cegar_v8.py",
        "round5_cegar_v9.py",
        "round5_cegar_v12.py",
        "round5_cegar_v13.py",
        "round5_cegar_v14.py",
        "round5_cegar_v15.py",
        "round5_cegar_v16.py",
        "round5_cegar_v17.py",
        "round5_cegar_v18.py",
        "round5_cegar_v19.py",
        "round5_cegar_v29.py",
        "round5_cegar_v30.py",
        "round5_cegar_v31.py",
        "round5_cegar_v32.py",
        "round5_cegar_v33.py",
        "round5_cegar_v34.py",
        "round5_cegar_v35.py",
        "round5_cegar_v34_telemetry.py",
        "schema_v8.json",
        "schema_v9.json",
        "schema_v12.json",
        "schema_v13.json",
        "schema_v14.json",
        "schema_v15.json",
        "schema_v16.json",
        "schema_v17.json",
        "schema_v18.json",
        "schema_v19.json",
        "schema_v29.json",
        "schema_v30.json",
        "schema_v31.json",
        "schema_v32.json",
        "schema_v33.json",
        "schema_v34.json",
        "schema_v35.json",
        "test_round5_cegar_v19.py",
        "test_round5_cegar_v29.py",
        "test_round5_cegar_v30.py",
        "test_round5_cegar_v31.py",
        "test_round5_cegar_v32.py",
        "test_round5_cegar_v33.py",
        "test_round5_cegar_v34.py",
        "test_round5_cegar_v35.py",
        "test_round5_cegar_v34_telemetry.py",
        "uv.lock",
    )
    paths = {name: HERE / name for name in local_names}
    for entry in source_contract()["files"].values():
        relative = str(entry["path"])
        paths[relative] = v8.PROJECT_ROOT / relative
    return dict(sorted(paths.items()))


def _git_head_blobs(relative_paths: Sequence[str]) -> dict[str, bytes]:
    """Read raw HEAD blobs in one batch; missing paths fail closed."""
    request = b"".join(f"HEAD:{path}\n".encode() for path in relative_paths)
    completed = subprocess.run(
        ["git", "cat-file", "--batch"],
        cwd=v8.PROJECT_ROOT,
        input=request,
        capture_output=True,
        check=False,
    )
    if completed.returncode != 0:
        detail = completed.stderr.decode(errors="replace").strip()
        raise RuntimeError(f"could not read provenance sources from HEAD: {detail}")
    blobs: dict[str, bytes] = {}
    cursor = 0
    for relative in relative_paths:
        line_end = completed.stdout.find(b"\n", cursor)
        if line_end < 0:
            raise RuntimeError(f"invalid git cat-file response for {relative}")
        header = completed.stdout[cursor:line_end].decode(errors="replace")
        cursor = line_end + 1
        fields = header.rsplit(" ", 2)
        if len(fields) != 3 or fields[1] != "blob":
            raise RuntimeError(f"provenance source is not tracked at HEAD: {relative}")
        try:
            size = int(fields[2])
        except ValueError as exc:
            raise RuntimeError(f"invalid HEAD blob size for {relative}") from exc
        end = cursor + size
        if end >= len(completed.stdout) or completed.stdout[end : end + 1] != b"\n":
            raise RuntimeError(f"truncated HEAD blob for {relative}")
        blobs[relative] = completed.stdout[cursor:end]
        cursor = end + 1
    if cursor != len(completed.stdout):
        raise RuntimeError("unexpected trailing git cat-file output")
    return blobs


def _verified_head_source_hashes() -> dict[str, str]:
    """Fail unless every provenance source equals its raw tracked HEAD blob."""
    paths = _provenance_source_paths()
    project_root = v8.PROJECT_ROOT.resolve()
    relative_paths = {
        name: path.resolve().relative_to(project_root).as_posix()
        for name, path in paths.items()
    }
    blobs = _git_head_blobs(tuple(relative_paths.values()))
    hashes: dict[str, str] = {}
    for name, path in paths.items():
        relative = relative_paths[name]
        try:
            worktree = path.read_bytes()
        except OSError as exc:
            raise RuntimeError(f"cannot read provenance source: {relative}") from exc
        if worktree != blobs[relative]:
            raise RuntimeError(f"provenance source differs from HEAD: {relative}")
        hashes[relative] = hashlib.sha256(worktree).hexdigest()
    return dict(sorted(hashes.items()))


def _git_head_commit() -> str:
    """Return the exact commit whose blobs passed the source-frozen gate."""
    completed = subprocess.run(
        ["git", "rev-parse", "--verify", "HEAD"],
        cwd=v8.PROJECT_ROOT,
        capture_output=True,
        check=False,
        text=True,
    )
    commit = completed.stdout.strip()
    if (
        completed.returncode != 0
        or len(commit) not in (40, 64)
        or any(character not in "0123456789abcdef" for character in commit)
    ):
        detail = completed.stderr.strip()
        raise RuntimeError(f"could not identify source-frozen HEAD commit: {detail}")
    return commit


def _focused_test_attestation() -> dict[str, object]:
    schema = json.loads(SCHEMA_PATH.read_text())
    attestation = schema.get("focused_test_attestation")
    if not isinstance(attestation, dict):
        raise TypeError("schema_v35 lacks a structured focused-test attestation")
    if attestation.get("command") != FOCUSED_TEST_COMMAND:
        raise RuntimeError("focused-test attestation command mismatch")
    return attestation


def _dependency_hashes() -> dict[str, str]:
    paths = {
        "round5_cegar_v34.py": HERE / "round5_cegar_v34.py",
        "schema_v34.json": HERE / "schema_v34.json",
        "test_round5_cegar_v34.py": HERE / "test_round5_cegar_v34.py",
    }
    return {name: file_sha256(path) for name, path in paths.items()}


def _telemetry_hashes() -> dict[str, str]:
    return {
        TELEMETRY_PATH.name: file_sha256(TELEMETRY_PATH),
        TELEMETRY_TEST_PATH.name: file_sha256(TELEMETRY_TEST_PATH),
        "installed_executable_source": telemetry.telemetry_source_sha256(),
    }


def provenance() -> dict[str, object]:
    head_source_sha256 = _verified_head_source_hashes()
    git_head_commit = _git_head_commit()
    focused_test_attestation = _focused_test_attestation()
    inherited = _BASE_V33_PROVENANCE()
    # v34 replaces the inherited optional ignored log with the required,
    # tracked structured attestation embedded in schema_v34.json.
    inherited.pop("focused_test_log", None)
    inherited.pop("focused_test_log_sha256", None)
    inherited.update(
        {
            "target": TARGET,
            "schema_version": SCHEMA_VERSION,
            "script_sha256": file_sha256(SCRIPT_PATH),
            "schema_sha256": file_sha256(SCHEMA_PATH),
            "v35_dependency_sha256": _dependency_hashes(),
            "focused_test_source": TEST_PATH.name,
            "focused_test_source_sha256": file_sha256(TEST_PATH),
            "focused_test_command": FOCUSED_TEST_COMMAND,
            "focused_test_attestation": focused_test_attestation,
            "focused_test_attestation_sha256": canonical_sha256(
                focused_test_attestation
            ),
            "git_head_commit": git_head_commit,
            "head_source_sha256": head_source_sha256,
            "artifact_contract": {
                "default_directory": DEFAULT_ARTIFACT_DIR.name,
                "names": ARTIFACT_NAMES,
            },
            "spawn_contract": {
                "worker_range": [1, 24],
                "start_method": "spawn",
                "worker_module": WORKER_MODULE_ID,
                "encoding": "round5_cegar_v35.Encoding",
                "engine": "round5_cegar_v19.solve_case",
                "stable_seed": "sha256(base_seed, NUL, case_id) low 31 bits",
            },
            "tracker_admission_repair_contract": {
                "scope": "DDD has zero S-profile clauses",
                "family": S_PROFILE_FAMILY,
                "materialization": "empty group tracked as a tautological conjunction",
                "semantic_constraint_delta": 0,
                "semantic_boolean_delta": 0,
                "expected_semantic_boolean_count": (
                    "1031 + 15 * profiles.count('D')"
                ),
            },
            "hard_canary_contract": {
                "profiles": ["DDD"],
                "default_profile": "DDD",
                "role_triples": [list(triple) for triple in HARD_CANARY_ROLE_TRIPLES],
                "delegation": "one run_matrix call",
            },
            "nonapex_full_shell_transitivity_contract": {
                "family": NONAPEX_TRANSITIVITY_FAMILY,
                "ordered_distinct_nonapex_centers": 1320,
                "clause_shape": "not k4[P,C] or not k4[P,M] or not k4[C,P] or not k4[C,M] or not k4[M,C] or k4[M,P]",
                "semantic_constraint_delta": 1320,
                "semantic_boolean_delta": 0,
                "requires_full_nonapex_shell_semantics": True,
            },
            "runtime_telemetry_contract": {
                "schema": telemetry.TELEMETRY_SCHEMA,
                "hashes": _telemetry_hashes(),
                "durability": "hash-chained assignment outcome records",
                "result_summary": "runtime_telemetry with durable payload hash",
                "normalization_identity_effect": "none",
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
        raise RuntimeError(f"frozen provenance differs from v35 worker: {differing}")
    if expected_script_sha256 is not None and (
        current["script_sha256"] != expected_script_sha256
    ):
        raise RuntimeError("worker v35 source hash differs from parent invocation")
    return current


@contextlib.contextmanager
def _bound_v35_runtime() -> Iterator[None]:
    """Layer v35 identity over the captured, nonrecursive v33 runtime."""
    with _BASE_V33_BOUND_RUNTIME():
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
                | {
                    f"track_{S_PROFILE_FAMILY}",
                    f"track_{NONAPEX_TRANSITIVITY_FAMILY}",
                },
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
    _BASE_V33_PROMOTE_ARTIFACTS(case_dir, result)
    mapping = {
        "cegar_trace_v33.json": "cegar_trace_v35.json",
        "boolean_prepass_v33.json": "boolean_prepass_v35.json",
        "boolean_master_v33.smt2.gz": "boolean_master_v35.smt2.gz",
        "full_frozen_v33.smt2.gz": "full_frozen_v35.smt2.gz",
        "witness_v33.json": "witness_v35.json",
        "assignment-journal-v33": "assignment-journal-v35",
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
        "assignment-journal-v33"
    ):
        journal["directory"] = "assignment-journal-v35"
    reason = result.get("reason_incomplete")
    if reason == "v33_assignment_budget_exhausted":
        result["reason_incomplete"] = "v35_assignment_budget_exhausted"
    elif reason == "v33_wall_clock_budget_exhausted":
        result["reason_incomplete"] = "v35_wall_clock_budget_exhausted"
    for key in ("cegar_trace_sha256", "boolean_prepass_sha256"):
        filename = result.get(key.removesuffix("_sha256") + "_file")
        if isinstance(filename, str) and (case_dir / filename).is_file():
            result[key] = file_sha256(case_dir / filename)
    blobs: dict[str, dict[str, str]] = {}
    for role, filename in (
        ("boolean_master", "boolean_master_v35.smt2.gz"),
        ("full_frozen", "full_frozen_v35.smt2.gz"),
    ):
        path = case_dir / filename
        if path.is_file():
            blobs[role] = {"file": filename, "sha256": file_sha256(path)}
    result["frozen_blob_hashes"] = blobs


def expected_semantic_bool_count(case: Case) -> int:
    """The exact v33 semantic universe; provenance trackers do not count."""
    return _BASE_V33_EXPECTED_SEMANTIC_BOOL_COUNT(case)


def check_complete_assignment(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[v19.Fix],
    timeout_ms: int,
    seed: int,
    iteration: int,
    frozen_full_formula_sha256: str | None = None,
) -> tuple[str, z3.ModelRef | None, tuple[v19.Fix, ...], dict[str, object]]:
    return _BASE_V33_CHECK_COMPLETE_ASSIGNMENT(
        frozen_assertions,
        fixes,
        timeout_ms,
        seed,
        iteration,
        frozen_full_formula_sha256,
    )


def _assert_reconciled_runtime(node: object, label: str) -> None:
    if not isinstance(node, dict):
        raise TypeError(f"{label} telemetry is not an object")
    phases = node.get("phases", node.get("top_level_phases"))
    if not isinstance(phases, dict):
        raise TypeError(f"{label} telemetry has no phase map")
    values = list(phases.values())
    if any(isinstance(value, bool) or not isinstance(value, (int, float)) for value in values):
        raise RuntimeError(f"{label} telemetry has a nonnumeric phase")
    measured = float(node.get("measured_phase_seconds", -1.0))
    total = float(node.get("total_seconds", -1.0))
    unattributed = float(node.get("unattributed_seconds", -1.0))
    phase_sum = sum(float(value) for value in values)
    tolerance = 1e-9 * max(1.0, phase_sum, total)
    if min(measured, total, unattributed, *[float(value) for value in values]) < 0:
        raise RuntimeError(f"{label} telemetry has a negative duration")
    if abs(measured - phase_sum) > tolerance:
        raise RuntimeError(f"{label} telemetry measured phases do not reconcile")
    if abs(unattributed - max(0.0, total - measured)) > tolerance:
        raise RuntimeError(f"{label} telemetry unattributed time does not reconcile")


def _durable_telemetry_summary(
    case_dir: Path, result: dict[str, object]
) -> dict[str, object]:
    journal_summary = result.get("assignment_journal")
    if not isinstance(journal_summary, dict):
        raise TypeError("v35 telemetry requires an assignment journal summary")
    directory = journal_summary.get("directory")
    if not isinstance(directory, str):
        raise TypeError("v35 telemetry journal directory is missing")
    recovered = v19.AssignmentJournal(case_dir / directory).recover()
    completed = recovered.get("completed")
    if not isinstance(completed, list):
        raise TypeError("v35 telemetry journal completed set is invalid")
    payloads: list[dict[str, object]] = []
    for index, outcome in enumerate(completed):
        if not isinstance(outcome, dict):
            raise TypeError("v35 telemetry outcome is not an object")
        runtime = outcome.get("runtime_telemetry")
        if not isinstance(runtime, dict):
            raise TypeError(f"v35 telemetry missing from outcome {index}")
        _assert_reconciled_runtime(runtime, f"outcome {index}")
        checks = runtime.get("checks")
        reconstructions = runtime.get("reconstructions")
        if not isinstance(checks, list) or not isinstance(reconstructions, list):
            raise TypeError(f"v35 telemetry event lists missing from outcome {index}")
        for check_index, check in enumerate(checks):
            _assert_reconciled_runtime(check, f"outcome {index} check {check_index}")
            if isinstance(check, dict) and isinstance(check.get("normalization"), dict):
                _assert_reconciled_runtime(
                    check["normalization"],
                    f"outcome {index} check {check_index} normalization",
                )
        for reconstruction_index, reconstruction in enumerate(reconstructions):
            _assert_reconciled_runtime(
                reconstruction,
                f"outcome {index} reconstruction {reconstruction_index}",
            )
        payloads.append(runtime)
    if journal_summary.get("completed_assignment_count") != len(payloads):
        raise RuntimeError("v35 telemetry count differs from journal summary")
    return {
        "schema_version": telemetry.TELEMETRY_SCHEMA_VERSION,
        "telemetry_source_sha256": telemetry.telemetry_source_sha256(),
        "completed_assignment_count": len(payloads),
        "durable_payload_sha256": canonical_sha256(payloads),
        "reconciled": True,
    }


@contextlib.contextmanager
def _bound_v33_solve_dispatch() -> Iterator[None]:
    bindings: tuple[tuple[str, object], ...] = (
        ("Encoding", Encoding),
        ("_bound_v33_runtime", _bound_v35_runtime),
        ("_promote_artifacts", _promote_artifacts),
        ("check_complete_assignment", check_complete_assignment),
        ("expected_semantic_bool_count", expected_semantic_bool_count),
        ("source_contract", source_contract),
        ("provenance", provenance),
        ("verify_frozen_provenance", verify_frozen_provenance),
    )
    previous = [(name, getattr(v33, name)) for name, _ in bindings]
    for name, value in bindings:
        setattr(v33, name, value)
    try:
        yield
    finally:
        for name, value in reversed(previous):
            setattr(v33, name, value)


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
        raise ValueError("v35 admits only the ordinary fresh arm")
    with telemetry.installed(), _bound_v33_solve_dispatch():
        result = _BASE_V33_SOLVE_CASE(
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
        "v34 formula plus six-literal nonapex full-shell transitivity; "
        "complete Boolean assignment with dual raw replay"
    )
    result["solver_lane"] = "v33-composed replay-authenticated runtime over v35.Encoding"
    adapter = result.get("adapter_contract")
    if not isinstance(adapter, dict):
        adapter = {}
        result["adapter_contract"] = adapter
    adapter.update(
        {
            "encoding": "round5_cegar_v35.Encoding",
            "engine": "round5_cegar_v19.solve_case",
            "semantic_bool_count": expected_semantic_bool_count(case),
            "semantic_bool_count_formula": "1031 + 15 * profiles.count('D')",
            "tracker_admission_repair": "empty S-profile family key for DDD",
            "nonapex_transitivity_family": NONAPEX_TRANSITIVITY_FAMILY,
            "nonapex_transitivity_clause_count": NONAPEX_TRANSITIVITY_COUNT,
            "nonapex_transitivity_clause_shape": (
                "not k4[P,C] or not k4[P,M] or not k4[C,P] or not k4[C,M] "
                "or not k4[M,C] or k4[M,P]"
            ),
        }
    )
    result["runtime_telemetry"] = _durable_telemetry_summary(
        out_dir / case.case_id, result
    )
    v12.write_json(out_dir / case.case_id / "result.json", result)
    return result


def stable_case_seed(base_seed: int, case_id: str) -> int:
    return v33.stable_case_seed(base_seed, case_id)


def _worker_attestation(frozen: dict[str, object]) -> dict[str, object]:
    current = provenance()
    if current != frozen:
        raise RuntimeError("v35 worker source differs from frozen parent provenance")
    return {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": current["script_sha256"],
        "provenance_sha256": canonical_sha256(current),
        "encoding_class": "round5_cegar_v35.Encoding",
        "engine": "round5_cegar_v19.solve_case",
        "telemetry_source_sha256": telemetry.telemetry_source_sha256(),
        "telemetry_file_sha256": file_sha256(TELEMETRY_PATH),
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
    with _bound_v35_runtime():
        encoding = Encoding(case, timeout_ms=1, seed=97)
        solver, _ = encoding.make_solver()
        semantic_names = {
            str(item) for item in v16.collect_semantic_bools(solver.assertions())
        }
        tracker_names = set(v16.collect_tracker_names(solver.assertions()))
        return {
            **_worker_attestation(provenance()),
            "case_id": case.case_id,
            "semantic_bool_count": len(semantic_names),
            "s_profile_clause_count": len(encoding.groups[S_PROFILE_FAMILY]),
            "s_profile_tracker_present": f"track_{S_PROFILE_FAMILY}" in tracker_names,
            "nonapex_transitivity_clause_count": len(
                encoding.groups[NONAPEX_TRANSITIVITY_FAMILY]
            ),
            "nonapex_transitivity_tracker_present": (
                f"track_{NONAPEX_TRANSITIVITY_FAMILY}" in tracker_names
            ),
            "tracker_allowlist_exact": tracker_names == v17.TRACKER_ALLOWLIST,
            "v35_semantic_prefix_counts": {
                "endpoint_j": sum(name.startswith("endpoint_j_") for name in semantic_names),
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
            "semantic Boolean count does not match v35 case profile: "
            f"expected {expected_count}"
        )
    adapter = result.get("adapter_contract")
    if not isinstance(adapter, dict):
        errors.append("missing adapter contract")
    else:
        if adapter.get("encoding") != "round5_cegar_v35.Encoding":
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
        if adapter.get("nonapex_transitivity_family") != NONAPEX_TRANSITIVITY_FAMILY:
            errors.append("adapter transitivity family mismatch")
        if adapter.get("nonapex_transitivity_clause_count") != NONAPEX_TRANSITIVITY_COUNT:
            errors.append("adapter transitivity count mismatch")

    counts = result.get("constraint_counts")
    if not isinstance(counts, dict):
        errors.append("missing constraint counts")
    else:
        if counts.get("global_K4") != 465:
            errors.append("global_K4 contract count is not 465")
        if counts.get("nonapex_global_k4_squared_superadditivity") != 4368:
            errors.append("superadditivity contract count is not 4368")
        if counts.get(NONAPEX_TRANSITIVITY_FAMILY) != NONAPEX_TRANSITIVITY_COUNT:
            errors.append("nonapex transitivity contract count is not 1320")
        if counts.get(ACUTE_FAMILY, 0) != 8:
            errors.append("acute-family contract count is not 8")
        if counts.get(S_PROFILE_FAMILY) != v32.expected_s_profile_clause_count(case):
            errors.append("S-profile contract count mismatch or family key absent")
        for family, expected in NEW_FAMILY_COUNTS.items():
            if counts.get(family, 0) != expected:
                errors.append(f"{family} contract count is not {expected}")

    attestation = result.get("worker_attestation")
    expected_attestation = {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": frozen["script_sha256"],
        "provenance_sha256": canonical_sha256(frozen),
        "encoding_class": "round5_cegar_v35.Encoding",
        "engine": "round5_cegar_v19.solve_case",
        "telemetry_source_sha256": telemetry.telemetry_source_sha256(),
        "telemetry_file_sha256": file_sha256(TELEMETRY_PATH),
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
    runtime_telemetry = result.get("runtime_telemetry")
    if not isinstance(runtime_telemetry, dict):
        errors.append("missing durable runtime telemetry summary")
    else:
        try:
            durable = _durable_telemetry_summary(result_path.parent, result)
        except (OSError, RuntimeError, TypeError, ValueError) as exc:
            errors.append(f"invalid durable runtime telemetry: {exc}")
        else:
            if runtime_telemetry != durable:
                errors.append("runtime telemetry summary differs from journal")
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
def _bound_v33_matrix_dispatch() -> Iterator[None]:
    bindings: tuple[tuple[str, object], ...] = (
        ("provenance", provenance),
        ("verify_frozen_provenance", verify_frozen_provenance),
        ("_worker", _worker),
        ("_validate_child_result", _validate_child_result),
        ("expected_semantic_bool_count", expected_semantic_bool_count),
    )
    previous = [(name, getattr(v33, name)) for name, _ in bindings]
    old_v30_expected = v30.expected_semantic_bool_count
    for name, value in bindings:
        setattr(v33, name, value)
    v30.expected_semantic_bool_count = expected_semantic_bool_count
    try:
        yield
    finally:
        v30.expected_semantic_bool_count = old_v30_expected
        for name, value in reversed(previous):
            setattr(v33, name, value)


def run_matrix(
    args: argparse.Namespace,
    cases: Sequence[Case],
    command: str,
    source_summary: Path | None = None,
    source_summary_sha256: str | None = None,
) -> int:
    if any(case.arm != "fresh" for case in cases):
        raise ValueError("v35 matrix admits only ordinary fresh cases")
    with _bound_v33_matrix_dispatch():
        return _BASE_V33_RUN_MATRIX(
            args, cases, command, source_summary, source_summary_sha256
        )


def fresh_cases() -> list[Case]:
    return [case for case in v8.all_cases() if case.arm == "fresh"]


def hard_canary_cases(profiles: str = "DDD") -> list[Case]:
    """Return the audited hard-canary slice in its fixed deterministic order."""
    if profiles != "DDD":
        raise ValueError("v35 hard-canary admits only the DDD profile")
    cases = [
        Case("fresh", profiles, kept, deleted, fresh)
        for kept, deleted, fresh in HARD_CANARY_ROLE_TRIPLES
    ]
    if len({case.case_id for case in cases}) != len(HARD_CANARY_ROLE_TRIPLES):
        raise AssertionError("v35 hard-canary role triples are not unique")
    return cases


def parser() -> argparse.ArgumentParser:
    parser = v33.parser()
    parser.description = __doc__
    for action in parser._actions:
        if isinstance(action, argparse._SubParsersAction):
            matrix_parser = action.choices["matrix"]
            hard_canary = action.add_parser(
                "hard-canary", parents=[matrix_parser], add_help=False
            )
            hard_canary.add_argument(
                "--profiles", choices=("DDD",), default="DDD"
            )
            for subparser in action.choices.values():
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = DEFAULT_ARTIFACT_DIR
    return parser


def dispatch(args: argparse.Namespace) -> int:
    if args.command == "smoke":
        args.workers = 1
        return run_matrix(args, [Case("fresh", "DDD", 0, 2, 1)], "smoke")
    if args.command == "case":
        args.workers = 1
        case = Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
        return run_matrix(args, [case], "case")
    if args.command == "matrix":
        return run_matrix(args, fresh_cases(), "matrix")
    if args.command == "hard-canary":
        return run_matrix(
            args, hard_canary_cases(args.profiles), "hard-canary"
        )
    raise AssertionError(args.command)


def main() -> int:
    return dispatch(parser().parse_args())


if __name__ == "__main__":
    raise SystemExit(main())
