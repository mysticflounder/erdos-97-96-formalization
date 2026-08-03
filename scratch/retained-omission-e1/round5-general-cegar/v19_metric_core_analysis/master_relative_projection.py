#!/usr/bin/env python3
"""Authenticate the 21-literal, master-relative projection of v19 blockers."""

from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path
from typing import Sequence

HERE = Path(__file__).resolve().parent
LANE = HERE.parent
sys.path.insert(0, str(LANE))

import z3  # noqa: E402
import round5_cegar_v12 as v12  # noqa: E402
import round5_cegar_v16 as v16  # noqa: E402
import round5_cegar_v17 as v17  # noqa: E402
import round5_cegar_v18 as v18  # noqa: E402
import round5_cegar_v19 as v19  # noqa: E402


def write_json(path: Path, value: object) -> None:
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def load_journal(journal: Path) -> tuple[list[dict[str, object]], dict[str, object]]:
    state = v19.AssignmentJournal(journal).recover()
    proposals: dict[str, dict[str, object]] = {}
    pairs: list[dict[str, object]] = []
    for record in state["records"]:
        payload = record["payload"]
        identity = payload["assignment_sha256"]
        if payload["phase"] == "proposed":
            proposals[identity] = payload
        else:
            pairs.append({"proposal": proposals[identity], "outcome": payload})
    return pairs, {
        "record_count_at_read": state["record_count"],
        "head_sha256_at_read": state["head_sha256"],
        "completed_count_at_read": len(state["completed"]),
        "pending_count_at_read": len(state["pending"]),
    }


def build_formulas(seed: int) -> tuple[
    tuple[z3.BoolRef, ...], tuple[z3.BoolRef, ...], z3.Solver, dict[str, object]
]:
    case = v19.Case("fresh", "DDD", 0, 2, 1)
    encoding = v16.Encoding(case, timeout_ms=3_600_000, seed=seed)
    tracked_full, _ = encoding.make_solver()
    for family in sorted(encoding.groups):
        tracked_full.add(z3.Bool(f"track_{family}"))
    gate = v12.FullSolverGate(tracked_full)
    prepass, learned, master = v12.run_boolean_prepass(
        encoding,
        gate,
        v12.PrepassConfig(30_000, 2_000_000, 256),
        seed,
        validated_miner_sha256=str(v19.provenance()["miner_v9_script_sha256"]),
    )
    if prepass.get("all_learned_cuts_theorem_sound_and_provenance_complete") is not True:
        raise RuntimeError("prepass cut-admission audit failed")
    _, bank = v18.add_static_triangle_bank(master, case.profiles)
    raw = tuple(tracked_full.assertions())
    grouped = tuple(
        constraint
        for family in sorted(encoding.groups)
        for constraint in encoding.groups[family]
    )
    semantic = v16.collect_semantic_bools((*grouped, *raw))
    return raw, semantic, master, {
        "raw_formula_sha256": v17.raw_formula_sha256(raw),
        "raw_assertion_count": len(raw),
        "semantic_bool_count": len(semantic),
        "learned_cut_count": len(learned),
        "prepass_status": prepass.get("status"),
        "prepass_admission_authenticated": True,
        "static_bank": bank,
        "master_assertion_count": len(master.assertions()),
        "master_formula_sha256": v16.formula_sha256(master),
    }


def assignment_values(pair: dict[str, object]) -> dict[str, bool]:
    return {
        item["bool"]: bool(item["value"])
        for item in pair["proposal"]["assignment"]
    }


def literals(
    names: Sequence[str], values: dict[str, bool], variables: dict[str, z3.BoolRef]
) -> tuple[z3.BoolRef, ...]:
    return tuple(variables[name] == z3.BoolVal(values[name]) for name in names)


def check_solver(solver: z3.Solver, assumptions: Sequence[z3.BoolRef]) -> dict[str, object]:
    started = time.monotonic()
    result = solver.check(*assumptions)
    return {
        "outcome": str(result),
        "elapsed_seconds": time.monotonic() - started,
        "reason_unknown": solver.reason_unknown() if result == z3.unknown else None,
    }


def entailment_replay(
    assertions: Sequence[z3.BoolRef], invariant_lits: Sequence[z3.BoolRef],
    timeout_ms: int, seed: int, fresh_context: bool,
) -> dict[str, object]:
    if fresh_context:
        ctx = z3.Context()
        assertions = tuple(item.translate(ctx) for item in assertions)
        invariant_lits = tuple(item.translate(ctx) for item in invariant_lits)
    else:
        ctx = assertions[0].ctx
    solver = z3.Solver(ctx=ctx)
    solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
    solver.add(*assertions)
    # One UNSAT check proves all invariant literals: M => conjunction(I).
    solver.add(z3.Not(z3.And(*invariant_lits)))
    result = check_solver(solver, ())
    result["fresh_context"] = fresh_context
    if result["outcome"] == "sat":
        model = solver.model()
        violated = [
            str(literal)
            for literal in invariant_lits
            if not z3.is_true(model.eval(literal, model_completion=True))
        ]
        result["countermodel_violated_invariant_count"] = len(violated)
        result["countermodel_violated_invariant_examples"] = violated[:20]
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("journal", type=Path)
    parser.add_argument("--limit", type=int, default=12)
    parser.add_argument("--process-limit", type=int)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--seed", type=int, default=97)
    args = parser.parse_args()

    census_pairs, journal_meta = load_journal(args.journal)
    if len(census_pairs) < args.limit:
        raise RuntimeError(f"wanted {args.limit} completed assignments, got {len(census_pairs)}")
    pairs = census_pairs[:args.limit]
    raw, semantic, master, formula_meta = build_formulas(args.seed)
    journal_raw_hashes = {
        pair["proposal"]["frozen_full_formula_sha256"] for pair in pairs
    }
    if journal_raw_hashes != {formula_meta["raw_formula_sha256"]}:
        raise RuntimeError("fresh raw formula does not authenticate journal formula identity")
    variables = {str(item): item for item in semantic}
    census_assignments = [assignment_values(pair) for pair in census_pairs]
    assignments = census_assignments[:args.limit]
    if any(set(item) != set(variables) for item in census_assignments):
        raise RuntimeError("journal assignment universe differs from fresh semantic universe")
    invariant_names = sorted(
        name for name in variables
        if len({values[name] for values in census_assignments}) == 1
    )
    varying_names = sorted(set(variables) - set(invariant_names))
    if (len(invariant_names), len(varying_names)) != (804, 21):
        raise RuntimeError(
            f"unexpected invariant/varying split: {len(invariant_names)}/{len(varying_names)}"
        )
    invariant_values = census_assignments[0]
    invariant_lits = literals(invariant_names, invariant_values, variables)
    base_entailment = [
        entailment_replay(master.assertions(), invariant_lits, args.timeout_ms,
                          args.seed, fresh_context=False),
        entailment_replay(master.assertions(), invariant_lits, args.timeout_ms,
                          args.seed, fresh_context=True),
    ]

    journal_state_assertions = list(master.assertions())
    for pair in census_pairs:
        values = assignment_values(pair)
        fixes = tuple(v19.Fix(variables[name], values[name]) for name in sorted(values))
        journal_state_assertions.append(v16.blocker_for_core(fixes))
    journal_state_entailment = [
        entailment_replay(journal_state_assertions, invariant_lits, args.timeout_ms,
                          args.seed, fresh_context=False),
        entailment_replay(journal_state_assertions, invariant_lits, args.timeout_ms,
                          args.seed, fresh_context=True),
    ]
    projection_justified = all(
        item["outcome"] == "unsat"
        for item in (*base_entailment, *journal_state_entailment)
    )

    stage = z3.Solver()
    stage.set(timeout=max(1, args.timeout_ms), random_seed=args.seed, threads=1)
    stage.add(*master.assertions())
    results: list[dict[str, object]] = []
    raw_hash = str(formula_meta["raw_formula_sha256"])
    processing = list(zip(pairs, assignments, strict=True))
    if args.process_limit is not None:
        processing = processing[:args.process_limit]
    for ordinal, (pair, values) in enumerate(processing):
        full_fixes = tuple(v19.Fix(variables[name], values[name]) for name in sorted(values))
        projected_fixes = tuple(
            v19.Fix(variables[name], values[name]) for name in varying_names
        )
        stage_exact = check_solver(stage, literals(sorted(values), values, variables))
        if stage_exact["outcome"] != "sat":
            raise RuntimeError(f"journal proposal {ordinal} is not a model of projected stage")
        full_status, _, full_core, full_record = v19.check_assignment(
            raw, full_fixes, args.timeout_ms, args.seed, ordinal
        )
        if full_status != "unsat" or len(full_core) != 825:
            raise RuntimeError(f"fresh full replay failed at {ordinal}: {full_status}")
        raw_projected = v16.replay_projected_core(
            raw, projected_fixes, args.timeout_ms, args.seed,
            nonce=f"master_relative_{ordinal}",
        )
        raw_projection_authenticated = raw_projected["status"] == "unsat"
        if raw_projection_authenticated:
            v16.authenticate_unsat_core(raw_projected)
        blocker = v16.blocker_for_core(projected_fixes)
        if projection_justified:
            stage.add(blocker)
            after_add = check_solver(stage, ())
        else:
            after_add = {
                "outcome": "not-run",
                "reason": "master does not entail the 804 observed invariant literals",
            }
        result = {
            "ordinal": ordinal,
            "iteration": pair["proposal"]["iteration"],
            "assignment_sha256": pair["proposal"]["assignment_sha256"],
            "stage_exact_assignment": stage_exact,
            "fresh_full_check_status": full_status,
            "fresh_full_core_count": len(full_core),
            "fresh_full_check": full_record,
            "projected_fix_count": len(projected_fixes),
            "projected_fix_sha256": v19.canonical_sha256(
                [fix.record() for fix in projected_fixes]
            ),
            "raw_projected_replay": raw_projected,
            "raw_projection_authenticated": raw_projection_authenticated,
            "master_after_projected_blocker": after_add,
        }
        write_json(HERE / f"master-entry-{ordinal:02d}.json", result)
        results.append(result)
        print(json.dumps({
            "ordinal": ordinal,
            "full": full_status,
            "raw_projected": raw_projected["status"],
            "master_after": after_add["outcome"],
        }, sort_keys=True), flush=True)

    summary = {
        "scheme": "v19-master-relative-21-projection/v1",
        "journal": str(args.journal),
        "journal_authentication": journal_meta,
        "formula_authentication": formula_meta,
        "invariant_count": len(invariant_names),
        "varying_count": len(varying_names),
        "invariant_names_sha256": v19.canonical_sha256(invariant_names),
        "invariant_literals_sha256": v19.canonical_sha256([
            {"bool": name, "value": invariant_values[name]} for name in invariant_names
        ]),
        "varying_names": varying_names,
        "varying_names_sha256": v19.canonical_sha256(varying_names),
        "base_master_invariant_entailment": base_entailment,
        "journal_state_master_invariant_entailment": journal_state_entailment,
        "master_relative_projection_justified": projection_justified,
        "logic": (
            "The 21-literal projection is admissible only if the authenticated "
            "master entails the other 804 literals. SAT for M and not-I is a "
            "counterexample to that premise, so observed enumeration invariance "
            "alone cannot justify a projected blocker."
        ),
        "entries": [{
            "ordinal": item["ordinal"],
            "assignment_sha256": item["assignment_sha256"],
            "projected_fix_sha256": item["projected_fix_sha256"],
            "fresh_full_check_status": item["fresh_full_check_status"],
            "raw_projected_outcome": item["raw_projected_replay"]["status"],
            "master_after_projected_blocker": item["master_after_projected_blocker"]["outcome"],
        } for item in results],
    }
    write_json(HERE / "master-relative-summary.json", summary)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
