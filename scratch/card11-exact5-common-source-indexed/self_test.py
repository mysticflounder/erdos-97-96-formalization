#!/usr/bin/env python3
"""Schema, positive-domain, and mutation-rejection tests for source indexing."""

from __future__ import annotations

import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import probe


def solve(instance, name: str):
    path = HERE / "self-test-artifacts" / f"{name}.cnf"
    proof = HERE / "self-test-artifacts" / f"{name}.drat"
    probe.write_text(path, instance.dimacs())
    result, command = probe.run_cadical(path, proof, 180)
    probe.write_text(path.with_suffix(".stdout"), result.stdout)
    return result, command


def main() -> int:
    out = HERE / "self-test-artifacts"
    out.mkdir(parents=True, exist_ok=True)
    # Schema audit: every admissible map triple is an exact row containing the
    # source; source and selected center differ because row candidates omit it.
    instance, separation, shell, indexed, schema = probe.build_instance()
    assert shell is None
    assert instance.cnf.n > probe.EXPECTED_BASE_VARIABLES
    assert len(instance.cnf.clauses) > probe.EXPECTED_BASE_CLAUSES
    assert separation.variable_count == 618
    for source, choices in indexed["choices_by_source"].items():
        assert choices
        for choice in choices:
            support = instance.cand[choice.center][choice.row_index]
            assert len(support) == 4 and source in support and choice.center not in support
            assert len(support - {source}) == 3
    result, command = solve(instance, "positive-domain")
    assert result.verdict == "SAT", (result.verdict, result.returncode)
    assignment = probe.parse_assignment(result.stdout)
    cnf = probe.validate_all_clauses(instance, assignment)
    model, structural = probe.independent_structural_validation(instance, separation, shell, indexed, assignment)
    assert cnf["cnf_satisfied"] and structural["source_map_total_functional_and_exact"]

    # Mutation rejection: force one source-index variable true while forcing a
    # different row at that same center.  This is contradictory only because
    # the new y[source,center,row] -> x[center,row] layer is present.
    bad_instance, _, _, bad_indexed, _ = probe.build_instance()
    forced_choice = bad_indexed["choices_by_source"][probe.base.Q][0]
    bad_row = next(i for i in range(len(bad_instance.cand[forced_choice.center]))
                   if i != forced_choice.row_index)
    bad_instance.cnf.add([forced_choice.variable])
    bad_instance.cnf.add([bad_instance.x[(forced_choice.center, bad_row)]])
    mutation_name = "mutation-source-row-disagreement"
    bad_result, bad_command = solve(bad_instance, mutation_name)
    assert bad_result.verdict == "UNSAT", (bad_result.verdict, bad_result.returncode)
    drat = probe.verify_drat(out / f"{mutation_name}.cnf", out / f"{mutation_name}.drat")
    assert drat["verified"], drat
    probe.write_json(out / "result.json", {
        "positive_command": command, "positive_verdict": result.verdict,
        "positive_variables": instance.cnf.n, "positive_clauses": len(instance.cnf.clauses),
        "positive_cnf_validation": cnf, "positive_structural_validation": structural,
        "mutation_command": bad_command, "mutation_verdict": bad_result.verdict,
        "mutation_drat": drat, "schema": schema,
    })
    print("SELF-TEST PASS: source-map schema, independently validated SAT domain, and source-row-disagreement mutation rejected with DRAT")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
