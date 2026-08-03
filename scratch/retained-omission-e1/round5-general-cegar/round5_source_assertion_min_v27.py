"""v27 authenticated source/fix/original-assertion minimization pilot."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import time
from collections.abc import Mapping, Sequence
from pathlib import Path

import z3

import round5_cegar_v17 as v17
import round5_guard_support_core_v23 as v23
import round5_pb_lowering_core_v26 as v26

HERE = Path(__file__).resolve().parent
DEFAULT_OUTPUT = HERE / "v27-source-assertion-minimization.json"
SOURCE_ORDER = (
    "track_cyclic_alternation_cut",
    "track_exact_rich_profiles",
    "track_strict_kalmanson",
)


def sha(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def model_satisfies(model: z3.ModelRef, formulas: Sequence[z3.BoolRef]) -> bool:
    return all(z3.is_true(model.eval(item, model_completion=True)) for item in formulas)


def literal(fix: Mapping[str, object], ctx: z3.Context) -> z3.BoolRef:
    atom = z3.Bool(str(fix["bool"]), ctx=ctx)
    return atom if bool(fix["value"]) else z3.Not(atom)


def source_assertions(
    assertions: Sequence[z3.BoolRef],
) -> tuple[dict[str, z3.BoolRef], tuple[z3.BoolRef, ...]]:
    trackers = v17._tracker_refs(assertions)
    if {str(item) for item in trackers} != v17.TRACKER_ALLOWLIST:
        raise RuntimeError("raw tracker allowlist mismatch")
    tracker_ids = {item.get_id() for item in trackers}
    by_group: dict[str, z3.BoolRef] = {}
    for assertion in assertions:
        if assertion.get_id() in tracker_ids:
            continue
        names = v26.bool_constants((assertion,)) & v17.TRACKER_ALLOWLIST
        if len(names) != 1:
            raise RuntimeError(f"raw source assertion has tracker set {sorted(names)}")
        name = next(iter(names))
        if name in by_group:
            raise RuntimeError(f"duplicate raw source assertion for {name}")
        by_group[name] = assertion
    if set(by_group) != v17.TRACKER_ALLOWLIST:
        raise RuntimeError("raw source assertion allowlist mismatch")
    return by_group, tuple(trackers)


def group_clauses(assertion: z3.BoolRef, tracker_name: str) -> list[z3.BoolRef]:
    if not z3.is_implies(assertion) or str(assertion.arg(0)) != tracker_name:
        raise RuntimeError(f"{tracker_name} source assertion is not its expected implication")
    body = assertion.arg(1)
    return list(body.children()) if z3.is_and(body) else [body]


def raw_group_replay(
    raw_path: Path, raw_hash: str, fixes: Sequence[Mapping[str, object]],
    selected: Sequence[str], *, timeout_ms: int, seed: int, label: str,
) -> dict[str, object]:
    started = time.monotonic()
    assertions = v23._parse_raw(raw_path, raw_hash)
    _, trackers = source_assertions(assertions)
    tracker_ids = {item.get_id() for item in trackers}
    ctx = assertions[0].ctx
    substitutions = tuple(
        (z3.Bool(str(item["bool"]), ctx=ctx), z3.BoolVal(bool(item["value"]), ctx=ctx))
        for item in fixes
    ) + tuple(
        (item, z3.BoolVal(str(item) in selected, ctx=ctx)) for item in trackers
    )
    derived = tuple(
        z3.simplify(z3.substitute(item, *substitutions))
        for item in assertions if item.get_id() not in tracker_ids
    )
    solver = z3.Solver(ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    solver.add(*derived)
    checked = time.monotonic(); outcome = solver.check(); solved = time.monotonic() - checked
    verified = outcome != z3.sat or model_satisfies(solver.model(), derived)
    return {
        "label": label, "status": str(outcome),
        "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
        "model_replay_verified": verified if outcome == z3.sat else None,
        "selected_source_trackers": sorted(selected),
        "selected_source_sha256": sha(sorted(selected)),
        "fix_count": len(fixes), "fixes_sha256": v26.canonical_sha256(list(fixes)),
        "derived_formula_sha256": v26.expression_sha256(derived),
        "raw_formula_sha256": raw_hash, "solve_seconds": solved,
        "elapsed_seconds": time.monotonic() - started,
    }


def paired_group_replay(raw_path, raw_hash, fixes, selected, *, timeout_ms, seed):
    first = raw_group_replay(raw_path, raw_hash, fixes, selected, timeout_ms=timeout_ms, seed=seed, label="fresh_raw_parse_a")
    second = raw_group_replay(raw_path, raw_hash, fixes, selected, timeout_ms=timeout_ms, seed=seed, label="fresh_raw_parse_b")
    same = (
        first["status"] == second["status"]
        and first["derived_formula_sha256"] == second["derived_formula_sha256"]
        and first["selected_source_sha256"] == second["selected_source_sha256"]
        and first["fixes_sha256"] == second["fixes_sha256"]
        and first.get("model_replay_verified") is not False
        and second.get("model_replay_verified") is not False
    )
    status = first["status"] if same else "authentication_disagreement"
    return {"status": status, "authenticated": same and status in {"sat", "unsat"}, "primary": first, "independent": second}


def minimize_groups(raw_path, raw_hash, fixes, *, timeout_ms, seed):
    current = list(SOURCE_ORDER); trials = []
    for name in SOURCE_ORDER:
        candidate = [item for item in current if item != name]
        pair = paired_group_replay(raw_path, raw_hash, fixes, candidate, timeout_ms=timeout_ms, seed=seed)
        trials.append({"deleted": name, "candidate": candidate, "replay": pair})
        if not pair["authenticated"]:
            return current, trials, "unknown_fail_closed"
        if pair["status"] == "unsat":
            current = candidate
    return current, trials, "complete"


def selected_bodies(assertions, selected):
    by_group, _ = source_assertions(assertions)
    return [by_group[name].arg(1) for name in selected]


def minimize_fixes(
    assertions: Sequence[z3.BoolRef], selected: Sequence[str],
    fixes: Sequence[Mapping[str, object]], *, timeout_ms: int, seed: int,
) -> dict[str, object]:
    constraints = selected_bodies(assertions, selected); ctx = constraints[0].ctx
    solver = z3.Solver(ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1, unsat_core=True)
    solver.add(*constraints)
    assumptions = [literal(item, ctx) for item in fixes]
    by_text = {item.sexpr(): dict(fix) for item, fix in zip(assumptions, fixes)}
    checked = time.monotonic(); outcome = solver.check(*assumptions)
    if outcome != z3.unsat:
        return {"status": str(outcome), "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
                "elapsed_seconds": time.monotonic() - checked, "fixes": list(fixes), "trials": []}
    raw_core = list(solver.unsat_core())
    if len({item.sexpr() for item in raw_core}) != len(raw_core) or any(item.sexpr() not in by_text for item in raw_core):
        raise RuntimeError("fix core contains an unknown or duplicate literal")
    current = [by_text[item.sexpr()] for item in raw_core]
    current.sort(key=lambda item: (bool(item["value"]), str(item["bool"])))
    trials: list[dict[str, object]] = []
    for candidate_fix in list(current):
        candidate = [item for item in current if item != candidate_fix]
        candidate_assumptions = [literal(item, ctx) for item in candidate]
        started = time.monotonic(); result = solver.check(*candidate_assumptions); elapsed = time.monotonic() - started
        verified = result != z3.sat or model_satisfies(solver.model(), [*constraints, *candidate_assumptions])
        trials.append({"deleted": candidate_fix, "status": str(result), "elapsed_seconds": elapsed,
                       "model_replay_verified": verified if result == z3.sat else None,
                       "reason_unknown": solver.reason_unknown() if result == z3.unknown else None})
        if result == z3.unknown or not verified:
            return {"status": "unknown_fail_closed", "initial_core_size": len(raw_core), "fixes": current, "trials": trials}
        if result == z3.unsat:
            current = candidate
    return {"status": "complete", "initial_fix_count": len(fixes), "initial_core_size": len(raw_core),
            "fixes": current, "fixes_sha256": v26.canonical_sha256(current), "trials": trials,
            "inclusion_minimal": True}


def clause_records(assertions, selected):
    by_group, _ = source_assertions(assertions); records = []
    for group in selected:
        short = group.removeprefix("track_")
        clauses = group_clauses(by_group[group], group)
        for ordinal, clause in enumerate(clauses):
            records.append({"id": f"{short}:{ordinal:04d}", "source_tracker": group,
                            "source_conjunct_ordinal": ordinal,
                            "expression_sha256": v26.expression_sha256((clause,)), "expr": clause})
    return records


def minimize_clauses(assertions, selected, fixes, *, timeout_ms, seed, max_checks):
    records = clause_records(assertions, selected); ctx = records[0]["expr"].ctx
    solver = z3.Solver(ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1, unsat_core=True)
    fix_literals = [literal(item, ctx) for item in fixes]
    solver.add(*fix_literals)
    selectors = []
    for index, record in enumerate(records):
        selector = z3.Bool(f"v27_clause_{index:04d}", ctx=ctx)
        selectors.append(selector); solver.add(z3.Implies(selector, record["expr"]))
    started = time.monotonic(); outcome = solver.check(*selectors); initial_seconds = time.monotonic() - started
    if outcome != z3.unsat:
        return {"status": str(outcome), "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
                "original_clause_count": len(records), "initial_seconds": initial_seconds}
    by_selector = {str(selector): index for index, selector in enumerate(selectors)}
    core = list(solver.unsat_core())
    if any(str(item) not in by_selector for item in core):
        raise RuntimeError("clause core contains an unknown selector")
    current = sorted(by_selector[str(item)] for item in core)
    trials = []
    if len(current) > max_checks:
        return {"status": "check_budget_fail_closed", "original_clause_count": len(records),
                "initial_core_size": len(current), "selected_indices": current, "trials": trials}
    for index in list(current):
        candidate = [item for item in current if item != index]
        active = [selectors[item] for item in candidate]
        checked = time.monotonic(); result = solver.check(*active); elapsed = time.monotonic() - checked
        replay_formulas = [*fix_literals, *(records[item]["expr"] for item in candidate)]
        verified = result != z3.sat or model_satisfies(solver.model(), replay_formulas)
        trials.append({"deleted": records[index]["id"], "status": str(result), "elapsed_seconds": elapsed,
                       "model_replay_verified": verified if result == z3.sat else None,
                       "reason_unknown": solver.reason_unknown() if result == z3.unknown else None})
        if result == z3.unknown or not verified:
            return {"status": "unknown_fail_closed", "original_clause_count": len(records),
                    "initial_core_size": len(core), "selected_indices": current, "trials": trials}
        if result == z3.unsat:
            current = candidate
    selected_records = []
    for index in current:
        record = {key: value for key, value in records[index].items() if key != "expr"}
        expr = records[index]["expr"]
        record["sexpr"] = expr.sexpr()
        record["point_labels"] = sorted({int(x) for pair in re.findall(r"d_(\d+)_(\d+)", expr.sexpr()) for x in pair})
        selected_records.append(record)
    return {"status": "complete", "original_clause_count": len(records), "initial_core_size": len(core),
            "selected_clause_count": len(current), "selected_indices": current,
            "selected_clauses": selected_records, "trials": trials, "inclusion_minimal": True}


def raw_clause_replay(raw_path, raw_hash, selected_groups, fixes, selected_ids, *, timeout_ms, seed, label):
    assertions = v23._parse_raw(raw_path, raw_hash); records = clause_records(assertions, selected_groups)
    by_id = {record["id"]: record for record in records}
    if set(selected_ids) - set(by_id):
        raise RuntimeError("selected clause identity missing from fresh raw parse")
    ctx = assertions[0].ctx
    substitutions = tuple((z3.Bool(str(item["bool"]), ctx=ctx), z3.BoolVal(bool(item["value"]), ctx=ctx)) for item in fixes)
    formulas = tuple(z3.simplify(z3.substitute(by_id[item]["expr"], *substitutions)) for item in selected_ids)
    solver = z3.Solver(ctx=ctx); solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1); solver.add(*formulas)
    started = time.monotonic(); outcome = solver.check(); elapsed = time.monotonic() - started
    verified = outcome != z3.sat or model_satisfies(solver.model(), formulas)
    return {"label": label, "status": str(outcome), "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
            "model_replay_verified": verified if outcome == z3.sat else None,
            "formula_sha256": v26.expression_sha256(formulas), "clause_ids_sha256": sha(selected_ids),
            "fixes_sha256": v26.canonical_sha256(list(fixes)), "solve_seconds": elapsed}


def paired_clause_replay(raw_path, raw_hash, selected_groups, fixes, selected_ids, *, timeout_ms, seed):
    a = raw_clause_replay(raw_path, raw_hash, selected_groups, fixes, selected_ids, timeout_ms=timeout_ms, seed=seed, label="fresh_raw_clause_parse_a")
    b = raw_clause_replay(raw_path, raw_hash, selected_groups, fixes, selected_ids, timeout_ms=timeout_ms, seed=seed, label="fresh_raw_clause_parse_b")
    admitted = a["status"] == b["status"] == "unsat" and a["formula_sha256"] == b["formula_sha256"] and a["clause_ids_sha256"] == b["clause_ids_sha256"] and a["fixes_sha256"] == b["fixes_sha256"]
    return {"status": "authenticated_unsat" if admitted else "fail_closed", "admitted": admitted, "primary": a, "independent": b}


def run(*, timeout_ms, seed, max_clause_checks):
    terminal, raw_path, raw_blob_sha256, _ = v23.authenticated_input(0)
    raw_hash = str(terminal["raw_full_formula_sha256"])
    fixes, fixes_hash = v26.load_v22_candidate()
    groups, group_trials, group_status = minimize_groups(raw_path, raw_hash, fixes, timeout_ms=timeout_ms, seed=seed)
    result = {"schema_version": 27, "kind": "v27-source-fix-original-assertion-minimization",
              "input": {"raw_blob_path": str(raw_path), "raw_blob_sha256": raw_blob_sha256,
                        "raw_formula_sha256": raw_hash, "v22_fix_count": len(fixes),
                        "v22_fixes_sha256": fixes_hash, "z3_version": z3.get_version_string()},
              "source_minimization": {"status": group_status, "selected": groups, "trials": group_trials},
              "production_launched": False,
              "trust_boundary": "external Z3 exact-n15 discovery and fresh raw replay; no proof certificate or Lean/kernel ingress"}
    if group_status != "complete": return result
    assertions = v23._parse_raw(raw_path, raw_hash)
    fix_min = minimize_fixes(assertions, groups, fixes, timeout_ms=timeout_ms, seed=seed)
    result["fix_minimization"] = fix_min
    if fix_min["status"] != "complete": return result
    final_fixes = fix_min["fixes"]
    result["fix_terminal_replay"] = paired_group_replay(raw_path, raw_hash, final_fixes, groups, timeout_ms=timeout_ms, seed=seed)
    if result["fix_terminal_replay"]["status"] != "unsat" or not result["fix_terminal_replay"]["authenticated"]: return result
    assertions = v23._parse_raw(raw_path, raw_hash)
    clause_min = minimize_clauses(assertions, groups, final_fixes, timeout_ms=timeout_ms, seed=seed, max_checks=max_clause_checks)
    result["clause_minimization"] = clause_min
    if clause_min["status"] != "complete": return result
    ids = [item["id"] for item in clause_min["selected_clauses"]]
    result["clause_terminal_replay"] = paired_clause_replay(raw_path, raw_hash, groups, final_fixes, ids, timeout_ms=timeout_ms, seed=seed)
    result["terminal_status"] = "authenticated_unsat" if result["clause_terminal_replay"]["admitted"] else "fail_closed"
    return result


def main() -> int:
    parser = argparse.ArgumentParser(); parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--timeout-ms", type=int, default=120_000); parser.add_argument("--seed", type=int, default=2701)
    parser.add_argument("--max-clause-checks", type=int, default=500); args = parser.parse_args()
    if args.output.exists():
        raise FileExistsError(f"refusing to overwrite immutable v27 artifact: {args.output}")
    result = run(timeout_ms=args.timeout_ms, seed=args.seed, max_clause_checks=args.max_clause_checks)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"output": str(args.output), "status": result.get("terminal_status", "fail_closed"),
                      "groups": result.get("source_minimization", {}).get("selected"),
                      "fixes": len(result.get("fix_minimization", {}).get("fixes", [])),
                      "clauses": result.get("clause_minimization", {}).get("selected_clause_count")}, sort_keys=True))
    return 0 if result.get("terminal_status") == "authenticated_unsat" else 2


if __name__ == "__main__":
    raise SystemExit(main())
