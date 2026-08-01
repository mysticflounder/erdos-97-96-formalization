#!/usr/bin/env python3
"""Self-test for the card-11 common-blocker projection."""

from __future__ import annotations

import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import probe


POSITIVE_CUBE = {
    0: frozenset({1, 2, 3, 4}),
    1: frozenset({0, 2, 6, 7}),
    2: frozenset({0, 1, 9, 10}),
    3: frozenset({1, 4, 6, 8}),
    4: frozenset({0, 3, 5, 8}),
    5: frozenset({2, 4, 8, 9}),
    6: frozenset({3, 5, 7, 9}),
    7: frozenset({2, 5, 8, 10}),
    8: frozenset({0, 4, 5, 7}),
    9: frozenset({3, 7, 8, 10}),
    10: frozenset({1, 5, 6, 9}),
}


def main() -> int:
    output_dir = HERE / "self-test-artifacts"
    output_dir.mkdir(parents=True, exist_ok=True)
    instance, separation, shell = probe.build_instance()
    assert shell is None
    assert separation.variable_count == 618
    assert separation.clause_count == 179_887
    assert separation.bad_types_per_order == 1_168
    assert len(probe.separation_encoding.all_orders()) == 144
    assert probe.profile.cube_ok(POSITIVE_CUBE)
    assert probe.separation_encoding.validate_cube_orders(POSITIVE_CUBE)

    for surplus_shell, other_shell in probe.SHELL_CASES:
        allowed_v = probe.allowed_center_v_rows(
            instance, surplus_shell, other_shell
        )
        allowed_b = probe.allowed_blocker_rows(instance)
        expected_v = {
            frozenset({probe.Q, probe.WITNESS, *other_two})
            for other_two in __import__("itertools").combinations(
                {probe.BLOCKER, surplus_shell, other_shell}, 2
            )
        }
        actual_v = {
            instance.cand[probe.profile.V][index] for index in allowed_v
        }
        assert actual_v == expected_v
        assert len(allowed_v) == 3
        assert len(allowed_b) == 28

    # Known positive domain gate: force the independently validated cube and
    # ask the complete wrapped C1/C2/C4/one-hit/separation CNF to accept it.
    for center, members in POSITIVE_CUBE.items():
        index = instance.cand[center].index(members)
        instance.cnf.add([instance.x[(center, index)]])
    cnf_path = output_dir / "known-positive.cnf"
    proof_path = output_dir / "known-positive.drat"
    probe.write_text(cnf_path, instance.dimacs())
    solver, command = probe.run_cadical(cnf_path, proof_path, 120)
    probe.write_text(output_dir / "cadical.stdout", solver.stdout)
    probe.write_text(output_dir / "cadical.stderr", solver.stderr)
    assert solver.verdict == "SAT", (solver.verdict, solver.returncode)
    assignment = probe.parse_assignment(solver.stdout)
    cnf_validation = probe.validate_cnf_model(instance, assignment)
    assert cnf_validation["cnf_satisfied"], cnf_validation
    _, structural = probe.decode_and_validate_model(
        instance, separation, assignment, None
    )
    assert all((
        structural["independent_cube_ok"],
        structural["independent_selected_orders_valid"],
    ))
    probe.write_json(output_dir / "result.json", {
        "gate": "known-positive-forced-cube",
        "verdict": solver.verdict,
        "command": command,
        "variables": instance.cnf.n,
        "clauses": len(instance.cnf.clauses),
        "cnf_validation": cnf_validation,
        "structural_validation": structural,
    })
    print(
        "SELF-TEST PASS: frozen counts, four shell row sets, and known "
        f"positive full-CNF model ({instance.cnf.n} vars, "
        f"{len(instance.cnf.clauses)} clauses) independently validated"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
