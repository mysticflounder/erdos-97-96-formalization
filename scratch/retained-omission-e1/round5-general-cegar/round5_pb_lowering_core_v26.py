"""Bounded v26 PB-lowering/source-core pilot over the authenticated v22 blocker.

This is discovery evidence only.  Every remaining PB atom is isolated behind a
fresh proxy, lowered in a Boolean-only goal, and all generated auxiliaries are
renamed and assigned to exactly one raw source tracker.  UNKNOWN, a non-single
tactic subgoal, an unmapped auxiliary, or fresh-raw replay disagreement fails
closed.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import time
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path

import z3

import round5_blocker_min_v22 as v22
import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_guard_support_core_v23 as v23

HERE = Path(__file__).resolve().parent
SCHEMA_VERSION = 26
DEFAULT_OUTPUT = HERE / "v26-pb-lowering-source-core.json"
V22_RESULT = HERE / "v22-blocker-minimization-pilot.json"


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":")).encode()).hexdigest()


def expression_sha256(expressions: Iterable[z3.ExprRef]) -> str:
    return hashlib.sha256("\n".join(item.sexpr() for item in expressions).encode()).hexdigest()


def bool_constants(expressions: Iterable[z3.ExprRef]) -> set[str]:
    result: set[str] = set()
    for node in v16._walk(tuple(expressions)):
        if (z3.is_const(node) and z3.is_bool(node)
                and node.decl().kind() == z3.Z3_OP_UNINTERPRETED):
            result.add(str(node))
    return result


def bool_constant_refs(expressions: Iterable[z3.ExprRef]) -> dict[str, z3.BoolRef]:
    result: dict[str, z3.BoolRef] = {}
    for node in v16._walk(tuple(expressions)):
        if (z3.is_const(node) and z3.is_bool(node)
                and node.decl().kind() == z3.Z3_OP_UNINTERPRETED):
            result.setdefault(str(node), node)
    return result


def pb_nodes(expressions: Sequence[z3.ExprRef]) -> list[z3.BoolRef]:
    by_text: dict[str, z3.BoolRef] = {}
    for node in v16._walk(expressions):
        if not z3.is_quantifier(node) and node.decl().kind() in v17.PB_KINDS:
            by_text.setdefault(node.sexpr(), node)
    return [by_text[key] for key in sorted(by_text)]


def clause_only(expressions: Sequence[z3.BoolRef]) -> bool:
    def literal(item: z3.ExprRef) -> bool:
        return (z3.is_const(item) and z3.is_bool(item)) or (
            z3.is_not(item) and z3.is_const(item.arg(0)) and z3.is_bool(item.arg(0))
        )
    return all(literal(item) or (z3.is_or(item) and all(literal(c) for c in item.children()))
               for item in expressions)


def canonical_clause(item: z3.BoolRef) -> z3.BoolRef:
    if not z3.is_or(item):
        return item
    return z3.Or(*sorted(item.children(), key=lambda child: child.sexpr()))


def lower_pb_atoms(
    expressions: Sequence[z3.BoolRef], *, group_index: int, group_name: str,
) -> tuple[list[z3.BoolRef], list[dict[str, object]], dict[str, object]]:
    """Replace PB atoms by proxies and add exact Boolean CNF definitions."""
    atoms = pb_nodes(expressions)
    occupied = bool_constants(expressions)
    replacements: list[tuple[z3.ExprRef, z3.ExprRef]] = []
    definitions: list[z3.BoolRef] = []
    mappings: list[dict[str, object]] = []
    for pb_index, atom in enumerate(atoms):
        proxy_name = f"v26_pb_g{group_index:02d}_p{pb_index:03d}"
        if proxy_name in occupied:
            raise RuntimeError("PB proxy collision")
        proxy = z3.Bool(proxy_name, ctx=atom.ctx)
        child_replacements: list[tuple[z3.ExprRef, z3.ExprRef]] = []
        child_definitions: list[z3.BoolRef] = []
        child_proxies: list[dict[str, str]] = []
        for child_index, child in enumerate(atom.children()):
            if z3.is_const(child) and z3.is_bool(child):
                continue
            child_name = f"v26_pbc_g{group_index:02d}_p{pb_index:03d}_c{child_index:03d}"
            child_proxy = z3.Bool(child_name, ctx=atom.ctx)
            child_replacements.append((child, child_proxy))
            child_definitions.append(child_proxy == child)
            child_proxies.append({"name": child_name, "source_sha256": expression_sha256((child,))})
        abstracted_atom = z3.substitute(atom, *child_replacements) if child_replacements else atom
        # The authenticated lane has one strict weighted shape (13 unit
        # coefficients plus one coefficient 2); v17's audited identity rewrites
        # it to unit cardinalities before the general Boolean lowering.
        params = [int(value) for value in abstracted_atom.params()]
        if (abstracted_atom.decl().kind() == z3.Z3_OP_PB_GE and params
                and params[0] == 13 and len(abstracted_atom.children()) == 14
                and params[1:].count(1) == 13 and params[1:].count(2) == 1):
            abstracted_atom = v17.rewrite_weighted_pbs(abstracted_atom)
        goal = z3.Goal(ctx=atom.ctx)
        goal.add(proxy == abstracted_atom)
        transformed = z3.Then("card2bv", "pb2bv", "bit-blast", "tseitin-cnf", ctx=atom.ctx)(goal)
        if len(transformed) != 1:
            raise RuntimeError("PB definition lowering split the goal")
        clauses = list(transformed[0])
        audit = v17.logic_audit(clauses)
        if audit["accepted"] is not True or not clause_only(clauses):
            raise RuntimeError(f"PB definition did not lower to Boolean CNF: {audit}; atom={atom.sexpr()}")
        known = bool_constants((abstracted_atom,)) | {proxy_name}
        clause_refs = bool_constant_refs(clauses)
        # Z3's global fresh-name counter is intentionally ignored: first-use
        # order is stable for a fixed tactic result and gives deterministic
        # local names across fresh invocations.
        introduced = [name for name in clause_refs if name not in known]
        rename: list[tuple[z3.ExprRef, z3.ExprRef]] = []
        aux_names: list[str] = []
        for aux_index, old_name in enumerate(introduced):
            new_name = f"v26_aux_g{group_index:02d}_p{pb_index:03d}_a{aux_index:04d}"
            if new_name in occupied:
                raise RuntimeError("lowering auxiliary collision")
            occupied.add(new_name)
            aux_names.append(new_name)
            rename.append((clause_refs[old_name], z3.Bool(new_name, ctx=atom.ctx)))
        renamed = [canonical_clause(z3.substitute(clause, *rename) if rename else clause) for clause in clauses]
        renamed.sort(key=lambda clause: clause.sexpr())
        residual_new = bool_constants(renamed) - known - set(aux_names)
        if residual_new:
            raise RuntimeError(f"unmapped lowering auxiliaries: {sorted(residual_new)}")
        replacements.append((atom, proxy))
        definitions.extend(child_definitions)
        definitions.extend(renamed)
        mappings.append({
            "group": group_name,
            "group_index": group_index,
            "pb_index": pb_index,
            "pb_sha256": expression_sha256((atom,)),
            "proxy": proxy_name,
            "child_proxies": child_proxies,
            "auxiliaries": aux_names,
            "clause_count": len(renamed),
        })
    base = [z3.substitute(item, *replacements) if replacements else item for item in expressions]
    lowered = base + definitions
    audit = v17.logic_audit(lowered)
    if audit["accepted"] is not True:
        raise RuntimeError(f"group lowering failed zero-theory audit: {audit}")
    all_aux = {name for record in mappings for name in record["auxiliaries"]}
    present_aux = {name for name in bool_constants(lowered) if name.startswith("v26_aux_")}
    if present_aux != all_aux:
        raise RuntimeError("lowered auxiliary provenance is incomplete")
    return lowered, mappings, {
        "pre_pb_count": len(atoms), "post_audit": audit,
        "lowered_assertion_count": len(lowered), "lowered_sha256": expression_sha256(lowered),
    }


def load_v22_candidate() -> tuple[list[dict[str, object]], str]:
    data = json.loads(V22_RESULT.read_text())
    records = list(data["candidate_fixes"])
    digest = canonical_sha256(records)
    if len(records) != 55 or digest != data["candidate_fixes_sha256"]:
        raise RuntimeError("v22 55-fix candidate authentication failed")
    return records, digest


def build_lowered_groups(assertions: Sequence[z3.BoolRef], fixes: Sequence[Mapping[str, object]]):
    trackers = v17._tracker_refs(assertions)
    tracker_names = {str(item) for item in trackers}
    if tracker_names != v17.TRACKER_ALLOWLIST:
        raise RuntimeError("raw tracker allowlist mismatch")
    tracker_ids = {item.get_id() for item in trackers}
    ctx = assertions[0].ctx
    fix_values = {str(item["bool"]): bool(item["value"]) for item in fixes}
    substitutions = tuple((z3.Bool(n, ctx=ctx), z3.BoolVal(v, ctx=ctx)) for n, v in sorted(fix_values.items()))
    substitutions += tuple((item, z3.BoolVal(True, ctx=ctx)) for item in trackers)
    groups: list[dict[str, object]] = []
    guarded: list[z3.BoolRef] = []
    mappings: list[dict[str, object]] = []
    for source_index, assertion in enumerate(assertions):
        if assertion.get_id() in tracker_ids:
            continue
        names = bool_constants((assertion,)) & tracker_names
        if len(names) != 1:
            raise RuntimeError(f"source assertion {source_index} has tracker set {sorted(names)}")
        group_name = next(iter(names))
        simplified = z3.simplify(z3.substitute(assertion, *substitutions))
        goal = z3.Goal(ctx=ctx); goal.add(simplified)
        first = z3.Then("pb-preprocess", "card2bv", ctx=ctx)(goal)
        if len(first) != 1:
            raise RuntimeError("source preprocessing split the goal")
        pre = list(first[0])
        lowered, group_maps, audit = lower_pb_atoms(pre, group_index=len(groups), group_name=group_name)
        selector_name = f"v26_source_{len(groups):02d}"
        selector = z3.Bool(selector_name, ctx=ctx)
        guarded.extend(z3.Implies(selector, item) for item in lowered)
        support = sorted(bool_constants((assertion,)) & set(fix_values))
        groups.append({
            "name": selector_name, "source_tracker": group_name,
            "source_assertion_index": source_index, "support": support,
            "preprocessed_assertion_count": len(pre), **audit,
        })
        mappings.extend(group_maps)
    final_audit = v17.logic_audit(guarded)
    if final_audit["accepted"] is not True:
        raise RuntimeError(f"guarded formula failed zero-theory audit: {final_audit}")
    return guarded, groups, mappings, final_audit


def extract_source_core(constraints, groups, *, timeout_ms: int, seed: int):
    ctx = constraints[0].ctx
    solver = z3.SolverFor("QF_LRA", ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1, unsat_core=True)
    solver.add(*constraints)
    assumptions = [z3.Bool(str(group["name"]), ctx=ctx) for group in groups]
    started = time.monotonic(); outcome = solver.check(*assumptions); elapsed = time.monotonic() - started
    if outcome != z3.unsat:
        return {"status": str(outcome), "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
                "elapsed_seconds": elapsed, "core_names": []}
    names = [str(item) for item in solver.unsat_core()]
    allowed = {str(group["name"]) for group in groups}
    if len(names) != len(set(names)) or not set(names) <= allowed:
        raise RuntimeError("source core contains unknown/duplicate selectors")
    return {"status": "unsat", "reason_unknown": None, "elapsed_seconds": elapsed,
            "core_names": names, "core_sha256": canonical_sha256(names)}


def replay_raw(raw_path: Path, raw_hash: str, fixes, selected_trackers, *, timeout_ms: int, seed: int, label: str):
    started = time.monotonic()
    assertions = v23._parse_raw(raw_path, raw_hash)
    trackers = v17._tracker_refs(assertions); tracker_ids = {item.get_id() for item in trackers}
    ctx = assertions[0].ctx
    substitutions = tuple((z3.Bool(str(item["bool"]), ctx=ctx), z3.BoolVal(bool(item["value"]), ctx=ctx)) for item in fixes)
    substitutions += tuple((item, z3.BoolVal(str(item) in selected_trackers, ctx=ctx)) for item in trackers)
    derived = tuple(z3.simplify(z3.substitute(item, *substitutions)) for item in assertions if item.get_id() not in tracker_ids)
    solver = z3.Solver(ctx=ctx); solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1); solver.add(*derived)
    checked = time.monotonic(); outcome = solver.check()
    return {"label": label, "status": str(outcome),
            "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
            "fix_count": len(fixes), "fixes_sha256": canonical_sha256(list(fixes)),
            "selected_source_trackers": sorted(selected_trackers),
            "selected_source_sha256": canonical_sha256(sorted(selected_trackers)),
            "derived_formula_sha256": expression_sha256(derived), "raw_formula_sha256": raw_hash,
            "solve_seconds": time.monotonic() - checked, "elapsed_seconds": time.monotonic() - started}


def run_pilot(*, timeout_ms: int, replay_timeout_ms: int, seed: int) -> dict[str, object]:
    terminal, raw_path, raw_blob_sha256, _ = v23.authenticated_input(0)
    raw_hash = str(terminal["raw_full_formula_sha256"])
    fixes, fixes_hash = load_v22_candidate()
    assertions = v23._parse_raw(raw_path, raw_hash)
    constraints, groups, mappings, audit = build_lowered_groups(assertions, fixes)
    core = extract_source_core(constraints, groups, timeout_ms=timeout_ms, seed=seed)
    replay = None; projected: list[dict[str, object]] = []; selected_trackers: list[str] = []
    admitted = False
    if core["status"] == "unsat":
        by_name = {str(group["name"]): group for group in groups}
        selected = [by_name[name] for name in core["core_names"]]
        selected_trackers = sorted(str(group["source_tracker"]) for group in selected)
        support = {name for group in selected for name in group["support"]}
        projected = [item for item in fixes if str(item["bool"]) in support]
        first = replay_raw(raw_path, raw_hash, projected, selected_trackers,
                           timeout_ms=replay_timeout_ms, seed=seed, label="primary_fresh_raw_parse")
        second = replay_raw(raw_path, raw_hash, projected, selected_trackers,
                            timeout_ms=replay_timeout_ms, seed=seed, label="independent_fresh_context_raw_replay")
        replay = {"primary": first, "independent": second}
        admitted = (first["status"] == second["status"] == "unsat"
                    and first["fixes_sha256"] == second["fixes_sha256"] == canonical_sha256(projected)
                    and first["selected_source_sha256"] == second["selected_source_sha256"]
                    and first["derived_formula_sha256"] == second["derived_formula_sha256"])
    return {
        "schema_version": SCHEMA_VERSION, "kind": "v26-exact-pb-lowering-source-core-pilot",
        "input": {"raw_blob_path": str(raw_path), "raw_blob_sha256": raw_blob_sha256,
                  "raw_formula_sha256": raw_hash, "v22_fix_count": len(fixes), "v22_fixes_sha256": fixes_hash,
                  "z3_version": z3.get_version_string()},
        "lowering": {"pipeline": ["per-source substitute fixes and trackers=true", "simplify", "pb-preprocess",
                                    "card2bv", "PB proxy equivalence", "card2bv", "pb2bv", "bit-blast", "tseitin-cnf"],
                     "source_group_count": len(groups), "guarded_assertion_count": len(constraints),
                     "guarded_formula_sha256": expression_sha256(constraints), "logic_audit": audit,
                     "pb_definition_count": len(mappings), "auxiliary_count": sum(len(m["auxiliaries"]) for m in mappings)},
        "source_groups": groups, "auxiliary_provenance": mappings, "source_core": core,
        "projection": {"source_trackers": selected_trackers, "fixes": projected,
                       "fixes_sha256": canonical_sha256(projected), "replay": replay,
                       "admitted": admitted, "status": "authenticated_unsat" if admitted else "fail_closed"},
        "production_launched": False,
        "trust_boundary": "external Z3 exact-n15 discovery; authenticated fresh-raw replay; no proof certificate or Lean/kernel ingress",
    }


def main() -> int:
    parser = argparse.ArgumentParser(); parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--timeout-ms", type=int, default=180_000); parser.add_argument("--replay-timeout-ms", type=int, default=120_000)
    parser.add_argument("--seed", type=int, default=2601); args = parser.parse_args()
    result = run_pilot(timeout_ms=args.timeout_ms, replay_timeout_ms=args.replay_timeout_ms, seed=args.seed)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"output": str(args.output), "status": result["source_core"]["status"],
                      "core_size": len(result["source_core"]["core_names"]),
                      "projection_admitted": result["projection"]["admitted"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
