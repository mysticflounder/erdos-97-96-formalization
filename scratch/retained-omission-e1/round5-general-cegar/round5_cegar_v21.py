"""Offline v21 pilot for cube-relative, master-proved blocker projection.

This module has no production ``solve_case`` or child-wave entrypoint.  It can
only authenticate a saved terminal v19 master and test the following rule:

    A = I and V,  M and C -> I,  F and I and V -> False
    -------------------------------------------------
                    M and C and V -> False

The second premise must be an authenticated v19 complete-assignment replay.
Any SAT, UNKNOWN, replay disagreement, or identity mismatch returns the
original complete blocker.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
import time
from collections.abc import Mapping, Sequence
from pathlib import Path

import z3

import round5_cegar_v16 as v16
import round5_cegar_v19 as v19
import round5_cegar_v20 as v20

HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 21
PILOT_OUTPUT = HERE / "v21-saved-model-pilot.json"

Fix = v16.Fix


def _fix_record(fixes: Sequence[Fix]) -> list[dict[str, object]]:
    return [fix.record() for fix in sorted(fixes, key=lambda item: str(item.variable))]


def _fix_map(fixes: Sequence[Fix]) -> dict[str, Fix]:
    result: dict[str, Fix] = {}
    for fix in fixes:
        name = str(fix.variable)
        if name in result:
            raise ValueError(f"duplicate fix: {name}")
        result[name] = fix
    return result


def _literal(fix: Fix) -> z3.BoolRef:
    return fix.variable == z3.BoolVal(fix.value)


def _sha256_text(value: str) -> str:
    return hashlib.sha256(value.encode()).hexdigest()


def _complete_blocker_sha256(fixes: Sequence[Fix]) -> str:
    return _sha256_text(v16.blocker_for_core(fixes).sexpr())


def _authenticated_full_check_reason(
    fixes: Sequence[Fix], record: Mapping[str, object], raw_formula_sha256: str
) -> str | None:
    assignment_sha256 = v19.canonical_sha256(_fix_record(fixes))
    if record.get("status") != "unsat":
        return "full_check_not_unsat"
    if record.get("generalized") is not False:
        return "full_check_not_complete_fallback"
    if record.get("blocker_scope") != "complete_semantic_assignment":
        return "full_check_scope_mismatch"
    if record.get("assignment_sha256") != assignment_sha256:
        return "full_check_assignment_hash_mismatch"
    if record.get("frozen_full_formula_sha256") != raw_formula_sha256:
        return "full_check_raw_formula_hash_mismatch"
    if record.get("expected_complete_blocker_sha256") != _complete_blocker_sha256(fixes):
        return "full_check_blocker_hash_mismatch"
    primary = record.get("primary")
    replay = record.get("fresh_normalized_full_replay")
    if not isinstance(primary, Mapping) or primary.get("status") != "unsat":
        return "full_check_primary_not_unsat"
    if not isinstance(replay, Mapping):
        return "full_check_fresh_replay_missing"
    if replay.get("status") != "unsat" or replay.get("replay_status") != "unsat":
        return "full_check_fresh_replay_not_unsat"
    if replay.get("assignment_sha256") != assignment_sha256:
        return "full_check_fresh_assignment_hash_mismatch"
    if replay.get("raw_formula_sha256") != raw_formula_sha256:
        return "full_check_fresh_formula_hash_mismatch"
    if replay.get("complete_assignment_size") != len(fixes):
        return "full_check_fresh_assignment_size_mismatch"
    return None


def _entailment_replay(
    assertions: Sequence[z3.BoolRef],
    cube_fixes: Sequence[Fix],
    invariant_fixes: Sequence[Fix],
    timeout_ms: int,
    seed: int,
    *,
    fresh_context: bool,
) -> dict[str, object]:
    if fresh_context:
        context = z3.Context()
        assertions = tuple(assertion.translate(context) for assertion in assertions)
        cube_literals = tuple(_literal(fix).translate(context) for fix in cube_fixes)
        invariant_literals = tuple(
            _literal(fix).translate(context) for fix in invariant_fixes
        )
    else:
        context = assertions[0].ctx if assertions else z3.main_ctx()
        cube_literals = tuple(_literal(fix) for fix in cube_fixes)
        invariant_literals = tuple(_literal(fix) for fix in invariant_fixes)
    solver = z3.Solver(ctx=context)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    solver.add(*assertions)
    solver.add(*cube_literals)
    solver.add(z3.Not(z3.And(*invariant_literals)))
    query_hash = v16.formula_sha256(solver)
    started = time.monotonic()
    outcome = solver.check()
    record: dict[str, object] = {
        "outcome": str(outcome),
        "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
        "elapsed_seconds": time.monotonic() - started,
        "fresh_context": fresh_context,
        "query_formula_sha256": query_hash,
        "assertion_count": len(solver.assertions()),
    }
    if outcome == z3.sat:
        model = solver.model()
        violated = [
            fix.record()
            for fix, literal in zip(invariant_fixes, invariant_literals, strict=True)
            if not z3.is_true(model.eval(literal, model_completion=True))
        ]
        record["countermodel_violated_invariant_count"] = len(violated)
        record["countermodel_violated_invariant_examples"] = violated[:20]
    return record


def project_or_fallback(
    *,
    master_assertions: Sequence[z3.BoolRef],
    full_fixes: Sequence[Fix],
    cube_fixes: Sequence[Fix],
    retained_names: Sequence[str],
    full_check: Mapping[str, object],
    raw_formula_sha256: str,
    expected_master_formula_sha256: str,
    authenticated_master_formula_sha256: str,
    expected_cumulative_blocker_sha256: str,
    authenticated_cumulative_blocker_sha256: str,
    timeout_ms: int,
    seed: int = 97,
) -> tuple[tuple[Fix, ...], dict[str, object]]:
    """Return C union V only after dual authenticated entailment replay."""
    full = _fix_map(full_fixes)
    fallback = tuple(full[name] for name in sorted(full))
    base: dict[str, object] = {
        "scheme": "round5-v21-cube-relative-master-projection/v1",
        "expected_master_formula_sha256": expected_master_formula_sha256,
        "authenticated_master_formula_sha256": authenticated_master_formula_sha256,
        "expected_cumulative_blocker_sha256": expected_cumulative_blocker_sha256,
        "authenticated_cumulative_blocker_sha256": authenticated_cumulative_blocker_sha256,
        "raw_formula_sha256": raw_formula_sha256,
        "complete_fix_count": len(fallback),
        "timeout_ms": timeout_ms,
        "seed": seed,
    }

    def fail(reason: str, **extra: object) -> tuple[tuple[Fix, ...], dict[str, object]]:
        return fallback, {
            **base,
            "status": "fallback_complete",
            "reason": reason,
            "projected": False,
            "returned_fix_count": len(fallback),
            **extra,
        }

    if timeout_ms <= 0:
        return fail("nonpositive_timeout")
    if expected_master_formula_sha256 != authenticated_master_formula_sha256:
        return fail("master_formula_hash_mismatch")
    if expected_cumulative_blocker_sha256 != authenticated_cumulative_blocker_sha256:
        return fail("cumulative_blocker_hash_mismatch")
    full_reason = _authenticated_full_check_reason(
        fallback, full_check, raw_formula_sha256
    )
    if full_reason is not None:
        return fail(full_reason)
    try:
        cube = _fix_map(cube_fixes)
    except ValueError as exc:
        return fail("invalid_cube", detail=str(exc))
    if not cube:
        return fail("empty_cube")
    for name, fix in cube.items():
        if name not in full or full[name].value != fix.value:
            return fail("cube_not_satisfied_by_assignment", offending_bool=name)
    retained_set = set(retained_names)
    if len(retained_set) != len(retained_names) or not retained_set.issubset(full):
        return fail("invalid_retained_name_set")
    invariant_names = sorted(set(full) - retained_set)
    if not invariant_names:
        return fail("no_omitted_literals")
    invariant_fixes = tuple(full[name] for name in invariant_names)
    projected_names = sorted(retained_set | set(cube))
    projected = tuple(full[name] for name in projected_names)
    if len(projected) >= len(fallback):
        return fail("projection_does_not_shorten")

    primary = _entailment_replay(
        master_assertions, tuple(cube.values()), invariant_fixes,
        timeout_ms, seed, fresh_context=False,
    )
    if primary["outcome"] != "unsat":
        return fail(f"master_entailment_{primary['outcome']}", primary=primary)
    fresh = _entailment_replay(
        master_assertions, tuple(cube.values()), invariant_fixes,
        timeout_ms, seed, fresh_context=True,
    )
    if fresh["outcome"] != "unsat":
        return fail(f"fresh_master_entailment_{fresh['outcome']}", primary=primary, fresh=fresh)
    blocker = v16.blocker_for_core(projected)
    return projected, {
        **base,
        "status": "projected",
        "reason": None,
        "projected": True,
        "cube": _fix_record(tuple(cube.values())),
        "cube_sha256": v19.canonical_sha256(_fix_record(tuple(cube.values()))),
        "invariant_fix_count": len(invariant_fixes),
        "retained_fix_count": len(retained_set),
        "returned_fix_count": len(projected),
        "returned_core_sha256": v19.canonical_sha256(_fix_record(projected)),
        "blocker": blocker.sexpr(),
        "blocker_sha256": _sha256_text(blocker.sexpr()),
        "logical_rule": "M and C entails I; authenticated F and I and V is UNSAT; admit not(C and V)",
        "primary": primary,
        "fresh": fresh,
    }


def _load_saved_terminal() -> dict[str, object]:
    terminal = v20.authenticate_v19_terminal()
    result_path = Path(str(terminal["result_path"]))
    result = json.loads(result_path.read_text())
    blob = result["frozen_blob_hashes"]["boolean_master"]
    blob_path = result_path.parent / str(blob["file"])
    if v20.file_sha256(blob_path) != blob["sha256"]:
        raise RuntimeError("saved Boolean-master blob hash mismatch")
    with gzip.open(blob_path, "rt", encoding="utf-8") as handle:
        serialized = handle.read()
    assertions = tuple(z3.parse_smt2_string(serialized))
    if not assertions:
        raise RuntimeError("saved Boolean master parsed to no assertions")
    blocker_hashes = [
        _sha256_text(v20.blocker_from_assignment(assignment).sexpr())
        for assignment in terminal["blockers"]
    ]
    cumulative = v19.canonical_sha256(blocker_hashes)
    if cumulative != result["cumulative_blocker_sha256"]:
        raise RuntimeError("saved cumulative blocker hash mismatch")
    trace_path = result_path.parent / str(result["cegar_trace_file"])
    if v20.file_sha256(trace_path) != result["cegar_trace_sha256"]:
        raise RuntimeError("saved v19 trace hash mismatch")
    trace = json.loads(trace_path.read_text())
    iterations = trace.get("iterations")
    if not isinstance(iterations, list) or len(iterations) != len(terminal["blockers"]):
        raise RuntimeError("saved v19 trace/blocker count mismatch")
    return {
        "terminal": terminal,
        "result": result,
        "assertions": assertions,
        "iterations": iterations,
        "boolean_master_blob": {
            "path": str(blob_path),
            "sha256": blob["sha256"],
            "parsed_assertion_count": len(assertions),
            "parsed_assertion_formula_sha256": v16.assertion_formula_sha256(assertions),
        },
        "authenticated_cumulative_blocker_sha256": cumulative,
    }


def run_saved_model_pilot(*, timeout_ms: int, cube_limit: int | None = None) -> dict[str, object]:
    saved = _load_saved_terminal()
    terminal = saved["terminal"]
    result = saved["result"]
    assignments = terminal["blockers"]
    values = [
        {str(item["bool"]): bool(item["value"]) for item in assignment}
        for assignment in assignments
    ]
    universe = sorted(values[0])
    if any(sorted(item) != universe for item in values):
        raise RuntimeError("saved assignments have different semantic universes")
    invariant_names = sorted(
        name for name in universe if len({assignment[name] for assignment in values}) == 1
    )
    varying_names = sorted(set(universe) - set(invariant_names))
    variables = {name: z3.Bool(name) for name in universe}
    cubes = v20.make_partition()
    if cube_limit is not None:
        if cube_limit <= 0:
            raise ValueError("cube_limit must be positive")
        cubes = cubes[:cube_limit]
    rows: list[dict[str, object]] = []
    for cube in cubes:
        cube_values = {
            str(item["bool"]): bool(item["value"]) for item in cube["assignment"]
        }
        ordinals = [
            ordinal for ordinal, assignment in enumerate(values)
            if all(assignment[name] == bit for name, bit in cube_values.items())
        ]
        if not ordinals:
            rows.append({
                "cube_id": cube["cube_id"], "assignment_count": 0,
                "status": "not_tested_empty_saved_cube", "shortened": False,
            })
            continue
        ordinal = ordinals[0]
        full_fixes = tuple(Fix(variables[name], values[ordinal][name]) for name in universe)
        cube_fixes = tuple(Fix(variables[name], cube_values[name]) for name in sorted(cube_values))
        core, decision = project_or_fallback(
            master_assertions=saved["assertions"],
            full_fixes=full_fixes,
            cube_fixes=cube_fixes,
            retained_names=varying_names,
            full_check=saved["iterations"][ordinal]["full_check"],
            raw_formula_sha256=result["full_frozen_formula_sha256"],
            expected_master_formula_sha256=result["final_master_formula_sha256"],
            authenticated_master_formula_sha256=result["final_master_formula_sha256"],
            expected_cumulative_blocker_sha256=result["cumulative_blocker_sha256"],
            authenticated_cumulative_blocker_sha256=saved[
                "authenticated_cumulative_blocker_sha256"
            ],
            timeout_ms=timeout_ms,
        )
        rows.append({
            "cube_id": cube["cube_id"],
            "cube_assignment": cube["assignment"],
            "assignment_count": len(ordinals),
            "representative_iteration": ordinal,
            "representative_assignment_sha256": saved["iterations"][ordinal][
                "assignment_sha256"
            ],
            "status": decision["status"],
            "reason": decision["reason"],
            "returned_fix_count": len(core),
            "shortened": len(core) < len(full_fixes),
            "decision": decision,
        })
    shortened_assignments = sum(
        int(row["assignment_count"]) for row in rows if row["shortened"] is True
    )
    return {
        "schema_version": SCHEMA_VERSION,
        "kind": "v21-read-only-saved-master-pilot",
        "production_launched": False,
        "source_script_sha256": v20.file_sha256(SCRIPT_PATH),
        "terminal_v19_summary_sha256": terminal["summary_sha256"],
        "terminal_v19_result_sha256": terminal["result_sha256"],
        "raw_full_formula_sha256": result["full_frozen_formula_sha256"],
        "final_master_formula_sha256": result["final_master_formula_sha256"],
        "cumulative_blocker_sha256": result["cumulative_blocker_sha256"],
        "boolean_master_blob": saved["boolean_master_blob"],
        "complete_assignment_count": len(assignments),
        "complete_fix_count": len(universe),
        "invariant_fix_count": len(invariant_names),
        "varying_fix_count": len(varying_names),
        "varying_names": varying_names,
        "tested_cube_count": len(rows),
        "timeout_ms_per_replay": timeout_ms,
        "shortened_cube_count": sum(row["shortened"] is True for row in rows),
        "shortened_current_assignment_count": shortened_assignments,
        "actually_shortens_current_v19_assignments": shortened_assignments > 0,
        "rows": rows,
        "trust_boundary": (
            "authenticated saved v19 artifacts plus primary/fresh Z3 master entailment; "
            "external solver evidence only, not Lean/kernel closure"
        ),
    }


def parser() -> argparse.ArgumentParser:
    result = argparse.ArgumentParser(description=__doc__)
    result.add_argument("--saved-pilot", action="store_true")
    result.add_argument("--timeout-ms", type=int, default=5_000)
    result.add_argument("--cube-limit", type=int)
    result.add_argument("--output", type=Path, default=PILOT_OUTPUT)
    return result


def main() -> int:
    args = parser().parse_args()
    if not args.saved_pilot:
        raise SystemExit("v21 is offline-only; pass --saved-pilot explicitly")
    report = run_saved_model_pilot(timeout_ms=args.timeout_ms, cube_limit=args.cube_limit)
    v20.atomic_write_json(args.output, report)
    print(json.dumps({
        "output": str(args.output),
        "tested_cube_count": report["tested_cube_count"],
        "shortened_cube_count": report["shortened_cube_count"],
        "shortened_current_assignment_count": report["shortened_current_assignment_count"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
