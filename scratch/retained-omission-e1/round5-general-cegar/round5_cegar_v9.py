#!/usr/bin/env python3
"""Round-5 v9: v8 plus certified full-shell power-pattern lazy cuts.

This remains an exact-cardinality-15 external Z3 experiment.  The new cut
uses only active critical full rows and unconditional rich full rows.  It
never treats absence from a chosen four-subset as circle nonmembership.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import itertools
import json
import os
import sys
import time
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Sequence

import z3

import round5_cegar_v8 as v8


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = HERE.parents[2]
TARGET = v8.TARGET
SCHEMA_VERSION = 9
SCRIPT_PATH = Path(__file__).resolve()
SCRIPT_SHA256 = hashlib.sha256(SCRIPT_PATH.read_bytes()).hexdigest()
SCHEMA_PATH = HERE / "schema_v9.json"
UV_LOCK_PATH = HERE / "uv.lock"
POWER_THEOREM = (
    "Problem97.Census554.CirclePowerMatrix."
    "false_of_powerMatrix_unique_possible_matching"
)
SOURCE_FILES = {
    **v8.SOURCE_FILES,
    "circle_power_matrix": (
        PROJECT_ROOT / "lean/Erdos9796Proof/P97/Census554/CirclePowerMatrix.lean"
    ),
}
PERMUTATIONS_5 = tuple(itertools.permutations(range(5)))

Case = v8.Case
Encoding = v8.Encoding
POINTS = v8.POINTS
CENTER_CANDIDATES = v8.CENTER_CANDIDATES
APICES = v8.APICES
INTERIORS = v8.INTERIORS


class PowerBudgetExhausted(RuntimeError):
    """Fail-closed termination of the bounded power-pattern refinement."""


@dataclass(frozen=True)
class FullShell:
    """A circle whose support bits are full zero/nonzero power facts."""

    name: str
    kind: str
    support: tuple[z3.BoolRef, ...]
    activation: z3.BoolRef | None


@dataclass
class PowerSearchBudget:
    deadline: float
    max_candidates: int
    candidates_checked: int = 0

    def charge(self) -> None:
        self.candidates_checked += 1
        if self.candidates_checked > self.max_candidates:
            raise PowerBudgetExhausted("power_candidate_budget_exhausted")
        if self.candidates_checked % 256 == 0 and time.monotonic() >= self.deadline:
            raise PowerBudgetExhausted("wall_clock_budget_exhausted_during_power_scan")


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_contract() -> dict[str, object]:
    contract = v8.source_contract()
    contract["files"] = {
        name: {
            "path": str(path.relative_to(PROJECT_ROOT)),
            "sha256": file_sha256(path),
        }
        for name, path in SOURCE_FILES.items()
    }
    role_map = dict(contract["role_map"])
    role_map["rich_apex_exclusion"] = str(role_map["rich_apex_exclusion"]).replace(
        "schema v8", "schema v9"
    )
    role_map["power_pattern_rank4_full_shell"] = POWER_THEOREM
    contract["role_map"] = role_map
    return contract


def provenance() -> dict[str, object]:
    return {
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": SCRIPT_SHA256,
        "base_v8_script_sha256": file_sha256(HERE / "round5_cegar_v8.py"),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "uv_lock_sha256": file_sha256(UV_LOCK_PATH),
        "source_contract": source_contract(),
    }


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def timestamp_slug() -> str:
    return v8.timestamp_slug()


def active_full_shells(
    encoding: Encoding, model: z3.ModelRef
) -> tuple[FullShell, ...]:
    """Return only rows for which every support bit has full-shell meaning."""
    shells: list[FullShell] = []
    for center in CENTER_CANDIDATES:
        activation = encoding.used(center)
        if encoding._bool(model, activation):
            shells.append(
                FullShell(
                    name=f"critical_{center}",
                    kind="critical_full_row",
                    support=tuple(encoding.row[center, x] for x in POINTS),
                    activation=activation,
                )
            )
    for (apex_index, cls), data in sorted(encoding.rich.items()):
        support = data["support"]
        assert isinstance(support, list)
        shells.append(
            FullShell(
                name=f"rich_{apex_index}_{cls}",
                kind="rich_full_class",
                support=tuple(support),
                activation=None,
            )
        )
    return tuple(shells)


def surviving_permutations(
    zero_mask: Sequence[Sequence[bool]],
) -> list[tuple[int, ...]]:
    """Enumerate all 5! possible determinant monomials, without shortcuts."""
    if len(zero_mask) != 5 or any(len(row) != 5 for row in zero_mask):
        raise ValueError("power-pattern mask must be exactly 5 by 5")
    return [
        permutation
        for permutation in PERMUTATIONS_5
        if all(not zero_mask[row][permutation[row]] for row in range(5))
    ]


def _certificate_record(
    case: Case,
    shells: Sequence[FullShell],
    columns: Sequence[int],
    zero_mask: Sequence[Sequence[bool]],
) -> dict[str, object] | None:
    survivors = surviving_permutations(zero_mask)
    if len(survivors) != 1:
        return None
    matching = survivors[0]
    certified_nonzero = [
        {
            "row_index": row,
            "row": shells[row].name,
            "column_index": matching[row],
            "point": columns[matching[row]],
        }
        for row in range(5)
    ]
    forced_zero = [
        {
            "row_index": row,
            "row": shells[row].name,
            "column_index": col,
            "point": columns[col],
        }
        for row in range(5)
        for col in range(5)
        if zero_mask[row][col]
    ]
    eliminated = []
    for permutation in PERMUTATIONS_5:
        if permutation == matching:
            continue
        blocker = next(
            row for row in range(5) if zero_mask[row][permutation[row]]
        )
        eliminated.append(
            {
                "permutation_points": [columns[col] for col in permutation],
                "forced_zero_blocker": {
                    "row_index": blocker,
                    "row": shells[blocker].name,
                    "column_index": permutation[blocker],
                    "point": columns[permutation[blocker]],
                },
            }
        )
    record: dict[str, object] = {
        "family": "power_pattern_rank4_full_shell",
        "lean_theorem": POWER_THEOREM,
        "schema_arm": {
            "arm": case.arm,
            "profiles": case.profiles,
            "kept": case.kept,
            "deleted": case.deleted,
            "fresh": case.fresh,
        },
        "antecedent": (
            "the five named rows are active full positive-radius carrier circle "
            "classes; support=true is forcedZero and support=false is "
            "forcedNonzero on the five named carrier points"
        ),
        "rows": [
            {"name": shell.name, "kind": shell.kind} for shell in shells
        ],
        "columns": list(columns),
        "unique_surviving_permutation_points": [
            columns[col] for col in matching
        ],
        "certified_nonzero_matching": certified_nonzero,
        "forced_zero_cells": forced_zero,
        "eliminated_permutations": eliminated,
        "permutations_enumerated": len(PERMUTATIONS_5),
    }
    verify_power_certificate(record)
    return record


def verify_power_certificate(record: dict[str, object]) -> None:
    """Independent finite replay of the recorded 120-permutation witness."""
    rows = record["rows"]
    columns = record["columns"]
    zeros = record["forced_zero_cells"]
    nonzeros = record["certified_nonzero_matching"]
    if not isinstance(rows, list) or len(rows) != 5:
        raise AssertionError("certificate does not name five rows")
    if not isinstance(columns, list) or len(columns) != 5 or len(set(columns)) != 5:
        raise AssertionError("certificate does not name five distinct columns")
    assert isinstance(zeros, list) and isinstance(nonzeros, list)
    zero_cells = {
        (int(item["row_index"]), int(item["column_index"])) for item in zeros
    }
    nonzero_cells = {
        (int(item["row_index"]), int(item["column_index"])) for item in nonzeros
    }
    if zero_cells & nonzero_cells:
        raise AssertionError("a power entry is both forced zero and nonzero")
    if len(nonzero_cells) != 5 or {row for row, _ in nonzero_cells} != set(range(5)):
        raise AssertionError("certified matching has the wrong row support")
    if {col for _, col in nonzero_cells} != set(range(5)):
        raise AssertionError("certified matching has the wrong column support")
    zero_mask = [
        [(row, col) in zero_cells for col in range(5)] for row in range(5)
    ]
    survivors = surviving_permutations(zero_mask)
    if len(survivors) != 1:
        raise AssertionError(f"expected one possible permutation, found {len(survivors)}")
    matching_cells = {(row, survivors[0][row]) for row in range(5)}
    if matching_cells != nonzero_cells:
        raise AssertionError("unique possible permutation is not the certified matching")
    eliminated = record["eliminated_permutations"]
    if not isinstance(eliminated, list) or len(eliminated) != 119:
        raise AssertionError("certificate must account for all 119 rejected permutations")
    recorded = {tuple(item["permutation_points"]) for item in eliminated}
    expected = {
        tuple(columns[col] for col in permutation)
        for permutation in PERMUTATIONS_5
        if permutation != survivors[0]
    }
    if recorded != expected:
        raise AssertionError("recorded eliminated permutations are incomplete")


def mine_power_cut(
    encoding: Encoding,
    model: z3.ModelRef,
    budget: PowerSearchBudget,
) -> tuple[z3.BoolRef, dict[str, object]] | None:
    """Find one deterministic full-shell rank-four obstruction in the model."""
    shells = active_full_shells(encoding, model)
    if len(shells) < 5:
        return None
    supports = {
        shell.name: tuple(encoding._bool(model, bit) for bit in shell.support)
        for shell in shells
    }

    # A bipartite graph with a unique perfect matching has a degree-one vertex
    # on the row side.  Enumerating its four zero columns and sole possible
    # column is complete, while avoiding all C(m,5)*C(15,5) submatrices.
    for designated_index, designated in enumerate(shells):
        zero_points = [x for x in POINTS if supports[designated.name][x]]
        nonzero_points = [x for x in POINTS if not supports[designated.name][x]]
        for four_zeros in itertools.combinations(zero_points, 4):
            for possible_point in nonzero_points:
                columns = tuple(sorted((*four_zeros, possible_point)))
                for other_indices in itertools.combinations(
                    [index for index in range(len(shells)) if index != designated_index],
                    4,
                ):
                    budget.charge()
                    selected_indices = (designated_index, *other_indices)
                    selected_shells = tuple(shells[index] for index in selected_indices)
                    zero_mask = [
                        [supports[shell.name][point] for point in columns]
                        for shell in selected_shells
                    ]
                    # The designated row must have exactly one possible entry.
                    if sum(not value for value in zero_mask[0]) != 1:
                        raise AssertionError("degree-one enumeration invariant failed")
                    record = _certificate_record(
                        encoding.case, selected_shells, columns, zero_mask
                    )
                    if record is None:
                        continue
                    antecedents: list[z3.BoolRef] = []
                    for shell in selected_shells:
                        if shell.activation is not None:
                            antecedents.append(shell.activation)
                    for item in record["certified_nonzero_matching"]:
                        assert isinstance(item, dict)
                        row = int(item["row_index"])
                        point = int(item["point"])
                        antecedents.append(z3.Not(selected_shells[row].support[point]))
                    for item in record["forced_zero_cells"]:
                        assert isinstance(item, dict)
                        row = int(item["row_index"])
                        point = int(item["point"])
                        antecedents.append(selected_shells[row].support[point])
                    cut = z3.Not(z3.And(*antecedents))
                    if z3.is_true(model.eval(cut, model_completion=True)):
                        raise AssertionError("power cut does not exclude its source model")
                    return cut, record
    return None


def _remaining_ms(deadline: float) -> int:
    return max(0, int((deadline - time.monotonic()) * 1000))


def solve_case(
    case: Case,
    timeout_ms: int,
    out_dir: Path,
    seed: int = 97,
    max_power_cuts: int = 256,
    max_power_candidates: int = 2_000_000,
    expected_script_sha256: str = SCRIPT_SHA256,
    frozen_provenance: dict[str, object] | None = None,
) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + timeout_ms / 1000
    case_dir = out_dir / case.case_id
    case_dir.mkdir(parents=True, exist_ok=False)
    launch = frozen_provenance if frozen_provenance is not None else provenance()
    base_result: dict[str, object] = {
        **launch,
        "case": asdict(case),
        "case_id": case.case_id,
        "solver": {"name": "z3", "version": z3.get_version_string(), "seed": seed},
    }
    solver: z3.Solver | None = None
    encoding: Encoding | None = None
    cuts: list[dict[str, object]] = []
    solver_check_seconds = 0.0
    scan_seconds = 0.0
    scan_budget = PowerSearchBudget(deadline, max_power_candidates)
    status = "error"
    reason_unknown: str | None = None
    terminal_model: z3.ModelRef | None = None
    initial_encoding_hash: str | None = None
    try:
        if timeout_ms <= 0 or max_power_cuts < 0 or max_power_candidates <= 0:
            raise ValueError("timeout and candidate budget must be positive; cut budget nonnegative")
        if launch.get("schema_version") != SCHEMA_VERSION:
            raise RuntimeError("frozen schema version differs from worker schema")
        if launch.get("script_sha256") != expected_script_sha256:
            raise RuntimeError("frozen script hash differs from parent expectation")
        if SCRIPT_SHA256 != expected_script_sha256:
            raise RuntimeError("worker source hash differs from parent invocation")
        encoding = Encoding(case, timeout_ms=timeout_ms, seed=seed)
        solver, initial_smt2 = encoding.make_solver()
        initial_encoding_hash = hashlib.sha256(initial_smt2.encode()).hexdigest()
        while True:
            remaining = _remaining_ms(deadline)
            if remaining <= 0:
                status = "unknown"
                reason_unknown = "wall_clock_budget_exhausted"
                break
            solver.set(timeout=max(1, remaining))
            check_started = time.monotonic()
            outcome = solver.check()
            solver_check_seconds += time.monotonic() - check_started
            if outcome == z3.unsat:
                status = "unsat"
                break
            if outcome == z3.unknown:
                status = "unknown"
                reason_unknown = solver.reason_unknown()
                break
            model = solver.model()
            scan_started = time.monotonic()
            found = mine_power_cut(encoding, model, scan_budget)
            scan_seconds += time.monotonic() - scan_started
            if found is None:
                if time.monotonic() >= deadline:
                    status = "unknown"
                    reason_unknown = "wall_clock_budget_exhausted_after_power_scan"
                else:
                    status = "sat"
                    terminal_model = model
                break
            if len(cuts) >= max_power_cuts:
                status = "unknown"
                reason_unknown = "power_cut_budget_exhausted"
                break
            cut, record = found
            record["cut_index"] = len(cuts)
            cuts.append(record)
            solver.assert_and_track(
                cut,
                z3.Bool(f"track_power_pattern_rank4_full_shell_{len(cuts) - 1:04d}"),
            )
    except PowerBudgetExhausted as exc:
        status = "unknown"
        reason_unknown = str(exc)
    except Exception as exc:
        status = "error"
        reason_unknown = f"{type(exc).__name__}: {exc}"

    final_encoding_hash: str | None = None
    if solver is not None:
        final_smt2 = solver.sexpr() + "\n(check-sat)\n"
        final_encoding_hash = hashlib.sha256(final_smt2.encode()).hexdigest()
        with gzip.open(case_dir / "encoding.smt2.gz", "wt", encoding="utf-8") as handle:
            handle.write(final_smt2)
    cut_artifact = {
        "family": "power_pattern_rank4_full_shell",
        "lean_theorem": POWER_THEOREM,
        "cut_count": len(cuts),
        "candidate_count": scan_budget.candidates_checked,
        "cuts": cuts,
    }
    write_json(case_dir / "power_cuts.json", cut_artifact)
    result: dict[str, object] = {
        **base_result,
        "status": status,
        "elapsed_seconds": time.monotonic() - started,
        "solver_check_seconds": solver_check_seconds,
        "power_scan_seconds": scan_seconds,
        "timeout_ms": timeout_ms,
        "max_power_cuts": max_power_cuts,
        "max_power_candidates": max_power_candidates,
        "power_cut_count": len(cuts),
        "power_candidate_count": scan_budget.candidates_checked,
        "power_cut_file": "power_cuts.json",
        "constraint_counts": encoding.constraint_counts() if encoding else {},
        "constraint_total": (
            sum(encoding.constraint_counts().values()) + len(cuts) if encoding else 0
        ),
        "initial_encoding_sha256": initial_encoding_hash,
        "encoding_sha256": final_encoding_hash,
    }
    if status == "sat" and encoding is not None and terminal_model is not None:
        validation = encoding.validate_model(terminal_model)
        result["model_validation"] = validation
        write_json(case_dir / "witness.json", encoding.serialize_model(terminal_model))
        result["witness_file"] = "witness.json"
        if validation["failures"]:
            result["status"] = "error"
            result["error"] = "solver model failed independent assertion replay"
    elif status == "unsat" and solver is not None:
        result["unsat_core_families"] = sorted(
            str(item).removeprefix("track_") for item in solver.unsat_core()
        )
    elif status == "unknown":
        result["reason_unknown"] = reason_unknown
    elif status == "error":
        result["error"] = reason_unknown
    write_json(case_dir / "result.json", result)
    return result


def _worker(
    payload: tuple[dict[str, object], int, int, int, str, int, str, dict[str, object]]
) -> dict[str, object]:
    case_data, timeout_ms, max_cuts, max_candidates, out_dir, seed, expected, frozen = payload
    return solve_case(
        Case(**case_data), timeout_ms, Path(out_dir), seed, max_cuts, max_candidates,
        expected, frozen
    )


def make_run_dir(base: Path, command: str) -> Path:
    run_dir = base / f"{timestamp_slug()}-{command}-pid{os.getpid()}"
    run_dir.mkdir(parents=True, exist_ok=False)
    return run_dir


def _single_case(args: argparse.Namespace, case: Case, command: str) -> int:
    case.validate()
    run_dir = make_run_dir(args.artifacts, command)
    frozen = provenance()
    write_json(
        run_dir / "invocation.json",
        {
            **frozen,
            "argv": sys.argv,
            "case_count": 1,
            "timeout_ms": args.timeout_ms,
            "max_power_cuts": args.max_power_cuts,
            "max_power_candidates": args.max_power_candidates,
        },
    )
    result = solve_case(
        case, args.timeout_ms, run_dir, args.seed, args.max_power_cuts,
        args.max_power_candidates, frozen_provenance=frozen
    )
    print(json.dumps({
        "case_id": result["case_id"], "status": result["status"],
        "elapsed_seconds": result["elapsed_seconds"],
        "power_cut_count": result["power_cut_count"], "run_dir": str(run_dir),
    }, sort_keys=True))
    return 0 if result["status"] in {"sat", "unsat"} else 2


def command_case(args: argparse.Namespace) -> int:
    return _single_case(
        args, Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh), "case"
    )


def command_smoke(args: argparse.Namespace) -> int:
    return _single_case(args, Case("paired", "SSS", 0, 1), "smoke")


def command_power_selftest(_args: argparse.Namespace) -> int:
    diagonal = [[row != col for col in range(5)] for row in range(5)]
    if surviving_permutations(diagonal) != [tuple(range(5))]:
        raise AssertionError("diagonal unique-matching self-test failed")
    ambiguous = [row[:] for row in diagonal]
    ambiguous[0][1] = False
    ambiguous[1][0] = False
    if len(surviving_permutations(ambiguous)) != 2:
        raise AssertionError("ambiguous-matching self-test failed")
    print(json.dumps({
        "status": "ok", "permutations_enumerated": len(PERMUTATIONS_5),
        "unique_case_survivors": 1, "ambiguous_case_survivors": 2,
    }, sort_keys=True))
    return 0


def run_case_matrix(
    args: argparse.Namespace,
    cases: list[Case],
    command_name: str,
    source_summary: Path | None = None,
) -> int:
    if not 1 <= args.workers <= 24:
        raise SystemExit("--workers must be between 1 and 24")
    run_dir = make_run_dir(args.artifacts, command_name)
    frozen = provenance()
    write_json(run_dir / "invocation.json", {
        **frozen, "argv": sys.argv, "case_count": len(cases),
        "workers": args.workers, "timeout_ms": args.timeout_ms,
        "max_power_cuts": args.max_power_cuts,
        "max_power_candidates": args.max_power_candidates,
        "source_summary": str(source_summary) if source_summary else None,
        "source_summary_sha256": file_sha256(source_summary) if source_summary else None,
    })
    payloads = [
        (
            asdict(case), args.timeout_ms, args.max_power_cuts,
            args.max_power_candidates, str(run_dir), args.seed + index,
            str(frozen["script_sha256"]), frozen,
        )
        for index, case in enumerate(cases)
    ]
    statuses: Counter[str] = Counter()
    compact_results = []
    started = time.monotonic()
    with concurrent.futures.ProcessPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(_worker, payload) for payload in payloads]
        for completed, future in enumerate(concurrent.futures.as_completed(futures), 1):
            result = future.result()
            status = str(result["status"])
            statuses[status] += 1
            compact_results.append({
                "case_id": result["case_id"], "status": status,
                "elapsed_seconds": result["elapsed_seconds"],
                "power_cut_count": result.get("power_cut_count"),
                "power_candidate_count": result.get("power_candidate_count"),
                "unsat_core_families": result.get("unsat_core_families"),
                "reason_unknown": result.get("reason_unknown"),
                "schema_version": result["schema_version"],
                "script_sha256": result["script_sha256"],
                "encoding_sha256": result.get("encoding_sha256"),
            })
            if completed == 1 or completed % 10 == 0 or status in {"sat", "error"}:
                print(json.dumps({
                    "completed": completed, "total": len(cases),
                    "statuses": dict(statuses),
                }, sort_keys=True), flush=True)
    summary = {
        **frozen, "case_count": len(cases),
        "elapsed_seconds": time.monotonic() - started,
        "statuses": dict(statuses),
        "complete": statuses["unknown"] == 0 and statuses["error"] == 0,
        "results": sorted(compact_results, key=lambda item: item["case_id"]),
    }
    write_json(run_dir / "matrix_summary.json", summary)
    print(json.dumps({
        **summary, "results": "matrix_summary.json", "run_dir": str(run_dir)
    }, sort_keys=True))
    return 0 if summary["complete"] else 2


def command_matrix(args: argparse.Namespace) -> int:
    return run_case_matrix(args, v8.all_cases(), "matrix")


def command_secondcap_matrix(args: argparse.Namespace) -> int:
    return run_case_matrix(args, v8.all_secondcap_endpoint_cases(), "secondcap-endpoints")


def command_retry(args: argparse.Namespace) -> int:
    prior = json.loads(args.summary.read_text())
    if prior.get("target") != TARGET:
        raise SystemExit("cannot select retry cases from a different target")
    prior_schema = prior.get("schema_version")
    if not isinstance(prior_schema, int) or prior_schema > SCHEMA_VERSION:
        raise SystemExit("cannot select retry cases from an invalid or newer schema")
    retry_statuses = {"unknown"}
    if args.include_error:
        retry_statuses.add("error")
    requested = {
        str(result["case_id"]) for result in prior.get("results", [])
        if result.get("status") in retry_statuses
    }
    cases_by_id = {case.case_id: case for case in v8.all_cases()}
    missing = sorted(requested - cases_by_id.keys())
    if missing:
        raise SystemExit(f"summary contains unknown case ids: {missing}")
    cases = [cases_by_id[case_id] for case_id in sorted(requested)]
    if not cases:
        raise SystemExit(f"no cases with statuses {sorted(retry_statuses)}")
    return run_case_matrix(args, cases, "retry", args.summary)


def parser() -> argparse.ArgumentParser:
    common = argparse.ArgumentParser(add_help=False)
    common.add_argument("--timeout-ms", type=int, default=300_000)
    common.add_argument("--seed", type=int, default=97)
    common.add_argument("--max-power-cuts", type=int, default=256)
    common.add_argument("--max-power-candidates", type=int, default=2_000_000)
    common.add_argument("--artifacts", type=Path, default=HERE / "artifacts-v9")
    top = argparse.ArgumentParser(description=__doc__)
    sub = top.add_subparsers(dest="command", required=True)
    sub.add_parser("power-selftest").set_defaults(func=command_power_selftest)
    sub.add_parser("smoke", parents=[common]).set_defaults(func=command_smoke)
    one = sub.add_parser("case", parents=[common])
    one.add_argument("--arm", choices=(
        "paired", "fresh", "secondcap_collision", "secondcap_distinct"
    ), required=True)
    one.add_argument("--profiles", required=True)
    one.add_argument("--kept", type=int, required=True)
    one.add_argument("--deleted", type=int, required=True)
    one.add_argument("--fresh", type=int)
    one.set_defaults(func=command_case)
    matrix = sub.add_parser("matrix", parents=[common])
    matrix.add_argument("--workers", type=int, default=12)
    matrix.set_defaults(func=command_matrix)
    secondcap = sub.add_parser("secondcap-matrix", parents=[common])
    secondcap.add_argument("--workers", type=int, default=12)
    secondcap.set_defaults(func=command_secondcap_matrix)
    retry = sub.add_parser("retry", parents=[common])
    retry.add_argument("--summary", type=Path, required=True)
    retry.add_argument("--workers", type=int, default=12)
    retry.add_argument("--include-error", action="store_true")
    retry.set_defaults(func=command_retry)
    return top


def main() -> int:
    args = parser().parse_args()
    return args.func(args)


if __name__ == "__main__":
    raise SystemExit(main())
