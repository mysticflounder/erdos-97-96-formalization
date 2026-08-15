#!/usr/bin/env python3
"""Check whether the v4 source predicates are new after the 10k row bank."""

from __future__ import annotations

import json
from pathlib import Path

import source_constraint_cegar_v4 as v4
import source_sensitive_cegar as source
import structural_cegar as structural
from probe import (
    CARDINALITY,
    C,
    PHYSICAL_APEX,
    THEOREM_OPP2_FROZEN_INDEX,
    U,
    XV,
    XU,
    build_case,
)


HERE = Path(__file__).resolve().parent
OUT = HERE / "source-constraints-v4-novelty"


def solve_case(name, add_violation):
    _model, instance, blocker_variables, _metadata = build_case(0, 2)
    v4.replay_inherited_journals(instance, 0, 2)
    violation_metadata = add_violation(instance, blocker_variables)
    cnf_path = OUT / f"{name}.cnf"
    v4.write_dimacs(instance, cnf_path)
    solved = structural.solve(cnf_path, 60)
    result = {
        "name": name,
        "variables": instance.cnf.n_variables,
        "clauses": len(instance.cnf.clauses),
        "violation": violation_metadata,
    }
    if solved.returncode == 10:
        _assignment, positive = v4.parse_assignment(
            solved.stdout + solved.stderr, instance.cnf.n_variables
        )
        cube = instance.decode_model(positive)
        blockers, fibers = source.decode_blockers(blocker_variables, positive)
        result.update(
            {
                "status": "SAT_VIOLATION_EXISTS",
                "meaning": "the v4 predicate is not implied by the inherited row bank",
                "cube": {str(k): list(v) for k, v in sorted(cube.items())},
                "blockers": {str(k): v for k, v in sorted(blockers.items())},
                "blocker_fibers": {
                    str(k): v for k, v in sorted(fibers.items())
                },
            }
        )
        return result
    if solved.returncode != 20:
        raise RuntimeError(f"unexpected CaDiCaL return code {solved.returncode}")
    proof_path = OUT / f"{name}.drat"
    proof_run = structural.solve(cnf_path, 60, proof_path)
    if proof_run.returncode != 20:
        raise RuntimeError("proof rerun did not reproduce UNSAT")
    v4.verify_drat(cnf_path, proof_path, OUT / f"{name}.drat-trim.log")
    result.update(
        {
            "status": "UNSAT_VIOLATION",
            "meaning": "the v4 predicate is implied by the inherited row bank",
            "drat_verified": True,
        }
    )
    return result


def violate_second_cap_pair(instance, _blocker_variables):
    second_cap = set(instance.model.caps[THEOREM_OPP2_FROZEN_INDEX])
    bad_choices = v4.choices(
        instance,
        C,
        lambda row: set(row) & second_cap != {U, XV},
    )
    instance.cnf.add_clause(bad_choices)
    return {
        "predicate_negated": "K_xv ∩ secondCap = {u,xv}",
        "bad_choice_count": len(bad_choices),
    }


def violate_next_row_triple(instance, blocker_variables):
    strict_triple = {U, XU, XV}
    witnesses = []
    conjunction_count = 0
    for center in range(CARDINALITY):
        blocker = blocker_variables.get((C, center))
        if blocker is None:
            continue
        for choice in v4.choices(
            instance,
            center,
            lambda row: len(set(row) & strict_triple) >= 2,
        ):
            witness = instance.cnf.new_variable()
            witnesses.append(witness)
            conjunction_count += 1
            # witness iff (b(c,center) and this row choice).
            instance.cnf.add_clause((-witness, blocker))
            instance.cnf.add_clause((-witness, choice))
            instance.cnf.add_clause((-blocker, -choice, witness))
    instance.cnf.add_clause(witnesses)
    return {
        "predicate_negated": "|K_centerAt(c) ∩ {u,xu,xv}| <= 1",
        "bad_conditional_choice_count": conjunction_count,
    }


def violate_two_offcenter_fan(instance, blocker_variables):
    """Forbid the checked two-source/distinct-off-center fan conclusion."""

    second_cap = sorted(instance.model.caps[THEOREM_OPP2_FROZEN_INDEX])
    forbidden_witnesses = 0
    for source_index, source_q in enumerate(second_cap):
        for source_r in second_cap[source_index + 1 :]:
            for row_choice in v4.choices(
                instance,
                C,
                lambda row, q=source_q, r=source_r: q not in row and r not in row,
            ):
                for blocker_q in range(CARDINALITY):
                    bq = blocker_variables.get((source_q, blocker_q))
                    if bq is None or blocker_q in (C, PHYSICAL_APEX):
                        continue
                    for blocker_r in range(CARDINALITY):
                        br = blocker_variables.get((source_r, blocker_r))
                        if (
                            br is None
                            or blocker_r in (C, PHYSICAL_APEX)
                            or blocker_r == blocker_q
                        ):
                            continue
                        instance.cnf.add_clause((-row_choice, -bq, -br))
                        forbidden_witnesses += 1
    return {
        "predicate_negated": (
            "two sources in secondCap \\ K_xv have distinct blockers avoiding c and O"
        ),
        "forbidden_witness_count": forbidden_witnesses,
    }


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)
    results = [
        solve_case("second-cap-pair-violation", violate_second_cap_pair),
        solve_case("next-row-triple-violation", violate_next_row_triple),
        solve_case("two-offcenter-fan-violation", violate_two_offcenter_fan),
    ]
    report = {
        "schema": "p97_pentagon_offclass_exact12_v4_constraint_novelty.v1",
        "scope": "finite implication against the inherited 10k certified row bank",
        "results": results,
    }
    (OUT / "report.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            {
                "report": str(OUT / "report.json"),
                "statuses": {item["name"]: item["status"] for item in results},
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
