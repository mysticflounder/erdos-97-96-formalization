#!/usr/bin/env python3
"""Exact-12 CEGAR with the checked next-row and deletion-fan constraints.

This is a fresh semantic namespace.  It replays the certified row nogoods from
the v2 and source-v3 diagnostics, adds two source-entitled constraint families,
and then continues the same independently replayed metric/order CEGAR loop.

Even a DRAT-verified terminal UNSAT result has only the scope of this encoded
exact-12 abstraction.  Promotion still requires a checked source-to-CNF and
certificate ingress adapter in Lean.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import source_sensitive_cegar as source
import structural_cegar as structural
from census.global_confinement import (  # noqa: E402
    cap_selected_nogood_certificate_probe as certificates,
)
from census.global_confinement import metric_realizability_probe as metric  # noqa: E402
from census.p97_search import phase3_incremental_cadical as incremental  # noqa: E402
from probe import (  # noqa: E402
    CARDINALITY,
    C,
    PHYSICAL_APEX,
    THEOREM_OPP2_FROZEN_INDEX,
    U,
    XV,
    XU,
    build_case,
    choices,
    parse_assignment,
    verify_drat,
    write_dimacs,
)


HERE = Path(__file__).resolve().parent
SCHEMA = "p97_pentagon_offclass_exact12_source_constraint_cegar.v4"
SCOPE = (
    "encoded exact-12 finite incidence and metric/order consequences only; "
    "not a kernel proof and not universal-cardinality closure"
)

EXACT_PROFILE_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_card_twelve_exact_cap_profile"
)
SECOND_CAP_FAN_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_secondCap_commonDeletionFan"
)
NEXT_ROW_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_nextRow_strictTriple_card_le_one"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def add_source_constraints(instance, blocker_variables):
    """Add only consequences of the named checked Lean producers."""

    before = len(instance.cnf.clauses)
    second_cap = set(instance.model.caps[THEOREM_OPP2_FROZEN_INDEX])
    required_pair = {U, XV}

    # At exact cardinality twelve the relevant cap has cardinality six.  The
    # fan theorem omits at least four cap points from K_xv, while the exact
    # physical trace puts u and xv in K_xv.  Hence K_xv meets the cap exactly
    # in {u,xv}.  The unit b(xv)=c identifies K_xv with the selected row at C.
    second_cap_pair_clauses = 0
    for index, candidate in enumerate(instance.candidates[C]):
        if set(candidate) & second_cap != required_pair:
            instance.cnf.add_clause((-instance.choice_variables[(C, index)],))
            second_cap_pair_clauses += 1

    # If a = centerAt(c), then the row selected at a is K_c.  The checked
    # next-row theorem gives |K_c ∩ {u,xu,xv}| <= 1.  Keep this conditional:
    # no anonymous center is identified with a before b(c,a) is selected.
    strict_triple = {U, XU, XV}
    next_row_clauses = 0
    for center in range(CARDINALITY):
        blocker = blocker_variables.get((C, center))
        if blocker is None:
            continue
        for index, candidate in enumerate(instance.candidates[center]):
            if len(set(candidate) & strict_triple) >= 2:
                instance.cnf.add_clause(
                    (-blocker, -instance.choice_variables[(center, index)])
                )
                next_row_clauses += 1

    return {
        "schema": f"{SCHEMA}.source_ingress.v1",
        "semantic_class": "Class C: source-proved clauses added",
        "added_clauses": len(instance.cnf.clauses) - before,
        "second_cap_pair_clauses": second_cap_pair_clauses,
        "next_row_strict_triple_clauses": next_row_clauses,
        "admissions": [
            {
                "predicate": "K_xv ∩ secondCap = {u,xv}",
                "lean_theorems": [
                    EXACT_PROFILE_THEOREM,
                    SECOND_CAP_FAN_THEOREM,
                    source.SOURCE_TRACE_THEOREM,
                ],
                "frozen_adapter": "b(xv)=C and theorem opp2 is frozen cap index 1",
            },
            {
                "predicate": "|K_centerAt(c) ∩ {u,xu,xv}| <= 1",
                "lean_theorems": [NEXT_ROW_THEOREM],
                "frozen_adapter": "conditional on each b(c,a); K_c is row a",
            },
        ],
        "kernel_status": (
            "Lean producers checked; Python source-to-CNF adapter not kernel checked"
        ),
    }


def validate_source_model(instance, blockers, cube):
    second_cap = set(instance.model.caps[THEOREM_OPP2_FROZEN_INDEX])
    if set(cube[C]) & second_cap != {U, XV}:
        raise RuntimeError("second-cap pair source constraint failed replay")
    next_center = blockers[C]
    triple_hits = sorted(set(cube[next_center]) & {U, XU, XV})
    if len(triple_hits) > 1:
        raise RuntimeError("next-row strict-triple source constraint failed replay")
    return {
        "xv_blocker_row_second_cap_intersection": sorted(
            set(cube[C]) & second_cap
        ),
        "c_actual_blocker": next_center,
        "next_row_strict_triple_hits": triple_hits,
        "next_row_strict_triple_hit_count": len(triple_hits),
    }


def replay_inherited_journals(instance, d: int, v: int):
    v2_path = HERE / f"cegar-d{d}-v{v}" / "journal.jsonl"
    v2_records, v2_keys = structural.replay_journal(instance, v2_path)
    v3_path = HERE / f"cegar-d{d}-v{v}-source-v3" / "journal.jsonl"
    v3_records, v3_keys = source.replay_new_journal(instance, v3_path, v2_keys)
    return (
        v2_records,
        v2_keys,
        v3_records,
        v3_keys,
        v2_path,
        v3_path,
    )


def write_manifest(out, args, instance, ingress, inherited_paths, status):
    manifest = {
        "schema": f"{SCHEMA}.manifest.v1",
        "status": status,
        "scope": SCOPE,
        "case": {"d": args.d, "v": args.v, "cardinality": CARDINALITY},
        "output_namespace": str(out),
        "budgets": {
            "max_new_iterations": args.max_new_iterations,
            "solver_timeout_seconds": args.timeout,
        },
        "variables": instance.cnf.n_variables,
        "clauses_at_manifest": len(instance.cnf.clauses),
        "source_ingress": ingress,
        "inherited_journals": [
            {"path": str(path), "sha256": sha256(path)} for path in inherited_paths
        ],
        "implementation": {
            "path": str(Path(__file__).resolve()),
            "sha256": sha256(Path(__file__).resolve()),
        },
        "publication": {
            "bankable": False,
            "reason": (
                "scratch theorem-mining run; Lean source-to-CNF ingress absent"
            ),
        },
    }
    (out / "manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )


def solve_once(instance, persistent_solver, timeout, cnf_path):
    if persistent_solver is None:
        write_dimacs(instance, cnf_path)
        solved = structural.solve(cnf_path, timeout)
        return solved.returncode, solved.stdout + solved.stderr, None
    solved = persistent_solver.solve(timeout)
    positive = [variable for variable, value in solved.assignment.items() if value]
    return solved.returncode, "", positive


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--d", type=int, default=0)
    parser.add_argument("--v", type=int, default=2)
    parser.add_argument("--max-new-iterations", type=int, default=100)
    parser.add_argument("--timeout", type=int, default=60)
    parser.add_argument("--progress-every", type=int, default=25)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--smoke-only", action="store_true")
    parser.add_argument(
        "--ipasir-library",
        type=Path,
        help="optional CaDiCaL IPASIR shared library for persistent discovery",
    )
    args = parser.parse_args()

    _model, instance, blocker_variables, _metadata = build_case(args.d, args.v)
    source.validate_source_order_contract()
    ingress = add_source_constraints(instance, blocker_variables)
    (
        v2_records,
        v2_keys,
        v3_records,
        v3_keys,
        v2_path,
        v3_path,
    ) = replay_inherited_journals(instance, args.d, args.v)

    default_name = f"cegar-d{args.d}-v{args.v}-source-constraints-v4"
    out = (args.out if args.out is not None else HERE / default_name).resolve()
    out.mkdir(parents=True, exist_ok=True)
    journal_path = out / "journal.jsonl"
    records, v4_keys = source.replay_new_journal(
        instance, journal_path, v2_keys | v3_keys
    )
    seen_nogoods = v2_keys | v3_keys | v4_keys
    write_manifest(
        out,
        args,
        instance,
        ingress,
        (v2_path, v3_path),
        "SMOKE_STARTING" if args.smoke_only else "RUNNING",
    )

    persistent_solver = None
    solver_backend = "fresh-cadical-subprocess"
    if args.ipasir_library is not None:
        factory = incremental.IpasirCadicalFactory(args.ipasir_library)
        persistent_solver = factory(instance.cnf.n_variables)
        for clause in instance.cnf.clauses:
            persistent_solver.add_clause(clause)
        solver_backend = "persistent-cadical-ipasir"

    starting_record_count = len(records)
    invocation_budget = 1 if args.smoke_only else args.max_new_iterations
    limit = starting_record_count + invocation_budget
    for new_iteration in range(starting_record_count, limit):
        iteration = len(v2_records) + len(v3_records) + new_iteration
        cnf_path = out / "current.cnf"
        verdict, output, positive = solve_once(
            instance, persistent_solver, args.timeout, cnf_path
        )
        if verdict == 20:
            write_dimacs(instance, cnf_path)
            proof_path = out / "terminal.drat"
            terminal = structural.solve(cnf_path, args.timeout, proof_path)
            if terminal.returncode != 20:
                raise RuntimeError("terminal proof rerun did not reproduce UNSAT")
            verify_drat(cnf_path, proof_path, out / "drat-trim.log")
            summary = {
                "schema": SCHEMA,
                "status": "UNSAT",
                "scope": SCOPE,
                "inherited_records": len(v2_records) + len(v3_records),
                "new_iterations_this_invocation": (
                    new_iteration - starting_record_count
                ),
                "v4_records_total": new_iteration,
                "learned_clauses": len(seen_nogoods),
                "variables": instance.cnf.n_variables,
                "clauses": len(instance.cnf.clauses),
                "solver_backend": solver_backend,
                "source_ingress": ingress,
                "drat_verified": True,
                "lean_promotion_status": "NOT_STARTED",
            }
            (out / "summary.json").write_text(
                json.dumps(summary, indent=2, sort_keys=True) + "\n"
            )
            write_manifest(out, args, instance, ingress, (v2_path, v3_path), "UNSAT")
            print(json.dumps(summary, sort_keys=True), flush=True)
            return 0
        if verdict != 10:
            raise RuntimeError(f"CaDiCaL returned {verdict} at iteration {iteration}")

        if positive is None:
            _assignment, positive = parse_assignment(output, instance.cnf.n_variables)
        cube = instance.decode_model(positive)
        blockers, fibers = source.decode_blockers(blocker_variables, positive)
        source_predicates = validate_source_model(instance, blockers, cube)
        source_model = {
            "iteration": iteration,
            "cube": {str(center): list(row) for center, row in sorted(cube.items())},
            "blockers": {
                str(q): blocker for q, blocker in sorted(blockers.items())
            },
            "blocker_fibers": {
                str(center): sources for center, sources in sorted(fibers.items())
            },
            "source_predicates": source_predicates,
        }
        (out / "latest-source-model.json").write_text(
            json.dumps(source_model, indent=2, sort_keys=True) + "\n"
        )

        rows = tuple(
            metric.MetricRow(center, tuple(sorted(cube[center])), False)
            for center in range(CARDINALITY)
        )
        detection = metric._formalized_metric_core(
            rows,
            CARDINALITY,
            (),
            include_extended=True,
            include_ordered=False,
        )
        if detection is None:
            ordered = structural.ordered_cover(rows)
            if ordered is None:
                survivor = {
                    "schema": SCHEMA,
                    "status": "STRUCTURALLY_UNRESOLVED",
                    "scope": SCOPE,
                    "iteration": iteration,
                    "source_model": source_model,
                    "source_ingress": ingress,
                }
                (out / "survivor.json").write_text(
                    json.dumps(survivor, indent=2, sort_keys=True) + "\n"
                )
                write_manifest(
                    out,
                    args,
                    instance,
                    ingress,
                    (v2_path, v3_path),
                    "STRUCTURALLY_UNRESOLVED",
                )
                print(json.dumps(survivor, sort_keys=True), flush=True)
                return 1
            key, record = ordered
            stage = "ordered-cap-cover"
            record.update(
                {
                    "iteration": iteration,
                    "stage": stage,
                    "learned_rows": [
                        {
                            "center": center,
                            "support": list(support),
                            "exact": exact,
                        }
                        for center, support, exact in key
                    ],
                }
            )
        else:
            certificate = certificates._certificate_for_detection(
                rows, CARDINALITY, detection
            )
            if certificates._validate_certificate(certificate, n=CARDINALITY) is not True:
                raise RuntimeError("metric certificate replay failed")
            key = structural.certificate_key(certificate)
            stage = detection["stage"]
            record = {
                "iteration": iteration,
                "stage": stage,
                "certificate": certificate,
            }

        if key in seen_nogoods:
            raise RuntimeError("detector repeated an already learned row nogood")
        seen_nogoods.add(key)
        learned = tuple(
            -structural.choice_literal(instance, center, support)
            for center, support, _exact in key
        )
        instance.cnf.add_clause(learned)
        if persistent_solver is not None:
            persistent_solver.add_clause(learned)
        record["learned_clause"] = list(learned)
        record["source_model"] = source_model
        with journal_path.open("a") as stream:
            stream.write(json.dumps(record, sort_keys=True) + "\n")
        if args.smoke_only or new_iteration == len(records) or (
            new_iteration + 1
        ) % args.progress_every == 0:
            print(
                f"iteration={iteration} stage={stage} rows={len(key)} "
                f"clauses={len(instance.cnf.clauses)}",
                flush=True,
            )

    summary = {
        "schema": SCHEMA,
        "status": "SMOKE_PASS" if args.smoke_only else "ITERATION_LIMIT",
        "scope": SCOPE,
        "inherited_records": len(v2_records) + len(v3_records),
        "new_iterations_this_invocation": invocation_budget,
        "v4_records_total": limit,
        "learned_clauses": len(seen_nogoods),
        "variables": instance.cnf.n_variables,
        "clauses": len(instance.cnf.clauses),
        "solver_backend": solver_backend,
        "source_ingress": ingress,
    }
    (out / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n"
    )
    write_manifest(
        out,
        args,
        instance,
        ingress,
        (v2_path, v3_path),
        summary["status"],
    )
    print(json.dumps(summary, sort_keys=True), flush=True)
    return 0 if args.smoke_only else 2


if __name__ == "__main__":
    raise SystemExit(main())
