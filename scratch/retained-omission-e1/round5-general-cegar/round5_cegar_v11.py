#!/usr/bin/env python3
"""Round-5 v11: v8 with a sound Boolean power-pattern prepass.

Before the first mixed Boolean/real check, v11 solves the subset of v8's
individual assertions whose free constants are all Boolean.  SAT models of
that relaxation are refined with v9's full-shell, all-120-permutation power
cut.  Every admitted cut is independently replayed, shown false in its source
model, and inserted into the full v8 solver before that solver's first check.

This is an exact-n15 external experiment, not a universal Lean closure.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import json
import sys
import time
from collections import Counter, defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Callable, Sequence

import z3
from z3.z3util import get_vars

import round5_cegar_v8 as v8
import round5_cegar_v9 as v9


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = HERE.parents[2]
TARGET = v8.TARGET
SCHEMA_VERSION = 11
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v11.json"
UV_LOCK_PATH = HERE / "uv.lock"
POWER_THEOREM = v9.POWER_THEOREM
POWER_ANTECEDENT = (
    "the five named rows are active full positive-radius carrier circle "
    "classes; support=true is forcedZero and support=false is "
    "forcedNonzero on the five named carrier points"
)

Case = v8.Case
Encoding = v8.Encoding


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode()).hexdigest()


def formula_sha256(solver: z3.Solver) -> str:
    return hashlib.sha256((solver.sexpr() + "\n(check-sat)\n").encode()).hexdigest()


def source_contract() -> dict[str, object]:
    contract = v9.source_contract()
    role_map = dict(contract["role_map"])
    role_map["rich_apex_exclusion"] = str(role_map["rich_apex_exclusion"]).replace(
        "schema v9", "schema v11"
    )
    role_map["boolean_prepass"] = (
        "sound relaxation consisting only of individual v8 constraints whose "
        "free constants all have Bool sort"
    )
    contract["role_map"] = role_map
    return contract


def provenance() -> dict[str, object]:
    return {
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "base_v8_script_sha256": file_sha256(HERE / "round5_cegar_v8.py"),
        "miner_v9_script_sha256": file_sha256(HERE / "round5_cegar_v9.py"),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "uv_lock_sha256": file_sha256(UV_LOCK_PATH),
        "source_contract": source_contract(),
    }


def verify_frozen_provenance(
    frozen: dict[str, object], expected_script_sha256: str | None = None
) -> dict[str, object]:
    """Recompute and exact-compare every frozen input before encoding starts."""
    current = provenance()
    if frozen != current:
        differing = sorted(
            key for key in set(frozen) | set(current) if frozen.get(key) != current.get(key)
        )
        raise RuntimeError(f"frozen provenance differs from worker source: {differing}")
    if expected_script_sha256 is not None and current["script_sha256"] != expected_script_sha256:
        raise RuntimeError("worker v11 source hash differs from parent invocation")
    return current


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def free_constant_sort_names(constraint: z3.BoolRef) -> tuple[str, ...]:
    """Return the sorts of every free uninterpreted constant in an assertion."""
    return tuple(sorted({str(variable.sort()) for variable in get_vars(constraint)}))


def is_boolean_only_constraint(constraint: z3.BoolRef) -> bool:
    if not z3.is_bool(constraint):
        raise TypeError("an Encoding constraint must itself have Bool sort")
    return all(variable.sort().kind() == z3.Z3_BOOL_SORT for variable in get_vars(constraint))


@dataclass(frozen=True)
class BooleanRelaxationAudit:
    included_by_family: dict[str, int]
    excluded_by_family: dict[str, int]
    excluded_sort_counts: dict[str, int]
    included_total: int
    excluded_total: int


def build_boolean_relaxation(
    encoding: Encoding, timeout_ms: int, seed: int
) -> tuple[z3.Solver, BooleanRelaxationAudit]:
    """Copy exactly the individual v8 assertions with Bool-only free constants."""
    solver = z3.Solver()
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    included: dict[str, int] = defaultdict(int)
    excluded: dict[str, int] = defaultdict(int)
    excluded_sorts: Counter[str] = Counter()
    for family in sorted(encoding.groups):
        for constraint in encoding.groups[family]:
            if is_boolean_only_constraint(constraint):
                solver.add(constraint)
                included[family] += 1
            else:
                excluded[family] += 1
                for sort in free_constant_sort_names(constraint):
                    if sort != "Bool":
                        excluded_sorts[sort] += 1
    audit = BooleanRelaxationAudit(
        included_by_family=dict(sorted(included.items())),
        excluded_by_family=dict(sorted(excluded.items())),
        excluded_sort_counts=dict(sorted(excluded_sorts.items())),
        included_total=sum(included.values()),
        excluded_total=sum(excluded.values()),
    )
    if audit.included_total + audit.excluded_total != sum(
        len(items) for items in encoding.groups.values()
    ):
        raise AssertionError("Boolean relaxation filter lost an individual constraint")
    return solver, audit


def _required_schema_arm(case: Case) -> dict[str, object]:
    return {
        "arm": case.arm,
        "profiles": case.profiles,
        "kept": case.kept,
        "deleted": case.deleted,
        "fresh": case.fresh,
    }


def _exact_cell(
    item: object,
    rows: list[object],
    columns: list[object],
) -> tuple[int, int]:
    if not isinstance(item, dict) or set(item) != {
        "row_index", "row", "column_index", "point"
    }:
        raise AssertionError("power cell has incomplete or extra fields")
    row = item["row_index"]
    column = item["column_index"]
    if isinstance(row, bool) or not isinstance(row, int) or row not in range(5):
        raise AssertionError("power cell has invalid row index")
    if isinstance(column, bool) or not isinstance(column, int) or column not in range(5):
        raise AssertionError("power cell has invalid column index")
    row_record = rows[row]
    assert isinstance(row_record, dict)
    if item["row"] != row_record["name"] or item["point"] != columns[column]:
        raise AssertionError("power cell name/point does not match its indices")
    return row, column


def _allowed_full_shells(encoding: Encoding) -> dict[str, v9.FullShell]:
    """Resolve every theorem-licensed full shell from this exact encoding."""
    shells: dict[str, v9.FullShell] = {}
    row = getattr(encoding, "row", {})
    if isinstance(row, dict):
        for center in v9.CENTER_CANDIDATES:
            if all((center, point) in row for point in v9.POINTS):
                support = tuple(row[center, point] for point in v9.POINTS)
                activation = encoding.used(center)
                if not all(z3.is_bool(bit) for bit in support) or not z3.is_bool(activation):
                    raise AssertionError("critical full-shell source is not Boolean")
                shell = v9.FullShell(
                    name=f"critical_{center}",
                    kind="critical_full_row",
                    support=support,
                    activation=activation,
                )
                shells[shell.name] = shell
    rich = getattr(encoding, "rich", {})
    if isinstance(rich, dict):
        for (apex_index, cls), data in sorted(rich.items()):
            if not isinstance(data, dict) or not isinstance(data.get("support"), list):
                raise AssertionError("rich full-shell source has malformed support")
            support = data["support"]
            if len(support) != len(v9.POINTS) or not all(z3.is_bool(bit) for bit in support):
                raise AssertionError("rich full-shell support is not a full Boolean row")
            shell = v9.FullShell(
                name=f"rich_{apex_index}_{cls}",
                kind="rich_full_class",
                support=tuple(support),
                activation=None,
            )
            if shell.name in shells:
                raise AssertionError("duplicate full-shell name")
            shells[shell.name] = shell
    return shells


def reconstruct_certified_cut(
    encoding: Encoding,
    record: dict[str, object],
    case: Case,
) -> z3.BoolRef:
    """Validate a certificate against `encoding` and rebuild its exact cut."""
    if record.get("family") != "power_pattern_rank4_full_shell":
        raise AssertionError("unexpected learned-cut family")
    if record.get("lean_theorem") != POWER_THEOREM:
        raise AssertionError("learned cut does not name the licensing Lean theorem")
    if record.get("schema_arm") != _required_schema_arm(case):
        raise AssertionError("learned cut has incomplete or wrong schema-arm provenance")
    if record.get("antecedent") != POWER_ANTECEDENT:
        raise AssertionError("learned cut does not record the licensed antecedent")
    if record.get("permutations_enumerated") != 120:
        raise AssertionError("learned cut did not enumerate all 120 permutations")
    v9.verify_power_certificate(record)

    rows = record.get("rows")
    columns = record.get("columns")
    if not isinstance(rows, list) or len(rows) != 5:
        raise AssertionError("certificate must contain five row records")
    if not isinstance(columns, list) or len(columns) != 5:
        raise AssertionError("certificate must contain five columns")
    if any(isinstance(point, bool) or not isinstance(point, int) for point in columns):
        raise AssertionError("certificate columns must be integer point indices")
    if len(set(columns)) != 5 or not set(columns) <= set(v9.POINTS):
        raise AssertionError("certificate columns are not five distinct encoded points")

    allowed = _allowed_full_shells(encoding)
    selected: list[v9.FullShell] = []
    names: list[str] = []
    for row_record in rows:
        if not isinstance(row_record, dict) or set(row_record) != {"name", "kind"}:
            raise AssertionError("certificate row has incomplete or extra fields")
        name = row_record["name"]
        if not isinstance(name, str) or name not in allowed:
            raise AssertionError("certificate row is not an allowed full shell")
        shell = allowed[name]
        if row_record["kind"] != shell.kind:
            raise AssertionError("certificate row kind does not match the encoding")
        names.append(name)
        selected.append(shell)
    if len(set(names)) != 5:
        raise AssertionError("certificate rows are not distinct full shells")

    nonzeros = record.get("certified_nonzero_matching")
    zeros = record.get("forced_zero_cells")
    eliminated = record.get("eliminated_permutations")
    if not isinstance(nonzeros, list) or not isinstance(zeros, list):
        raise AssertionError("certificate cell lists are malformed")
    nonzero_cells = [_exact_cell(item, rows, columns) for item in nonzeros]
    zero_cells = [_exact_cell(item, rows, columns) for item in zeros]
    if len(set(nonzero_cells)) != len(nonzero_cells) or len(set(zero_cells)) != len(zero_cells):
        raise AssertionError("certificate repeats a power cell")

    unique_points = record.get("unique_surviving_permutation_points")
    if (
        not isinstance(unique_points, list)
        or len(unique_points) != 5
        or set(unique_points) != set(columns)
    ):
        raise AssertionError("certificate lacks the unique surviving permutation")
    matching_columns = tuple(columns.index(point) for point in unique_points)
    if tuple(nonzero_cells) != tuple((row, matching_columns[row]) for row in range(5)):
        raise AssertionError("nonzero cells do not exactly encode the unique matching")

    if not isinstance(eliminated, list) or len(eliminated) != 119:
        raise AssertionError("certificate must contain 119 eliminated permutations")
    for item in eliminated:
        if not isinstance(item, dict) or set(item) != {
            "permutation_points", "forced_zero_blocker"
        }:
            raise AssertionError("eliminated-permutation record is malformed")
        points = item["permutation_points"]
        if not isinstance(points, list) or len(points) != 5 or set(points) != set(columns):
            raise AssertionError("eliminated permutation does not permute the columns")
        blocker = _exact_cell(item["forced_zero_blocker"], rows, columns)
        permutation = tuple(columns.index(point) for point in points)
        if blocker != (blocker[0], permutation[blocker[0]]) or blocker not in set(zero_cells):
            raise AssertionError("eliminated permutation blocker is not its certified zero")

    antecedents: list[z3.BoolRef] = []
    antecedents.extend(shell.activation for shell in selected if shell.activation is not None)
    antecedents.extend(z3.Not(selected[row].support[columns[column]]) for row, column in nonzero_cells)
    antecedents.extend(selected[row].support[columns[column]] for row, column in zero_cells)
    return z3.Not(z3.And(*antecedents))


def verify_cut_provenance(
    encoding: Encoding,
    cut: z3.BoolRef,
    record: dict[str, object],
    case: Case,
) -> str:
    """Bind a cut expression to its theorem certificate, failing closed."""
    reconstructed = reconstruct_certified_cut(encoding, record, case)
    if cut.sexpr() != reconstructed.sexpr():
        raise AssertionError("learned cut is not the formula reconstructed from its certificate")
    return hashlib.sha256(reconstructed.sexpr().encode()).hexdigest()


def admit_cut(
    encoding: Encoding,
    cut: z3.BoolRef,
    record: dict[str, object],
    case: Case,
    source_model: z3.ModelRef,
    phase: str,
    formula_before_sha256: str,
    validated_miner_sha256: str,
) -> dict[str, object]:
    """Independently check theorem provenance and source-model progress."""
    cut_hash = verify_cut_provenance(encoding, cut, record, case)
    source_value = source_model.eval(cut, model_completion=True)
    if not z3.is_false(source_value):
        raise AssertionError("learned cut was not false in its source model")
    admitted = dict(record)
    admitted["admission"] = {
        "schema_version": SCHEMA_VERSION,
        "phase": phase,
        "miner_schema_version": v9.SCHEMA_VERSION,
        "miner_script_sha256": validated_miner_sha256,
        "formula_before_sha256": formula_before_sha256,
        "certificate_sha256": canonical_sha256(record),
        "cut_sexpr_sha256": cut_hash,
        "source_model_falsification": {"checked": True, "value": "false"},
        "theorem_sound": True,
        "provenance_complete": True,
    }
    return admitted


def verify_admitted_cut(
    encoding: Encoding,
    cut: z3.BoolRef,
    record: dict[str, object],
    case: Case,
    validated_miner_sha256: str,
) -> None:
    cut_hash = verify_cut_provenance(encoding, cut, record, case)
    admission = record.get("admission")
    if not isinstance(admission, dict):
        raise AssertionError("learned cut lacks an admission record")
    required = {
        "schema_version", "phase", "miner_schema_version", "miner_script_sha256",
        "formula_before_sha256", "certificate_sha256", "cut_sexpr_sha256",
        "source_model_falsification", "theorem_sound", "provenance_complete",
    }
    if not required <= admission.keys():
        raise AssertionError("learned-cut admission provenance is incomplete")
    if admission["theorem_sound"] is not True or admission["provenance_complete"] is not True:
        raise AssertionError("learned cut is not admitted as theorem-sound")
    if admission["source_model_falsification"] != {"checked": True, "value": "false"}:
        raise AssertionError("source-model falsification evidence is incomplete")
    if admission["miner_schema_version"] != v9.SCHEMA_VERSION:
        raise AssertionError("learned cut records the wrong miner schema")
    if admission["schema_version"] != SCHEMA_VERSION:
        raise AssertionError("learned cut records the wrong admission schema")
    if admission["phase"] not in {"boolean_prepass", "full_solver"}:
        raise AssertionError("learned cut records an invalid admission phase")
    if admission["miner_script_sha256"] != validated_miner_sha256:
        raise AssertionError("learned cut records an unvalidated miner hash")
    if admission["cut_sexpr_sha256"] != cut_hash:
        raise AssertionError("learned-cut expression hash mismatch")
    formula_before_hash = admission["formula_before_sha256"]
    if (
        not isinstance(formula_before_hash, str)
        or len(formula_before_hash) != 64
        or any(character not in "0123456789abcdef" for character in formula_before_hash)
    ):
        raise AssertionError("learned cut records an invalid formula-before hash")
    core = {key: value for key, value in record.items() if key != "admission"}
    if admission["certificate_sha256"] != canonical_sha256(core):
        raise AssertionError("learned-cut certificate hash mismatch")


@dataclass
class FullSolverGate:
    """Make the pre-first-check insertion invariant executable and testable."""
    solver: z3.Solver
    first_check_started: bool = False
    pre_first_cut_count: int = 0
    check_count: int = 0

    def add_pre_first_cut(self, cut: z3.BoolRef, tag: str) -> None:
        if self.first_check_started:
            raise RuntimeError("cannot insert a Boolean-prepass cut after first full check")
        tag_ref = z3.Bool(tag)
        self.solver.assert_and_track(cut, tag_ref)
        # Materialize the tracking assumption so encoding.smt2.gz replays with
        # ordinary (check-sat), rather than silently dropping named assertions.
        self.solver.add(tag_ref)
        self.pre_first_cut_count += 1

    def add_later_cut(self, cut: z3.BoolRef, tag: str) -> None:
        if not self.first_check_started:
            raise RuntimeError("post-check cut added before the first full check")
        tag_ref = z3.Bool(tag)
        self.solver.assert_and_track(cut, tag_ref)
        self.solver.add(tag_ref)

    def check(self) -> z3.CheckSatResult:
        self.first_check_started = True
        self.check_count += 1
        return self.solver.check()


@dataclass(frozen=True)
class PrepassConfig:
    timeout_ms: int
    max_candidates: int
    max_cuts: int


def run_boolean_prepass(
    encoding: Encoding,
    full_gate: FullSolverGate,
    config: PrepassConfig,
    seed: int,
    miner: Callable[[Encoding, z3.ModelRef, v9.PowerSearchBudget], tuple[z3.BoolRef, dict[str, object]] | None] = v9.mine_power_cut,
    validated_miner_sha256: str | None = None,
) -> tuple[dict[str, object], list[tuple[z3.BoolRef, dict[str, object]]], z3.Solver]:
    if config.timeout_ms <= 0 or config.max_candidates <= 0 or config.max_cuts < 0:
        raise ValueError("Boolean prepass budgets must be positive; cut budget nonnegative")
    started = time.monotonic()
    miner_sha256 = validated_miner_sha256 or file_sha256(HERE / "round5_cegar_v9.py")
    deadline = started + config.timeout_ms / 1000
    solver, filter_audit = build_boolean_relaxation(encoding, config.timeout_ms, seed)
    initial_hash = formula_sha256(solver)
    budget = v9.PowerSearchBudget(deadline, config.max_candidates)
    learned: list[tuple[z3.BoolRef, dict[str, object]]] = []
    checks = 0
    models = 0
    status = "error"
    reason: str | None = None
    while True:
        remaining = max(0, int((deadline - time.monotonic()) * 1000))
        if remaining <= 0:
            status, reason = "budget", "boolean_wall_clock_budget_exhausted"
            break
        solver.set(timeout=max(1, remaining))
        outcome = solver.check()
        checks += 1
        if outcome == z3.unsat:
            status = "unsat"
            break
        if outcome == z3.unknown:
            status, reason = "unknown", solver.reason_unknown()
            break
        models += 1
        if len(learned) >= config.max_cuts:
            status, reason = "budget", "boolean_cut_budget_exhausted"
            break
        try:
            found = miner(encoding, solver.model(), budget)
        except v9.PowerBudgetExhausted as exc:
            status, reason = "budget", str(exc)
            break
        if found is None:
            status, reason = "sat_no_cut", "Boolean model contains no mined full-shell cut"
            break
        cut, raw_record = found
        before_hash = formula_sha256(solver)
        admitted = admit_cut(
            encoding, cut, raw_record, encoding.case, solver.model(),
            "boolean_prepass", before_hash, miner_sha256,
        )
        admitted["cut_index"] = len(learned)
        # Recompute after adding cut_index, which is part of the durable certificate.
        admitted["admission"]["certificate_sha256"] = canonical_sha256(
            {key: value for key, value in admitted.items() if key != "admission"}
        )
        verify_admitted_cut(encoding, cut, admitted, encoding.case, miner_sha256)
        solver.add(cut)
        full_gate.add_pre_first_cut(cut, f"track_v11_pre_power_{len(learned):04d}")
        learned.append((cut, admitted))

    all_sound = True
    try:
        for cut, record in learned:
            verify_admitted_cut(encoding, cut, record, encoding.case, miner_sha256)
    except Exception:
        all_sound = False
        status, reason = "error", "Boolean prepass rejected: learned-cut provenance audit failed"
    final_hash = formula_sha256(solver)
    report: dict[str, object] = {
        "status": status,
        "reason": reason,
        "elapsed_seconds": time.monotonic() - started,
        "solver_checks": checks,
        "models_examined": models,
        "candidate_count": budget.candidates_checked,
        "learned_cut_count": len(learned),
        "max_candidates": config.max_candidates,
        "max_cuts": config.max_cuts,
        "timeout_ms": config.timeout_ms,
        "filter": asdict(filter_audit),
        "initial_formula_sha256": initial_hash,
        "final_formula_sha256": final_hash,
        "all_learned_cuts_theorem_sound_and_provenance_complete": all_sound,
        "sound_full_case_unsat": status == "unsat" and all_sound,
        "terminal_claim": (
            "full_case_unsat_from_sound_boolean_subset"
            if status == "unsat" and all_sound else "none"
        ),
    }
    return report, learned, solver


def _remaining_ms(deadline: float) -> int:
    return max(0, int((deadline - time.monotonic()) * 1000))


def resolved_budgets(
    timeout_ms: int,
    max_power_candidates: int,
    max_power_cuts: int,
    bool_timeout_ms: int,
    max_bool_power_candidates: int,
    max_bool_power_cuts: int,
) -> dict[str, dict[str, int]]:
    return {
        "boolean_prepass": {
            "timeout_ms": bool_timeout_ms,
            "max_candidates": max_bool_power_candidates,
            "max_cuts": max_bool_power_cuts,
        },
        "full_solver": {
            "timeout_ms": timeout_ms,
            "max_candidates": max_power_candidates,
            "max_cuts": max_power_cuts,
        },
    }


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
    expected_script_sha256: str | None = None,
    frozen_provenance: dict[str, object] | None = None,
) -> dict[str, object]:
    started = time.monotonic()
    case_dir = out_dir / case.case_id
    case_dir.mkdir(parents=True, exist_ok=False)
    launch = frozen_provenance if frozen_provenance is not None else provenance()
    expected = expected_script_sha256 or str(launch["script_sha256"])
    result: dict[str, object] = {
        **launch, "case": asdict(case), "case_id": case.case_id,
        "solver": {"name": "z3", "version": z3.get_version_string(), "seed": seed},
    }
    learned: list[tuple[z3.BoolRef, dict[str, object]]] = []
    encoding: Encoding | None = None
    full_solver: z3.Solver | None = None
    gate: FullSolverGate | None = None
    terminal_model: z3.ModelRef | None = None
    status = "error"
    reason: str | None = None
    prepass: dict[str, object] = {}
    full_check_seconds = 0.0
    full_scan_seconds = 0.0
    full_candidate_count = 0
    base_full_hash: str | None = None
    first_check_hash: str | None = None
    try:
        validated = verify_frozen_provenance(launch, expected)
        validated_miner_sha256 = str(validated["miner_v9_script_sha256"])
        if timeout_ms <= 0 or max_power_candidates <= 0 or max_power_cuts < 0:
            raise ValueError("full-solver budgets must be positive; cut budget nonnegative")
        if bool_timeout_ms <= 0 or max_bool_power_candidates <= 0 or max_bool_power_cuts < 0:
            raise ValueError("Boolean-prepass budgets must be positive; cut budget nonnegative")
        encoding = Encoding(case, timeout_ms=timeout_ms, seed=seed)
        full_solver, _ = encoding.make_solver()
        # v8 uses assert_and_track for family cores.  Assert those tracking
        # literals explicitly so the serialized v11 formula is replayable.
        for family in sorted(encoding.groups):
            full_solver.add(z3.Bool(f"track_{family}"))
        gate = FullSolverGate(full_solver)
        base_full_hash = formula_sha256(full_solver)
        prepass, learned, boolean_solver = run_boolean_prepass(
            encoding, gate,
            PrepassConfig(bool_timeout_ms, max_bool_power_candidates, max_bool_power_cuts),
            seed,
            validated_miner_sha256=validated_miner_sha256,
        )
        first_check_hash = formula_sha256(full_solver)
        if gate.pre_first_cut_count != len(learned):
            raise AssertionError("not every Boolean learned cut reached the full solver")
        if (
            prepass["status"] == "error"
            or prepass["all_learned_cuts_theorem_sound_and_provenance_complete"] is not True
        ):
            raise RuntimeError("Boolean prepass failed its learned-cut admission audit")
        boolean_text = boolean_solver.sexpr() + "\n(check-sat)\n"
        with gzip.open(case_dir / "boolean_encoding.smt2.gz", "wt", encoding="utf-8") as handle:
            handle.write(boolean_text)
        if prepass["sound_full_case_unsat"] is True:
            status = "unsat"
            result["unsat_phase"] = "boolean_prepass"
        else:
            deadline = time.monotonic() + timeout_ms / 1000
            scan_budget = v9.PowerSearchBudget(deadline, max_power_candidates)
            while True:
                remaining = _remaining_ms(deadline)
                if remaining <= 0:
                    status, reason = "unknown", "full_wall_clock_budget_exhausted"
                    break
                full_solver.set(timeout=max(1, remaining))
                check_started = time.monotonic()
                outcome = gate.check()
                full_check_seconds += time.monotonic() - check_started
                if outcome == z3.unsat:
                    status = "unsat"
                    result["unsat_phase"] = "full_solver"
                    break
                if outcome == z3.unknown:
                    status, reason = "unknown", full_solver.reason_unknown()
                    break
                model = full_solver.model()
                scan_started = time.monotonic()
                try:
                    found = v9.mine_power_cut(encoding, model, scan_budget)
                except v9.PowerBudgetExhausted as exc:
                    full_candidate_count = scan_budget.candidates_checked
                    status, reason = "unknown", str(exc)
                    break
                full_scan_seconds += time.monotonic() - scan_started
                full_candidate_count = scan_budget.candidates_checked
                if found is None:
                    if time.monotonic() >= deadline:
                        status, reason = "unknown", "full_wall_clock_budget_exhausted_after_power_scan"
                    else:
                        status, terminal_model = "sat", model
                    break
                full_phase_count = sum(
                    record["admission"]["phase"] == "full_solver" for _, record in learned
                )
                if full_phase_count >= max_power_cuts:
                    status, reason = "unknown", "full_power_cut_budget_exhausted"
                    break
                cut, raw_record = found
                admitted = admit_cut(
                    encoding, cut, raw_record, case, model, "full_solver",
                    formula_sha256(full_solver), validated_miner_sha256,
                )
                admitted["cut_index"] = len(learned)
                admitted["admission"]["certificate_sha256"] = canonical_sha256(
                    {key: value for key, value in admitted.items() if key != "admission"}
                )
                verify_admitted_cut(
                    encoding, cut, admitted, case, validated_miner_sha256
                )
                gate.add_later_cut(cut, f"track_v11_full_power_{full_phase_count:04d}")
                learned.append((cut, admitted))
    except Exception as exc:
        status, reason = "error", f"{type(exc).__name__}: {exc}"

    if full_solver is not None:
        final_text = full_solver.sexpr() + "\n(check-sat)\n"
        with gzip.open(case_dir / "encoding.smt2.gz", "wt", encoding="utf-8") as handle:
            handle.write(final_text)
        final_hash = hashlib.sha256(final_text.encode()).hexdigest()
    else:
        final_hash = None
    cut_records = [record for _, record in learned]
    cut_artifact = {
        "family": "power_pattern_rank4_full_shell",
        "lean_theorem": POWER_THEOREM,
        "cut_count": len(cut_records),
        "phase_counts": dict(sorted(Counter(
            str(record["admission"]["phase"]) for record in cut_records
        ).items())),
        "cuts": cut_records,
    }
    write_json(case_dir / "power_cuts_v11.json", cut_artifact)
    write_json(case_dir / "boolean_prepass.json", prepass)
    result.update({
        "status": status,
        "reason_unknown": reason if status == "unknown" else None,
        "error": reason if status == "error" else None,
        "elapsed_seconds": time.monotonic() - started,
        "timeout_ms": timeout_ms,
        "resolved_budgets": resolved_budgets(
            timeout_ms, max_power_candidates, max_power_cuts,
            bool_timeout_ms, max_bool_power_candidates, max_bool_power_cuts,
        ),
        "boolean_prepass": prepass,
        "boolean_prepass_file": "boolean_prepass.json",
        "boolean_prepass_sha256": file_sha256(case_dir / "boolean_prepass.json"),
        "boolean_encoding_file": (
            "boolean_encoding.smt2.gz" if (case_dir / "boolean_encoding.smt2.gz").exists() else None
        ),
        "boolean_encoding_gzip_sha256": (
            file_sha256(case_dir / "boolean_encoding.smt2.gz")
            if (case_dir / "boolean_encoding.smt2.gz").exists() else None
        ),
        "power_cut_file": "power_cuts_v11.json",
        "power_cut_file_sha256": file_sha256(case_dir / "power_cuts_v11.json"),
        "power_cut_count": len(learned),
        "pre_first_check_power_cut_count": gate.pre_first_cut_count if gate else 0,
        "full_solver_check_count": gate.check_count if gate else 0,
        "full_solver_check_seconds": full_check_seconds,
        "full_power_scan_seconds": full_scan_seconds,
        "full_power_candidate_count": full_candidate_count,
        "max_power_candidates": max_power_candidates,
        "max_power_cuts": max_power_cuts,
        "constraint_counts": encoding.constraint_counts() if encoding else {},
        "base_full_encoding_sha256": base_full_hash,
        "first_check_encoding_sha256": first_check_hash,
        "encoding_file": "encoding.smt2.gz" if full_solver is not None else None,
        "encoding_gzip_sha256": (
            file_sha256(case_dir / "encoding.smt2.gz") if full_solver is not None else None
        ),
        "encoding_sha256": final_hash,
        "full_encoding_sha256": final_hash,
    })
    if status == "sat" and encoding is not None and terminal_model is not None:
        validation = encoding.validate_model(terminal_model)
        result["model_validation"] = validation
        write_json(case_dir / "witness.json", encoding.serialize_model(terminal_model))
        result["witness_file"] = "witness.json"
        if validation["failures"]:
            result["status"], result["error"] = "error", "full model failed assertion replay"
    elif status == "unsat" and full_solver is not None and gate and gate.check_count:
        result["unsat_core_families"] = sorted(
            str(item).removeprefix("track_") for item in full_solver.unsat_core()
        )
    result["complete"] = result["status"] not in {"unknown", "error"}
    write_json(case_dir / "result.json", result)
    return result


def _case_from_args(args: argparse.Namespace) -> Case:
    return Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)


def _solve_args(args: argparse.Namespace, case: Case, run_dir: Path, frozen: dict[str, object]) -> dict[str, object]:
    return solve_case(
        case, args.timeout_ms, run_dir, args.seed, args.max_power_cuts,
        args.max_power_candidates, args.bool_timeout_ms, args.max_bool_power_cuts,
        args.max_bool_power_candidates, str(frozen["script_sha256"]), frozen,
    )


def _args_budgets(args: argparse.Namespace) -> dict[str, dict[str, int]]:
    return resolved_budgets(
        args.timeout_ms, args.max_power_candidates, args.max_power_cuts,
        args.bool_timeout_ms, args.max_bool_power_candidates,
        args.max_bool_power_cuts,
    )


def command_case(args: argparse.Namespace) -> int:
    run_dir = v8.make_run_dir(args.artifacts, "case")
    frozen = provenance()
    write_json(run_dir / "invocation.json", {
        **frozen, "argv": sys.argv, "case_count": 1,
        "resolved_budgets": _args_budgets(args),
    })
    result = _solve_args(args, _case_from_args(args), run_dir, frozen)
    print(json.dumps({"status": result["status"], "case_id": result["case_id"], "run_dir": str(run_dir)}, sort_keys=True))
    return 0 if result["status"] in {"sat", "unsat", "unknown"} else 1


def command_smoke(args: argparse.Namespace) -> int:
    run_dir = v8.make_run_dir(args.artifacts, "smoke")
    frozen = provenance()
    write_json(run_dir / "invocation.json", {
        **frozen, "argv": sys.argv, "case_count": 1,
        "resolved_budgets": _args_budgets(args),
    })
    result = _solve_args(args, Case("paired", "SSS", 0, 1, None), run_dir, frozen)
    print(json.dumps({"status": result["status"], "case_id": result["case_id"], "run_dir": str(run_dir)}, sort_keys=True))
    return 0 if result["status"] in {"sat", "unsat", "unknown"} else 1


def _worker(payload: tuple[dict[str, object], dict[str, object]]) -> dict[str, object]:
    data, frozen = payload
    return solve_case(Case(**data.pop("case")), frozen_provenance=frozen, **data)


def matrix_is_complete(cases: Sequence[Case], results: Sequence[dict[str, object]]) -> bool:
    requested = Counter(case.case_id for case in cases)
    returned = Counter(str(result.get("case_id")) for result in results)
    statuses = Counter(str(result.get("status")) for result in results)
    return (
        returned == requested
        and statuses["unknown"] == 0
        and statuses["error"] == 0
        and set(statuses) <= {"sat", "unsat"}
    )


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
    if (source_summary is None) != (source_summary_sha256 is None):
        raise ValueError("retry source path and authenticated byte hash must be paired")
    run_dir = v8.make_run_dir(args.artifacts, command)
    frozen = provenance()
    invocation = {
        **frozen, "argv": sys.argv, "case_count": len(cases), "workers": args.workers,
        "resolved_budgets": _args_budgets(args),
        "source_summary": str(source_summary) if source_summary else None,
        "source_summary_sha256": source_summary_sha256,
    }
    write_json(run_dir / "invocation.json", invocation)
    payloads = []
    for index, case in enumerate(cases):
        payloads.append(({
            "case": asdict(case), "timeout_ms": args.timeout_ms, "out_dir": run_dir,
            "seed": args.seed + index, "max_power_cuts": args.max_power_cuts,
            "max_power_candidates": args.max_power_candidates,
            "bool_timeout_ms": args.bool_timeout_ms,
            "max_bool_power_cuts": args.max_bool_power_cuts,
            "max_bool_power_candidates": args.max_bool_power_candidates,
            "expected_script_sha256": str(frozen["script_sha256"]),
        }, frozen))
    with concurrent.futures.ProcessPoolExecutor(max_workers=args.workers) as pool:
        results = list(pool.map(_worker, payloads))
    counts = Counter(str(result["status"]) for result in results)
    complete = matrix_is_complete(cases, results)
    summary = {
        **invocation,
        "command": command,
        "elapsed_seconds": time.monotonic() - started,
        "counts": dict(sorted(counts.items())),
        "complete": complete,
        "full_encoding_sha256_by_case": {
            str(result["case_id"]): result.get("full_encoding_sha256")
            for result in sorted(results, key=lambda item: str(item["case_id"]))
        },
        "results": results,
    }
    write_json(run_dir / "summary.json", summary)
    print(json.dumps({"counts": summary["counts"], "run_dir": str(run_dir)}, sort_keys=True))
    return 0 if complete else 2


def command_matrix(args: argparse.Namespace) -> int:
    return run_matrix(args, v8.all_cases(), "matrix")


def command_secondcap_matrix(args: argparse.Namespace) -> int:
    return run_matrix(args, v8.all_secondcap_endpoint_cases(), "secondcap-matrix")


def load_authenticated_v8_summary(path: Path) -> tuple[dict[str, object], str]:
    """Read once, hash those exact bytes, and authenticate their v8 provenance."""
    source_bytes = path.read_bytes()
    source_hash = hashlib.sha256(source_bytes).hexdigest()
    try:
        prior = json.loads(source_bytes)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ValueError("retry source is not valid JSON") from exc
    if not isinstance(prior, dict):
        raise ValueError("retry source is not a summary object")
    expected_v8 = v8.provenance()
    mismatched = sorted(
        key for key, value in expected_v8.items() if prior.get(key) != value
    )
    if mismatched or set(expected_v8) - set(prior):
        raise ValueError(
            "retry source is not an authenticated current v8 target summary: "
            f"{mismatched}"
        )
    return prior, source_hash


def command_retry(args: argparse.Namespace) -> int:
    try:
        prior, source_hash = load_authenticated_v8_summary(args.summary)
    except ValueError as exc:
        raise SystemExit(str(exc)) from exc
    statuses = {"unknown"}
    if args.include_error:
        statuses.add("error")
    requested = {
        str(item["case_id"]) for item in prior.get("results", [])
        if item.get("status") in statuses
    }
    universe = [*v8.all_cases(), *v8.all_secondcap_endpoint_cases()]
    cases_by_id = {case.case_id: case for case in universe}
    missing = sorted(requested - cases_by_id.keys())
    if missing:
        raise SystemExit(f"summary contains unknown case ids: {missing}")
    cases = [cases_by_id[case_id] for case_id in sorted(requested)]
    if not cases:
        raise SystemExit(f"no cases with statuses {sorted(statuses)}")
    return run_matrix(args, cases, "retry", args.summary, source_hash)


def bounded_workers(value: str) -> int:
    workers = int(value)
    if not 1 <= workers <= 24:
        raise argparse.ArgumentTypeError("workers must be in the closed interval 1..24")
    return workers


def parser() -> argparse.ArgumentParser:
    common = argparse.ArgumentParser(add_help=False)
    common.add_argument("--timeout-ms", type=int, default=300_000)
    common.add_argument("--bool-timeout-ms", type=int, default=30_000)
    common.add_argument("--seed", type=int, default=97)
    common.add_argument("--max-power-cuts", type=int, default=256)
    common.add_argument("--max-power-candidates", type=int, default=2_000_000)
    common.add_argument("--max-bool-power-cuts", type=int, default=256)
    common.add_argument("--max-bool-power-candidates", type=int, default=2_000_000)
    common.add_argument("--artifacts", type=Path, default=HERE / "artifacts-v11")
    top = argparse.ArgumentParser(description=__doc__)
    sub = top.add_subparsers(dest="command", required=True)
    sub.add_parser("smoke", parents=[common]).set_defaults(func=command_smoke)
    one = sub.add_parser("case", parents=[common])
    one.add_argument("--arm", choices=("paired", "fresh", "secondcap_collision", "secondcap_distinct"), required=True)
    one.add_argument("--profiles", required=True)
    one.add_argument("--kept", type=int, required=True)
    one.add_argument("--deleted", type=int, required=True)
    one.add_argument("--fresh", type=int)
    one.set_defaults(func=command_case)
    matrix = sub.add_parser("matrix", parents=[common])
    matrix.add_argument("--workers", type=bounded_workers, default=12)
    matrix.set_defaults(func=command_matrix)
    second = sub.add_parser("secondcap-matrix", parents=[common])
    second.add_argument("--workers", type=bounded_workers, default=12)
    second.set_defaults(func=command_secondcap_matrix)
    retry = sub.add_parser("retry", parents=[common])
    retry.add_argument("--summary", type=Path, required=True)
    retry.add_argument("--workers", type=bounded_workers, default=12)
    retry.add_argument("--include-error", action="store_true")
    retry.set_defaults(func=command_retry)
    return top


def main() -> int:
    args = parser().parse_args()
    return args.func(args)


if __name__ == "__main__":
    raise SystemExit(main())
