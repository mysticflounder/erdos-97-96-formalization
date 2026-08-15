#!/usr/bin/env python3
"""Source-sensitive exact-12 CEGAR probe for the pentagon-off-class leaf.

This lane replays the old row-only metric journal, then adds only finite
consequences of source-level Lean producers.  It is a theorem-mining probe:
even a verified terminal DRAT proof establishes only the encoded exact-12
abstraction, not the universal Lean theorem.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import structural_cegar as structural
from census.global_confinement import (  # noqa: E402
    cap_selected_nogood_certificate_probe as certificates,
)
from census.global_confinement import metric_realizability_probe as metric  # noqa: E402
from census.p97_search import phase3_incremental_cadical as incremental  # noqa: E402
from metric_order_mine import boundary_orders  # noqa: E402
from probe import (  # noqa: E402
    CARDINALITY,
    C,
    THEOREM_OPP2_FROZEN_INDEX,
    U,
    XV,
    XU,
    build_case,
    parse_assignment,
    verify_drat,
    write_dimacs,
)


HERE = Path(__file__).resolve().parent

SOURCE_ORDER_CONTRACT_SCHEMA = (
    "p97_pentagon_offclass_exact12_v2.source_order_contract.v1"
)
SOURCE_ORDER_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_exists_forced_secondCap_order"
)
SOURCE_TRACE_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_exact_physical_cycle_traces"
)
SOURCE_BLOCKER_INJECTIVITY_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "pentagonOffClassBlocker_physical_cycle_actualBlockers_injective"
)
SOURCE_ORDER_ROLES = (U, C, XV, XU)
SOURCE_ORDER_ALLOWED_CHAINS = (
    SOURCE_ORDER_ROLES,
    tuple(reversed(SOURCE_ORDER_ROLES)),
)


def validate_source_order_contract(orders=None):
    """Fail closed unless frozen boundary orders match the proved Lean chain."""

    checked_orders = tuple(boundary_orders() if orders is None else orders)
    if len(checked_orders) != 24 or len(set(checked_orders)) != 24:
        raise RuntimeError("source order contract requires 24 distinct orders")
    role_set = set(SOURCE_ORDER_ROLES)
    projections = {
        tuple(point for point in order if point in role_set)
        for order in checked_orders
    }
    if projections != set(SOURCE_ORDER_ALLOWED_CHAINS):
        raise RuntimeError(
            "boundary orders do not match the source-proved second-cap chains"
        )
    return {
        "schema": SOURCE_ORDER_CONTRACT_SCHEMA,
        "lean_theorem": SOURCE_ORDER_THEOREM,
        "frozen_roles": {"u": U, "c": C, "xv": XV, "xu": XU},
        "allowed_chains": [list(chain) for chain in SOURCE_ORDER_ALLOWED_CHAINS],
        "boundary_order_count": len(checked_orders),
        "cnf_effect": "none: boundary_orders already enforced this restriction",
        "replay_status": (
            "Python fail-closed contract; source-to-CNF adapter is not kernel checked"
        ),
    }


def source_interface_metadata(instance, blocker_variables):
    """Describe the pre-existing source/blocker interface without changing CNF."""

    # The original encoder already has one b_(source,blocker) family.  The
    # source-sensitive lane preserves and decodes it; no obstruction theorem
    # currently entitles an additional learned clause from a saturated fiber.
    second_cap = set(instance.model.caps[THEOREM_OPP2_FROZEN_INDEX])
    required_pair = {U, XV}
    fan_sources = tuple(sorted(second_cap - required_pair))
    return {
        "variables": instance.cnf.n_variables,
        "clauses": len(instance.cnf.clauses),
        "blocker_variables": len(blocker_variables),
        "fan_sources": list(fan_sources),
        "added_variables": 0,
        "added_clauses": 0,
        "learned_clause_scope": "row literals only",
        "decoded_source_fields": ["blockers", "blocker_fibers"],
        "ordered_cap_contract": validate_source_order_contract(),
        "encoded_source_entitlements": {
            "five_cycle_exact_traces": {
                "lean_theorem": SOURCE_TRACE_THEOREM,
                "encoder_location": "probe.py::trace_edges",
                "cnf_effect": "none: the frozen encoder already imposed these traces",
            },
            "five_cycle_actual_blocker_injectivity": {
                "lean_theorem": SOURCE_BLOCKER_INJECTIVITY_THEOREM,
                "encoder_location": "probe.py::physical_sources at-most-one constraints",
                "cnf_effect": (
                    "none: the frozen encoder already imposed blocker injectivity"
                ),
            },
        },
        "saturated_fiber_obstruction": "PARKED-SPEC: no Lean contradiction producer",
    }


def decode_blockers(blocker_variables, positive):
    positive_set = set(positive)
    by_source = {}
    fibers = {center: [] for center in range(CARDINALITY)}
    for source in range(CARDINALITY):
        selected = [
            center
            for center in range(CARDINALITY)
            if blocker_variables.get((source, center)) in positive_set
        ]
        if len(selected) != 1:
            raise RuntimeError(
                f"SAT model selects {len(selected)} blockers for source {source}"
            )
        blocker = selected[0]
        by_source[source] = blocker
        fibers[blocker].append(source)
    return by_source, {center: sources for center, sources in fibers.items() if sources}


def replay_new_journal(instance, journal_path, bootstrap_keys):
    records, keys = structural.replay_journal(instance, journal_path)
    overlap = bootstrap_keys & keys
    if overlap:
        raise RuntimeError("source-sensitive journal duplicates a bootstrap nogood")
    return records, keys


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--d", type=int, default=0)
    parser.add_argument("--v", type=int, default=2)
    parser.add_argument("--max-new-iterations", type=int, default=100)
    parser.add_argument("--timeout", type=int, default=60)
    parser.add_argument("--progress-every", type=int, default=25)
    parser.add_argument(
        "--ipasir-library",
        type=Path,
        help="optional CaDiCaL IPASIR shared library for persistent discovery",
    )
    args = parser.parse_args()

    _model, instance, blocker_variables, _metadata = build_case(args.d, args.v)
    source_interface = source_interface_metadata(instance, blocker_variables)

    bootstrap_path = HERE / f"cegar-d{args.d}-v{args.v}" / "journal.jsonl"
    bootstrap_records, bootstrap_keys = structural.replay_journal(
        instance, bootstrap_path
    )

    out = HERE / f"cegar-d{args.d}-v{args.v}-source-v3"
    out.mkdir(parents=True, exist_ok=True)
    journal_path = out / "journal.jsonl"
    records, new_keys = replay_new_journal(instance, journal_path, bootstrap_keys)
    seen_nogoods = bootstrap_keys | new_keys

    persistent_solver = None
    solver_backend = "fresh-cadical-subprocess"
    if args.ipasir_library is not None:
        factory = incremental.IpasirCadicalFactory(args.ipasir_library)
        persistent_solver = factory(instance.cnf.n_variables)
        for clause in instance.cnf.clauses:
            persistent_solver.add_clause(clause)
        solver_backend = "persistent-cadical-ipasir"

    for new_iteration in range(len(records), args.max_new_iterations):
        iteration = len(bootstrap_records) + new_iteration
        cnf_path = out / "current.cnf"
        if persistent_solver is None:
            write_dimacs(instance, cnf_path)
            solved = structural.solve(cnf_path, args.timeout)
            verdict = solved.returncode
            output = solved.stdout + solved.stderr
            positive = None
        else:
            solved = persistent_solver.solve(args.timeout)
            verdict = solved.returncode
            output = ""
            positive = [
                variable
                for variable, value in solved.assignment.items()
                if value
            ]
        if verdict == 20:
            write_dimacs(instance, cnf_path)
            proof_path = out / "terminal.drat"
            terminal = structural.solve(cnf_path, args.timeout, proof_path)
            if terminal.returncode != 20:
                raise RuntimeError("terminal proof rerun did not reproduce UNSAT")
            verify_drat(cnf_path, proof_path, out / "drat-trim.log")
            summary = {
                "status": "UNSAT",
                "scope": "encoded exact-12 source-sensitive abstraction only",
                "bootstrap_records": len(bootstrap_records),
                "new_iterations": new_iteration,
                "learned_clauses": len(seen_nogoods),
                "variables": instance.cnf.n_variables,
                "clauses": len(instance.cnf.clauses),
                "solver_backend": solver_backend,
                "source_interface": source_interface,
                "drat_verified": True,
            }
            (out / "summary.json").write_text(
                json.dumps(summary, indent=2, sort_keys=True) + "\n"
            )
            print(json.dumps(summary, sort_keys=True), flush=True)
            return 0
        if verdict != 10:
            raise RuntimeError(
                f"CaDiCaL returned {verdict} at iteration {iteration}"
            )

        if positive is None:
            _assignment, positive = parse_assignment(
                output, instance.cnf.n_variables
            )
        cube = instance.decode_model(positive)
        blockers, fibers = decode_blockers(blocker_variables, positive)
        source_model = {
            "iteration": iteration,
            "cube": {str(center): list(row) for center, row in sorted(cube.items())},
            "blockers": {
                str(source): blocker
                for source, blocker in sorted(blockers.items())
            },
            "blocker_fibers": {
                str(center): sources
                for center, sources in sorted(fibers.items())
            },
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
                    "status": "STRUCTURALLY_UNRESOLVED",
                    "scope": "encoded exact-12 source-sensitive abstraction only",
                    "iteration": iteration,
                    "cube": {str(k): list(v) for k, v in sorted(cube.items())},
                    "blockers": {
                        str(source): blocker
                        for source, blocker in sorted(blockers.items())
                    },
                    "blocker_fibers": {
                        str(center): sources
                        for center, sources in sorted(fibers.items())
                    },
                    "source_interface": source_interface,
                }
                (out / "survivor.json").write_text(
                    json.dumps(survivor, indent=2, sort_keys=True) + "\n"
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
        if new_iteration == len(records) or (new_iteration + 1) % args.progress_every == 0:
            print(
                f"iteration={iteration} stage={stage} rows={len(key)} "
                f"clauses={len(instance.cnf.clauses)}",
                flush=True,
            )

    summary = {
        "status": "ITERATION_LIMIT",
        "scope": "encoded exact-12 source-sensitive abstraction only",
        "bootstrap_records": len(bootstrap_records),
        "new_iterations": args.max_new_iterations,
        "learned_clauses": len(seen_nogoods),
        "variables": instance.cnf.n_variables,
        "clauses": len(instance.cnf.clauses),
        "solver_backend": solver_backend,
        "source_interface": source_interface,
    }
    (out / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(summary, sort_keys=True), flush=True)
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
