#!/usr/bin/env python3
"""Round-5 v10: v9 plus a pre-solve full-shell power-cycle family.

The static family uses one unconditional rich full shell at each apex and two
active non-apex critical full rows.  Its five columns are the five distinct
circle centers.  The diagonal power entries are certified nonzero, so the
rank-four power-matrix theorem forces a directed cross-nonzero cycle.

The broader all-five-shell family is deliberately not emitted: in the DDD arm
it has 6,930 candidates and 582,120 explicit cycle terms.  This bounded slice
has at most 528 candidates and 44,352 cycle terms.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import itertools
import json
import os
import random
import sys
import time
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Sequence

import z3

import round5_cegar_v8 as v8
import round5_cegar_v9 as v9


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = HERE.parents[2]
TARGET = v8.TARGET
SCHEMA_VERSION = 10
SCRIPT_PATH = Path(__file__).resolve()
SCRIPT_SHA256 = hashlib.sha256(SCRIPT_PATH.read_bytes()).hexdigest()
SCHEMA_PATH = HERE / "schema_v10.json"
UV_LOCK_PATH = HERE / "uv.lock"
POWER_THEOREM = v9.POWER_THEOREM
STATIC_FAMILY = "power_pattern_static_centers_three_rich_two_critical"
MAX_STATIC_CANDIDATES = 528
MAX_STATIC_CYCLE_TERMS = 44_352

Case = v8.Case
Encoding = v8.Encoding
POINTS = v8.POINTS
NONAPICES = v8.NONAPICES
PERMUTATIONS_5 = v9.PERMUTATIONS_5


@dataclass(frozen=True)
class CenteredFullShell:
    name: str
    kind: str
    center: int
    support: tuple[z3.BoolRef, ...]
    activation: z3.BoolRef | None


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_contract() -> dict[str, object]:
    contract = v9.source_contract()
    role_map = dict(contract["role_map"])
    role_map["power_pattern_static_centers"] = POWER_THEOREM
    contract["role_map"] = role_map
    return contract


def provenance() -> dict[str, object]:
    return {
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "base_v8_script_sha256": file_sha256(HERE / "round5_cegar_v8.py"),
        "base_v9_script_sha256": file_sha256(HERE / "round5_cegar_v9.py"),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "uv_lock_sha256": file_sha256(UV_LOCK_PATH),
        "source_contract": source_contract(),
    }


def require_frozen_provenance(
    frozen: dict[str, object], expected_script_sha256: str
) -> dict[str, object]:
    """Fail closed if any worker dependency differs from the parent snapshot."""
    current = provenance()
    required = {
        "base_v8_script_sha256",
        "base_v9_script_sha256",
        "script_sha256",
        "schema_sha256",
        "uv_lock_sha256",
        "source_contract",
    }
    missing = sorted(required - frozen.keys())
    if missing:
        raise RuntimeError(f"frozen provenance lacks required fields: {missing}")
    if current != frozen:
        differing = sorted(
            key
            for key in current.keys() | frozen.keys()
            if current.get(key) != frozen.get(key)
        )
        raise RuntimeError(
            "worker provenance differs from parent-frozen map: "
            f"{differing}"
        )
    if current["script_sha256"] != expected_script_sha256:
        raise RuntimeError("frozen script hash differs from parent expectation")
    return current


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def directed_simple_cycles_5() -> tuple[tuple[int, ...], ...]:
    """The 84 directed simple cycles on a fixed labeled five-vertex set."""
    cycles: list[tuple[int, ...]] = []
    for length in range(2, 6):
        for vertices in itertools.combinations(range(5), length):
            root = vertices[0]
            for tail in itertools.permutations(vertices[1:]):
                cycles.append((root, *tail))
    if len(cycles) != 84 or len(set(cycles)) != 84:
        raise AssertionError("directed five-vertex cycle enumeration drift")
    return tuple(cycles)


DIRECTED_CYCLES_5 = directed_simple_cycles_5()


def rich_shell_choices(encoding: Encoding) -> tuple[tuple[CenteredFullShell, ...], ...]:
    """Choose exactly one radius at each of the three distinct rich centers."""
    by_apex: list[list[CenteredFullShell]] = [[], [], []]
    for (apex_index, cls), data in sorted(encoding.rich.items()):
        support = data["support"]
        if not isinstance(support, list):
            raise TypeError("rich support is not a full support list")
        by_apex[apex_index].append(
            CenteredFullShell(
                name=f"rich_{apex_index}_{cls}",
                kind="rich_full_class",
                center=v8.APICES[apex_index],
                support=tuple(support),
                activation=None,
            )
        )
    if any(not shells for shells in by_apex):
        raise AssertionError("every apex must provide an unconditional rich shell")
    return tuple(tuple(choice) for choice in itertools.product(*by_apex))


def critical_shell(encoding: Encoding, center: int) -> CenteredFullShell:
    return CenteredFullShell(
        name=f"critical_{center}",
        kind="critical_full_row",
        center=center,
        support=tuple(encoding.row[center, point] for point in POINTS),
        activation=encoding.used(center),
    )


def cycle_term(shells: Sequence[CenteredFullShell], cycle: Sequence[int]) -> z3.BoolRef:
    edges = []
    for offset, row in enumerate(cycle):
        col = cycle[(offset + 1) % len(cycle)]
        edges.append(z3.Not(shells[row].support[shells[col].center]))
    return z3.And(*edges)


def static_power_constraint(shells: Sequence[CenteredFullShell]) -> z3.BoolRef:
    if len(shells) != 5 or len({shell.center for shell in shells}) != 5:
        raise ValueError("static power cut requires five distinct carrier centers")
    activations = [shell.activation for shell in shells if shell.activation is not None]
    return z3.Implies(
        z3.And(*activations),
        z3.Or(*(cycle_term(shells, cycle) for cycle in DIRECTED_CYCLES_5)),
    )


def add_static_power_constraints(encoding: Encoding) -> dict[str, object]:
    constraints: list[z3.BoolRef] = []
    records: list[dict[str, object]] = []
    cycle_terms = 0
    for rich_choice in rich_shell_choices(encoding):
        for left, right in itertools.combinations(NONAPICES, 2):
            shells = (*rich_choice, critical_shell(encoding, left), critical_shell(encoding, right))
            if len({shell.center for shell in shells}) != 5:
                raise AssertionError("static shell centers are not distinct")
            constraints.append(static_power_constraint(shells))
            cycle_terms += len(DIRECTED_CYCLES_5)
            records.append(
                {
                    "rows": [
                        {"name": shell.name, "kind": shell.kind, "center": shell.center}
                        for shell in shells
                    ],
                    "activation_centers": [left, right],
                    "cycle_count": len(DIRECTED_CYCLES_5),
                }
            )
    if len(constraints) > MAX_STATIC_CANDIDATES:
        raise RuntimeError("static power candidate bound exceeded")
    if cycle_terms > MAX_STATIC_CYCLE_TERMS:
        raise RuntimeError("static power cycle-term bound exceeded")
    encoding.add(STATIC_FAMILY, *constraints)
    return {
        "family": STATIC_FAMILY,
        "lean_theorem": POWER_THEOREM,
        "antecedent": (
            "one unconditional positive-radius rich full shell at each of the three "
            "distinct apex centers and two active positive-radius critical full rows "
            "at distinct non-apex centers; columns are those five centers"
        ),
        "candidate_count": len(constraints),
        "cycle_terms_per_candidate": len(DIRECTED_CYCLES_5),
        "cycle_term_count": cycle_terms,
        "maximum_candidate_budget": MAX_STATIC_CANDIDATES,
        "maximum_cycle_term_budget": MAX_STATIC_CYCLE_TERMS,
        "records": records,
    }


def _has_cycle_by_static_enumeration(edge: Sequence[Sequence[bool]]) -> bool:
    return any(
        all(edge[cycle[i]][cycle[(i + 1) % len(cycle)]] for i in range(len(cycle)))
        for cycle in DIRECTED_CYCLES_5
    )


def _has_alternative_permutation(edge: Sequence[Sequence[bool]]) -> bool:
    identity = tuple(range(5))
    for permutation in PERMUTATIONS_5:
        if permutation == identity:
            continue
        if all(row == permutation[row] or edge[row][permutation[row]] for row in range(5)):
            return True
    return False


def command_static_selftest(_args: argparse.Namespace) -> int:
    tests: list[list[list[bool]]] = []
    tests.append([[False] * 5 for _ in range(5)])
    two_cycle = [[False] * 5 for _ in range(5)]
    two_cycle[0][1] = two_cycle[1][0] = True
    tests.append(two_cycle)
    five_cycle = [[False] * 5 for _ in range(5)]
    for i in range(5):
        five_cycle[i][(i + 1) % 5] = True
    tests.append(five_cycle)
    rng = random.Random(979610)
    for _ in range(4096):
        tests.append([
            [
                False if row == col else bool(rng.getrandbits(1))
                for col in range(5)
            ]
            for row in range(5)
        ])
    for index, edge in enumerate(tests):
        cycle = _has_cycle_by_static_enumeration(edge)
        permutation = _has_alternative_permutation(edge)
        if cycle != permutation:
            raise AssertionError(f"cycle/permutation equivalence failed at test {index}")

    symbolic_support = [
        tuple(z3.Bool(f"selftest_support_{row}_{col}") for col in range(5))
        for row in range(5)
    ]
    symbolic_shells = tuple(
        CenteredFullShell(
            name=f"selftest_{row}",
            kind="selftest_full_shell",
            center=row,
            support=symbolic_support[row],
            activation=z3.BoolVal(True),
        )
        for row in range(5)
    )
    static_formula = static_power_constraint(symbolic_shells)
    no_cross_nonzeros = z3.Solver()
    no_cross_nonzeros.add(static_formula)
    no_cross_nonzeros.add(*(
        symbolic_support[row][col]
        for row in range(5)
        for col in range(5)
        if row != col
    ))
    if no_cross_nonzeros.check() != z3.unsat:
        raise AssertionError("static formula accepted a graph with no nonzero cycle")
    with_two_cycle = z3.Solver()
    with_two_cycle.add(static_formula)
    with_two_cycle.add(z3.Not(symbolic_support[0][1]))
    with_two_cycle.add(z3.Not(symbolic_support[1][0]))
    if with_two_cycle.check() != z3.sat:
        raise AssertionError("static formula rejected a certified two-cycle")

    expected_counts = {"SSS": 66, "SSD": 132, "SDD": 264, "DDD": 528}
    for profiles, expected in expected_counts.items():
        choices = 1
        for profile in profiles:
            choices *= 1 if profile == "S" else 2
        actual = choices * len(tuple(itertools.combinations(NONAPICES, 2)))
        if actual != expected:
            raise AssertionError(f"candidate count drift for {profiles}: {actual}")

    frozen = provenance()
    require_frozen_provenance(frozen, str(frozen["script_sha256"]))
    mutated = dict(frozen)
    mutated["base_v8_script_sha256"] = "0" * 64
    try:
        require_frozen_provenance(mutated, str(frozen["script_sha256"]))
    except RuntimeError as exc:
        if "base_v8_script_sha256" not in str(exc):
            raise AssertionError("provenance rejection omitted changed field") from exc
    else:
        raise AssertionError("mutated frozen dependency was accepted")
    print(
        json.dumps(
            {
                "status": "ok",
                "permutations_per_test": len(PERMUTATIONS_5),
                "cycles_per_test": len(DIRECTED_CYCLES_5),
                "graphs_tested": len(tests),
                "max_static_candidates": MAX_STATIC_CANDIDATES,
                "max_static_cycle_terms": MAX_STATIC_CYCLE_TERMS,
                "mutated_frozen_dependency_rejected": True,
            },
            sort_keys=True,
        )
    )
    return 0


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
    static_artifact: dict[str, object] | None = None
    lazy_cuts: list[dict[str, object]] = []
    solver_check_seconds = 0.0
    scan_seconds = 0.0
    scan_budget = v9.PowerSearchBudget(deadline, max_power_candidates)
    status = "error"
    reason: str | None = None
    terminal_model: z3.ModelRef | None = None
    initial_hash: str | None = None
    try:
        if timeout_ms <= 0 or max_power_cuts < 0 or max_power_candidates <= 0:
            raise ValueError(
                "timeout and candidate budget must be positive; cut budget nonnegative"
            )
        require_frozen_provenance(launch, expected_script_sha256)
        encoding = Encoding(case, timeout_ms=timeout_ms, seed=seed)
        static_artifact = add_static_power_constraints(encoding)
        solver, initial_smt2 = encoding.make_solver()
        initial_hash = hashlib.sha256(initial_smt2.encode()).hexdigest()
        while True:
            remaining = v9._remaining_ms(deadline)
            if remaining <= 0:
                status, reason = "unknown", "wall_clock_budget_exhausted"
                break
            solver.set(timeout=max(1, remaining))
            check_started = time.monotonic()
            outcome = solver.check()
            solver_check_seconds += time.monotonic() - check_started
            if outcome == z3.unsat:
                status = "unsat"
                break
            if outcome == z3.unknown:
                status, reason = "unknown", solver.reason_unknown()
                break
            model = solver.model()
            scan_started = time.monotonic()
            found = v9.mine_power_cut(encoding, model, scan_budget)
            scan_seconds += time.monotonic() - scan_started
            if found is None:
                status, terminal_model = "sat", model
                break
            if len(lazy_cuts) >= max_power_cuts:
                status, reason = "unknown", "power_cut_budget_exhausted"
                break
            cut, record = found
            record["cut_index"] = len(lazy_cuts)
            lazy_cuts.append(record)
            solver.assert_and_track(
                cut,
                z3.Bool(f"track_power_pattern_rank4_full_shell_{len(lazy_cuts) - 1:04d}"),
            )
    except v9.PowerBudgetExhausted as exc:
        status, reason = "unknown", str(exc)
    except Exception as exc:
        status, reason = "error", f"{type(exc).__name__}: {exc}"

    write_json(case_dir / "static_power_constraints.json", static_artifact or {})
    write_json(
        case_dir / "power_cuts.json",
        {
            "family": "power_pattern_rank4_full_shell",
            "lean_theorem": POWER_THEOREM,
            "cut_count": len(lazy_cuts),
            "candidate_count": scan_budget.candidates_checked,
            "cuts": lazy_cuts,
        },
    )
    final_hash: str | None = None
    if solver is not None:
        final_smt2 = solver.sexpr() + "\n(check-sat)\n"
        final_hash = hashlib.sha256(final_smt2.encode()).hexdigest()
        with gzip.open(case_dir / "encoding.smt2.gz", "wt", encoding="utf-8") as handle:
            handle.write(final_smt2)
    counts = encoding.constraint_counts() if encoding else {}
    result: dict[str, object] = {
        **base_result,
        "status": status,
        "elapsed_seconds": time.monotonic() - started,
        "solver_check_seconds": solver_check_seconds,
        "power_scan_seconds": scan_seconds,
        "timeout_ms": timeout_ms,
        "max_power_cuts": max_power_cuts,
        "max_power_candidates": max_power_candidates,
        "static_power_candidate_count": (static_artifact or {}).get("candidate_count", 0),
        "static_power_cycle_term_count": (static_artifact or {}).get("cycle_term_count", 0),
        "static_power_file": "static_power_constraints.json",
        "power_cut_count": len(lazy_cuts),
        "power_candidate_count": scan_budget.candidates_checked,
        "power_cut_file": "power_cuts.json",
        "constraint_counts": counts,
        "constraint_total": sum(counts.values()) + len(lazy_cuts),
        "initial_encoding_sha256": initial_hash,
        "encoding_sha256": final_hash,
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
        result["reason_unknown"] = reason
    elif status == "error":
        result["error"] = reason
    write_json(case_dir / "result.json", result)
    return result


def make_run_dir(base: Path, command: str) -> Path:
    run_dir = base / f"{v8.timestamp_slug()}-{command}-pid{os.getpid()}"
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
        case,
        args.timeout_ms,
        run_dir,
        args.seed,
        args.max_power_cuts,
        args.max_power_candidates,
        frozen_provenance=frozen,
    )
    print(
        json.dumps(
            {
                "case_id": result["case_id"],
                "status": result["status"],
                "elapsed_seconds": result["elapsed_seconds"],
                "static_power_candidate_count": result["static_power_candidate_count"],
                "power_cut_count": result["power_cut_count"],
                "run_dir": str(run_dir),
            },
            sort_keys=True,
        )
    )
    return 0 if result["status"] in {"sat", "unsat"} else 2


def command_case(args: argparse.Namespace) -> int:
    return _single_case(
        args, Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh), "case"
    )


def command_smoke(args: argparse.Namespace) -> int:
    return _single_case(args, Case("paired", "SSS", 0, 1), "smoke")


def _worker(
    payload: tuple[
        dict[str, object], int, int, int, str, int, str, dict[str, object]
    ],
) -> dict[str, object]:
    case_data, timeout_ms, max_cuts, max_candidates, out_dir, seed, expected, frozen = payload
    return solve_case(
        Case(**case_data), timeout_ms, Path(out_dir), seed, max_cuts, max_candidates,
        expected, frozen,
    )


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
    write_json(
        run_dir / "invocation.json",
        {
            **frozen,
            "argv": sys.argv,
            "case_count": len(cases),
            "workers": args.workers,
            "timeout_ms": args.timeout_ms,
            "max_power_cuts": args.max_power_cuts,
            "max_power_candidates": args.max_power_candidates,
            "source_summary": str(source_summary) if source_summary else None,
            "source_summary_sha256": file_sha256(source_summary) if source_summary else None,
        },
    )
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
            compact_results.append(
                {
                    "case_id": result["case_id"],
                    "status": status,
                    "elapsed_seconds": result["elapsed_seconds"],
                    "static_power_candidate_count": result.get("static_power_candidate_count"),
                    "static_power_cycle_term_count": result.get("static_power_cycle_term_count"),
                    "power_cut_count": result.get("power_cut_count"),
                    "power_candidate_count": result.get("power_candidate_count"),
                    "unsat_core_families": result.get("unsat_core_families"),
                    "reason_unknown": result.get("reason_unknown"),
                    "schema_version": result["schema_version"],
                    "script_sha256": result["script_sha256"],
                    "encoding_sha256": result.get("encoding_sha256"),
                }
            )
            if completed == 1 or completed % 10 == 0 or status in {"sat", "error"}:
                print(
                    json.dumps(
                        {
                            "completed": completed,
                            "total": len(cases),
                            "statuses": dict(statuses),
                        },
                        sort_keys=True,
                    ),
                    flush=True,
                )
    summary = {
        **frozen,
        "case_count": len(cases),
        "elapsed_seconds": time.monotonic() - started,
        "statuses": dict(statuses),
        "complete": statuses["unknown"] == 0 and statuses["error"] == 0,
        "results": sorted(compact_results, key=lambda item: item["case_id"]),
    }
    write_json(run_dir / "matrix_summary.json", summary)
    print(
        json.dumps(
            {**summary, "results": "matrix_summary.json", "run_dir": str(run_dir)},
            sort_keys=True,
        )
    )
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
        str(result["case_id"])
        for result in prior.get("results", [])
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
    common.add_argument("--artifacts", type=Path, default=HERE / "artifacts-v10")
    top = argparse.ArgumentParser(description=__doc__)
    sub = top.add_subparsers(dest="command", required=True)
    sub.add_parser("static-selftest").set_defaults(func=command_static_selftest)
    sub.add_parser("smoke", parents=[common]).set_defaults(func=command_smoke)
    one = sub.add_parser("case", parents=[common])
    one.add_argument(
        "--arm",
        choices=("paired", "fresh", "secondcap_collision", "secondcap_distinct"),
        required=True,
    )
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
