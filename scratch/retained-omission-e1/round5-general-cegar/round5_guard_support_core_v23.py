"""Bounded v23 guard-support core pilot over authenticated v19 assignments.

The named QF_LRA core is discovery evidence.  A projected Boolean fix set is
admitted only when two fresh parses of the exact frozen raw formula both prove
UNSAT after applying exactly that set.  Every parse and derived formula is
content-addressed; SAT, UNKNOWN, malformed support, or replay disagreement
fails closed to the complete 825-fix assignment.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
import time
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path

import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v20 as v20
import z3

HERE = Path(__file__).resolve().parent
SCHEMA_VERSION = 23
DEFAULT_OUTPUT = HERE / "v23-guard-support-core-pilot.json"
DEFAULT_MAP = HERE / "v23-normalized-constraint-map.json.gz"


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def expression_sha256(expressions: Iterable[z3.ExprRef]) -> str:
    return hashlib.sha256(
        "\n".join(expression.sexpr() for expression in expressions).encode()
    ).hexdigest()


def _flatten_and(expression: z3.BoolRef, path: tuple[int, ...] = ()):
    if z3.is_and(expression):
        for index, child in enumerate(expression.children()):
            yield from _flatten_and(child, path + (index,))
    else:
        yield path, expression


def _bool_constants(expression: z3.ExprRef) -> set[str]:
    result: set[str] = set()
    for node in v16._walk((expression,)):
        if (
            z3.is_const(node)
            and z3.is_bool(node)
            and not z3.is_true(node)
            and not z3.is_false(node)
            and node.decl().kind() == z3.Z3_OP_UNINTERPRETED
        ):
            result.add(str(node))
    return result


def _parse_raw(raw_path: Path, raw_formula_sha256: str) -> tuple[z3.BoolRef, ...]:
    ctx = z3.Context()
    with gzip.open(raw_path, "rt", encoding="utf-8") as handle:
        assertions = tuple(z3.parse_smt2_string(handle.read(), ctx=ctx))
    if v17.raw_formula_sha256(assertions) != raw_formula_sha256:
        raise RuntimeError("fresh raw-formula semantic SHA-256 mismatch")
    return assertions


def authenticated_input(assignment_ordinal: int):
    terminal = v20.authenticate_v19_terminal()
    blockers = terminal["blockers"]
    if not isinstance(blockers, list) or not 0 <= assignment_ordinal < len(blockers):
        raise ValueError("assignment ordinal is outside authenticated v19 journal")
    result_path = Path(str(terminal["result_path"]))
    result = json.loads(result_path.read_text())
    blob = result["frozen_blob_hashes"]["full_frozen"]
    raw_path = result_path.parent / str(blob["file"])
    raw_blob_sha256 = v20.file_sha256(raw_path)
    if raw_blob_sha256 != blob["sha256"]:
        raise RuntimeError("saved v19 raw blob SHA-256 mismatch")
    assignment = tuple(blockers[assignment_ordinal])
    if len(assignment) != 825:
        raise RuntimeError("saved v19 assignment is not complete")
    return terminal, raw_path, raw_blob_sha256, assignment


def named_normalized_constraints(
    assertions: Sequence[z3.BoolRef], assignment: Sequence[Mapping[str, object]]
) -> tuple[list[dict[str, object]], list[z3.BoolRef], dict[str, object]]:
    """Guard fine raw atoms, then normalize their conjunction exactly once."""
    semantic = {str(item["bool"]): bool(item["value"]) for item in assignment}
    if len(semantic) != len(assignment):
        raise RuntimeError("duplicate semantic Bool in assignment")
    trackers = v17._tracker_refs(assertions)
    tracker_names = {str(item) for item in trackers}
    if tracker_names != v17.TRACKER_ALLOWLIST:
        raise RuntimeError("raw formula tracker allowlist mismatch")
    tracker_ids = {item.get_id() for item in trackers}
    ctx = assertions[0].ctx
    substitutions = tuple(
        (z3.Bool(name, ctx=ctx), z3.BoolVal(value, ctx=ctx))
        for name, value in sorted(semantic.items())
    ) + tuple((tracker, z3.BoolVal(True, ctx=ctx)) for tracker in trackers)

    occupied_bool_names = set(semantic) | tracker_names
    records: list[dict[str, object]] = []
    guarded: list[z3.BoolRef] = []
    leaf_count = 0
    skipped_true = 0
    for source_index, assertion in enumerate(assertions):
        if assertion.get_id() in tracker_ids:
            continue
        for path, leaf in _flatten_and(assertion):
            leaf_count += 1
            bools = _bool_constants(leaf)
            unknown = bools - set(semantic) - tracker_names
            if unknown:
                raise RuntimeError(f"unclassified Boolean guards: {sorted(unknown)[:8]}")
            support = tuple(sorted(bools & set(semantic)))
            simplified = z3.simplify(z3.substitute(leaf, *substitutions))
            if z3.is_true(simplified):
                skipped_true += 1
                continue
            name = f"v23_norm_atom_{len(records):06d}"
            if name in occupied_bool_names:
                raise RuntimeError(f"selector collision: {name}")
            record = {
                "name": name,
                "source_assertion_index": source_index,
                "conjunction_path": list(path),
                "source_leaf_sha256": expression_sha256((leaf,)),
                "support": list(support),
                "support_sha256": canonical_sha256(list(support)),
            }
            records.append(record)
            guarded.append(z3.Implies(z3.Bool(name, ctx=ctx), simplified))

    rewritten = v17.rewrite_weighted_pbs(z3.And(*guarded))
    goal = z3.Goal(ctx=ctx)
    goal.add(rewritten)
    transformed = z3.Tactic("card2bv", ctx=ctx)(goal)
    if len(transformed) != 1:
        raise RuntimeError("global guarded card2bv normalization split the goal")
    normalized = list(transformed[0])

    audit = v17.logic_audit(normalized)
    if audit["accepted"] is not True:
        raise RuntimeError(f"complete named normalization failed QF_LRA audit: {audit}")
    provenance = {
        "source_assertion_count": len(assertions) - len(trackers),
        "source_leaf_count": leaf_count,
        "skipped_true_leaf_count": skipped_true,
        "named_atom_count": len(records),
        "normalized_constraint_count": len(normalized),
        "normalized_formula_sha256": expression_sha256(normalized),
        "constraint_map_sha256": canonical_sha256(records),
        "logic_audit": audit,
    }
    return records, normalized, provenance


def extract_named_core(
    records: Sequence[Mapping[str, object]], constraints: Sequence[z3.BoolRef],
    *, timeout_ms: int, seed: int,
) -> dict[str, object]:
    ctx = constraints[0].ctx if constraints else z3.main_ctx()
    # The formula has passed the QF_LRA audit, but a generic solver is used
    # because the named Boolean assumptions are meta-level core selectors.
    solver = z3.Solver(ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1, unsat_core=True)
    by_name = {str(record["name"]): record for record in records}
    if len(by_name) != len(records):
        raise ValueError("duplicate normalized atom name")
    solver.add(*constraints)
    assumptions = tuple(z3.Bool(name, ctx=ctx) for name in by_name)
    started = time.monotonic()
    outcome = solver.check(*assumptions)
    elapsed = time.monotonic() - started
    if outcome != z3.unsat:
        return {
            "status": str(outcome),
            "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
            "elapsed_seconds": elapsed,
            "raw_core_size": 0,
            "projected_support": [],
        }
    core_names = [str(item) for item in solver.unsat_core()]
    if len(core_names) != len(set(core_names)) or any(name not in by_name for name in core_names):
        raise RuntimeError("UNSAT core contains duplicate or unknown tracker")
    core_records = [dict(by_name[name]) for name in core_names]
    support = sorted({name for record in core_records for name in record["support"]})
    return {
        "status": "unsat",
        "reason_unknown": None,
        "elapsed_seconds": elapsed,
        "raw_core_size": len(core_names),
        "core_names": core_names,
        "core_names_sha256": canonical_sha256(core_names),
        "core_constraints": core_records,
        "projected_support": support,
        "projected_support_sha256": canonical_sha256(support),
    }


def replay_raw_projection(
    raw_path: Path, raw_formula_sha256: str,
    fixes: Sequence[Mapping[str, object]], *, timeout_ms: int, seed: int, label: str,
) -> dict[str, object]:
    started = time.monotonic()
    try:
        assertions = _parse_raw(raw_path, raw_formula_sha256)
        ctx = assertions[0].ctx
        typed_fixes = tuple(
            v16.Fix(z3.Bool(str(item["bool"]), ctx=ctx), bool(item["value"]))
            for item in fixes
        )
        trackers = v17._tracker_refs(assertions)
        tracker_ids = {item.get_id() for item in trackers}
        substitutions = tuple(
            (fix.variable, z3.BoolVal(fix.value, ctx=ctx)) for fix in typed_fixes
        ) + tuple((tracker, z3.BoolVal(True, ctx=ctx)) for tracker in trackers)
        simplified = tuple(
            z3.simplify(z3.substitute(assertion, *substitutions))
            for assertion in assertions if assertion.get_id() not in tracker_ids
        )
        goal = z3.Goal(ctx=ctx)
        goal.add(*simplified)
        transformed = z3.Then("pb-preprocess", "card2bv", ctx=ctx)(goal)
        if len(transformed) != 1:
            raise RuntimeError("raw replay preprocessing split the goal")
        replay_formula = tuple(transformed[0])
        solver = z3.Solver(ctx=ctx)
        solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
        solver.add(*replay_formula)
        check_started = time.monotonic()
        outcome = solver.check()
        return {
            "label": label,
            "status": str(outcome),
            "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
            "raw_formula_sha256": raw_formula_sha256,
            "fix_count": len(fixes),
            "fixes_sha256": canonical_sha256(list(fixes)),
            "derived_replay_assertion_count": len(replay_formula),
            "derived_replay_formula_sha256": expression_sha256(replay_formula),
            "derived_logic_audit": v17.logic_audit(replay_formula),
            "pipeline": ["fresh raw parse", "fix and tracker substitution", "simplify", "pb-preprocess", "card2bv"],
            "solve_seconds": time.monotonic() - check_started,
            "elapsed_seconds": time.monotonic() - started,
        }
    except (MemoryError, OSError, RuntimeError, ValueError, z3.Z3Exception) as exc:
        return {
            "label": label,
            "status": "replay_error",
            "error": f"{type(exc).__name__}: {exc}",
            "raw_formula_sha256": raw_formula_sha256,
            "fix_count": len(fixes),
            "fixes_sha256": canonical_sha256(list(fixes)),
            "elapsed_seconds": time.monotonic() - started,
        }


def run_pilot(
    *, assignment_ordinal: int, core_timeout_ms: int, replay_timeout_ms: int,
    seed: int, map_path: Path,
) -> dict[str, object]:
    terminal, raw_path, raw_blob_sha256, assignment = authenticated_input(assignment_ordinal)
    assertions = _parse_raw(raw_path, str(terminal["raw_full_formula_sha256"]))
    records, constraints, normalization = named_normalized_constraints(assertions, assignment)
    map_payload = {
        "schema_version": SCHEMA_VERSION,
        "raw_formula_sha256": terminal["raw_full_formula_sha256"],
        "assignment_ordinal": assignment_ordinal,
        "assignment_sha256": canonical_sha256(list(assignment)),
        "normalization": normalization,
        "constraints": records,
    }
    with gzip.open(map_path, "wt", encoding="utf-8") as handle:
        json.dump(map_payload, handle, sort_keys=True, separators=(",", ":"))
        handle.write("\n")
    map_blob_sha256 = v20.file_sha256(map_path)

    core = extract_named_core(records, constraints, timeout_ms=core_timeout_ms, seed=seed)
    values = {str(item["bool"]): bool(item["value"]) for item in assignment}
    candidate = [
        {"bool": name, "value": values[name]}
        for name in core.get("projected_support", [])
    ] if core["status"] == "unsat" else list(assignment)
    first = replay_raw_projection(
        raw_path, str(terminal["raw_full_formula_sha256"]), candidate,
        timeout_ms=replay_timeout_ms, seed=seed, label="primary_fresh_raw_parse",
    )
    second = replay_raw_projection(
        raw_path, str(terminal["raw_full_formula_sha256"]), candidate,
        timeout_ms=replay_timeout_ms, seed=seed, label="independent_fresh_context_raw_replay",
    )
    replay_agrees = (
        first["status"] == second["status"] == "unsat"
        and first["fixes_sha256"] == second["fixes_sha256"] == canonical_sha256(candidate)
        and first["raw_formula_sha256"] == second["raw_formula_sha256"]
        and first.get("derived_replay_formula_sha256") == second.get("derived_replay_formula_sha256")
    )
    admitted = core["status"] == "unsat" and replay_agrees
    return {
        "schema_version": SCHEMA_VERSION,
        "kind": "v23-guard-support-named-qf-lra-core-pilot",
        "production_launched": False,
        "assignment_ordinal": assignment_ordinal,
        "input_authentication": {
            key: terminal[key] for key in (
                "summary_path", "summary_sha256", "result_path", "result_sha256",
                "journal_path", "raw_full_formula_sha256", "semantic_bool_count",
                "full_blocker_count", "full_blockers_sha256",
            )
        } | {"raw_blob_path": str(raw_path), "raw_blob_sha256": raw_blob_sha256},
        "assignment_sha256": canonical_sha256(list(assignment)),
        "normalization": normalization,
        "constraint_map": {"path": str(map_path), "blob_sha256": map_blob_sha256},
        "named_core": core,
        "candidate_fixes": candidate,
        "candidate_fixes_sha256": canonical_sha256(candidate),
        "replay_gate": {
            "required": "two fresh exact-raw parses, identical derived formula hashes, both UNSAT",
            "primary": first,
            "independent": second,
            "agrees": replay_agrees,
        },
        "admission": {
            "status": "admitted_unsat_projection" if admitted else "fail_closed_full_assignment",
            "admitted": admitted,
            "retained_fix_count": len(candidate) if admitted else len(assignment),
            "removed_fix_count": len(assignment) - len(candidate) if admitted else 0,
        },
        "trust_boundary": "external Z3 evidence only; no proof certificate, Lean theorem, or kernel ingress",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--assignment-ordinal", type=int, default=0)
    parser.add_argument("--core-timeout-ms", type=int, default=60_000)
    parser.add_argument("--replay-timeout-ms", type=int, default=60_000)
    parser.add_argument("--seed", type=int, default=97)
    parser.add_argument("--constraint-map", type=Path, default=DEFAULT_MAP)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    result = run_pilot(
        assignment_ordinal=args.assignment_ordinal,
        core_timeout_ms=args.core_timeout_ms,
        replay_timeout_ms=args.replay_timeout_ms,
        seed=args.seed,
        map_path=args.constraint_map,
    )
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "output": str(args.output),
        "core_status": result["named_core"]["status"],
        "core_size": result["named_core"]["raw_core_size"],
        "projected_fix_count": len(result["candidate_fixes"]),
        "admission": result["admission"]["status"],
    }, sort_keys=True))
    return 0 if result["admission"]["admitted"] else 2


if __name__ == "__main__":
    raise SystemExit(main())
