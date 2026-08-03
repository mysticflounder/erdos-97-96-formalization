#!/usr/bin/env python3
"""Round-5 v16: replay-authenticated Boolean-assignment CEGAR.

The v12 Boolean relaxation proposes complete assignments to every semantic
Boolean constant in the inherited v15 formula.  The raw inherited
QF_LRA+PB formula is checked with fresh assignment selectors.  An UNSAT core
may become a Boolean blocker only after its selector-only projection replays
UNSAT against a fresh solver containing the byte-frozen full assertions.

This remains external exact-n15 solver evidence, not a Lean proof or a
universal closure result.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import json
import sys
import time
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Iterable, Sequence

import z3
from z3.z3util import is_expr_val

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v15 as v15


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = v15.PROJECT_ROOT
TARGET = v15.TARGET
SCHEMA_VERSION = 16
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v16.json"
UV_LOCK_PATH = HERE / "uv.lock"
Case = v8.Case
Encoding = v15.Encoding


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode()).hexdigest()


def source_contract() -> dict[str, object]:
    contract = v15.source_contract()
    role_map = dict(contract["role_map"])
    role_map["boolean_assignment_cegar"] = (
        "v12 Boolean relaxation proposes complete semantic-Bool assignments; "
        "the unchanged v15 QF_LRA+PB assertions are checked directly, and only "
        "fresh-selector cores replayed UNSAT on a fresh frozen solver are blocked"
    )
    contract["role_map"] = role_map
    return contract


def provenance() -> dict[str, object]:
    return {
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "base_v15_script_sha256": file_sha256(HERE / "round5_cegar_v15.py"),
        "base_v14_script_sha256": file_sha256(HERE / "round5_cegar_v14.py"),
        "base_v13_script_sha256": file_sha256(HERE / "round5_cegar_v13.py"),
        "base_v12_script_sha256": file_sha256(HERE / "round5_cegar_v12.py"),
        "base_v8_script_sha256": file_sha256(HERE / "round5_cegar_v8.py"),
        "miner_v9_script_sha256": file_sha256(HERE / "round5_cegar_v9.py"),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "base_v15_schema_sha256": file_sha256(HERE / "schema_v15.json"),
        "base_v14_schema_sha256": file_sha256(HERE / "schema_v14.json"),
        "base_v13_schema_sha256": file_sha256(HERE / "schema_v13.json"),
        "base_v12_schema_sha256": file_sha256(HERE / "schema_v12.json"),
        "base_v8_schema_sha256": file_sha256(HERE / "schema_v8.json"),
        "uv_lock_sha256": file_sha256(UV_LOCK_PATH),
        "source_contract": source_contract(),
    }


def verify_frozen_provenance(
    frozen: dict[str, object], expected_script_sha256: str | None = None
) -> dict[str, object]:
    current = provenance()
    if frozen != current:
        differing = sorted(
            key for key in set(frozen) | set(current)
            if frozen.get(key) != current.get(key)
        )
        raise RuntimeError(f"frozen provenance differs from worker source: {differing}")
    if expected_script_sha256 is not None and current["script_sha256"] != expected_script_sha256:
        raise RuntimeError("worker v16 source hash differs from parent invocation")
    return current


def _walk(expressions: Iterable[z3.ExprRef]) -> Iterable[z3.ExprRef]:
    seen: set[int] = set()
    stack = list(expressions)
    while stack:
        node = stack.pop()
        node_id = node.get_id()
        if node_id in seen:
            continue
        seen.add(node_id)
        yield node
        stack.extend(node.children())


def collect_semantic_bools(
    expressions: Iterable[z3.ExprRef],
) -> tuple[z3.BoolRef, ...]:
    """Collect every uninterpreted Bool constant except provenance trackers."""
    by_name: dict[str, z3.BoolRef] = {}
    for node in _walk(expressions):
        if not z3.is_const(node) or is_expr_val(node) or not z3.is_bool(node):
            continue
        if node.decl().kind() != z3.Z3_OP_UNINTERPRETED:
            continue
        name = str(node)
        if name.startswith("track_"):
            continue
        previous = by_name.get(name)
        if previous is not None and not previous.eq(node):
            raise RuntimeError(f"ambiguous same-named semantic Bool: {name}")
        by_name[name] = node
    return tuple(by_name[name] for name in sorted(by_name))


def collect_tracker_names(expressions: Iterable[z3.ExprRef]) -> tuple[str, ...]:
    names = {
        str(node)
        for node in _walk(expressions)
        if z3.is_const(node)
        and not is_expr_val(node)
        and z3.is_bool(node)
        and node.decl().kind() == z3.Z3_OP_UNINTERPRETED
        and str(node).startswith("track_")
    }
    return tuple(sorted(names))


def configured_solver(timeout_ms: int, seed: int) -> z3.Solver:
    solver = z3.Solver()
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    return solver


def solver_from_assertions(
    assertions: Sequence[z3.BoolRef], timeout_ms: int, seed: int
) -> z3.Solver:
    solver = configured_solver(timeout_ms, seed)
    solver.add(*assertions)
    return solver


def formula_sha256(solver: z3.Solver) -> str:
    return hashlib.sha256((solver.sexpr() + "\n(check-sat)\n").encode()).hexdigest()


def assertion_formula_sha256(assertions: Sequence[z3.BoolRef]) -> str:
    return formula_sha256(solver_from_assertions(assertions, 1, 0))


def canonical_assignment(
    model: z3.ModelRef, semantic_bools: Sequence[z3.BoolRef]
) -> tuple[tuple[str, bool], ...]:
    assignment = []
    for variable in semantic_bools:
        value = model.eval(variable, model_completion=True)
        if not z3.is_true(value) and not z3.is_false(value):
            raise RuntimeError(f"model completion did not fix Bool {variable}: {value}")
        assignment.append((str(variable), z3.is_true(value)))
    assignment.sort()
    if len({name for name, _ in assignment}) != len(assignment):
        raise RuntimeError("canonical assignment contains duplicate Bool names")
    return tuple(assignment)


@dataclass(frozen=True)
class Fix:
    variable: z3.BoolRef
    value: bool

    def record(self) -> dict[str, object]:
        return {"bool": str(self.variable), "value": self.value}


def _fixes_for_assignment(
    semantic_bools: Sequence[z3.BoolRef],
    assignment: Sequence[tuple[str, bool]],
) -> tuple[Fix, ...]:
    values = dict(assignment)
    if set(values) != {str(variable) for variable in semantic_bools}:
        raise RuntimeError("assignment is not complete for the semantic-Bool universe")
    return tuple(Fix(variable, values[str(variable)]) for variable in semantic_bools)


def _add_selector_fixes(
    solver: z3.Solver, fixes: Sequence[Fix], nonce: str
) -> tuple[tuple[z3.BoolRef, Fix], ...]:
    selected = []
    for index, fix in enumerate(fixes):
        selector = z3.Bool(f"v16_fix_{nonce}_{index:05d}")
        solver.add(z3.Implies(selector, fix.variable == z3.BoolVal(fix.value)))
        selected.append((selector, fix))
    return tuple(selected)


def replay_projected_core(
    frozen_assertions: Sequence[z3.BoolRef],
    core_fixes: Sequence[Fix],
    timeout_ms: int,
    seed: int,
    nonce: str = "replay",
) -> dict[str, object]:
    """Replay only projected semantic fixes on a fresh frozen full solver."""
    started = time.monotonic()
    solver = solver_from_assertions(frozen_assertions, timeout_ms, seed)
    selected = _add_selector_fixes(solver, core_fixes, nonce)
    outcome = solver.check(*(selector for selector, _ in selected))
    status = str(outcome)
    return {
        "status": status,
        "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
        "elapsed_seconds": time.monotonic() - started,
        "core": [fix.record() for fix in core_fixes],
        "core_sha256": canonical_sha256([fix.record() for fix in core_fixes]),
        "frozen_full_formula_sha256": assertion_formula_sha256(frozen_assertions),
        "replay_formula_sha256": formula_sha256(solver),
    }


def authenticate_unsat_core(replay: dict[str, object]) -> None:
    if replay.get("status") != "unsat":
        raise RuntimeError(
            "projected selector core failed fresh frozen replay: "
            f"{replay.get('status')}"
        )


def blocker_for_core(core_fixes: Sequence[Fix]) -> z3.BoolRef:
    if not core_fixes:
        return z3.BoolVal(False)
    opposites = [
        z3.Not(fix.variable) if fix.value else fix.variable
        for fix in core_fixes
    ]
    return z3.Or(*opposites)


def check_assignment(
    frozen_assertions: Sequence[z3.BoolRef],
    fixes: Sequence[Fix],
    timeout_ms: int,
    seed: int,
    iteration: int,
) -> tuple[str, z3.ModelRef | None, tuple[Fix, ...], dict[str, object]]:
    """Check one complete assignment and authenticate any UNSAT projection."""
    started = time.monotonic()
    solver = solver_from_assertions(frozen_assertions, timeout_ms, seed)
    selected = _add_selector_fixes(solver, fixes, f"check_{iteration:06d}")
    by_selector = {selector.get_id(): fix for selector, fix in selected}
    outcome = solver.check(*(selector for selector, _ in selected))
    elapsed = time.monotonic() - started
    if outcome == z3.sat:
        return "sat", solver.model(), (), {
            "status": "sat", "elapsed_seconds": elapsed,
            "reason_unknown": None, "raw_core_size": 0,
        }
    if outcome == z3.unknown:
        return "unknown", None, (), {
            "status": "unknown", "elapsed_seconds": elapsed,
            "reason_unknown": solver.reason_unknown(), "raw_core_size": 0,
        }

    raw_core = tuple(solver.unsat_core())
    projected = tuple(
        by_selector[item.get_id()]
        for item in raw_core
        if item.get_id() in by_selector
    )
    if len(projected) != len(raw_core):
        unexpected = sorted(
            str(item) for item in raw_core if item.get_id() not in by_selector
        )
        raise RuntimeError(f"UNSAT core contains non-fix assumptions: {unexpected}")
    replay = replay_projected_core(
        frozen_assertions, projected, timeout_ms, seed,
        nonce=f"replay_{iteration:06d}",
    )
    authenticate_unsat_core(replay)
    return "unsat", None, projected, {
        "status": "unsat", "elapsed_seconds": elapsed,
        "reason_unknown": None, "raw_core_size": len(raw_core),
        "projected_core_size": len(projected), "replay": replay,
    }


def _remaining_ms(deadline: float) -> int:
    return max(0, int((deadline - time.monotonic()) * 1000))


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
    expected_script_sha256: str | None = None,
    frozen_provenance: dict[str, object] | None = None,
) -> dict[str, object]:
    del max_power_cuts, max_power_candidates  # v16 checks the raw full formula directly.
    started = time.monotonic()
    case_dir = out_dir / case.case_id
    case_dir.mkdir(parents=True, exist_ok=False)
    launch = frozen_provenance if frozen_provenance is not None else provenance()
    expected = expected_script_sha256 or str(launch["script_sha256"])
    result: dict[str, object] = {
        **launch,
        "case": asdict(case),
        "case_id": case.case_id,
        "solver": {
            "name": "z3", "version": z3.get_version_string(), "seed": seed,
            "threads": 1,
        },
        "theory_classification": "quantifier-free Bool + LRA + native PB (QF_LRA+PB)",
        "solver_lane": "raw z3.Solver; no SolverFor(QF_LRA) soundness dependency",
        "budgets": {
            "wall_clock_timeout_ms": timeout_ms,
            "boolean_prepass_timeout_ms": bool_timeout_ms,
            "replay_timeout_ms": replay_timeout_ms,
            "max_assignments": max_assignments,
            "max_bool_power_cuts": max_bool_power_cuts,
            "max_bool_power_candidates": max_bool_power_candidates,
        },
    }
    status = "error"
    reason: str | None = None
    encoding: Encoding | None = None
    master: z3.Solver | None = None
    frozen_assertions: tuple[z3.BoolRef, ...] = ()
    trace: list[dict[str, object]] = []
    blocker_hashes: list[str] = []
    prepass: dict[str, object] = {}
    terminal_model: z3.ModelRef | None = None
    semantic_bools: tuple[z3.BoolRef, ...] = ()
    initial_master_hash: str | None = None
    full_hash: str | None = None
    try:
        validated = verify_frozen_provenance(launch, expected)
        if timeout_ms <= 0 or replay_timeout_ms <= 0 or max_assignments <= 0:
            raise ValueError("v16 timeouts and assignment budget must be positive")
        if bool_timeout_ms <= 0 or max_bool_power_candidates <= 0 or max_bool_power_cuts < 0:
            raise ValueError("Boolean-prepass budgets must be positive; cut budget nonnegative")

        encoding = Encoding(case, timeout_ms=timeout_ms, seed=seed)
        tracked_full, _ = encoding.make_solver()
        for family in sorted(encoding.groups):
            tracked_full.add(z3.Bool(f"track_{family}"))
        gate = v12.FullSolverGate(tracked_full)
        prepass, learned, master = v12.run_boolean_prepass(
            encoding,
            gate,
            v12.PrepassConfig(
                bool_timeout_ms, max_bool_power_candidates, max_bool_power_cuts
            ),
            seed,
            validated_miner_sha256=str(validated["miner_v9_script_sha256"]),
        )
        if (
            prepass["status"] == "error"
            or prepass["all_learned_cuts_theorem_sound_and_provenance_complete"] is not True
        ):
            raise RuntimeError("inherited v12 learned-cut admission audit failed")
        if gate.pre_first_cut_count != len(learned):
            raise RuntimeError("an inherited learned cut did not reach the full formula")

        frozen_assertions = tuple(tracked_full.assertions())
        full_hash = assertion_formula_sha256(frozen_assertions)
        group_constraints = tuple(
            constraint
            for family in sorted(encoding.groups)
            for constraint in encoding.groups[family]
        )
        semantic_bools = collect_semantic_bools((*group_constraints, *frozen_assertions))
        trackers = collect_tracker_names(frozen_assertions)
        expected_family_trackers = {
            f"track_{family}" for family in encoding.groups
        }
        missing_trackers = sorted(expected_family_trackers - set(trackers))
        if missing_trackers:
            raise RuntimeError(f"full formula lost family trackers: {missing_trackers}")
        learned_trackers = tuple(
            name for name in trackers if name.startswith("track_v12_pre_power_")
        )
        if len(learned_trackers) != len(learned):
            raise RuntimeError("full formula lost inherited learned-cut trackers")
        if any(str(variable).startswith("track_") for variable in semantic_bools):
            raise RuntimeError("provenance tracker entered semantic-Bool universe")

        initial_master_hash = formula_sha256(master)
        deadline = time.monotonic() + timeout_ms / 1000
        if prepass["sound_full_case_unsat"] is True:
            status = "unsat"
            result["unsat_phase"] = "inherited_boolean_prepass"
        else:
            for iteration in range(max_assignments):
                remaining = _remaining_ms(deadline)
                if remaining <= 0:
                    status, reason = "unknown", "v16_wall_clock_budget_exhausted"
                    break
                master.set(timeout=max(1, remaining))
                master_started = time.monotonic()
                master_outcome = master.check()
                master_seconds = time.monotonic() - master_started
                if master_outcome == z3.unsat:
                    status = "unsat"
                    result["unsat_phase"] = "replay_authenticated_boolean_master"
                    break
                if master_outcome == z3.unknown:
                    status, reason = "unknown", f"boolean_master: {master.reason_unknown()}"
                    break

                assignment = canonical_assignment(master.model(), semantic_bools)
                assignment_record = [
                    {"bool": name, "value": value} for name, value in assignment
                ]
                assignment_hash = canonical_sha256(assignment_record)
                fixes = _fixes_for_assignment(semantic_bools, assignment)
                check_budget = min(remaining, replay_timeout_ms)
                outcome, model, core, check_record = check_assignment(
                    frozen_assertions, fixes, check_budget, seed, iteration
                )
                record: dict[str, object] = {
                    "iteration": iteration,
                    "master_check_seconds": master_seconds,
                    "master_formula_sha256_before": formula_sha256(master),
                    "assignment": assignment_record,
                    "assignment_sha256": assignment_hash,
                    "semantic_bool_count": len(semantic_bools),
                    "full_check": check_record,
                }
                if outcome == "sat":
                    assert model is not None
                    validation = encoding.validate_model(model)
                    record["model_validation"] = validation
                    if validation["failures"]:
                        raise RuntimeError("full SAT model failed raw assertion replay")
                    trace.append(record)
                    terminal_model = model
                    status = "sat"
                    break
                if outcome == "unknown":
                    trace.append(record)
                    status = "unknown"
                    reason = f"full_assignment_check: {check_record['reason_unknown']}"
                    break

                blocker = blocker_for_core(core)
                core_record = [fix.record() for fix in core]
                blocker_hash = hashlib.sha256(blocker.sexpr().encode()).hexdigest()
                master.add(blocker)
                blocker_hashes.append(blocker_hash)
                record.update({
                    "projected_core": core_record,
                    "projected_core_sha256": canonical_sha256(core_record),
                    "blocker": blocker.sexpr(),
                    "blocker_sha256": blocker_hash,
                    "master_formula_sha256_after": formula_sha256(master),
                    "cumulative_blocker_sha256": canonical_sha256(blocker_hashes),
                })
                trace.append(record)
            else:
                status, reason = "budget", "v16_assignment_budget_exhausted"
    except Exception as exc:
        status, reason = "error", f"{type(exc).__name__}: {exc}"

    trace_artifact = {
        "case_id": case.case_id,
        "semantic_bool_count": len(semantic_bools),
        "semantic_bools": [str(variable) for variable in semantic_bools],
        "full_frozen_formula_sha256": full_hash,
        "initial_master_formula_sha256": initial_master_hash,
        "final_master_formula_sha256": formula_sha256(master) if master is not None else None,
        "blocker_count": len(blocker_hashes),
        "cumulative_blocker_sha256": canonical_sha256(blocker_hashes),
        "iterations": trace,
    }
    v12.write_json(case_dir / "cegar_trace_v16.json", trace_artifact)
    v12.write_json(case_dir / "boolean_prepass_v16.json", prepass)
    if master is not None:
        master_text = master.sexpr() + "\n(check-sat)\n"
        with gzip.open(case_dir / "boolean_master_v16.smt2.gz", "wt", encoding="utf-8") as handle:
            handle.write(master_text)
    if frozen_assertions:
        frozen_solver = solver_from_assertions(frozen_assertions, 1, seed)
        full_text = frozen_solver.sexpr() + "\n(check-sat)\n"
        with gzip.open(case_dir / "full_frozen_v16.smt2.gz", "wt", encoding="utf-8") as handle:
            handle.write(full_text)

    result.update({
        "status": status,
        "complete": status in {"sat", "unsat"},
        "reason_incomplete": reason if status in {"unknown", "budget"} else None,
        "error": reason if status == "error" else None,
        "elapsed_seconds": time.monotonic() - started,
        "constraint_counts": encoding.constraint_counts() if encoding else {},
        "boolean_prepass": prepass,
        "semantic_bool_count": len(semantic_bools),
        "tracker_count": len(collect_tracker_names(frozen_assertions)),
        "full_frozen_formula_sha256": full_hash,
        "initial_master_formula_sha256": initial_master_hash,
        "final_master_formula_sha256": formula_sha256(master) if master is not None else None,
        "assignment_checks": len(trace),
        "blocker_count": len(blocker_hashes),
        "cumulative_blocker_sha256": canonical_sha256(blocker_hashes),
        "cegar_trace_file": "cegar_trace_v16.json",
        "cegar_trace_sha256": file_sha256(case_dir / "cegar_trace_v16.json"),
        "boolean_prepass_file": "boolean_prepass_v16.json",
        "boolean_prepass_sha256": file_sha256(case_dir / "boolean_prepass_v16.json"),
        "boolean_master_file": "boolean_master_v16.smt2.gz" if master is not None else None,
        "full_frozen_file": "full_frozen_v16.smt2.gz" if frozen_assertions else None,
    })
    if terminal_model is not None and encoding is not None:
        v12.write_json(case_dir / "witness_v16.json", encoding.serialize_model(terminal_model))
        result["witness_file"] = "witness_v16.json"
        result["witness_sha256"] = file_sha256(case_dir / "witness_v16.json")
    v12.write_json(case_dir / "result.json", result)
    return result


def _worker(payload: tuple[dict[str, object], dict[str, object]]) -> dict[str, object]:
    data, frozen = payload
    local = dict(data)
    case = Case(**local.pop("case"))
    return solve_case(case, frozen_provenance=frozen, **local)


def _args_budgets(args: argparse.Namespace) -> dict[str, object]:
    return {
        "timeout_ms": args.timeout_ms,
        "bool_timeout_ms": args.bool_timeout_ms,
        "replay_timeout_ms": args.replay_timeout_ms,
        "max_assignments": args.max_assignments,
        "max_bool_power_cuts": args.max_bool_power_cuts,
        "max_bool_power_candidates": args.max_bool_power_candidates,
    }


def run_cases(args: argparse.Namespace, cases: Sequence[Case], command: str) -> int:
    started = time.monotonic()
    if not 1 <= args.workers <= 24:
        raise ValueError("workers must be in the closed interval 1..24")
    run_dir = v8.make_run_dir(args.artifacts, command)
    frozen = provenance()
    invocation = {
        **frozen, "argv": sys.argv, "case_count": len(cases),
        "workers": args.workers, "resolved_budgets": _args_budgets(args),
    }
    v12.write_json(run_dir / "invocation.json", invocation)
    payloads = [({
        "case": asdict(case), "timeout_ms": args.timeout_ms, "out_dir": run_dir,
        "seed": args.seed + index,
        "max_power_cuts": args.max_power_cuts,
        "max_power_candidates": args.max_power_candidates,
        "bool_timeout_ms": args.bool_timeout_ms,
        "max_bool_power_cuts": args.max_bool_power_cuts,
        "max_bool_power_candidates": args.max_bool_power_candidates,
        "max_assignments": args.max_assignments,
        "replay_timeout_ms": args.replay_timeout_ms,
        "expected_script_sha256": str(frozen["script_sha256"]),
    }, frozen) for index, case in enumerate(cases)]
    with concurrent.futures.ProcessPoolExecutor(max_workers=args.workers) as pool:
        results = list(pool.map(_worker, payloads))
    counts = Counter(str(item["status"]) for item in results)
    complete = (
        len(results) == len(cases)
        and all(item.get("complete") is True for item in results)
    )
    summary = {
        **invocation, "command": command,
        "elapsed_seconds": time.monotonic() - started,
        "counts": dict(sorted(counts.items())), "complete": complete,
        "results": results,
    }
    v12.write_json(run_dir / "summary.json", summary)
    print(json.dumps({
        "counts": summary["counts"], "complete": complete,
        "run_dir": str(run_dir),
    }, sort_keys=True))
    return 0 if complete else 2


def parser() -> argparse.ArgumentParser:
    parser = v15.parser()
    parser.description = __doc__
    for action in parser._actions:
        if isinstance(action, argparse._SubParsersAction):
            for subparser in action.choices.values():
                subparser.add_argument("--max-assignments", type=int, default=256)
                subparser.add_argument("--replay-timeout-ms", type=int, default=30_000)
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = HERE / "artifacts-v16"
    return parser


def main() -> int:
    args = parser().parse_args()
    if args.command == "smoke":
        args.workers = 1
        return run_cases(args, [Case("paired", "SSS", 0, 1, None)], "smoke")
    if args.command == "case":
        args.workers = 1
        case = Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
        return run_cases(args, [case], "case")
    if args.command == "matrix":
        return run_cases(args, v8.all_cases(), "matrix")
    if args.command == "secondcap-matrix":
        return run_cases(args, v8.all_secondcap_endpoint_cases(), "secondcap-matrix")
    if args.command == "retry":
        raise SystemExit("v16 retry is intentionally unsupported; launch explicit cases")
    raise AssertionError(args.command)


if __name__ == "__main__":
    raise SystemExit(main())
